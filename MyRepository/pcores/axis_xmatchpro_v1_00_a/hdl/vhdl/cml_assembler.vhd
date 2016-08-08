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
--  ENTITY       = CML_ASSEMBLER --
--  version      = 1.0           --
--  last update  = 9/09/99      --
--  author       = Jose Nunez    --
-----------------------------------


-- FUNCTION
-- assembles the match location / match type codes and literal characters into a single word


-- PIN LIST
-- CODE_A     = match location/type code (left justified)
-- LENGTH_A   = match location/type code length
-- CODE_B     = literal characters (left justified)
-- LENGTH_B   = length of literal characters
-- CODE_OUT   = assembled output code
-- LENGTH_OUT = output code length


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.bit_arith.all;


entity CML_ASSEMBLER is
port
(
    	CODE_A : in bit_vector(10 downto 0);
	LENGTH_A : in bit_vector(3 downto 0);
	CODE_B : in bit_vector(33 downto 0);
	LENGTH_B : in bit_vector(5 downto 0);
   	CODE_OUT : out bit_vector(34 downto 0);
	LENGTH_OUT : out bit_vector(5 downto 0)
);




end CML_ASSEMBLER;


architecture SHIFTER of CML_ASSEMBLER is

begin

SHIFT : process ( CODE_A , CODE_B , LENGTH_A )
begin
case LENGTH_A is
    when "0000" => CODE_OUT <= CODE_B & '0';
    when "0001" => CODE_OUT <= CODE_A(10)           & CODE_B;
    when "0010" => CODE_OUT <= CODE_A(10 downto 9) & CODE_B(33 downto 1);
    when "0011" => CODE_OUT <= CODE_A(10 downto 8) & CODE_B(33 downto 2);
    when "0100" => CODE_OUT <= CODE_A(10 downto 7)  & CODE_B(33 downto 3);
    when "0101" => CODE_OUT <= CODE_A(10 downto 6)  & CODE_B(33 downto 4);
    when "0110" => CODE_OUT <= CODE_A(10 downto 5)  & CODE_B(33 downto 5);
    when "0111" => CODE_OUT <= CODE_A(10 downto 4)  & CODE_B(33 downto 6);
    when "1000" => CODE_OUT <= CODE_A(10 downto 3)  & CODE_B(33 downto 7);
    when "1001" => CODE_OUT <= CODE_A(10 downto 2)  & CODE_B(33 downto 8);
    when "1010" => CODE_OUT <= CODE_A(10 downto 1)  & CODE_B(33 downto 9);
    when "1011" => CODE_OUT <= CODE_A  & CODE_B(33 downto 10);
    when others => CODE_OUT <= "00000000000000000000000000000000000";
end case;
end process SHIFT;



LENGTH_OUT <= ("00" & LENGTH_A) + LENGTH_B;


end SHIFTER; -- end of architecture



