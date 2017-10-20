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

--------------------------------------
--  ENTITY       = RLI_DR      --
--  version      = 1.0              --
--  last update  = 26/11/01          --
--  author       = Jose Nunez       --
--------------------------------------

-- FUNCTION
-- RLI decoding register

-- PIN LIST
-- MATCH_LOCATION_IN : the match location
-- MATCH_TYPE_IN : the match type
-- SEARCH_STRING_IN : we must pipeline the literal data
-- FLUSH_IN : flush signal from csm
-- MASK : mask information
-- COMP_IN : compression signal from csm
-- CLEAR : clear signal
-- CLK : clock signal
-- MATCH_LOCATION_OUT : the match location out
-- MATCH_TYPE_OUT : the match type out
-- SEARCH_STRING_OUT : the search string out
-- FLUSH_OUT : 
-- COMP_OUT :

library IEEE;
use IEEE.std_logic_1164.all;

entity RLI_DR is
	port(
		MATCH_LOC_IN      : in  std_logic_vector(3 downto 0);
		MATCH_TYPE_IN     : in  std_logic_vector(3 downto 0);
		FULL_HIT_IN       : in  std_logic;
		ENABLE            : in  std_logic;
		MASK_IN           : in  std_logic_vector(4 downto 0);
		SEARCH_STRING_IN  : in  std_logic_vector(31 downto 0);
		--		    INC_IN:in std_logic;
		CLEAR             : in  std_logic;
		RESET             : in  std_logic;
		CLK               : in  std_logic;
		MATCH_LOC_OUT     : out std_logic_vector(3 downto 0);
		MATCH_TYPE_OUT    : out std_logic_vector(3 downto 0);
		FULL_HIT_OUT      : out std_logic;
		MASK_OUT          : out std_logic_vector(4 downto 0);
		SEARCH_STRING_OUT : out std_logic_vector(31 downto 0)
	);

end RLI_DR;
architecture STRUCTURAL of RLI_DR is

	signal SEARCH_STRING_OUT_aux : std_logic_vector(31 downto 0);
	signal MATCH_LOC_OUT_aux     : std_logic_vector(3 downto 0);
	signal MATCH_TYPE_OUT_aux    : std_logic_vector(3 downto 0);
	signal MASK_AUX              : std_logic_vector(4 downto 0);

	signal FULL_HIT_OUT_aux : std_logic;
	-- signal INC_OUT_aux:std_logic;

begin

	process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			MATCH_LOC_OUT_aux     <= "0000";
			MATCH_TYPE_OUT_aux    <= "1111";
			SEARCH_STRING_OUT_aux <= x"00000000";
			FULL_HIT_OUT_aux      <= '1';
			MASK_AUX              <= "00000";
		elsif ((CLK'event) and (CLK = '1')) then
			if (RESET = '0') then
				MATCH_LOC_OUT_aux     <= "0000";
				MATCH_TYPE_OUT_aux    <= "1111";
				SEARCH_STRING_OUT_aux <= x"00000000";
				FULL_HIT_OUT_aux      <= '1';
				MASK_AUX              <= "00000";
			elsif (ENABLE = '0') then
				SEARCH_STRING_OUT_aux <= SEARCH_STRING_IN;
				MATCH_TYPE_OUT_aux    <= MATCH_TYPE_IN;
				MATCH_LOC_OUT_aux     <= MATCH_LOC_IN;
				FULL_HIT_OUT_aux      <= FULL_HIT_IN;
				MASK_AUX              <= MASK_IN;
			else
				SEARCH_STRING_OUT_aux <= SEARCH_STRING_OUT_aux;
				MATCH_TYPE_OUT_aux    <= MATCH_TYPE_OUT_aux;
				MATCH_LOC_OUT_aux     <= MATCH_LOC_OUT_aux;
				FULL_HIT_OUT_aux      <= FULL_HIT_OUT_aux;
				MASK_AUX              <= MASK_AUX;
			end if;
		end if;
	end process;

	SEARCH_STRING_OUT <= SEARCH_STRING_OUT_aux;
	MATCH_TYPE_OUT    <= MATCH_TYPE_OUT_aux;
	MATCH_LOC_OUT     <= MATCH_LOC_OUT_aux;
	FULL_HIT_OUT      <= FULL_HIT_OUT_aux;
	MASK_OUT          <= MASK_AUX;

end structural;

