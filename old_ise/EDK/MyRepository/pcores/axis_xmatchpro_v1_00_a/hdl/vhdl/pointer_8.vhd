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

--------------------------------------
--  ENTITY       = POINTER_8        --
--  version      = 1.0              --
--  last update  = 9/05/00          --
--  author       = Jose Nunez       --
--------------------------------------


-- FUNCTION
-- first pointer


--  PIN LIST
--  PREVIOUS = data from the previous location in the pointer array
--  MOVE = select if load data or keep current data
--  CLEAR    = asynchronous clear of the data latches (active LOW)
--  CLK      = master clock
--  DOUT     = output of the data latches



library ieee;
use ieee.std_logic_1164.all;

entity POINTER_8 is
port
(
	PREVIOUS : in bit_vector(3 downto 0);
	MOVE : in bit;
	CLEAR : in bit ;
	RESET : in bit;
	CLK : in bit ;
	DOUT : out bit_vector(3 downto 0)

);
end POINTER_8;

architecture POINTER1 of POINTER_8 is

signal DOUT_AUX : bit_vector(3 downto 0);


begin

FLIP_FLOPS : process (CLK,CLEAR)
begin
     if (CLEAR = '0') then
	    DOUT_AUX <= "1000";
	  elsif ((CLK'event) and (CLK = '1')) then
	  		if (RESET = '0') then
	  			  DOUT_AUX <= "1000";
	  		elsif (MOVE = '1') then
	    			DOUT_AUX <= PREVIOUS;
			else
					DOUT_AUX <= DOUT_AUX;		
	 
	        end if;
	end if;
end process FLIP_FLOPS;

DOUT <= DOUT_AUX;

end POINTER1;

