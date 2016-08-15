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
-- Entity: 			tb.vhd
-- Version:			1.0
-- Description: This file is the testbench file for Xilinx ISim
--
-- Additional Comments:
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	-- HOW TO USE?
	--
	-- Select the codec_selector either C or D
	-- under configuration
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use ieee.std_logic_textio.all;
use std.textio.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS

COMPONENT user_logic
PORT
(
--	PORT_S_AXIS_UC_IN_TREADY		: OUT	STD_LOGIC;
--	PORT_S_AXIS_UC_IN_TDATA			: IN  STD_LOGIC_VECTOR(31 downto 0);
--	PORT_S_AXIS_UC_IN_TLAST			: IN  STD_LOGIC;
--	PORT_S_AXIS_UC_IN_TVALID		: IN  STD_LOGIC;
--	PORT_M_AXIS_UC_OUT_TVALID		: OUT	STD_LOGIC;
--	PORT_M_AXIS_UC_OUT_TDATA		: OUT	STD_LOGIC_VECTOR(31 downto 0);
--	PORT_M_AXIS_UC_OUT_TREADY		: IN  STD_LOGIC;
--	PORT_M_AXIS_UC_OUT_TLAST		: OUT	STD_LOGIC;
--	PORT_S_AXIS_CD_IN_TREADY		: OUT	STD_LOGIC;
--	PORT_S_AXIS_CD_IN_TDATA			: IN  STD_LOGIC_VECTOR(31 downto 0);
--	PORT_S_AXIS_CD_IN_TLAST			: IN  STD_LOGIC;
--	PORT_S_AXIS_CD_IN_TVALID		: IN  STD_LOGIC;
--	PORT_M_AXIS_CD_OUT_TVALID		: OUT	STD_LOGIC;
--	PORT_M_AXIS_CD_OUT_TDATA		: OUT	STD_LOGIC_VECTOR(31 downto 0);
--	PORT_M_AXIS_CD_OUT_TREADY		: IN  STD_LOGIC;
--	PORT_M_AXIS_CD_OUT_TLAST		: OUT	STD_LOGIC;

	rst_HOST								: IN STD_LOGIC;
	clk_HOST 							: IN STD_LOGIC;
	din_HOST 							: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	wr_en_HOST 							: IN STD_LOGIC;
	rd_en_HOST 							: IN STD_LOGIC;
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

	Bus2IP_Clk							: in  std_logic;
	Bus2IP_Resetn						: in  std_logic;
	Bus2IP_Data                   : in  std_logic_vector(31 downto 0);
	Bus2IP_BE                     : in  std_logic_vector(3 downto 0);
	Bus2IP_RdCE                   : in  std_logic_vector(31 downto 0);
	Bus2IP_WrCE                   : in  std_logic_vector(31 downto 0);
	IP2Bus_Data                   : out std_logic_vector(31 downto 0);
	IP2Bus_RdAck                  : out std_logic;
	IP2Bus_WrAck                  : out std_logic;
	IP2Bus_Error                  : out std_logic
);
END COMPONENT;

  --Inputs

	signal Bus2IP_Resetn				: std_logic := '1';
	signal Bus2IP_Clk 				: std_logic := '0';

	signal Bus2IP_Data            : std_logic_vector(31 downto 0);
	signal Bus2IP_BE              : std_logic_vector(3 downto 0);
	signal Bus2IP_RdCE            : std_logic_vector(31 downto 0);
	signal Bus2IP_WrCE            : std_logic_vector(31 downto 0);

	signal s_axi_lite_awaddr		: STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
	signal s_axi_lite_wdata			: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal s_axi_lite_wvalid		: STD_LOGIC := '0';

	signal S_AXIS_UC_IN_TDATA 				: std_logic_vector(31 downto 0) := (others => '0');
	signal S_AXIS_UC_IN_TLAST 				: std_logic := '0';
	signal S_AXIS_UC_IN_TVALID 			: std_logic := '0';
	signal M_AXIS_UC_OUT_TREADY 			: std_logic := '1';

	signal S_AXIS_CD_IN_TDATA 				: std_logic_vector(31 downto 0) := (others => '0');
	signal S_AXIS_CD_IN_TLAST 				: std_logic := '0';
	signal S_AXIS_CD_IN_TVALID 			: std_logic := '0';
	signal M_AXIS_CD_OUT_TREADY 			: std_logic := '1';

	signal HOST_RST 					: std_logic := '1';
	signal HOST_CLK 					: std_logic := '0';
	signal HOST_DIN 					: std_logic_vector(31 downto 0) := (others => '0');
	signal HOST_WR_EN 				: std_logic := '0';
	signal HOST_RD_EN 				: std_logic := '0';

 	--Outputs

	signal IP2Bus_Data            : std_logic_vector(31 downto 0);
	signal IP2Bus_RdAck           : std_logic;
	signal IP2Bus_WrAck           : std_logic;
	signal IP2Bus_Error           : std_logic;

	signal S_AXIS_UC_IN_TREADY 			: std_logic;
	signal M_AXIS_UC_OUT_TVALID 			: std_logic;
	signal M_AXIS_UC_OUT_TDATA 				: std_logic_vector(31 downto 0);
   signal M_AXIS_UC_OUT_TLAST 				: std_logic;

	signal S_AXIS_CD_IN_TREADY 			: std_logic;
	signal M_AXIS_CD_OUT_TVALID 			: std_logic;
	signal M_AXIS_CD_OUT_TDATA 				: std_logic_vector(31 downto 0);
   signal M_AXIS_CD_OUT_TLAST 				: std_logic;

	signal HOST_DOUT 					: std_logic_vector(31 downto 0);
   signal HOST_FULL 					: std_logic;
   signal HOST_EMPTY 				: std_logic;

   -- Clock period definitions
   constant Bus2IP_Clk_period 	: time := 10 ns; -- 100 MHz of FPGA
   constant HOST_CLK_period 		: time := 4 ns; -- 250 MHz of PCIe

	-- Configuration
	signal codec_selector 			: std_logic_vector(3 downto 0) := x"C"; -- Choose C for Compression, choose D for Decompression

  BEGIN

	-- Component Instantiation
	uut: user_logic PORT MAP(
		S_AXIS_UC_IN_TREADY	=> S_AXIS_UC_IN_TREADY,
		S_AXIS_UC_IN_TDATA	=> S_AXIS_UC_IN_TDATA,
		S_AXIS_UC_IN_TLAST	=> S_AXIS_UC_IN_TLAST,
		S_AXIS_UC_IN_TVALID	=> S_AXIS_UC_IN_TVALID,
		M_AXIS_UC_OUT_TVALID	=> M_AXIS_UC_OUT_TVALID,
		M_AXIS_UC_OUT_TDATA	=> M_AXIS_UC_OUT_TDATA,
		M_AXIS_UC_OUT_TREADY	=> M_AXIS_UC_OUT_TREADY,
		M_AXIS_UC_OUT_TLAST	=> M_AXIS_UC_OUT_TLAST,
		S_AXIS_CD_IN_TREADY	=> S_AXIS_CD_IN_TREADY,
		S_AXIS_CD_IN_TDATA	=> S_AXIS_CD_IN_TDATA,
		S_AXIS_CD_IN_TLAST	=> S_AXIS_CD_IN_TLAST,
		S_AXIS_CD_IN_TVALID	=> S_AXIS_CD_IN_TVALID,
		M_AXIS_CD_OUT_TVALID	=> M_AXIS_CD_OUT_TVALID,
		M_AXIS_CD_OUT_TDATA	=> M_AXIS_CD_OUT_TDATA,
		M_AXIS_CD_OUT_TREADY	=> M_AXIS_CD_OUT_TREADY,
		M_AXIS_CD_OUT_TLAST	=> M_AXIS_CD_OUT_TLAST,
		Bus2IP_Clk			=> Bus2IP_Clk,
		Bus2IP_Resetn		=> Bus2IP_Resetn,
		Bus2IP_Data			=> Bus2IP_Data,
		Bus2IP_BE			=> Bus2IP_BE,
		Bus2IP_RdCE			=> Bus2IP_RdCE,
		Bus2IP_WrCE			=> Bus2IP_WrCE,
		IP2Bus_Data			=> IP2Bus_Data,
		IP2Bus_RdAck		=> IP2Bus_RdAck,
		IP2Bus_WrAck		=> IP2Bus_WrAck,
		IP2Bus_Error		=> IP2Bus_Error,
		clk_HOST 			=> HOST_CLK,
		rst_HOST				=> HOST_RST,
		din_HOST 			=> HOST_DIN,
		wr_en_HOST 			=> HOST_WR_EN,
		rd_en_HOST 			=> HOST_RD_EN,
		dout_HOST 			=> HOST_DOUT,
		full_HOST 			=> HOST_FULL,
		empty_HOST 			=> HOST_EMPTY
   );

   Bus2IP_Clk_process :process
   begin
		Bus2IP_Clk <= '1';
		wait for Bus2IP_Clk_period/2;
		Bus2IP_Clk <= '0';
		wait for Bus2IP_Clk_period/2;
   end process;

   HOST_CLK_process :process
   begin
		HOST_CLK <= '1';
		wait for HOST_CLK_period/2;
		HOST_CLK <= '0';
		wait for HOST_CLK_period/2;
   end process;

	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
	--~~~~~~ SOFTWARE WRITING TO XMATCH_CMD_CR HERE  ~~~~~~~~~~--
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
	WRITE_XMATCH_CMD_CR : process
	begin

	Bus2IP_Resetn 	<= '1';
	Bus2IP_RdCE		<= x"00000000";
	Bus2IP_WrCE		<= x"00000000";
	Bus2IP_Data		<= x"00000000";
	Bus2IP_BE		<= x"F";

	s_axi_lite_awaddr		<= "0000000000";
	s_axi_lite_wdata		<= x"00000000";
	s_axi_lite_wvalid		<= '0';

	wait for Bus2IP_Clk_period*10;

	Bus2IP_Resetn 	<= '0';
	wait for Bus2IP_Clk_period*8;

	Bus2IP_Resetn 	<= '1';

	wait for Bus2IP_Clk_period*40;
	Bus2IP_Data	<= x"76C00100";		-- Read from User Logic
	wait for Bus2IP_Clk_period*4;
	Bus2IP_RdCE	<= x"00000002";
	wait for Bus2IP_Clk_period*1;
	Bus2IP_RdCE	<= x"00000000";
	wait for Bus2IP_Clk_period*2;
	Bus2IP_Data	<= x"00000000";

	wait for Bus2IP_Clk_period*40;
	s_axi_lite_wdata		<= x"00000020";
	wait for Bus2IP_Clk_period*1;
	s_axi_lite_awaddr		<= "0001011000";
	wait for Bus2IP_Clk_period*2;
	s_axi_lite_wvalid		<= '1';
	wait for Bus2IP_Clk_period*5;
	s_axi_lite_wvalid		<= '0';
	wait for Bus2IP_Clk_period*2;
	s_axi_lite_wdata		<= x"00000000";
	wait for Bus2IP_Clk_period*1;
	s_axi_lite_awaddr		<= "0000000000";

	if	(codec_selector = x"C") then

	wait for Bus2IP_Clk_period*40;
	Bus2IP_Data		<= x"00000400";	-- Write Command to XMATCH_CMD_CR (Block Size): 00000400
	wait for Bus2IP_Clk_period*4;
	Bus2IP_WrCE	<= x"00000040";
	wait for Bus2IP_Clk_period*1;
	Bus2IP_WrCE	<= x"00000000";
	wait for Bus2IP_Clk_period*2;
	Bus2IP_Data	<= x"00000000";

	wait for Bus2IP_Clk_period*40;
	Bus2IP_Data		<= x"00001000";	-- Write Command to XMATCH_CMD_CR (Total Filesize in Bytes) : 00001000
	wait for Bus2IP_Clk_period*4;
	Bus2IP_WrCE	<= x"00000020";
	wait for Bus2IP_Clk_period*1;
	Bus2IP_WrCE	<= x"00000000";
	wait for Bus2IP_Clk_period*2;
	Bus2IP_Data	<= x"00000000";

	wait for Bus2IP_Clk_period*40;
	Bus2IP_Data		<= x"DC080007";	-- Write Command to XMATCH_CMD_CR (command to compress): DC080007, (command to decompress: 98080007)
	wait for Bus2IP_Clk_period*4;
	Bus2IP_WrCE	<= x"00000010";
	wait for Bus2IP_Clk_period*1;
	Bus2IP_WrCE	<= x"00000000";
	wait for Bus2IP_Clk_period*2;
	Bus2IP_Data	<= x"00000000";

	wait for Bus2IP_Clk_period*3500;
	s_axi_lite_wdata		<= x"00000038";
	wait for Bus2IP_Clk_period*1;
	s_axi_lite_awaddr		<= "0001011000";
	wait for Bus2IP_Clk_period*2;
	s_axi_lite_wvalid		<= '1';
	wait for Bus2IP_Clk_period*5;
	s_axi_lite_wvalid		<= '0';
	wait for Bus2IP_Clk_period*2;
	s_axi_lite_wdata		<= x"00000000";
	wait for Bus2IP_Clk_period*1;
	s_axi_lite_awaddr		<= "0000000000";

	elsif (codec_selector = x"D") then

	wait for Bus2IP_Clk_period*40;
	Bus2IP_Data		<= x"98080007";	-- Write Command to XMATCH_CMD_CR (command to compress): DC080007, (command to decompress: 98080007)
	wait for Bus2IP_Clk_period*4;
	Bus2IP_WrCE	<= x"00000080";
	wait for Bus2IP_Clk_period*1;
	Bus2IP_WrCE	<= x"00000000";
	wait for Bus2IP_Clk_period*2;
	Bus2IP_Data	<= x"00000000";

	end if;

	wait;

	end process;

	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
	--~~~~~~~~~~~   WRITING FROM FILE TO FIFO   ~~~~~~~~~~~~~~~--
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
	WRITE_C: process
		file U_INPUT_FILE_txt : TEXT open read_mode is "test_file/" & "alice_4096_U_bin" & ".txt"; -- Uncompressed file
		file C_INPUT_FILE_txt : TEXT open read_mode is "test_file/" & "alice_4096_C_1024_bin_sim" & ".txt"; -- Compressed file
		variable LIN : line;
		variable SPACE : character;
		variable tdata_file : std_logic_vector(31 downto 0);
		variable tlast_file : std_logic;
   begin

	wait for 0 ns;

	S_AXIS_UC_IN_TVALID <= '0';
	S_AXIS_CD_IN_TVALID <= '0';
	wait for (Bus2IP_Clk_period)*382;

	if (codec_selector = x"C") then
		while ((not(endfile(U_INPUT_FILE_txt)))) loop
			if (S_AXIS_UC_IN_TREADY ='1') then
				readline(U_INPUT_FILE_txt , LIN);
				read(LIN , tdata_file);
				read(LIN , SPACE);
				read(LIN , tlast_file);
				wait for Bus2IP_Clk_period;
				S_AXIS_UC_IN_TDATA	<= tdata_file;
				S_AXIS_UC_IN_TVALID	<= '1';
			else
				wait for Bus2IP_Clk_period;
				S_AXIS_UC_IN_TVALID	<= '0';
			end if;
		end loop;

	elsif (codec_selector = x"D") then
		while ((not(endfile(C_INPUT_FILE_txt)))) loop
			if (S_AXIS_CD_IN_TREADY ='1') then
				readline(C_INPUT_FILE_txt , LIN);
				read(LIN , tdata_file);
				read(LIN , SPACE);
				read(LIN , tlast_file);
				wait for Bus2IP_Clk_period;
				S_AXIS_CD_IN_TDATA	<= tdata_file;
				S_AXIS_CD_IN_TVALID	<= '1';
			else
				wait for Bus2IP_Clk_period;
				S_AXIS_CD_IN_TVALID	<= '0';
			end if;
		end loop;

	else
		null;
	end if;

	wait for Bus2IP_Clk_period;
	S_AXIS_UC_IN_TVALID <= '0';
	S_AXIS_CD_IN_TVALID <= '0';

	wait;

   end process;

	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
	--~~~~~~~~~~~   READING FROM FIFO TO FILE   ~~~~~~~~~~~~~~~--
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
	READ_C: process
		file C_OUTPUT_FILE_txt : TEXT open write_mode is "test_file/" & "output_C_sim" & ".txt"; -- output of Compressed
		variable  outline  : line;
		variable    linenumber : integer:=1;
		variable DATAOUT_std_temp : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	begin

	wait for 0 ns;
	wait for (Bus2IP_Clk_period)*2;

	while (M_AXIS_UC_OUT_TREADY = '1') loop -- a dummy loop

		if (M_AXIS_UC_OUT_TVALID = '1') then
				if (codec_selector = x"C") then -- Compress mode
					DATAOUT_std_temp := M_AXIS_UC_OUT_TDATA;
					write(outline, DATAOUT_std_temp);
					writeline(C_OUTPUT_FILE_txt, outline);
					linenumber := linenumber + 1;
					wait for Bus2IP_Clk_period;
				else
					null;
				end if;
		else
			wait for Bus2IP_Clk_period;
		end if;

