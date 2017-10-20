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
-- Entity: 			xmp_ctlr_c.vhd
-- Version:			1.0
-- Description: This file is a controller for compressor
--
-- Additional Comments:
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ENTITY: xmp_ctlr_c
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

entity xmp_ctlr_c is
port (
	S_AXIS_TREADY					: OUT	STD_LOGIC;
	S_AXIS_TDATA					: IN  STD_LOGIC_VECTOR(31 downto 0);
	S_AXIS_TLAST					: IN  STD_LOGIC;
	S_AXIS_TVALID					: IN  STD_LOGIC;
	M_AXIS_TVALID					: OUT	STD_LOGIC;
	M_AXIS_TDATA					: OUT	STD_LOGIC_VECTOR(31 downto 0);
	M_AXIS_TREADY					: IN  STD_LOGIC;
	M_AXIS_TLAST					: OUT	STD_LOGIC;
	XMATCH_CLK 						: IN STD_LOGIC;
	XMATCH_RSTN						: IN  STD_LOGIC;
	XMATCH_CMD_BS 					: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_FS 					: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_UC 					: IN STD_LOGIC_VECTOR(31 downto 0);
	CS_bit 							: out bit;
	RW_bit 							: out bit;
	ADDRESS_bit 					: out bit_vector(3 downto 0);
	CONTROL_std 					: out std_logic_vector(31 downto 0);
	BUS_ACK_CC_bit 				: out bit;
	BUS_ACK_CU_bit 				: out bit;
	WAIT_CU_bit 					: out bit;
	WAIT_CC_bit 					: out bit;
	U_DATAIN_bit 					: out bit_vector(31 downto 0);
	C_DATAOUT_std 					: in std_logic_vector(31 downto 0);
	FINISHED_C_bit 				: in bit;
	COMPRESSING_bit 				: in bit;
	C_DATA_VALID_bit 				: in bit;
	INTR_REQ_bit 					: in bit;
	INTR_ACK_bit 					: out bit;
	BUS_REQ_CC_bit 				: in bit;
	BUS_REQ_CU_bit 				: in bit;
	XMATCH_C_SIZE					: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_C_STAT					: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end xmp_ctlr_c;

architecture Behavioral of xmp_ctlr_c is

component fifo_async is port
(
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    overflow : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    underflow : OUT STD_LOGIC
  );
end component;

COMPONENT ram_header
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

-- State machine
type states is	(
						IDLE,
						COMPRESS_START,
						COMPRESS_START1,
						COMPRESS_START2,
						COMPRESS_START3,
						COMPRESS_SAVE_CHUNKSIZE,
						C_RESERVE_HEADER,
						COMPRESS_START4,
						COMPRESS_START5,
						COMPRESS_INIT_BLOCKSIZE,
						COMPRESS_INIT_COMMAND,
						COMPRESS_WAIT,
						COMPRESS_WAIT_BUS_ACK_CU,
						COMPRESS_SEND_DATA,
						COMPRESS_WAIT_UNTIL_NOT_EMPTY,
						COMPRESS_WAIT_REQ_CU,
						COMPRESS_WAIT_CU_SEND,
						COMPRESS_WAIT_INTERRUPT_REQUEST,
						COMPRESS_SAVE_COMPRESSED_CHUNK_SIZE,
						COMPRESS_WAIT_NEXT_PACKET,
						COMPRESS_START_WAIT_IF_EMPTY,
						COMPRESS_WAIT_EMPTY_HOST,
						C_READ_HEADER,
						C_FLUSH_HEADER,
						C_FLUSH_FIFO,
						C_FLUSH_TLAST,
						C_FLUSH_FIFO_WAIT_EMPTY,
						COMPRESS_IDLE_FINISHED_C_ALL
						);
signal cur_state     : states;
signal next_state    : states;



signal reg_THRESHOLD		:  std_logic_vector(7 downto 0);
signal reg_BLOCKSIZE		:  std_logic_vector(31 downto 0) := (others => '0');
signal reg_FILESIZE 		: std_logic_vector(31 downto 0) := (others => '0');

signal U_DATAIN_reg				: std_logic_vector(31 downto 0):= (others => '0');



-- used for checking purposes if the uncompressed file almost reach 0
signal counter_BLOCKSIZE 	: std_logic_vector(31 downto 0) := (others => '0');

-- used for counting compressed file
signal counter_COMPRESSED 	: std_logic_vector(31 downto 0) := (others => '0');

signal FINISHED_C_all	:  STD_LOGIC := '0';

signal FIFO_INPUT_full		:  std_logic;
signal FIFO_INPUT_empty		:  std_logic;
signal FIFO_OUTPUT_full		:  std_logic;
signal FIFO_OUTPUT_empty	:  std_logic;

signal XMATCH_rd_en				: std_logic := '0';
signal XMATCH_din					: std_logic_vector(31 downto 0);
signal XMATCH_wr_en				: std_logic := '0';
signal XMATCH_dout				: std_logic_vector(31 downto 0);

signal FIFO_OUTPUT_rst			: std_logic := '1';
signal FIFO_OUTPUT_wr_en		: std_logic := '0';
signal FIFO_OUTPUT_rd_en		: std_logic := '0';
signal FIFO_OUTPUT_din			: std_logic_vector(31 downto 0);
signal FIFO_OUTPUT_dout			: std_logic_vector(31 downto 0);

signal FIFO_INPUT_rst			: std_logic := '1';
signal FIFO_INPUT_rd_en			: std_logic := '0';
signal FIFO_INPUT_din			: std_logic_vector(31 downto 0);
signal FIFO_INPUT_wr_en			: std_logic := '0';
signal FIFO_INPUT_dout			: std_logic_vector(31 downto 0);

signal empty_d1 : std_logic;
signal empty_d2 : std_logic;

signal addr_hdr_ptr				: STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');
signal addr_hdr_ptr_next		: STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');
signal wea_hdr						: STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
signal addr_hdr					: STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');
signal din_hdr						: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal dout_hdr					: STD_LOGIC_VECTOR(31 DOWNTO 0);

signal count_int 					: std_logic_vector(31 downto 0) := x"00000000";

signal reg_CHUNKSIZE				: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal reg_CHUNKSIZE_COUNT		: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal reg_CHUNKSIZE_COUNT_next : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal PAD_ZERO					: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

signal TOTAL_COMPRESSED_SIZE	: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal TOTAL_COMPRESSED_SIZE_n: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

signal status_FIFO				: std_logic_vector(3 downto 0):= (others => '0');

signal status_UC					: std_logic_vector(5 downto 0):= (others => '0');
signal bitvec_xmatch 			: bit_vector(5 downto 0);
signal stdvec_xmatch 			: std_logic_vector(5 downto 0);

signal WAIT_CU_std_lgc			: std_logic;
signal WAIT_CC_std_lgc			: std_logic;

signal FI_empty					: std_logic;

signal FI_overflow				: std_logic;
signal FI_underflow				: std_logic;
signal FO_overflow				: std_logic;
signal FO_underflow				: std_logic;
signal status_overflow			: std_logic_vector(3 downto 0);

begin

XMATCH_C_STAT <= "0000000" & FINISHED_C_all & status_FIFO & status_UC & reg_CHUNKSIZE(13 downto 0);
XMATCH_C_SIZE <= '0' & WAIT_CU_std_lgc & WAIT_CC_std_lgc & status_overflow & TOTAL_COMPRESSED_SIZE(24 downto 0);

bitvec_xmatch <=  FINISHED_C_bit 		-- 5
		& COMPRESSING_bit 		-- 4
		& C_DATA_VALID_bit		-- 3
		& BUS_REQ_CC_bit 		-- 2
		& BUS_REQ_CU_bit 		-- 1
		& INTR_REQ_bit;			-- 0
stdvec_xmatch <= to_stdlogicvector(bitvec_xmatch);

status_overflow <= FI_overflow & FI_underflow & FO_overflow & FO_underflow;

status_FIFO <= FIFO_INPUT_full & FIFO_INPUT_empty & FIFO_OUTPUT_full & FIFO_OUTPUT_empty;

status_UC	<=   (stdvec_xmatch(5))
					& (stdvec_xmatch(4))
					& (stdvec_xmatch(3))
					& (stdvec_xmatch(2))
					& (stdvec_xmatch(1))
					& (stdvec_xmatch(0));

FIFO_INPUT_wr_en		<= S_AXIS_TVALID;
FIFO_INPUT_din			<= S_AXIS_TDATA;
S_AXIS_TREADY			<= not FIFO_INPUT_full;

FIFO_INPUT_rd_en		<= XMATCH_rd_en;
XMATCH_din				<= FIFO_INPUT_dout;

FIFO_OUTPUT_wr_en 	<= XMATCH_wr_en;
FIFO_OUTPUT_din		<= XMATCH_dout;

FIFO_OUTPUT_rd_en		<= M_AXIS_TREADY and (not empty_d2);
M_AXIS_TDATA 			<= FIFO_OUTPUT_dout;
M_AXIS_TLAST			<= FINISHED_C_all;

FIFO_INPUT_rst			<= not XMATCH_RSTN;
FIFO_OUTPUT_rst		<= not XMATCH_RSTN;

  process (XMATCH_CLK) is
  begin
    if XMATCH_CLK'event and XMATCH_CLK = '1' then
      if(XMATCH_RSTN = '0') then
        empty_d1 <= '1';
        empty_d2 <= '1';
      else
        empty_d1 <= FIFO_OUTPUT_empty;
        empty_d2 <= empty_d1;
		  M_AXIS_TVALID <= not(FIFO_OUTPUT_empty or empty_d2);
      end if;
    end if;
  end process;

  process (XMATCH_CLK) is
  begin
    if XMATCH_CLK'event and XMATCH_CLK = '1' then
      if(XMATCH_RSTN = '0') then
        FI_empty <= '1';
      else
        FI_empty <= FIFO_INPUT_empty;
      end if;
    end if;
  end process;

FIFO_HOST2CODMU : fifo_async
  PORT MAP (
    rst 			=> FIFO_INPUT_rst,
	 wr_clk 		=> XMATCH_CLK,
	 rd_clk 		=> XMATCH_CLK,
    din 			=> FIFO_INPUT_din,
    wr_en 		=> FIFO_INPUT_wr_en,
    rd_en 		=> FIFO_INPUT_rd_en,
    dout 		=> FIFO_INPUT_dout,
    full 		=> FIFO_INPUT_full,
    overflow 	=> FI_overflow,
    empty 		=> FIFO_INPUT_empty,
    underflow 	=> FI_underflow
  );

FIFO_CODMU2HOST : fifo_async
  PORT MAP (
    rst 			=> FIFO_OUTPUT_rst,
	 wr_clk 		=> XMATCH_CLK,
	 rd_clk 		=> XMATCH_CLK,
    din 			=> FIFO_OUTPUT_din,
    wr_en 		=> FIFO_OUTPUT_wr_en,
    rd_en 		=> FIFO_OUTPUT_rd_en,
    dout 		=> FIFO_OUTPUT_dout,
    full 		=> FIFO_OUTPUT_full,
    overflow	=> FO_overflow,
    empty	 	=> FIFO_OUTPUT_empty,
    underflow 	=> FO_underflow
  );

U_DATAIN_bit <= to_bitvector (U_DATAIN_reg);

U_DATAIN_PROCESS : process (XMATCH_CLK, XMATCH_rd_en)
begin
if (XMATCH_RSTN = '0') then
	U_DATAIN_reg <= x"00000000";
elsif ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
	if (XMATCH_rd_en = '1') then
		U_DATAIN_reg <= XMATCH_din;
	else
		U_DATAIN_reg <= U_DATAIN_reg;
	end if;
end if;
end process U_DATAIN_PROCESS;

BUS_ACK_CU_PROCESS: process (XMATCH_CLK) is
begin
if ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
	if (BUS_REQ_CU_bit = '1') then
      BUS_ACK_CU_bit		<= '1';
	else
      BUS_ACK_CU_bit		<= '0';
  end if;
 end if;
end process BUS_ACK_CU_PROCESS;

BUS_ACK_CC_PROCESS: process (XMATCH_CLK) is
begin
if ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
	if (BUS_REQ_CC_bit = '1') then
      BUS_ACK_CC_bit		<= '1';
	else
      BUS_ACK_CC_bit		<= '0';
  end if;
 end if;
end process BUS_ACK_CC_PROCESS;

WAIT_CC_PROCESS: process (FIFO_OUTPUT_full) is
begin
		if (FIFO_OUTPUT_full = '0') then
			WAIT_CC_bit		<= '1';
			WAIT_CC_std_lgc	<= '1';
		else
			WAIT_CC_bit		<= '0';
			WAIT_CC_std_lgc	<= '0';
		end if;
end process WAIT_CC_PROCESS;
	
-- This counter is used to count for block size declaration
COUNTER_BLOCKSIZE_PROCESS: process (XMATCH_CLK, cur_state, XMATCH_rd_en, U_DATAIN_reg) is
begin
	if ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
		if XMATCH_rd_en = '1' and U_DATAIN_reg /= x"00000000" then
			counter_BLOCKSIZE <= counter_BLOCKSIZE - 4;
		elsif (cur_state = COMPRESS_INIT_BLOCKSIZE) then -- if either Compress or Decompress
			counter_BLOCKSIZE <= reg_BLOCKSIZE; -- blocksize
		else
			counter_BLOCKSIZE <= counter_BLOCKSIZE;
		end if;
	else
		counter_BLOCKSIZE <= counter_BLOCKSIZE;
	end if;
end process COUNTER_BLOCKSIZE_PROCESS;

-- This counter is used to count the compressed file
COUNTER_COMPRESSED_PROCESS: process (XMATCH_CLK, cur_state, XMATCH_wr_en) is
begin
	if ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
		if XMATCH_wr_en = '1' then
			counter_COMPRESSED <= counter_COMPRESSED + 4;
		elsif (cur_state = COMPRESS_START) then
			counter_COMPRESSED <= x"00000000";
		else
			counter_COMPRESSED <= counter_COMPRESSED;
		end if;
	else
		counter_COMPRESSED <= counter_COMPRESSED;
	end if;
end process COUNTER_COMPRESSED_PROCESS;

-- State machine sequence (synchronous process)
SM_SEQ: process (XMATCH_CLK, XMATCH_RSTN, next_state,
						reg_CHUNKSIZE_COUNT_next, TOTAL_COMPRESSED_SIZE_n, addr_hdr_ptr_next) is
begin
  if XMATCH_CLK'event and XMATCH_CLK = '1' then
    if XMATCH_RSTN = '0' then
      cur_state 	<= IDLE;
		reg_CHUNKSIZE_COUNT <= (others => '0');
		TOTAL_COMPRESSED_SIZE <= (others => '0');
		addr_hdr_ptr <= (others => '0');
    else
      cur_state 	<= next_state;
		reg_CHUNKSIZE_COUNT <= reg_CHUNKSIZE_COUNT_next;
		TOTAL_COMPRESSED_SIZE <= TOTAL_COMPRESSED_SIZE_n;
		addr_hdr_ptr <= addr_hdr_ptr_next;
    end if;
  end if;
end process SM_SEQ;

-- State machine (combinatorial process)
SM_COMB: process (cur_state, XMATCH_CMD_UC, addr_hdr_ptr, U_DATAIN_reg,
						BUS_REQ_CU_bit, FINISHED_C_bit, addr_hdr, dout_hdr,
						FIFO_INPUT_dout, FIFO_INPUT_full, FIFO_INPUT_empty, FI_empty,
						FIFO_OUTPUT_dout, FIFO_OUTPUT_full, FIFO_OUTPUT_empty,
						INTR_REQ_bit, XMATCH_rd_en, TOTAL_COMPRESSED_SIZE,
						counter_BLOCKSIZE,
						empty_d1, reg_CHUNKSIZE_COUNT) is
begin
next_state			<= cur_state;		-- default remain current state
CS_bit				<= '1';
RW_bit				<= '1';
ADDRESS_bit			<= "0011"; 			-- "0011" is an unused Address which not be used by Compressor/Decompressor
CONTROL_std			<= x"00000000";
WAIT_CU_bit 		<= '0';
WAIT_CU_std_lgc	<= '0';
INTR_ACK_bit 		<= '1';
XMATCH_rd_en		<= '0';

FINISHED_C_all 	<= '0';
reg_CHUNKSIZE_COUNT_next	<= reg_CHUNKSIZE_COUNT;
TOTAL_COMPRESSED_SIZE_n <= TOTAL_COMPRESSED_SIZE;
wea_hdr				<= "0";
din_hdr				<= (others => '0');
addr_hdr				<= (others => '0');
addr_hdr_ptr_next	<= addr_hdr_ptr;

case cur_state is

	when IDLE =>
		case (XMATCH_CMD_UC(31 downto 28)) is
			when "1101" => next_state <=   COMPRESS_START;
			when others => next_state <= IDLE;
		end case;

	when COMPRESS_START =>

		
		reg_THRESHOLD <= XMATCH_CMD_UC(23 downto 16);
		next_state <=   COMPRESS_START1;

	when COMPRESS_START1 =>
		reg_BLOCKSIZE <= XMATCH_CMD_BS;
		next_state <=   COMPRESS_START2;

	when COMPRESS_START2 =>
		reg_FILESIZE <= XMATCH_CMD_FS;
		next_state <=   COMPRESS_START3;

	when COMPRESS_START3 =>
		TOTAL_COMPRESSED_SIZE_n <= TOTAL_COMPRESSED_SIZE + 3;
		next_state <=   COMPRESS_SAVE_CHUNKSIZE;

	when COMPRESS_SAVE_CHUNKSIZE =>
		TOTAL_COMPRESSED_SIZE_n <= TOTAL_COMPRESSED_SIZE + reg_CHUNKSIZE;
		reg_CHUNKSIZE_COUNT_next <= reg_CHUNKSIZE;
		next_state <=   C_RESERVE_HEADER; -- skip to C_RESERVE_HEADER

	when C_RESERVE_HEADER =>
		if (reg_CHUNKSIZE_COUNT = x"00000000") then
			reg_CHUNKSIZE_COUNT_next <= reg_CHUNKSIZE;
			addr_hdr_ptr_next <= (others => '0'); --XXXXXXXXXXXXXXXXXXXXXXXXX
			next_state <= COMPRESS_START4;
		else
			reg_CHUNKSIZE_COUNT_next <= reg_CHUNKSIZE_COUNT - 1;
			next_state <= C_RESERVE_HEADER;
		end if;

	when COMPRESS_START4 =>
		if FIFO_INPUT_empty = '0' then
			XMATCH_rd_en 		<= '1';
			next_state <=   COMPRESS_START5;
		end if;

	when COMPRESS_START5 =>
		XMATCH_rd_en 		<= '1';
		next_state <=   COMPRESS_INIT_BLOCKSIZE;

	when COMPRESS_INIT_BLOCKSIZE =>
		RW_bit							<= '0';
		CS_bit							<= '0';
		ADDRESS_bit						<= "1101";
		CONTROL_std						<= reg_BLOCKSIZE;
		next_state 						<= COMPRESS_INIT_COMMAND;

	when COMPRESS_INIT_COMMAND =>
		RW_bit							<= '0';
		CS_bit							<= '0';
		ADDRESS_bit						<= "1100";
		CONTROL_std						<= "0000000000000000" & "0100" & reg_THRESHOLD & "1000"; -- bit 3 indicates (0) test mode or (1) full-duplex mode
		next_state 						<= COMPRESS_WAIT;

	-- Compression wait if bus request CU is ready, and the FIFO of CoDMU is not empty (has data)
	when COMPRESS_WAIT =>
		if BUS_REQ_CU_bit = '0' and FIFO_INPUT_empty = '0' then
			next_state 			<= COMPRESS_WAIT_BUS_ACK_CU;
		else
			next_state 			<= COMPRESS_WAIT;
		end if;

	-- Wait for 1 clock cycle of Bus Ack CU
	when COMPRESS_WAIT_BUS_ACK_CU =>
		next_state 			<= COMPRESS_SEND_DATA;

	-- Send data from FIFO to Xmatch
	when COMPRESS_SEND_DATA =>
		WAIT_CU_bit <= '1';
		WAIT_CU_std_lgc <= '1';
		if counter_BLOCKSIZE = x"0000" then
			next_state <= COMPRESS_WAIT_REQ_CU;
		elsif BUS_REQ_CU_bit = '1' then
			WAIT_CU_bit <= '0';
			WAIT_CU_std_lgc <= '0';
			next_state <= COMPRESS_WAIT_REQ_CU;
--		elsif FIFO_INPUT_empty = '1' then --XXXXXXXXXXXXXXXXXXXXXXXXX
--			next_state <= COMPRESS_WAIT_UNTIL_NOT_EMPTY;
		elsif BUS_REQ_CU_bit = '0' and FI_empty = '0' then --XXXXXXXXXXXXXXXXXXXXXXXXX
			XMATCH_rd_en <= '1';
			next_state <= COMPRESS_SEND_DATA;
--		elsif FIFO_INPUT_empty = '1' then --XXXXXXXXXXXXXXXXXXXXXXXXX
--			next_state <= COMPRESS_WAIT_UNTIL_NOT_EMPTY;
		else --XXXXXXXXXXXXXXXXXXXXXXXXX this might trigger an error, watch this
			next_state <= COMPRESS_SEND_DATA;
		end if;

	when COMPRESS_WAIT_UNTIL_NOT_EMPTY =>
		if FIFO_INPUT_empty = '0' then
			next_state <= COMPRESS_SEND_DATA;
		else
			next_state <= COMPRESS_WAIT_UNTIL_NOT_EMPTY;
		end if;

	-- Wait if Bus Request CU is availabe (0) again
	when COMPRESS_WAIT_REQ_CU =>
		if BUS_REQ_CU_bit = '0' then
			next_state 			<= COMPRESS_WAIT_CU_SEND;
		elsif FINISHED_C_bit = '0' then
			reg_CHUNKSIZE_COUNT_next <= reg_CHUNKSIZE_COUNT - 1;
			next_state 			<= COMPRESS_WAIT_INTERRUPT_REQUEST;
		else
			next_state 			<= COMPRESS_WAIT_REQ_CU;
		end if;

	-- Read the first data goes out before read from FIFO again
	when COMPRESS_WAIT_CU_SEND =>
		next_state 	<= COMPRESS_SEND_DATA;

	when COMPRESS_WAIT_INTERRUPT_REQUEST =>
		if INTR_REQ_bit = '0' then
			INTR_ACK_bit <= '0';
			next_state 		<= COMPRESS_SAVE_COMPRESSED_CHUNK_SIZE;
		else
			next_state 		<= COMPRESS_WAIT_INTERRUPT_REQUEST;
		end if;

	when COMPRESS_SAVE_COMPRESSED_CHUNK_SIZE =>
		wea_hdr			<= "1";
		din_hdr			<= count_int;
		addr_hdr			<= addr_hdr_ptr;
		addr_hdr_ptr_next	<= addr_hdr_ptr + 1;
		TOTAL_COMPRESSED_SIZE_n <= TOTAL_COMPRESSED_SIZE + count_int;
		next_state <= COMPRESS_WAIT_NEXT_PACKET;

	when COMPRESS_WAIT_NEXT_PACKET =>
		if (reg_CHUNKSIZE_COUNT = x"00000000") then -- check if any packet left
			addr_hdr_ptr_next	<= (others => '0');
			reg_CHUNKSIZE_COUNT_next <= reg_CHUNKSIZE;
			next_state <= COMPRESS_WAIT_EMPTY_HOST;
		else
			--next_state <= COMPRESS_INIT_BLOCKSIZE; -- it will automatically starts Compressor Mode because there is still data available
			next_state <= COMPRESS_START_WAIT_IF_EMPTY;
		end if;

	when COMPRESS_START_WAIT_IF_EMPTY =>
		if FIFO_INPUT_empty = '1' then
			next_state <=   COMPRESS_START4; --XXXXXXXXXXXXXXXXXXXXXXXXX
		else
			next_state <=   COMPRESS_INIT_BLOCKSIZE; --XXXXXXXXXXXXXXXXXXXXXXXXX
		end if;

	when COMPRESS_WAIT_EMPTY_HOST =>
		if (FIFO_OUTPUT_empty = '1') then
			addr_hdr			<= addr_hdr_ptr;
			next_state 		<= C_READ_HEADER;
		end if;

	when C_READ_HEADER =>
		addr_hdr_ptr_next	<= addr_hdr_ptr + 1;
		next_state 		<= C_FLUSH_HEADER;

	when C_FLUSH_HEADER =>
		addr_hdr_ptr_next	<= addr_hdr_ptr + 1;
		if (reg_CHUNKSIZE_COUNT = x"00000000") then
			next_state <= C_FLUSH_FIFO;
		else
			addr_hdr			<= addr_hdr_ptr;
			reg_CHUNKSIZE_COUNT_next <= reg_CHUNKSIZE_COUNT - 1;
			next_state <= C_FLUSH_HEADER;
		end if;

	when C_FLUSH_FIFO =>
		if (empty_d1 = '0') then
			next_state <= C_FLUSH_FIFO_WAIT_EMPTY;
		else
			next_state <= C_FLUSH_FIFO;
		end if;

	when C_FLUSH_TLAST =>
		next_state <= C_FLUSH_FIFO_WAIT_EMPTY;

	when C_FLUSH_FIFO_WAIT_EMPTY =>
		if (FIFO_OUTPUT_empty = '1') then
			FINISHED_C_all <= '1';
			next_state <= COMPRESS_IDLE_FINISHED_C_ALL;
		else
			next_state <= C_FLUSH_FIFO_WAIT_EMPTY;
		end if;

	when COMPRESS_IDLE_FINISHED_C_ALL =>
		FINISHED_C_all <= '1';
		if (XMATCH_CMD_UC(31 downto 28) = "0000") then
			next_state <= IDLE;
		end if;

	when others =>

  end case;

end process SM_COMB;

-- write compressed/decompressed data to write_buffer
write_C_D_buffer: process (XMATCH_CLK, C_DATA_VALID_bit, cur_state, M_AXIS_TREADY) is
begin
	if (XMATCH_CLK'event) and (XMATCH_CLK = '1') then
		if (M_AXIS_TREADY = '1') then
			if C_DATA_VALID_bit = '0' then
			XMATCH_wr_en <= '1';
			XMATCH_dout		<= C_DATAOUT_std;
			elsif cur_state = C_RESERVE_HEADER then
			XMATCH_wr_en <= '1';
			XMATCH_dout		<= x"00000000";
			elsif cur_state = COMPRESS_SAVE_CHUNKSIZE then
			XMATCH_wr_en <= '1';
			XMATCH_dout		<= x"00000000";
			elsif cur_state = COMPRESS_START3 then
			XMATCH_wr_en <= '1';
			XMATCH_dout		<= x"00000000";
			elsif cur_state = C_FLUSH_HEADER then
			XMATCH_wr_en 	<= '1';
			XMATCH_dout		<= dout_hdr;
			else
			XMATCH_wr_en <= '0';
			XMATCH_dout		<= x"00000000";
			end if;
		else
			XMATCH_wr_en <= '0';
			XMATCH_dout		<= x"00000000";
		end if;
	end if;
end process write_C_D_buffer;

counter_chunk_process1 : process (XMATCH_CLK, cur_state, C_DATA_VALID_bit)
begin
if (cur_state = COMPRESS_INIT_BLOCKSIZE) then
	count_int <= (others => '0');
elsif ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
	if (C_DATA_VALID_bit = '0') then
		count_int <= count_int + 1;
	else
		count_int <= count_int;
	end if;
end if;
end process counter_chunk_process1;

write_reg_CHUNKSIZE: process (XMATCH_CLK, cur_state) is
begin
	if XMATCH_RSTN = '0' then
		reg_CHUNKSIZE <= (others => '0');
	elsif XMATCH_CLK'event and XMATCH_CLK = '1' then
		if cur_state = COMPRESS_START3 then
			case (reg_BLOCKSIZE) is
				when x"00000200" =>
					reg_CHUNKSIZE <= PAD_ZERO(8 downto 0) & reg_FILESIZE(31 downto 9);
				when x"00000400" =>
					reg_CHUNKSIZE <= PAD_ZERO(9 downto 0) & reg_FILESIZE(31 downto 10);
				when x"00000800" =>
					reg_CHUNKSIZE <= PAD_ZERO(10 downto 0) & reg_FILESIZE(31 downto 11);
				when x"00001000" =>
					reg_CHUNKSIZE <= PAD_ZERO(11 downto 0) & reg_FILESIZE(31 downto 12);
				when x"00002000" =>
					reg_CHUNKSIZE <= PAD_ZERO(12 downto 0) & reg_FILESIZE(31 downto 13);
				when x"00004000" =>
					reg_CHUNKSIZE <= PAD_ZERO(13 downto 0) & reg_FILESIZE(31 downto 14);
				when x"00008000" =>
					reg_CHUNKSIZE <= PAD_ZERO(14 downto 0) & reg_FILESIZE(31 downto 15);
				when x"00010000" =>
					reg_CHUNKSIZE <= PAD_ZERO(15 downto 0) & reg_FILESIZE(31 downto 16);
				when others =>
					reg_CHUNKSIZE <= reg_CHUNKSIZE;
			end case;
		else
			reg_CHUNKSIZE <= reg_CHUNKSIZE;
		end if;
	end if;
end process write_reg_CHUNKSIZE;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- BRAM instantiation
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

temporary_bram : ram_header
  PORT MAP (
    clka => XMATCH_CLK,
    wea => wea_hdr,
    addra => addr_hdr,
    dina => din_hdr,
    douta => dout_hdr
  );

end Behavioral;
