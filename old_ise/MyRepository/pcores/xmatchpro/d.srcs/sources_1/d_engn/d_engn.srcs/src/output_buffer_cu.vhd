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
--  ENTITY       = OUTPUT_BUFFER_CU                --
--  version      = 1.0                             --
--  last update  = 31/6/01                        --
--  author       = Jose Nunez                      --
-----------------------------------------------------


-- FUNCTION
-- Control unit that controls the output buffer
	
--  PIN LIST
--  START : enable the buffer
--  STOP : all the uncompressed data has accessed the buffer
--  EMPTY : all the uncompressed data has left the buffer 
--  BUS_ACKNOWLEDGE : the uncompressed bus in is granted
--  CODING_READ_ADDRESS : input buffer location that it is being read
--  CODING_WRITE_ADDRESS : input buffer location that it is being written
--  CLK : clock
--  CLEAR : clear
--  BUS_REQUEST : the input buffer is being requested
--  READY : buffer ready with data to be output to the uncompressed output bus
--  CLEAR_COUNTERS : counters are reset. Counters generate the addresses to the buffers
--  ENABLE_WRITE : enable writting to the buffer
--  ENABLE_READ : enable reading from the buffer

library dzx;
use dzx.bit_arith.all;
use dzx.bit_utils.all; 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity OUTPUT_BUFFER_CU is
port
(   
	  WAITN : in std_logic;
    FORCE_STOP : in std_logic;
	  START_D : in std_logic;
	  START_C : in std_logic;
	  FINISHED  : in std_logic;
	  BUS_ACKNOWLEDGE : in std_logic;
	  CODING_READ_ADDRESS : in std_logic_vector(8 downto 0);
	  CODING_WRITE_ADDRESS : in std_logic_vector(8 downto 0);
	  THRESHOLD : in std_logic_vector(8 downto 0);
	  CLK : in std_logic;
	  CLEAR : in std_logic;
	  FLUSHING : out std_logic;
	  FINISHED_FLUSHING : out std_logic;
	  OVERFLOW_DETECTED : out std_logic;
	  ENABLE_WRITE : out std_logic;
	  ENABLE_READ : out std_logic;
	  READY : out std_logic;
    CLEAR_COUNTERS : out std_logic;
    OVERFLOW_CONTROL : out std_logic;
	  BUS_REQUEST : out std_logic
);
end OUTPUT_BUFFER_CU;

architecture STRUCTURAL of OUTPUT_BUFFER_CU is

signal CURRENT_STATE : std_logic_vector(3 downto 0);
signal NEXT_STATE : std_logic_vector(3 downto 0);
signal ENABLE_WRITE_AUX : std_logic;
signal OVERFLOW_CONTROL_AUX : std_logic;


begin

