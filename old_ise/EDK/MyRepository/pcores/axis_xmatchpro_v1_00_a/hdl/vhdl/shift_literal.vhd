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

------------------------------------
--  ENTITY       = SHIFT_LITERAL  --
--  version      = 2.0            --
--  last update  = 04/08/99       --
--  author       = Jose Nunez     --
------------------------------------


-- FUNCTION
-- barrel shifter to remove the match location and match type
-- codes from the decoded data, leaving just literal characters.


-- PIN LIST
-- DIN_LIT   = input data
-- CM_LENGTH = length of the match location and match type codes
-- DOUT_LIT  = output shifted data


library ieee,dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity SHIFT_LITERAL is
port
(
      DIN_LIT : in bit_vector(34 downto 0) ;
      CM_LENGTH : in bit_vector(3 downto 0) ;
    --  DECOMP : in bit ;
      DOUT_LIT : out bit_vector(31 downto 0) 
);


end SHIFT_LITERAL;



architecture BARREL of SHIFT_LITERAL is

begin

BSHIFT : process(DIN_LIT , CM_LENGTH )
begin
-- if (DECOMP = '0') then
	case CM_LENGTH is
	    when "0000" => DOUT_LIT <= DIN_LIT(34 downto 3);	
	    when "0001" => DOUT_LIT <= DIN_LIT(33 downto 2);
	    when "0010" => DOUT_LIT <= DIN_LIT(32 downto 1);
	    when "0011" => DOUT_LIT <= DIN_LIT(31 downto 0);
	    when "0100" => DOUT_LIT <= DIN_LIT(30 downto 0) & '0';
	    when "0101" => DOUT_LIT <= DIN_LIT(29 downto 0) & "00";
	    when "0110" => DOUT_LIT <= DIN_LIT(28 downto 0) & "000";
	    when "0111" => DOUT_LIT <= DIN_LIT(27 downto 0) & "0000";
	    when "1000" => DOUT_LIT <= DIN_LIT(26 downto 0) & "00000";
	    when "1001" => DOUT_LIT <= DIN_LIT(25 downto 0) & "000000";
	    when "1010" => DOUT_LIT <= DIN_LIT(24 downto 0) & "0000000";
	    when "1011" => DOUT_LIT <= DIN_LIT(23 downto 0) & "00000000";
	    when "1100" => DOUT_LIT <= DIN_LIT(22 downto 0) & "000000000";
	    when "1101" => DOUT_LIT <= DIN_LIT(21 downto 0) & "0000000000";
          when others => DOUT_LIT <= x"00000000";
	end case;
-- else
--	DOUT_LIT <= x"00000000";
-- end if;

end process BSHIFT;

end BARREL; -- end of architecture



