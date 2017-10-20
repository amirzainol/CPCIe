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
--  ENTITY       = MLD_DPROP_5_C   --
--  version      = 1.0         --
--  last update  = 20/07/99    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- Match location decision down propagation logic.
-- This takes in a column of priority bits and produces a resultant bit vector
-- with only one bit (at most) set. This bit is the first bit set in
-- the input column.
-- This is the down propagation that is required, i.e for equal priorities,
-- the location closest to the top of the table is the one to be chosen.
-- This unit is specific to the propagation of the column 5 or full match for the movement generation

-- PIN LIST
-- DIN     = input column of bits
-- DOUT    = resultant column of bits
-- FULL_OR = or function of all bits in DIN.


library ieee,dzx;
use ieee.std_logic_1164.all;

entity MLD_DPROP_5_C is
port
	(
	DIN : in std_logic_vector(0 to 15);
	DOUT : out std_logic_vector(14 downto 0);
	FULL_OR : out std_logic
	);
end MLD_DPROP_5_C;


architecture DOWN_2 of MLD_DPROP_5_C is

signal B_ROW : std_logic_vector(0 to 15);
signal C_ROW : std_logic_vector(0 to 15);
signal D_ROW : std_logic_vector(0 to 15);


begin

GEN_B : process (DIN)
begin
for I in 0 to 7 loop
	B_ROW(2*I) <= DIN(2*I);
	B_ROW(2*I+1) <= DIN(2*I+1) or DIN(2*I);
end loop;
end process GEN_B;


GEN_C : process (B_ROW)
begin
for I in 0 to 3 loop
	for J in 0 to 1 loop
		C_ROW(4*I+J) <= B_ROW(4*I+J);
	end loop;
	for J in 2 to 3 loop
		C_ROW(4*I+J) <= B_ROW(4*I+1) or B_ROW(4*I+J);
	end loop;
end loop;
end process GEN_C;


GEN_D : process (C_ROW)
begin
for I in 0 to 1 loop
	for J in 0 to 3 loop
		D_ROW(8*I+J) <= C_ROW(8*I+J);
	end loop;
	for J in 4 to 7 loop
		D_ROW(8*I+J) <= C_ROW(8*I+3) or C_ROW(8*I+J);
	end loop;
end loop;
end process GEN_D;


GEN_E : process (D_ROW)
begin
	for J in 0 to 7 loop
		DOUT(J) <= not(D_ROW(J));
	end loop;
	for J in 8 to 14 loop
		DOUT(J) <= D_ROW(7) nor D_ROW(J);
	end loop;
end process GEN_E;



--GEN_DOUT : process (G_ROW)
--begin

--for J in 0 to 62 loop
--	DOUT(J) <= G_ROW(J);
--end loop;
--end process GEN_DOUT;



FULL_OR <= D_ROW(7) or D_ROW(15);



end DOWN_2; -- end of architecture