STATES : process (WAITN, THRESHOLD, START_C, START_D, CURRENT_STATE, FINISHED, CODING_READ_ADDRESS, CODING_WRITE_ADDRESS, BUS_ACKNOWLEDGE)
begin
case CURRENT_STATE is
	when "0000" =>  -- state 0 buffer inactive
		if (START_D = '0' or START_C = '0') then 
			NEXT_STATE <= "0001";
		else
			NEXT_STATE <= CURRENT_STATE;
		end if;
		ENABLE_READ <= '0';
		ENABLE_WRITE_AUX <= '0';
		BUS_REQUEST <= '1';
        CLEAR_COUNTERS <= '1';
	 	READY <= '1';
		FLUSHING <= '1';
		FINISHED_FLUSHING <= '1';

	 when "0001" =>  -- state 1 request the bus and start adding data to the buffer
		if (FINISHED = '0') then
			NEXT_STATE <= "1010";
		elsif (CODING_WRITE_ADDRESS - CODING_READ_ADDRESS > THRESHOLD) then -- request the bus
			NEXT_STATE <= "0101";
		else
			NEXT_STATE <= CURRENT_STATE;
		end if;
	 	ENABLE_READ <= '0';
		ENABLE_WRITE_AUX <= '1';
		BUS_REQUEST <= '1';
            CLEAR_COUNTERS <= '0';
		READY <= '1';	
		FLUSHING <= '1';
		FINISHED_FLUSHING <= '1';

	 when "0010" =>    -- start reading data from the input buffer and writting as well
    if (FINISHED = '0') then -- all the data has accessed the internal buffer
		 	NEXT_STATE <= "0100";
    else
	   	 NEXT_STATE <= "0110";
    end if;
	   	 ENABLE_READ <= '1'; 
		 ENABLE_WRITE_AUX <= '1'; 
		 BUS_REQUEST <= '0';
         CLEAR_COUNTERS <= '0';
		 READY <= '1';
		 FLUSHING <= '1';
		 FINISHED_FLUSHING <= '1';
	 
		when "0011" => -- now only writting to buffer
	     if (FINISHED = '0') then -- all the data has accessed the internal buffer active low
		 	    NEXT_STATE <= "1010";
		 elsif (CODING_WRITE_ADDRESS - CODING_READ_ADDRESS > THRESHOLD) then -- we have data ready to be output
	  		    NEXT_STATE <= "0101"; -- request the bus
		 else
			    NEXT_STATE <= CURRENT_STATE;
		 end if;	
    	 ENABLE_WRITE_AUX <= '1';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '1';
         CLEAR_COUNTERS <= '0';
		 READY <= '1';
	     FLUSHING <= '1';
		 FINISHED_FLUSHING <= '1';

	 when "0100" => -- now only reading. Flushing the buffer
		 if (CODING_WRITE_ADDRESS = CODING_READ_ADDRESS and WAITN = '1') then
		 	  NEXT_STATE <= "1001"; --it is over signal finish
		 else
		      NEXT_STATE <= CURRENT_STATE;
		 end if;
		 ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '1';
		 BUS_REQUEST <= '0';
         CLEAR_COUNTERS <= '0';
		 READY <= '0';
		 FLUSHING <= '0';
		 FINISHED_FLUSHING <= '1';

	 when "0101" =>  -- state 1 request the bus and start adding data to the buffer
	 if (FINISHED = '0') then -- all the data has accessed the internal buffer active low. stop writting
		 	    NEXT_STATE <= "1010";
	 elsif (BUS_ACKNOWLEDGE = '0') then -- bus ready to received data
		NEXT_STATE <= "0010";
	 else
		NEXT_STATE <= CURRENT_STATE;
	 end if;
	 ENABLE_READ <= '0';
	 ENABLE_WRITE_AUX <= '1';
	 BUS_REQUEST <= '0';
     CLEAR_COUNTERS <= '0';
	 READY <= '1';
	 FLUSHING <= '1';
	 FINISHED_FLUSHING <= '1';
	 
	 when "0110" =>    -- start reading data from the input buffer and writting as well
	     if (FINISHED = '0') then -- all the data has accessed the internal buffer
		 		NEXT_STATE <= "0100";
		 elsif (CODING_WRITE_ADDRESS = CODING_READ_ADDRESS + "000000001" and WAITN = '1') then -- we have empty the buffer wait		
			 	NEXT_STATE <= "0111";
		 else
		 		NEXT_STATE <= CURRENT_STATE;
		 end if;
	   	 ENABLE_READ <= '1'; 
		 ENABLE_WRITE_AUX <= '1'; 
		 BUS_REQUEST <= '0';
         CLEAR_COUNTERS <= '0';
		 READY <= '0';
		 FLUSHING <= '1';
		 FINISHED_FLUSHING <= '1';  

	 when "0111" =>    -- transition to disable reading ready still active

      if (WAITN = '1') then
	      NEXT_STATE <= "0011";   
      else
			NEXT_STATE <= CURRENT_STATE;
		 end if;
         ENABLE_WRITE_AUX <= '1';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '0';
         CLEAR_COUNTERS <= '0';
		 READY <= '0';	
		 FLUSHING <= '1';
	 	 FINISHED_FLUSHING <= '1';

	 when "1000" =>    -- transition to finish
	     NEXT_STATE <= "1001";   
         ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '1';
         CLEAR_COUNTERS <= '1';
		 READY <= '1';	
		 FLUSHING <= '0';
	 	 FINISHED_FLUSHING <= '1';

	 when "1001" =>    -- transition to finish
	     NEXT_STATE <= "0000";   
         ENABLE_WRITE_AUX <= '0';
		 ENABLE_READ  <= '0';
		 BUS_REQUEST <= '1';
         CLEAR_COUNTERS <= '1';
		 READY <= '1';	
		 FLUSHING <= '1';
	 	 FINISHED_FLUSHING <= '0';

	 when "1010" =>  -- state 1 request the bus and start adding data to the buffer
		 if (BUS_ACKNOWLEDGE = '0') then -- bus ready to received data
			NEXT_STATE <= "1011";
		 else
			NEXT_STATE <= CURRENT_STATE;
		 end if;
		 ENABLE_READ <= '0';
		 ENABLE_WRITE_AUX <= '0';
		 BUS_REQUEST <= '0';
     	 CLEAR_COUNTERS <= '0';
		 READY <= '1';
	 	 FLUSHING <= '1';
	 	 FINISHED_FLUSHING <= '1';
	 when "1011" =>  -- transition first enable the read of the buffers then signal ready in next cycle
	 	 NEXT_STATE <= "0100";
		 ENABLE_READ <= '1';
		 ENABLE_WRITE_AUX <= '0';
		 BUS_REQUEST <= '0';
     	 CLEAR_COUNTERS <= '0';
		 READY <= '1';
	 	 FLUSHING <= '1';
	 	 FINISHED_FLUSHING <= '1';

	when others =>
        NEXT_STATE <= "0000";
		ENABLE_READ <= '0';
		ENABLE_WRITE_AUX <= '0';
		BUS_REQUEST <= '1';
        CLEAR_COUNTERS <= '1';
		READY <= '1';
		FLUSHING <= '1';
 	 	FINISHED_FLUSHING <= '1';

