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

------------------------------------
--  ENTITY       = DECOMP_DECODE  --
--  version      = 1.0            --
--  last update  = 9/09/99       --
--  author       = Jose Nunez     --
------------------------------------

-- FUNCTION
-- decodes the match location (phased binary code) and match type (Huffman code)

-- PIN LIST
-- D_IN         = input data containing the match location and type codes
-- DECOMP       = indicates that we are in decompression mode (active low)
-- ENABLE       = indicates that block should be enabled [DECOMP must also be low] (active low)
-- FULL_MLENGTH = full match length (location + type + literal characters)
-- FULL_HIT     = indicates that a full hit (match type 0) has occurred (active low)
-- MATCH_TYPE   = decoded match type
-- MATCH_LOC    = decoded match location in the table
-- RL_DETECTED  = detection of code MAX_TABLE_ENTRIES-1
-- PART_MLENGTH = partial match length (location + type)

-- new function decodes de match type since no coding of the location is included

library dzx;
use dzx.bit_arith.all;
use dzx.attributes.all;
use dzx.bit_utils.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DECOMP_DECODE_4 is
port
(
      D_IN : in std_logic_vector(15 downto 0) ; -- 1 + 4 + 3 + 8 bits 
      DECOMP : in std_logic ;
      OVERFLOW_CONTROL  : in std_logic;
      ENABLE : in std_logic ;
      DECODING_UNDERFLOW : in std_logic; -- buffer is empty. invalid data in the 64 bit bus
      UNDERFLOW : in std_logic; -- produce in decomp assem 5
	  INC : in std_logic;
     SET_LENGTH_TO_ZERO : in std_logic;
	  TABLE_FULL : in std_logic;
	  NFL_MINUS_ONE : in std_logic_vector(3 downto 0);
	  CLK : in std_logic;
	  CLEAR : in std_logic;
	  RESET : in std_logic;
	  FULL_MLENGTH : out std_logic_vector(5 downto 0);
	  FULL_HIT : out std_logic ;
      MATCH_TYPE : out std_logic_vector(3 downto 0) ;
      MATCH_LOC : out std_logic_vector(3 downto 0) ;
	  RL_COUNT : out std_logic_vector(7 downto 0);
	  WAIT_DATA : out std_logic; -- next decoding cycle is not valid
	  RL_DETECTED : out std_logic;
	  MASK : out std_logic_vector(4 downto 0);
      PART_MLENGTH : out std_logic_vector(3 downto 0) 
);
end DECOMP_DECODE_4;


architecture NODECOMP2 of DECOMP_DECODE_4 is

component LENGTH_SELECTION_2

port (MATCH_LOC_K : in std_logic_vector(3 downto 0);
	  MATCH_LOC_K_1 : in std_logic_vector(3 downto 0);
	  SUB : in std_logic_vector(4 downto 0);
	  MAX_MATCH_LENGTH : in std_logic_vector(2 downto 0);
	  MATCH_LENGTH : out std_logic_vector(2 downto 0);
	  SEL_MATCH_LOC : out std_logic_vector(3 downto 0);
	  K_BITS: out std_logic
	 );
end component;

component MAX_PBC_LENGTH_2
 
port (OR_VECTOR: in std_logic_vector(2 downto 0);
	  CODE : in std_logic_vector(14 downto 0); -- 4 ml and 6 mt and rl
	  POS_RL_K_1 : out std_logic_vector(7 downto 0);
	  POS_RL_K : out std_logic_vector(7 downto 0);
	  POS_ML_K_1 : out std_logic_vector(3 downto 0);
	  POS_ML_K : out std_logic_vector(3 downto 0);
   	  POS_MT_K_1 : out std_logic_vector(5 downto 0);
	  POS_MT_K : out std_logic_vector(5 downto 0)
	  );

end component;

