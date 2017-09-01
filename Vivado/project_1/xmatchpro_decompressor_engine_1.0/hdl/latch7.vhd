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
--  ENTITY       = LATCH7      --
--  version      = 1.0         --
--  last update  = 25/06/99    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- 7 bit latch


-- PIN LIST
-- D_IN  = input data bus
-- CLK   = master clock
-- CLEAR = asynchronous reset of latch
-- D_OUT = output data bus

library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity LATCH7 is
port
(
    	D_IN : in std_logic_vector(6 downto 0);
	ENABLE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	D_OUT : out std_logic_vector(6 downto 0)
);

end LATCH7;


architecture FLIP_FLOP of LATCH7 is

begin

FLOP : process (CLK,CLEAR)
begin
if (CLEAR = '0') then
    D_OUT <= "0000000";
elsif ((CLK'event) and (CLK = '1')) then
	if (RESET = '0') then
   		 D_OUT <= "0000000";
	elsif(ENABLE = '1') then
		D_OUT<= "0000000";
	else
    		D_OUT <= D_IN;
	end if;
end if;
end process FLOP;

end FLIP_FLOP; -- end of architecture



