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
--  ENTITY       = PIPELINE_R1      --
--  version      = 1.0              --
--  last update  = 1/08/01          --
--  author       = Jose Nunez       --
--------------------------------------


-- FUNCTION
-- pipeline R1 for compression

-- PIN LIST
-- MATCH_LOC_IN: uncoded match location 
-- MATCH_TYPE_IN: match type
-- SEARCH_STRING_IN:  literal data
-- MASK_IN : mask data
-- FLUSH_IN: pipeline signal from csm	     	
-- COMP_IN: pipeline signal from csm	   
-- INC_IN:pipeline signal from csm	   
-- CLEAR: asyncronus clear
-- CLK: master clock
-- MATCH_LOC_OUT 
-- MATCH_TYPE_OUT
-- SEARCH_STRING_OUT
-- MASK_OUT
-- FLUSH_OUT
-- COMP_OUT
-- INC_OUT


library IEEE;
use IEEE.std_logic_1164.all;

entity PIPELINE_R1 is
    port(
            MATCH_LOC_IN: in std_logic_vector( 15 downto 0);
        	MATCH_TYPE_IN: in std_logic_vector(3 downto 0);
            SEARCH_STRING_IN:  in std_logic_vector(31 downto 0);
		MASK_IN : in std_logic_vector(4 downto 0);
            FLUSH_IN:in std_logic;	     	
	     COMP_IN:in std_logic;
		 MOVE_ENABLE_IN:in std_logic;
		 INC_IN:in std_logic;
            CLEAR:in std_logic;
			RESET: in std_logic;
            CLK:in std_logic;
			MATCH_LOC_OUT: out std_logic_vector (15 downto 0);
        	MATCH_TYPE_OUT:out std_logic_vector(3 downto 0);
            SEARCH_STRING_OUT:  out std_logic_vector(31 downto 0);
            MASK_OUT : out std_logic_vector(4 downto 0);
		 FLUSH_OUT:out std_logic;
	     COMP_OUT:out std_logic;
		 MOVE_ENABLE_OUT:out std_logic;
		 INC_OUT:out std_logic
            );

end PIPELINE_R1;
architecture STRUCTURAL of PIPELINE_R1 is

 signal SEARCH_STRING_OUT_aux:std_logic_vector(31 downto 0);
 signal FLUSH_OUT_aux:std_logic;
 signal COMP_OUT_aux:std_logic;
 signal MATCH_LOC_OUT_aux: std_logic_vector( 15 downto 0);
 signal MATCH_TYPE_OUT_aux: std_logic_vector(3 downto 0);
 signal MASK_OUT_aux : std_logic_vector(4 downto 0);
 signal INC_OUT_aux:std_logic;
 signal MOVE_ENABLE_OUT_aux: std_logic;
 
 begin

 process(CLK,CLEAR)
 begin
	if (CLEAR='0') then	
		MATCH_LOC_OUT_aux<=x"0000";
        MATCH_TYPE_OUT_aux<="1111";
	    SEARCH_STRING_OUT_aux<=x"00000000";
           FLUSH_OUT_aux<='1';
	    COMP_OUT_aux<='1';
		MASK_OUT_aux<="00000";
	    INC_OUT_aux<='0';
		MOVE_ENABLE_OUT_aux<='1';

	elsif ((CLK'event) and (CLK='1')) then
		if (RESET='0') then	
			MATCH_LOC_OUT_aux<=x"0000";
       		 MATCH_TYPE_OUT_aux<="1111";
	   		 SEARCH_STRING_OUT_aux<=x"00000000";
          	 FLUSH_OUT_aux<='1';
	    	COMP_OUT_aux<='1';
		MASK_OUT_aux <="00000";
	   INC_OUT_aux<='0';
	   MOVE_ENABLE_OUT_aux<='1';

	   else
		SEARCH_STRING_OUT_aux<=SEARCH_STRING_IN;
       FLUSH_OUT_aux<=FLUSH_IN;
	   COMP_OUT_aux<=COMP_IN;
		MASK_OUT_aux<= MASK_IN;
		MATCH_TYPE_OUT_aux<=MATCH_TYPE_IN;
	 	MATCH_LOC_OUT_aux<=MATCH_LOC_IN;
	    INC_OUT_aux<=INC_IN;
		MOVE_ENABLE_OUT_aux<=MOVE_ENABLE_IN;

	  end if;
	end if;
 end process;

 SEARCH_STRING_OUT<=SEARCH_STRING_OUT_aux;
 FLUSH_OUT<=FLUSH_OUT_aux;
 COMP_OUT<=COMP_OUT_aux;
 MASK_OUT<=MASK_OUT_aux;
 MATCH_TYPE_OUT<=MATCH_TYPE_OUT_aux;
 MATCH_LOC_OUT<=MATCH_LOC_OUT_aux;
 INC_OUT<=INC_OUT_aux;
 MOVE_ENABLE_OUT<=MOVE_ENABLE_OUT_aux;



-- SEARCH_STRING_OUT<=SEARCH_STRING_IN;
-- FLUSH_OUT<=FLUSH_IN;
-- COMP_OUT<=COMP_IN;
-- MATCH_TYPE_OUT<=MATCH_TYPE_IN;
-- MATCH_LOC_OUT<=MATCH_LOC_IN;
-- INC_OUT <= INC_IN;
-- COUNT_ENABLE_OUT <= COUNT_ENABLE_IN;



end structural;	


    