component DECODE_MISS_2
port
(
   	CODE : in std_logic_vector(3 downto 0);
	M_LIT_LENGTH : out std_logic_vector(5 downto 0);
	MASK : out std_logic_vector(4 downto 0)
);
end component;

component DECODE_MT_2
port
(
   	CODE : in std_logic_vector(5 downto 0);
	M_LIT_LENGTH : out std_logic_vector(4 downto 0);
	RL_DETECTED : out std_logic;
	M_TYPE : out std_logic_vector(3 downto 0)
);
end component;


signal FULL_HIT_INT: std_logic;
signal MISS_LENGTH : std_logic_vector (5 downto 0);
signal MASK_AUX : std_logic_vector( 4 downto 0);
signal MASK_INT : std_logic_vector(4 downto 0);
signal ML_LIT_K : std_logic_vector(4 downto 0);
signal PM_L : std_logic_vector(2 downto 0);
signal MTL_LIT_K : std_logic_vector(4 downto 0);
signal MTL_LIT_AUX_K : std_logic_vector(4 downto 0);
signal MTL_LIT_AUX_K_1 : std_logic_vector(4 downto 0);
signal MTL_RUN : std_logic_vector(4 downto 0);
signal ML_K : std_logic_vector(2 downto 0);
signal TYPE_K : std_logic_vector(3 downto 0);
signal TYPE_AUX_K : std_logic_vector(3 downto 0);
signal TYPE_AUX_K_1 : std_logic_vector(3 downto 0);
signal FULL_SUM_K : std_logic_vector(4 downto 0);
signal P_SUM_K : std_logic_vector(3 downto 0);
signal TEMP_MTYPE : std_logic_vector(3 downto 0);
signal MATCH_LOC_AUX : std_logic_vector(3 downto 0);
signal MATCH_LOC_INT : std_logic_vector(3 downto 0);
signal RL_DETECTED_INT : std_logic;
signal RL_DETECTED_AUX : std_logic;
signal RL_DETECTED_AUX_K : std_logic;
signal RL_DETECTED_AUX_K_1 : std_logic;
signal MOVE_8 : std_logic;
-- signal ACTIVE : std_logic;
signal WAIT_DATA_INT : std_logic; -- under underflow the current decoding cycle does not take place although there is data ready for it.
signal POS_MT_K : std_logic_vector(5 downto 0);
signal POS_MT_K_1 : std_logic_vector(5 downto 0);
signal K_BITS : std_logic;
signal MAX_MATCH_LENGTH : std_logic_vector(2 downto 0);
signal MATCH_LENGTH : std_logic_vector(2 downto 0);
signal OR_VECTOR: std_logic_vector(2 downto 0);
signal OR_VECTOR_A: std_logic_vector(2 downto 0);
signal OR_VECTOR_B: std_logic_vector(2 downto 0);
signal MAX_MATCH_LENGTH_A : std_logic_vector(2 downto 0);
signal MAX_MATCH_LENGTH_B : std_logic_vector(2 downto 0);
signal SUB : std_logic_vector(4 downto 0);
signal SUB_A : std_logic_vector(4 downto 0); 
signal SUB_B : std_logic_vector(4 downto 0);
signal OR_VECTOR_INT: std_logic_vector(2 downto 0);
signal SUB_INT : std_logic_vector(4 downto 0);
signal MAX_MATCH_LENGTH_INT : std_logic_vector(2 downto 0);
signal POS_ML_K_1 : std_logic_vector(3 downto 0);
signal POS_ML_K : std_logic_vector(3 downto 0);
signal POS_RL_K_1 : std_logic_vector(7 downto 0);
signal POS_RL_K : std_logic_vector(7 downto 0);
signal RL_COUNT_INT : std_logic_vector(7 downto 0);

begin

-- ACTIVE <= DECOMP or ENABLE;	-- block is active only when DECOMP and ENABLE are both low
				
-- ACTIVE <= DECOMP;


