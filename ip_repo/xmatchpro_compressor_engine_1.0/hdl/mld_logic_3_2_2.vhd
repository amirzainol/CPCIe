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

-------------------------------------
--  ENTITY       = MLD_LOGIC_3_2_2   --
--  version      = 1.0             --
--  last update  = 2/04/01          --
--  author       = Jose Nunez      --
-------------------------------------

-- FUNCTION
-- Match location decision logic.
-- This reads in the match types from each location in the CAM array
-- and decides which location provides the best hit in terms of the
-- minimum number of code bits output.
-- This is part 2 and solves the best match

--  PIN LIST
--  DOWN_PRIORITY_6/5/4/3/2/1 = these are the priorities that have been propagated
--  SAME_LENGTH = same length in data word and search word
--  MATCH_TYPE_A,B,C,D = It seems necessary to also pipeline the match_type
--  COLUMN_OR = the result of the or of each column
--  MATCH_LOC    = location of the best match.
--  MATCH_TYPE   = match type of the location with the best match.

library ieee, dzx;
use ieee.std_logic_1164.all;
use dzx.bit_utils.all;

entity MLD_LOGIC_3_2_2 is
	port(
		MASK            : in  std_logic_vector(4 downto 0);
		DOWN_PRIORITY_6 : in  std_logic_vector(15 downto 0);
		DOWN_PRIORITY_5 : in  std_logic_vector(15 downto 0);
		DOWN_PRIORITY_4 : in  std_logic_vector(15 downto 0);
		DOWN_PRIORITY_3 : in  std_logic_vector(15 downto 0);
		DOWN_PRIORITY_2 : in  std_logic_vector(15 downto 0);
		DOWN_PRIORITY_1 : in  std_logic_vector(15 downto 0);
		SAME_LENGTH_2   : in  std_logic_vector(15 downto 0);
		SAME_LENGTH_3   : in  std_logic_vector(15 downto 0);
		SAME_LENGTH_4   : in  std_logic_vector(15 downto 0);
		MATCH_TYPE_A    : in  std_logic_vector(15 downto 0);
		MATCH_TYPE_B    : in  std_logic_vector(15 downto 0);
		MATCH_TYPE_C    : in  std_logic_vector(15 downto 0);
		MATCH_TYPE_D    : in  std_logic_vector(15 downto 0);
		COLUMN_OR       : in  std_logic_vector(6 downto 1);
		MATCH_LOC       : out std_logic_vector(15 downto 0);
		MATCH_TYPE      : out std_logic_vector(3 downto 0)
	);

end MLD_LOGIC_3_2_2;

architecture DECIDE_3 of MLD_LOGIC_3_2_2 is

	-- a single drop down unit

	component MLD_DPROP
		port(
			DIN     : in  std_logic_vector(0 to 15);
			DOUT    : out std_logic_vector(0 to 15);
			FULL_OR : out std_logic
		);
	end component;

	type MTYPE_ARRAY is array (0 to 15) of std_logic_vector(3 downto 0);
	type PRI_ARRAY is array (0 to 15) of std_logic_vector(6 downto 1);
	type PRI_TRANS_ARRAY is array (6 downto 1) of std_logic_vector(0 to 15);

	signal SECOND_TRANS_PRI : PRI_TRANS_ARRAY;
	signal THIRD_TRANS_PRI  : PRI_TRANS_ARRAY;
	signal LOCATION         : std_logic_vector(15 downto 0);
	signal LOCATION_INT     : std_logic_vector(15 downto 0);
	signal LOCATION_INT_AUX : std_logic_vector(15 downto 0);
	signal SECOND_COLUMN_OR : std_logic_vector(6 downto 1);
	signal MATCH_TYPE_AUX   : std_logic_vector(3 downto 0);
	signal MATCH_TYPE_INT   : std_logic_vector(3 downto 0);
	signal FULL_MATCH_AUX_2 : std_logic;
	signal FULL_MATCH_AUX_3 : std_logic;
	signal FULL_MATCH_AUX_4 : std_logic;
	signal FULL_MATCH_INT   : std_logic;
	signal FULL_TUPLE       : std_logic_vector(15 downto 0);

	function Or_Bits(v : std_logic_Vector) return std_logic is
		variable ret : std_logic := '0';
	begin
		for j in v'range loop
			ret := ret or v(j);
		end loop;

		return ret;
	end Or_Bits;

	function Nor_Bits(v : std_logic_Vector) return std_logic is
	begin
		return (not Or_Bits(v));
	end Nor_Bits;

	function And_Bits(v : std_logic_Vector) return std_logic is
		variable ret : std_logic := '1';
	begin
		for j in v'range loop
			ret := ret and v(j);
		end loop;

		return ret;
	end And_Bits;

