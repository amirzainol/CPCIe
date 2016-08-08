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
--  ENTITY       = C_BS_COUNTER        --
--  version      = 1.0                 --
--  last update  = 6/9/00              --
--  author       = Jose Nunez          --
----------------------------------------


-- FUNCTION
-- 16 bit counter to control the compressed block size


--  PIN LIST
--  LOAD = load compressed block size ( for decompression )
--  C_BS_IN = compressed block size external data ( for decompression )
--  ENABLE = enable count
--  CLEAR = asyncronus clear of the counter
--  CLK   = master clock
--  ALL_C_DATA = for decompression the value loaded has been reached
--  C_BS_OUT = compressed block size available after compression

library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.bit_arith.all;
use dzx.bit_utils.all; 


entity C_BS_COUNTER_D is
port
(
	C_BS_IN : in bit_vector(31 downto 0);
	DECOMPRESS : in bit;
    CLEAR_COUNTER : in bit;
	CLEAR : in bit;
	CLK : in bit;
	ENABLE_D : in bit;
	ALL_C_DATA : out bit;
	C_BS_OUT : out bit_vector(31 downto 0)
);

end C_BS_COUNTER_D;



architecture STRUCTURAL of C_BS_COUNTER_D is

signal COUNT_AUX : bit_vector(29 downto 0); -- bytes
signal LATCH_DATA : bit_vector(31 downto 0); -- tuples
signal DECOMPRESS_INT : bit;
signal ENABLE_DQ : bit;

begin

LATCH : process(CLK,CLEAR,DECOMPRESS)
begin
    	-- asynchronous RESET signal forces all outputs LOW
      if (CLEAR = '0') then
	    LATCH_DATA <= "11111111111111111111111111111111";
	    DECOMPRESS_INT <= '1';
	    -- check for +ve clock edge
	elsif ((CLK'event) and (CLK = '1')) then
	        if(CLEAR_COUNTER = '0') then
	  		        LATCH_DATA <= "11111111111111111111111111111111";
	                DECOMPRESS_INT <= '1';
	        elsif (DECOMPRESS = '0') then
				   LATCH_DATA <= C_BS_IN;
				   DECOMPRESS_INT <='0';
			else
				    DECOMPRESS_INT <=DECOMPRESS_INT;
				   LATCH_DATA <= LATCH_DATA;
			end if;
	end if;

end process LATCH;



COUNTING : process (CLK,CLEAR,ENABLE_DQ,DECOMPRESS_INT,CLEAR_COUNTER)

begin
    	-- asynchronous RESET signal forces all outputs LOW
      if (CLEAR = '0') then
	    COUNT_AUX <= "000000000000000000000000000000";
	    -- check for +ve clock edge
	  elsif ((CLK'event) and (CLK = '1')) then
			 if(CLEAR_COUNTER = '0') then
				COUNT_AUX <= "000000000000000000000000000000";
	      	 elsif ( ENABLE_DQ = '0' and DECOMPRESS_INT = '0') then
		   	       COUNT_AUX <= COUNT_AUX+"000000000000000000000000000001";
			 else
			       COUNT_AUX <= COUNT_AUX;
			 end if;
	 end if;
	 
end process COUNTING;

DELAY_ENABLE : process(CLK,CLEAR,ENABLE_D)
begin
    	-- asynchronous RESET signal forces all outputs LOW
      if (CLEAR = '0') then
		ENABLE_DQ <= '1';
	elsif ((CLK'event) and (CLK = '1')) then
		if(CLEAR_COUNTER = '0') then
			ENABLE_DQ <= '1';
		else
			ENABLE_DQ <= ENABLE_D;
		end if;
	end if;
end process DELAY_ENABLE;		

		

ALL_C_DATA <= '1' when COUNT_AUX & "00" = LATCH_DATA else '0';   
C_BS_OUT <= COUNT_AUX & "00"; -- bytes. always a multiple of 4 bytes.
 

end STRUCTURAL;

