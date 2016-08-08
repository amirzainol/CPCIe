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
-- Entity: 			xmp_ctlr_d.vhd
-- Version:			1.0
-- Description: This file is a controller for decompressor
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

entity xmp_ctlr_d is
port (
		S_AXIS_TREADY						: OUT	STD_LOGIC;
		S_AXIS_TDATA						: IN  STD_LOGIC_VECTOR(31 downto 0);
		S_AXIS_TLAST						: IN  STD_LOGIC;
		S_AXIS_TVALID						: IN  STD_LOGIC;
		M_AXIS_TVALID						: OUT	STD_LOGIC;
		M_AXIS_TDATA						: OUT	STD_LOGIC_VECTOR(31 downto 0);
		M_AXIS_TREADY						: IN  STD_LOGIC;
		M_AXIS_TLAST						: OUT	STD_LOGIC;
		XMATCH_CLK : IN STD_LOGIC;
		XMATCH_RSTN	: IN  STD_LOGIC;
		XMATCH_CMD_CD : IN STD_LOGIC_VECTOR(31 downto 0);
		CLR_XMATCH_D : out STD_LOGIC;
		CS_bit : out bit;
		RW_bit : out bit;
		ADDRESS_bit : out bit_vector(3 downto 0);
		CONTROL_std : out std_logic_vector(31 downto 0);
		BUS_ACK_DC_bit : out bit;
		BUS_ACK_DU_bit : out bit;
		WAIT_DU_bit : out bit;
		WAIT_DC_bit : out bit;
		C_DATAIN_bit : out bit_vector(31 downto 0);
		U_DATAOUT_std : in std_logic_vector(31 downto 0);
		FINISHED_D_bit : in bit;
		DECOMPRESSING_bit : in bit;
		U_DATA_VALID_bit : in bit;
		INTR_REQ_bit : in bit;
		INTR_ACK_bit : out bit;
		BUS_REQ_DC_bit : in bit;
		BUS_REQ_DU_bit : in bit;
	XMATCH_D_SIZE						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_D_STAT						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
end xmp_ctlr_d;

architecture Behavioral of xmp_ctlr_d is

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
						DECOMPRESS_START,
						DECOMPRESS_START1,
						DECOMPRESS_START3,
						DECOMPRESS_START4,
						DECOMPRESS_START5,
						DECOMPRESS_START5a,
						D_READ_TOTAL_CHUNKS,
						D_READ_TOTAL_CHUNKS_DELAY,
						D_WRITE_CHUNKS_X,
						DECOMPRESS_START6x0,
						DECOMPRESS_START6x1,
						DECOMPRESS_START6,
						DECOMPRESS_START6a,
						DECOMPRESS_START6b,
						DECOMPRESS_INIT_BLOCKSIZE,
						DECOMPRESS_INIT_COMMAND,
						DECOMPRESS_WAIT,
						DECOMPRESS_WAIT_BUS_ACK_DC,
						DECOMPRESS_SEND_DATA,
						DECOMPRESS_WAIT_FI_EMPTY,
						DECOMPRESS_WAIT_REQ_DC,
						DECOMPRESS_WAIT_DC_SEND,
						DECOMPRESS_WAIT_REQ_DC_WAITDC,
						DECOMPRESS_WAIT_INTERRUPT_REQUEST,
						DECOMPRESS_WAIT_NEXT_PACKET,
						DECOMPRESS_WAIT_EMPTY_HOST,
						D_READ_TAIL,
						D_FLUSH_TAIL,
						DECOMPRESS_IDLE_FINISHED_D_ALL,
						END_STATE
						);
signal cur_state     : states;
signal next_state    : states;

signal C_DATAIN_reg				: std_logic_vector(31 downto 0):= (others => '0');

signal reg_ADDRESS		:  std_logic_vector(3 downto 0);
signal reg_CONTROL		:  std_logic_vector(3 downto 0);
signal reg_THRESHOLD		:  std_logic_vector(7 downto 0);
signal reg_BLOCKSIZE		:  std_logic_vector(31 downto 0) := (others => '0');
signal reg_FILESIZE 		: std_logic_vector(31 downto 0) := (others => '0');
signal reg_BLOCKSIZE_n	: std_logic_vector(31 downto 0) := (others => '0');

