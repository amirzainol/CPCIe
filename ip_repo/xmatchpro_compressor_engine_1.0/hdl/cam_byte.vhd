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
--  ENTITY       = CAM_BYTE    --
--  version      = 1.0         --
--  last update  = 14/06/98    --
--  author       = Jose Nunez  --
---------------------------------

-- FUNCTION
-- single byte CAM element

--  PIN LIST
--  SEARCH   = input search data byte
--  PREVIOUS = data from the previous location in the array
--  MOVE     = movement control
--  CLEAR    = synchronous clear of the data latches (active LOW)
--  CLK      = master clock
--  DOUT     = output of the data latches
--  MATCH    = indicates a match between search byte and data byte (active LOW)

library ieee;
use ieee.std_logic_1164.all;

entity CAM_BYTE is
	port(
		SEARCH   : in  std_logic_vector(7 downto 0);
		PREVIOUS : in  std_logic_vector(7 downto 0);
		MOVE     : in  std_logic;
		CLEAR    : in  std_logic;
		RESET    : in  std_logic;
		CLK      : in  std_logic;
		DOUT     : out std_logic_vector(7 downto 0);
		MATCH    : out std_logic
	);
end CAM_BYTE;

-----------------------------------
--  entity       = CAM_BYTE      --
--  ARCHITECTURE = BIT1          --
--  version      = 1.0           --
--  last update  = 14/06/95      --
--  author       = Mark Gooch    --
-----------------------------------

architecture BYTE1 of CAM_BYTE is

	component CAM_BIT
		port(
			SEARCH   : in  std_logic;
			PREVIOUS : in  std_logic;
			MOVE     : in  std_logic;
			CLEAR    : in  std_logic;
			RESET    : in  std_logic;
			CLK      : in  std_logic;
			DOUT     : out std_logic;
			MATCH    : out std_logic
		);
	end component;

	signal MATCH_BITS : std_logic_vector(7 downto 0);

begin

	GEN_BYTE : for I in 0 to 7 generate
		BIT : CAM_BIT
			port map(SEARCH   => SEARCH(I),
			         PREVIOUS => PREVIOUS(I),
			         MOVE     => MOVE,
			         CLEAR    => CLEAR,
			         RESET    => RESET,
			         CLK      => CLK,
			         DOUT     => DOUT(I),
			         MATCH    => MATCH_BITS(I));
	end generate;

	MATCH <= MATCH_BITS(7) or MATCH_BITS(6) or MATCH_BITS(5) or MATCH_BITS(4) or MATCH_BITS(3) or MATCH_BITS(2) or MATCH_BITS(1) or MATCH_BITS(0);

end BYTE1;

