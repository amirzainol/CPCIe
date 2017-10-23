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
--  ENTITY       = INPUT_BUFFER_CU                --
--  version      = 1.0                             --
--  last update  = 31/5/01                        --
--  author       = Jose Nunez                      --
-----------------------------------------------------

-- FUNCTION
-- Control unit that controls the input buffer

--  PIN LIST
--  START : enable the buffer
--  STOP : The whole file has access the internal buffers
--  FINISHED : the block has been processed in the compressor engine 
--  BUS_ACKNOWLEDGE : the uncompressed bus in is granted
--  CODING_READ_ADDRESS : input buffer location that it is being read
--  CODING_WRITE_ADDRESS : input buffer location that it is being written
--  CLK : clock
--  CLEAR : clear
--  BUS_REQUEST : the input buffer is being requested
--  READY : buffer ready with data to be processed in the compression engine
--  FULL : Data cannot be written to the buffer
--  CLEAR_COUNTERS : counters are reset. Counters generate the addresses to the buffers
--  ENABLE_WRITE : enable writting to the buffer
--  ENABLE_READ : enable reading from the buffer

library ieee;
use ieee.std_logic_1164.all;
library dzx;
use dzx.bit_arith.all;
use dzx.bit_utils.all;

entity INPUT_BUFFER_CU is
	port(
		OVERFLOW_CONTROL     : in  std_logic; -- to control possible overflows in the decoding input buffer
		FORCE_STOP           : in  std_logic;
		START                : in  std_logic;
		STOP                 : in  std_logic;
		WAITN                : in  std_logic;
		BUS_ACKNOWLEDGE      : in  std_logic;
		CODING_READ_ADDRESS  : in  std_logic_vector(7 downto 0);
		CODING_WRITE_ADDRESS : in  std_logic_vector(7 downto 0);
		CLK                  : in  std_logic;
		CLEAR                : in  std_logic;
		BUS_REQUEST          : out std_logic;
		CLEAR_COUNTERS       : out std_logic;
		RESET_TOTAL_COUNTER  : out std_logic;
		ENABLE_PARSER        : out std_logic;
		ENABLE_READ          : out std_logic;
		ENABLE_WRITE         : out std_logic
	);
end INPUT_BUFFER_CU;

architecture STRUCTURAL of INPUT_BUFFER_CU is

	signal CURRENT_STATE    : std_logic_vector(3 downto 0);
	signal NEXT_STATE       : std_logic_vector(3 downto 0);
	signal FINISHED_AUX     : std_logic;
	signal ENABLE_READ_INT  : std_logic;
	signal ENABLE_WRITE_INT : std_logic;

