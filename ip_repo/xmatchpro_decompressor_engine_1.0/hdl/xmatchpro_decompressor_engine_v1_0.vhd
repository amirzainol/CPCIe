--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.

--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--Lesser General Public License for more details.

--You should have received a copy of the GNU Lesser General Public
--License along with this library; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

-- e_mail : mohd.a.zainol@gmail.com

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
--  ENTITY          : xmatchpro_decompressor_engine_v1_0 
--      version     : 1.0            
--      last update : 20/10/2017     
--      author      : Mohd A. Zainol
-- 
--  FUNCTION                       
--      Decompressor engine.
-- 
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xmatchpro_decompressor_engine_v1_0 is
	generic(
		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH : integer := 32;
		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH : integer := 32;
		C_M00_AXIS_START_COUNT : integer := 32
	);
	port(
		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk    : in  std_logic;
		s00_axis_aresetn : in  std_logic;
		s00_axis_tready  : out std_logic;
		s00_axis_tdata   : in  std_logic_vector(C_S00_AXIS_TDATA_WIDTH - 1 downto 0);
		s00_axis_tvalid  : in  std_logic;
		s00_axis_tuser   : in  std_logic_vector(20 downto 0);
		s00_axis_tlast   : in  std_logic;
		s00_axis_tdest   : in  std_logic_vector(3 downto 0);
		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk    : in  std_logic;
		m00_axis_aresetn : in  std_logic;
		m00_axis_tvalid  : out std_logic;
		m00_axis_tdata   : out std_logic_vector(C_M00_AXIS_TDATA_WIDTH - 1 downto 0);
		m00_axis_tready  : in  std_logic;
		m00_axis_tlast   : out std_logic;
		command          : in  std_logic_vector(31 downto 0);
		crc_32_d         : out std_logic_vector(31 downto 0);
		status           : out std_logic_vector(31 downto 0);
		engine_ready     : out std_logic;
		xpro_aclk        : in  std_logic;
		xpro_aresetn     : in  std_logic
	);
end xmatchpro_decompressor_engine_v1_0;

