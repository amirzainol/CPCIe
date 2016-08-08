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
--  ENTITY       = MAX_PBC_LENGTH          --
--  version      = 1.0                     --
--  last update  = 20/07/01                 --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- produces two possible start for the match type code depending on the PBC code

--  PIN LIST


--  NFL_MINUS_ONE = next free location minus one
--  CODE = all the bits that can contain match location plus match type code
--  POS_MT_K_1 = match type when using k-1 bits
--  POS_MT_K = match type when using k bits


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.bit_arith.all;

entity MAX_PBC_LENGTH_2 is
 
port (OR_VECTOR: in bit_vector(2 downto 0);
	  CODE : in bit_vector(14 downto 0); -- 4 ml and 6 mt or (3 mt + 8 rl ) = 15
	  POS_RL_K_1 : out bit_vector(7 downto 0);
	  POS_RL_K : out bit_vector(7 downto 0);
	  POS_ML_K_1 : out bit_vector(3 downto 0);
	  POS_ML_K : out bit_vector(3 downto 0);
   	  POS_MT_K_1 : out bit_vector(5 downto 0);
	  POS_MT_K : out bit_vector(5 downto 0)
	  );

end MAX_PBC_LENGTH_2;

architecture STRUCTURAL of MAX_PBC_LENGTH_2 is

begin


LENGTH_SELECTION : process(OR_VECTOR, CODE)

begin

case OR_VECTOR is
 when "000"  => 
    POS_RL_K_1 <= CODE(11 downto 4);
    POS_RL_K <= CODE(10 downto 3);
 	POS_ML_K_1 <= "0000"; 
	POS_ML_K <= "000" & CODE(14);
	POS_MT_K_1 <= CODE(14 downto 9);
	POS_MT_K <= CODE(13 downto 8);
when "001"  => 
    POS_RL_K_1 <= CODE(10 downto 3);
    POS_RL_K <= CODE(9 downto 2);
 	POS_ML_K_1 <= "000" & CODE(14); 
	POS_ML_K <= "00" & CODE(14 downto 13);
	POS_MT_K_1 <= CODE(13 downto 8);
	POS_MT_K <= CODE(12 downto 7);
when "011"  => 
    POS_RL_K_1 <= CODE(9 downto 2);
    POS_RL_K <= CODE(8 downto 1);
 	POS_ML_K_1 <= "00" & CODE(14 downto 13); 
	POS_ML_K <= "0" & CODE(14 downto 12);
	POS_MT_K_1 <= CODE(12 downto 7);
	POS_MT_K <= CODE(11 downto 6);
when "111"  => 
    POS_RL_K_1 <= CODE(8 downto 1);
    POS_RL_K <= CODE(7 downto 0);
 	POS_ML_K_1 <= "0" & CODE(14 downto 12); 
	POS_ML_K <=  CODE(14 downto 11);
	POS_MT_K_1 <= CODE(11 downto 6);
	POS_MT_K <= CODE(10 downto 5);
when others => 
    POS_RL_K_1 <= "00000000";
    POS_RL_K <= "00000000";
 	POS_ML_K_1 <= "0000"; 
	POS_ML_K <=  "0000";
	POS_MT_K_1 <= "000000";
	POS_MT_K <= "000000";
end case;

end process LENGTH_SELECTION;

end STRUCTURAL;
