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

-- e_mail : j.l.nunez-yanez@byacom.co.uk

---------------------------------
--  ENTITY       = LEVEL1      --
--  version      = 5.0         --
--  last update  = 1/05/01     --
--  author       = Jose Nunez  --
---------------------------------

--- MODIFIED BY MOHD A ZAINOL ---
-- Revision 1: Add INTERRUPT_REQ_C, *_D
--					and INTERRUPT_ACK_C, *_D
---------------------------------

-- FUNCTION
--  Top level of the compression decompression hierarchy.


library ieee,std,dzx;
use ieee.std_logic_1164.all;

use dzx.bit_utils.all;
-- use std.textio.all;
 
entity decompressor_engine is
port
(
	CS : in std_logic;
	RW : in std_logic;
	ADDRESSD: in std_logic_vector(3 downto 0);
	CONTROL_IND : in std_logic_vector (31 downto 0);
	CONTROL_OUT_D: out std_logic_vector (31 downto 0);
	CLK : in std_logic;
	CLEAR: in std_logic;
 	BUS_ACKNOWLEDGE_DC : in std_logic;
	BUS_ACKNOWLEDGE_DU : in std_logic;
    WAIT_DC : in std_logic;
    WAIT_DU : in std_logic;
	C_DATAIN : in std_logic_vector(31 downto 0);
	U_DATAOUT : out std_logic_vector(31 downto 0);
	FINISHED_D : out std_logic;
	FLUSHING_D : out std_logic;
	DECOMPRESSING : out std_logic;
	U_DATA_VALID : out std_logic;
	DECODING_OVERFLOW : out std_logic;
	CRC_ERROR : out std_logic; -- error condition in the compression or decompression channels
	INTERRUPT_REQ_D : out std_logic;
	INTERRUPT_ACK_D : in std_logic;
	BUS_REQUEST_DC : out std_logic;
	BUS_REQUEST_DU : out std_logic;
	CRC_OUT_D_32 : out std_logic_vector(31 downto 0)
);
end decompressor_engine;

architecture level1_1 of decompressor_engine is

-- these are  the components that form level1

component level1rd
port
(
	CS : in std_logic ;
	RW : in std_logic;
	ADDRESS: in std_logic_vector(1 downto 0);
	CONTROL_IN : in std_logic_vector (31 downto 0);
	CONTROL_OUT: out std_logic_vector (31 downto 0);
	CLK : in std_logic ;
	CLEAR: in std_logic;
	BUS_ACKNOWLEDGE_C : in std_logic;
	BUS_ACKNOWLEDGE_U : in std_logic;
    WAIT_C : in std_logic;
    WAIT_U : in std_logic;
	C_DATA_VALID : in std_logic;
	START_C : in std_logic;
	TEST_MODE : in std_logic;
	FINISHED_C : in std_logic;
	C_DATAIN : in std_logic_vector(31 downto 0);
	U_DATAOUT : out std_logic_vector(31 downto 0);
	FINISHED : out std_logic;
	FLUSHING : out std_logic;
	DECOMPRESSING : out std_logic;
	U_DATA_VALID : out std_logic;
	DECODING_OVERFLOW : out std_logic;
	CRC_OUT : out std_logic_vector(31 downto 0);
	BUS_REQUEST_C : out std_logic;
    OVERFLOW_CONTROL_DECODING_BUFFER : out std_logic;
	BUS_REQUEST_U : out std_logic
);
end component;

signal CS_D : std_logic;
signal RW_D : std_logic;
signal ADDRESS_D : std_logic_vector(1 downto 0);
signal C_DATA_VALID_AUX : std_logic; -- signals for test mode
signal FINISHED_C_AUX : std_logic; 
signal C_DATAOUT_AUX : std_logic_vector(31 downto 0);
signal C_DATAOUT_INT : std_logic_vector(31 downto 0);
signal C_DATAIN_AUX : std_logic_vector(31 downto 0);
signal BUS_REQUEST_DC_AUX : std_logic;
signal CRC_OUT_D : std_logic_vector(31 downto 0);
signal DECOMPRESSING_AUX : std_logic;
signal CRC_CHECK : std_logic;
signal CRC_ACTIVE: std_logic;
signal MODE: std_logic := '1'; -- Edited by: Mohd A. Zainol: NO MODE
signal WAIT_DC_AUX : std_logic;
signal WAIT_DU_AUX : std_logic;
signal TEST_MODE : std_logic;
signal DECODING_OVERFLOW_AUX : std_logic; -- ilegal => error condition
signal CRC_ERROR_AUX : std_logic; -- error condition in the compression or decompression channels
signal FINISHED_D_AUX : std_logic;
signal STATUS_D : std_logic_vector(31 downto 0);
signal ENABLE_INTERRUPT_D : std_logic;
signal INTERRUPT_D : std_logic;
signal OVERFLOW_CONTROL_DECODING_BUFFER : std_logic;

begin

WAIT_DC_AUX <= WAIT_DC or TEST_MODE;
WAIT_DU_AUX <= WAIT_DU or TEST_MODE; -- never wait in the decompression channel under test mode
CRC_OUT_D_32 <= CRC_OUT_D;