MAX_PBC_LENGTH_1 : MAX_PBC_LENGTH_2 
port map(OR_VECTOR => OR_VECTOR,
		 CODE => D_IN(14 downto 0), -- max match loc and match type and rl
		 POS_RL_K_1 => POS_RL_K_1,
		 POS_RL_K => POS_RL_K,
		 POS_ML_K_1 => POS_ML_K_1,
		 POS_ML_K => POS_ML_K,
   	     POS_MT_K_1 => POS_MT_K_1,
		 POS_MT_K => POS_MT_K
		 );

DECODE_MATCH_TYPE_K_1 : DECODE_MT_2 port map ( CODE => POS_MT_K_1,
    	    	    	    	M_LIT_LENGTH => MTL_LIT_AUX_K_1,
								RL_DETECTED => RL_DETECTED_AUX_K_1,
								M_TYPE => TYPE_AUX_K_1);

DECODE_MATCH_TYPE_K : DECODE_MT_2 port map ( CODE => POS_MT_K,
    	    	    	    	M_LIT_LENGTH => MTL_LIT_AUX_K,
								RL_DETECTED => RL_DETECTED_AUX_K,
								M_TYPE => TYPE_AUX_K);


LENGTH_SELECTION_1 : LENGTH_SELECTION_2 
					 port map(MATCH_LOC_K => POS_ML_K,
					 		  MATCH_LOC_K_1 => POS_ML_K_1,
					 		  SUB => SUB,
							  MAX_MATCH_LENGTH => MAX_MATCH_LENGTH,
							  MATCH_LENGTH => MATCH_LENGTH,
							  SEL_MATCH_LOC => MATCH_LOC_INT,
					 		  K_BITS => K_BITS
							   );

 
MUX_SEL : process( K_BITS, POS_RL_K, POS_RL_K_1, MTL_LIT_AUX_K, MTL_LIT_AUX_K_1, 
				RL_DETECTED_AUX_K_1, RL_DETECTED_AUX_K, 
				TYPE_AUX_K_1, TYPE_AUX_K)
begin

if (K_BITS = '1') then -- use k bits
	MTL_LIT_K <= MTL_LIT_AUX_K;
	RL_DETECTED_AUX <= RL_DETECTED_AUX_K;
	RL_COUNT_INT <= POS_RL_K;
	TYPE_K <= TYPE_AUX_K;
else
	MTL_LIT_K <= MTL_LIT_AUX_K_1;   -- use k-1 bits
	RL_DETECTED_AUX <= RL_DETECTED_AUX_K_1;
	RL_COUNT_INT <= POS_RL_K_1;
	TYPE_K <= TYPE_AUX_K_1;
end if;

end process MUX_SEL;


OR_VECTOR_BP : process(NFL_MINUS_ONE)

variable NFL_MINUS_ONE_TEMP : std_logic_vector(3 downto 0);
variable OR_VECTOR_BL : std_logic_vector(2 downto 0);
variable LENGTH_POWER_B : std_logic_vector(4 downto 0);


begin

NFL_MINUS_ONE_TEMP := NFL_MINUS_ONE + "0001";

OR_VECTOR_BL(0) := NFL_MINUS_ONE_TEMP(3) or NFL_MINUS_ONE_TEMP(2) or NFL_MINUS_ONE_TEMP(1);
OR_VECTOR_BL(1) := NFL_MINUS_ONE_TEMP(3) or NFL_MINUS_ONE_TEMP(2);
OR_VECTOR_BL(2) := NFL_MINUS_ONE_TEMP(3);

case OR_VECTOR_BL is

when "000" =>
MAX_MATCH_LENGTH_B <= "001";
LENGTH_POWER_B := "00001"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when "001" =>
MAX_MATCH_LENGTH_B <= "010";
LENGTH_POWER_B := "00011"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when "011" =>
MAX_MATCH_LENGTH_B <= "011";
LENGTH_POWER_B := "00111"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when "111" =>
MAX_MATCH_LENGTH_B <= "100";
LENGTH_POWER_B := "01111"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when  others =>
MAX_MATCH_LENGTH_B <= "000";
LENGTH_POWER_B := "00000";
end case;

