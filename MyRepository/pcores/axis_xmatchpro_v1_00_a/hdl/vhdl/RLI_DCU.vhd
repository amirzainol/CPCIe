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
--  ENTITY       =  RLI_DCU    --
--  version      =  1.0        --
--  last update  =  25/11/99   --
--  author       =  Jose Nunez --
---------------------------------


-- FUNCTION
-- RLI decoding control unit


--  PIN LIST
--  RL_DETECTED : detection of a RL code in the main decoder
--  LOCATION_IN : decoded location in the main decoder
--  MATCH_TYPE_IN : decoded match type in the main decoder
--  END_COUNT : end of RLI count indication
--  CLEAR : asyncronus clear 
--  CLK : master clock
--  LOCATION_OUT : location output of the DCU
--  MATCH_TYPE_OUT : match type output of the DCU
--  SET_LENGTH_TO_ZERO : run length active no more data needed


library ieee;
use ieee.std_logic_1164.all;

entity RLI_DCU is
port
(
      RL_DETECTED : in bit;
      LOCATION_IN : in bit_vector(3 downto 0);
      MATCH_TYPE_IN : in bit_vector(3 downto 0);
	MASK_IN : in bit_vector(4 downto 0);
	FULL_HIT_IN : in bit;
	  END_COUNT : in bit;
	  CLEAR : in bit;
	  RESET : in bit;
	  CLK : in bit ;
	  LOCATION_OUT : out bit_vector(3 downto 0);
	  MATCH_TYPE_OUT : out bit_vector(3 downto 0);
	  MASK_OUT : out bit_vector(4 downto 0);
	  FULL_HIT_OUT : out bit;
	  SET_LENGTH_TO_ZERO : out bit
);
end RLI_DCU;

architecture STRUCTURAL of RLI_DCU is

signal CURRENT_STATE : bit_vector(1 downto 0);
signal NEXT_STATE : bit_vector(1 downto 0);


begin

STATES : process (FULL_HIT_IN,RL_DETECTED,CURRENT_STATE,LOCATION_IN,MATCH_TYPE_IN,END_COUNT)
begin
case CURRENT_STATE is
	when "00" =>  -- state 0 normal output
		if (RL_DETECTED = '1') then 
			NEXT_STATE <= "01";
		else
			NEXT_STATE <= CURRENT_STATE;
		end if;
		LOCATION_OUT <= LOCATION_IN;
		MATCH_TYPE_OUT <= MATCH_TYPE_IN;
		FULL_HIT_OUT <= FULL_HIT_IN;
		SET_LENGTH_TO_ZERO <= '0';

	 when "01" =>  -- state 1 length set to zero
	 	if (END_COUNT = '1') then
	   		NEXT_STATE <= "00";
		else
			NEXT_STATE <= CURRENT_STATE;
		end if;
		LOCATION_OUT <= LOCATION_IN;
		MATCH_TYPE_OUT <= "0000";
		FULL_HIT_OUT <= '0'; -- active at zero
		SET_LENGTH_TO_ZERO <= '1';
	when "10" => 
		NEXT_STATE <= "00";
		LOCATION_OUT <= "0000";
		MATCH_TYPE_OUT <= "0000";
		FULL_HIT_OUT <= '0';
		SET_LENGTH_TO_ZERO <= '0';

	when others =>
		
		NEXT_STATE <= "00";
		LOCATION_OUT <= "0000";
		MATCH_TYPE_OUT <= "0000";
		SET_LENGTH_TO_ZERO <= '0';
		FULL_HIT_OUT <= '1';



end  case;   
end process STATES;

MASK_OUT <= MASK_IN;

FLIP_FLOPS : process(CLK, CLEAR, NEXT_STATE)
begin 

if (CLEAR = '0') then
	CURRENT_STATE <= "00"; --state 0
elsif ((CLK'event) and (CLK='1')) then
	if (RESET = '0') then
		CURRENT_STATE <= "00"; --state 0
	else
		CURRENT_STATE <= NEXT_STATE;
	end if;
end if;

end process FLIP_FLOPS;





end STRUCTURAL;

