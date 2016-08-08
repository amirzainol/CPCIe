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
--  ENTITY       = PARSER_REGISTER         --
--  version      = 1.0                     --
--  last update  = 3/05/01                 --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- The parser register latches data and length in the parsing unit

--  PIN LIST

--  ENABLE = parsing unit active
--  DATA_IN_32  = data to be parse from the buffer
--  DATA_OUT_32  = output data to the search register
--  CLEAR    = asynchronous clear
--  CLK      = master clock

library ieee;
use ieee.std_logic_1164.all;

entity PARSER_REGISTER is
port (
	  ENABLE_IN : in bit;
	  DATA_IN : in bit_vector(55 downto 0);
	  LENGTH_IN : in bit_vector(2 downto 0);
	  CLK : in bit;
	  CLEAR : in bit;
	  RESET : in bit;
	  ENABLE_OUT : out bit;
	  DATA_OUT : out bit_vector(55 downto 0);
	  LENGTH_OUT: out bit_vector(2 downto 0)
	 );
end PARSER_REGISTER;

architecture STRUCTURAL of PARSER_REGISTER is


signal DATA_OUT_aux:bit_vector(55 downto 0);
signal LENGTH_OUT_aux:bit_vector(2 downto 0);
signal ENABLE_OUT_aux : bit;


begin

process(CLK,CLEAR)
 begin
	if (CLEAR='0') then	
		ENABLE_OUT_aux <= '0';
		DATA_OUT_aux <= "00000000000000000000000000000000000000000000000000000000";
		LENGTH_OUT_aux <= "000";
	elsif ((CLK'event) and (CLK='1')) then
		if (RESET='0') then	
			DATA_OUT_aux <= "00000000000000000000000000000000000000000000000000000000";
			ENABLE_OUT_aux <= '0';
			LENGTH_OUT_aux <= "000";
		else
		      DATA_OUT_aux<= DATA_IN;
   	          ENABLE_OUT_aux <= ENABLE_IN;
	    		LENGTH_OUT_aux<= LENGTH_IN;
		end if;
	end if;
end process;

ENABLE_OUT <= ENABLE_OUT_aux;
DATA_OUT <= DATA_OUT_aux;
LENGTH_OUT <= LENGTH_OUT_aux;

end STRUCTURAL;
