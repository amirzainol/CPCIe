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
 
entity level1r is
port
(
	CS : in bit;
	RW : in bit;
	ADDRESSC: in bit_vector(3 downto 0);
	ADDRESSD: in bit_vector(3 downto 0);
--====================================================================
--	CONTROL : inout std_logic_vector(31 downto 0);
	CONTROL_INC : in std_logic_vector (31 downto 0);
	CONTROL_IND : in std_logic_vector (31 downto 0);
	CONTROL_OUT_C: out std_logic_vector (31 downto 0);
	CONTROL_OUT_D: out std_logic_vector (31 downto 0);
--====================================================================
	CLK : in bit;
	CLEAR: in bit;
	BUS_ACKNOWLEDGE_CC : in bit;
	BUS_ACKNOWLEDGE_CU : in bit;
 	BUS_ACKNOWLEDGE_DC : in bit;
	BUS_ACKNOWLEDGE_DU : in bit;
	WAIT_CU : in bit;
  WAIT_CC : in bit;
  WAIT_DC : in bit;
  WAIT_DU : in bit;
	U_DATAIN : in bit_vector(31 downto 0);
	C_DATAIN : in bit_vector(31 downto 0);
	U_DATAOUT : out std_logic_vector(31 downto 0);
	C_DATAOUT : out std_logic_vector(31 downto 0);
	FINISHED_C : out bit;
	FINISHED_D : out bit;
	COMPRESSING : out bit;
	FLUSHING_C : out bit;
	FLUSHING_D : out bit;
	DECOMPRESSING : out bit;
	U_DATA_VALID : out bit;
	C_DATA_VALID : out bit; 
	DECODING_OVERFLOW : out bit;
	CODING_OVERFLOW : out bit; -- ilegal => error condition
	CRC_ERROR : out bit; -- error condition in the compression or decompression channels
	INTERRUPT_REQ_C : out bit;
	INTERRUPT_REQ_D : out bit;
   INTERRUPT_ACK_C : in bit;
	INTERRUPT_ACK_D : in bit;
	BUS_REQUEST_CC : out bit;
	BUS_REQUEST_CU : out bit;
	BUS_REQUEST_DC : out bit;
	BUS_REQUEST_DU : out bit
);
end level1r;


architecture level1_1 of level1r is

-- these are  the components that form level1

component level1rc
port
(
  OVERFLOW_CONTROL :  in bit;
	CS : in bit ;
	RW : in bit;
	ADDRESS: in bit_vector(1 downto 0);
--====================================================================
--	CONTROL : inout std_logic_vector(31 downto 0);
	CONTROL_IN : in std_logic_vector (31 downto 0);
	CONTROL_OUT: out std_logic_vector (31 downto 0);
--====================================================================
	CLK : in bit ;	
	CLEAR: in bit;
	BUS_ACKNOWLEDGE_U : in bit;
	BUS_ACKNOWLEDGE_C : in bit;
	WAIT_U   : in bit;
	WAIT_C   : in bit;
	U_DATAIN : in bit_vector(31 downto 0);
	C_DATAOUT : out std_logic_vector(31 downto 0);
	C_DATAOUT_TO_DECOMP : out std_logic_vector(31 downto 0);
	FINISHED : out bit;
	COMPRESSING : out bit;
	MODE : out bit;
	FLUSHING : out bit;
	CODING_OVERFLOW : out bit;
	C_DATA_VALID : out bit;
	CRC_OUT : out bit_vector(31 downto 0);
	BUS_REQUEST_U : out bit;
	BUS_REQUEST_C : out bit
);
end component;

component level1rd
port
(
	CS : in bit ;
	RW : in bit;
	ADDRESS: in bit_vector(1 downto 0);
--====================================================================
--	CONTROL : inout std_logic_vector(31 downto 0);
	CONTROL_IN : in std_logic_vector (31 downto 0);
	CONTROL_OUT: out std_logic_vector (31 downto 0);
--====================================================================
	CLK : in bit ;
	CLEAR: in bit;
	BUS_ACKNOWLEDGE_C : in bit;
	BUS_ACKNOWLEDGE_U : in bit;
  WAIT_C : in bit;
   WAIT_U : in bit;
	C_DATA_VALID : in bit;
	START_C : in bit;
	TEST_MODE : in bit;
	FINISHED_C : in bit;
	C_DATAIN : in bit_vector(31 downto 0);
	U_DATAOUT : out std_logic_vector(31 downto 0);
	FINISHED : out bit;
	FLUSHING : out bit;
	DECOMPRESSING : out bit;
	U_DATA_VALID : out bit;
	DECODING_OVERFLOW : out bit;
	CRC_OUT : out bit_vector(31 downto 0);
	BUS_REQUEST_C : out bit;
  OVERFLOW_CONTROL_DECODING_BUFFER : out bit;
	BUS_REQUEST_U : out bit
);
end component;


