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
--  ENTITY       = CAM_ARRAY_MASK   --
--  version      = 1.0              --
--  last update  = 2/09/99          --
--  author       = Jose Nunez       --
--------------------------------------


-- FUNCTION
-- 16 element CAM array with masking capabilities.


--  PIN LIST
--  PREVIOUS  = input to load data word in the dictionary
--  SEARCH    = input search data word
--  MASK      = new mask for the data being loaded
--  MOVE      = movement control
--  SEL       = selection of data element to be multiplexed out
--  CLK       = master clock
--  CLEAR     = asynchronous reset of the data latch (active LOW)
--  SAME_LENGTH = vector to detect a full match of variable width
--  MTYPE_A   = bit 3 (MSB) of the match type for each location
--  MTYPE_B   = bit 2 of the match type for each location
--  MTYPE_C   = bit 1 of the match type for each location
--  MTYPE_D   = bit 0 (LSB) of the match type for each location


library ieee,dzx;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use dzx.bit_utils.all;
use dzx.attributes.all;

entity CAM_ARRAY_ZERO is
port
(
	SEARCH_DATA : in bit_vector(31 downto 0);
	SEARCH_MASK : in bit_vector(3 downto 0);
	PREVIOUS_DATA : in bit_vector(31 downto 0);
	PREVIOUS_MASK: in bit_vector(3 downto 0);
	ENABLE : in bit; -- do not load tuple 0 when waiting for data from the buffer
	MOVE : in bit_vector(15 downto 1);
	CLEAR : in bit ;
	RESET : in bit;
	CLK : in bit ;
	SAME_LENGTH_2 : out bit_vector(15 downto 0);
	SAME_LENGTH_3: out bit_vector(15 downto 0);
	SAME_LENGTH_4: out bit_vector(15 downto 0);
    MTYPE_A : out bit_vector(15 downto 0);
    MTYPE_B : out bit_vector(15 downto 0);
    MTYPE_C : out bit_vector(15 downto 0);
    MTYPE_D : out bit_vector(15 downto 0)
);

end CAM_ARRAY_ZERO;

architecture ARRAY1 of CAM_ARRAY_ZERO is


component MASK_WORD
port
(	
	SEARCH: in bit_vector(3 downto 0);
	PREVIOUS : in bit_vector(3 downto 0);
	MOVE : in bit;
	CLEAR : in bit;
	RESET : in bit;
	CLK : in bit;
	DOUT : out bit_vector(3 downto 0);
	SAME_LENGTH_2 : out bit;
	SAME_LENGTH_3 : out bit;
	SAME_LENGTH_4 : out bit;
	MATCH: out bit_vector(3 downto 0)
);
end component;

component CAM_WORD_ZERO
port
(
	SEARCH : in bit_vector(31 downto 0);
	PREVIOUS : in bit_vector(31 downto 0);
	MOVE : in bit;
	CLEAR : in bit;
	RESET : in bit;
	CLK : in bit;
	DOUT : out bit_vector(31 downto 0);
	MATCH : out bit_vector(3 downto 0)
);
end component;


type MTYPE_ARRAY is array(15 downto 0) of bit_vector(3 downto 0);
signal MTYPE_OUT : MTYPE_ARRAY;

type DATA_ARRAY is array(15 downto 0) of bit_vector(31 downto 0);
signal MUX_DATA : DATA_ARRAY;

type MUX_ARRAY is array(31 downto 0) of bit_vector(15 downto 0);

type MTYPE_ARRAY_MASK is array(15 downto 0) of bit_vector(3 downto 0);
signal MTYPE_OUT_MASK : MTYPE_ARRAY_MASK;

type DATA_ARRAY_MASK is array(15 downto 0) of bit_vector(3 downto 0);
signal MUX_DATA_MASK : DATA_ARRAY_MASK;

type MUX_ARRAY_MASK is array(3 downto 0) of bit_vector(15 downto 0);

signal FIRST : bit;


begin

FIRST <= not(ENABLE);

C_ARRAY : for I in 0 to 15 generate

    FIRST_DATA_MASK : if (I=0) generate
    	FIRST_D : CAM_WORD_ZERO port map ( SEARCH => SEARCH_DATA,
	    	    	    	        	PREVIOUS => PREVIOUS_DATA,								  
								    	MOVE => FIRST, -- always load data even if it is a single byte. Remove next cycle,  do not load when waiting for buffer
				    					CLEAR => CLEAR,
										RESET => RESET,
				    					CLK => CLK,
				    					DOUT => MUX_DATA(I),
				    					MATCH => MTYPE_OUT(I));

    	FIRST_M : MASK_WORD  port map (   SEARCH => SEARCH_MASK,
	    	    	    	        	PREVIOUS => PREVIOUS_MASK,								  
								    	MOVE => FIRST,
				    					CLEAR => CLEAR,
										RESET => RESET,
				    					CLK => CLK,
				    					DOUT => MUX_DATA_MASK(I),
  									SAME_LENGTH_2 => SAME_LENGTH_2(15-I),
 									SAME_LENGTH_3 => SAME_LENGTH_3(15-I),
 									SAME_LENGTH_4 => SAME_LENGTH_4(15-I),
				    					MATCH => MTYPE_OUT_MASK(I)
										);

      end generate;  
    REMAINING_DATA : if (I>0) generate
    	REST_D : CAM_WORD_ZERO port map ( SEARCH => SEARCH_DATA,
	    	    	    	        	PREVIOUS => MUX_DATA(I-1),								  
								    	MOVE => MOVE(I),
				    					CLEAR => CLEAR,
										RESET => RESET,
				    					CLK => CLK,
				    					DOUT => MUX_DATA(I),
				    					MATCH => MTYPE_OUT(I));

    	REST_M : MASK_WORD port map ( SEARCH => SEARCH_MASK,
	    	    	    	        	PREVIOUS => MUX_DATA_MASK(I-1),								  
								    	MOVE => MOVE(I),
				    					CLEAR => CLEAR,
									RESET => RESET,
				    					CLK => CLK,
				    					DOUT => MUX_DATA_MASK(I),
									SAME_LENGTH_2 => SAME_LENGTH_2(15-I),
 									SAME_LENGTH_3 => SAME_LENGTH_3(15-I),
 									SAME_LENGTH_4 => SAME_LENGTH_4(15-I),
				    					MATCH => MTYPE_OUT_MASK(I));


	end generate;
end generate;



ASSIGN_MTYPE : process (MTYPE_OUT, MTYPE_OUT_MASK)  -- assign match types to the port map
begin
for I in 0 to 15 loop
    MTYPE_A(I) <= MTYPE_OUT(I)(3) or MTYPE_OUT_MASK(I)(3);
    MTYPE_B(I) <= MTYPE_OUT(I)(2) or MTYPE_OUT_MASK(I)(2);
    MTYPE_C(I) <= MTYPE_OUT(I)(1) or MTYPE_OUT_MASK(I)(1);
    MTYPE_D(I) <= MTYPE_OUT(I)(0) or MTYPE_OUT_MASK(I)(0);
end loop;
end process ASSIGN_MTYPE;



end ARRAY1;  -- end of architecture



