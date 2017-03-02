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

---------------------------------------
--  ENTITY       = MLD_LOGIC_3_1_2   --
--  version      = 1.0      	   --
--  last update  = 2/9/99   		 --
--  author       = Jose Nunez  		--
--------------------------------------


-- FUNCTION
-- Match location decision logic.
-- This reads in the match types from each location in the CAM array
-- and decides which location provides the best hit in terms of the
-- minimum number of code bits output.
-- This is part 1 and only generates the propagation 

--  PIN LIST
--  TYPE_A/B/C/D = match type inputs. A = msb for each location
--    	    	    D = lsb for each location.
--  DOWN_PRIORITY__6/5/4/3/2/1 = these are the priorities that have been propagated
--  COLUMN_OR = the result of the or of each column column 5 is full hit

library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.bit_utils.all;


entity MLD_LOGIC_3_1_2 is
port
(
      TYPE_A : in std_logic_vector(15 downto 0) ;
      TYPE_B : in std_logic_vector(15 downto 0) ;
      TYPE_C : in std_logic_vector(15 downto 0) ;
      TYPE_D : in std_logic_vector(15 downto 0) ;	
	  DOWN_PRIORITY_6 : out std_logic_vector(15 downto 0);
        DOWN_PRIORITY_5 : out std_logic_vector(15 downto 0);
	  DOWN_PRIORITY_4 : out std_logic_vector(15 downto 0);
	  DOWN_PRIORITY_3 : out std_logic_vector(15 downto 0);
	  DOWN_PRIORITY_2 : out std_logic_vector(15 downto 0);
	  DOWN_PRIORITY_1 : out std_logic_vector(15 downto 0);
	  COLUMN_OR : out std_logic_vector(6 downto 1)
);

end MLD_LOGIC_3_1_2;

architecture DECIDE_3 of MLD_LOGIC_3_1_2 is

component MLD_DECODE
port
	(
	M_TYPE : in std_logic_vector(3 downto 0);
	PRIORITY : out std_logic_vector(5 downto 0)
	);
end component;

type MTYPE_ARRAY is array(0 to 15) of std_logic_vector(3 downto 0);
type PRI_ARRAY is array(0 to 15) of std_logic_vector(6 downto 1);
type PRI_TRANS_ARRAY is array(6 downto 1) of std_logic_vector(0 to 15);

signal MTYPE_IN : MTYPE_ARRAY;
signal PRIORITY : PRI_ARRAY;
signal TRANS_PRIORITY : PRI_TRANS_ARRAY;
-- signal SECOND_TRANS_PRI : PRI_TRANS_ARRAY;

  function Or_Bits (v: std_logic_Vector) return std_logic is
    variable ret: std_logic := '0';
  begin
    for j in v'range loop
      ret := ret or v(j);
    end loop;

    return ret;
  end Or_Bits;
  
begin

-- copy the 4 input vectors MTYPE_A/B/C/D into one array MTYPE_IN
-- also transpose the PRIORITY array
ASSIGN_ARRAYS : process (TYPE_A , TYPE_B , TYPE_C , TYPE_D)
begin
for I in 0 to 15 loop
    	MTYPE_IN(I)(3) <= TYPE_A(I);
    	MTYPE_IN(I)(2) <= TYPE_B(I);
    	MTYPE_IN(I)(1) <= TYPE_C(I);
    	MTYPE_IN(I)(0) <= TYPE_D(I);
end loop;
end process ASSIGN_ARRAYS;

ASSIGN2 : process (PRIORITY)
begin
for I in 6 downto 1 loop
	for J in 0 to 15 loop
		TRANS_PRIORITY(I)(J) <= PRIORITY(J)(I);
	end loop;
end loop;
end process ASSIGN2;


-- instantiate a match type to priority decoder for each location
PRI_DEC : for I in 0 to 15 generate
	LOC : MLD_DECODE port map (	M_TYPE => MTYPE_IN(I),
					PRIORITY => PRIORITY(I)
					);
end generate;


OR_GENERATION : for I in 1 to 6 generate
			COLUMN_OR(I) <= Or_bits(TRANS_PRIORITY(I));
end generate;

													 
DOWN_PRIORITY_6 <= TRANS_PRIORITY(6);
DOWN_PRIORITY_5 <= TRANS_PRIORITY(5);
DOWN_PRIORITY_4 <= TRANS_PRIORITY(4);	
DOWN_PRIORITY_3 <= TRANS_PRIORITY(3);
DOWN_PRIORITY_2 <= TRANS_PRIORITY(2);
DOWN_PRIORITY_1 <= TRANS_PRIORITY(1);												 									


end DECIDE_3;






 
