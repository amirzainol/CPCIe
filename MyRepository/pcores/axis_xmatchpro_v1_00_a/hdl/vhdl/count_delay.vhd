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

--------------------------------------------------
--  ENTITY       = COUNT_DELAY                  --
--  version      = 1.0                          --
--  last update  = 22/11/99                     --
--  author       = Jose Nunez                   --
--------------------------------------------------


-- FUNCTION
-- count delay register so the count is not lost during the RLI process


-- PIN LIST 
-- COUNT_IN : 8 bit count in
-- CLEAR : asyncronous clear
-- CLK : master clock 
-- COUNT_OUT : 8 bit count out

library IEEE;
use IEEE.std_logic_1164.all;

entity COUNT_DELAY is
port	     (
			COUNT_IN : in bit_vector(7 downto 0);
			CLEAR: in bit;
			RESET : in bit;
			CLK : in bit;
			COUNT_OUT :out bit_vector(7 downto 0)
		
		);
end COUNT_DELAY;

architecture STRUCTURAL of COUNT_DELAY is

 
signal COUNT_aux_1: bit_vector(7 downto 0); -- delay 1
signal COUNT_aux_2: bit_vector(7 downto 0); -- delay 2


begin

 process(CLK,CLEAR)
 begin
	if (CLEAR='0') then		
          COUNT_aux_1<="00000000";
		  COUNT_aux_2<="00000000";	  
	elsif ((CLK'event) and (CLK='1')) then
		  if (RESET='0') then		
           	COUNT_aux_1<="00000000";
		  	COUNT_aux_2<="00000000";	  
		  else
			COUNT_aux_1<=COUNT_IN;
		  	COUNT_aux_2<=COUNT_aux_1;
          end if;
	end if;
 end process;

COUNT_OUT<=COUNT_aux_2;

end structural;	