--		if (HOST_EMPTY = '0') then
--			HOST_RD_EN <='1';		wait for HOST_CLK_period;
--			HOST_RD_EN <='0';		wait for HOST_CLK_period;
--				if (codec_selector = x"C") then -- Compress mode
--					DATAOUT_std_temp := HOST_DOUT;
--					write(outline, DATAOUT_std_temp);
--					writeline(C_OUTPUT_FILE_txt, outline);
--					linenumber := linenumber + 1;
--				elsif (codec_selector = x"D") then -- Decompress mode
--					DATAOUT_std_temp := HOST_DOUT;
--					write(outline, DATAOUT_std_temp);
--					writeline(D_OUTPUT_FILE_txt, outline);
--					linenumber := linenumber + 1;
--				else
--					null;
--				end if;
--		else
--			wait for HOST_CLK_period*2;
--			HOST_RD_EN 	<= '0';
--		end if;

	end loop;

	wait;

	end process;

	READ_D: process
		file D_OUTPUT_FILE_txt : TEXT open write_mode is "test_file/" & "output_D_sim" & ".txt"; -- output of Decompressed
		variable  outline  : line;
		variable    linenumber : integer:=1;
		variable DATAOUT_std_temp : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	begin

	wait for 0 ns;
	wait for (Bus2IP_Clk_period)*2;

	while (M_AXIS_CD_OUT_TREADY = '1') loop -- a dummy loop

		if (M_AXIS_CD_OUT_TVALID = '1') then
				if (codec_selector = x"D") then -- Decompress mode
					DATAOUT_std_temp := M_AXIS_CD_OUT_TDATA;
					write(outline, DATAOUT_std_temp);
					writeline(D_OUTPUT_FILE_txt, outline);
					linenumber := linenumber + 1;
					wait for Bus2IP_Clk_period;
				else
					null;
				end if;
		else
			wait for Bus2IP_Clk_period;
		end if;

	end loop;

	wait;

	end process;

  END;