signal clr_CODMU			:  STD_LOGIC;

--signal CLR_XMATCH_D		:  STD_LOGIC := '1';

signal counter_BLOCKSIZE 	: std_logic_vector(31 downto 0) := (others => '0'); -- used for checking purposes if the uncompressed file almost reach 0
signal counter_COMPRESSED 	: std_logic_vector(31 downto 0) := (others => '0'); -- used for counting compressed file

signal FINISHED_D_all	:  STD_LOGIC := '0';

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
--signal addr_hdr_next				: STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');
signal din_hdr						: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal dout_hdr					: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal select_counter 			: STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');

signal count_int 					: std_logic_vector(31 downto 0) := x"00000000";
signal count_int_next 			: std_logic_vector(31 downto 0) := x"00000000";
signal total_counter_CHUNK		: std_logic_vector(31 downto 0) := x"00000000";
signal filesize_DECOMPRESS		: std_logic_vector(31 downto 0) := (others => '0');

signal status_FIFO				: std_logic_vector(3 downto 0):= (others => '0');
signal status_CD					: std_logic_vector(5 downto 0):= (others => '0');
signal bitvec_xmatch 			: bit_vector(5 downto 0);
signal stdvec_xmatch 			: std_logic_vector(5 downto 0);

signal WAIT_DC_std_lgc			: std_logic;
signal WAIT_DU_std_lgc			: std_logic;

signal FI_overflow				: std_logic;
signal FI_underflow				: std_logic;
signal FO_overflow				: std_logic;
signal FO_underflow				: std_logic;
signal status_overflow			: std_logic_vector(3 downto 0);

signal FI_empty					: std_logic;

begin

XMATCH_D_STAT <= "0000000" & FINISHED_D_all & status_FIFO & WAIT_DC_std_lgc & WAIT_DU_std_lgc & status_CD & status_overflow & count_int(7 downto 0);
--XMATCH_D_STAT <= "0000000" & FINISHED_D_all & status_FIFO & status_CD & count_int(13 downto 0);
XMATCH_D_SIZE <= C_DATAIN_reg;

bitvec_xmatch <= 	  DECOMPRESSING_bit 		-- 5
						& BUS_REQ_DC_bit 			-- 4
						& BUS_REQ_DU_bit 			-- 3
						& INTR_REQ_bit				-- 2
						& U_DATA_VALID_bit		-- 1
						& FINISHED_D_bit;			-- 0
stdvec_xmatch <= to_stdlogicvector(bitvec_xmatch);

status_overflow <= FI_overflow & FI_underflow & FO_overflow & FO_underflow;

status_FIFO <= FIFO_INPUT_full & FIFO_INPUT_empty & FIFO_OUTPUT_full & FIFO_OUTPUT_empty;

status_CD	<=   not (stdvec_xmatch(5))
					& not (stdvec_xmatch(4))
					& not (stdvec_xmatch(3))
					& not (stdvec_xmatch(2))
					& not (stdvec_xmatch(1))
					& not (stdvec_xmatch(0));

FIFO_INPUT_wr_en		<= S_AXIS_TVALID;
FIFO_INPUT_din			<= S_AXIS_TDATA;
S_AXIS_TREADY			<= not FIFO_INPUT_full;

FIFO_INPUT_rd_en		<= XMATCH_rd_en;
XMATCH_din				<= FIFO_INPUT_dout;

FIFO_OUTPUT_wr_en 	<= XMATCH_wr_en;
FIFO_OUTPUT_din		<= XMATCH_dout;

FIFO_OUTPUT_rd_en		<= (M_AXIS_TREADY and (not empty_d2));
M_AXIS_TLAST			<= FINISHED_D_all;
M_AXIS_TDATA 			<= FIFO_OUTPUT_dout;

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


C_DATAIN_bit <= to_bitvector (C_DATAIN_reg);

C_DATAIN_PROCESS : process (XMATCH_CLK, XMATCH_rd_en)
begin
if (XMATCH_RSTN = '0') then
	C_DATAIN_reg <= x"00000000";