SUB_B <= LENGTH_POWER_B - ('0' & NFL_MINUS_ONE_TEMP);
OR_VECTOR_B <= OR_VECTOR_BL;

end process OR_VECTOR_BP;



OR_VECTOR_AP : process(NFL_MINUS_ONE)

variable OR_VECTOR_AL : std_logic_vector(2 downto 0);
variable LENGTH_POWER_A : std_logic_vector(4 downto 0);

begin

OR_VECTOR_AL(0) := NFL_MINUS_ONE(3) or NFL_MINUS_ONE(2) or NFL_MINUS_ONE(1);
OR_VECTOR_AL(1) := NFL_MINUS_ONE(3) or NFL_MINUS_ONE(2);
OR_VECTOR_AL(2) := NFL_MINUS_ONE(3);

case OR_VECTOR_AL is

when "000" =>
MAX_MATCH_LENGTH_A <= "001";
LENGTH_POWER_A := "00001"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when "001" =>
MAX_MATCH_LENGTH_A <= "010";
LENGTH_POWER_A := "00011"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when "011" =>
MAX_MATCH_LENGTH_A <= "011";
LENGTH_POWER_A := "00111"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when "111" =>
MAX_MATCH_LENGTH_A <= "100";
LENGTH_POWER_A := "01111"; -- sub 1 to get NFL_MINUS_ONE + 1 = VALID
when  others =>
MAX_MATCH_LENGTH_A <= "000";
LENGTH_POWER_A := "00000";
end case;

SUB_A <= LENGTH_POWER_A - ('0' & NFL_MINUS_ONE);
OR_VECTOR_A <= OR_VECTOR_AL;

end process OR_VECTOR_AP;



SEL_K : process(INC, TABLE_FULL, OR_VECTOR_A, OR_VECTOR_B, MAX_MATCH_LENGTH_A, MAX_MATCH_LENGTH_B, SUB_A, SUB_B)

begin

if (INC = '0' or TABLE_FULL = '0') then -- TABLE_FULL active at zero
	OR_VECTOR_INT <= OR_VECTOR_A;
	SUB_INT <= SUB_A;
	MAX_MATCH_LENGTH_INT <= MAX_MATCH_LENGTH_A;
else
	OR_VECTOR_INT <= OR_VECTOR_B;
	SUB_INT <= SUB_B;
	MAX_MATCH_LENGTH_INT <= MAX_MATCH_LENGTH_B; 
end if;

end process SEL_K;


OR_VECTOR_REG : process(CLEAR, CLK)

begin

if (CLEAR = '0') then
    OR_VECTOR <= "000";
	SUB <= "00000";
	MAX_MATCH_LENGTH <= "000";
