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

----------------------------------------
--  ENTITY       = RLI_COUNTER        --
--  version      = 1.0                --
--  last update  = 22/11/99           --
--  author       = Jose Nunez         --
----------------------------------------


-- FUNCTION
-- 8 bit counter for the RLI process


--  PIN LIST
--  LOAD = load external data ( for decompression )
--  DATA = external data ( for decompression )
--  ENABLE = enable count if not enable then zero
--  CLEAR = asyncronus clear of the counter
--  CLK   = master clock
--  COUNT = count output
--  RL_DETECTED = run length internal detection

library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.bit_arith.all;
use dzx.bit_utils.all; 

entity RLI_COUNTER_D is
port (LOAD: in bit;
	  DATA: in bit_vector(7 downto 0);
	  ENABLE_D : in bit;
	  CLEAR : in bit;
	  RESET : in bit;
	  CLK : in bit;
	  END_COUNT : out bit
	  );

end RLI_COUNTER_D;

architecture STRUCTURAL of RLI_COUNTER_D is

signal COUNT_AUX : bit_vector(7 downto 0);
signal ENABLE_INT : bit;
signal LATCH_DATA : bit_vector(7 downto 0);

begin

ENABLE_INT <= ENABLE_D;

LATCH : process(CLK,CLEAR,LOAD)
begin
    	-- asynchronous RESET signal forces all outputs LOW
      if (CLEAR = '0') then
	    LATCH_DATA <= "00000000";
	    -- check for +ve clock edge
	elsif ((CLK'event) and (CLK = '1')) then
	     if (RESET = '0') then
	   			 LATCH_DATA <= "00000000";
	      elsif (LOAD = '1') then
				   LATCH_DATA <= DATA;
		   else 
				   LATCH_DATA <= LATCH_DATA;
			end if;
	end if;

end process LATCH;



COUNTING : process (CLK,CLEAR,ENABLE_INT)

begin
    	-- asynchronous RESET signal forces all outputs LOW
      if (CLEAR = '0') then
	    COUNT_AUX <= "00000000";
	    -- check for +ve clock edge
	  elsif ((CLK'event) and (CLK = '1')) then
	      		 if (RESET = '0') then
	    				COUNT_AUX <= "00000000";
	         	 elsif( ENABLE_INT = '1') then
	    	           COUNT_AUX <= COUNT_AUX+"00000001";
			  else
				    COUNT_AUX <= "00000000";
				end if;
	 end if;
	 
end process COUNTING;

  
END_COUNT <= '1' when COUNT_AUX = LATCH_DATA-"00000010" else '0';

end STRUCTURAL;

