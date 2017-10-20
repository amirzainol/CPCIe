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

entity CSM_C_2 is
port
(
	START_C : in std_logic ; -- load BS and start engine => the buffer is ready
	STOP_C : in std_logic; -- stop engine when parser finish
	FINISH_BUFFER : in std_logic; -- data exhausted from buffer almost finish wait for parser
	STOP : in std_logic ;
	FLUSH_END : in std_logic ;
	CLK : in std_logic ;
	CLEAR : in std_logic ;
	COMP : out std_logic ;
	FLUSH : out std_logic ;
	MOVE_ENABLE : out std_logic ;
	RESET : out std_logic 
);


end CSM_C_2;

architecture STATE of CSM_C_2 is



--State S9 to delay the activation of the counter incrementation due to pipeline
--Now State S6 111001001111 INC disable same as S9

signal CURRENT_STATE : std_logic_vector(4 downto 0);
signal NEXT_STATE : std_logic_vector(4 downto 0);
signal CLEAR_AUX : std_logic;


begin



COMBINATIONAL : process (CURRENT_STATE , START_C , STOP_C, STOP , FLUSH_END, FINISH_BUFFER)
begin

case CURRENT_STATE is
	-- state S0
	when "01110" =>
		if (START_C = '1') then
			NEXT_STATE <= "00101";	-- goto state S2
		else
				NEXT_STATE <= CURRENT_STATE;	-- remain in current state
		
		end if;

	-- state S1
--	when "1111" =>
--	    if (STOP = '0') then
--			NEXT_STATE <= "1110";	-- goto state S0
--		elsif (START_C = '1') then
--			NEXT_STATE <= "0101";
--		else 
--			NEXT_STATE <= CURRENT_STATE;	-- goto state S2
--		end if;

	-- state S2
	when "00101" =>
	   if (START_C = '0' and FINISH_BUFFER = '0') then -- --FINISG_BUFER indicates that all data has been read from buffer wait only for PARSER to finish
			NEXT_STATE <= "00111"; --wait
 	    elsif (STOP_C = '1') then -- block is completely finish
			NEXT_STATE <= "00011";	-- goto state S3 flush
		else
			NEXT_STATE <= CURRENT_STATE;	-- remain in current state
		end if;

	-- state S3 flushing
	when "00011" =>
     if (START_C = '1') then
			NEXT_STATE <= "00101";
		elsif (STOP_C = '1') then
			NEXT_STATE <= "10011";
		elsif (FLUSH_END = '0') then
			NEXT_STATE <= "01110";
		else
			NEXT_STATE <= CURRENT_STATE;	-- remain in current state
		end if;
--		if (FLUSH_END = '1') then
--			NEXT_STATE <= "00111";	-- goto state S4
--		else
--			NEXT_STATE <= CURRENT_STATE;	-- goto state S5
--		end if;

	-- state S4
 	when "00111" =>
		if (START_C = '1') then
			NEXT_STATE <= "00101";
		elsif (STOP_C = '1') then
			NEXT_STATE <= "10011";
		elsif (FLUSH_END = '0') then
			NEXT_STATE <= "01110";
		else
			NEXT_STATE <= CURRENT_STATE;	-- remain in current state
		end if;

	when "10011" =>
	  if (FLUSH_END = '1') then
			NEXT_STATE <= "10111";	-- goto state S4
		else
			NEXT_STATE <= CURRENT_STATE;	-- goto state S5
     end if;

	-- state S4
	when "10111" =>
	  if (FLUSH_END = '0') then
			NEXT_STATE <= "01110";
		else
			NEXT_STATE <= CURRENT_STATE;	-- remain in current state
		end if;			
	
	-- anything else (illegal states)
	when others =>
		NEXT_STATE <= "01110";	-- goto state S0

	

end case;


end process COMBINATIONAL;



FLIP_FLOPS : process(CLK,CLEAR)

begin

if (CLEAR = '0') then
	CURRENT_STATE <= "01110";	-- reset state is S0
elsif ((CLK'event) and (CLK='1')) then 
	if (STOP = '0') then -- force stop
	     CURRENT_STATE <= "01110";
	else
			CURRENT_STATE <= NEXT_STATE;		-- otherwise latch next state
	end if;
end if;

end process FLIP_FLOPS;

-- assign outputs directly from state register (Moore machine with registered outputs)


COMP <= CURRENT_STATE(3);
FLUSH <= CURRENT_STATE(2);
MOVE_ENABLE <= CURRENT_STATE(1);
RESET <= CURRENT_STATE(0);

end STATE;  -- end of architecture