begin

	FULL_TUPLE <= x"FFFF" when MASK(1) = '1' else x"0000";

	-- MASK[1] tuple complete consider partial match

	SECOND_TRANS_PRI(6) <= DOWN_PRIORITY_6 and (FULL_TUPLE or SAME_LENGTH_4); -- the length must be the same to consider the match. Partial words can only generate full matches
	SECOND_TRANS_PRI(5) <= DOWN_PRIORITY_5 and (FULL_TUPLE or SAME_LENGTH_3);
	SECOND_TRANS_PRI(4) <= DOWN_PRIORITY_4;
	SECOND_TRANS_PRI(3) <= DOWN_PRIORITY_3;
	SECOND_TRANS_PRI(2) <= DOWN_PRIORITY_2 and (FULL_TUPLE or SAME_LENGTH_2);
	SECOND_TRANS_PRI(1) <= DOWN_PRIORITY_1;

	-- or generation logic
	SECOND_COLUMN_OR(6) <= COLUMN_OR(6);
	SECOND_COLUMN_OR(5) <= not (COLUMN_OR(6)) and COLUMN_OR(5);
	SECOND_COLUMN_OR(4) <= Nor_Bits(COLUMN_OR(6 downto 5)) and COLUMN_OR(4);
	SECOND_COLUMN_OR(3) <= Nor_Bits(COLUMN_OR(6 downto 4)) and COLUMN_OR(3);
	SECOND_COLUMN_OR(2) <= Nor_Bits(COLUMN_OR(6 downto 3)) and COLUMN_OR(2);
	SECOND_COLUMN_OR(1) <= Nor_Bits(COLUMN_OR(6 downto 2)) and COLUMN_OR(1);

	ACROSS_PROP : process(SECOND_COLUMN_OR, SECOND_TRANS_PRI)
	begin
		for I in 5 downto 1 loop
			for J in 0 to 15 loop
				THIRD_TRANS_PRI(I)(J) <= SECOND_TRANS_PRI(I)(J) and SECOND_COLUMN_OR(I);
			end loop;
		end loop;
		THIRD_TRANS_PRI(6) <= SECOND_TRANS_PRI(6);
	end process ACROSS_PROP;

	LOCATION_DECIDE : process(THIRD_TRANS_PRI)
	begin
		for I in 0 to 15 loop
			LOCATION(15 - I) <= (THIRD_TRANS_PRI(6)(I) or THIRD_TRANS_PRI(5)(I) or THIRD_TRANS_PRI(4)(I)) or (THIRD_TRANS_PRI(3)(I) or THIRD_TRANS_PRI(2)(I) or THIRD_TRANS_PRI(1)(I));
		end loop;
	end process LOCATION_DECIDE;

	DROP_DOWN : MLD_DPROP
		port map(DIN     => LOCATION,
		         DOUT    => LOCATION_INT,
		         FULL_OR => open);

	TRANSPOSE : process(LOCATION_INT)
	begin
		for I in 0 to 15 loop
			LOCATION_INT_AUX(15 - I) <= LOCATION_INT(I);
		end loop;
	end process;

	MUX : process(LOCATION_INT_AUX, MATCH_TYPE_A, MATCH_TYPE_B, MATCH_TYPE_C, MATCH_TYPE_D)
		variable MATCH_TYPE_A_TEMP : std_logic_vector(15 downto 0);
		variable MATCH_TYPE_B_TEMP : std_logic_vector(15 downto 0);
		variable MATCH_TYPE_C_TEMP : std_logic_vector(15 downto 0);
		variable MATCH_TYPE_D_TEMP : std_logic_vector(15 downto 0);

	begin
		for I in 0 to 15 loop
			MATCH_TYPE_A_TEMP(I) := MATCH_TYPE_A(I) or LOCATION_INT_AUX(I);
			MATCH_TYPE_B_TEMP(I) := MATCH_TYPE_B(I) or LOCATION_INT_AUX(I);
			MATCH_TYPE_C_TEMP(I) := MATCH_TYPE_C(I) or LOCATION_INT_AUX(I);
			MATCH_TYPE_D_TEMP(I) := MATCH_TYPE_D(I) or LOCATION_INT_AUX(I);

		end loop;

		MATCH_TYPE_AUX(3) <= And_Bits(MATCH_TYPE_A_TEMP);
		MATCH_TYPE_AUX(2) <= And_Bits(MATCH_TYPE_B_TEMP);
		MATCH_TYPE_AUX(1) <= And_Bits(MATCH_TYPE_C_TEMP);
		MATCH_TYPE_AUX(0) <= And_Bits(MATCH_TYPE_D_TEMP);

	end process MUX;

	-- active high same length

	FULL_MATCH_AUX_2 <= or_bits(SAME_LENGTH_2 and DOWN_PRIORITY_2);
	FULL_MATCH_AUX_3 <= or_bits(SAME_LENGTH_3 and DOWN_PRIORITY_5);
	FULL_MATCH_AUX_4 <= or_bits(SAME_LENGTH_4 and DOWN_PRIORITY_6);

	-- promote match type to total (15) when lengths are equal and inverted match type is 15,14 or 12;
	MATCH_TYPE_PROMOTION : process(MATCH_TYPE_AUX, FULL_MATCH_AUX_2, FULL_MATCH_AUX_3, FULL_MATCH_AUX_4)
	begin
		case MATCH_TYPE_AUX is
			when "0000" =>
				if FULL_MATCH_AUX_4 = '1' then
					MATCH_TYPE_INT <= "0000";
				else
					MATCH_TYPE_INT <= MATCH_TYPE_AUX;
				end if;
			when "0001" =>
				if FULL_MATCH_AUX_3 = '1' then
					MATCH_TYPE_INT <= "0000";
				else
					MATCH_TYPE_INT <= MATCH_TYPE_AUX;
				end if;
			when "0011" =>
				if FULL_MATCH_AUX_2 = '1' then
					MATCH_TYPE_INT <= "0000";
				else
					MATCH_TYPE_INT <= MATCH_TYPE_AUX;
				end if;
			when others =>
				MATCH_TYPE_INT <= MATCH_TYPE_AUX;
		end case;
	end process MATCH_TYPE_PROMOTION;

	FULL_MATCH_INT <= '0' when MATCH_TYPE_INT = "0000" else '1';

	MATCH_TYPE <= MATCH_TYPE_INT;
	MATCH_LOC  <= LOCATION_INT_AUX;

end DECIDE_3;