level1_d : level1rd  port map(
	CS => CS_D,
	RW => RW_D,
	ADDRESS => ADDRESS_D,
	CONTROL_IN => CONTROL_IND,
	CONTROL_OUT=> CONTROL_OUT_D,
	CLK	=> CLK,
	CLEAR => CLEAR,
	BUS_ACKNOWLEDGE_C => BUS_ACKNOWLEDGE_DC,
	BUS_ACKNOWLEDGE_U => BUS_ACKNOWLEDGE_DU,
    WAIT_C => WAIT_DC_AUX,
    WAIT_U => WAIT_DU_AUX,
	C_DATA_VALID =>C_DATA_VALID_AUX,
	START_C => MODE,
	TEST_MODE => TEST_MODE,
	FINISHED_C =>FINISHED_C_AUX,
	C_DATAIN => C_DATAIN_AUX,
	U_DATAOUT => U_DATAOUT,
	FINISHED => CRC_CHECK,
	FLUSHING => FLUSHING_D,
	DECOMPRESSING => DECOMPRESSING_AUX,
	U_DATA_VALID => U_DATA_VALID,
	DECODING_OVERFLOW => DECODING_OVERFLOW_AUX,
	CRC_OUT => CRC_OUT_D,
	BUS_REQUEST_C => BUS_REQUEST_DC_AUX,
    OVERFLOW_CONTROL_DECODING_BUFFER => OVERFLOW_CONTROL_DECODING_BUFFER,
	BUS_REQUEST_U => BUS_REQUEST_DU
);

DECOMPRESSING <= DECOMPRESSING_AUX;
FINISHED_D <= CRC_CHECK;
FINISHED_D_AUX <= CRC_CHECK;

DELAY_C_DATAIN : process(CLK, CLEAR)   -- test mode delay c data
begin

if (CLEAR = '0') then
	C_DATAOUT_INT <= x"00000000";	
elsif ((CLK'event) and (CLK = '1')) then
	--C_DATAOUT_INT <= C_DATAOUT_AUX;
	C_DATAOUT_INT <= x"00000000";
end if;

end process;


CRC_CONTROL : process(CLK, CLEAR)   -- test mode delay c data
begin

if (CLEAR = '0') then
	CRC_ACTIVE <= '0';	
elsif ((CLK'event) and (CLK = '1')) then
    if (CS = '0' and RW = '0') then --delete
			CRC_ACTIVE <='0';
	elsif (CRC_CHECK = '0' and TEST_MODE = '1') then -- no activity in the engines
			CRC_ACTIVE <='1';   -- active
	else
			CRC_ACTIVE <=CRC_ACTIVE; 
	end if;
end if;

end process;

MODE_CONTROL : process(CLK, CLEAR)   -- test mode delay c data
begin

if (CLEAR = '0') then
	TEST_MODE <= '0';	
elsif ((CLK'event) and (CLK = '1')) then
      if (CS = '0' and RW = '0') then --delete
			TEST_MODE <='0';
	elsif (MODE = '0') then
			TEST_MODE <= '1'; --test mode active
	else
			TEST_MODE <= TEST_MODE; 
	end if;
end if;

end process;

STATUS_REGISTER_DECOMPRESSION : process(CLK, CLEAR)

begin

if (CLEAR = '0' ) then
	STATUS_D <= x"FFFFFFFF";
elsif ((CLK'event) and (CLK = '1')) then
			if ( CS_D = '0' and RW = '0' ) then
				STATUS_D <= x"FFFFFFFF";
			elsif (DECODING_OVERFLOW_AUX = '0' and TEST_MODE = '0') then
				STATUS_D(13) <= '0';
			elsif (FINISHED_D_AUX = '0' and TEST_MODE = '0') then 
				STATUS_D(1) <= '0';
			end if;
end if;

end process;

ENABLE_INTERRUPT_PROCESS : process(CLK, CLEAR)

begin

if (CLEAR = '0' ) then
	ENABLE_INTERRUPT_D <= '0';
elsif ((CLK'event) and (CLK = '1')) then
       if (CS_D = '0' and RW = '0') then
			  ENABLE_INTERRUPT_D <= '1';
			elsif (INTERRUPT_ACK_D = '0' and INTERRUPT_D = '0') then
				ENABLE_INTERRUPT_D <= '0';
			else
				ENABLE_INTERRUPT_D <= ENABLE_INTERRUPT_D;
			end if;
end if;

end process;

INTERRUPT_D <= '0' when ((STATUS_D(13)= '0' or STATUS_D(1) = '0') and ENABLE_INTERRUPT_D = '1') else '1'; 
INTERRUPT_REQ_D <= '0' when (INTERRUPT_D = '0') else '1';

CRC_ERROR <= CRC_ERROR_AUX;
DECODING_OVERFLOW <= DECODING_OVERFLOW_AUX;
--CRC_ERROR_AUX <= '0' when CRC_OUT_D /= CRC_OUT_C and CRC_ACTIVE = '1' else '1';  -- 0 active 
CRC_ERROR_AUX <= '1';  -- Edited by: Mohd A. Zainol: assume there is no CRC error(!)

BUS_REQUEST_DC <= BUS_REQUEST_DC_AUX;

C_DATAIN_AUX <= C_DATAIN when BUS_REQUEST_DC_AUX = '0' else C_DATAOUT_INT;
ADDRESS_D <= ADDRESSD(1 downto 0);
RW_D <= RW;
CS_D <= '0' when (CS = '0') and (ADDRESSD(3 downto 2) = "10" or (ADDRESSD(3) = '1' and ADDRESSD(1 downto 0) = "01")) else '1'; 

end level1_1;