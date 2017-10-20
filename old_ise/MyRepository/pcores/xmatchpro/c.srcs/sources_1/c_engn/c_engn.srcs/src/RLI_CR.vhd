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

--------------------------------------------------
--  ENTITY       = RLI_CR (Coding Register)     --
--  version      = 1.0                          --
--  last update  = 22/11/99                     --
--  author       = Jose Nunez                   --
--------------------------------------------------


-- FUNCTION
-- RLI coding register


-- PIN LIST 
-- FLUSH_IN : the flush signal from the csm pipeline 
-- CODE_IN  : the 33 maximum bit of compressed code
-- LENGTH_IN : the length of the compressed code
-- COMP_IN : the comp signal pipeline from the csm
-- CLEAR : the asyncronous clear
-- CLK : the clk signal
-- FLUSH_OUT : the output signals start here
-- CODE_OUT :
-- LENGTH_OUT :
-- COMP_OUT :

library IEEE;
use IEEE.std_logic_1164.all;

entity RLI_CR is
port	     (
			FLUSH_IN : in std_logic;
			CODE_IN : in std_logic_vector (34 downto 0);
			LENGTH_IN : in std_logic_vector (5 downto 0);
			CODE_RLI_IN : in std_logic_vector(4 downto 0);
			CODE_RLI_LENGTH_IN : in std_logic_vector(2  downto 0);
			COMP_IN :in std_logic;
			MOVE_ENABLE_IN : in std_logic;
			CLEAR:in std_logic;
			RESET: in std_logic;
			CLK :in std_logic;
			FLUSH_OUT:out std_logic;
			CODE_OUT:out std_logic_vector(34 downto 0);
			LENGTH_OUT:out std_logic_vector( 5 downto 0);
			CODE_RLI_OUT : out std_logic_vector(4 downto 0);
			CODE_RLI_LENGTH_OUT : out std_logic_vector(2 downto 0);
			COMP_OUT: out std_logic;
			MOVE_ENABLE_OUT : out std_logic
		);
 end RLI_CR;

architecture STRUCTURAL of RLI_CR is

 signal FLUSH_OUT_aux : std_logic;
 signal CODE_OUT_aux : std_logic_vector (34 downto 0);
 signal COMP_OUT_aux : std_logic;
 signal LENGTH_OUT_aux: std_logic_vector(5 downto 0);
 signal CODE_RLI_OUT_aux : std_logic_vector(4 downto 0);
 signal	CODE_RLI_LENGTH_OUT_aux : std_logic_vector(2 downto 0);
 signal MOVE_ENABLE_OUT_aux : std_logic;


begin

 process(CLK,CLEAR)
 begin
	if (CLEAR='0') then		
	      FLUSH_OUT_aux<='1';
          CODE_OUT_aux<="00000000000000000000000000000000000";
          COMP_OUT_aux<='1';
          LENGTH_OUT_aux<="000000";
		  CODE_RLI_OUT_aux <="00000";
	  	  CODE_RLI_LENGTH_OUT_aux <= "000";	
		  MOVE_ENABLE_OUT_aux <='1';

	elsif ((CLK'event) and (CLK='1')) then
		if (RESET='0') then		
	      FLUSH_OUT_aux<='1';
          CODE_OUT_aux<="00000000000000000000000000000000000";
          COMP_OUT_aux<='1';
          LENGTH_OUT_aux<="000000";
		  CODE_RLI_OUT_aux <="00000";
	  	  CODE_RLI_LENGTH_OUT_aux <= "000";	
 		  MOVE_ENABLE_OUT_aux <='1';
		elsif (MOVE_ENABLE_IN = '0') then -- active at zero
		  FLUSH_OUT_aux<=FLUSH_IN;
          CODE_OUT_aux<=CODE_IN;
          COMP_OUT_aux<=COMP_IN;
          LENGTH_OUT_aux<=LENGTH_IN;
		  CODE_RLI_OUT_aux <= CODE_RLI_IN;
	  	  CODE_RLI_LENGTH_OUT_aux <= CODE_RLI_LENGTH_IN;	
		  MOVE_ENABLE_OUT_aux <=MOVE_ENABLE_IN;
     else
		     FLUSH_OUT_aux<=FLUSH_IN;
          CODE_OUT_aux<=CODE_OUT_aux;
          COMP_OUT_aux<=COMP_IN;
          LENGTH_OUT_aux<= LENGTH_OUT_aux;
		     CODE_RLI_OUT_aux <= CODE_RLI_OUT_aux;
	  	    CODE_RLI_LENGTH_OUT_aux <= CODE_RLI_LENGTH_OUT_aux;	
		    MOVE_ENABLE_OUT_aux <= MOVE_ENABLE_IN;
		end if;
	end if;


 end process;


 FLUSH_OUT<=FLUSH_OUT_aux;
 CODE_OUT<=CODE_OUT_aux;
 COMP_OUT<=COMP_OUT_aux;
 LENGTH_OUT<=LENGTH_OUT_aux;
 CODE_RLI_LENGTH_OUT <= CODE_RLI_LENGTH_OUT_aux;
 CODE_RLI_OUT<= CODE_RLI_OUT_aux;	
 MOVE_ENABLE_OUT <= MOVE_ENABLE_OUT_aux;

--FLUSH_OUT<=FLUSH_IN;
--CODE_OUT<=CODE_IN;
--COMP_OUT<=COMP_IN;
--LENGTH_OUT<=LENGTH_IN;


end structural;	
