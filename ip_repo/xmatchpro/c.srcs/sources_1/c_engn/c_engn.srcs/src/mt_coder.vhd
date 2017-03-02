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
--  ENTITY       = MT_CODER    --
--  version      = 1.0         --
--  last update  = 16/06/98    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- match type coder. Converts incoming match type to a Huffman code word
-- and associated length.


-- PIN LIST
-- MATCH_TYPE = input match type bus
-- CODE       = output Huffman code (left aligned)
-- LENGTH     = length (number of valid bits) in the output code


library ieee,dzx;
use ieee.std_logic_1164.all;


entity MT_CODER is
port
(
    MATCH_TYPE : in std_logic_vector(3 downto 0);
	CODE : out std_logic_vector(5 downto 0);
	LENGTH : out std_logic_vector(2 downto 0)
);



end MT_CODER;


architecture HUFFMAN of MT_CODER is

begin

MATCH : process(MATCH_TYPE)
begin
case MATCH_TYPE is 
    when "0000" => CODE <= "100000"; LENGTH <= "001";
    when "0001" => CODE <= "010000"; LENGTH <= "011";
    when "0010" => CODE <= "001111"; LENGTH <= "110";
    when "0011" => CODE <= "001000"; LENGTH <= "100";
    when "0100" => CODE <= "001110"; LENGTH <= "110";
    when "1000" => CODE <= "000000"; LENGTH <= "011";
    when "1001" => CODE <= "001101"; LENGTH <= "110";
    when "1100" => CODE <= "001100"; LENGTH <= "110";
    when others => CODE <= "000000"; LENGTH <= "000";
end case;
end process MATCH;

end HUFFMAN; -- end of architecture