architecture arch_imp of xmatchpro_decompressor_engine_v1_0 is

	component decompressor_engine is
		port(
			CS                 : in  std_logic;
			RW                 : in  std_logic;
			ADDRESSD           : in  std_logic_vector(3 downto 0);
			CONTROL_IND        : in  std_logic_vector(31 downto 0);
			CONTROL_OUT_D      : out std_logic_vector(31 downto 0);
			CLK                : in  std_logic;
			CLEAR              : in  std_logic;
			BUS_ACKNOWLEDGE_DC : in  std_logic;
			BUS_ACKNOWLEDGE_DU : in  std_logic;
			WAIT_DC            : in  std_logic;
			WAIT_DU            : in  std_logic;
			C_DATAIN           : in  std_logic_vector(31 downto 0);
			U_DATAOUT          : out std_logic_vector(31 downto 0);
			FINISHED_D         : out std_logic;
			FLUSHING_D         : out std_logic;
			DECOMPRESSING      : out std_logic;
			U_DATA_VALID       : out std_logic;
			DECODING_OVERFLOW  : out std_logic;
			CRC_ERROR          : out std_logic; -- error condition in the compression or decompression channels
			INTERRUPT_REQ_D    : out std_logic;
			INTERRUPT_ACK_D    : in  std_logic;
			BUS_REQUEST_DC     : out std_logic;
			BUS_REQUEST_DU     : out std_logic;
			CRC_OUT_D_32       : out std_logic_vector(31 downto 0)
		);
	end component decompressor_engine;

	component xpro_d_controller is
		Port(
			CLK             : in  STD_LOGIC;
			CLEAR           : in  STD_LOGIC;
			COMMAND         : in  STD_LOGIC_VECTOR(31 downto 0);
			COMPRESSED_SIZE : in  STD_LOGIC_VECTOR(15 downto 0);
			RESTART         : in  STD_LOGIC;
			BUS_REQ_DC      : in  STD_LOGIC;
			BUS_REQ_DU      : in  STD_LOGIC;
			BUS_ACK_DC      : out STD_LOGIC;
			BUS_ACK_DU      : out STD_LOGIC;
			INTR_ACK_D      : out STD_LOGIC;
			INTR_REQ_D      : in  STD_LOGIC;
			CS_RW           : out STD_LOGIC;
			ADDR            : out STD_LOGIC_VECTOR(3 downto 0);
			CTRL_IN         : out STD_LOGIC_VECTOR(31 downto 0);
			RST_FIFO_DU     : out STD_LOGIC;
			RST_FIFO_DC     : out STD_LOGIC;
			RST_ENGINE      : out STD_LOGIC;
			FIFO_DC_EMPTY   : in  STD_LOGIC;
			ENGINE_C_DATAIN : out STD_LOGIC_VECTOR(31 downto 0);
			ENGINE_C_TVALID : in STD_LOGIC;
			ENGINE_C_TREADY : out STD_LOGIC;
			ENGINE_U_TDATA  : in  STD_LOGIC_VECTOR(31 downto 0);
			ENGINE_U_TVALID : in  STD_LOGIC;
			ENGINE_U_TREADY : out STD_LOGIC;
			FIFO_DC_TDATA   : in  STD_LOGIC_VECTOR(31 downto 0);
			FIFO_DC_TREADY  : out STD_LOGIC;
			FIFO_DC_TVALID  : in  STD_LOGIC;
			FIFO_DU_TDATA   : out STD_LOGIC_VECTOR(31 downto 0);
			FIFO_DU_TREADY  : in  STD_LOGIC;
			FIFO_DU_TVALID  : out STD_LOGIC
		);
	end component xpro_d_controller;

	component xc7z020_fifo_d_axis_data_fifo_0_0 is
		port(
			S_AXIS_tvalid  : in  STD_LOGIC;
			S_AXIS_tready  : out STD_LOGIC;
			S_AXIS_tdata   : in  STD_LOGIC_VECTOR(31 downto 0);
			s_axis_aresetn : in  STD_LOGIC;
			m_axis_aresetn : in  STD_LOGIC;
			s_axis_aclk    : in  STD_LOGIC;
			m_axis_aclk    : in  STD_LOGIC;
			M_AXIS_tvalid  : out STD_LOGIC;
			M_AXIS_tready  : in  STD_LOGIC;
			M_AXIS_tdata   : out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component xc7z020_fifo_d_axis_data_fifo_0_0;

	signal ENGINE_CONTROL_OUT_D_aux      : std_logic_vector(31 downto 0);
	signal ENGINE_FINISHED_D_aux         : std_logic;
	signal ENGINE_FLUSHING_D_aux         : std_logic;
	signal ENGINE_DECOMPRESSING_aux      : std_logic;
	signal ENGINE_DECODING_OVERFLOW_aux  : std_logic;
	signal ENGINE_CRC_ERROR_aux          : std_logic;
	signal ENGINE_BUS_ACKNOWLEDGE_DU_aux : std_logic;
	signal ENGINE_INTERRUPT_ACK_D_aux    : std_logic;
	signal ENGINE_CS_RW_aux              : std_logic;
	signal ENGINE_ADDRESSD_aux           : std_logic_vector(3 downto 0);
	signal ENGINE_CONTROL_IND_aux        : std_logic_vector(31 downto 0);
	signal RST_ENGINE_aux                : std_logic;

	signal RST_FIFO_DU_aux            : std_logic;
	signal RST_FIFO_DU_N_aux          : std_logic;
	signal RST_FIFO_DC_aux            : std_logic;
	signal RST_FIFO_DC_N_aux          : std_logic;
	signal ENGINE_BUS_REQUEST_DC_aux  : std_logic;
	signal ENGINE_BUS_REQUEST_DU_aux  : std_logic;
	signal ENGINE_INTERRUPT_REQ_D_aux : std_logic;
	signal FIFO_DC_EMPTY_aux          : std_logic;

	signal BUS_ACKNOWLEDGE_DC_aux : std_logic;

	-- registers
	signal ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux : std_logic;

	signal compressed_size_reg   : std_logic_vector(15 downto 0);
	signal tuser_compressed_size : std_logic_vector(15 downto 0);

	signal m00_axis_tready_aux : std_logic;
	signal m00_axis_tvalid_aux : std_logic;
	signal m00_axis_tvalid_ff  : std_logic; -- no need
	signal m00_axis_tdata_aux  : std_logic_vector(31 downto 0);
	signal m00_axis_tlast_aux  : std_logic;
	signal m00_axis_tlast_ff1  : std_logic; -- no need
	signal m00_axis_tlast_ff2  : std_logic; -- no need
	signal m00_axis_tlast_i    : std_logic;
	signal totalwords_reg      : std_logic_vector(15 downto 0);

	type state_type1 is (st1_idle, st_wait_s_tlast, st_wait_m_tlast, st_wait_delay);
	signal state1, next_state1 : state_type1;
	signal engine_ready_i      : std_logic;

	signal s00_axis_tlast_i  : std_logic_vector(3 downto 0);
	signal s00_axis_tvalid_i : std_logic;

	signal assigned_tdest      : std_logic_vector(3 downto 0);
	signal next_assigned_tdest : std_logic_vector(3 downto 0);

	signal s00_axis_tlast_bit4 : std_logic;

	signal self_reset_ff1 : std_logic;
	signal self_reset_ff2 : std_logic;
	signal self_reset_ff3 : std_logic;
	signal self_reset_ff4 : std_logic;
	signal self_reset_ff5 : std_logic;
	signal self_reset_ff6 : std_logic;
	signal self_resetn    : std_logic;

	signal xpro_clear : std_logic;

	signal restart_engine   : std_logic;
	signal restart_engine_n : std_logic;

	signal ENGINE_RST_ENGINE_i : std_logic;

	signal FIFO_DC_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0);
	signal FIFO_DC_TVALID_aux : STD_LOGIC;
	signal FIFO_DC_TREADY_aux : STD_LOGIC;

	signal FIFO_DU_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0);
	signal FIFO_DU_TVALID_aux : STD_LOGIC;
	signal FIFO_DU_TREADY_aux : STD_LOGIC;

	signal ENGINE_CRC_32_D : std_logic_vector(31 downto 0);

	-- unknown
	signal TDATA_CONTROLLER_aux           : std_logic_vector(31 downto 0);
	signal M_AXIS_tdata_dly_aux           : std_logic_vector(31 downto 0);
	signal M_AXIS_tdata_dly_X             : std_logic_vector(31 downto 0);
	signal ENGINE_M_AXIS_tdata_dly_CE_aux : std_logic_vector(31 downto 0);
	signal WAIT_DC_TREADY_aux             : std_logic;

	-- new
	signal ENGINE_C_DATAIN_aux : std_logic_vector(31 downto 0);
	signal ENGINE_C_TVALID_aux : std_logic;
	signal ENGINE_C_TREADY_aux : std_logic;
	signal ENGINE_U_TDATA_aux  : std_logic_vector(31 downto 0);
	signal ENGINE_U_TVALID_aux : std_logic;
	signal ENGINE_U_TREADY_aux : std_logic;
	signal s00_axis_tready_aux : std_logic;
	signal s00_axis_tvalid_aux : std_logic;
	
