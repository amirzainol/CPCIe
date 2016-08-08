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


entity C_BS_COUNTER_C is
port
(
	COMPRESS : in bit;
      CLEAR_COUNTER : in bit;
	CLEAR : in bit;
	CLK : in bit;
	ENABLE_C : in bit;
	C_BS_OUT : out bit_vector(31 downto 0)
);

end C_BS_COUNTER_C;



architecture STRUCTURAL of C_BS_COUNTER_C is

signal COUNT_AUX : bit_vector(29 downto 0); -- bytes
signal COMPRESS_INT : bit;


begin

LATCH : process(CLK,CLEAR)
begin
    	-- asynchronous RESET signal forces all outputs LOW
      if (CLEAR = '0') then
	    COMPRESS_INT <= '1';
	    -- check for +ve clock edge
	elsif ((CLK'event) and (CLK = '1')) then
		if(CLEAR_COUNTER = '0') then
	                    COMPRESS_INT <= '1';
	     	elsif (COMPRESS = '0') then
				   COMPRESS_INT <= '0';
			else
				   COMPRESS_INT <= COMPRESS_INT;
			end if;
	end if;

end process LATCH;



COUNTING : process (CLK,CLEAR,ENABLE_C,COMPRESS_INT,CLEAR_COUNTER)

begin
    	-- asynchronous RESET signal forces all outputs LOW
      if (CLEAR = '0') then
	    COUNT_AUX <= "000000000000000000000000000000";
	    -- check for +ve clock edge
	  elsif ((CLK'event) and (CLK = '1')) then
	  	       if(CLEAR_COUNTER = '0') then
				COUNT_AUX <= "000000000000000000000000000000";
	         	 elsif( ENABLE_C = '0' and COMPRESS_INT = '0') then
	    	            COUNT_AUX <= COUNT_AUX+"000000000000000000000000000001";
				 else
			       COUNT_AUX <= COUNT_AUX;
			 end if;
	 end if;
	 
end process COUNTING;


		

C_BS_OUT <= COUNT_AUX & "00"; -- bytes. always a multiple of 4 bytes.
 

end STRUCTURAL;