elsif ((CLK'event) and (CLK = '1')) then
	if (RESET = '0') then
   		 OR_VECTOR <= "000"; -- initial next free location minus one is 1
		 SUB <= "00000";
		 MAX_MATCH_LENGTH <= "001";
	elsif(ENABLE = '1') then
		 OR_VECTOR <= "000";
		 SUB <= "00000";
		 MAX_MATCH_LENGTH <= "001";
	elsif (WAIT_DATA_INT = '0') then
    	 OR_VECTOR <= OR_VECTOR_INT;
		 SUB <= SUB_INT;
		 MAX_MATCH_LENGTH <= MAX_MATCH_LENGTH_INT;
	else
    	 OR_VECTOR <= OR_VECTOR;
		 SUB <= SUB;
		 MAX_MATCH_LENGTH <= MAX_MATCH_LENGTH;
	end if;
end if;
end process OR_VECTOR_REG;


DECODE_MISS_TYPE_1 : DECODE_MISS_2 port map ( CODE => D_IN(14 downto 11),
									   	  M_LIT_LENGTH => MISS_LENGTH,
										  MASK => MASK_AUX);



WAIT_DATA_INT <= (DECODING_UNDERFLOW and not(UNDERFLOW) and not(SET_LENGTH_TO_ZERO)) or (OVERFLOW_CONTROL and not(SET_LENGTH_TO_ZERO)); -- data not available from the decoding buffer
-- 1 bit is the match bit (13 total)

WAIT_DATA <= WAIT_DATA_INT or ENABLE;

-- ML_LIT_K <= MTL_RUN when RL_DETECTED_INT = '1' else MTL_LIT_K; 

-- careful I change this line

ML_LIT_K <= MTL_RUN when RL_DETECTED_AUX = '1' else MTL_LIT_K;

-- 8 bits run on zero 2 bits the rest

MTL_RUN <= ("01000" + MTL_LIT_K) when  MATCH_LOC_INT = "0000" else ("00010" + MTL_LIT_K);

-- to code 5 repeticions with only 2 bits extend the not of the MSB

RL_COUNT <= RL_COUNT_INT when MATCH_LOC_INT = "0000" else "00000"& not(RL_COUNT_INT(7)) & RL_COUNT_INT(7 downto 6);

MUX : process (D_IN(15), ENABLE, DECOMP, FULL_SUM_K , P_SUM_K ,  TYPE_K, 
				PM_L, RL_DETECTED_AUX, MISS_LENGTH, MASK_AUX, WAIT_DATA_INT, MATCH_LOC_INT)
begin

if (DECOMP = '0' and WAIT_DATA_INT = '0') then
    if (ENABLE='1') then
		FULL_MLENGTH <= "100011";
		PART_MLENGTH <= "0001";
		TEMP_MTYPE <= "0000";
		MASK_INT <= "11111";
 	   	MATCH_LOC_AUX <= "0000";
		RL_DETECTED_INT <= '0';
    else	
		   if (D_IN(15) = '0') then -- match
	      	      FULL_MLENGTH <= '0' & FULL_SUM_K;
	       	      PART_MLENGTH <= P_SUM_K;
	              TEMP_MTYPE <= TYPE_K;
			      MASK_INT <= "11111";
    	          MATCH_LOC_AUX <= MATCH_LOC_INT;
				  RL_DETECTED_INT <= RL_DETECTED_AUX;
    		else
			      FULL_MLENGTH <= MISS_LENGTH; -- miss
	              PART_MLENGTH <= '0' & PM_L;
	              TEMP_MTYPE <= "1111";
			      MASK_INT <= MASK_AUX;
                  MATCH_LOC_AUX <= "0000";
				  RL_DETECTED_INT <= '0';
           end if;
   end if;
else
    FULL_MLENGTH <= "000000"; -- no move
    PART_MLENGTH <= "0000";
    MASK_INT <= "11111";
    TEMP_MTYPE <= "1111";
    MATCH_LOC_AUX <= "0000";
    RL_DETECTED_INT <= '0';
end if;
end process MUX;

RL_DETECTED <= RL_DETECTED_INT;



ML_K <= ML_LIT_K(2 downto 0);

PM_L <= MISS_LENGTH(2 downto 0);



FULL_SUM_K <= "00" & MATCH_LENGTH + ML_LIT_K;

P_SUM_K <= '0'& MATCH_LENGTH + ('0' & ML_K);


MATCH_TYPE <= TEMP_MTYPE;
FULL_HIT_INT <= (TEMP_MTYPE(3) or TEMP_MTYPE(2)) or (TEMP_MTYPE(1) or TEMP_MTYPE(0));
MATCH_LOC <= MATCH_LOC_AUX;

FULL_HIT <= FULL_HIT_INT when MASK_INT(3) = '1' else '0';  -- if only space NFL does not increment full hit must be active

MASK <= MASK_INT;

end NODECOMP2;  -- end of architecture




