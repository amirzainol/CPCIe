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
--  ENTITY       = POINTER_ARRAY   --
--  version      = 1.0         --
--  last update  = 9/05/00    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- 16x4 element POINTER array.
-- Used only for decompression in the full duplex device


--  PIN LIST
--  PREVIOUS  = input to load pointer in the pointer array
--  MOVE      = movement control
--  SEL_WRITE  = selection of address to write in RAM. To the top of the pointer array
--  SEL_READ = selection of address to read in RAM
--  CLK       = master clock
--  CLEAR     = asynchronous reset of the data latch (active LOW)
--  WRITE_ADDRESS = address to write in RAM 
--  READ_ADDRESS = address to read in RAM


library dzx;
use dzx.bit_utils.all;
use dzx.attributes.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity POINTER_ARRAY is
port
(

	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic_vector(15 downto 1);
	MOVE_ENABLE : in std_logic;
	SEL_WRITE : in std_logic_vector(15 downto 0);
	SEL_READ : in std_logic_vector(15 downto 0);
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic ;
	WRITE_ADDRESS : out std_logic_vector(3 downto 0);
	READ_ADDRESS : out std_logic_vector(3 downto 0)
   
);

end POINTER_ARRAY;


architecture ARRAY1 of POINTER_ARRAY is

component POINTER_FIRST
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE_ENABLE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;


component POINTER_1
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;


component POINTER_2
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_3
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_4
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_5
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_6
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_7
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_8
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_9
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_10
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_11
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_12
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_13
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;

component POINTER_14
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;



component POINTER_15
port
(
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
	CLK : in std_logic;
	DOUT : out std_logic_vector(3 downto 0)
);
end component;




type DATA_ARRAY is array(15 downto 0) of std_logic_vector(3 downto 0);
signal MUX_DATA : DATA_ARRAY;

type MUX_ARRAY is array(3 downto 0) of std_logic_vector(15 downto 0);
signal MOVE_AUX : std_logic_vector(15 downto 1);

  function Or_Bits (v: std_logic_Vector) return std_logic is
    variable ret: std_logic := '0';
  begin
    for j in v'range loop
      ret := ret or v(j);
    end loop;

    return ret;
  end Or_Bits;
  
begin


P_ARRAY_FIRST_LOC0 : POINTER_FIRST
				port map ( PREVIOUS => PREVIOUS,
						 MOVE_ENABLE => MOVE_ENABLE,
			 		       CLEAR => CLEAR,
						   RESET => RESET,
			               CLK => CLK,
			               DOUT => MUX_DATA(0));
			              
 
    
P_ARRAY_REMAINING_REST_1 : POINTER_1 
				port map ( PREVIOUS => MUX_DATA(0),
				    	   MOVE => MOVE_AUX(1),
				           CLEAR => CLEAR,
						   RESET => RESET,
				           CLK => CLK,
				    	   DOUT => MUX_DATA(1));
		
    
P_ARRAY_REMAINING_REST_2 : POINTER_2 
				port map ( PREVIOUS => MUX_DATA(1),
				    	   MOVE => MOVE_AUX(2),
			            	CLEAR => CLEAR,
							RESET => RESET,
				        	CLK => CLK,
				    	    DOUT => MUX_DATA(2));
				    
P_ARRAY_REMAINING_REST_3 : POINTER_3 
				port map ( PREVIOUS => MUX_DATA(2),
				    	   MOVE => MOVE_AUX(3),
						  CLEAR => CLEAR,
						  RESET => RESET,
						  CLK => CLK,
						  DOUT => MUX_DATA(3));

P_ARRAY_REMAINING_REST_4 : POINTER_4 
				port map ( 
						PREVIOUS => MUX_DATA(3),
						MOVE => MOVE_AUX(4),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(4));



P_ARRAY_REMAINING_REST_5 : POINTER_5 port map ( 
						PREVIOUS => MUX_DATA(4),
						MOVE => MOVE_AUX(5),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(5));

				    
P_ARRAY_REMAINING_REST_6 : POINTER_6 port map ( 
						PREVIOUS => MUX_DATA(5),
						MOVE => MOVE_AUX(6),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(6));
				    
P_ARRAY_REMAINING_REST_7 : POINTER_7 port map ( 
						PREVIOUS => MUX_DATA(6),
						MOVE => MOVE_AUX(7),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(7));

P_ARRAY_REMAINING_REST_8 : POINTER_8 port map (
						PREVIOUS => MUX_DATA(7),
						MOVE => MOVE_AUX(8),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(8));


P_ARRAY_REMAINING_REST_9 : POINTER_9 port map ( 
						PREVIOUS => MUX_DATA(8),
						MOVE => MOVE_AUX(9),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(9));



P_ARRAY_REMAINING_REST_10 : POINTER_10 port map ( 
						PREVIOUS => MUX_DATA(9),
						MOVE => MOVE_AUX(10),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(10));


P_ARRAY_REMAINING_REST_11 : POINTER_11 port map ( 
						PREVIOUS => MUX_DATA(10),
						MOVE => MOVE_AUX(11),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(11));
						
P_ARRAY_REMAINING_REST_12 : POINTER_12 port map ( 
						PREVIOUS => MUX_DATA(11),
						MOVE => MOVE_AUX(12),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(12));

P_ARRAY_REMAINING_REST_13 : POINTER_13 port map (
						PREVIOUS => MUX_DATA(12),
						MOVE => MOVE_AUX(13),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(13));



P_ARRAY_REMAINING_REST_14 : POINTER_14 port map (
						PREVIOUS => MUX_DATA(13),
						MOVE => MOVE_AUX(14),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(14));

P_ARRAY_REMAINING_REST_15 : POINTER_15 port map (
						PREVIOUS => MUX_DATA(14),
						MOVE => MOVE_AUX(15),
						CLEAR => CLEAR,
						RESET => RESET,
						CLK => CLK,
						DOUT => MUX_DATA(15));


 
-- MOVE_AUX <= MOVE when MOVE_ENABLE = '0' else "000000000000000";
  	
MOVE_AUX <= MOVE;
					
-- mux is implemented as an or-and array
MUX_WRITE : process ( MUX_DATA , SEL_WRITE )            -- multiplex out the selected data element
variable TEMP_OUT : MUX_ARRAY;
begin
for COL_BIT in 0 to 3 loop
	for LOC in 0 to 15 loop
		TEMP_OUT(COL_BIT)(LOC) := MUX_DATA(LOC)(COL_BIT) and SEL_WRITE(15-LOC);
	end loop;
end loop;

for COL in 0 to 3 loop
	WRITE_ADDRESS(COL) <= Or_Bits(TEMP_OUT(COL));
end loop;

end process MUX_WRITE;

MUX_READ : process ( MUX_DATA , SEL_READ )            -- multiplex out the selected data element
variable TEMP_OUT : MUX_ARRAY;
begin
for COL_BIT in 0 to 3 loop
	for LOC in 0 to 15 loop
		TEMP_OUT(COL_BIT)(LOC) := MUX_DATA(LOC)(COL_BIT) and SEL_READ(LOC);
	end loop;
end loop;

for COL in 0 to 3 loop
	READ_ADDRESS(COL) <= Or_Bits(TEMP_OUT(COL));
end loop;

end process MUX_READ;

end ARRAY1;  -- end of architecture



