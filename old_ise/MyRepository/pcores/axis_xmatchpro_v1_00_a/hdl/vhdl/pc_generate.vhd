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
--  ENTITY       = PC_GENERATE   --
--  version      = 2.0           --
--  last update  = 3/8/99        --
--  author       = Jose Nunez    --
-----------------------------------


-- FUNCTION
-- generate the phased binary code for a given location ond table size (next free location)


-- PIN LIST
-- NFL_M_ONE  = next free location minus one in the dictionary
-- MATCH_LOC  = match location
-- MISS       = indicates that a miss occurred (active low), i.e MATCH_LOC is invalid
-- TABLE_FULL = signal to indicate that the table is full (active LOW)
-- CODE       = output phased binary code
-- LENGTH     = length of the output code


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.bit_arith.all;
use dzx.bit_utils.all;


entity PC_GENERATE is
port
(
    NFL_M_ONE : in bit_vector(3 downto 0);
	MATCH_LOC : in bit_vector(3 downto 0);
	MISS : in bit;
	TABLE_FULL : in bit;
	CODE : out bit_vector(4 downto 0);
	LENGTH : out bit_vector(2 downto 0)
);

end PC_GENERATE;


architecture PHASED2 of PC_GENERATE is



signal K : bit_vector(3 downto 0);

signal K_MINUS_ONE : bit_vector(3 downto 0);

signal TWO_K_M_ROW : bit_vector(3 downto 0);

signal LESS_THAN : bit;

signal CODE_A : bit_vector(3 downto 0);

signal CODE_B : bit_vector(3 downto 0);

signal CODE_Y : bit_vector(3 downto 0);

signal CODE_SHIFTED : bit_vector(3 downto 0);


signal LENGTH_A : bit_vector(2 downto 0);

signal LENGTH_B : bit_vector(2 downto 0);

signal LENGTH_Y : bit_vector(2 downto 0);


signal SUM : bit_vector(3 downto 0);


begin


OR_TREE : process(NFL_M_ONE)

variable TEMP_K : bit_vector(3 downto 0);

begin

TEMP_K := "0000";



for I in 3 downto 0 loop

    for J in 3 downto I loop

    	TEMP_K(I) := TEMP_K(I) or NFL_M_ONE(J);

    end loop;

end loop;

K <= TEMP_K;

K_MINUS_ONE <= '0' & TEMP_K(3 downto 1);

end process OR_TREE;









COMPARE : process (TWO_K_M_ROW , MATCH_LOC)

begin

if (MATCH_LOC < TWO_K_M_ROW) then

    LESS_THAN <= '0';

else

    LESS_THAN <= '1';

end if;

end process COMPARE;





CONVA : process(K_MINUS_ONE)

begin

case K_MINUS_ONE  is

    when "1111" => LENGTH_A <= "101";

    when "0111" => LENGTH_A <= "100";

    when "0011" => LENGTH_A <= "011";

    when "0001" => LENGTH_A <= "010";

    when "0000" => LENGTH_A <= "001";

    when others    => LENGTH_A <= "000";

end case;

end process CONVA;





CONVB : process(K)

begin

case K  is

    when "1111" => LENGTH_B <= "101";

	when "0111" => LENGTH_B <= "100";
  
 	when "0011" => LENGTH_B <= "011";

    when "0001" => LENGTH_B <= "010";

    when "0000" => LENGTH_B <= "001";

    when others    => LENGTH_B <= "000";

end case;

end process CONVB;


MUXES_ONE : process ( LESS_THAN , TABLE_FULL , CODE_A , CODE_B , LENGTH_A , LENGTH_B, MATCH_LOC )

begin

if (TABLE_FULL = '0') then

	CODE_Y <= MATCH_LOC;

	LENGTH_Y <= "101";

else

	if (LESS_THAN = '0') then

		CODE_Y <= CODE_A;

		LENGTH_Y <= LENGTH_A;

	else

		CODE_Y <= CODE_B;

		LENGTH_Y <= LENGTH_B;

	end if;

end if;

end process MUXES_ONE;


MUXES_TWO : process ( MISS , CODE_SHIFTED , LENGTH_Y )

begin

if (MISS = '1') then

    CODE <= '1' & "0000";

    LENGTH <= "001";

else

    CODE <= '0' & CODE_SHIFTED;

    LENGTH <= LENGTH_Y;

end if;

end process MUXES_TWO;


SHIFT_CODE : process ( CODE_Y , LENGTH_Y)

begin

case LENGTH_Y is

    when "001" => CODE_SHIFTED <= "0000";

    when "010" => CODE_SHIFTED <= CODE_Y(0) & "000";

    when "011" => CODE_SHIFTED <= CODE_Y(1 downto 0) & "00";

    when "100" => CODE_SHIFTED <= CODE_Y(2 downto 0) & "0";

    when "101" => CODE_SHIFTED <= CODE_Y(3 downto 0);
			
    when others => CODE_SHIFTED <= "0000";

end case;

end process SHIFT_CODE;


TWO_K_M_ROW <= K and not(NFL_M_ONE);



SUM <= TWO_K_M_ROW + MATCH_LOC;




CODE_A <= MATCH_LOC and K_MINUS_ONE;


CODE_B <= SUM and K;



end PHASED2; -- end of architecture






