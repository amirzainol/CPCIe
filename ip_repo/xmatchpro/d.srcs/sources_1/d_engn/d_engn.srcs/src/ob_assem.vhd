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
--  ENTITY       = OB_ASSEM    --
--  version      = 1.0         --
--  last update  = 19/05/98    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- Assembles output tuples according to the 4 bit MATCH_TYPE
-- If bit N of MATCH_TYPE is LOW then byte A of CAM_DATA is
-- valid and should be output to byte A of DOUT, otherwise
-- byte A of LITERAL_DATA should be output to DOUT.
-- This is effectively 4 X (8 X 2-to-1 MUX).


-- PIN LIST
-- CAM_DATA     =  32 bit data from the CAM array
-- LITERAL_DATA =  32 bits of literal data
-- MATCH_TYPE   =  4 bit bus to indicate which BYTES of
--    	    	    CAM_DATA are valid
-- DOUT         =  output of 32 bits of valid data


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity OB_ASSEM is
port
(
      RAM_DATA : in std_logic_vector(31 downto 0) ;
	  RAM_MASK : in std_logic_vector(3 downto 0);
      LITERAL_DATA : in std_logic_vector(31 downto 0);
	  LITERAL_MASK : in std_logic_vector(4 downto 0);
      MATCH_TYPE : in std_logic_vector(3 downto 0) ;
	  MOUT : out std_logic_vector(3 downto 0);
      DOUT : out std_logic_vector(31 downto 0) 
);




end OB_ASSEM;


architecture ASSEMBLE of OB_ASSEM is

signal CAM_DATA : std_logic_vector(31 downto 0);
signal MISS_DATA : std_logic_vector(31 downto 0);

begin

CAM_DATA <= RAM_DATA;

MISS_ASSEMBLE : process(LITERAL_MASK, LITERAL_DATA)
begin

case LITERAL_MASK is

 when "10000" => MISS_DATA <= x"20000000";
 when "11000" => MISS_DATA <= LITERAL_DATA(31 downto 24) & x"200000";
 when "11100" => MISS_DATA <= LITERAL_DATA(31 downto 24) & LITERAL_DATA(23 downto 16) & x"2000";
 when "11110" => MISS_DATA <= LITERAL_DATA(31 downto 24) & LITERAL_DATA(23 downto 16) & LITERAL_DATA(15 downto 8) & x"20";
 when "11111" => MISS_DATA <= LITERAL_DATA(31 downto 24) & LITERAL_DATA(23 downto 16) & LITERAL_DATA(15 downto 8) & LITERAL_DATA(7 downto 0);
 when others => MISS_DATA <= x"00000000";

end case;

end process MISS_ASSEMBLE;


DECIDE : process (CAM_DATA , RAM_MASK, LITERAL_DATA , MATCH_TYPE, MISS_DATA, LITERAL_MASK)

begin

case MATCH_TYPE is
	when "0000" =>	DOUT(31 downto 24) <= CAM_DATA(31 downto 24);
			DOUT(23 downto 16) <= CAM_DATA(23 downto 16);
			DOUT(15 downto 8)  <= CAM_DATA(15 downto 8);
			DOUT(7 downto 0)   <= CAM_DATA(7 downto 0);
			MOUT <= RAM_MASK;

	when "0001" =>	DOUT(31 downto 24) <= CAM_DATA(31 downto 24);
			DOUT(23 downto 16) <= CAM_DATA(23 downto 16);
			DOUT(15 downto 8)  <= CAM_DATA(15 downto 8);
			DOUT(7 downto 0)   <= LITERAL_DATA(31 downto 24);
 			MOUT <= "1111";

	when "0010" =>	DOUT(31 downto 24) <= CAM_DATA(31 downto 24);
			DOUT(23 downto 16) <= CAM_DATA(23 downto 16);
			DOUT(15 downto 8)  <= LITERAL_DATA(31 downto 24);
			DOUT(7 downto 0)   <= CAM_DATA(7 downto 0);
 			MOUT <= "1111";

	when "0011" =>	DOUT(31 downto 24) <= CAM_DATA(31 downto 24);
			DOUT(23 downto 16) <= CAM_DATA(23 downto 16);
			DOUT(15 downto 8)  <= LITERAL_DATA(31 downto 24);
			DOUT(7 downto 0)   <= LITERAL_DATA(23 downto 16);
  			MOUT <= "1111";

	when "0100" =>	DOUT(31 downto 24) <= CAM_DATA(31 downto 24);
			DOUT(23 downto 16) <= LITERAL_DATA(31 downto 24);
			DOUT(15 downto 8)  <= CAM_DATA(15 downto 8);
			DOUT(7 downto 0)   <= CAM_DATA(7 downto 0);
  			MOUT <= "1111";

	when "0110" =>	DOUT(31 downto 24) <= CAM_DATA(31 downto 24);
			DOUT(23 downto 16) <= LITERAL_DATA(31 downto 24);
			DOUT(15 downto 8)  <= LITERAL_DATA(23 downto 16);
			DOUT(7 downto 0)   <= CAM_DATA(7 downto 0);
   			MOUT <= "1111";

	when "1000" =>	DOUT(31 downto 24) <= LITERAL_DATA(31 downto 24);
			DOUT(23 downto 16) <= CAM_DATA(23 downto 16);
			DOUT(15 downto 8)  <= CAM_DATA(15 downto 8);
			DOUT(7 downto 0)   <= CAM_DATA(7 downto 0);
   			MOUT <= "1111";

	when "1001" =>	DOUT(31 downto 24) <= LITERAL_DATA(31 downto 24);
			DOUT(23 downto 16) <= CAM_DATA(23 downto 16);
			DOUT(15 downto 8)  <= CAM_DATA(15 downto 8);
			DOUT(7 downto 0)   <= LITERAL_DATA(23 downto 16);
	 		MOUT <= "1111";

	when "1100" =>	DOUT(31 downto 24) <= LITERAL_DATA(31 downto 24);
			DOUT(23 downto 16) <= LITERAL_DATA(23 downto 16);
			DOUT(15 downto 8)  <= CAM_DATA(15 downto 8);
			DOUT(7 downto 0)   <= CAM_DATA(7 downto 0);
	 		MOUT <= "1111";
	
 	when "1111" =>	DOUT(31 downto 24) <= MISS_DATA(31 downto 24);
			DOUT(23 downto 16) <= MISS_DATA(23 downto 16);
			DOUT(15 downto 8)  <= MISS_DATA(15 downto 8);
			DOUT(7 downto 0)   <= MISS_DATA(7 downto 0);
    		MOUT <= LITERAL_MASK(4 downto 1);
  
	when others => DOUT(31 downto 24) <= "00000000";
			DOUT(23 downto 16) <= "00000000";
			DOUT(15 downto 8)  <= "00000000";
			DOUT(7 downto 0)   <= "00000000";
    		MOUT <= "0000";

end case;


end process DECIDE;

end ASSEMBLE;


