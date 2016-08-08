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

------------------------------------------
--  ENTITY       = REG_FILE             --
--  version      = 1.0       		    --
--  last update  = 11/09/00    	    --
--  author       = Jose Nunez           --
------------------------------------------


-- FUNCTION
-- 16 bit wide treshold register


--  PIN LIST


--  DIN   = 16 bit input data

--  ADDRESS = 2 bit to address 

--  RW = read and write

--  ENABLE = enable the load
--  CLEAR = asynchronous clear of register
--  CLK   = clock
--  DOUT  = 16 bit output of flip-flops

--  C_BS_OUT = compressed block size 

--  U_BS_OUT = uncompressed block size

--  START_C = start the compression engine

--  START_D = start the decompression engine

--  STOP = stop the process

--  THRESHOLD_LEVEL = the threshold level of the buffers



library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity REG_FILE_D is
port
(
      DIN : in bit_vector(31 downto 0);
	  ADDRESS : in bit_vector(1 downto 0);
	  CRC_IN : in bit_vector(31 downto 0);
	  LOAD_CRC : in bit;
      RW : in bit;
      CLEAR_CR : in bit;
      ENABLE : in bit;
      CLEAR : in bit;
	CLK : in bit;
	DOUT : out std_logic_vector(31 downto 0);
	C_BS_OUT : out bit_vector(31 downto 0);
	U_BS_OUT : out bit_vector(31 downto 0);
	CRC_OUT : out bit_vector(31 downto 0);
	START_D : out bit;
	STOP :out bit;
	THRESHOLD_LEVEL : out bit_vector(7 downto 0)

);
end REG_FILE_D;


architecture LATCH of REG_FILE_D is

component CONTROL_REG
port
(
      DIN : in bit_vector(31 downto 0);
      ENABLE : in bit;
      CLEAR : in bit;
	CLK : in bit;
      DOUT : out bit_vector(31 downto 0)
);
end component;

type TYPE_ARRAY is array(3 downto 0) of bit_vector(31 downto 0);
signal ARRAY_OUT : TYPE_ARRAY;

signal ENABLE_INT : bit_vector(3 downto 0);
signal ENABLE_CODE : bit_vector(3 downto 0);


signal ENABLE_REG_CBS : bit;
signal DIN_REG_CBS: bit_vector(31 downto 0);



signal ENABLE_REG_CR : bit;
signal DIN_REG_CR: bit_vector(31 downto 0);



signal ENABLE_REG_CRC : bit;

signal DIN_REG_CRC: bit_vector(31 downto 0);






begin

ENABLE_CODE <= ADDRESS & RW & ENABLE;

-- RW write =0
-- ENABLE active =0

WRITE : process(ENABLE_CODE)
begin
case ENABLE_CODE is
    when "0000" => ENABLE_INT <= "0001";
    when "0100" => ENABLE_INT <= "0010";
    when "1000" => ENABLE_INT <= "0100";
	when "1100" => ENABLE_INT <= "1000";
    when others => ENABLE_INT <= "0000";
end case;
end process WRITE;

READ : process(ENABLE_CODE, ARRAY_OUT)
begin
case ENABLE_CODE is
    when "0010" => DOUT <= To_X01Z(ARRAY_OUT(0));
    when "0110" => DOUT <= To_X01Z(ARRAY_OUT(1));
    when "1010" => DOUT <= To_X01Z(ARRAY_OUT(2));
	when "1110" => DOUT <= To_X01Z(ARRAY_OUT(3));
    when others => DOUT  <= X"00000000";
end case;
end process READ;



REG_CR : CONTROL_REG

port map ( DIN => DIN_REG_CR,

      ENABLE => ENABLE_REG_CR,

      CLEAR => CLEAR,


      CLK => CLK,

      DOUT => ARRAY_OUT(0));




REG_UBS : CONTROL_REG 

port map ( DIN => DIN,
      ENABLE => ENABLE_INT(1),
      CLEAR => CLEAR,
      CLK => CLK,
      DOUT => ARRAY_OUT(1));



REG_CBS : CONTROL_REG 
port map ( DIN => DIN_REG_CBS,
      ENABLE => ENABLE_REG_CBS,
      CLEAR => CLEAR,
      CLK => CLK,
      DOUT => ARRAY_OUT(2));


REG_CRC : CONTROL_REG 
port map ( DIN => DIN_REG_CRC,
      ENABLE => ENABLE_REG_CRC,
      CLEAR => CLEAR,
      CLK => CLK,
      DOUT => ARRAY_OUT(3));


ENABLE_REG_CRC <= ENABLE_INT(3) when LOAD_CRC = '1' else '1';
DIN_REG_CRC <= DIN when LOAD_CRC = '1' else CRC_IN;

ENABLE_REG_CBS <= ENABLE_INT(2);
DIN_REG_CBS <= DIN; 


ENABLE_REG_CR <= ENABLE_INT(0) when CLEAR_CR = '1' else '1'; -- clear the CR at the end of the decompression phase

DIN_REG_CR <= DIN when CLEAR_CR = '1' else "11111111111111111111111111111111";  -- clear the CR


CRC_OUT <= ARRAY_OUT(3); 
C_BS_OUT <= ARRAY_OUT(2);
U_BS_OUT <= ARRAY_OUT(1);
START_D <= ARRAY_OUT(0)(12) or ARRAY_OUT(0)(15);  -- if both zeros engage decompression engine
STOP <= ARRAY_OUT(0)(14);
THRESHOLD_LEVEL <= ARRAY_OUT(0)(11 downto 4);
--THRESHOLD_LEVEL <= "00001000"; 


end LATCH;

