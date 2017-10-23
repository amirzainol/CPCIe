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

---------------------------------------------
--  ENTITY       = PARSER                  --
--  version      = 1.0                     --
--  last update  = 30/05/00                --
--  author       = Jose Nunez              --
---------------------------------------------

-- FUNCTION
-- The parser is the core of the parsing unit

--  PIN LIST

--  DATA_IN    = data to be parse from the buffer
--  MASK = 4 bit indicatin how many bytes of the 32 are valid
--  DATA_OUT_32  = output data to the search register
--  MASK = to know the length of the tuple
--  SPACE_TUPLE = tuple formed only by spaces
--  CLEAR    = asynchronous clear
--  CLK      = master clock

--library ieee;
--use ieee.std_logic_1164.all;
--library dzx;
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

entity PARSER is
	port(
		DATA_IN     : in  std_logic_vector(55 downto 0);
		LENGTH_IN   : in  std_logic_vector(2 downto 0);
		ENABLE      : in  std_logic;    -- hold the state when the buffer is empty but still more data in the block
		FINISH      : in  std_logic;    -- last block is over
		DATA_SEARCH : out std_logic_vector(31 downto 0);
		DATA_OUT    : out std_logic_vector(55 downto 0);
		MASK        : out std_logic_vector(4 downto 0);
		LENGTH_OUT  : out std_logic_vector(2 downto 0)
	);
end PARSER;

architecture STRUCTURAL of PARSER is

	signal VECTOR_PARSER, NORMAL_MASK, SPACE_MASK, TEMP_MASK : std_logic_vector(3 downto 0);
	signal DATA_PARSER                                       : std_logic_vector(31 downto 0);
	signal SPACE                                             : std_logic;

	function Or_Bits(v : std_logic_Vector) return std_logic is
		variable ret : std_logic := '0';
	begin
		for j in v'range loop
			ret := ret or v(j);
		end loop;

		return ret;
	end Or_Bits;

begin

	DATA_PARSER <= DATA_IN(55 downto 24); -- parse only the more significant 4 bytes

	COMPARATOR : process(DATA_PARSER)
	begin
		for I in 3 downto 0 loop
			if DATA_PARSER(8*I + 7 downto 8*I) = "00100000" then -- comparing with 32
				VECTOR_PARSER(I) <= '1';
			else
				VECTOR_PARSER(I) <= '0';
			end if;
		end loop;
	end process COMPARATOR;

	NORMAL_WORD : process(VECTOR_PARSER)
		variable A_ROW, B_ROW : std_logic_vector(3 downto 0);

	begin
		for I in 0 to 1 loop
			A_ROW(2*I)     := VECTOR_PARSER(2*I) or VECTOR_PARSER(2*I + 1);
			A_ROW(2*I + 1) := VECTOR_PARSER(2*I + 1);
		end loop;

		for I in 0 to 1 loop
			B_ROW(I)     := A_ROW(I) or A_ROW(2);
			B_ROW(I + 2) := A_ROW(I + 2);
		end loop;

		NORMAL_MASK <= not ('0' & B_ROW(3 downto 1));

	end process NORMAL_WORD;

	SPACE_WORD : process(VECTOR_PARSER)
		variable A_ROW, B_ROW : std_logic_vector(3 downto 0);

	begin
		for I in 0 to 1 loop
			A_ROW(2*I)     := VECTOR_PARSER(2*I) and VECTOR_PARSER(2*I + 1);
			A_ROW(2*I + 1) := VECTOR_PARSER(2*I + 1);
		end loop;

		for I in 0 to 1 loop
			B_ROW(I)     := A_ROW(I) and A_ROW(2);
			B_ROW(I + 2) := A_ROW(I + 2);
		end loop;

		SPACE_MASK <= B_ROW;

	end process SPACE_WORD;

	MASK_GENERATION : process(SPACE_MASK, NORMAL_MASK, LENGTH_IN)
		variable INTERMEDIATE : std_logic_vector(3 downto 0);
		variable OR_LENGTH    : std_logic;

	begin
		OR_LENGTH := or_bits(LENGTH_IN);

		for I in 3 downto 0 loop
			INTERMEDIATE(I) := not (SPACE_MASK(3)) and NORMAL_MASK(I);
		end loop;

		if (OR_LENGTH = '1') then

			TEMP_MASK <= (INTERMEDIATE or SPACE_MASK);
		else
			TEMP_MASK <= "0000";

		end if;

	end process MASK_GENERATION;

	LENGTH_CALCULATION : process(TEMP_MASK, LENGTH_IN, ENABLE, FINISH)
		variable COM_LENGTH : std_logic_vector(2 downto 0);

	begin
		if (ENABLE = '1' or FINISH = '1') then
			case TEMP_MASK is
				when "1000" => COM_LENGTH := "001";
				when "1100" => COM_LENGTH := "010";
				when "1110" => COM_LENGTH := "011";
				when "1111" => COM_LENGTH := "100";
				when others => COM_LENGTH := "000";
			end case;
		else
			COM_LENGTH := "000";
		end if;

		if (LENGTH_IN > COM_LENGTH) then -- to handle the added artificial last byte
			LENGTH_OUT <= LENGTH_IN - COM_LENGTH;
		else
			LENGTH_OUT <= "000";
		end if;

	end process LENGTH_CALCULATION;

	-- space not present in tuple when space signal set to 1

	SPACE_EXTENSION : process(TEMP_MASK, DATA_PARSER)
	begin
		if (TEMP_MASK(0) = '1' and DATA_PARSER(7 downto 0) /= "00100000") then
			SPACE <= '1';
		else
			SPACE <= '0';
		end if;
	end process SPACE_EXTENSION;

	MASK <= TEMP_MASK & SPACE;

	SHIFT_OLD_DATA : process(TEMP_MASK, DATA_IN, ENABLE, FINISH)
	begin
		if (ENABLE = '1' or FINISH = '1') then
			case TEMP_MASK is
				when "1000" => DATA_OUT <= DATA_IN(47 downto 0) & "00000000";
				when "1100" => DATA_OUT <= DATA_IN(39 downto 0) & "0000000000000000";
				when "1110" => DATA_OUT <= DATA_IN(31 downto 0) & "000000000000000000000000";
				when "1111" => DATA_OUT <= DATA_IN(23 downto 0) & "00000000000000000000000000000000";
				when others => DATA_OUT <= "00000000000000000000000000000000000000000000000000000000";
			end case;
		else
			DATA_OUT <= DATA_IN;
		end if;
	end process SHIFT_OLD_DATA;

	DATA_SEARCH <= DATA_IN(55 downto 24);

end structural;

