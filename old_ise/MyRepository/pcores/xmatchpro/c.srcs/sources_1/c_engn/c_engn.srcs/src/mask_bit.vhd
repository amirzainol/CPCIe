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
--  ENTITY       = MASK_BIT     --
--  version      = 1.0         --
--  last update  = 30/06/01    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- basic bit element of the MASK array
-- reset to zero

--  PIN LIST
--  SEARCH   = input search data bit
--  PREVIOUS = data from the previous location in the array
--  MOVE     = movement control
--  CLEAR    = asynchronous clear of the data latch (active LOW)
--  CLK      = master clock
--  RESET    = asynchronous reset of the data latch (active LOW)
--  DOUT     = output of the data latch
--  MATCH    = indicates a match between search bit and data bit (active LOW)


library ieee;
use ieee.std_logic_1164.all;

entity MASK_BIT is
port
(
	SEARCH : in std_logic;
	PREVIOUS : in std_logic;
	MOVE : in std_logic;
	CLEAR : in std_logic ;
	RESET : in std_logic;
	CLK : in std_logic ;
	DOUT : out std_logic;
	MATCH : out std_logic
);


end MASK_BIT;



architecture BIT1 of MASK_BIT is

signal TEMP_D : std_logic;
signal TEMP_Q : std_logic;

begin


COMB : process (TEMP_Q , PREVIOUS , MOVE)
begin

if (MOVE = '1') then
	        TEMP_D <= PREVIOUS;	-- get data from previous location
else
	     	TEMP_D <= TEMP_Q;  	-- keep current data
end if;
--end if;

end process COMB;


-- mask cleared to 1 so all the data is valid from the start but because all the data is zero only first is real valid

LATCHES : process (CLK,CLEAR)
begin

if (CLEAR = '0') then
	TEMP_Q <= '1';	
elsif ((CLK'event) and (CLK = '1')) then
	if (RESET = '0') then
		TEMP_Q <= '1';
	else
		TEMP_Q <= TEMP_D;
	end if;
end if;

end process LATCHES;



DOUT <= TEMP_Q;
MATCH <= SEARCH nand TEMP_Q;		-- match goes low if SEARCH = TEMP_Q = 1


end BIT1;


