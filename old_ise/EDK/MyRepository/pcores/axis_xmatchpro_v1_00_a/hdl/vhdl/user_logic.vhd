-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
-- Author: 			Mohd Amiruddin Zainol (mohd.a.zainol@gmail.com)
-- Entity: 			user_logic.vhd
-- Version:			1.0
-- Description: This file is the user logic for axis_xmatchpro
--
-- Additional Comments:
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--USER libraries added here

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.all;

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_NUM_REG                    -- Number of software accessible registers
--   C_SLV_DWIDTH                 -- Slave interface data bus width
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Resetn                -- Bus to IP reset
--   Bus2IP_Data                  -- Bus to IP data bus
--   Bus2IP_BE                    -- Bus to IP byte enables
--   Bus2IP_RdCE                  -- Bus to IP read chip enable
--   Bus2IP_WrCE                  -- Bus to IP write chip enable
--   IP2Bus_Data                  -- IP to Bus data bus
--   IP2Bus_RdAck                 -- IP to Bus read transfer acknowledgement
--   IP2Bus_WrAck                 -- IP to Bus write transfer acknowledgement
--   IP2Bus_Error                 -- IP to Bus error response
------------------------------------------------------------------------------
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
entity user_logic is
  generic
  (
	C_NUM_REG                      : integer              := 32;
	C_SLV_DWIDTH                   : integer              := 32
  );
  port
  (

	PORT_S_AXIS_UC_IN_TREADY		: OUT	STD_LOGIC;
	PORT_S_AXIS_UC_IN_TDATA			: OUT  STD_LOGIC_VECTOR(31 downto 0);
	PORT_S_AXIS_UC_IN_TLAST			: OUT  STD_LOGIC;
	PORT_S_AXIS_UC_IN_TVALID		: OUT  STD_LOGIC;
	PORT_M_AXIS_UC_OUT_TVALID		: OUT	STD_LOGIC;
	PORT_M_AXIS_UC_OUT_TDATA		: OUT	STD_LOGIC_VECTOR(31 downto 0);
	PORT_M_AXIS_UC_OUT_TREADY		: OUT  STD_LOGIC;
	PORT_M_AXIS_UC_OUT_TLAST		: OUT	STD_LOGIC;
	PORT_S_AXIS_CD_IN_TREADY		: OUT	STD_LOGIC;
	PORT_S_AXIS_CD_IN_TDATA			: OUT  STD_LOGIC_VECTOR(31 downto 0);
	PORT_S_AXIS_CD_IN_TLAST			: OUT  STD_LOGIC;
	PORT_S_AXIS_CD_IN_TVALID		: OUT  STD_LOGIC;
	PORT_M_AXIS_CD_OUT_TVALID		: OUT	STD_LOGIC;
	PORT_M_AXIS_CD_OUT_TDATA		: OUT	STD_LOGIC_VECTOR(31 downto 0);
	PORT_M_AXIS_CD_OUT_TREADY		: OUT  STD_LOGIC;
	PORT_M_AXIS_CD_OUT_TLAST		: OUT	STD_LOGIC;
	PORT_XMATCH_C_SIZE				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PORT_XMATCH_C_STAT				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PORT_XMATCH_D_SIZE				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PORT_XMATCH_D_STAT				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

	rst_HOST								: IN  STD_LOGIC;
	clk_HOST 							: IN  STD_LOGIC;
	din_HOST 							: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	wr_en_HOST 							: IN  STD_LOGIC;
	rd_en_HOST 							: IN  STD_LOGIC;
	dout_HOST 							: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	full_HOST 							: OUT STD_LOGIC;
	empty_HOST 							: OUT STD_LOGIC;

	S_AXIS_UC_IN_TREADY				: OUT	STD_LOGIC;
	S_AXIS_UC_IN_TDATA				: IN  STD_LOGIC_VECTOR(31 downto 0);
	S_AXIS_UC_IN_TLAST				: IN  STD_LOGIC;
	S_AXIS_UC_IN_TVALID				: IN  STD_LOGIC;
	M_AXIS_UC_OUT_TVALID				: OUT	STD_LOGIC;
	M_AXIS_UC_OUT_TDATA				: OUT	STD_LOGIC_VECTOR(31 downto 0);
	M_AXIS_UC_OUT_TREADY				: IN  STD_LOGIC;
	M_AXIS_UC_OUT_TLAST				: OUT	STD_LOGIC;
	S_AXIS_CD_IN_TREADY				: OUT	STD_LOGIC;
	S_AXIS_CD_IN_TDATA				: IN  STD_LOGIC_VECTOR(31 downto 0);
	S_AXIS_CD_IN_TLAST				: IN  STD_LOGIC;
	S_AXIS_CD_IN_TVALID				: IN  STD_LOGIC;
	M_AXIS_CD_OUT_TVALID				: OUT	STD_LOGIC;
	M_AXIS_CD_OUT_TDATA				: OUT	STD_LOGIC_VECTOR(31 downto 0);
	M_AXIS_CD_OUT_TREADY				: IN  STD_LOGIC;
	M_AXIS_CD_OUT_TLAST				: OUT	STD_LOGIC;

	Bus2IP_Clk							: IN  STD_LOGIC;
	Bus2IP_Resetn						: IN  STD_LOGIC;
	Bus2IP_Data							: IN  STD_LOGIC_VECTOR(C_SLV_DWIDTH-1 DOWNTO 0);
	Bus2IP_BE							: IN  STD_LOGIC_VECTOR(C_SLV_DWIDTH/8-1 DOWNTO 0);
	Bus2IP_RdCE							: IN  STD_LOGIC_VECTOR(C_NUM_REG-1 DOWNTO 0);
	Bus2IP_WrCE							: IN  STD_LOGIC_VECTOR(C_NUM_REG-1 DOWNTO 0);
	IP2Bus_Data							: OUT STD_LOGIC_VECTOR(C_SLV_DWIDTH-1 DOWNTO 0);
	IP2Bus_RdAck						: OUT STD_LOGIC;
	IP2Bus_WrAck						: OUT STD_LOGIC;
	IP2Bus_Error						: OUT STD_LOGIC
  );

  attribute MAX_FANOUT : string;
  attribute SIGIS : string;

  attribute SIGIS of Bus2IP_Clk    : signal is "CLK";
  attribute SIGIS of Bus2IP_Resetn : signal is "RST";

