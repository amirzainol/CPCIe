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
--  ENTITY       =  LOCATION_EQUAL    --
--  version      = 4.0         --
--  last update  = 11/02/98    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- Movement control multiplexor.
-- Selects either a compressed (A inputs) or decompressed
-- (B inputs) match location and full hit indicator and
-- makes them available on the Y outputs under the control
-- of SELB. If SELB=0 then B inputs are selected.

--  PIN LIST
-- A   = match location for compression
-- B   = match location for decompression
-- SELB = select 
-- ENABLEC = enable compression
-- ENABLED = enable decompression
-- Y   = match location output
 
library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity LOCATION_EQUAL is
	port (
		  WRITE_ADDRESS_IN : in std_logic_vector(3 downto 0);
		  READ_ADDRESS_IN : in std_logic_vector(3 downto 0);
		  CLK : in std_logic;
		  CLEAR : in std_logic;
		  RESET : in std_logic;
		  ENABLE : in std_logic;
		  WRITE_ADDRESS_OUT : out std_logic_vector(3 downto 0);
		  READ_ADDRESS_OUT  : out std_logic_vector(7 downto 0);
	      EQUAL : out std_logic);
end LOCATION_EQUAL;

architecture EQUALITY of LOCATION_EQUAL is

signal EQUAL_INT : std_logic;
signal EQUAL_AUX : std_logic;

begin

COMP : process (WRITE_ADDRESS_IN , READ_ADDRESS_IN, ENABLE)
begin
	if (WRITE_ADDRESS_IN = READ_ADDRESS_IN and ENABLE = '0')then
 		EQUAL_INT <= '1';
		READ_ADDRESS_OUT <= "11111111";			
	else
	    EQUAL_INT <= '0';
    	 READ_ADDRESS_OUT <= "0000" & READ_ADDRESS_IN;	
    end if;
end process COMP;

WRITE_ADDRESS_OUT <= WRITE_ADDRESS_IN;

FLIP_FLOP : process(CLK, CLEAR)
begin
	if(CLEAR = '0') then
		EQUAL_AUX <= '0';
	elsif ((CLK'event) and (CLK = '1')) then 
		if(RESET = '0') then
			EQUAL_AUX <= '0';
		elsif (ENABLE = '0') then
			EQUAL_AUX <= EQUAL_INT;
		else
			EQUAL_AUX <= EQUAL_AUX;
		end if;
	end if;
end process FLIP_FLOP;

EQUAL <= EQUAL_AUX;

end EQUALITY;


