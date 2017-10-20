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
--  ENTITY       = ODA_CELL     --
--  version      = 1.0         --
--  last update  = 30/09/99    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- basic component cell of the Out of Date Adaptation register

-- PIN MAP

-- PREVIOUS : the bit on top
-- ACTUAL   : the bit on horizontal
-- MOVE_OUT : move output
-- CLK : system clock
-- RESET : asyncronous reset

library IEEE;
use IEEE.std_logic_1164.all;

entity ODA_CELL_2_D is
port	(
			PREVIOUS : in std_logic;
			MOVE_ENABLE : in std_logic;
			CONTROL : in std_logic;
			ACTUAL : in std_logic;
			CLK : in std_logic;
			CLEAR : in std_logic;
			RESET : in std_logic;
			MOVE_OUT : out std_logic
		);
end ODA_CELL_2_D;

architecture STRUCTURAL of ODA_CELL_2_D is
 
signal MUX : std_logic;
signal MOVE_OUT_aux : std_logic;

begin

process(CLK,RESET,CLEAR)
begin
	if(CLEAR='0') then
		MOVE_OUT_aux <= '0';
	elsif (CLK'event and CLK='1') then
		if(RESET='0') then
			MOVE_OUT_aux <= '0';
		elsif (MOVE_ENABLE = '0') then
			MOVE_OUT_aux <= MUX;
		else 
			MOVE_OUT_aux <= MOVE_OUT_aux;
		end if;
 	end if;
end process;

MUX <= ACTUAL when CONTROL = '0' else PREVIOUS;
MOVE_OUT <= MOVE_OUT_aux;

end STRUCTURAL;	