begin

	STATES : process(START, STOP, CURRENT_STATE, FINISHED_AUX, CODING_READ_ADDRESS, CODING_WRITE_ADDRESS, BUS_ACKNOWLEDGE, WAITN, OVERFLOW_CONTROL)
	begin
		case CURRENT_STATE is
			when "0000" =>              -- state 0 buffer inactive
				if (START = '0') then
					NEXT_STATE <= "0001";
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				ENABLE_READ_INT     <= '0';
				ENABLE_WRITE_INT    <= '0';
				BUS_REQUEST         <= '1';
				CLEAR_COUNTERS      <= '1';
				RESET_TOTAL_COUNTER <= '1';

			when "0001" =>              -- state 1 request the bus
				if (BUS_ACKNOWLEDGE = '0') then -- bus ready with data
					NEXT_STATE <= "0010";
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				ENABLE_READ_INT     <= '0';
				ENABLE_WRITE_INT    <= '0';
				BUS_REQUEST         <= '0';
				CLEAR_COUNTERS      <= '1';
				RESET_TOTAL_COUNTER <= '0';

			when "0010" =>              -- start writting data to the input buffer. only writting
				if (WAITN = '1') then
					NEXT_STATE <= "0011"; -- only start reading when wait is inactive
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				ENABLE_READ_INT     <= '0';
				ENABLE_WRITE_INT    <= '1';
				BUS_REQUEST         <= '0';
				CLEAR_COUNTERS      <= '0';
				RESET_TOTAL_COUNTER <= '0';

			when "0011" =>              -- now writting and reading
				if (STOP = '1' and BUS_ACKNOWLEDGE = '0' and WAITN = '1') then -- the whole file has accessed the internal buffer
					NEXT_STATE <= "0101";
				elsif (FINISHED_AUX = '1') then -- this can happen under wait states
					NEXT_STATE <= "0010"; -- to write only
					-- elsif (CODING_WRITE_ADDRESS + "00000001" = CODING_READ_ADDRESS) then -- we have fill the buffer wait. About to overflow do not write more data
				elsif ((CODING_WRITE_ADDRESS >= "10000000" or OVERFLOW_CONTROL = '1') and BUS_ACKNOWLEDGE = '0' and WAITN = '1') then -- we have fill the buffer wait. About to overflow do not write more data
					NEXT_STATE <= "0100";
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;

				ENABLE_WRITE_INT    <= '1';
				ENABLE_READ_INT     <= '1';
				BUS_REQUEST         <= '0';
				CLEAR_COUNTERS      <= '0';
				RESET_TOTAL_COUNTER <= '0';

			when "0100" =>              -- waiting for engine to finish the block
				if (STOP = '1') then
					NEXT_STATE <= "0101";
				elsif (FINISHED_AUX = '1' and OVERFLOW_CONTROL = '0') then
					NEXT_STATE <= "0001"; --write new data to the bus 
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;

				ENABLE_WRITE_INT    <= '0';
				ENABLE_READ_INT     <= '1';
				BUS_REQUEST         <= '1';
				CLEAR_COUNTERS      <= '0';
				RESET_TOTAL_COUNTER <= '0';

			when "0101" =>              -- the whole file has acessed the buffers
				if (FINISHED_AUX = '1') then -- when the last block finishes it is over
					NEXT_STATE <= "0000"; --go to first state 
				else
					NEXT_STATE <= CURRENT_STATE;
				end if;
				ENABLE_WRITE_INT    <= '0';
				ENABLE_READ_INT     <= '1';
				BUS_REQUEST         <= '1';
				CLEAR_COUNTERS      <= '0';
				RESET_TOTAL_COUNTER <= '0';

			when others =>
				NEXT_STATE          <= "0000";
				ENABLE_READ_INT     <= '0';
				ENABLE_WRITE_INT    <= '0';
				BUS_REQUEST         <= '1';
				CLEAR_COUNTERS      <= '0';
				RESET_TOTAL_COUNTER <= '0';

		end case;
	end process STATES;

	FINISHED_AUX <= '1' when (CODING_WRITE_ADDRESS = CODING_READ_ADDRESS) else '0'; -- detect when all data has accessed the engine

	ENABLE_READ  <= ENABLE_READ_INT and not (FINISHED_AUX);
	ENABLE_WRITE <= ENABLE_WRITE_INT and not (STOP);

	PARSER_FF : process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			ENABLE_PARSER <= '0';       --state 0
		elsif ((CLK'event) and (CLK = '1')) then
			if (FINISHED_AUX = '1') then
				ENABLE_PARSER <= '0';
			else
				ENABLE_PARSER <= ENABLE_READ_INT; -- parser follows the memory read enable
			end if;
		end if;
	end process PARSER_FF;

	FLIP_FLOPS : process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			CURRENT_STATE <= "0000";    --state 0
		elsif ((CLK'event) and (CLK = '1')) then
			if (FORCE_STOP = '0') then
				CURRENT_STATE <= "0000"; --state 0
			else
				CURRENT_STATE <= NEXT_STATE;
			end if;
		end if;

	end process FLIP_FLOPS;

end STRUCTURAL;

