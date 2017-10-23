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
--  ENTITY       = ENCODE16_4 --
--  version      = 2.0         --
--  last update  = 16/06/98    --
--  author       = Jose Nunez  --
---------------------------------

-- FUNCTION
-- 16 to 4 encoder to convert active low 16 bit maatch bus input
-- to a 4 bit wide binary code.

--  PIN LIST
--  MATCH_LOC_IN  = 16 bit match location input bus (active low)
--  MATCH_LOC_OUT = 4 bit binary output match location bus
--  MISS          = active low signal to indicate that a miss has occurred

library ieee, dzx;
use ieee.std_logic_1164.all;

entity ENCODE16_4 is
	port(
		MATCH_LOC_IN  : in  std_logic_vector(15 downto 0);
		MATCH_LOC_OUT : out std_logic_vector(3 downto 0)
	);

end ENCODE16_4;

architecture ENC2 of ENCODE16_4 is

begin

	ENCODER : process(MATCH_LOC_IN)
	begin
		case MATCH_LOC_IN is
			when x"FFFE" => MATCH_LOC_OUT <= "0000";
			when x"FFFD" => MATCH_LOC_OUT <= "0001";
			when x"FFFB" => MATCH_LOC_OUT <= "0010";
			when x"FFF7" => MATCH_LOC_OUT <= "0011";
			when x"FFEF" => MATCH_LOC_OUT <= "0100";
			when x"FFDF" => MATCH_LOC_OUT <= "0101";
			when x"FFBF" => MATCH_LOC_OUT <= "0110";
			when x"FF7F" => MATCH_LOC_OUT <= "0111";
			when x"FEFF" => MATCH_LOC_OUT <= "1000";
			when x"FDFF" => MATCH_LOC_OUT <= "1001";
			when x"FBFF" => MATCH_LOC_OUT <= "1010";
			when x"F7FF" => MATCH_LOC_OUT <= "1011";
			when x"EFFF" => MATCH_LOC_OUT <= "1100";
			when x"DFFF" => MATCH_LOC_OUT <= "1101";
			when x"BFFF" => MATCH_LOC_OUT <= "1110";
			when x"7FFF" => MATCH_LOC_OUT <= "1111";
			when x"FFFF" => MATCH_LOC_OUT <= "1111";
			when others  => MATCH_LOC_OUT <= "1111";
				-- when others => null;

		end case;

	end process ENCODER;

end ENC2;                               -- end of architecture

