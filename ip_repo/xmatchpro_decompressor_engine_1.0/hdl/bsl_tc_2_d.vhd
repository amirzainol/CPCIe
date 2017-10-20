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
--  ENTITY       = BSL_TC_2      --
--  version      = 2.0         --
--  last update  = 22/05/00    --
--  author       = Jose Nunez  --
---------------------------------

--  FUNCTION
--  Latches the block size synchronously under the control of
--  the LOAD signal (active LOW). The 16 bit number indicates the number of
--  tuples in the block.

--  The tuple counter is fully synchronous and is incremented on each
--  clock cycle if INC signal is LOW.

--  When the tuple counter reaches the required number of tuples within
--  the block minus one, the END OF BLOCK signal is activated. The counter
--  then remains locked in this state until cleared or reset.

--  PIN LIST
--  BLOCK_SIZE	= input block size
--  LOAD	= load block size (active LOW)
--  INC         = increment tuple counter (active LOW)
--  CLEAR       = asynchronously clear the tuple counter (active LOW) and the block size
--  CLK		= clock
--  EO_BLOCK    = end of block signal (active LOW)

--  WARNING - dzx.bit_arith is an INTERGRAPH SPECIFIC LIBRARY
--            take note of this if porting to another system!
--            It is required to allow the addition of two bit
--            vectors in the process TUPLE_COUNTER.

library dzx;
use dzx.bit_arith.all;
use dzx.attributes.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BSL_TC_2_D is
	port(
		BLOCK_SIZE       : in  std_logic_vector(31 downto 0);
		INC              : in  std_logic;
		CLEAR            : in  std_logic;
		RESET            : in  std_logic;
		CLK              : in  std_logic;
		EO_BLOCK         : out std_logic;
		FINISH_D_BUFFERS : out std_logic
	);

end BSL_TC_2_D;

architecture COUNTER of BSL_TC_2_D is

	-- indicates end of block (active LOW), i.e tuple count is equal
	-- to decoded block size
	signal EOB : std_logic;

	-- indicates the number of tuples that have been processed
	signal TUPLE_COUNT : std_logic_vector(29 downto 0);

begin

	TUPLE_COUNTER : process(CLK, CLEAR)
	begin
		-- Since the increment is always with 4 bytes I use only 14 bit counter
		if (CLEAR = '0') then
			TUPLE_COUNT <= "000000000000000000000000000000";
		elsif ((CLK'event) and (CLK = '1')) then
			if (RESET = '0') then
				TUPLE_COUNT <= "000000000000000000000000000000";
			elsif ((INC = '1') and (EOB = '1')) then
				TUPLE_COUNT <= TUPLE_COUNT + "000000000000000000000000000001";
			end if;
		end if;
	end process TUPLE_COUNTER;

	END_OF_BLOCK : process(TUPLE_COUNT, BLOCK_SIZE)
	begin
		if ((TUPLE_COUNT & "00") >= BLOCK_SIZE) then
			EOB <= '0';
		else
			EOB <= '1';
		end if;
	end process END_OF_BLOCK;

	--  assign EOB to external EO_BLOCK signal			
	EO_BLOCK <= EOB;

	-- or not(INC);

	-- to stop the buffers when the last data has been read from them

	-- FINISH_D_BUFFERS <= '0' when (TUPLE_COUNT & "00" + "0000000000001100" = BS_LATCH) else '1'; 		

	FINISH_D_BUFFERS <= EOB;

end COUNTER;

