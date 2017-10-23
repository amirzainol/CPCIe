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

------------------------------------------
--  ENTITY       = CONTROL_REG_C                 --
--  version      = 1.0       		    --
--  last update  = 11/09/00    	    --
--  author       = Jose Nunez           --
------------------------------------------

-- FUNCTION
-- 16 bit wide control register

--  PIN LIST
--  DIN   = 16 bit input data
--  ENABLE = enable the load
--  CLEAR = asynchronous clear of register
--  CLK   = clock
--  DOUT  = 16 bit output of flip-flops

library ieee, dzx;
use ieee.std_logic_1164.all;

entity CONTROL_REG_C is
	port(
		DIN    : in  std_logic_vector(31 downto 0);
		ENABLE : in  std_logic;
		CLEAR  : in  std_logic;
		CLK    : in  std_logic;
		DOUT   : out std_logic_vector(31 downto 0)
	);
end CONTROL_REG_C;

architecture LATCH of CONTROL_REG_C is

	signal QOUT : std_logic_vector(31 downto 0);

begin

	FLIP_FLOPS : process(CLK, CLEAR)
	begin
		-- asynchronous RESET signal forces all outputs high
		if (CLEAR = '0') then
			QOUT <= x"FFFFFFFF";
			-- check for +ve clock edge
		elsif ((CLK'event) and (CLK = '1')) then
			if (ENABLE = '1') then
				QOUT <= DIN;
			else
				QOUT <= QOUT;
			end if;
		end if;
	end process FLIP_FLOPS;

	DOUT <= QOUT;

end LATCH;

