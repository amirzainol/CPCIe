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

-----------------------------------
--  ENTITY       = ASSEMBLER     --
--  version      = 2.0           --
--  last update  = 6/06/01       --
--  author       = Jose Nunez    --
-----------------------------------

-- FUNCTION
-- assembler for the uncompressed data.

-- PIN LIST

-- DATA_IN      = uncompressed data from the engine
-- MASK			= 4 bit indicating which bytes are valid
-- WRITE_OLD    = write operation done shift out used data
-- DATA_OLD		= 56 bits of old data
-- LENGTH_OLD   = length of old data
-- WRITE_NEW    = write data to buffer
-- DATA_NEW     = 56 bits of new data
-- LENGTH_NEW   = length of new data

library dzx;
use dzx.bit_arith.all;
use dzx.bit_utils.all;
use dzx.attributes.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ASSEMBLER is
	port(
		ENABLE     : in  std_logic;
		DATA_IN    : in  std_logic_vector(31 downto 0);
		MASK_IN    : in  std_logic_vector(3 downto 0);
		DATA_OLD   : in  std_logic_vector(55 downto 0);
		LENGTH_OLD : in  std_logic_vector(2 downto 0); --only 7 bytes
		DATA_NEW   : out std_logic_vector(55 downto 0);
		LENGTH_NEW : out std_logic_vector(2 downto 0);
		WRITE      : out std_logic
	);

end ASSEMBLER;

architecture ASSEMBLE2 of ASSEMBLER is

begin

	CALCULATE_LENGTH : process(ENABLE, MASK_IN, LENGTH_OLD)
		variable TEMP_LENGTH : std_logic_vector(2 downto 0);

	begin
		TEMP_LENGTH := LENGTH_OLD;

		if (TEMP_LENGTH(2) = '1') then
			TEMP_LENGTH(2) := '0';
		end if;

		if (ENABLE = '0') then

			case MASK_IN is

				when "1000" =>
					TEMP_LENGTH := TEMP_LENGTH + "001";
				when "1100" =>
					TEMP_LENGTH := TEMP_LENGTH + "010";
				when "1110" =>
					TEMP_LENGTH := TEMP_LENGTH + "011";
				when "1111" =>
					TEMP_LENGTH := TEMP_LENGTH + "100";
				when others =>
					TEMP_LENGTH := TEMP_LENGTH;

			end case;
		else

			TEMP_LENGTH := TEMP_LENGTH;

		end if;

		WRITE      <= TEMP_LENGTH(2);
		LENGTH_NEW <= TEMP_LENGTH;

	end process CALCULATE_LENGTH;

	CONCATENATE_DATA : process(DATA_OLD, DATA_IN, LENGTH_OLD)
	begin
		case LENGTH_OLD is

			when "000"  => DATA_NEW <= DATA_IN & x"000000";
			when "001"  => DATA_NEW <= DATA_OLD(55 downto 48) & DATA_IN & x"0000";
			when "010"  => DATA_NEW <= DATA_OLD(55 downto 40) & DATA_IN & x"00";
			when "011"  => DATA_NEW <= DATA_OLD(55 downto 32) & DATA_IN;
			when "100"  => DATA_NEW <= DATA_IN & x"000000";
			when "101"  => DATA_NEW <= DATA_OLD(23 downto 16) & DATA_IN & x"0000";
			when "110"  => DATA_NEW <= DATA_OLD(23 downto 8) & DATA_IN & x"00";
			when "111"  => DATA_NEW <= DATA_OLD(23 downto 0) & DATA_IN;
			when others => null;
		end case;

	end process CONCATENATE_DATA;

end ASSEMBLE2;                          -- end of architecture

