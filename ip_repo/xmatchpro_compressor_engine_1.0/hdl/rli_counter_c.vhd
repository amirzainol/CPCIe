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

----------------------------------------
--  ENTITY       = RLI_COUNTER        --
--  version      = 1.0                --
--  last update  = 22/11/99           --
--  author       = Jose Nunez         --
----------------------------------------

-- FUNCTION
-- 8 bit counter for the RLI process

--  PIN LIST
--  LOAD = load external data ( for decompression )
--  LOCATION_ZERO = run length at location zero
--  SAME_POSITION = to detect a full match at the same position
--  DATA = external data ( for decompression )
--  ENABLE = enable count if not enable then zero
--  CLEAR = asyncronus clear of the counter
--  CLK   = master clock
--  COUNT = count output
--  RL_DETECTED = run length internal detection

--library ieee,dzx;
--use ieee.std_logic_1164.all;
--use dzx.bit_arith.all;
--use dzx.bit_utils.all; 

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- updated by Mohd A. Zainol
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RLI_COUNTER_C is
	port(
		MOVE_ENABLE   : in  std_logic;
		ENABLE_C      : in  std_logic;
		LOCATION_ZERO : in  std_logic;
		SAME_POSITION : in  std_logic;
		CLEAR         : in  std_logic;
		RESET         : in  std_logic;
		CLK           : in  std_logic;
		COUNT         : out std_logic_vector(7 downto 0);
		RL_DETECTED   : out std_logic
	);

end RLI_COUNTER_C;

architecture STRUCTURAL of RLI_COUNTER_C is

	signal NEXT_COUNT    : std_logic_vector(7 downto 0);
	signal CURRENT_COUNT : std_logic_vector(7 downto 0);
	signal ENABLE_INT    : std_logic;
	signal COUNTER_RESET : std_logic;

begin

	ENABLE_INT <= ENABLE_C;

	STATES : process(MOVE_ENABLE, ENABLE_INT, SAME_POSITION, CURRENT_COUNT, COUNTER_RESET, LOCATION_ZERO)
	begin
		if (MOVE_ENABLE = '0') then
			case CURRENT_COUNT is
				when "00000000" =>
					if (ENABLE_INT = '1') then
						NEXT_COUNT <= "00000001";
					else
						NEXT_COUNT <= "00000000";
					end if;
				when "11111111" =>
					if (ENABLE_INT = '1') then
						NEXT_COUNT <= "00000001";
					else
						NEXT_COUNT <= "00000000";
					end if;
				when others =>
					if ((SAME_POSITION = '1' and COUNTER_RESET = '0') or (LOCATION_ZERO = '1')) then
						NEXT_COUNT <= CURRENT_COUNT + "00000001";
					elsif (ENABLE_INT = '1') then
						NEXT_COUNT <= "00000001";
					else
						NEXT_COUNT <= "00000000";
					end if;
			end case;
		else
			NEXT_COUNT <= CURRENT_COUNT; -- "00000000";
		end if;
	end process STATES;

	INCREASE_COUNT : process(LOCATION_ZERO, CURRENT_COUNT)
	begin
		if (LOCATION_ZERO = '0' and CURRENT_COUNT = "00000101") then
			COUNTER_RESET <= '1';
		else
			COUNTER_RESET <= '0';
		end if;
	end process INCREASE_COUNT;

	COUNTING : process(CLK, CLEAR)
	begin
		-- asynchronous RESET signal forces all outputs LOW
		if (CLEAR = '0') then
			CURRENT_COUNT <= "00000000";
			-- check for +ve clock edge
		elsif ((CLK'event) and (CLK = '1')) then
			if (RESET = '0') then
				CURRENT_COUNT <= "00000000";
			else
				CURRENT_COUNT <= NEXT_COUNT;
			end if;
		end if;

	end process COUNTING;

	RL_DETECTED <= '1' when CURRENT_COUNT > "00000001" else '0'; -- run length detection

	COUNT <= CURRENT_COUNT;

end STRUCTURAL;

