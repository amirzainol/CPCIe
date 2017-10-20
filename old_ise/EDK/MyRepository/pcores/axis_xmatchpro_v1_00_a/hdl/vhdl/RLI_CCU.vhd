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

-----------------------------------------------------
--  ENTITY       = RLI_CCU (RLI Coding Control Unit)   --
--  version      = 1.0                             --
--  last update  = 6/6/01                        --
--  author       = Jose Nunez                      --
-----------------------------------------------------


-- FUNCTION
-- State machine to control the RLI coding process


--  PIN LIST
--  CODE_IN : 35 bits of normal compressed code
--  LENGTH_IN : 6 bits indicating how many bits valid in CODE_IN
--  COUNT : number of repetitions in a run length
--  RL_DETECTED : run length detection
--  CLEAR : asyncronus clear
--  CLK : master clk
--  CODE_OUT : code output 35 bits
--  LENGTH_OUT : length output 
 
library ieee;
use ieee.std_logic_1164.all;
library dzx;
use dzx.bit_arith.all;

entity RLI_CCU is
port
(
      CODE_IN : in bit_vector(34 downto 0) ;
	  MOVE_ENABLE_IN : in bit;
	  FLUSH_IN : in bit;
	  LENGTH_IN : in bit_vector (5 downto 0);
	  CODE_RLI : in bit_vector(4 downto 0);
	  CODE_RLI_LENGTH : in bit_vector(2 downto 0);
	  COUNT : in bit_vector(7 downto 0);
	  RL_DETECTED : in bit;
      CLEAR : in bit ;
	  RESET: in bit;
      CLK : in bit ;
      CODE_OUT : out bit_vector(34 downto 0);
 	  LENGTH_OUT : out bit_vector(5 downto 0)
);
end RLI_CCU;


architecture STRUCTURAL of RLI_CCU is

signal CURRENT_STATE : bit_vector(1 downto 0);
signal NEXT_STATE : bit_vector(1 downto 0);
signal COUNT_AUX: bit_vector(7 downto 0);
signal LENGTH_AUX: bit_vector(5 downto 0);
signal TOTAL_LENGTH: bit_vector(5 downto 0);
signal CODE_RLI_INT : bit_vector(34 downto 0);
signal CODE_RLI_STORED : bit_vector(4 downto 0);
signal CODE_RLI_LENGTH_STORED : bit_vector(2 downto 0);
signal CODE_OUT_AUX : bit_vector(34 downto 0);
signal LENGTH_OUT_AUX : bit_vector(5 downto 0);

begin

STATES : process (MOVE_ENABLE_IN, FLUSH_IN,RL_DETECTED,CURRENT_STATE,CODE_IN,LENGTH_IN, TOTAL_LENGTH,CODE_RLI_INT)
begin

case CURRENT_STATE is
		when "00" =>  -- state 0 normal output
			if (RL_DETECTED = '1') then 
				NEXT_STATE <= "01";
			else
				NEXT_STATE <= CURRENT_STATE;
			end if;
       if (MOVE_ENABLE_IN = '1' and FLUSH_IN = '1') then
 					CODE_OUT_AUX <= "00000000000000000000000000000000000";
					LENGTH_OUT_AUX <= "000000"; 
			else
					CODE_OUT_AUX <= CODE_IN;
					LENGTH_OUT_AUX <= LENGTH_IN;
  			end if;

		 when "01" =>  -- state 1 length set to zero
  		 	if (RL_DETECTED = '0' or FLUSH_IN = '0') then -- flush indicates terminate by flushing
		   		NEXT_STATE <= "11";
			else
				NEXT_STATE <= "10";
			end if;
			CODE_OUT_AUX <= "00000000000000000000000000000000000";
			LENGTH_OUT_AUX <= "000000";

		 when "10" =>  -- state 1 length set to zero
		 	if (RL_DETECTED = '0' or FLUSH_IN = '0') then
		   		NEXT_STATE <= "11";
			else
				NEXT_STATE <= CURRENT_STATE;
			end if;
				CODE_OUT_AUX <= "00000000000000000000000000000000000";
				LENGTH_OUT_AUX <= "000000";
		 when "11" =>    -- state 2 output RL code 
	 		if (RL_DETECTED = '0') then
	   			NEXT_STATE <= "00";
			else
				NEXT_STATE <= "01";
			end if;
			CODE_OUT_AUX <= CODE_RLI_INT; -- take the match loc from input add the special match type for RL and the count
			LENGTH_OUT_AUX <= TOTAL_LENGTH; -- length out 16 or 10 one bit for the match
		 when others =>
			NEXT_STATE <= "00";
			CODE_OUT_AUX <= "00000000000000000000000000000000000";
			LENGTH_OUT_AUX <= "000000";
