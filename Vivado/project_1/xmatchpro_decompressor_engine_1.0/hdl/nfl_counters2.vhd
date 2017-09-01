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
--  ENTITY       = NFL_COUNTERS2  --
--  version      = 2.0            --
--  last update  = 08/08/01       --
--  author       = Jose Nunez     --
------------------------------------


-- FUNCTION
-- synchronous counters to provide the next free location (NFL)
-- and next free location minus 1 (NFL_MINUS_ONE).

--  PIN LIST
--  INC           = synchronous increment of counters (active HIGH).
--  COUNT_ENABLE  = enable counting (active LOW).
--  CLK           = master clock.
--  RESET         = asynchronous reset of counters (active LOW).
--  NFL_MINUS_ONE = next free location minus one.
--  TABLE_FULL    = indicates that the table is full and the counters have been frozen

library dzx;
use dzx.bit_arith.all;
use dzx.attributes.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NFL_COUNTERS2 is
port
(
      INC : in std_logic ;
      COUNT_ENABLE : in std_logic ;
      CLK : in std_logic ;
      RESET : in std_logic ;
      CLEAR : in std_logic;
      NFL_MINUS_ONE : out std_logic_vector(7 downto 0) ;
      TABLE_FULL : out std_logic
);


end NFL_COUNTERS2;



architecture COUNT3 of NFL_COUNTERS2 is



signal TEMP_NFL_M_ONE : std_logic_vector(7 downto 0);




begin




COUNTERS : process ( CLK , CLEAR)



begin

-- CAM array starts with two valid locations 0 and 1(run length)

if (CLEAR = '0') then

	TEMP_NFL_M_ONE <= "00000001";

elsif ((CLK'event) and (CLK = '1')) then



		if( RESET = '0') then

			

			TEMP_NFL_M_ONE <= "00000001";


		elsif ((INC = '1') and (COUNT_ENABLE = '0')) then	    -- INC is full match active at one

			if (TEMP_NFL_M_ONE = "00001111") then

				TEMP_NFL_M_ONE <= TEMP_NFL_M_ONE;

			else

				TEMP_NFL_M_ONE <= TEMP_NFL_M_ONE + "00000001";

			end if;

		end if;

end if;

end process COUNTERS;


TABLE_FULL <= '0' when TEMP_NFL_M_ONE = "00001111" else '1';

NFL_MINUS_ONE <= TEMP_NFL_M_ONE;





end COUNT3;


