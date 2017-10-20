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

-------------------------------------
--  ENTITY       = DECODE4_16_INV  --
--  version      = 3.0             --
--  last update  = 10/09/99        --
--  author       = Jose Nunez      --
-------------------------------------

-- FUNCTION
-- 4 to 16 match location decoder (active high outputs)

-- PIN LIST
-- MATCH_LOC_IN  = input match location (binary)
-- MATCH_LOC_OUT = output match location (active high outputs)

library ieee, dzx;
use ieee.std_logic_1164.all;
use dzx.bit_arith.all;
use dzx.attributes.all;

entity DECODE4_16_inv is
	port(
		MATCH_LOC_IN  : in  std_logic_vector(3 downto 0);
		MATCH_LOC_OUT : out std_logic_vector(15 downto 0)
	);

end DECODE4_16_inv;

architecture DEC1 of DECODE4_16_inv is
begin

	DECODE : process(MATCH_LOC_IN)
	begin
		case MATCH_LOC_IN is
			when "0000" => MATCH_LOC_OUT <= x"0001";
			when "0001" => MATCH_LOC_OUT <= x"0002";
			when "0010" => MATCH_LOC_OUT <= x"0004";
			when "0011" => MATCH_LOC_OUT <= x"0008";
			when "0100" => MATCH_LOC_OUT <= x"0010";
			when "0101" => MATCH_LOC_OUT <= x"0020";
			when "0110" => MATCH_LOC_OUT <= x"0040";
			when "0111" => MATCH_LOC_OUT <= x"0080";
			when "1000" => MATCH_LOC_OUT <= x"0100";
			when "1001" => MATCH_LOC_OUT <= x"0200";
			when "1010" => MATCH_LOC_OUT <= x"0400";
			when "1011" => MATCH_LOC_OUT <= x"0800";
			when "1100" => MATCH_LOC_OUT <= x"1000";
			when "1101" => MATCH_LOC_OUT <= x"2000";
			when "1110" => MATCH_LOC_OUT <= x"4000";
			when "1111" => MATCH_LOC_OUT <= x"8000";
			when others => null;
		end case;
	end process DECODE;
end DEC1;                               -- end of architecture

