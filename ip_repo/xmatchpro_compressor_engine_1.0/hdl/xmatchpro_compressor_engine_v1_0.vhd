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
--  ENTITY          : xmatchpro_compressor_engine_v1_0 
--      version     : 1.0            
--      last update : 20/10/2017     
--      author      : Mohd A. Zainol
-- 
--  FUNCTION                       
--      Compressor engine.
-- 
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xmatchpro_compressor_engine_v1_0 is
	generic(
		C_S00_AXIS_TDATA_WIDTH : integer := 32;
		C_M00_AXIS_TDATA_WIDTH : integer := 32;
		C_M00_AXIS_START_COUNT : integer := 32;
		C_m_axis_h_TDATA_WIDTH : integer := 32
	);
	port(
		s00_axis_aclk    : in  std_logic;
		s00_axis_aresetn : in  std_logic;
		s00_axis_tready  : out std_logic;
		s00_axis_tdata   : in  std_logic_vector(C_S00_AXIS_TDATA_WIDTH - 1 downto 0);
		s00_axis_tvalid  : in  std_logic;
		m00_axis_aclk    : in  std_logic;
		m00_axis_aresetn : in  std_logic;
		m00_axis_tvalid  : out std_logic;
		m00_axis_tdata   : out std_logic_vector(C_M00_AXIS_TDATA_WIDTH - 1 downto 0);
		m00_axis_tready  : in  std_logic;
		m00_axis_tlast   : out std_logic;
		m_axis_h_aclk    : in  std_logic;
		m_axis_h_aresetn : in  std_logic;
		m_axis_h_tvalid  : out std_logic;
		m_axis_h_tdata   : out std_logic_vector(C_m_axis_h_TDATA_WIDTH - 1 downto 0);
		m_axis_h_tready  : in  std_logic;
		m_axis_h_tlast   : out std_logic;
		xpro_aclk        : in  std_logic;
		xpro_aresetn     : in  std_logic;
		command          : in  std_logic_vector(31 downto 0);
		crc_32_c         : out std_logic_vector(31 downto 0);
		status           : out std_logic_vector(31 downto 0)
	);
end xmatchpro_compressor_engine_v1_0;