begin

	inst_DECOMPRESSOR_ENGINE : decompressor_engine
		port map(
			CS                 => ENGINE_CS_RW_aux,
			RW                 => ENGINE_CS_RW_aux,
			ADDRESSD           => ENGINE_ADDRESSD_aux,
			CONTROL_IND        => ENGINE_CONTROL_IND_aux,
			CONTROL_OUT_D      => ENGINE_CONTROL_OUT_D_aux,
			CLK                => xpro_aclk,
			CLEAR              => ENGINE_RST_ENGINE_i,
			BUS_ACKNOWLEDGE_DC => ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux,
			BUS_ACKNOWLEDGE_DU => ENGINE_BUS_ACKNOWLEDGE_DU_aux,
			WAIT_DC            => ENGINE_C_TREADY_aux,
			WAIT_DU            => ENGINE_U_TREADY_aux,
			C_DATAIN           => ENGINE_C_DATAIN_aux,
			U_DATAOUT          => ENGINE_U_TDATA_aux,
			FINISHED_D         => ENGINE_FINISHED_D_aux,
			FLUSHING_D         => ENGINE_FLUSHING_D_aux,
			DECOMPRESSING      => ENGINE_DECOMPRESSING_aux,
			U_DATA_VALID       => ENGINE_U_TVALID_aux,
			DECODING_OVERFLOW  => ENGINE_DECODING_OVERFLOW_aux,
			CRC_ERROR          => ENGINE_CRC_ERROR_aux,
			INTERRUPT_REQ_D    => ENGINE_INTERRUPT_REQ_D_aux,
			INTERRUPT_ACK_D    => ENGINE_INTERRUPT_ACK_D_aux,
			BUS_REQUEST_DC     => ENGINE_BUS_REQUEST_DC_aux,
			BUS_REQUEST_DU     => ENGINE_BUS_REQUEST_DU_aux,
			CRC_OUT_D_32       => ENGINE_CRC_32_D
		);

	inst_DECOMPRESSOR_CONTROLLER : xpro_d_controller
		port map(
			CLK             => xpro_aclk,
			CLEAR           => xpro_clear,
			COMMAND         => command,
			COMPRESSED_SIZE => compressed_size_reg,
			RESTART         => restart_engine,
			BUS_REQ_DC      => ENGINE_BUS_REQUEST_DC_aux,
			BUS_REQ_DU      => ENGINE_BUS_REQUEST_DU_aux,
			BUS_ACK_DC      => BUS_ACKNOWLEDGE_DC_aux,
			BUS_ACK_DU      => ENGINE_BUS_ACKNOWLEDGE_DU_aux,
			INTR_ACK_D      => ENGINE_INTERRUPT_ACK_D_aux,
			INTR_REQ_D      => ENGINE_INTERRUPT_REQ_D_aux,
			CS_RW           => ENGINE_CS_RW_aux,
			ADDR            => ENGINE_ADDRESSD_aux,
			CTRL_IN         => ENGINE_CONTROL_IND_aux,
			RST_FIFO_DU     => RST_FIFO_DU_aux,
			RST_FIFO_DC     => RST_FIFO_DC_aux,
			RST_ENGINE      => RST_ENGINE_aux,
			FIFO_DC_EMPTY   => FIFO_DC_EMPTY_aux,
			ENGINE_C_DATAIN => ENGINE_C_DATAIN_aux,
			ENGINE_C_TVALID => ENGINE_C_TVALID_aux,
			ENGINE_C_TREADY => ENGINE_C_TREADY_aux,
			ENGINE_U_TDATA  => ENGINE_U_TDATA_aux,
			ENGINE_U_TVALID => ENGINE_U_TVALID_aux,
			ENGINE_U_TREADY => ENGINE_U_TREADY_aux,
			FIFO_DC_TDATA   => FIFO_DC_TDATA_aux,
			FIFO_DC_TREADY  => FIFO_DC_TREADY_aux,
			FIFO_DC_TVALID  => FIFO_DC_TVALID_aux,
			FIFO_DU_TDATA   => FIFO_DU_TDATA_aux,
			FIFO_DU_TREADY  => FIFO_DU_TREADY_aux,
			FIFO_DU_TVALID  => FIFO_DU_TVALID_aux
		);

	inst_FIFO_DC : component xc7z020_fifo_d_axis_data_fifo_0_0
		port map(
			M_AXIS_tdata   => FIFO_DC_TDATA_aux,
			M_AXIS_tready  => FIFO_DC_TREADY_aux,
			M_AXIS_tvalid  => FIFO_DC_TVALID_aux,
			S_AXIS_tdata   => s00_axis_tdata,
			S_AXIS_tready  => s00_axis_tready_aux,
			S_AXIS_tvalid  => s00_axis_tvalid_aux,
			m_axis_aclk    => xpro_aclk,
			m_axis_aresetn => RST_FIFO_DC_N_aux,
			s_axis_aclk    => s00_axis_aclk,
			s_axis_aresetn => RST_FIFO_DC_N_aux
		);

	inst_FIFO_DU : component xc7z020_fifo_d_axis_data_fifo_0_0
		port map(
			M_AXIS_tdata   => m00_axis_tdata_aux,
			M_AXIS_tready  => m00_axis_tready_aux,
			M_AXIS_tvalid  => m00_axis_tvalid_aux,
			S_AXIS_tdata   => FIFO_DU_TDATA_aux,
			S_AXIS_tready  => FIFO_DU_TREADY_aux,
			S_AXIS_tvalid  => FIFO_DU_TVALID_aux,
			m_axis_aclk    => m00_axis_aclk,
			m_axis_aresetn => RST_FIFO_DU_N_aux,
			s_axis_aclk    => xpro_aclk,
			s_axis_aresetn => RST_FIFO_DU_N_aux
		);

    s00_axis_tvalid_aux <= (s00_axis_tready_aux and ENGINE_INTERRUPT_REQ_D_aux) and s00_axis_tvalid; 
    s00_axis_tready     <= (s00_axis_tready_aux and ENGINE_INTERRUPT_REQ_D_aux); 
    ENGINE_C_TVALID_aux <= s00_axis_tvalid_i;

	xpro_clear          <= xpro_aresetn and self_resetn;
	ENGINE_RST_ENGINE_i <= RST_ENGINE_aux and restart_engine_n;
	RST_FIFO_DU_N_aux   <= not RST_FIFO_DU_aux;
	RST_FIFO_DC_N_aux   <= not RST_FIFO_DC_aux;
	FIFO_DC_EMPTY_aux   <= not FIFO_DC_TVALID_aux;

	status                <= x"00000000";
	m00_axis_tlast        <= m00_axis_tlast_aux;
	m00_axis_tlast_aux    <= '1' when totalwords_reg = x"0001" else '0';
	m00_axis_tlast_i      <= m00_axis_tlast_ff1 and (not m00_axis_tlast_ff2); -- no need
	self_resetn           <= not self_reset_ff1;
	restart_engine        <= self_reset_ff1;
	restart_engine_n      <= not self_reset_ff1;
	tuser_compressed_size <= s00_axis_tuser(20 downto 5);
	s00_axis_tlast_bit4   <= s00_axis_tuser(4); -- tlast
	s00_axis_tlast_i      <= s00_axis_tuser(3 downto 0); -- tdest of tlast
	s00_axis_tvalid_i     <= s00_axis_tvalid;
	m00_axis_tready_aux   <= m00_axis_tready;

	crc_32_d <= ENGINE_CRC_32_D;

	FLIP_FLOP_REGISTERS : process(xpro_aclk)
	begin
		if (xpro_aclk'event and xpro_aclk = '1') then
			if xpro_aresetn = '0' then
				ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux <= '0';
			else
				ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux <= BUS_ACKNOWLEDGE_DC_aux;
			end if;
		end if;
	end process FLIP_FLOP_REGISTERS;

	process(m00_axis_aclk)
	begin
		if m00_axis_aclk'event and m00_axis_aclk = '1' then
			if m00_axis_aresetn = '0' then
				m00_axis_tvalid_ff <= '0'; -- no need
				--				m00_axis_tvalid    <= '0';
				--				m00_axis_tdata     <= (others => '0');
				m00_axis_tlast_ff1 <= '0'; -- no need
				m00_axis_tlast_ff2 <= '0'; -- no need
			else
				m00_axis_tvalid_ff <= m00_axis_tvalid_aux; -- no need
				--				m00_axis_tvalid    <= m00_axis_tvalid_aux;
				--				m00_axis_tdata     <= m00_axis_tdata_aux;
				m00_axis_tlast_ff1 <= m00_axis_tlast_aux; -- no need
				m00_axis_tlast_ff2 <= m00_axis_tlast_ff1; -- no need
			end if;
		end if;
	end process;

	m00_axis_tvalid <= m00_axis_tvalid_aux;
	m00_axis_tdata  <= m00_axis_tdata_aux;

	process(m00_axis_aclk)
	begin
		if m00_axis_aclk'event and m00_axis_aclk = '1' then
			if m00_axis_aresetn = '0' then
				self_reset_ff1 <= '0';
				self_reset_ff2 <= '0';
				self_reset_ff3 <= '0';
				self_reset_ff4 <= '0';
				self_reset_ff5 <= '0';
				self_reset_ff6 <= '0';
			else
				self_reset_ff1 <= m00_axis_tlast_aux;
				self_reset_ff2 <= self_reset_ff1;
				self_reset_ff3 <= self_reset_ff2;
				self_reset_ff4 <= self_reset_ff3;
				self_reset_ff5 <= self_reset_ff4;
				self_reset_ff6 <= self_reset_ff5;
			end if;
		end if;
	end process;

	process(m00_axis_aclk)
	begin
		if m00_axis_aclk'event and m00_axis_aclk = '1' then
			if ENGINE_CS_RW_aux = '0' and ENGINE_ADDRESSD_aux = "1001" then
				totalwords_reg <= "00" & ENGINE_CONTROL_IND_aux(15 downto 2);
			elsif m00_axis_tvalid_aux = '1' and m00_axis_tready_aux = '1' then
				totalwords_reg <= totalwords_reg - 1;
			end if;
		end if;
	end process;

    compressed_size_reg <= tuser_compressed_size;
    
--	process(s00_axis_aclk)
--	begin
--		if (s00_axis_aclk'event and s00_axis_aclk = '1') then
--			if (s00_axis_aresetn = '0') then --------------------------------------<<<<
--				compressed_size_reg <= (others => '0');
--			else
--				compressed_size_reg <= tuser_compressed_size;
--			end if;
--		end if;
--	end process;

	SYNC_PROC1 : process(s00_axis_aclk)
	begin
		if (s00_axis_aclk'event and s00_axis_aclk = '1') then
			if (s00_axis_aresetn = '0') then
				state1         <= st1_idle;
				assigned_tdest <= "0000";
				engine_ready   <= '0';
			else
				state1         <= next_state1;
				assigned_tdest <= next_assigned_tdest;
				engine_ready   <= engine_ready_i;
			end if;
		end if;
	end process;
	
	NEXT_STATE_DECODE1 : process(state1, assigned_tdest, s00_axis_tlast_bit4, s00_axis_tvalid_i, s00_axis_tlast_i, m00_axis_tlast_aux)
	begin
		next_state1         <= state1;
		next_assigned_tdest <= assigned_tdest;
		engine_ready_i      <= '1';

		case (state1) is

			when st1_idle =>
				if s00_axis_tvalid_i = '1' then
					next_assigned_tdest <= s00_axis_tdest;
					next_state1         <= st_wait_s_tlast;
				end if;

			when st_wait_s_tlast =>
				if s00_axis_tlast_bit4 = '1' and s00_axis_tlast_i = assigned_tdest then
					next_state1 <= st_wait_m_tlast;
				end if;

			when st_wait_m_tlast =>
				engine_ready_i <= '0';
				if m00_axis_tlast_aux = '1' then
					next_state1 <= st_wait_delay;
				end if;

			when st_wait_delay =>
				next_state1 <= st1_idle;

			when others =>
				next_state1 <= st1_idle;
		end case;
	end process;



end arch_imp;


----This library is free software; you can redistribute it and/or
----modify it under the terms of the GNU Lesser General Public
----License as published by the Free Software Foundation; either
----version 2.1 of the License, or (at your option) any later version.

----This library is distributed in the hope that it will be useful,
----but WITHOUT ANY WARRANTY; without even the implied warranty of
----MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
----Lesser General Public License for more details.

----You should have received a copy of the GNU Lesser General Public
----License along with this library; if not, write to the Free Software
----Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

---- e_mail : mohd.a.zainol@gmail.com

----------------------------------------------------------
----  ENTITY       = xmatchpro_decompressor_engine_v1_0 --
----  version      = 1.0                                --
----  last update  = 14/10/2017                         --
----  author       = Mohd A. Zainol                     --
----------------------------------------------------------

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

--entity xmatchpro_decompressor_engine_v1_0 is
--	generic(
--		-- Parameters of Axi Slave Bus Interface S00_AXIS
--		C_S00_AXIS_TDATA_WIDTH : integer := 32;
--		-- Parameters of Axi Master Bus Interface M00_AXIS
--		C_M00_AXIS_TDATA_WIDTH : integer := 32;
--		C_M00_AXIS_START_COUNT : integer := 32
--	);
--	port(
--		-- Ports of Axi Slave Bus Interface S00_AXIS
--		s00_axis_aclk    : in  std_logic;
--		s00_axis_aresetn : in  std_logic;
--		s00_axis_tready  : out std_logic;
--		s00_axis_tdata   : in  std_logic_vector(C_S00_AXIS_TDATA_WIDTH - 1 downto 0);
--		s00_axis_tvalid  : in  std_logic;
--		s00_axis_tuser   : in  std_logic_vector(20 downto 0);
--		s00_axis_tlast   : in  std_logic;
--		s00_axis_tdest   : in  std_logic_vector(3 downto 0);
--		-- Ports of Axi Master Bus Interface M00_AXIS
--		m00_axis_aclk    : in  std_logic;
--		m00_axis_aresetn : in  std_logic;
--		m00_axis_tvalid  : out std_logic;
--		m00_axis_tdata   : out std_logic_vector(C_M00_AXIS_TDATA_WIDTH - 1 downto 0);
--		m00_axis_tready  : in  std_logic;
--		m00_axis_tlast   : out std_logic;
--		command          : in  std_logic_vector(31 downto 0);
--		crc_32_d         : out std_logic_vector(31 downto 0);
--		status           : out std_logic_vector(31 downto 0);
--		engine_ready     : out std_logic;
--		xpro_aclk        : in  std_logic;
--		xpro_aresetn     : in  std_logic
--	);
--end xmatchpro_decompressor_engine_v1_0;

--architecture arch_imp of xmatchpro_decompressor_engine_v1_0 is

--	component decompressor_engine is
--		port(
--			CS                 : in  std_logic;
--			RW                 : in  std_logic;
--			ADDRESSD           : in  std_logic_vector(3 downto 0);
--			CONTROL_IND        : in  std_logic_vector(31 downto 0);
--			CONTROL_OUT_D      : out std_logic_vector(31 downto 0);
--			CLK                : in  std_logic;
--			CLEAR              : in  std_logic;
--			BUS_ACKNOWLEDGE_DC : in  std_logic;
--			BUS_ACKNOWLEDGE_DU : in  std_logic;
--			WAIT_DC            : in  std_logic;
--			WAIT_DU            : in  std_logic;
--			C_DATAIN           : in  std_logic_vector(31 downto 0);
--			U_DATAOUT          : out std_logic_vector(31 downto 0);
--			FINISHED_D         : out std_logic;
--			FLUSHING_D         : out std_logic;
--			DECOMPRESSING      : out std_logic;
--			U_DATA_VALID       : out std_logic;
--			DECODING_OVERFLOW  : out std_logic;
--			CRC_ERROR          : out std_logic; -- error condition in the compression or decompression channels
--			INTERRUPT_REQ_D    : out std_logic;
--			INTERRUPT_ACK_D    : in  std_logic;
--			BUS_REQUEST_DC     : out std_logic;
--			BUS_REQUEST_DU     : out std_logic;
--			CRC_OUT_D_32       : out std_logic_vector(31 downto 0)
--		);
--	end component decompressor_engine;

--	component xpro_d_controller is
--		Port(
--			CLK             : in  STD_LOGIC;
--			CLEAR           : in  STD_LOGIC;
--			COMMAND         : in  STD_LOGIC_VECTOR(31 downto 0);
--			COMPRESSED_SIZE : in  STD_LOGIC_VECTOR(15 downto 0);
--			RESTART         : in  STD_LOGIC;
--			BUS_REQ_DC      : in  STD_LOGIC;
--			BUS_REQ_DU      : in  STD_LOGIC;
--			BUS_ACK_DC      : out STD_LOGIC;
--			BUS_ACK_DU      : out STD_LOGIC;
--			INTR_ACK_D      : out STD_LOGIC;
--			INTR_REQ_D      : in  STD_LOGIC;
--			CS_RW           : out STD_LOGIC;
--			ADDR            : out STD_LOGIC_VECTOR(3 downto 0);
--			CTRL_IN         : out STD_LOGIC_VECTOR(31 downto 0);
--			RST_FIFO_DU     : out STD_LOGIC;
--			RST_FIFO_DC     : out STD_LOGIC;
--			RST_ENGINE      : out STD_LOGIC;
--			FIFO_DC_EMPTY   : in  STD_LOGIC;
--			ENGINE_C_TDATA : out STD_LOGIC_VECTOR(31 downto 0);
--			ENGINE_C_TVALID : out STD_LOGIC;
--			ENGINE_C_TREADY : in STD_LOGIC;
--			ENGINE_U_TDATA  : in  STD_LOGIC_VECTOR(31 downto 0);
--			ENGINE_U_TVALID : in  STD_LOGIC;
--			ENGINE_U_TREADY : out STD_LOGIC;
--			FIFO_DC_TDATA   : in  STD_LOGIC_VECTOR(31 downto 0);
--			FIFO_DC_TREADY  : out STD_LOGIC;
--			FIFO_DC_TVALID  : in  STD_LOGIC;
--			FIFO_DU_TDATA   : out STD_LOGIC_VECTOR(31 downto 0);
--			FIFO_DU_TREADY  : in  STD_LOGIC;
--			FIFO_DU_TVALID  : out STD_LOGIC
--		);
--	end component xpro_d_controller;

--	component xc7z020_fifo_d_axis_data_fifo_0_0 is
--		port(
--			S_AXIS_tvalid  : in  STD_LOGIC;
--			S_AXIS_tready  : out STD_LOGIC;
--			S_AXIS_tdata   : in  STD_LOGIC_VECTOR(31 downto 0);
--			s_axis_aresetn : in  STD_LOGIC;
--			m_axis_aresetn : in  STD_LOGIC;
--			s_axis_aclk    : in  STD_LOGIC;
--			m_axis_aclk    : in  STD_LOGIC;
--			M_AXIS_tvalid  : out STD_LOGIC;
--			M_AXIS_tready  : in  STD_LOGIC;
--			M_AXIS_tdata   : out STD_LOGIC_VECTOR(31 downto 0)
--		);
--	end component xc7z020_fifo_d_axis_data_fifo_0_0;

--	signal ENGINE_CONTROL_OUT_D_aux      : std_logic_vector(31 downto 0);
--	signal ENGINE_FINISHED_D_aux         : std_logic;
--	signal ENGINE_FLUSHING_D_aux         : std_logic;
--	signal ENGINE_DECOMPRESSING_aux      : std_logic;
--	signal ENGINE_DECODING_OVERFLOW_aux  : std_logic;
--	signal ENGINE_CRC_ERROR_aux          : std_logic;
--	signal ENGINE_BUS_ACKNOWLEDGE_DU_aux : std_logic;
--	signal ENGINE_INTERRUPT_ACK_D_aux    : std_logic;
--	signal ENGINE_CS_RW_aux              : std_logic;
--	signal ENGINE_ADDRESSD_aux           : std_logic_vector(3 downto 0);
--	signal ENGINE_CONTROL_IND_aux        : std_logic_vector(31 downto 0);
--	signal RST_ENGINE_aux                : std_logic;

--	signal RST_FIFO_DU_aux            : std_logic;
--	signal RST_FIFO_DU_N_aux          : std_logic;
--	signal RST_FIFO_DC_aux            : std_logic;
--	signal RST_FIFO_DC_N_aux          : std_logic;
--	signal ENGINE_BUS_REQUEST_DC_aux  : std_logic;
--	signal ENGINE_BUS_REQUEST_DU_aux  : std_logic;
--	signal ENGINE_INTERRUPT_REQ_D_aux : std_logic;
--	signal FIFO_DC_EMPTY_aux          : std_logic;

--	signal BUS_ACKNOWLEDGE_DC_aux : std_logic;

--	-- registers
--	signal ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux : std_logic;

--	signal compressed_size_reg   : std_logic_vector(15 downto 0);
--	signal tuser_compressed_size : std_logic_vector(15 downto 0);

--	signal m00_axis_tready_aux : std_logic;
--	signal m00_axis_tvalid_aux : std_logic;
--	signal m00_axis_tvalid_ff  : std_logic; -- no need
--	signal m00_axis_tdata_aux  : std_logic_vector(31 downto 0);
--	signal m00_axis_tlast_aux  : std_logic;
--	signal m00_axis_tlast_ff1  : std_logic; -- no need
--	signal m00_axis_tlast_ff2  : std_logic; -- no need
--	signal m00_axis_tlast_i    : std_logic;
--	signal totalwords_reg      : std_logic_vector(15 downto 0);

--	type state_type1 is (st1_idle, st_wait_s_tlast, st_wait_m_tlast, st_wait_delay);
--	signal state1, next_state1 : state_type1;
--	signal engine_ready_i      : std_logic;

--	signal s00_axis_tlast_i  : std_logic_vector(3 downto 0);
--	signal s00_axis_tvalid_i : std_logic;

--	signal assigned_tdest      : std_logic_vector(3 downto 0);
--	signal next_assigned_tdest : std_logic_vector(3 downto 0);

--	signal s00_axis_tlast_bit4 : std_logic;

--	signal self_reset_ff1 : std_logic;
--	signal self_reset_ff2 : std_logic;
--	signal self_reset_ff3 : std_logic;
--	signal self_reset_ff4 : std_logic;
--	signal self_reset_ff5 : std_logic;
--	signal self_reset_ff6 : std_logic;
--	signal self_resetn    : std_logic;

--	signal xpro_clear : std_logic;

--	signal restart_engine   : std_logic;
--	signal restart_engine_n : std_logic;

--	signal ENGINE_RST_ENGINE_i : std_logic;

--	signal FIFO_DC_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0);
--	signal FIFO_DC_TVALID_aux : STD_LOGIC;
--	signal FIFO_DC_TREADY_aux : STD_LOGIC;

--	signal FIFO_DU_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0);
--	signal FIFO_DU_TVALID_aux : STD_LOGIC;
--	signal FIFO_DU_TREADY_aux : STD_LOGIC;

--	signal ENGINE_CRC_32_D : std_logic_vector(31 downto 0);

--	-- unknown
--	signal TDATA_CONTROLLER_aux           : std_logic_vector(31 downto 0);
--	signal M_AXIS_tdata_dly_aux           : std_logic_vector(31 downto 0);
--	signal M_AXIS_tdata_dly_X             : std_logic_vector(31 downto 0);
--	signal ENGINE_M_AXIS_tdata_dly_CE_aux : std_logic_vector(31 downto 0);
--	signal WAIT_DC_TREADY_aux             : std_logic;

--	-- new
--	signal ENGINE_C_TDATA_aux : std_logic_vector(31 downto 0);
--	signal ENGINE_C_TVALID_aux : std_logic;
--	signal ENGINE_C_TREADY_aux : std_logic;
--	signal ENGINE_U_TDATA_aux  : std_logic_vector(31 downto 0);
--	signal ENGINE_U_TVALID_aux : std_logic;
--	signal ENGINE_U_TREADY_aux : std_logic;
--	signal s00_axis_tready_aux : std_logic;
	
--begin

--	inst_DECOMPRESSOR_ENGINE : decompressor_engine
--		port map(
--			CS                 => ENGINE_CS_RW_aux,
--			RW                 => ENGINE_CS_RW_aux,
--			ADDRESSD           => ENGINE_ADDRESSD_aux,
--			CONTROL_IND        => ENGINE_CONTROL_IND_aux,
--			CONTROL_OUT_D      => ENGINE_CONTROL_OUT_D_aux,
--			CLK                => xpro_aclk,
--			CLEAR              => ENGINE_RST_ENGINE_i,
--			BUS_ACKNOWLEDGE_DC => ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux,
--			BUS_ACKNOWLEDGE_DU => ENGINE_BUS_ACKNOWLEDGE_DU_aux,
--			WAIT_DC            => ENGINE_C_TVALID_aux,
--			WAIT_DU            => ENGINE_U_TREADY_aux,
--			C_DATAIN           => ENGINE_C_TDATA_aux,
--			U_DATAOUT          => ENGINE_U_TDATA_aux,
--			FINISHED_D         => ENGINE_FINISHED_D_aux,
--			FLUSHING_D         => ENGINE_FLUSHING_D_aux,
--			DECOMPRESSING      => ENGINE_DECOMPRESSING_aux,
--			U_DATA_VALID       => ENGINE_U_TVALID_aux,
--			DECODING_OVERFLOW  => ENGINE_DECODING_OVERFLOW_aux,
--			CRC_ERROR          => ENGINE_CRC_ERROR_aux,
--			INTERRUPT_REQ_D    => ENGINE_INTERRUPT_REQ_D_aux,
--			INTERRUPT_ACK_D    => ENGINE_INTERRUPT_ACK_D_aux,
--			BUS_REQUEST_DC     => ENGINE_BUS_REQUEST_DC_aux,
--			BUS_REQUEST_DU     => ENGINE_BUS_REQUEST_DU_aux,
--			CRC_OUT_D_32       => ENGINE_CRC_32_D
--		);

--	inst_DECOMPRESSOR_CONTROLLER : xpro_d_controller
--		port map(
--			CLK             => xpro_aclk,
--			CLEAR           => xpro_clear,
--			COMMAND         => command,
--			COMPRESSED_SIZE => compressed_size_reg,
--			RESTART         => restart_engine,
--			BUS_REQ_DC      => ENGINE_BUS_REQUEST_DC_aux,
--			BUS_REQ_DU      => ENGINE_BUS_REQUEST_DU_aux,
--			BUS_ACK_DC      => BUS_ACKNOWLEDGE_DC_aux,
--			BUS_ACK_DU      => ENGINE_BUS_ACKNOWLEDGE_DU_aux,
--			INTR_ACK_D      => ENGINE_INTERRUPT_ACK_D_aux,
--			INTR_REQ_D      => ENGINE_INTERRUPT_REQ_D_aux,
--			CS_RW           => ENGINE_CS_RW_aux,
--			ADDR            => ENGINE_ADDRESSD_aux,
--			CTRL_IN         => ENGINE_CONTROL_IND_aux,
--			RST_FIFO_DU     => RST_FIFO_DU_aux,
--			RST_FIFO_DC     => RST_FIFO_DC_aux,
--			RST_ENGINE      => RST_ENGINE_aux,
--			FIFO_DC_EMPTY   => FIFO_DC_EMPTY_aux,
--			ENGINE_C_TDATA  => ENGINE_C_TDATA_aux,
--			ENGINE_C_TVALID => ENGINE_C_TVALID_aux,
--			ENGINE_C_TREADY => ENGINE_C_TREADY_aux,
--			ENGINE_U_TDATA  => ENGINE_U_TDATA_aux,
--			ENGINE_U_TVALID => ENGINE_U_TVALID_aux,
--			ENGINE_U_TREADY => ENGINE_U_TREADY_aux,
--			FIFO_DC_TDATA   => FIFO_DC_TDATA_aux,
--			FIFO_DC_TREADY  => FIFO_DC_TREADY_aux,
--			FIFO_DC_TVALID  => FIFO_DC_TVALID_aux,
--			FIFO_DU_TDATA   => FIFO_DU_TDATA_aux,
--			FIFO_DU_TREADY  => FIFO_DU_TREADY_aux,
--			FIFO_DU_TVALID  => FIFO_DU_TVALID_aux
--		);

--	inst_FIFO_DC : component xc7z020_fifo_d_axis_data_fifo_0_0
--		port map(
--			M_AXIS_tdata   => FIFO_DC_TDATA_aux,
--			M_AXIS_tready  => FIFO_DC_TREADY_aux,
--			M_AXIS_tvalid  => FIFO_DC_TVALID_aux,
--			S_AXIS_tdata   => s00_axis_tdata,
--			S_AXIS_tready  => s00_axis_tready_aux,
--			S_AXIS_tvalid  => s00_axis_tvalid,
--			m_axis_aclk    => xpro_aclk,
--			m_axis_aresetn => RST_FIFO_DC_N_aux,
--			s_axis_aclk    => s00_axis_aclk,
--			s_axis_aresetn => RST_FIFO_DC_N_aux
--		);

--	inst_FIFO_DU : component xc7z020_fifo_d_axis_data_fifo_0_0
--		port map(
--			M_AXIS_tdata   => m00_axis_tdata_aux,
--			M_AXIS_tready  => m00_axis_tready_aux,
--			M_AXIS_tvalid  => m00_axis_tvalid_aux,
--			S_AXIS_tdata   => FIFO_DU_TDATA_aux,
--			S_AXIS_tready  => FIFO_DU_TREADY_aux,
--			S_AXIS_tvalid  => FIFO_DU_TVALID_aux,
--			m_axis_aclk    => m00_axis_aclk,
--			m_axis_aresetn => RST_FIFO_DU_N_aux,
--			s_axis_aclk    => xpro_aclk,
--			s_axis_aresetn => RST_FIFO_DU_N_aux
--		);

--    s00_axis_tready     <= s00_axis_tready_aux and ENGINE_INTERRUPT_REQ_D_aux; 
--    ENGINE_C_TREADY_aux <= s00_axis_tvalid_i;

--	xpro_clear          <= xpro_aresetn and self_resetn;
--	ENGINE_RST_ENGINE_i <= RST_ENGINE_aux and restart_engine_n;
--	RST_FIFO_DU_N_aux   <= not RST_FIFO_DU_aux;
--	RST_FIFO_DC_N_aux   <= not RST_FIFO_DC_aux;
--	FIFO_DC_EMPTY_aux   <= not FIFO_DC_TVALID_aux;

--	status                <= x"00000000";
--	m00_axis_tlast        <= m00_axis_tlast_aux;
--	m00_axis_tlast_aux    <= '1' when totalwords_reg = x"0001" else '0';
--	m00_axis_tlast_i      <= m00_axis_tlast_ff1 and (not m00_axis_tlast_ff2); -- no need
--	self_resetn           <= not self_reset_ff1;
--	restart_engine        <= self_reset_ff1;
--	restart_engine_n      <= not self_reset_ff1;
--	tuser_compressed_size <= s00_axis_tuser(20 downto 5);
--	s00_axis_tlast_bit4   <= s00_axis_tuser(4); -- tlast
--	s00_axis_tlast_i      <= s00_axis_tuser(3 downto 0); -- tdest of tlast
--	s00_axis_tvalid_i     <= s00_axis_tvalid;
--	m00_axis_tready_aux   <= m00_axis_tready;

--	crc_32_d <= ENGINE_CRC_32_D;

--	FLIP_FLOP_REGISTERS : process(xpro_aclk)
--	begin
--		if (xpro_aclk'event and xpro_aclk = '1') then
--			if xpro_aresetn = '0' then
--				ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux <= '0';
--			else
--				ENGINE_BUS_ACKNOWLEDGE_DC_dly_aux <= BUS_ACKNOWLEDGE_DC_aux;
--			end if;
--		end if;
--	end process FLIP_FLOP_REGISTERS;

--	process(m00_axis_aclk)
--	begin
--		if m00_axis_aclk'event and m00_axis_aclk = '1' then
--			if m00_axis_aresetn = '0' then
--				m00_axis_tvalid_ff <= '0'; -- no need
--				--				m00_axis_tvalid    <= '0';
--				--				m00_axis_tdata     <= (others => '0');
--				m00_axis_tlast_ff1 <= '0'; -- no need
--				m00_axis_tlast_ff2 <= '0'; -- no need
--			else
--				m00_axis_tvalid_ff <= m00_axis_tvalid_aux; -- no need
--				--				m00_axis_tvalid    <= m00_axis_tvalid_aux;
--				--				m00_axis_tdata     <= m00_axis_tdata_aux;
--				m00_axis_tlast_ff1 <= m00_axis_tlast_aux; -- no need
--				m00_axis_tlast_ff2 <= m00_axis_tlast_ff1; -- no need
--			end if;
--		end if;
--	end process;

--	m00_axis_tvalid <= m00_axis_tvalid_aux;
--	m00_axis_tdata  <= m00_axis_tdata_aux;

--	process(m00_axis_aclk)
--	begin
--		if m00_axis_aclk'event and m00_axis_aclk = '1' then
--			if m00_axis_aresetn = '0' then
--				self_reset_ff1 <= '0';
--				self_reset_ff2 <= '0';
--				self_reset_ff3 <= '0';
--				self_reset_ff4 <= '0';
--				self_reset_ff5 <= '0';
--				self_reset_ff6 <= '0';
--			else
--				self_reset_ff1 <= m00_axis_tlast_aux;
--				self_reset_ff2 <= self_reset_ff1;
--				self_reset_ff3 <= self_reset_ff2;
--				self_reset_ff4 <= self_reset_ff3;
--				self_reset_ff5 <= self_reset_ff4;
--				self_reset_ff6 <= self_reset_ff5;
--			end if;
--		end if;
--	end process;

--	process(m00_axis_aclk)
--	begin
--		if m00_axis_aclk'event and m00_axis_aclk = '1' then
--			if ENGINE_CS_RW_aux = '0' and ENGINE_ADDRESSD_aux = "1001" then
--				totalwords_reg <= "00" & ENGINE_CONTROL_IND_aux(15 downto 2);
--			elsif m00_axis_tvalid_aux = '1' and m00_axis_tready_aux = '1' then
--				totalwords_reg <= totalwords_reg - 1;
--			end if;
--		end if;
--	end process;

--    compressed_size_reg <= tuser_compressed_size;
    
----	process(s00_axis_aclk)
----	begin
----		if (s00_axis_aclk'event and s00_axis_aclk = '1') then
----			if (s00_axis_aresetn = '0') then --------------------------------------<<<<
----				compressed_size_reg <= (others => '0');
----			else
----				compressed_size_reg <= tuser_compressed_size;
----			end if;
----		end if;
----	end process;

--	SYNC_PROC1 : process(s00_axis_aclk)
--	begin
--		if (s00_axis_aclk'event and s00_axis_aclk = '1') then
--			if (s00_axis_aresetn = '0') then
--				state1         <= st1_idle;
--				assigned_tdest <= "0000";
--				engine_ready   <= '0';
--			else
--				state1         <= next_state1;
--				assigned_tdest <= next_assigned_tdest;
--				engine_ready   <= engine_ready_i;
--			end if;
--		end if;
--	end process;
	
--	NEXT_STATE_DECODE1 : process(state1, assigned_tdest, s00_axis_tlast_bit4, s00_axis_tvalid_i, s00_axis_tlast_i, m00_axis_tlast_aux)
--	begin
--		next_state1         <= state1;
--		next_assigned_tdest <= assigned_tdest;
--		engine_ready_i      <= '1';

--		case (state1) is

--			when st1_idle =>
--				if s00_axis_tvalid_i = '1' then
--					next_assigned_tdest <= s00_axis_tdest;
--					next_state1         <= st_wait_s_tlast;
--				end if;

--			when st_wait_s_tlast =>
--				if s00_axis_tlast_bit4 = '1' and s00_axis_tlast_i = assigned_tdest then
--					next_state1 <= st_wait_m_tlast;
--				end if;

--			when st_wait_m_tlast =>
--				engine_ready_i <= '0';
--				if m00_axis_tlast_aux = '1' then
--					next_state1 <= st_wait_delay;
--				end if;

--			when st_wait_delay =>
--				next_state1 <= st1_idle;

--			when others =>
--				next_state1 <= st1_idle;
--		end case;
--	end process;



--end arch_imp;
