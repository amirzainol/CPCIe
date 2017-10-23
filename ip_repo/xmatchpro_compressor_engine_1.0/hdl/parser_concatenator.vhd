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
--  ENTITY       = PARSER_CONCATENATOR     --
--  version      = 1.0                     --
--  last update  = 30/05/00                --
--  author       = Jose Nunez              --
---------------------------------------------

-- FUNCTION
-- The parser concatenator adds more data when required

--  PIN LIST

--  DATA_IN_BUFFER  = 32 bits of data comming from the buffer
--  DATA_OLD = old data
--  LENGTH_OLD = old length
--  DATA_NEW = new data negerated
--  LENGTH_OUT = new length generated 

library ieee;
use ieee.std_logic_1164.all;

entity PARSER_CONCATENATOR is
	port(
		DATA_IN_BUFFER : in  std_logic_vector(31 downto 0);
		ENABLE         : in  std_logic;
		READ           : in  std_logic;
		DATA_OLD       : in  std_logic_vector(55 downto 0);
		LENGTH_OLD     : in  std_logic_vector(2 downto 0);
		DATA_NEW       : out std_logic_vector(55 downto 0);
		LENGTH_NEW     : out std_logic_vector(2 downto 0)
	);
end PARSER_CONCATENATOR;

architecture STRUCTURAL of PARSER_CONCATENATOR is

begin

	LENGTH_CALC : process(LENGTH_OLD, ENABLE, READ)
	begin
		if (ENABLE = '1' and READ = '1') then
			case LENGTH_OLD is
				when "011"  => LENGTH_NEW <= "111";
				when "010"  => LENGTH_NEW <= "110";
				when "001"  => LENGTH_NEW <= "101";
				when "000"  => LENGTH_NEW <= "100";
				when others => LENGTH_NEW <= LENGTH_OLD;
			end case;
		else
			LENGTH_NEW <= LENGTH_OLD;
		end if;

	end process LENGTH_CALC;

	CODE_CALC : process(LENGTH_OLD, DATA_IN_BUFFER, DATA_OLD)
	begin
		case LENGTH_OLD is
			when "000"  => DATA_NEW(55 downto 0) <= DATA_IN_BUFFER & "000000000000000000000000";
			when "001"  => DATA_NEW(55 downto 0) <= DATA_OLD(55 downto 48) & DATA_IN_BUFFER & "0000000000000000";
			when "010"  => DATA_NEW(55 downto 0) <= DATA_OLD(55 downto 40) & DATA_IN_BUFFER & "00000000";
			when "011"  => DATA_NEW(55 downto 0) <= DATA_OLD(55 downto 32) & DATA_IN_BUFFER;
			when others => DATA_NEW(55 downto 0) <= DATA_OLD(55 downto 0);
		end case;

	end process CODE_CALC;

end STRUCTURAL;
