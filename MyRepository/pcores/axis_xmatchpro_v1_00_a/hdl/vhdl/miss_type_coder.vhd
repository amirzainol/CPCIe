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

----------------------------------------
--  ENTITY       = MISS_TYPE_CODER    --
--  version      = 1.0        		  --
--  last update  = 10/05/01    		  --
--  author       = Jose Nunez         --
----------------------------------------


-- FUNCTION
-- miss type coder. Converts incoming miss type to a Huffman code word
-- and associated length.


-- PIN LIST
-- MASK        = mask indicatin how many bytes are valid in the search word
-- LITERAL DATA= the 4 bytes of literal data
-- CODE        = output Huffman code (left aligned)
-- LENGTH      = length (number of valid bits) in the output code


library ieee,dzx;
use ieee.std_logic_1164.all;


entity MISS_TYPE_CODER is
port
(
   	MASK : in bit_vector(4 downto 0);
	LITERAL_DATA : in bit_vector(31 downto 0);
	CODE : out bit_vector(33 downto 0);
	LENGTH : out bit_vector(5 downto 0)
);
end MISS_TYPE_CODER;


architecture HUFFMAN of MISS_TYPE_CODER is

 
begin

MISS_TYPE : process(MASK, LITERAL_DATA)
variable BYTE4, BYTE3, BYTE2, BYTE1 : bit_vector(7 downto 0);
begin

BYTE4 := LITERAL_DATA(31 downto 24);
BYTE3 := LITERAL_DATA(23 downto 16);
BYTE2 := LITERAL_DATA(15 downto 8);
BYTE1 := LITERAL_DATA(7 downto 0);

-- generation of miss code

case MASK is 
    when "10000" => CODE <= "1" & "000000000000000000000000000000000" ; LENGTH <= "000001";
    when "11000" => CODE <= "001" & BYTE4 & "00000000000000000000000" ; LENGTH <= "001011";
    when "11100" => CODE <= "0001"& BYTE4 & BYTE3 & "00000000000000" ;  LENGTH <= "010100";
    when "11110" => CODE <= "0000" & BYTE4 & BYTE3 & BYTE2 & "000000" ; LENGTH <= "011100";
    when "11111" => CODE <= "01" & BYTE4 & BYTE3 & BYTE2 & BYTE1 ;      LENGTH <= "100010";
    when others => CODE <= "0000000000000000000000000000000000" ; LENGTH <= "000000";
end case;
end process MISS_TYPE;

end HUFFMAN; -- end of architecture



