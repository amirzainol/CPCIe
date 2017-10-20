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
--  ENTITY       = PIPELINE_RO      --
--  version      = 1.0              --
--  last update  = 1/08/99          --
--  author       = Jose Nunez       --
--------------------------------------


-- FUNCTION
-- pipeline RO is situated between the two parts of best match
-- decision logic.

-- PIN LIST
-- DOWN_PRIORITY_6_IN : Priority 6
-- DOWN_PRIORITY_5_IN : Priority 5
-- DOWN_PRIORITY_4_IN : Priority 4 
-- DOWN_PRIORITY_3_IN : Priority 3
-- DOWN_PRIORITY_2_IN : Priority 2
-- DOWN_PRIORITY_1_IN : Priority 1 ( lowest priority)
-- SAME_LENGTH : same length detected
-- MATCH_TYPE_A_IN : Type A ( most significant )
-- MATCH_TYPE_B_IN : Type B
-- MATCH_TYPE_C_IN : Type C
-- MATCH_TYPE_D_IN : Type D ( less significant )
-- SEARCH_STRING_IN : literals
-- MASK_IN : 5 bit corresponding to the mask
-- COLUMN_OR_IN : priority 5 or
-- FLUSH_IN : pipeline signal from csm
-- COMP_IN  : pipeline signal from csm
-- CLK : master clk
-- CLEAR : asyncronous clear
-- DOWN_PRIORITY_6_OUT
-- DOWN_PRIORITY_5_OUT 
-- DOWN_PRIORITY_4_OUT 
-- DOWN_PRIORITY_3_OUT 
-- DOWN_PRIORITY_2_OUT 
-- DOWN_PRIORITY_1_OUT 
-- MATCH_TYPE_A_OUT 
-- MATCH_TYPE_B_OUT 
-- MATCH_TYPE_C_OUT 
-- MATCH_TYPE_D_OUT 
-- SEARCH_STRING_OUT 
-- COLUMN_OR_OUT 
-- MASK_OUT
-- FLUSH_OUT 
-- COMP_OUT 


library IEEE;
use IEEE.std_logic_1164.all;

entity PIPELINE_R0 is
    port(
    		DOWN_PRIORITY_6_IN : in bit_vector(15 downto 0);
		DOWN_PRIORITY_5_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_4_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_3_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_2_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_1_IN : in bit_vector(15 downto 0);
		SAME_LENGTH_IN_2 : in bit_vector(15 downto 0);
		SAME_LENGTH_IN_3 : in bit_vector(15 downto 0);
		SAME_LENGTH_IN_4 : in bit_vector(15 downto 0);
		MATCH_TYPE_A_IN : in bit_vector(15 downto 0);
		MATCH_TYPE_B_IN : in bit_vector(15 downto 0);
		MATCH_TYPE_C_IN : in bit_vector(15 downto 0);
		MATCH_TYPE_D_IN : in bit_vector(15 downto 0);
		SEARCH_STRING_IN : in bit_vector(31 downto 0);
		MASK_IN : in bit_vector(4 downto 0);
	  	COLUMN_OR_IN : in bit_vector(6 downto 1);
		FLUSH_IN : in bit;
		COMP_IN : in bit; 
		MOVE_ENABLE_IN : in bit;
		INC_CAM_IN :  in bit; 
    	CLK : in bit;
		CLEAR : in bit;
		RESET : in bit;
		DOWN_PRIORITY_6_OUT : out bit_vector(15 downto 0);
		DOWN_PRIORITY_5_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_4_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_3_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_2_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_1_OUT : out bit_vector(15 downto 0);
		SAME_LENGTH_OUT_2 : out bit_vector(15 downto 0);
		SAME_LENGTH_OUT_3 : out bit_vector(15 downto 0);
		SAME_LENGTH_OUT_4 : out bit_vector(15 downto 0);
		MATCH_TYPE_A_OUT : out bit_vector(15 downto 0);
		MATCH_TYPE_B_OUT : out bit_vector(15 downto 0);
		MATCH_TYPE_C_OUT : out bit_vector(15 downto 0);
		MATCH_TYPE_D_OUT : out bit_vector(15 downto 0);
		SEARCH_STRING_OUT : out bit_vector(31 downto 0);
		MASK_OUT : out bit_vector(4 downto 0);
	  	COLUMN_OR_OUT : out bit_vector(6 downto 1);
		FLUSH_OUT : out bit;
		COMP_OUT : out bit;
		MOVE_ENABLE_OUT : out bit;
		INC_CAM_OUT : out bit
        
	 );
end PIPELINE_R0;

architecture STRUCTURAL of PIPELINE_R0 is