end  case;    	
end process STATES;




FLIP_FLOPS : process(CLK, CLEAR)
begin 

if (CLEAR = '0') then
	CURRENT_STATE <= "0000"; --state 0
elsif ((CLK'event) and (CLK='1')) then
     if (FORCE_STOP = '0') then
				CURRENT_STATE <= "0000"; --state 0
     else
			CURRENT_STATE <= NEXT_STATE;
		end if;
end if;

end process FLIP_FLOPS;

OVERFLOW_DETECTED <= '0' when ((CODING_READ_ADDRESS = CODING_WRITE_ADDRESS + "000000001") and (ENABLE_WRITE_AUX = '1')) else '1';

FLIP_FLOPS2 : process(CLK, CLEAR)
begin 

if (CLEAR = '0') then
	OVERFLOW_CONTROL_AUX <= '0'; --state 0
elsif ((CLK'event) and (CLK='1')) then
     if (FORCE_STOP = '0') then
				OVERFLOW_CONTROL_AUX <= '0'; --state 0
     elsif (CODING_READ_ADDRESS = CODING_WRITE_ADDRESS + "110000000") then -- careful I change 256 to 484
				OVERFLOW_CONTROL_AUX <= '1';
	  elsif (CODING_WRITE_ADDRESS = CODING_READ_ADDRESS + "000000001" and WAITN = '1') then-- buffer empty    
			  OVERFLOW_CONTROL_AUX <= '0';
    else
		  OVERFLOW_CONTROL_AUX <= OVERFLOW_CONTROL_AUX;
		end if;
end if;

end process FLIP_FLOPS2;

OVERFLOW_CONTROL <= OVERFLOW_CONTROL_AUX;


ENABLE_WRITE <= ENABLE_WRITE_AUX;

end STRUCTURAL;

