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
--  ENTITY       = OUT_REGISTER--
--  version      = 1.0         --
--  last update  = 21/08/00    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- out register


--  PIN LIST
--  DIN   = 32 bit input data

--  U_DATA_VALID_IN = the data is valid in the bus in 
--  CLEAR = asynchronous clear of register
--  CLK   = clock
--  DOUT  = 32 bit output of flip-flops

--  U_DATA_VALID_OUT = the data is valid in the bus out


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity OUT_REGISTER is
port
(
      DIN : in bit_vector(31 downto 0) ;
      U_DATA_VALID_IN : in bit;
	  FINISHED_IN : in bit;
      CLEAR : in bit ;
    	RESET : in bit;
      CLK : in bit ;
	 U_DATA_VALID_OUT : out bit;
	 FINISHED_OUT : out bit;
      QOUT : out bit_vector(31 downto 0) 
);


end OUT_REGISTER;



architecture LATCH of OUT_REGISTER is
begin

--FLIP_FLOPS : process (CLK,CLEAR)
--begin
    	-- asynchronous RESET signal forces all outputs LOW
--        if (CLEAR = '0') then
--	    QOUT <= x"00000000";
--	    U_DATA_VALID_OUT <= '1';
--		FINISHED_OUT <= '1';
	    -- check for +ve clock edge
--	  elsif ((CLK'event) and (CLK = '1')) then
 		      -- if (RESET = '0') then
			  --	    QOUT <= x"00000000";
	    	  --		U_DATA_VALID_OUT <= '1';
	    -- check for synchronous clear signal

	--	    elsif( FINISH = '0' or DECOMP = '1' ) then

	--	    	 QOUT <= x"00000000";

	--		  U_DATA_VALID_OUT <= '1';

	--	    else
--					FINISHED_OUT <= FINISHED_IN;
--	    	    	QOUT <= DIN;
--	    	    	U_DATA_VALID_OUT <= U_DATA_VALID_IN;
	--	    end if;

--	end if;
--end process FLIP_FLOPS;

FINISHED_OUT <= FINISHED_IN;
QOUT <= DIN;
U_DATA_VALID_OUT <= U_DATA_VALID_IN;


end LATCH;