elsif ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
	if (XMATCH_rd_en = '1') then
		C_DATAIN_reg <= XMATCH_din;
	else
		C_DATAIN_reg <= C_DATAIN_reg;
	end if;
end if;
end process C_DATAIN_PROCESS;

BUS_ACK_DC_PROCESS: process (XMATCH_CLK, clr_CODMU) is
begin
if (clr_CODMU = '0') then
	BUS_ACK_DC_bit <= '1';
elsif ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
	if (BUS_REQ_DC_bit = '1') then
      BUS_ACK_DC_bit		<= '1';
	else
      BUS_ACK_DC_bit		<= '0';
  end if;
 end if;
end process BUS_ACK_DC_PROCESS;

BUS_ACK_DU_PROCESS: process (XMATCH_CLK, clr_CODMU) is
begin
if (clr_CODMU = '0') then
	BUS_ACK_DU_bit <= '1';
elsif ((XMATCH_CLK'event) and (XMATCH_CLK = '1')) then
	if (BUS_REQ_DU_bit = '1') then
      BUS_ACK_DU_bit		<= '1';
	else
      BUS_ACK_DU_bit		<= '0';
  end if;
 end if;
end process BUS_ACK_DU_PROCESS;

WAIT_DU_PROCESS: process (FIFO_OUTPUT_full) is
begin
		if (FIFO_OUTPUT_full = '0') then
			WAIT_DU_bit		<= '1';
			WAIT_DU_std_lgc <= '1';
		else
			WAIT_DU_bit		<= '0';
			WAIT_DU_std_lgc <= '0';
		end if;
end process WAIT_DU_PROCESS;

-- State machine sequence (synchronous process)
SM_SEQ: process (XMATCH_CLK, XMATCH_RSTN, next_state, count_int_next, addr_hdr_ptr_next, reg_BLOCKSIZE_n) is
begin
  if XMATCH_CLK'event and XMATCH_CLK = '1' then
    if XMATCH_RSTN = '0' then
      cur_state 	<= IDLE;
		count_int <= (others => '0');
		addr_hdr_ptr <= (others => '0');
		reg_BLOCKSIZE <= (others => '0');
    else
      cur_state 	<= next_state;
		count_int <= count_int_next;
		addr_hdr_ptr <= addr_hdr_ptr_next;
		reg_BLOCKSIZE <= reg_BLOCKSIZE_n;
    end if;
  end if;
end process SM_SEQ;

-- State machine (combinatorial process)
SM_COMB: process (cur_state, XMATCH_CMD_CD, addr_hdr_ptr, C_DATAIN_reg,
						BUS_REQ_DC_bit, FINISHED_D_bit, addr_hdr, dout_hdr,
						FIFO_INPUT_dout, FIFO_INPUT_full, FIFO_INPUT_empty,
						FIFO_OUTPUT_dout, FIFO_OUTPUT_full, FIFO_OUTPUT_empty,
						INTR_REQ_bit, XMATCH_rd_en, reg_BLOCKSIZE, FI_empty,
						filesize_DECOMPRESS, count_int, total_counter_CHUNK) is

begin

next_state			<= cur_state;		-- default remain current state
CS_bit				<= '1';
RW_bit				<= '1';
ADDRESS_bit			<= "0011"; 			-- "0011" is an unused Address which not be used by Compressor/Decompressor
CONTROL_std			<= x"00000000";
WAIT_DC_bit 		<= '0';
WAIT_DC_std_lgc	<= '0';
INTR_ACK_bit 		<= '1';
XMATCH_rd_en		<= '0';
clr_CODMU			<= '1';
CLR_XMATCH_D		<= '1';
FINISHED_D_all 	<= '0';
count_int_next		<= count_int;
addr_hdr_ptr_next	<= addr_hdr_ptr;
reg_BLOCKSIZE_n	<= reg_BLOCKSIZE;
wea_hdr				<= "0";
din_hdr				<= (others => '0');
addr_hdr				<= (others => '0');

case cur_state is

	when IDLE =>
		if (XMATCH_CMD_CD(31 downto 28) = "1001") then
			next_state <= DECOMPRESS_START;
		end if;

	when DECOMPRESS_START =>
--		CLR_XMATCH_D <= '0';
		next_state <=   DECOMPRESS_START1;

	when DECOMPRESS_START1 =>
		reg_ADDRESS <= XMATCH_CMD_CD(31 downto 28);
		reg_CONTROL <= XMATCH_CMD_CD(27 downto 24);
		reg_THRESHOLD <= XMATCH_CMD_CD(23 downto 16);
		next_state <=   DECOMPRESS_START3; -- jump to DECOMPRESS_START5

	when DECOMPRESS_START3 =>
		if FIFO_INPUT_empty = '0' then
			next_state 			<= DECOMPRESS_START4;
		else
			next_state 			<= DECOMPRESS_START3;
		end if;

	when DECOMPRESS_START4 =>
		XMATCH_rd_en		<= '1'; -- FIFO without FWFT
		next_state 			<= DECOMPRESS_START5;

	when DECOMPRESS_START5 =>
		XMATCH_rd_en		<= '1';
		next_state 			<= DECOMPRESS_START5a;

	when DECOMPRESS_START5a =>
		XMATCH_rd_en		<= '1';
		reg_FILESIZE		<= C_DATAIN_reg;
		next_state 			<= D_READ_TOTAL_CHUNKS;

	when D_READ_TOTAL_CHUNKS =>
		reg_BLOCKSIZE_n	<= C_DATAIN_reg;
		XMATCH_rd_en		<= '1';
		next_state 			<= D_READ_TOTAL_CHUNKS_DELAY;

	when D_READ_TOTAL_CHUNKS_DELAY =>
		XMATCH_rd_en		<= '1';
		next_state 			<= D_WRITE_CHUNKS_X;

	when D_WRITE_CHUNKS_X =>
			wea_hdr			<= "1";
			addr_hdr			<= count_int(8 downto 0);
			din_hdr			<= C_DATAIN_reg;

				if count_int < total_counter_CHUNK then
					count_int_next <= count_int + 1;
				else --overflow
					count_int_next <= (others => '0');
				end if;

		if (count_int = total_counter_CHUNK) then
			next_state 			<= DECOMPRESS_START6x0;
		else
			XMATCH_rd_en	<= '1';
			next_state 			<= D_WRITE_CHUNKS_X;
		end if;

	when DECOMPRESS_START6x0 =>
		next_state 			<= DECOMPRESS_START6x1;

	when DECOMPRESS_START6x1 =>
		next_state 		<= DECOMPRESS_START6;

	when DECOMPRESS_START6 =>
		addr_hdr	<= addr_hdr_ptr; -- address header pointer

		XMATCH_rd_en	<= '1';
		next_state 		<= DECOMPRESS_START6a;

	when DECOMPRESS_START6a =>
		count_int_next 				<= dout_hdr;
		next_state 		<= DECOMPRESS_START6b;

	when DECOMPRESS_START6b =>
		next_state <=   DECOMPRESS_INIT_BLOCKSIZE;

	when DECOMPRESS_INIT_BLOCKSIZE =>
		addr_hdr_ptr_next				<= addr_hdr_ptr + 1;
		RW_bit							<= '0';
		CS_bit							<= '0';
		ADDRESS_bit						<= "1001";
		CONTROL_std						<= reg_BLOCKSIZE;
--		CONTROL_std						<= x"00000400";
		next_state 						<= DECOMPRESS_INIT_COMMAND;

	when DECOMPRESS_INIT_COMMAND =>
		RW_bit							<= '0';
		CS_bit							<= '0';
		ADDRESS_bit						<= "1000";
		--CONTROL_std						<= "0000000000000000" & "0100" & reg_THRESHOLD & "0000";
		CONTROL_std						<= "0000000000000000" & "0100" & "00001000" & "0000";
		next_state 						<= DECOMPRESS_WAIT;

	-- Decompression wait if bus request DC is ready, and the FIFO of CoDMU is not empty (has data)
	when DECOMPRESS_WAIT =>
--		if BUS_REQ_DC_bit = '0' and FIFO_INPUT_empty = '0' then
		if BUS_REQ_DC_bit = '0' then
			next_state 			<= DECOMPRESS_WAIT_BUS_ACK_DC;
		else
			next_state 			<= DECOMPRESS_WAIT;
		end if;

	-- Wait for 1 clock cycle of Bus Ack CU
	when DECOMPRESS_WAIT_BUS_ACK_DC =>
	         if count_int > 0 then
	            count_int_next <= count_int - 1;
	         else --underflow
	            count_int_next <= (others => '0');
	         end if;
		next_state 			<= DECOMPRESS_SEND_DATA;

	-- Send data from FIFO to Xmatch
	when DECOMPRESS_SEND_DATA =>
		if count_int = x"00000000" then -- if all compressed file has been loaded
			WAIT_DC_bit <= '1';
			WAIT_DC_std_lgc <= '1';
			next_state <= DECOMPRESS_WAIT_REQ_DC_WAITDC;
		elsif BUS_REQ_DC_bit = '1' then
			WAIT_DC_bit <= '0';
			WAIT_DC_std_lgc <= '0';
			next_state <= DECOMPRESS_WAIT_REQ_DC;
--		else
--	         if count_int > 0 then
--	            count_int_next <= count_int - 1;
--	         else --underflow
--	            count_int_next <= (others => '0');
--	         end if;
--			XMATCH_rd_en <= '1';
--			next_state <= DECOMPRESS_SEND_DATA;
		--elsif BUS_REQ_DC_bit = '0' and FIFO_INPUT_empty = '0' then --XXXXXXXXXXXXXXXXXXXXXXXXX
		elsif BUS_REQ_DC_bit = '0' and FI_empty = '0' then --XXXXXXXXXXXXXXXXXXXXXXXXX
			WAIT_DC_bit <= '1';
			WAIT_DC_std_lgc <= '1';
	         if count_int > 0 then
	            count_int_next <= count_int - 1;
	         else --underflow
	            count_int_next <= (others => '0');
	         end if;
			XMATCH_rd_en <= '1';
			next_state <= DECOMPRESS_SEND_DATA;
		else
			next_state <= DECOMPRESS_WAIT_FI_EMPTY;
		end if;

	when DECOMPRESS_WAIT_FI_EMPTY =>
			WAIT_DC_bit <= '0';
			WAIT_DC_std_lgc <= '0';
			if FI_empty = '0' then
				XMATCH_rd_en <= '1';
				next_state <= DECOMPRESS_SEND_DATA;
			else
				next_state <= DECOMPRESS_WAIT_FI_EMPTY;
			end if;

	-- Wait if Bus Request DC is availabe (0) again
	when DECOMPRESS_WAIT_REQ_DC =>
		if BUS_REQ_DC_bit = '0' then
			next_state 			<= DECOMPRESS_WAIT_DC_SEND;
		elsif FINISHED_D_bit = '0' then
			next_state 			<= DECOMPRESS_WAIT_INTERRUPT_REQUEST;
		else
			next_state 			<= DECOMPRESS_WAIT_REQ_DC;
		end if;

	-- Read the first data goes out before read from FIFO again
	when DECOMPRESS_WAIT_DC_SEND =>
		next_state 	<= DECOMPRESS_SEND_DATA;

	when DECOMPRESS_WAIT_REQ_DC_WAITDC =>
		if BUS_REQ_DC_bit = '1' then
			WAIT_DC_bit <= '0';
			WAIT_DC_std_lgc <= '0';
			next_state <= DECOMPRESS_WAIT_REQ_DC;
		else
			WAIT_DC_bit <= '1';
			WAIT_DC_std_lgc <= '1';
			next_state <= DECOMPRESS_WAIT_REQ_DC_WAITDC;
		end if;

	when DECOMPRESS_WAIT_INTERRUPT_REQUEST =>
		if INTR_REQ_bit = '0' then
			INTR_ACK_bit <= '0';
--			clr_CODMU		<= '0';
			next_state 		<= DECOMPRESS_WAIT_NEXT_PACKET;
		else
			next_state 		<= DECOMPRESS_WAIT_INTERRUPT_REQUEST;
		end if;

	when DECOMPRESS_WAIT_NEXT_PACKET =>
		if (total_counter_CHUNK = 0) then
			next_state <= DECOMPRESS_WAIT_EMPTY_HOST;
		else
			next_state <= DECOMPRESS_START6; -- it will automatically starts Decompressor Mode because there is still data available
		end if;

	when DECOMPRESS_WAIT_EMPTY_HOST =>
	count_int_next <= (others => '0');
		if (FIFO_OUTPUT_empty = '1') then
			if (filesize_DECOMPRESS = x"00000000") then
				FINISHED_D_all <= '1';
				next_state 		<= DECOMPRESS_IDLE_FINISHED_D_ALL;
			elsif (filesize_DECOMPRESS = x"00000002") then -- unfortunately we have to compare this, because of the delay
				next_state 		<= D_READ_TAIL;
			else
				next_state 		<= D_FLUSH_TAIL;
			end if;
		else
			next_state 		<= DECOMPRESS_WAIT_EMPTY_HOST;
		end if;

	when D_READ_TAIL =>
			next_state 		<= D_FLUSH_TAIL;

	when D_FLUSH_TAIL =>
				if count_int < total_counter_CHUNK then
					count_int_next <= count_int + 1;
				else --overflow
					count_int_next <= (others => '0');
				end if;

		if (filesize_DECOMPRESS < x"00000003") then
			next_state 		<= DECOMPRESS_IDLE_FINISHED_D_ALL;
		else
			next_state 		<= D_FLUSH_TAIL;
		end if;

	when DECOMPRESS_IDLE_FINISHED_D_ALL =>
		FINISHED_D_all <= '1';
		if (XMATCH_CMD_CD(31 downto 28) = "0000") then
			next_state <= IDLE;
		end if;

	when END_STATE =>

	when others =>

  end case;

end process SM_COMB;

-- write compressed/decompressed data to write_buffer
write_C_D_buffer: process (XMATCH_CLK, U_DATA_VALID_bit, cur_state, M_AXIS_TREADY) is
begin
	if (XMATCH_CLK'event) and (XMATCH_CLK = '1') then
		if (M_AXIS_TREADY = '1') then
			if U_DATA_VALID_bit = '0' then
			XMATCH_wr_en <= '1';
			XMATCH_dout		<= U_DATAOUT_std;
			elsif cur_state = D_READ_TAIL then
				XMATCH_wr_en 	<= '1';
				XMATCH_dout		<= XMATCH_din;
			elsif cur_state = D_FLUSH_TAIL then
				XMATCH_wr_en 	<= '1';
				XMATCH_dout		<= XMATCH_din;
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

--~~~~~~~~~~~~~~~~~~~~--
-- BRAM instantiation --
--~~~~~~~~~~~~~~~~~~~~--

temporary_bram : ram_header
  PORT MAP (
    clka => XMATCH_CLK,
    wea => wea_hdr,
    addra => addr_hdr,
    dina => din_hdr,
    douta => dout_hdr
  );

select_counter_process: process (cur_state) is
begin
		if (cur_state = D_READ_TOTAL_CHUNKS) then
			select_counter <= "00001000";
		elsif (cur_state = DECOMPRESS_WAIT_NEXT_PACKET) then
			select_counter <= "01000000";
		elsif (cur_state = DECOMPRESS_WAIT_EMPTY_HOST) then
			select_counter <= "10000000";
		else
			select_counter <= "00000000";
		end if;
end process select_counter_process;

counter_chunk_process : process (XMATCH_CLK, select_counter)
begin
	if XMATCH_RSTN = '0' then
		total_counter_CHUNK <= (others => '0');
	elsif XMATCH_CLK'event and XMATCH_CLK = '1' then
		case (select_counter) is
			when "10000000" =>
				total_counter_CHUNK <= filesize_DECOMPRESS;
--				count_int <= (others => '0');
			when "01000000" =>
	         if total_counter_CHUNK > 0 then
	            total_counter_CHUNK <= total_counter_CHUNK - 1;
	         else --underflow
	            total_counter_CHUNK <= (others => '0');
	         end if;
			when "00001000" =>
				total_counter_CHUNK <= XMATCH_din - 1;

			when others => null;
		end case;
	else null;
	end if;
end process counter_chunk_process;

end Behavioral;
