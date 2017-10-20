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
--  entity       = MLD_DECODE  --
--  version      = 1.0         --
--  last update  = 20/04/01    --
--  author       = Jose Nunez  --
---------------------------------

-- FUNCTION
-- Decodes incoming match type into a pre-determined priority.

-- PIN LIST
-- M_TYPE   = input match type.
-- PRIORITY = output priority.

library ieee,dzx;
use ieee.std_logic_1164.all;


entity MLD_DECODE is
port
	(
	M_TYPE : in bit_vector(3 downto 0);
	PRIORITY : out bit_vector(5 downto 0)
	);
end MLD_DECODE;



architecture DEC of MLD_DECODE is

begin

DECODE : process (M_TYPE)
begin
case M_TYPE is
	-- priority 6
	when "0000" => PRIORITY <= "100000";
	-- priority 5
	when "0001" => PRIORITY <= "010000";
	-- priority 4
	when "1000" => PRIORITY <= "001000";
	-- priority 3
	when "0010" | "0100" => PRIORITY <= "000100";        
	-- priority 2
	when "0011" => PRIORITY <= "000010";
	-- priority 1
	when "1001" | "1100" => PRIORITY <= "000001";          
	-- anything else is priority 0
	when others => PRIORITY <= "000000";
end case;

end process DECODE;

end DEC; -- end of architecture