signal DOWN_PRIORITY_6_OUT_aux : bit_vector(15 downto 0);
signal DOWN_PRIORITY_5_OUT_aux : bit_vector(15 downto 0);
signal DOWN_PRIORITY_4_OUT_aux : bit_vector(15 downto 0);
signal DOWN_PRIORITY_3_OUT_aux : bit_vector(15 downto 0);
signal DOWN_PRIORITY_2_OUT_aux : bit_vector(15 downto 0);
signal DOWN_PRIORITY_1_OUT_aux : bit_vector(15 downto 0);
signal SAME_LENGTH_2_OUT_aux : bit_vector(15 downto 0);
signal SAME_LENGTH_3_OUT_aux : bit_vector(15 downto 0);
signal SAME_LENGTH_4_OUT_aux : bit_vector(15 downto 0);
signal MATCH_TYPE_A_OUT_aux : bit_vector(15 downto 0);
signal MATCH_TYPE_B_OUT_aux : bit_vector(15 downto 0);
signal MATCH_TYPE_C_OUT_aux : bit_vector(15 downto 0);
signal MATCH_TYPE_D_OUT_aux : bit_vector(15 downto 0);
signal SEARCH_STRING_OUT_aux : bit_vector(31 downto 0);
signal MASK_OUT_aux : bit_vector(4 downto 0);
signal COLUMN_OR_OUT_aux : bit_vector(6 downto 1);
signal FLUSH_OUT_aux: bit;
signal COMP_OUT_aux: bit;
signal INC_CAM_OUT_aux:bit;
signal MOVE_ENABLE_OUT_aux: bit;


 begin

 process(CLK,CLEAR)
 begin
	if (CLEAR='0') then	
		MASK_OUT_aux <= "00000";
		DOWN_PRIORITY_6_OUT_aux <=x"0000";
		DOWN_PRIORITY_5_OUT_aux <=x"0000";
		DOWN_PRIORITY_4_OUT_aux <=x"0000";
		DOWN_PRIORITY_3_OUT_aux <=x"0000";
		DOWN_PRIORITY_2_OUT_aux <=x"0000";
		DOWN_PRIORITY_1_OUT_aux <=x"0000";
		SAME_LENGTH_2_OUT_aux <= x"0000";
		SAME_LENGTH_3_OUT_aux <= x"0000";
		SAME_LENGTH_4_OUT_aux <= x"0000";
		MATCH_TYPE_A_OUT_aux <=x"FFFF";
    		MATCH_TYPE_B_OUT_aux <=x"FFFF";
 	      MATCH_TYPE_C_OUT_aux <=x"FFFF";
 	      MATCH_TYPE_D_OUT_aux <=x"FFFF";
	 	SEARCH_STRING_OUT_aux <= x"00000000";
		COLUMN_OR_OUT_aux <= "000000";
		FLUSH_OUT_aux <= '1';
		COMP_OUT_aux <= '1';
		INC_CAM_OUT_aux<='0';
		MOVE_ENABLE_OUT_aux<='1';
	elsif ((CLK'event) and (CLK='1')) then
		if (RESET='0') then
			MASK_OUT_aux <= "00000";
			DOWN_PRIORITY_6_OUT_aux <=x"0000";
 			DOWN_PRIORITY_5_OUT_aux <=x"0000";
			DOWN_PRIORITY_4_OUT_aux <=x"0000";
			DOWN_PRIORITY_3_OUT_aux <=x"0000";
			DOWN_PRIORITY_2_OUT_aux <=x"0000";
			DOWN_PRIORITY_1_OUT_aux <=x"0000";
			SAME_LENGTH_2_OUT_aux <= x"0000";
			SAME_LENGTH_3_OUT_aux <= x"0000";
			SAME_LENGTH_4_OUT_aux <= x"0000";
			MATCH_TYPE_A_OUT_aux <=x"FFFF";
    	   	      MATCH_TYPE_B_OUT_aux <=x"FFFF";
 	  		MATCH_TYPE_C_OUT_aux <=x"FFFF";
 	  	      MATCH_TYPE_D_OUT_aux <=x"FFFF";
		 	SEARCH_STRING_OUT_aux <= x"00000000";
			COLUMN_OR_OUT_aux <= "000000";
			FLUSH_OUT_aux <= '1';
			COMP_OUT_aux <= '1';
			INC_CAM_OUT_aux<='0';
			MOVE_ENABLE_OUT_aux<='1';
		 else
			MASK_OUT_aux <= MASK_IN;
			DOWN_PRIORITY_6_OUT_aux <= DOWN_PRIORITY_6_IN;
			DOWN_PRIORITY_5_OUT_aux <= DOWN_PRIORITY_5_IN;
			DOWN_PRIORITY_4_OUT_aux <= DOWN_PRIORITY_4_IN;
			DOWN_PRIORITY_3_OUT_aux <= DOWN_PRIORITY_3_IN;
			DOWN_PRIORITY_2_OUT_aux <= DOWN_PRIORITY_2_IN;
			DOWN_PRIORITY_1_OUT_aux <= DOWN_PRIORITY_1_IN;
			SAME_LENGTH_2_OUT_aux <= SAME_LENGTH_IN_2;
			SAME_LENGTH_3_OUT_aux <= SAME_LENGTH_IN_3;
			SAME_LENGTH_4_OUT_aux <= SAME_LENGTH_IN_4;
			MATCH_TYPE_A_OUT_aux <= MATCH_TYPE_A_IN;
			SEARCH_STRING_OUT_aux <= SEARCH_STRING_IN;
   		 	MATCH_TYPE_B_OUT_aux <= MATCH_TYPE_B_IN;
 		      MATCH_TYPE_C_OUT_aux <= MATCH_TYPE_C_IN;
 		      MATCH_TYPE_D_OUT_aux <= MATCH_TYPE_D_IN;
			COLUMN_OR_OUT_aux <= COLUMN_OR_IN; 
			FLUSH_OUT_aux <= FLUSH_IN;
			COMP_OUT_aux <= COMP_IN;
			INC_CAM_OUT_aux<=INC_CAM_IN;
			MOVE_ENABLE_OUT_aux<=MOVE_ENABLE_IN;
	  end if;
	end if;
 end process;

 MASK_OUT <= MASK_OUT_aux;
 DOWN_PRIORITY_6_OUT <= DOWN_PRIORITY_6_OUT_aux;
 DOWN_PRIORITY_5_OUT <= DOWN_PRIORITY_5_OUT_aux;
 DOWN_PRIORITY_4_OUT <= DOWN_PRIORITY_4_OUT_aux;
 DOWN_PRIORITY_3_OUT <= DOWN_PRIORITY_3_OUT_aux;
 DOWN_PRIORITY_2_OUT <= DOWN_PRIORITY_2_OUT_aux;
 DOWN_PRIORITY_1_OUT <= DOWN_PRIORITY_1_OUT_aux;
 SAME_LENGTH_OUT_2 <= SAME_LENGTH_2_OUT_aux;
 SAME_LENGTH_OUT_3 <= SAME_LENGTH_3_OUT_aux;
 SAME_LENGTH_OUT_4 <= SAME_LENGTH_4_OUT_aux;
 MATCH_TYPE_A_OUT <= MATCH_TYPE_A_OUT_aux;
 MATCH_TYPE_B_OUT <= MATCH_TYPE_B_OUT_aux;
 MATCH_TYPE_C_OUT <= MATCH_TYPE_C_OUT_aux;
 MATCH_TYPE_D_OUT <= MATCH_TYPE_D_OUT_aux;
 COLUMN_OR_OUT <= COLUMN_OR_OUT_aux; 
 FLUSH_OUT <= FLUSH_OUT_aux;
 COMP_OUT <= COMP_OUT_aux;
 SEARCH_STRING_OUT <= SEARCH_STRING_OUT_aux;
 INC_CAM_OUT <= INC_CAM_OUT_aux;
 MOVE_ENABLE_OUT<=MOVE_ENABLE_OUT_aux;

-- DOWN_PRIORITY_5_OUT <= DOWN_PRIORITY_5_IN;
-- DOWN_PRIORITY_4_OUT <= DOWN_PRIORITY_4_IN;
-- DOWN_PRIORITY_3_OUT <= DOWN_PRIORITY_3_IN;
-- DOWN_PRIORITY_2_OUT <= DOWN_PRIORITY_2_IN;
-- DOWN_PRIORITY_1_OUT <= DOWN_PRIORITY_1_IN;
-- MATCH_TYPE_A_OUT <= MATCH_TYPE_A_IN;
-- MATCH_TYPE_B_OUT <= MATCH_TYPE_B_IN;
-- MATCH_TYPE_C_OUT <= MATCH_TYPE_C_IN;
-- MATCH_TYPE_D_OUT <= MATCH_TYPE_D_IN;
-- COLUMN_OR_OUT <= COLUMN_OR_IN; 
-- FLUSH_OUT <= FLUSH_IN;
-- COMP_OUT <= COMP_IN;
-- SEARCH_STRING_OUT <= SEARCH_STRING_IN;

end structural;	


    



