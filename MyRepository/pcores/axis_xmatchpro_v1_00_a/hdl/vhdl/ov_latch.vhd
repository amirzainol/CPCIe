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
--  ENTITY       = OV_LATCH    --
--  version      = 1.0         --
--  last update  = 30/07/98    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- 1 bit latch for generation of overflow signals to memory address
-- generation logic and ob-assembler logic.


-- PIN LIST
-- OVERFLOW_LENGTH = indicates a length overflow (active LOW)
-- OVERFLOW_FLUSH  = indicates a flushing overflow (active LOW)
-- PRESET          = asynchronous setting of latch
-- CLK             = master clock
-- OVERFLOW_MEM    = overflow signal to memory address generation logic
-- OVERFLOW_OLD    = clocked version of OVERFLOW_LENGTH

entity OV_LATCH is
port
(
	OVERFLOW_LENGTH : in bit;
	OVERFLOW_FLUSH : in bit;
	CLEAR : in bit;
	RESET : in bit;
	CLK : in bit;
	OVERFLOW_MEM : out bit;
	OVERFLOW_OLD : out bit
);
end OV_LATCH;

architecture FLIP_FLOP of OV_LATCH is
signal TEMP_Q : bit;
begin

OVERFLOW_MEM <= TEMP_Q and OVERFLOW_FLUSH;
OVERFLOW_OLD <= TEMP_Q;

FLOP : process (CLK,CLEAR)
begin
if (CLEAR = '0') then
    TEMP_Q <= '1';
elsif ((CLK'event) and (CLK = '1')) then
    if (RESET = '0') then
    	TEMP_Q <= '1';
    else
    	TEMP_Q <= OVERFLOW_LENGTH;
    end if;
end if;
end process FLOP;

end FLIP_FLOP; -- end of architecture


