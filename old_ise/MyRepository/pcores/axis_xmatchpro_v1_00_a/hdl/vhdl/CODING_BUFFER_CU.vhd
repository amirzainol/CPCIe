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
--  ENTITY       = CODING_BUFFER_CU                --
--  version      = 1.0                             --
--  last update  = 1/5/00                        --
--  author       = Jose Nunez                      --
-----------------------------------------------------


-- FUNCTION
-- Control unit that controls the coding buffer


--  PIN LIST
--  START : enable writting to the buffer
--  FINISHED : the block has been process output the data that it is left in the buffer
--  OVERFLOW = 64 bit of compressed data available.
--  THRESHOLD : start reading from the buffer
--  CODING_READ_ADDRESS : buffer location that it is being read
--  CODING_WRITE_ADDRESS : buffer location that it is being written
--  CLK : clock
--  CLEAR : clear
--  CODING_OVERFLOW : the CU detects a coding overflow stop inputting uncompressed data 
--  CODING_UNDERFLOW : the CU detects a coding underflow stop outputting compressed data
--  ENABLE_WRITE : enable writting to the buffer
--  ENABLE_READ : enable reading from the buffer

library ieee;
use ieee.std_logic_1164.all;
library dzx;
use dzx.bit_arith.all;
use dzx.bit_utils.all; 


entity CODING_BUFFER_CU is
port
(   
    FORCE_STOP : in bit; 
    WAITN : in bit;
	  START : in bit;
	  FINISHED : in bit;
	  BUS_ACKNOWLEDGE : in bit;
	  THRESHOLD_LEVEL : in bit_vector(8 downto 0);
	  CODING_READ_ADDRESS : in bit_vector(8 downto 0);
	  CODING_WRITE_ADDRESS : in bit_vector(8 downto 0);
	  CLK : in bit;
	  CLEAR : in bit;
	  BUS_REQUEST : out bit;
	  FLUSHING : out bit;
	  CODING_OVERFLOW : out bit;
	  CODING_UNDERFLOW : out bit;
	  ENABLE_WRITE : out bit;
	  FINISH : out bit; -- the buffer process
      CLEAR_COUNTERS : out bit;
	  ENABLE_READ : out bit
);
end CODING_BUFFER_CU;

architecture STRUCTURAL of CODING_BUFFER_CU is

signal CURRENT_STATE : bit_vector(3 downto 0);
signal NEXT_STATE : bit_vector(3 downto 0);
signal CODING_OVERFLOW_AUX : bit;
signal CODING_UNDERFLOW_AUX : bit;
signal FLUSHING_AUX : bit;
signal FINISH_OP : bit; -- data valid control next state is finish
signal ENABLE_WRITE_AUX : bit;



begin

