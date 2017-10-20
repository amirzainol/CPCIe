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

-----------------------------------
--  ENTITY       = CM_ASSEMBLER  --
--  version      = 1.0           --
--  last update  = 16/06/99      --
--  author       = Jose Nunez    --
-----------------------------------


-- FUNCTION
-- assembles the match location code and match type code into a single word


-- PIN LIST
-- CODE_A     = match location code (left justified)
-- MISS       = detects a possible miss
-- CODE_B     = match type code (left justified)
-- LENGTH_B   = match type code length
-- CODE_OUT   = assembled output code
-- LENGTH_OUT = output code length


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.bit_arith.all;
use dzx.attributes.all;

entity CM_ASSEMBLER is
port
(
    	CODE_A : in bit_vector(4 downto 0);
	LENGTH_A : in bit_vector(2 downto 0);
	MISS: in bit;
      CODE_B : in bit_vector(5 downto 0);
      LENGTH_B : in bit_vector(2 downto 0);
    	CODE_OUT : out bit_vector(10 downto 0);
	LENGTH_OUT : out bit_vector(3 downto 0)
);
end CM_ASSEMBLER;


architecture NOSHIFTER of CM_ASSEMBLER is

begin

ASSEMBLE : process(CODE_A , LENGTH_A , CODE_B)

begin

case LENGTH_A is

when "001" => CODE_OUT <= CODE_A(4) & CODE_B & "0000";
when "010" => CODE_OUT <= CODE_A(4 downto 3) & CODE_B & "000";
when "011" => CODE_OUT <= CODE_A(4 downto 2) & CODE_B & "00";
when "100" => CODE_OUT <= CODE_A(4 downto 1) & CODE_B & "0";
when "101" => CODE_OUT <= CODE_A(4 downto 0) & CODE_B;
when others => CODE_OUT <= "00000000000";

end case;

end process ASSEMBLE;


LENGTH_OUT <= ('0' & LENGTH_A) + ('0' & LENGTH_B) when MISS = '0' else "0001";



end NOSHIFTER; -- end of architecture



