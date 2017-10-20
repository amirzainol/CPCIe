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

library ieee, dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity MUX_RAM is
	port(
		RAM_DATA   : in  std_logic_vector(31 downto 0);
		RAM_MASK   : in  std_logic_vector(3 downto 0);
		REG_DATA   : in  std_logic_vector(31 downto 0);
		REG_MASK   : in  std_logic_vector(3 downto 0);
		EQUAL      : in  std_logic;
		ASSEM_DATA : out std_logic_vector(31 downto 0);
		ASSEM_MASK : out std_logic_vector(3 downto 0)
	);

end MUX_RAM;

architecture MULTIPLEX_3 of MUX_RAM is

begin

	MUX : process(RAM_DATA, RAM_MASK, REG_MASK, REG_DATA, EQUAL)
	begin
		if (EQUAL = '1') then
			ASSEM_DATA <= REG_DATA;
			ASSEM_MASK <= REG_MASK;
		else
			ASSEM_DATA <= RAM_DATA;
			ASSEM_MASK <= RAM_MASK;
		end if;

	end process MUX;

end MULTIPLEX_3;

