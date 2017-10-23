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
--  ENTITY       = SREG        --
--  version      = 1.0         --
--  last update  = 5/05/01    --
--  author       = Jose Nunez  --
---------------------------------

-- FUNCTION
-- 32 bit wide search register

--  PIN LIST
--  DIN   = 32 bit input data
--  MIN  = 5 bit mask data
--  CLEAR = asynchronous clear of register
--  CLK   = clock
--  QOUT  = 32 bit output of flip-flops
--  QMOUT  = 5 bit mask out

library ieee, dzx;
use ieee.std_logic_1164.all;

entity SREG is
	port(
		DIN      : in  std_logic_vector(31 downto 0);
		MASK_IN  : in  std_logic_vector(4 downto 0);
		CLEAR    : in  std_logic;
		CLK      : in  std_logic;
		MASK_OUT : out std_logic_vector(4 downto 0);
		QOUT     : out std_logic_vector(31 downto 0)
	);

end SREG;

architecture LATCH of SREG is
begin

	FLIP_FLOPS : process(CLK, CLEAR)
	begin
		-- asynchronous RESET signal forces all outputs LOW
		if (CLEAR = '0') then
			QOUT     <= x"00000000";
			MASK_OUT <= "00000";
			-- check for +ve clock edge
		elsif ((CLK'event) and (CLK = '1')) then
			-- check for synchronous clear signal
			QOUT     <= DIN;
			MASK_OUT <= MASK_IN;
		end if;
	end process FLIP_FLOPS;

end LATCH;

