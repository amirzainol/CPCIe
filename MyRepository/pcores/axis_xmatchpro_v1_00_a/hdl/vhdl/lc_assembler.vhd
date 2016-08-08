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

----------------------------------
--  ENTITY       = LC_ASSEMBLER --
--  version      = 1.0          --
--  last update  = 16/06/99     --
--  author       = Jose Nunez   --
----------------------------------


-- FUNCTION
-- assembles literal characters into a left aligned format.
-- input match type determines which bytes are valid.


-- PIN LIST
-- MASK         = valid bytes
-- MATCH_TYPE   = input match type (active low), i.e a low indicates that the corresponding
--                byte in LITERAL_DATA is valid.
-- LITERAL_DATA = input literal data characters
-- CODE         = output bytes assembled in left justified format adding miss type if needed
-- LENGTH       = length of output code in bits

library ieee,dzx;
use ieee.std_logic_1164.all;


entity LC_ASSEMBLER is
port
(
    MASK : in bit_vector(4 downto 0);
	MATCH_TYPE : in bit_vector(3 downto 0);
    LITERAL_DATA : in bit_vector(31 downto 0);
	CODE : out bit_vector(33 downto 0);
	MISS : out bit;
	LENGTH : out bit_vector(5 downto 0)
);


end LC_ASSEMBLER;

architecture FIRST of LC_ASSEMBLER is

signal MISS_TYPE_CODE : bit_vector(33 downto 0);
signal MISS_TYPE_LENGTH : bit_vector(5 downto 0);
signal CODE_AUX : bit_vector(33 downto 0);
signal LENGTH_AUX : bit_vector(5 downto 0); 
signal MISS_AUX : bit;


component MISS_TYPE_CODER
port 
(
   	MASK : in bit_vector(4 downto 0);
	LITERAL_DATA :in bit_vector(31 downto 0);
	CODE : out bit_vector(33 downto 0);
	LENGTH : out bit_vector(5 downto 0)
);
end component;

begin

MSS_CODER : MISS_TYPE_CODER
port map 
(
   	MASK => MASK,
	LITERAL_DATA => LITERAL_DATA,
	CODE => MISS_TYPE_CODE,
	LENGTH => MISS_TYPE_LENGTH
);


ASSEMBLE : process(MATCH_TYPE, LITERAL_DATA, MISS_TYPE_CODE, MISS_TYPE_LENGTH)
variable BYTE3 : bit_vector(7 downto 0);
variable BYTE2 : bit_vector(7 downto 0);
variable BYTE1 : bit_vector(7 downto 0);
variable BYTE0 : bit_vector(7 downto 0);


begin

BYTE3 := LITERAL_DATA(31 downto 24);
BYTE2 := LITERAL_DATA(23 downto 16);
BYTE1 := LITERAL_DATA(15 downto 8);
BYTE0 := LITERAL_DATA(7 downto 0);

case MATCH_TYPE is

    when "1111" => CODE_AUX <= MISS_TYPE_CODE;LENGTH_AUX <= MISS_TYPE_LENGTH;MISS_AUX <= '1';
    when "1110" => CODE_AUX <= MISS_TYPE_CODE;LENGTH_AUX <= MISS_TYPE_LENGTH;MISS_AUX <= '1';
    when "1101" => CODE_AUX <= MISS_TYPE_CODE;LENGTH_AUX <= MISS_TYPE_LENGTH;MISS_AUX <= '1';
    when "1100" => CODE_AUX <= BYTE3 & BYTE2 & "000000000000000000"; LENGTH_AUX <= "010000";MISS_AUX <= '0';
    when "1011" => CODE_AUX <= MISS_TYPE_CODE;LENGTH_AUX <= MISS_TYPE_LENGTH;MISS_AUX <= '1'; 
    when "1010" => CODE_AUX <= MISS_TYPE_CODE;LENGTH_AUX <= MISS_TYPE_LENGTH;MISS_AUX <= '1';   
    when "1001" => CODE_AUX <= BYTE3 & BYTE0 & "000000000000000000"; LENGTH_AUX <= "010000";MISS_AUX <= '0';
    when "1000" => CODE_AUX <= BYTE3 & "00000000000000000000000000"; LENGTH_AUX <= "001000";MISS_AUX <= '0';
    when "0111" => CODE_AUX <= MISS_TYPE_CODE;LENGTH_AUX <= MISS_TYPE_LENGTH;MISS_AUX <= '1';
    when "0110" => CODE_AUX <= BYTE2 & BYTE1 & "000000000000000000"; LENGTH_AUX <= "010000";MISS_AUX <= '0';
    when "0101" => CODE_AUX <= MISS_TYPE_CODE;LENGTH_AUX <= MISS_TYPE_LENGTH;MISS_AUX <= '1';
    when "0100" => CODE_AUX <= BYTE2 & "00000000000000000000000000"; LENGTH_AUX <= "001000";MISS_AUX <= '0';
    when "0011" => CODE_AUX <= BYTE1 & BYTE0 & "000000000000000000"; LENGTH_AUX <= "010000";MISS_AUX <= '0';
    when "0010" => CODE_AUX <= BYTE1 & "00000000000000000000000000"; LENGTH_AUX <= "001000";MISS_AUX <= '0';
    when "0001" => CODE_AUX <= BYTE0 & "00000000000000000000000000"; LENGTH_AUX <= "001000";MISS_AUX <= '0';
    when "0000" => CODE_AUX <= "0000000000000000000000000000000000"; LENGTH_AUX <= "000000";MISS_AUX <= '0';
end case;
end process ASSEMBLE;


DECIDE : process ( CODE_AUX, LENGTH_AUX, MASK, MATCH_TYPE, MISS_AUX, MISS_TYPE_CODE, MISS_TYPE_LENGTH)
begin

if (MASK(1) = '1') then -- full word
	CODE <= CODE_AUX;
	LENGTH <= LENGTH_AUX;
	MISS <= MISS_AUX;
elsif (MATCH_TYPE = "0000") then -- partial word but full match
	CODE <= CODE_AUX;
	LENGTH <= LENGTH_AUX;
	MISS <= MISS_AUX;
else -- partial word and partial match
	CODE <= MISS_TYPE_CODE;
	LENGTH <= MISS_TYPE_LENGTH;
	MISS <= '1';
end if;

end process DECIDE;

end FIRST; -- end of architecture