architecture arch_imp of xmatchpro_compressor_engine_v1_0 is

	component xpro_c_engine is
		port(
			CS                 : in  std_logic;
			RW                 : in  std_logic;
			ADDRESSC           : in  std_logic_vector(3 downto 0);
			CONTROL_IN_C       : in  std_logic_vector(31 downto 0);
			CONTROL_OUT_C      : out std_logic_vector(31 downto 0);
			CLK                : in  std_logic;
			CLEAR              : in  std_logic;
			BUS_ACKNOWLEDGE_CC : in  std_logic;
			BUS_ACKNOWLEDGE_CU : in  std_logic;
			WAIT_CU            : in  std_logic;
			WAIT_CC            : in  std_logic;
			U_DATAIN           : in  std_logic_vector(31 downto 0);
			C_DATAOUT          : out std_logic_vector(31 downto 0);
			FINISHED_C         : out std_logic;
			COMPRESSING        : out std_logic;
			FLUSHING_C         : out std_logic;
			C_DATA_VALID       : out std_logic;
			CODING_OVERFLOW    : out std_logic; -- ilegal => error condition
			CRC_ERROR          : out std_logic; -- error condition in the compression or decompression channels
			INTERRUPT_REQ_C    : out std_logic;
			INTERRUPT_ACK_C    : in  std_logic;
			BUS_REQUEST_CC     : out std_logic;
			BUS_REQUEST_CU     : out std_logic;
			CRC_32_C           : out std_logic_vector(31 downto 0)
		);
	end component xpro_c_engine;

	component xpro_c_controller is
		Port(
			CLK           : in  STD_LOGIC;
			CLEAR         : in  STD_LOGIC;
			COMMAND       : in  STD_LOGIC_VECTOR(31 downto 0);
			RESTART       : in  STD_LOGIC;
			BUS_REQ_CU    : in  STD_LOGIC;
			BUS_REQ_CC    : in  STD_LOGIC;
			BUS_ACK_CU    : out STD_LOGIC;
			BUS_ACK_CC    : out STD_LOGIC;
			INTR_ACK_C    : out STD_LOGIC;
			INTR_REQ_C    : in  STD_LOGIC;
			WAIT_CU       : out STD_LOGIC;
			WAIT_CC       : out STD_LOGIC;
			CS_RW         : out STD_LOGIC;
			ADDR          : out STD_LOGIC_VECTOR(3 downto 0);
			CTRL_IN       : out STD_LOGIC_VECTOR(31 downto 0);
			RST_FIFO_CC   : out STD_LOGIC;
			RST_FIFO_CU   : out STD_LOGIC;
			RST_ENGINE    : out STD_LOGIC;
			WAIT_CU_START : out STD_LOGIC;
			WAIT_CU_DONE  : out STD_LOGIC;
			FIFO_CU_EMPTY : in  STD_LOGIC
		);
	end component xpro_c_controller;

	component xc7z020_fifo_c_axis_data_fifo_0_0 is
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
	end component xc7z020_fifo_c_axis_data_fifo_0_0;

	component dpram_blk_mem_gen_0_0 is
		port(
			DPRAM_PORTA_addr : in  STD_LOGIC_VECTOR(9 downto 0);
			DPRAM_PORTA_clk  : in  STD_LOGIC;
			DPRAM_PORTA_din  : in  STD_LOGIC_VECTOR(31 downto 0);
			DPRAM_PORTA_en   : in  STD_LOGIC;
			DPRAM_PORTA_we   : in  STD_LOGIC_VECTOR(0 to 0);
			DPRAM_PORTB_addr : in  STD_LOGIC_VECTOR(9 downto 0);
			DPRAM_PORTB_clk  : in  STD_LOGIC;
			DPRAM_PORTB_dout : out STD_LOGIC_VECTOR(31 downto 0);
			DPRAM_PORTB_en   : in  STD_LOGIC
		);
	end component dpram_blk_mem_gen_0_0;

	--signal CONTROL_OUT_D_aux : std_logic_vector (31 downto 0);
	--signal C_DATAIN_aux : std_logic_vector(31 downto 0);
	--signal FINISHED_D_aux : std_logic;
	--signal FLUSHING_D_aux : std_logic;
	--signal DECOMPRESSING_aux : std_logic;
	--signal DECODING_OVERFLOW_aux : std_logic;
	--signal CRC_ERROR_aux : std_logic;
	--signal CRC_OUT_D_32_aux : std_logic_vector(31 downto 0);

	signal BUS_ACKNOWLEDGE_CC_aux    : std_logic;
	signal INTERRUPT_ACK_C_aux       : std_logic;
	signal CS_RW_aux                 : std_logic                     := '1';
	signal ADDRESSC_aux              : std_logic_vector(3 downto 0)  := "0000";
	signal CONTROL_IN_C_aux          : std_logic_vector(31 downto 0) := x"00000000";
	signal RST_ENGINE_aux            : std_logic;
	signal C_DATAOUT_aux             : std_logic_vector(31 downto 0);
	signal C_DATA_VALID_aux          : std_logic                     := '1';
	signal C_DATA_VALID_N_aux        : std_logic                     := '1';
	signal WAIT_CC_aux               : std_logic;
	signal WAIT_CC_CTLR_aux          : std_logic;
	signal S_AXIS_TREADY_CC_aux      : std_logic;
	signal RST_FIFO_CC_aux           : std_logic;
	signal RST_FIFO_CC_N_aux         : std_logic;
	signal RST_FIFO_CU_aux           : std_logic;
	signal RST_FIFO_CU_N_aux         : std_logic;
	signal BUS_REQUEST_CU_aux        : std_logic;
	signal BUS_REQUEST_CC_aux        : std_logic;
	signal INTERRUPT_REQ_C_aux       : std_logic;
	signal FIFO_CU_NOT_EMPTY_aux     : std_logic;
	signal M_AXIS_tvalid_aux         : std_logic;
	signal WAIT_CU_TREADY_aux        : std_logic;
	signal M_AXIS_tready_aux         : std_logic;
	signal BUS_ACKNOWLEDGE_CU_aux    : std_logic;
	signal M_AXIS_tdata_aux          : std_logic_vector(31 downto 0);
	signal WAIT_CU_START_aux         : std_logic;
	signal WAIT_CU_M_AXIS_tready_aux : std_logic;

	-- registers
	signal BUS_ACKNOWLEDGE_CU_dly_aux : std_logic;
	signal M_AXIS_tdata_dly_aux       : std_logic_vector(31 downto 0);
	signal M_AXIS_tdata_dly_CE_aux    : std_logic_vector(31 downto 0);
	signal WAIT_CU_TVALID_aux         : std_logic;
	signal M_AXIS_tvalid_dly_1_aux    : std_logic;
	signal M_AXIS_tvalid_dly_2_aux    : std_logic;
	signal WAIT_CU_TVALID_dly_aux     : std_logic;
	signal M_AXIS_tdata_dly_X         : std_logic_vector(31 downto 0);

	signal WAIT_CU_DONE_aux : std_logic;

	signal FINISHED_C_aux      : std_logic;
	signal FLUSHING_C_aux      : std_logic;
	signal COMPRESSING_aux     : std_logic;
	signal CODING_OVERFLOW_aux : std_logic;
	signal CRC_ERROR_aux       : std_logic;
	signal CRC_32_C_aux        : std_logic_vector(31 downto 0);

	signal count_compressed_size       : std_logic_vector(15 downto 0);
	signal count_compressed_size_tlast : std_logic_vector(15 downto 0);
	signal count_m_CC                  : std_logic_vector(15 downto 0);
	signal tlast_aux                   : std_logic;

	signal m00_axis_tready_aux : std_logic;
	signal m00_axis_tvalid_aux : std_logic;
	signal self_reset          : std_logic;
	signal RST_ENGINE_C_aux    : std_logic;
	signal xpro_aresetn_aux    : std_logic;
	signal INTERRUPT_ACK_C_reg : std_logic;
	signal m_tlast_ff1         : std_logic;
	signal m_tlast_ff2         : std_logic;

	signal reset_fifo_s_CU  : std_logic;
	signal reset_fifo_s_CC  : std_logic;
	signal reset_fifo_m_CU  : std_logic;
	signal reset_fifo_m_CC  : std_logic;
	signal reset_fifo_dly_1 : std_logic;
	signal reset_fifo_dly_2 : std_logic;
	signal reset_fifo_dly_3 : std_logic;
	signal reset_fifo_dly_4 : std_logic;
	signal reset_fifo_dly_5 : std_logic;
	signal reset_fifo_dly_6 : std_logic;
	signal reset_fifo_dly_7 : std_logic;
	signal reset_fifo_dly_8 : std_logic;
	signal reset_ctlr       : std_logic;
	signal sw_reset         : std_logic;
	signal sw_reset_dly_1   : std_logic;
	signal sw_reset_dly_2   : std_logic;
	signal sw_reset_dly_3   : std_logic;
	signal sw_reset_dly_4   : std_logic;
	signal sw_reset_dly_5   : std_logic;
	signal sw_reset_dly_6   : std_logic;
	signal sw_reset_dly_7   : std_logic;
	signal sw_reset_dly_8   : std_logic;
	signal not_command_31   : std_logic;
	signal sw_reset_ff1     : std_logic;
	signal sw_reset_ff2     : std_logic;

	signal ENGINE_BUSY_aux                     : STD_LOGIC := '1';
	signal ENGINE_BUSY_i                       : STD_LOGIC := '1';
	type state is (IDLE, ENGINE_START, ENGINE_BUSY, WAIT_DLY_0, WAIT_DLY_1, WAIT_DLY_2, WAIT_DLY_3, WAIT_DLY_4, WAIT_DLY_5, WAIT_DLY_6, ENGINE_READY);
	signal mst_exec_state, mst_exec_state_next : state;

	signal flush_tvalid_aux : std_logic;
	signal flush_tvalid_i   : std_logic;

	signal s_axis_tvalid_CU : std_logic;

	signal s00_axis_tvalid_aux   : std_logic;
	signal s00_axis_tready_aux   : std_logic;
	signal s00_axis_tdata_aux    : std_logic_vector(31 downto 0);
	signal s00_axis_tready_aux_i : std_logic;
	signal count_down_blocksize  : std_logic_vector(15 downto 0);

	type state_type_h_packer is (st1_h_idle, st2_h_valid, st2_h_tready_1, st2_h_tready_2);
	signal state_h_packer, state_h_packer_next : state_type_h_packer;