end  case;    	
	
end process STATES;

-- CODE_OUT <= CODE_OUT_AUX when MOVE_ENABLE_IN = '0' else "00000000000000000000000000000000000";
-- LENGTH_OUT <= LENGTH_OUT_AUX when MOVE_ENABLE_IN = '0' else "000000"; 

CODE_OUT <= CODE_OUT_AUX;
LENGTH_OUT <= LENGTH_OUT_AUX;

-- store RLI code inmediatly after RL is detected before NFL is incremented

STORED_RLI : process(CLK, CLEAR)
begin 

if (CLEAR = '0') then
	CODE_RLI_STORED <= "00000";
	CODE_RLI_LENGTH_STORED <= "000";
elsif ((CLK'event) and (CLK='1')) then
	if (RESET = '0') then
		CODE_RLI_STORED <= "00000";
		CODE_RLI_LENGTH_STORED <= "000";	
	elsif (CURRENT_STATE = "01") then -- save the first RLI code
		CODE_RLI_STORED <= CODE_RLI;
		CODE_RLI_LENGTH_STORED <= CODE_RLI_LENGTH;
	else
		CODE_RLI_STORED <= CODE_RLI_STORED;
		CODE_RLI_LENGTH_STORED <= CODE_RLI_LENGTH_STORED;
	end if;
end if;

end process STORED_RLI;



-- use 8 bits or 2 bits if the run length position is higher than zero

COUNT_AUX <= COUNT when CODE_RLI_STORED(3 downto 0)="0000" else COUNT(1 downto 0)&"000000";
LENGTH_AUX <= "001011" when CODE_RLI_STORED(3 downto 0)="0000" else "000101"; -- run length plus RLI type length (3)
TOTAL_LENGTH <= ("00" & CODE_RLI_LENGTH_STORED) + LENGTH_AUX; 

BUILD_RLI_CODE : process(CODE_RLI_STORED, CODE_RLI_LENGTH_STORED, COUNT_AUX)
begin
case CODE_RLI_LENGTH_STORED is
	when "001" => CODE_RLI_INT <= CODE_RLI_STORED(4) & "011" & COUNT_AUX & "00000000000000000000000";
	when "010" => CODE_RLI_INT <= CODE_RLI_STORED(4 downto 3) & "011" & COUNT_AUX & "0000000000000000000000";
	when "011" => CODE_RLI_INT <= CODE_RLI_STORED(4 downto 2) & "011" & COUNT_AUX & "000000000000000000000";
	when "100" => CODE_RLI_INT <= CODE_RLI_STORED(4 downto 1) & "011" & COUNT_AUX & "00000000000000000000";
	when "101" => CODE_RLI_INT <= CODE_RLI_STORED(4 downto 0) & "011" & COUNT_AUX & "0000000000000000000";
	when others => CODE_RLI_INT <= "00000000000000000000000000000000000";
end case;


end process BUILD_RLI_CODE;

 
FLIP_FLOPS : process(CLK, CLEAR)
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

