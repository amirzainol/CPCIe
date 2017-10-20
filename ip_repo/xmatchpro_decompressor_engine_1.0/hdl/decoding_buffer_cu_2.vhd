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
--  ENTITY       = DECODING_BUFFER_CU              --
--  version      = 1.0                             --
--  last update  = 16/6/00                         --
--  author       = Jose Nunez                      --
-----------------------------------------------------

-- FUNCTION
-- Control unit that controls the decoding buffer

--  PIN LIST
--  START : enable writting to the buffer
--  FINISHED : the block has been process in the decompression engine stop requesting data.
--  UNDERFLOW : 64 bit of compressed data are needed.
--  THRESHOLD : more data is available in the buffer to be decompressed than the threshold limit.
--  CODING_READ_ADDRESS : buffer location that it is being read
--  CODING_WRITE_ADDRESS : buffer location that it is being written
--  CLK : clock
--  CLEAR : clear
--  BUS_REQUEST : more compressed data is required if after getting data the bus is denied and data is in the internal buffer stop requesting.
--  CODING_OVERFLOW : the CU detects a coding overflow stop inputting compressed data 
--  CODING_UNDERFLOW : the CU detects a coding underflow stop outputting compressed data
--  ENABLE_WRITE : enable writting to the buffer
--  FINISH : the buffer process
--  ENABLE_READ : enable reading from the buffer

library dzx;
use dzx.bit_arith.all;
use dzx.bit_utils.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DECODING_BUFFER_CU_2 is
	port(
		FORCE_STOP             : in  std_logic;
		START_D                : in  std_logic; --  enter decompression mode
		START_C                : in  std_logic; --  enter test mode since compression is active
		FINISHED_D             : in  std_logic; --  finish decompression mode
		FINISHED_C             : in  std_logic; -- finish test mode
		UNDERFLOW              : in  std_logic; -- the engine requests data
		BUS_ACKNOWLEDGE        : in  std_logic;
		WAITN                  : in  std_logic; -- wait states being introduced
		C_DATA_VALID           : in  std_logic; -- compressed data available in test mode
		THRESHOLD_LEVEL        : in  std_logic_vector(9 downto 0);
		DECODING_READ_ADDRESS  : in  std_logic_vector(9 downto 0);
		DECODING_WRITE_ADDRESS : in  std_logic_vector(9 downto 0);
		CLK                    : in  std_logic;
		CLEAR                  : in  std_logic;
		BUS_REQUEST            : out std_logic;
		DECODING_UNDERFLOW     : out std_logic;
		ENABLE_WRITE           : out std_logic;
		FINISH                 : out std_logic; -- the buffer process
		CLEAR_COUNTERS         : out std_logic;
		OVERFLOW_CONTROL       : out std_logic;
		ENABLE_READ            : out std_logic
	);
end DECODING_BUFFER_CU_2;

architecture STRUCTURAL of DECODING_BUFFER_CU_2 is

	signal CURRENT_STATE          : std_logic_vector(3 downto 0);
	signal NEXT_STATE             : std_logic_vector(3 downto 0);
	signal DECODING_OVERFLOW_AUX  : std_logic;
	signal DECODING_UNDERFLOW_AUX : std_logic;
	signal ENABLE_READ_INT        : std_logic;
	signal DECODING_UNDERFLOW_INT : std_logic; -- to hold underflow until threshold is overpassed
	signal ENABLE_WRITE_INT       : std_logic;
	signal BUS_ACKNOWLEDGE_INT    : std_logic;
	signal BUS_REQUEST_INT        : std_logic;
	signal OVERFLOW_CONTROL_AUX   : std_logic;
	--signal DECODING_UNDERFLOW_DELAY : bit;

