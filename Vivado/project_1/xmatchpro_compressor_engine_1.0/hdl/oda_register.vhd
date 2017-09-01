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
--  ENTITY       = ODA_REGISTER--
--  version      = 1.0         --
--  last update  = 19/09/99    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- register that creates the out of order adaptation mechanism

-- PIN MAP

-- MOVE_IN : current move vector
-- CONTROL : decides if the vector is loaded directly or one position down
-- CLK : clock signal
-- RESET : reset signal
-- MOVE_OUT : previous move vector

library IEEE;
use IEEE.std_logic_1164.all;

entity ODA_REGISTER is
port	(
			MOVE_IN : in std_logic_vector(15 downto 0);
			MASK_IN : in std_logic;
			CONTROL : in std_logic_vector(14 downto 0);
			ENABLE : in std_logic;
			CLK : in std_logic;
			CLEAR : in std_logic;
			RESET : in std_logic;
			MASK_OUT : out std_logic;
			MOVE_OUT : out std_logic_vector(15 downto 0)
		);
end ODA_REGISTER;

architecture STRUCTURAL of ODA_REGISTER is
 
component ODA_CELL_2 
port	(
			PREVIOUS : in std_logic;
			CONTROL : in std_logic;
			ACTUAL : in std_logic;
			CLK : in std_logic;
			CLEAR : in std_logic;
			RESET : in std_logic;
			MOVE_OUT : out std_logic
		);
end component;

signal zero : std_logic;
signal MOVE_OUT_AUX : std_logic_vector(15 downto 0);
signal MOVE_IN_AUX : std_logic_vector(15 downto 0);
signal CONTROL_AUX : std_logic_vector (14 downto 0);
signal MASK_OUT_AUX : std_logic;

begin

zero <='0';

PRI_DEC : for I in 15 downto 0 generate
	FIRST : if (I=15) generate
	CELL_1 : ODA_CELL_2
		port map( PREVIOUS => zero,
				  CONTROL => CONTROL_AUX(0),
   	    		  ACTUAL => MOVE_IN_AUX(15),
				  CLK => CLK,
				  CLEAR => CLEAR,
				  RESET => RESET,
				  MOVE_OUT => MOVE_OUT_AUX(15)
				  );
	 end generate;
	 REMAINING : if (I<15) generate
	 REST : ODA_CELL_2
		port map( PREVIOUS => MOVE_IN(I+1),
				  CONTROL => CONTROL_AUX(14-I),
   	    		  ACTUAL => MOVE_IN_AUX(I),
				  CLK => CLK,
				  CLEAR => CLEAR,
				  RESET => RESET,
				  MOVE_OUT => MOVE_OUT_AUX(I)
				  );
	 end generate;
end generate;


MASK_FF : process (CLK,CLEAR)
begin

if (CLEAR = '0') then
	MASK_OUT_AUX <= '0';	
elsif ((CLK'event) and (CLK = '1')) then
	if (RESET = '0') then
		MASK_OUT_AUX <= '0';
	elsif (ENABLE = '0') then
		MASK_OUT_AUX <= MASK_IN;
	else
		MASK_OUT_AUX <= MASK_OUT_AUX;		
	end if;
end if;

end process MASK_FF;

CONTROL_AUX <= CONTROL when ENABLE = '0' else "000000000000000";
MOVE_IN_AUX <= MOVE_IN when ENABLE = '0' else MOVE_OUT_AUX;
MOVE_OUT <= MOVE_OUT_AUX;
MASK_OUT <= MASK_OUT_AUX;


end STRUCTURAL;	
