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
--  ENTITY       = PIPELINE_R2_D     --
--  version      = 1.0               --
--  last update  = 19/09/99          --
--  author       = Jose Nunez        --
---------------------------------------


-- FUNCTION
-- pipeline register R2_D for the decompression process

library IEEE;
use IEEE.std_logic_1164.all;

entity PIPELINE_R2_D is

		port(
		
			MATCH_TYPE_IN:in std_logic_vector(3 downto 0);
			MATCH_LOC_IN_D:in std_logic_vector(15 downto 0);
			LIT_DATA_IN:in std_logic_vector(31 downto 0);
			LIT_MASK_IN:in std_logic_vector(4 downto 0);
			MOVE_ENABLE_D_IN:in std_logic;
			FULL_HIT_IN : in std_logic;
			CLEAR:in std_logic;
			RESET:in std_logic;
			CLK:in std_logic;
			MATCH_TYPE_OUT:out std_logic_vector(3 downto 0);
			MATCH_LOC_OUT_D:out std_logic_vector(15 downto 0);
			LIT_DATA_OUT:out std_logic_vector(31 downto 0);
			LIT_MASK_OUT:out std_logic_vector(4 downto 0);
			FULL_HIT_OUT : out std_logic;
			MOVE_ENABLE_D_OUT:out std_logic
			);

end PIPELINE_R2_D;

architecture STRUCTURAL of PIPELINE_R2_D is
 
 signal MATCH_TYPE_OUT_aux:std_logic_vector(3 downto 0);
 signal MATCH_LOC_OUT_D_aux:std_logic_vector(15 downto 0);
 signal LIT_DATA_OUT_aux:std_logic_vector(31 downto 0);
 signal LIT_MASK_OUT_aux: std_logic_vector(4 downto 0);
 signal MOVE_ENABLE_D_OUT_aux:std_logic;
 signal FULL_HIT_OUT_aux : std_logic;
 
begin
	

  process(CLK,CLEAR)

  begin

 	if (CLEAR='0') then
 	            MATCH_TYPE_OUT_aux<="1111";
                MATCH_LOC_OUT_D_aux<=x"1111";
                LIT_DATA_OUT_aux<=x"00000000";
		    LIT_MASK_OUT_aux<="00000";
                MOVE_ENABLE_D_OUT_aux<='1';
 	          FULL_HIT_OUT_aux<='1';	        
    elsif ((CLK'event) and (CLK='1')) then
		 	if (RESET='0') then
 	            	MATCH_TYPE_OUT_aux<="1111";
                		MATCH_LOC_OUT_D_aux<=x"1111";
                		LIT_DATA_OUT_aux<=x"00000000";
				LIT_MASK_OUT_aux<="00000";
                		MOVE_ENABLE_D_OUT_aux<='1';
 	            	FULL_HIT_OUT_aux<='1';
			else
 	            	MATCH_TYPE_OUT_aux<=MATCH_TYPE_IN;
                		MATCH_LOC_OUT_D_aux<=MATCH_LOC_IN_D;
                		LIT_DATA_OUT_aux<=LIT_DATA_IN;
				LIT_MASK_OUT_aux<=LIT_MASK_IN;
                		MOVE_ENABLE_D_OUT_aux<=MOVE_ENABLE_D_IN;
 		        	FULL_HIT_OUT_aux <= FULL_HIT_IN;  
		  end if;  
 	end if;
  end process;


  MATCH_TYPE_OUT<=MATCH_TYPE_OUT_aux;
  MATCH_LOC_OUT_D<=MATCH_LOC_OUT_D_aux;
  LIT_DATA_OUT<=LIT_DATA_OUT_aux;
  LIT_MASK_OUT<=LIT_MASK_OUT_aux;
  MOVE_ENABLE_D_OUT<=MOVE_ENABLE_D_OUT_aux;
  FULL_HIT_OUT <= FULL_HIT_OUT_aux;

end structural;





 


