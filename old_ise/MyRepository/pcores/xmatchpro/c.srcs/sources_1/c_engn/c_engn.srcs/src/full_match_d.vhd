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
--  ENTITY       = FULL_MATCH_D            --
--  version      = 1.0                     --
--  last update  = 3/06/01                 --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- the full match detection unit detects a full match with the same length for movement generation

-- PIN LIST

-- PRIORITY_6 : 4 bytes match
-- PRIORITY_5 : 3 bytes match
-- PRIORITY_2 : 2 bytes match
-- SAME_LENGTH_2 : detect the same length of 2 search and present
-- SAME_LENGTH_3 : detect the same length of 3 search and present
-- SAME_LENGTH_4 : detect the same length of 4 search and present
-- FULL_MATCH_VECTOR : output with only one bit set to 1 for full match with same length

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library dzx;
use dzx.bit_utils.all;

entity FULL_MATCH_D is
port ( 
		  NFL_M_ONE : in std_logic_vector(7 downto 0); --control how many locations are active
 		  MOVE_ENABLE : in std_logic;
       PRIORITY_6: in std_logic_vector(15 downto 0);
		  PRIORITY_5: in std_logic_vector(15 downto 0);
		  PRIORITY_2: in std_logic_vector(15 downto 0);
		  SAME_LENGTH_2: in std_logic_vector(15 downto 0);
		  SAME_LENGTH_3: in std_logic_vector(15 downto 0);
		  SAME_LENGTH_4: in std_logic_vector(15 downto 0);
		  CLK : in std_logic;
		  CLEAR : in std_logic;
		  RESET : in std_logic;
		  FULL_MATCH : out std_logic;
		  FULL_MATCH_AT_ZERO : out std_logic;
		  SAME_POSITION : out std_logic;
		  FULL_MATCH_VECTOR : out std_logic_vector(15 downto 0)
	  );
end FULL_MATCH_D;

architecture STRUCTURAL of FULL_MATCH_D is

signal FULL_MATCH_VECTOR_aux : std_logic_vector(15 downto 0);
signal FULL_MATCH_VECTOR_old : std_logic_vector(15 downto 0);
signal NOR_ARRAY :  std_logic_vector(15 downto 0);

  function Or_Bits (v: std_logic_Vector) return std_logic is
    variable ret: std_logic := '0';
  begin
    for j in v'range loop
      ret := ret or v(j);
    end loop;

    return ret;
  end Or_Bits;

  function Nor_Bits (v: std_logic_Vector) return std_logic is
  begin
    return (not Or_Bits(v));
  end Nor_Bits;

begin

FULL_MATCH_VECTOR_aux <= (SAME_LENGTH_4 and PRIORITY_6) or (SAME_LENGTH_3 and PRIORITY_5) or (SAME_LENGTH_2 and PRIORITY_2);

FULL_MATCH <= or_bits(FULL_MATCH_VECTOR_aux);

FULL_MATCH_AT_ZERO <= FULL_MATCH_VECTOR_aux(15) and FULL_MATCH_VECTOR_old(15);

FULL_MATCH_VECTOR <= FULL_MATCH_VECTOR_aux;


-- we need to store the old full match vector to know if a new full match is detected in the same position

LOCATE_SAME_POSITION : process(CLK, CLEAR)
begin

if (CLEAR = '0') then
	FULL_MATCH_VECTOR_old <= x"0000";
elsif (CLK'event and CLK = '1') then
	if(RESET = '0') then
		FULL_MATCH_VECTOR_old <= x"0000";
	elsif ( MOVE_ENABLE = '0') then
		FULL_MATCH_VECTOR_old <= FULL_MATCH_VECTOR_aux;
  else
		FULL_MATCH_VECTOR_old <= FULL_MATCH_VECTOR_old;
	end if;
end if;

end process;

VERIFY_SAME_POSITION : process(FULL_MATCH_VECTOR_old,FULL_MATCH_VECTOR_aux,NFL_M_ONE)

variable NFL_INT : integer range 0 to 15;

begin

NFL_INT := to_integer(unsigned((NFL_M_ONE)));

for i in 15 downto 0 loop -- 16 location dictionary
  if i >= (15-NFL_INT) then
		NOR_ARRAY(i) <= FULL_MATCH_VECTOR_old(i) xor FULL_MATCH_VECTOR_aux(i);
	else
		NOR_ARRAY(i) <= '0';
	end if;
end loop;

end process;

SAME_POSITION <= nor_bits(NOR_ARRAY);

--SAME_POSITION <= nor_bits(FULL_MATCH_VECTOR_old xor FULL_MATCH_VECTOR_aux);

end STRUCTURAL;
