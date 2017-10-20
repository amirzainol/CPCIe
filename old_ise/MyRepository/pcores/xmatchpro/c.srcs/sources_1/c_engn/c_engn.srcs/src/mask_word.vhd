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
--  ENTITY       = MASK_WORD    --
--  version      = 1.0         --
--  last update  = 3/05/01    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- 4 bit mask element of the CAM array.


--  PIN LIST
--  SEARCH    = input search mask word
--  PREVIOUS  = mask word from the previous location in the array
--  MOVE      = movement control
--  CLEAR     = asynchronous clear of the data latch (active LOW)
--  CLK       = master clock
--  DOUT      = output of the mask latch
--  MATCH     = indicates a match between search bit and mask bit (active LOW)


library ieee;
use ieee.std_logic_1164.all;
--library dzx;
--use dzx.bit_utils.all;
  
entity MASK_WORD is
port
(
	SEARCH : in std_logic_vector(3 downto 0);
	PREVIOUS : in std_logic_vector(3 downto 0);
	MOVE : in std_logic;
	CLEAR : in std_logic ;
	RESET : in std_logic;
	CLK : in std_logic ;
	DOUT : out std_logic_vector(3 downto 0);
	SAME_LENGTH_2 : out std_logic;
	SAME_LENGTH_3 : out std_logic;
	SAME_LENGTH_4 : out std_logic;
	MATCH : out std_logic_vector(3 downto 0)
);
end MASK_WORD;


architecture WORD1 of MASK_WORD is

component MASK_BIT
port
(
	SEARCH : in std_logic;
	PREVIOUS : in std_logic;
	MOVE : in std_logic;
	CLEAR : in std_logic;
    RESET : in std_logic;
	CLK : in std_logic ;
	DOUT : out std_logic;
	MATCH : out std_logic
);

end component;

signal MATCH_AUX : std_logic_vector(3 downto 0);

signal SAME_LENGTH_2_AUX : std_logic;

signal SAME_LENGTH_3_AUX : std_logic;

signal SAME_LENGTH_4_AUX : std_logic;

signal SAME_LENGTH_AUX : std_logic;

signal DOUT_AUX : std_logic_vector(3 downto 0);

  function Or_Bits (v: std_logic_vector) return std_logic is
    variable ret: std_logic := '0';
  begin
    for j in v'range loop
      ret := ret or v(j);
    end loop;

    return ret;
  end Or_Bits;

  function Nor_Bits (v: std_logic_vector) return std_logic is
  begin
    return (not Or_Bits(v));
  end Nor_Bits;
  
begin

M_WORD : for I in 3 downto 0 generate

	WORD_BIT: MASK_BIT
	port map
	(
		SEARCH =>SEARCH(I),
		PREVIOUS =>PREVIOUS(I),
		MOVE =>MOVE,
		CLEAR =>CLEAR,
   		 RESET =>RESET,
		CLK =>CLK,
		DOUT =>DOUT_AUX(I),
		MATCH =>MATCH_AUX(I)
	);

end generate;		

SAME_LENGTH_AUX <= nor_bits(SEARCH xor DOUT_AUX); -- same length detected
MATCH <= MATCH_AUX;



-- which length


SAME_LENGTH_2_AUX <= SEARCH(3) and SEARCH(2) and not(SEARCH(1)) and not(SEARCH(0));

SAME_LENGTH_3_AUX <= SEARCH(3) and SEARCH(2) and SEARCH(1) and not(SEARCH(0));

SAME_LENGTH_4_AUX <= SEARCH(3) and SEARCH(2) and SEARCH(1) and SEARCH(0);





SAME_LENGTH_2 <= SAME_LENGTH_AUX and SAME_LENGTH_2_AUX;

SAME_LENGTH_3 <= SAME_LENGTH_AUX and SAME_LENGTH_3_AUX;

SAME_LENGTH_4 <= SAME_LENGTH_AUX and SAME_LENGTH_4_AUX;


DOUT <= DOUT_AUX;

end WORD1;





