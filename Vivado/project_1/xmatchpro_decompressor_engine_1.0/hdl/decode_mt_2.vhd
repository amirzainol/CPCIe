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

------------------------------------
--  ENTITY       = DECODE_MT      --
--  version      = 1.0            --
--  last update  = 25/06/01       --
--  author       = Jose Nunez     --
------------------------------------


-- FUNCTION
-- decodes the input (Huffman) match type code to give a match type,
-- match length and match+literal character length

-- PIN LIST
-- CODE         = input match type code (Huffman)
-- M_LIT_LENGTH = length of match type code and any required literal characters
-- M_TYPE       = decoded match type

library ieee,dzx;
use ieee.std_logic_1164.all;


entity DECODE_MT_2 is
port
(
    	CODE : in std_logic_vector(5 downto 0);
	M_LIT_LENGTH : out std_logic_vector(4 downto 0);
	RL_DETECTED : out std_logic;
	M_TYPE : out std_logic_vector(3 downto 0)
);

end DECODE_MT_2;


architecture HUFFMAN of DECODE_MT_2 is
begin

TREE_DEC : process(CODE)
begin
case CODE is
    when "100000" | "100010" | "100100" |"100110" | "101000"  | "101010"  | "101100" | "101110" | 
		"110000" | "110010" | "110100" |"110110" | "111000"  | "111010"  | "111100" | "111110" |
		"100001" | "100011" | "100101" |"100111" | "101001"  | "101011"  | "101101" | "101111" | 
		"110001" | "110011" | "110101" |"110111" | "111001"  | "111011"  | "111101" | "111111"
    	    	=>  M_TYPE <= "0000";
	    	    M_LIT_LENGTH <= "00010";
				RL_DETECTED <= '0';
	

    when "000000" | "000001"| "000010" | "000011" | "000100" | "000101" | "000110" | "000111"

	 	    	=>  M_TYPE <= "1000";
		    M_LIT_LENGTH <= "01100";
			RL_DETECTED <= '0';   

    when "010000" | "010001"| "010010" | "010011" | "010100" | "010101" | "010110" | "010111"
    	    	=>  M_TYPE <= "0001";
		    M_LIT_LENGTH <= "01100";
 			RL_DETECTED <= '0';

    when "011000" | "011001"| "011010" | "011011" | "011100" | "011101" | "011110" | "011111"
   				=>  M_TYPE <= "0000";
		    M_LIT_LENGTH <= "00100";
			RL_DETECTED <= '1';


    when "001000" |"001001" | "001010" | "001011"
    	    	=>  M_TYPE <= "0011";
		    M_LIT_LENGTH <= "10101";
			RL_DETECTED <= '0';

    when "001111"
    	    	=>  M_TYPE <= "0010";
		    M_LIT_LENGTH <= "01111";
			RL_DETECTED <= '0';

    when "001110"
    	    	=>  M_TYPE <= "0100";
		    M_LIT_LENGTH <= "01111";
			RL_DETECTED <= '0';

    when "001101"
    	    	=>  M_TYPE <= "1001";
		    M_LIT_LENGTH <= "10111";
			RL_DETECTED <= '0';

    when "001100"
    	    	=>  M_TYPE <= "1100";
		    M_LIT_LENGTH <= "10111";
			RL_DETECTED <= '0';

    when others
    	    	=>  M_TYPE <= "1111";
		    M_LIT_LENGTH <= "00000";
			RL_DETECTED <= '0';
end case;

end process TREE_DEC;


end HUFFMAN; -- end of architecture



