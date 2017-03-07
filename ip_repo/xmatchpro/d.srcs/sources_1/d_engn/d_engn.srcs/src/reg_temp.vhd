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
--  ENTITY       = REG_TEMP     --
--  version      = 1.0         --
--  last update  = 21/08/00    --
--  author       = Jose Nunez  --
---------------------------------


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

use dzx.bit_utils.all;

entity REG_TEMP is
port
(
      DATA_IN : in std_logic_vector(31 downto 0) ;
      MASK_IN : in std_logic_vector(3 downto 0) ;
      CLK : in std_logic ;   
	  CLEAR : in std_logic ;
	  RESET : in std_logic;
		ENABLE : in std_logic;
	  DATA_OUT : out std_logic_vector(31 downto 0); 
	  MASK_OUT : out std_logic_vector(3 downto 0)
);
    end REG_TEMP;



architecture LATCH of REG_TEMP is



signal QOUT : std_logic_vector(31 downto 0);
signal MOUT : std_logic_vector(3 downto 0);

begin

FLIP_FLOPS : process (CLK,CLEAR)
begin
    	-- asynchronous RESET signal forces all outputs LOW
        if (CLEAR = '0') then
	       QOUT <= x"00000000";
		   MOUT <= "1111";
	  -- check for +ve clock edge
	  elsif ((CLK'event) and (CLK = '1')) then
	  -- check for synchronous clear signal
	  	 if (RESET = '0') then
	       QOUT <= x"00000000";
		   MOUT <= "1111";
		 elsif (ENABLE = '0') then
			 QOUT <= DATA_IN;
			 MOUT <= MASK_IN;
		else
				 QOUT <= QOUT;
			 	MOUT <= MOUT;
		 end if;
	   end if;
end process FLIP_FLOPS;



DATA_OUT <= To_X01Z(QOUT);
MASK_OUT <= To_X01Z(MOUT);


end LATCH;