end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- COMPONENTS: xmatch_controller
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

COMPONENT xmatch_controller
port
(
	S_AXIS_UC_IN_TREADY				: OUT	STD_LOGIC;
	S_AXIS_UC_IN_TDATA				: IN  STD_LOGIC_VECTOR(31 downto 0);
	S_AXIS_UC_IN_TLAST				: IN  STD_LOGIC;
	S_AXIS_UC_IN_TVALID				: IN  STD_LOGIC;
	M_AXIS_UC_OUT_TVALID				: OUT	STD_LOGIC;
	M_AXIS_UC_OUT_TDATA				: OUT	STD_LOGIC_VECTOR(31 downto 0);
	M_AXIS_UC_OUT_TREADY				: IN  STD_LOGIC;
	M_AXIS_UC_OUT_TLAST				: OUT	STD_LOGIC;
	S_AXIS_CD_IN_TREADY				: OUT	STD_LOGIC;
	S_AXIS_CD_IN_TDATA				: IN  STD_LOGIC_VECTOR(31 downto 0);
	S_AXIS_CD_IN_TLAST				: IN  STD_LOGIC;
	S_AXIS_CD_IN_TVALID				: IN  STD_LOGIC;
	M_AXIS_CD_OUT_TVALID				: OUT	STD_LOGIC;
	M_AXIS_CD_OUT_TDATA				: OUT	STD_LOGIC_VECTOR(31 downto 0);
	M_AXIS_CD_OUT_TREADY				: IN  STD_LOGIC;
	M_AXIS_CD_OUT_TLAST				: OUT	STD_LOGIC;
	XMATCH_RSTN							: IN  STD_LOGIC;
	XMATCH_CLK 							: IN  STD_LOGIC;
	HOST_RST								: IN  STD_LOGIC;
	HOST_CLK 							: IN  STD_LOGIC;
	HOST_DIN 							: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	HOST_WR_EN 							: IN  STD_LOGIC;
	HOST_RD_EN 							: IN  STD_LOGIC;
	HOST_DOUT 							: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	HOST_FULL 							: OUT STD_LOGIC;
	HOST_EMPTY 							: OUT STD_LOGIC;
	XMATCH_CMD_CD						: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_BS						: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_FS						: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_UC						: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_C_SIZE						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_C_STAT						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_D_SIZE						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_D_STAT						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end COMPONENT;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- DECLARATIONS:
-- PURPOSE:
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   signal s_tvalid_uc_in_xmatchpro  		: STD_LOGIC;
   signal s_tready_uc_in_xmatchpro  		: STD_LOGIC;
   signal s_tdata_uc_in_xmatchpro   		: STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal s_tlast_uc_in_xmatchpro   		: STD_LOGIC;
   signal m_tvalid_uc_out_xmatchpro  		: STD_LOGIC;
   signal m_tready_uc_out_xmatchpro  		: STD_LOGIC;
   signal m_tdata_uc_out_xmatchpro   		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal m_tlast_uc_out_xmatchpro			: STD_LOGIC;

   signal s_tvalid_cd_in_xmatchpro  		: STD_LOGIC;
   signal s_tready_cd_in_xmatchpro  		: STD_LOGIC;
   signal s_tdata_cd_in_xmatchpro   		: STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal s_tlast_cd_in_xmatchpro   		: STD_LOGIC;
   signal m_tvalid_cd_out_xmatchpro  		: STD_LOGIC;
   signal m_tready_cd_out_xmatchpro  		: STD_LOGIC;
   signal m_tdata_cd_out_xmatchpro   		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal m_tlast_cd_out_xmatchpro			: STD_LOGIC;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- DECLARATIONS:
-- PURPOSE: Signals for user logic slave model s/w accessible register
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	signal XMATCH_CMD_CD					: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal XMATCH_CMD_BS					: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal XMATCH_CMD_FS					: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal XMATCH_CMD_UC					: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal status_XMATCH_C_STAT		: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal status_XMATCH_D_SIZE		: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal status_XMATCH_D_STAT		: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal status_XMATCH_C_SIZE		: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal wr_sel							: std_logic_vector(3 downto 0);
	signal rd_sel							: std_logic_vector(3 downto 0);
	signal slv_ip2bus_data				: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal rd_ack							: std_logic;
	signal wr_ack							: std_logic;

begin

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PROCESS: Signals and Wires
-- PURPOSE: Wiring everything here
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		s_tvalid_uc_in_xmatchpro  <= S_AXIS_UC_IN_TVALID;
		s_tdata_uc_in_xmatchpro   <= S_AXIS_UC_IN_TDATA;
		s_tlast_uc_in_xmatchpro   <= S_AXIS_UC_IN_TLAST;
		S_AXIS_UC_IN_TREADY       <= s_tready_uc_in_xmatchpro;

		M_AXIS_UC_OUT_TVALID 		<= m_tvalid_uc_out_xmatchpro;
		m_tready_uc_out_xmatchpro 	<= M_AXIS_UC_OUT_TREADY;
		M_AXIS_UC_OUT_TDATA 			<= m_tdata_uc_out_xmatchpro;
		M_AXIS_UC_OUT_TLAST 			<= m_tlast_uc_out_xmatchpro;

		s_tvalid_cd_in_xmatchpro  <= S_AXIS_CD_IN_TVALID;
		s_tdata_cd_in_xmatchpro   <= S_AXIS_CD_IN_TDATA;
		s_tlast_cd_in_xmatchpro   <= S_AXIS_CD_IN_TLAST;
		S_AXIS_CD_IN_TREADY       <= s_tready_cd_in_xmatchpro;

		M_AXIS_CD_OUT_TVALID 		<= m_tvalid_cd_out_xmatchpro;
		m_tready_cd_out_xmatchpro 	<= M_AXIS_CD_OUT_TREADY;
		M_AXIS_CD_OUT_TDATA 			<= m_tdata_cd_out_xmatchpro;
		M_AXIS_CD_OUT_TLAST 			<= m_tlast_cd_out_xmatchpro;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PROCESS: Port Map of XMatch-PRO Controller
-- PURPOSE: Mapping to appropriate signals/registers
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

xmatch_definition: xmatch_controller
port map (
	S_AXIS_UC_IN_TREADY	=> s_tready_uc_in_xmatchpro,
	S_AXIS_UC_IN_TDATA	=> s_tdata_uc_in_xmatchpro,
	S_AXIS_UC_IN_TLAST	=> s_tlast_uc_in_xmatchpro,
	S_AXIS_UC_IN_TVALID	=> s_tvalid_uc_in_xmatchpro,
	M_AXIS_UC_OUT_TVALID	=> m_tvalid_uc_out_xmatchpro,
	M_AXIS_UC_OUT_TDATA	=> m_tdata_uc_out_xmatchpro,
	M_AXIS_UC_OUT_TREADY	=> m_tready_uc_out_xmatchpro,
	M_AXIS_UC_OUT_TLAST	=> m_tlast_uc_out_xmatchpro,
	S_AXIS_CD_IN_TREADY	=> s_tready_cd_in_xmatchpro,
	S_AXIS_CD_IN_TDATA	=> s_tdata_cd_in_xmatchpro,
	S_AXIS_CD_IN_TLAST	=> s_tlast_cd_in_xmatchpro,
	S_AXIS_CD_IN_TVALID	=> s_tvalid_cd_in_xmatchpro,
	M_AXIS_CD_OUT_TVALID	=> m_tvalid_cd_out_xmatchpro,
	M_AXIS_CD_OUT_TDATA	=> m_tdata_cd_out_xmatchpro,
	M_AXIS_CD_OUT_TREADY	=> m_tready_cd_out_xmatchpro,
	M_AXIS_CD_OUT_TLAST	=> m_tlast_cd_out_xmatchpro,
	XMATCH_RSTN				=> Bus2IP_Resetn,
	XMATCH_CLK 				=> Bus2IP_Clk,
	HOST_RST					=> rst_HOST,
	HOST_CLK 				=> clk_HOST,
	HOST_DIN 				=> din_HOST,
	HOST_WR_EN 				=> wr_en_HOST,
	HOST_RD_EN 				=> rd_en_HOST,
	HOST_DOUT 				=> dout_HOST,
	HOST_FULL 				=> full_HOST,
	HOST_EMPTY 				=> empty_HOST,
	XMATCH_CMD_CD			=> XMATCH_CMD_CD,
	XMATCH_CMD_BS			=> XMATCH_CMD_BS,
	XMATCH_CMD_FS			=> XMATCH_CMD_FS,
	XMATCH_CMD_UC			=> XMATCH_CMD_UC,
	XMATCH_C_SIZE			=> status_XMATCH_C_SIZE,
	XMATCH_C_STAT			=> status_XMATCH_C_STAT,
	XMATCH_D_SIZE			=> status_XMATCH_D_SIZE,
	XMATCH_D_STAT			=> status_XMATCH_D_STAT
);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PROCESS: Default Creation
-- PURPOSE: Implement slave model software accessible register(s)
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	wr_sel <= Bus2IP_WrCE(7 downto 4);
	rd_sel <= Bus2IP_RdCE(3 downto 0);

	wr_ack <= Bus2IP_WrCE(4) or Bus2IP_WrCE(5) or Bus2IP_WrCE(6) or Bus2IP_WrCE(7);
	rd_ack <= Bus2IP_RdCE(0) or Bus2IP_RdCE(1) or Bus2IP_RdCE(2) or Bus2IP_RdCE(3);

  SLAVE_REG_WRITE_PROC : process( Bus2IP_Clk ) is
  begin

    if Bus2IP_Clk'event and Bus2IP_Clk = '1' then
      if Bus2IP_Resetn = '0' then
        XMATCH_CMD_CD <= (others => '0');
        XMATCH_CMD_BS <= (others => '0');
        XMATCH_CMD_FS <= (others => '0');
        XMATCH_CMD_UC <= (others => '0');
      else
        case wr_sel is
          when "1000" => XMATCH_CMD_CD <= Bus2IP_Data;
          when "0100" => XMATCH_CMD_BS <= Bus2IP_Data;
          when "0010" => XMATCH_CMD_FS <= Bus2IP_Data;
          when "0001" => XMATCH_CMD_UC <= Bus2IP_Data;
          when others => null;
        end case;
      end if;
    end if;

  end process SLAVE_REG_WRITE_PROC;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PROCESS: Default
-- PURPOSE: Implement slave model software accessible register(s) read mux
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  SLAVE_REG_READ_PROC : process( rd_sel,
											status_XMATCH_C_STAT, status_XMATCH_C_SIZE,
											status_XMATCH_D_SIZE, status_XMATCH_D_STAT ) is
  begin

    case rd_sel is
      when "1000" => slv_ip2bus_data <= status_XMATCH_C_SIZE;
      when "0100" => slv_ip2bus_data <= status_XMATCH_C_STAT;
      when "0010" => slv_ip2bus_data <= status_XMATCH_D_SIZE;
      when "0001" => slv_ip2bus_data <= status_XMATCH_D_STAT;
      when others => slv_ip2bus_data <= (others => '0');
    end case;

  end process SLAVE_REG_READ_PROC;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PROCESS: Default
-- PURPOSE: To drive IP to Bus signals
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  IP2Bus_Data  <= slv_ip2bus_data when rd_ack = '1' else
                  (others => '0');

  IP2Bus_WrAck <= wr_ack;
  IP2Bus_RdAck <= rd_ack;
  IP2Bus_Error <= '0';

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PROCESS: Port Debug
-- PURPOSE: Debugging Purpose
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	PORT_S_AXIS_UC_IN_TREADY		<= s_tready_uc_in_xmatchpro;
	PORT_S_AXIS_UC_IN_TDATA			<= S_AXIS_UC_IN_TDATA;
	PORT_S_AXIS_UC_IN_TLAST			<= S_AXIS_UC_IN_TLAST;
	PORT_S_AXIS_UC_IN_TVALID		<= S_AXIS_UC_IN_TVALID;
	PORT_M_AXIS_UC_OUT_TVALID		<= m_tvalid_uc_out_xmatchpro;
	PORT_M_AXIS_UC_OUT_TDATA		<= m_tdata_uc_out_xmatchpro;
	PORT_M_AXIS_UC_OUT_TREADY		<= M_AXIS_UC_OUT_TREADY;
	PORT_M_AXIS_UC_OUT_TLAST		<= m_tlast_uc_out_xmatchpro;
	PORT_S_AXIS_CD_IN_TREADY		<= s_tready_cd_in_xmatchpro;
	PORT_S_AXIS_CD_IN_TDATA			<= S_AXIS_CD_IN_TDATA;
	PORT_S_AXIS_CD_IN_TLAST			<= S_AXIS_CD_IN_TLAST;
	PORT_S_AXIS_CD_IN_TVALID		<= S_AXIS_CD_IN_TVALID;
	PORT_M_AXIS_CD_OUT_TVALID		<= m_tvalid_cd_out_xmatchpro;
	PORT_M_AXIS_CD_OUT_TDATA		<= m_tdata_cd_out_xmatchpro;
	PORT_M_AXIS_CD_OUT_TREADY		<= M_AXIS_CD_OUT_TREADY;
	PORT_M_AXIS_CD_OUT_TLAST		<= m_tlast_cd_out_xmatchpro;
	PORT_XMATCH_C_SIZE				<= status_XMATCH_C_SIZE;
	PORT_XMATCH_C_STAT				<= status_XMATCH_C_STAT;
	PORT_XMATCH_D_SIZE				<= status_XMATCH_D_SIZE;
	PORT_XMATCH_D_STAT				<= status_XMATCH_D_STAT;

end IMP;