STATES : process (FINISH_OP, START, THRESHOLD_LEVEL, CURRENT_STATE, FINISHED, CODING_UNDERFLOW_AUX, CODING_OVERFLOW_AUX, CODING_READ_ADDRESS, CODING_WRITE_ADDRESS, BUS_ACKNOWLEDGE)
begin
case CURRENT_STATE is
	when "0000" =>  -- state 0 buffer inactive
		if (START = '0') then 
			NEXT_STATE <= "0001";
		else
			NEXT_STATE <= CURRENT_STATE;
		end if;
		ENABLE_READ <= '0';
		ENABLE_WRITE_AUX <= '0';
		BUS_REQUEST <= '1';
		FLUSHING_AUX <= '1';
		FINISH <= '1';
            CLEAR_COUNTERS <= '1';

	 when "0001" =>  -- state 1 start adding data to the buffer
		if (FINISHED = '0') then
			NEXT_STATE <= "1001"; -- request the bus but do not write
	 	elsif (CODING_WRITE_ADDRESS - CODING_READ_ADDRESS > THRESHOLD_LEVEL) then
	   		NEXT_STATE <= "0110"; -- request the bus
		else
			NEXT_STATE <= CURRENT_STATE;
		end if;
		ENABLE_READ <= '0';
		ENABLE_WRITE_AUX <= '1';
		BUS_REQUEST <= '1';
		FLUSHING_AUX <= '1';
 		FINISH <= '1';
            CLEAR_COUNTERS <= '0';

	 when "0010" =>    -- state 2 writting and reading data
	     if (FINISHED = '0') then -- finished active low
		    NEXT_STATE <= "0101"; -- empty the buffer
	   	 elsif (CODING_OVERFLOW_AUX = '0') then
	   		NEXT_STATE <= "0011"; -- stop writting data
		 elsif (CODING_UNDERFLOW_AUX = '1') then
	  		NEXT_STATE <= "0100"; -- stop reading data
	 	 else
			NEXT_STATE <= CURRENT_STATE;
	 	 end if;
		 ENABLE_READ <= '1'; 
		 ENABLE_WRITE_AUX <= '1'; 
		 BUS_REQUEST <= '0';
  		 FLUSHING_AUX <= '1';
             FINISH <= '1';
             CLEAR_COUNTERS <= '0';

	 when "0011" => -- only reading
		 if (CODING_OVERFLOW_AUX = '1') then
	 		NEXT_STATE <= "0010"; 
		 else
	        NEXT_STATE <= CURRENT_STATE;
		 end if;
		 ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '1';
		 BUS_REQUEST <= '0';
             FLUSHING_AUX <= '1';
		 FINISH <= '1';
             CLEAR_COUNTERS <= '0';


	 when "0100" => -- only writting
	   if (FINISHED = '0') then
				NEXT_STATE <= "1001"; -- request the bus but do not write
		 elsif (CODING_WRITE_ADDRESS - CODING_READ_ADDRESS > THRESHOLD_LEVEL) then
		 		NEXT_STATE <= "0110"; --request the bus 
		 else
			        NEXT_STATE <= CURRENT_STATE;
		 end if;
		 ENABLE_WRITE_AUX <= '1';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '1';
             FLUSHING_AUX <= '1';
             FINISH <= '1';
             CLEAR_COUNTERS <= '0';

	when "1001" => -- continue to request but do not write or read
		  if (BUS_ACKNOWLEDGE = '0') then
 			NEXT_STATE <= "0101";  -- only read ( from memory empty the buffer)
		  else
		    NEXT_STATE <= CURRENT_STATE;
		  end if;

		 ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '0';
                 FLUSHING_AUX <= '0';
                 FINISH <= '1';
                CLEAR_COUNTERS <= '0';
			
	 when "0101" => -- emptying the buffer only reading
		 if (FINISH_OP = '1') then
	 		NEXT_STATE <= "1000";  -- end 
		 else
	        NEXT_STATE <= CURRENT_STATE;
		 end if;
		 ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '1';
		 BUS_REQUEST <= '0';
             FLUSHING_AUX <= '0';
             FINISH <= '1';
             CLEAR_COUNTERS <= '0';


	 when "0110" => -- request the bus
		 if (FINISHED = '0') then
			  NEXT_STATE <= "1001"; -- request the bus but do not write. nothing else to write
	   elsif(CODING_OVERFLOW_AUX = '0') then
		    NEXT_STATE <="0111"; -- stop writting continue request
		 elsif (BUS_ACKNOWLEDGE = '0') then
			  NEXT_STATE <= "0010";  -- read and write  
		 else
	       NEXT_STATE <= CURRENT_STATE;
		 end if;
		 ENABLE_WRITE_AUX <= '1';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '0';
                 FLUSHING_AUX <= '1';
                 FINISH <= '1';
                 CLEAR_COUNTERS <= '0';

 	 when "0111" => -- request the bus
		 if (BUS_ACKNOWLEDGE = '0') then
	 		NEXT_STATE <= "0010";  -- read and write  
		 else
	        NEXT_STATE <= CURRENT_STATE;
		 end if;
		 ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '0';
      FLUSHING_AUX <= '1';
      FINISH <= '1';
      CLEAR_COUNTERS <= '0';
	 when "1000" => 
		 NEXT_STATE <= "0000";
		 ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '1';
         FLUSHING_AUX <= '1';
         FINISH <= '0';
         CLEAR_COUNTERS <= '0';
  

	 when others =>
        NEXT_STATE <= "0000";
		ENABLE_READ <= '0';
		ENABLE_WRITE_AUX <= '0';
		BUS_REQUEST <= '1';
		FLUSHING_AUX <= '1';
		FINISH <= '1';
        CLEAR_COUNTERS <= '0';




end  case;    	
end process STATES;

CODING_OVERFLOW_AUX <= '0' when ((CODING_READ_ADDRESS(8 downto 1) = CODING_WRITE_ADDRESS(8 downto 1) + "00000001") and ENABLE_WRITE_AUX = '1') else '1'; -- direct output error condition
CODING_UNDERFLOW_AUX <= '1' when (CODING_WRITE_ADDRESS(8 downto 1) = CODING_READ_ADDRESS(8 downto 1) + "00000001") else '0';

-- coding undeflow active when read address > write address

CODING_OVERFLOW <= CODING_OVERFLOW_AUX;

-- only coding underflow if not in flusing state
-- coding underflow if coding_write_address = coding_read address => about to finish
-- data valid control

FINISH_OP <= '1' when (CODING_WRITE_ADDRESS = CODING_READ_ADDRESS and WAITN = '1') else '0'; -- only finish when WAITN is inactive

CODING_UNDERFLOW <= (CODING_UNDERFLOW_AUX and FLUSHING_AUX) or FINISH_OP;
FLUSHING <= FLUSHING_AUX;
ENABLE_WRITE <= ENABLE_WRITE_AUX;

FLIP_FLOPS : process(CLK, CLEAR)
begin 

if (CLEAR = '0') then
	CURRENT_STATE <= "0000"; --state 0
elsif ((CLK'event) and (CLK='1')) then
     if (FORCE_STOP = '0') then
				CURRENT_STATE <= "0000";
     else
				CURRENT_STATE <= NEXT_STATE;
     end if;
end if;

end process FLIP_FLOPS;



end STRUCTURAL;