signal CS_C : bit;
signal CS_D : bit;
signal RW_C : bit;
signal RW_D : bit;
signal ADDRESS_C : bit_vector(1 downto 0);
signal ADDRESS_D : bit_vector(1 downto 0);
signal C_DATA_VALID_AUX : bit; -- signals for test mode
signal FINISHED_C_AUX : bit; 
signal COMPRESSING_AUX : bit;
signal C_DATAOUT_AUX : std_logic_vector(31 downto 0);
signal C_DATAOUT_INT : bit_vector(31 downto 0);
signal C_DATAIN_AUX : bit_vector(31 downto 0);
signal BUS_REQUEST_DC_AUX : bit;
signal CRC_OUT_C,CRC_OUT_D : bit_vector(31 downto 0);
signal DECOMPRESSING_AUX : bit;
signal CRC_CHECK : bit;
signal CRC_ACTIVE: bit;
signal MODE: bit;
signal WAIT_DC_AUX : bit;
signal WAIT_DU_AUX : bit;

signal TEST_MODE : bit;

signal	DECODING_OVERFLOW_AUX : bit; -- ilegal => error condition
signal	CODING_OVERFLOW_AUX : bit; -- ilegal => error condition
signal	CRC_ERROR_AUX : bit; -- error condition in the compression or decompression channels
signal	FINISHED_D_AUX : bit;
signal STATUS_C : bit_vector(31 downto 0);
signal STATUS_D : bit_vector(31 downto 0);
signal ENABLE_INTERRUPT_C : bit;
signal ENABLE_INTERRUPT_D : bit;
signal INTERRUPT_C : bit;
signal INTERRUPT_D : bit;


signal OVERFLOW_CONTROL_DECODING_BUFFER : bit;

begin



level1_c : level1rc  port map(
  OVERFLOW_CONTROL => OVERFLOW_CONTROL_DECODING_BUFFER,
	CS => CS_C,
	RW => RW_C,
	ADDRESS => ADDRESS_C,
--=============================================================
--	CONTROL => CONTROL,
	CONTROL_IN => CONTROL_INC,
	CONTROL_OUT=> CONTROL_OUT_C,
--=============================================================
	CLK	=> CLK,
	CLEAR => CLEAR,
	BUS_ACKNOWLEDGE_C => BUS_ACKNOWLEDGE_CC,
	BUS_ACKNOWLEDGE_U => BUS_ACKNOWLEDGE_CU,
	WAIT_U => WAIT_CU,
   WAIT_C => WAIT_CC,
	U_DATAIN => U_DATAIN,
	C_DATAOUT => C_DATAOUT,
  C_DATAOUT_TO_DECOMP => C_DATAOUT_AUX,
	FINISHED => FINISHED_C_AUX,
	COMPRESSING => COMPRESSING_AUX,
	MODE => MODE,
	FLUSHING => FLUSHING_C,
	CODING_OVERFLOW => CODING_OVERFLOW_AUX,
	C_DATA_VALID => C_DATA_VALID_AUX,
	CRC_OUT => CRC_OUT_C,
	BUS_REQUEST_C => BUS_REQUEST_CC,
	BUS_REQUEST_U => BUS_REQUEST_CU
);

COMPRESSING <= COMPRESSING_AUX;
FINISHED_C <= FINISHED_C_AUX;
C_DATA_VALID <= C_DATA_VALID_AUX;
WAIT_DC_AUX <= WAIT_DC or TEST_MODE;
WAIT_DU_AUX <= WAIT_DU or TEST_MODE; -- never wait in the decompression channel under test mode


