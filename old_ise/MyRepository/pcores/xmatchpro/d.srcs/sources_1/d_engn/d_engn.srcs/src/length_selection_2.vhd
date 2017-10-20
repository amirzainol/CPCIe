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

---------------------------------------------
--  ENTITY       = MAX_PBC_LENGTH          --
--  version      = 1.0                     --
--  last update  = 20/07/01                 --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- produces two possible start for the match type code depending on the PBC code

--  PIN LIST


--  NFL_MINUS_ONE = next free location minus one
--  CODE = all the bits that can contain match location plus match type code
--  POS_MT_K_1 = match type when using k-1 bits
--  POS_MT_K = match type when using k bits


library dzx;
use dzx.bit_arith.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity LENGTH_SELECTION_2 is 

port (MATCH_LOC_K : in std_logic_vector(3 downto 0);
	  MATCH_LOC_K_1 : in std_logic_vector(3 downto 0);
	  SUB : in std_logic_vector(4 downto 0);
	  MAX_MATCH_LENGTH : in std_logic_vector(2 downto 0);
	  MATCH_LENGTH : out std_logic_vector(2 downto 0);
	  SEL_MATCH_LOC : out std_logic_vector(3 downto 0);
	  K_BITS: out std_logic
	 );

end LENGTH_SELECTION_2;

architecture STRUCTURAL of LENGTH_SELECTION_2 is

begin

SEL : process(SUB, MATCH_LOC_K, MATCH_LOC_K_1, MAX_MATCH_LENGTH)

variable MATCH_LOC_TEMP : std_logic_vector(4 downto 0);

begin 

	MATCH_LOC_TEMP := '0' & MATCH_LOC_K - SUB;

	if ( '0' & MATCH_LOC_K_1 < SUB) then
		K_BITS <= '0';
		MATCH_LENGTH <= MAX_MATCH_LENGTH - "001";
		SEL_MATCH_LOC <= MATCH_LOC_K_1;
	else
		K_BITS <= '1';
		MATCH_LENGTH <= MAX_MATCH_LENGTH;
		SEL_MATCH_LOC <= MATCH_LOC_TEMP(3 downto 0);
	end if;
end process SEL;

end STRUCTURAL;
