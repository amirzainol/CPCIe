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
--  ENTITY       = ASSEMBLER_REGISTER         --
--  version      = 1.0                     --
--  last update  = 3/05/01                 --
--  author       = Jose Nunez              --
---------------------------------------------

-- FUNCTION
-- The assembler register latches data and length in the assembling unit

--  PIN LIST

--  RESET = assembling unit active
--  WRITE_IN = 
--  DATA_IN  = data to from the assembler
--  LENGTH_IN
--  DATA_OUT  = output data to the search register
--  LENGTH_OUT
--  WRITE_OUT  = write input to the buffer
--  CLEAR    = asynchronous clear
--  CLK      = master clock

library ieee;
use ieee.std_logic_1164.all;

entity ASSEMBLER_REGISTER is
	port(
		WRITE_IN   : in  std_logic;
		DATA_IN    : in  std_logic_vector(55 downto 0);
		LENGTH_IN  : in  std_logic_vector(2 downto 0);
		CLK        : in  std_logic;
		CLEAR      : in  std_logic;
		RESET      : in  std_logic;
		ENABLE     : in  std_logic;
		WRITE_OUT  : out std_logic;
		DATA_OUT   : out std_logic_vector(55 downto 0);
		LENGTH_OUT : out std_logic_vector(2 downto 0)
	);
end ASSEMBLER_REGISTER;

architecture STRUCTURAL of ASSEMBLER_REGISTER is

	signal DATA_OUT_aux   : std_logic_vector(55 downto 0);
	signal LENGTH_OUT_aux : std_logic_vector(2 downto 0);
	signal WRITE_OUT_aux  : std_logic;

begin

	process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			DATA_OUT_aux   <= "00000000000000000000000000000000000000000000000000000000";
			LENGTH_OUT_aux <= "000";
			WRITE_OUT_aux  <= '0';
		elsif ((CLK'event) and (CLK = '1')) then
			if (RESET = '0') then
				DATA_OUT_aux   <= "00000000000000000000000000000000000000000000000000000000";
				LENGTH_OUT_aux <= "000";
				WRITE_OUT_aux  <= '0';
			else
				DATA_OUT_aux   <= DATA_IN;
				LENGTH_OUT_aux <= LENGTH_IN;
				WRITE_OUT_aux  <= WRITE_IN;
				--	else
				--	      DATA_OUT_aux<= DATA_OUT_aux;
				--        LENGTH_OUT_aux<= LENGTH_OUT_aux;
				--	  WRITE_OUT_aux<= WRITE_OUT_aux;
			end if;
		end if;
	end process;

	DATA_OUT   <= DATA_OUT_aux;
	LENGTH_OUT <= LENGTH_OUT_aux;
	WRITE_OUT  <= WRITE_OUT_aux;

end STRUCTURAL;