begin

	STATES : process(WAITN, START_C, START_D, THRESHOLD_LEVEL, CURRENT_STATE, FINISHED_C, FINISHED_D, C_DATA_VALID, DECODING_UNDERFLOW_AUX, DECODING_OVERFLOW_AUX, DECODING_READ_ADDRESS, DECODING_WRITE_ADDRESS, BUS_ACKNOWLEDGE)
	begin
		case CURRENT_STATE is
			when "0000" =>              -- state 0 buffer inactive. Two modes: test mode and decompression mode
				if (START_D = '0') then
					NEXT_STATE <= "0001";
				elsif (START_C = '0') then
					NEXT_STATE <= "1001";
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				BUS_ACKNOWLEDGE_INT    <= '0';
				DECODING_UNDERFLOW_INT <= '0';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '1'; -- read and write counters are at 0

			when "0001" =>              -- request data ( request the bus )
				if (FINISHED_D = '0' and BUS_ACKNOWLEDGE = '0' and WAITN = '1') then --simultanenously
					NEXT_STATE <= "0101"; -- wait for a bus acknowledge before you finish
				elsif (FINISHED_D = '0') then -- if finish when requesting the bus
					NEXT_STATE <= "0111"; -- wait for a bus acknowledge before you finish
				elsif (BUS_ACKNOWLEDGE = '0') then
					NEXT_STATE <= "0010"; -- start writting data to the buffer
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '0';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '1';

			when "0010" =>              -- state 2 writing to the buffer
				if (FINISHED_D = '0' and BUS_ACKNOWLEDGE = '0' and WAITN = '1') then --the decompression engine finishes
					NEXT_STATE <= "0101"; -- end
				elsif (FINISHED_D = '0') then --the decompression engine finishes. so automatically ends no more data needed all lbock reconstructed
					NEXT_STATE <= "0111"; -- wait for acknowledge
					--	elsif(BUS_ACKNOWLEDGE = '1' and WAITN = '1') then -- no more data available to write to the buffer block is inside. This is only valid if bus_acknowledge negated means finish
					--		NEXT_STATE <= "0100"; -- start only reading
				elsif (DECODING_WRITE_ADDRESS - DECODING_READ_ADDRESS > THRESHOLD_LEVEL) then --start reading from the buffer
					NEXT_STATE <= "0011"; -- start reading data from the buffer
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '1';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '1';
				BUS_REQUEST_INT        <= '0';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';

			when "0011" =>              -- state 3 reading from the buffer and writting to it
				if (FINISHED_D = '0' and BUS_ACKNOWLEDGE = '0' and WAITN = '1') then --simultanenously
					NEXT_STATE <= "0101"; -- wait for a bus acknowledge before you finish
				elsif (FINISHED_D = '0') then --the decompression engine finishes. so automatically ends no more data needed all lbock reconstructed
					NEXT_STATE <= "0111"; -- wait for acknowledge
					-- 	elsif (BUS_ACKNOWLEDGE='1' and WAITN = '1')  then --stop writting to the buffer process terminates. This is only valid if bus_acknowledge negated means finish
					--   		NEXT_STATE <= "0100"; -- only reading data from the buffer
					--	elsif ( DECODING_OVERFLOW_AUX = '0' or DECODING_WRITE_ADDRESS(8 downto 1) = "00111111") then
				elsif (DECODING_OVERFLOW_AUX = '0') then
					NEXT_STATE <= "0110"; -- wait 
				elsif (DECODING_UNDERFLOW_AUX = '1') then -- only writting to the buffer. underflow can happen with wait states
					NEXT_STATE <= "0010";
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '1';
				ENABLE_WRITE_INT       <= '1';
				BUS_REQUEST_INT        <= '0';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';

				-- this state is currently not reachable 
			when "0100" =>              -- state 4 reading from the buffer. In only reading never request more data
				if (FINISHED_D = '0' and BUS_ACKNOWLEDGE = '0' and WAITN = '1') then --simultanenously
					NEXT_STATE <= "0101"; -- wait for a bus acknowledge before you finish
				elsif (FINISHED_D = '0') then --the decompression engine finishes. so automatically ends no more data needed all lbock reconstructed
					NEXT_STATE <= "0111"; -- wait for acknowledge	
					--  		elsif (DECODING_UNDERFLOW_AUX = '1') then -- only writting to the buffer
					--			NEXT_STATE <= "0010";
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '0';
				ENABLE_READ_INT        <= '1';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';
			when "0101" =>              -- signal finish
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '0';
				NEXT_STATE             <= "0000"; -- end
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '0';
				CLEAR_COUNTERS         <= '0';
			when "0110" =>              -- state 6 reading from the buffer. overflow more data needed
				if (FINISHED_D = '0') then --simultanenously
					NEXT_STATE <= "0101"; -- wait for a bus acknowledge before you finish
				elsif (DECODING_UNDERFLOW_AUX = '1') then -- we have exahusted the compressed data request more
					NEXT_STATE <= "0001"; -- request bus
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '1';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';

			when "0111" =>              -- request data ( request the bus ) waiting for the acknowlecge before finishing directly
				if (BUS_ACKNOWLEDGE = '0' and WAITN = '1') then
					NEXT_STATE <= "0101"; -- finish directly
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '0';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '1';

			when "1001" =>              -- waiting for data in test mode 
				if (C_DATA_VALID = '0') then
					NEXT_STATE <= "1010"; -- start writting data to the buffer
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '1';

			when "1010" =>              -- state 2 writing to the buffer
				if (FINISHED_C = '0') then -- no more data available to write to the buffer the whole block is inside finish
					NEXT_STATE <= "1100"; -- start only reading
				elsif (C_DATA_VALID = '1') then
					NEXT_STATE <= "1110"; -- wait 
				elsif (DECODING_WRITE_ADDRESS - DECODING_READ_ADDRESS > "0000000010") then --start reading from the buffer
					NEXT_STATE <= "1011"; -- start reading data from the buffer
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '1';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '1';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';
			when "1011" =>              -- state 3 reading from the buffer and writting to it
				if (FINISHED_C = '0') then --stop writting to the buffer process terminates
					NEXT_STATE <= "1100"; -- only reading data from the buffer
				elsif (C_DATA_VALID = '1') then
					NEXT_STATE <= "1110"; -- wait 
				elsif (DECODING_UNDERFLOW_AUX = '1') then -- only writting to the buffer
					NEXT_STATE <= "1010";
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '1';
				ENABLE_WRITE_INT       <= '1';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';
			when "1110" =>              -- wait state. state reading from the buffer but waiting to write more data
				if (FINISHED_C = '0') then --stop writting to the buffer process terminates
					NEXT_STATE <= "1100"; -- only reading data from the buffer	
				elsif (C_DATA_VALID = '0' and DECODING_UNDERFLOW_AUX = '1') then -- data available write but do not read with underflow
					NEXT_STATE <= "1010"; --  write
				elsif (DECODING_UNDERFLOW_AUX = '1') then -- total wait do not read or write
					NEXT_STATE <= "1111"; -- total wait do not read or write
				elsif (C_DATA_VALID = '0') then -- do not read or write
					NEXT_STATE <= "1011"; -- read and write
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '1';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';
			when "1100" =>              -- state 4 reading from the buffer. In only reading never request more data
				if (FINISHED_D = '0') then --the decompression engine finishes
					NEXT_STATE <= "1101"; -- end  
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '0';
				ENABLE_READ_INT        <= '1';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';
			when "1101" =>              -- signal finish
				DECODING_UNDERFLOW_INT <= '0';
				BUS_ACKNOWLEDGE_INT    <= '0';
				NEXT_STATE             <= "0000"; -- end
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '0';
				CLEAR_COUNTERS         <= '0';
			when "1111" =>              -- wait state. state reading from the buffer but waiting to write more data
				if (FINISHED_C = '0') then --stop writting to the buffer process terminates
					NEXT_STATE <= "1100"; -- only reading data from the buffer	
				elsif (C_DATA_VALID = '0') then -- do not read or write
					NEXT_STATE <= "1010"; -- write to the buffer
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				DECODING_UNDERFLOW_INT <= '1';
				BUS_ACKNOWLEDGE_INT    <= '1';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '0';
			when others =>
				NEXT_STATE             <= "0000";
				BUS_ACKNOWLEDGE_INT    <= '0';
				DECODING_UNDERFLOW_INT <= '0';
				ENABLE_READ_INT        <= '0';
				ENABLE_WRITE_INT       <= '0';
				BUS_REQUEST_INT        <= '1';
				FINISH                 <= '1';
				CLEAR_COUNTERS         <= '1';

		end case;
	end process STATES;

	--DECODING_OVERFLOW_AUX <= '0' when ((DECODING_READ_ADDRESS(8 downto 1) = DECODING_WRITE_ADDRESS(8 downto 1) + "00000001") and (BUS_ACKNOWLEDGE_INT = '1')) else '1'; -- decoding overflow goes out of the chip is active with zero if bus_akcnowledge 1 then all the data is inside never generate overflow
	DECODING_OVERFLOW_AUX  <= '0' when (CURRENT_STATE(3) = '0' and (DECODING_WRITE_ADDRESS(9 downto 1) = "001000000") and (BUS_ACKNOWLEDGE_INT = '1')) else '1'; -- decoding overflow goes out of the chip is active with zero if bus_akcnowledge 1 then all the data is inside never generate overflow
	DECODING_UNDERFLOW_AUX <= '1' when ((DECODING_WRITE_ADDRESS(9 downto 1) = DECODING_READ_ADDRESS(9 downto 1)) and (BUS_ACKNOWLEDGE_INT = '1') and (UNDERFLOW = '0')) else '0'; --the engine must requests data. In this case engine could request data beucase it is detected one cycle earlier
	ENABLE_READ            <= ENABLE_READ_INT and not (DECODING_UNDERFLOW_AUX); -- if decoding underflow disable the read counter 
	ENABLE_WRITE           <= ENABLE_WRITE_INT and DECODING_OVERFLOW_AUX; -- if overflow disable writting inmediatly
	BUS_REQUEST            <= BUS_REQUEST_INT or not (DECODING_OVERFLOW_AUX);

	FLIP_FLOPS2 : process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			OVERFLOW_CONTROL_AUX <= '0'; --state 0
		elsif ((CLK'event) and (CLK = '1')) then
			if (FORCE_STOP = '0') then
				OVERFLOW_CONTROL_AUX <= '0'; --state 0
			elsif (CURRENT_STATE(3) = '1' and (DECODING_READ_ADDRESS = DECODING_WRITE_ADDRESS + "110000000")) then
				OVERFLOW_CONTROL_AUX <= '1';
			elsif (DECODING_WRITE_ADDRESS = DECODING_READ_ADDRESS + "000000010" and WAITN = '1') then -- buffer empty    
				OVERFLOW_CONTROL_AUX <= '0';
			else
				OVERFLOW_CONTROL_AUX <= OVERFLOW_CONTROL_AUX;
			end if;
		end if;

	end process FLIP_FLOPS2;

	OVERFLOW_CONTROL <= OVERFLOW_CONTROL_AUX;

	FLIP_FLOPS : process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			CURRENT_STATE <= "0000";    --state 0
		elsif ((CLK'event) and (CLK = '1')) then
			if (FORCE_STOP = '0') then
				CURRENT_STATE <= "0000";
			else
				CURRENT_STATE <= NEXT_STATE;
			end if;
		end if;

	end process FLIP_FLOPS;

	--DELAY_UNDERFLOW : process(CLK, CLEAR, DECODING_UNDERFLOW_DELAY)
	--begin 

	--if (CLEAR = '0') then
	--	DECODING_UNDERFLOW <= '0';
	--elsif ((CLK'event) and (CLK='1')) then
	--	DECODING_UNDERFLOW <= DECODING_UNDERFLOW_DELAY;
	--end if;
	--end process DELAY_UNDERFLOW;

	DECODING_UNDERFLOW <= DECODING_UNDERFLOW_AUX or DECODING_UNDERFLOW_INT; -- never signal underflow if bus_acknowledge has gone to 1 it means that all the compressed data has been fed to the buffer. It has to terminate

end STRUCTURAL;

