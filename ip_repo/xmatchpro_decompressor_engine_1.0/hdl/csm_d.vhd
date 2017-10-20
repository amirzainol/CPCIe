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
--  ENTITY       = CSM         --
--  version      = 4.0         --
--  last update  = 20/04/00    --
--  author       = Jose Nunez --
---------------------------------

-- FUNCTION
-- control state machine.

--  PIN LIST
--  START        = indicates start of a compress or decompress operation
--  STOP         = forces the end of the current operation
--  COMPRESS     = selects compression mode
--  DECOMPRESS   = selects decompression mode
--  CLEAR        = asyncronous clear
--  END_OF_BLOCK = indicates that a complete block has been processed
--  FLUSH_END    = indicates end of flushing cycle during compression
--  CLK          = master clock
--  COMP         = indicates unit is compressing data
--  DECOMP       = indicates unit is decompressing data
--  FLUSH        = indicates unit is in a flush cycle during compression
--  FINISH       = end of current operation
--  LOAD_BS      = load block size for the current operation
--  INC_TC       = increment tuple counter
--  MOVE_ENABLE  = enable movement logic for the CAM array
--  CLEAR_INT    = asynchronously clear (or preset) all internal storage

library ieee;
use ieee.std_logic_1164.all;

entity CSM_D is
	port(
		START_C        : in  std_logic; -- start test mode
		START_D        : in  std_logic; -- load BS
		START_D_ENGINE : in  std_logic; -- start engine
		STOP           : in  std_logic;
		END_OF_BLOCK   : in  std_logic;
		CLK            : in  std_logic;
		CLEAR          : in  std_logic;
		DECOMP         : out std_logic;
		FINISH         : out std_logic;
		MOVE_ENABLE    : out std_logic;
		RESET          : out std_logic
	);

end CSM_D;

architecture STATE of CSM_D is

	--State S9 to delay the activation of the counter incrementation due to pipeline
	--Now State S6 111001001111 INC disable same as S9

	signal CURRENT_STATE : std_logic_vector(3 downto 0);
	signal NEXT_STATE    : std_logic_vector(3 downto 0);
	signal CLEAR_AUX     : std_logic;

begin

	COMBINATIONAL : process(CURRENT_STATE, START_C, START_D, START_D_ENGINE, STOP, END_OF_BLOCK)
	begin
		case CURRENT_STATE is
			-- state S0
			when "1110" =>
				if (((START_C = '0') or (START_D = '0'))) then
					NEXT_STATE <= "1111"; -- goto state S10 load the BS
				else
					NEXT_STATE <= CURRENT_STATE; -- remain in current state
				end if;

				-- I am going to set bits 1 and 3 to 1 to activate the count for decompressing later due to pipelining
				-- state S6
			when "1011" =>
				NEXT_STATE <= "1001";   -- goto state S7

				-- state S7
			when "1001" =>
				if ((END_OF_BLOCK = '0')) then
					NEXT_STATE <= "0110"; -- goto state S8
				else
					NEXT_STATE <= CURRENT_STATE; -- remain in current state
				end if;

				-- state S8
			when "0110" =>
				NEXT_STATE <= "1110";   -- goto state S0

				-- state S11 wait for the order to start decompression engine
			when "1111" =>
				if ((START_D_ENGINE = '0')) then
					NEXT_STATE <= "1011"; -- goto state S6 
				else
					NEXT_STATE <= CURRENT_STATE; -- remain in current state
				end if;

				-- anything else (illegal states)
			when others =>
				NEXT_STATE <= "1110";   -- goto state S0

		end case;

	end process COMBINATIONAL;

	FLIP_FLOPS : process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			CURRENT_STATE <= "1110";    -- reset state is S0
		elsif ((CLK'event) and (CLK = '1')) then
			if (STOP = '0') then
				CURRENT_STATE <= "1110"; -- reset state is S0
			else
				CURRENT_STATE <= NEXT_STATE; -- otherwise latch next state
			end if;
		end if;

	end process FLIP_FLOPS;

	-- assign outputs directly from state register (Moore machine with registered outputs)

	FINISH      <= CURRENT_STATE(3) and END_OF_BLOCK;
	DECOMP      <= CURRENT_STATE(2);
	MOVE_ENABLE <= CURRENT_STATE(1);
	RESET       <= CURRENT_STATE(0);

end STATE;                              -- end of architecture

