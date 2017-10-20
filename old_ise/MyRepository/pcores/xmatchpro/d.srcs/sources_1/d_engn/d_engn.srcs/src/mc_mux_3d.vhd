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
--  ENTITY       = MC_MUX_3      --
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

entity MC_MUX_3D is
port
(
      B   : in std_logic_vector(15 downto 0) ; 
      ENABLED: in std_logic;
      Y   : out std_logic_vector(15 downto 0)       
);


end MC_MUX_3D;

architecture MULTIPLEX_3 of MC_MUX_3D is

begin

MUX : process (B , ENABLED)
begin   
	    if (ENABLED='0') then
              	        Y <= B;
	    else
	        		    Y <= "1000000000000000";

	    end if;			   

end process MUX;


end MULTIPLEX_3;


