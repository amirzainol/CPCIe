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
--  ENTITY       = MG_LOGIC    --
--  version      = 1.0         --
--  last update  = 11/02/98    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- Movement generation logic.
-- This generates the required MOVE control bus according to the hit location
-- and whether or not a full hit has occurred.


--  PIN LIST
--  MATCH_LOC   = input match location (at most 1 bit is low, indicating
--                 the match location).
--  FULL_HIT    = input signal indicating that a full hit has occurred
--                 (active low).
--  MOVE        = output bus to control movement of data in the CAM array.


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity MG_LOGIC_2 is
port
(
      MATCH_LOC : in std_logic_vector(15 downto 0) ;
      FULL_HIT : in std_logic ;
      MOVE : out std_logic_vector(15 downto 0)
);



end MG_LOGIC_2;


architecture MOVE_2 of MG_LOGIC_2 is

-- signal TEMP_MOVE : std_logic_vector(127 downto 0);

begin

ENABLE : process (FULL_HIT,MATCH_LOC)

variable MOVE_TEMP: std_logic_vector(15 downto 0); 

begin



if (FULL_HIT = '1') then
		MOVE_TEMP := "0000000000000000";
			   	
else
		MOVE_TEMP := MATCH_LOC;
end if;

for I in 0 to 15 loop
	MOVE(15-I) <= MOVE_TEMP(I);
end loop;

end process ENABLE;


end MOVE_2;