level1_d : level1rd  port map(
	CS => CS_D,
	RW => RW_D,
	ADDRESS => ADDRESS_D,
--=============================================================
--	CONTROL => CONTROL,
	CONTROL_IN => CONTROL_IND,
	CONTROL_OUT=> CONTROL_OUT_D,
--=============================================================
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
	C_DATAOUT_INT <= To_bitvector(C_DATAOUT_AUX);
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


STATUS_REGISTER_COMPRESSION : process(CLK, CLEAR)

begin

if (CLEAR = '0' ) then
	STATUS_C <= x"FFFFFFFF";
elsif ((CLK'event) and (CLK = '1')) then
			if ( CS_C = '0' and RW = '0' ) then
				STATUS_C <= x"FFFFFFFF";
			elsif (CRC_ERROR_AUX = '0' and TEST_MODE = '1') then
				STATUS_C(15) <= '0';
			elsif CODING_OVERFLOW_AUX = '0' then
				STATUS_C(14) <= '0';
			elsif (DECODING_OVERFLOW_AUX = '0'and TEST_MODE = '1') then
				STATUS_C(13) <= '0';
			elsif (FINISHED_D_AUX = '0' and TEST_MODE = '1') then -- the decompression channel only affects this register in test mode
				STATUS_C(1) <= '0';
			elsif FINISHED_C_AUX = '0' then
				STATUS_C(0) <= '0';
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
	ENABLE_INTERRUPT_C <= '0';
	ENABLE_INTERRUPT_D <= '0';
elsif ((CLK'event) and (CLK = '1')) then
			if (CS_C = '0' and RW = '0' ) then
				ENABLE_INTERRUPT_C <= '1';
       elsif (CS_D = '0' and RW = '0') then
			  ENABLE_INTERRUPT_D <= '1';
			elsif (INTERRUPT_ACK_C = '0' and INTERRUPT_C = '0') then
				ENABLE_INTERRUPT_C <= '0';
			elsif (INTERRUPT_ACK_D = '0' and INTERRUPT_D = '0') then
				ENABLE_INTERRUPT_D <= '0';
			else
				ENABLE_INTERRUPT_C <= ENABLE_INTERRUPT_C;
				ENABLE_INTERRUPT_D <= ENABLE_INTERRUPT_D;
			end if;
end if;

end process;

INTERRUPT_C <= '0' when ((STATUS_C(15) = '0' or STATUS_C(14) = '0' or STATUS_C(13) = '0'  or STATUS_C(1) = '0'  or (STATUS_C(0) = '0' and TEST_MODE = '0')) and ENABLE_INTERRUPT_C = '1') else '1';

INTERRUPT_D <= '0' when ((STATUS_D(13)= '0' or STATUS_D(1) = '0') and ENABLE_INTERRUPT_D = '1') else '1'; 

INTERRUPT_REQ_C <= '0' when (INTERRUPT_C = '0') else '1';

INTERRUPT_REQ_D <= '0' when (INTERRUPT_D = '0') else '1';




--=======================================================================================================================
--CONTROL_OUT <= To_X01Z(STATUS_C) when ADDRESS = "0000" and CS = '0' and RW = '1' else X"00000000"; 

--CONTROL_OUT <= To_X01Z(STATUS_D) when ADDRESS = "0001" and CS = '0' and RW = '1' else X"00000000"; 
--=======================================================================================================================



CRC_ERROR <= CRC_ERROR_AUX;
CODING_OVERFLOW <= CODING_OVERFLOW_AUX;
DECODING_OVERFLOW <= DECODING_OVERFLOW_AUX;




CRC_ERROR_AUX <= '0' when CRC_OUT_D /= CRC_OUT_C and CRC_ACTIVE = '1' else '1';  -- 0 active 




BUS_REQUEST_DC <= BUS_REQUEST_DC_AUX;

C_DATAIN_AUX <= C_DATAIN when BUS_REQUEST_DC_AUX = '0' else C_DATAOUT_INT;
ADDRESS_C <= ADDRESSC(1 downto 0);
ADDRESS_D <= ADDRESSD(1 downto 0);
RW_D <= RW;
RW_C <= RW;
CS_D <= '0' when (CS = '0') and (ADDRESSD(3 downto 2) = "10" or (ADDRESSD(3) = '1' and ADDRESSD(1 downto 0) = "01")) else '1'; 
CS_C <= '0' when (CS = '0' and ADDRESSC(3 downto 2) = "11") else '1'; 


end level1_1;