begin

	status   <= "0000000000000000000000000000000" & ENGINE_BUSY_aux;
	crc_32_c <= CRC_32_C_aux;

	not_command_31 <= not command(31);

	RST_FIFO_CU_N_aux         <= not RST_FIFO_CU_aux;
	RST_FIFO_CC_N_aux         <= not RST_FIFO_CC_aux;
	FIFO_CU_NOT_EMPTY_aux     <= not (M_AXIS_tvalid_aux and M_AXIS_tready_aux);
	C_DATA_VALID_N_aux        <= not C_DATA_VALID_aux;
	WAIT_CC_aux               <= WAIT_CC_CTLR_aux and S_AXIS_TREADY_CC_aux;
	M_AXIS_tready_aux         <= (WAIT_CU_TVALID_aux and WAIT_CU_TVALID_dly_aux);
	M_AXIS_tdata_dly_CE_aux   <= M_AXIS_tdata_dly_aux when WAIT_CU_TREADY_aux = '1' else M_AXIS_tdata_dly_X;
	WAIT_CU_TVALID_aux        <= WAIT_CU_TREADY_aux and M_AXIS_tvalid_aux;
	WAIT_CU_M_AXIS_tready_aux <= (WAIT_CU_TVALID_aux and WAIT_CU_TVALID_dly_aux) and WAIT_CU_START_aux;

	process(xpro_aclk)
	begin
		if xpro_aclk'event and xpro_aclk = '1' then
			if xpro_aresetn = '0' or sw_reset = '0' then
				M_AXIS_tdata_dly_X <= (others => '0');
			elsif WAIT_CU_TREADY_aux = '1' then
				M_AXIS_tdata_dly_X <= M_AXIS_tdata_dly_aux;
			end if;
		end if;
	end process;

	process(xpro_aclk)
	begin
		if xpro_aclk'event and xpro_aclk = '1' then
			if xpro_aresetn = '0' or sw_reset = '0' then
				M_AXIS_tdata_dly_aux <= (others => '0');
			elsif M_AXIS_tready_aux = '1' then
				M_AXIS_tdata_dly_aux <= M_AXIS_tdata_aux;
			end if;
		end if;
	end process;

	process(xpro_aclk)
	begin
		if xpro_aclk = '1' and xpro_aclk'event then
			if xpro_aresetn = '0' or self_reset = '0' or sw_reset = '0' then
				count_compressed_size <= (others => '0');
			elsif (S_AXIS_TREADY_CC_aux = '1' and C_DATA_VALID_N_aux = '1') then
				count_compressed_size <= count_compressed_size + 1;
			end if;
		end if;
	end process;

	FLIP_FLOP_REGISTERS : process(xpro_aclk)
	begin
		if (xpro_aclk'event and xpro_aclk = '1') then
			if xpro_aresetn = '0' or sw_reset = '0' then
				BUS_ACKNOWLEDGE_CU_dly_aux <= '0';
				M_AXIS_tvalid_dly_1_aux    <= '0';
				M_AXIS_tvalid_dly_2_aux    <= '0';
				WAIT_CU_TVALID_dly_aux     <= '0';
				INTERRUPT_ACK_C_reg        <= '0';
			else
				BUS_ACKNOWLEDGE_CU_dly_aux <= BUS_ACKNOWLEDGE_CU_aux;
				M_AXIS_tvalid_dly_1_aux    <= M_AXIS_tvalid_aux;
				M_AXIS_tvalid_dly_2_aux    <= M_AXIS_tvalid_dly_1_aux;
				WAIT_CU_TVALID_dly_aux     <= WAIT_CU_TVALID_aux;
				INTERRUPT_ACK_C_reg        <= INTERRUPT_ACK_C_aux;
			end if;
		end if;
	end process FLIP_FLOP_REGISTERS;

	--Generate a pulse to initiate TLAST
	process(xpro_aclk)
	begin
		if ((xpro_aclk'event) and (xpro_aclk = '1')) then
			if (xpro_aresetn = '0' or sw_reset = '0') then
				m_tlast_ff1 <= '0';
				m_tlast_ff2 <= '0';
			else
				m_tlast_ff1 <= not tlast_aux;
				m_tlast_ff2 <= m_tlast_ff1;
			end if;
		end if;
	end process;

	--Generate a pulse to initiate SW_RESET
	process(xpro_aclk)
	begin
		if ((xpro_aclk'event) and (xpro_aclk = '1')) then
			if (xpro_aresetn = '0') then
				sw_reset_ff1 <= '1';
				sw_reset_ff2 <= '1';
			else
				sw_reset_ff1 <= not_command_31;
				sw_reset_ff2 <= sw_reset_ff1;
			end if;
		end if;
	end process;

	sw_reset <= (sw_reset_ff1) or (not sw_reset_ff2);

	INTERRUPT_ACK_C_aux <= '0' when (count_compressed_size = count_m_CC and INTERRUPT_REQ_C_aux = '0') else '1';
	self_reset          <= INTERRUPT_ACK_C_reg;

	RST_ENGINE_C_aux <= self_reset and RST_ENGINE_aux and sw_reset;
	xpro_aresetn_aux <= self_reset and xpro_aresetn and sw_reset;
	reset_fifo_m_CU  <= self_reset and xpro_aresetn and sw_reset;
	reset_fifo_s_CC  <= self_reset and xpro_aresetn and sw_reset;

	tlast_aux <= '0' when (count_m_CC = count_compressed_size_tlast and INTERRUPT_REQ_C_aux = '0') else '1';

	s00_axis_tvalid_aux   <= (s00_axis_tvalid or flush_tvalid_aux);
	--	s00_axis_tvalid_aux   <= (s00_axis_tvalid or flush_tvalid_aux) and s00_axis_tready_aux_i;
	s_axis_tvalid_CU      <= s00_axis_tvalid;
	s00_axis_tdata_aux    <= s00_axis_tdata;
	s00_axis_tready       <= s00_axis_tready_aux_i;
	s00_axis_tready_aux_i <= '0' when mst_exec_state = WAIT_DLY_0 or mst_exec_state = WAIT_DLY_1 or mst_exec_state = WAIT_DLY_2 or mst_exec_state = WAIT_DLY_3 or mst_exec_state = WAIT_DLY_4 or mst_exec_state = WAIT_DLY_5 or mst_exec_state = WAIT_DLY_6 else '1';

	process(s00_axis_aclk)
	begin
		if (s00_axis_aclk'event and s00_axis_aclk = '1') then
			if (s00_axis_aresetn = '0' or reset_fifo_dly_6 = '0' or sw_reset_dly_6 = '0') then
				count_down_blocksize <= (others => '0');
			elsif s00_axis_tvalid_aux = '1' and s00_axis_tready_aux_i = '1' then
				if count_down_blocksize = x"0000" then
					count_down_blocksize <= ('0' & command(7 downto 0) & "0000000");
				else
					count_down_blocksize <= count_down_blocksize - 1;
				end if;
			end if;
		end if;
	end process;

	process(s00_axis_aclk)
	begin
		if s00_axis_aclk'event and s00_axis_aclk = '1' then
			if s00_axis_aresetn = '0' then
				sw_reset_dly_1   <= '1';
				sw_reset_dly_2   <= '1';
				sw_reset_dly_3   <= '1';
				sw_reset_dly_4   <= '1';
				sw_reset_dly_5   <= '1';
				sw_reset_dly_6   <= '1';
				sw_reset_dly_7   <= '1';
				sw_reset_dly_8   <= '1';
				reset_fifo_dly_1 <= '1';
				reset_fifo_dly_2 <= '1';
				reset_fifo_dly_3 <= '1';
				reset_fifo_dly_4 <= '1';
				reset_fifo_dly_5 <= '1';
				reset_fifo_dly_6 <= '1';
				reset_fifo_dly_7 <= '1';
				reset_fifo_dly_8 <= '1';
				reset_fifo_s_CU  <= '1';
				reset_fifo_m_CC  <= '1';
			else
				sw_reset_dly_1   <= sw_reset;
				sw_reset_dly_2   <= sw_reset_dly_1;
				sw_reset_dly_3   <= sw_reset_dly_2;
				sw_reset_dly_4   <= sw_reset_dly_3;
				sw_reset_dly_5   <= sw_reset_dly_4;
				sw_reset_dly_6   <= sw_reset_dly_5;
				sw_reset_dly_7   <= sw_reset_dly_6;
				sw_reset_dly_8   <= sw_reset_dly_7;
				reset_fifo_dly_1 <= self_reset;
				reset_fifo_dly_2 <= reset_fifo_dly_1;
				reset_fifo_dly_3 <= reset_fifo_dly_2;
				reset_fifo_dly_4 <= reset_fifo_dly_3;
				reset_fifo_dly_5 <= reset_fifo_dly_4;
				reset_fifo_dly_6 <= reset_fifo_dly_5;
				reset_fifo_dly_7 <= reset_fifo_dly_6;
				reset_fifo_dly_8 <= reset_fifo_dly_7;
				reset_fifo_s_CU  <= reset_fifo_dly_8;
				reset_fifo_m_CC  <= reset_fifo_dly_6;
			end if;
		end if;
	end process;

	process(m00_axis_aclk)
	begin
		if m00_axis_aclk'event and m00_axis_aclk = '1' then
			if m00_axis_aresetn = '0' or sw_reset_dly_6 = '0' then
				count_compressed_size_tlast <= (others => '0');
			else
				count_compressed_size_tlast <= count_compressed_size - 2;
			end if;
		end if;
	end process;

	process(m00_axis_aclk)
	begin
		if m00_axis_aclk = '1' and m00_axis_aclk'event then
			if m00_axis_aresetn = '0' or reset_fifo_dly_6 = '0' or sw_reset_dly_6 = '0' then
				count_m_CC <= (others => '0');
			elsif (m00_axis_tready_aux = '1' and m00_axis_tvalid_aux = '1') then
				count_m_CC <= count_m_CC + 1;
			end if;
		end if;
	end process;

	m00_axis_tready_aux <= m00_axis_tready;
	m00_axis_tvalid     <= m00_axis_tvalid_aux;
	m00_axis_tlast      <= (not m_tlast_ff2) and (m_tlast_ff1);

	inst_XPRO_COMPRESSOR_ENGINE : xpro_c_engine
		port map(
			CS                 => CS_RW_aux, --
			RW                 => CS_RW_aux, --
			ADDRESSC           => ADDRESSC_aux, --
			CONTROL_IN_C       => CONTROL_IN_C_aux, --
			CONTROL_OUT_C      => open, --
			CLK                => xpro_aclk, --
			CLEAR              => RST_ENGINE_C_aux, --
			BUS_ACKNOWLEDGE_CC => BUS_ACKNOWLEDGE_CC_aux, --
			BUS_ACKNOWLEDGE_CU => BUS_ACKNOWLEDGE_CU_aux, --
			WAIT_CU            => WAIT_CU_M_AXIS_tready_aux,
			WAIT_CC            => WAIT_CC_aux,
			U_DATAIN           => M_AXIS_tdata_dly_CE_aux,
			C_DATAOUT          => C_DATAOUT_aux,
			FINISHED_C         => open,
			COMPRESSING        => open,
			FLUSHING_C         => open,
			C_DATA_VALID       => C_DATA_VALID_aux, --
			CODING_OVERFLOW    => open,
			CRC_ERROR          => open,
			INTERRUPT_REQ_C    => INTERRUPT_REQ_C_aux, --
			INTERRUPT_ACK_C    => INTERRUPT_ACK_C_aux, --
			BUS_REQUEST_CC     => BUS_REQUEST_CC_aux, --
			BUS_REQUEST_CU     => BUS_REQUEST_CU_aux, --
			CRC_32_C           => CRC_32_C_aux
		);

	inst_COMPRESSOR_CONTROLLER : xpro_c_controller
		port map(
			CLK           => xpro_aclk, --
			CLEAR         => xpro_aresetn_aux, --
			COMMAND       => command,   --
			RESTART       => reset_ctlr, --
			BUS_REQ_CU    => BUS_REQUEST_CU_aux, --
			BUS_REQ_CC    => BUS_REQUEST_CC_aux, --
			BUS_ACK_CU    => BUS_ACKNOWLEDGE_CU_aux, --
			BUS_ACK_CC    => BUS_ACKNOWLEDGE_CC_aux, --
			INTR_ACK_C    => open,
			INTR_REQ_C    => INTERRUPT_REQ_C_aux,
			WAIT_CU       => WAIT_CU_TREADY_aux, --
			WAIT_CC       => WAIT_CC_CTLR_aux, --
			CS_RW         => CS_RW_aux, --
			ADDR          => ADDRESSC_aux, --
			CTRL_IN       => CONTROL_IN_C_aux, --
			RST_FIFO_CC   => RST_FIFO_CU_aux, --
			RST_FIFO_CU   => RST_FIFO_CC_aux, --
			RST_ENGINE    => RST_ENGINE_aux, --
			WAIT_CU_START => WAIT_CU_START_aux, --
			WAIT_CU_DONE  => WAIT_CU_DONE_aux,
			FIFO_CU_EMPTY => FIFO_CU_NOT_EMPTY_aux --
		);

	inst_FIFO_CU : component xc7z020_fifo_c_axis_data_fifo_0_0
		port map(
			M_AXIS_tdata   => M_AXIS_tdata_aux,
			M_AXIS_tready  => M_AXIS_tready_aux,
			M_AXIS_tvalid  => M_AXIS_tvalid_aux,
			S_AXIS_tdata   => s00_axis_tdata_aux,
			S_AXIS_tready  => s00_axis_tready_aux,
			S_AXIS_tvalid  => s00_axis_tvalid_aux,
			m_axis_aclk    => xpro_aclk,
			m_axis_aresetn => reset_fifo_m_CU, --xpro_aresetn
			s_axis_aclk    => s00_axis_aclk,
			s_axis_aresetn => reset_fifo_s_CU --RST_FIFO_CU_N_aux
		);

	inst_FIFO_CC : component xc7z020_fifo_c_axis_data_fifo_0_0
		port map(
			M_AXIS_tdata   => m00_axis_tdata,
			M_AXIS_tready  => m00_axis_tready_aux,
			M_AXIS_tvalid  => m00_axis_tvalid_aux,
			S_AXIS_tdata   => C_DATAOUT_aux,
			S_AXIS_tready  => S_AXIS_TREADY_CC_aux,
			S_AXIS_tvalid  => C_DATA_VALID_N_aux,
			m_axis_aclk    => m00_axis_aclk,
			m_axis_aresetn => reset_fifo_m_CC, --m00_axis_aresetn
			s_axis_aclk    => xpro_aclk,
			s_axis_aresetn => reset_fifo_s_CC --RST_FIFO_CC_N_aux
		);

		--inst_DPRAM: component dpram_blk_mem_gen_0_0
		--    port map (
		--      DPRAM_PORTA_addr(9 downto 0) => DPRAM_PORTA_addr(9 downto 0),
		--      DPRAM_PORTA_clk => DPRAM_PORTA_clk,
		--      DPRAM_PORTA_din(31 downto 0) => DPRAM_PORTA_din(31 downto 0),
		--      DPRAM_PORTA_en => DPRAM_PORTA_en,
		--      DPRAM_PORTA_we(0) => DPRAM_PORTA_we(0),
		--      DPRAM_PORTB_addr(9 downto 0) => DPRAM_PORTB_addr(9 downto 0),
		--      DPRAM_PORTB_clk => DPRAM_PORTB_clk,
		--      DPRAM_PORTB_dout(31 downto 0) => DPRAM_PORTB_dout(31 downto 0),
		--      DPRAM_PORTB_en => DPRAM_PORTB_en
		--    );

	SYNC_PROC : process(xpro_aclk)
	begin
		if xpro_aclk = '1' and xpro_aclk'event then
			if xpro_aresetn = '0' or sw_reset = '0' then
				mst_exec_state   <= IDLE;
				ENGINE_BUSY_aux  <= '0';
				flush_tvalid_aux <= '0';
			else
				mst_exec_state   <= mst_exec_state_next;
				ENGINE_BUSY_aux  <= ENGINE_BUSY_i;
				flush_tvalid_aux <= flush_tvalid_i;
			end if;
		end if;
	end process;

	NEXT_STATE_DECODE : process(mst_exec_state, command, reset_fifo_dly_6, count_down_blocksize, M_AXIS_tvalid_aux)
	begin
		mst_exec_state_next <= mst_exec_state;
		ENGINE_BUSY_i       <= '0';
		flush_tvalid_i      <= '0';
		reset_ctlr          <= '1';

		case (mst_exec_state) is

			when IDLE =>
				if (command(29) = '1') then
					mst_exec_state_next <= ENGINE_START;
				end if;

			when ENGINE_START =>
				ENGINE_BUSY_i <= '1';
				if (s00_axis_tvalid_aux = '1' and s00_axis_tready_aux = '1') then
					mst_exec_state_next <= ENGINE_BUSY;
				end if;

			when ENGINE_BUSY =>
				ENGINE_BUSY_i <= '1';
				if (count_down_blocksize = x"0002") then -- change this
					mst_exec_state_next <= WAIT_DLY_0;
				end if;

			when WAIT_DLY_0 =>
				ENGINE_BUSY_i  <= '1';
				flush_tvalid_i <= '1';
				if (reset_fifo_dly_6 = '0') then
					mst_exec_state_next <= WAIT_DLY_1;
				end if;

			when WAIT_DLY_1 =>
				ENGINE_BUSY_i       <= '1';
				mst_exec_state_next <= WAIT_DLY_2;

			when WAIT_DLY_2 =>
				ENGINE_BUSY_i       <= '1';
				mst_exec_state_next <= WAIT_DLY_3;

			when WAIT_DLY_3 =>
				ENGINE_BUSY_i       <= '1';
				mst_exec_state_next <= WAIT_DLY_4;

			when WAIT_DLY_4 =>
				ENGINE_BUSY_i       <= '1';
				mst_exec_state_next <= WAIT_DLY_5;

			when WAIT_DLY_5 =>
				ENGINE_BUSY_i       <= '1';
				mst_exec_state_next <= WAIT_DLY_6;

			when WAIT_DLY_6 =>
				ENGINE_BUSY_i       <= '1';
				mst_exec_state_next <= ENGINE_READY;

			when ENGINE_READY =>
				reset_ctlr <= '0';
				if (M_AXIS_tvalid_aux = '1') then
					mst_exec_state_next <= ENGINE_BUSY;
				end if;

			when others =>
				mst_exec_state_next <= IDLE;

		end case;
	end process;

	SYNC_PROC_H_PACKER : process(m_axis_h_aclk)
	begin
		if (m_axis_h_aclk'event and m_axis_h_aclk = '1') then
			if (m_axis_h_aresetn = '0' or reset_fifo_dly_6 = '0' or sw_reset_dly_6 = '0') then
				state_h_packer <= st1_h_idle;
			else
				state_h_packer <= state_h_packer_next;
			end if;
		end if;
	end process;

	NEXT_STATE_DECODE_H_PACKER : process(state_h_packer, m_axis_h_tready, INTERRUPT_REQ_C_aux)
	begin
		state_h_packer_next <= state_h_packer;
		m_axis_h_tvalid     <= '0';
		m_axis_h_tdata      <= (others => '0');
		m_axis_h_tlast      <= '0';

		case (state_h_packer) is

			when st1_h_idle =>
				if (INTERRUPT_REQ_C_aux = '0') then
					state_h_packer_next <= st2_h_valid;
				end if;

			when st2_h_valid =>
				m_axis_h_tvalid <= '1';
				if (m_axis_h_tready = '1') then
					m_axis_h_tdata      <= x"0000" & count_compressed_size;
					state_h_packer_next <= st2_h_tready_1;
				end if;

			when st2_h_tready_1 =>
				m_axis_h_tvalid     <= '1';
				m_axis_h_tlast      <= '1';
				m_axis_h_tdata      <= CRC_32_C_aux;
				state_h_packer_next <= st2_h_tready_2;

			when st2_h_tready_2 =>
				if (INTERRUPT_REQ_C_aux = '1') then
					state_h_packer_next <= st1_h_idle;
				end if;

			when others =>
				state_h_packer_next <= st1_h_idle;

		end case;
	end process;

end arch_imp;
