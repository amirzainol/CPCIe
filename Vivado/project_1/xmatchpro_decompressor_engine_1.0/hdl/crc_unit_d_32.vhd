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
--  ENTITY       = CRC_UNIT    --
--  version      = 1.0         --
--  last update  = 30/08/01    --
--  author       = Jose Nunez  --
---------------------------------


-- FUNCTION
-- calculates a 16 bit X25 CRC code
-- Purpose: VHDL package containing a synthesizable CRC function
--   * polynomial: (0 5 12 16)
--   * data width: 32

--  PIN LIST
--  DIN   = input data
--  ENABLE = activate CRC calculation
--  CRC_OUT = CRC output
 
library ieee;
use ieee.std_logic_1164.all;

entity CRC_UNIT_D_32 is

port(DIN : in std_logic_vector(31 downto 0);
	 ENABLE : in std_logic;
	 CLK : in std_logic;
	 RESET : in std_logic;
	 CLEAR : in std_logic;
	 CRC_OUT : out std_logic_vector(31 downto 0)
);
 
end CRC_UNIT_D_32;

architecture CRC1 of CRC_UNIT_D_32 is

signal CRC_AUX : std_logic_vector(31 downto 0);
signal CRC_NEW : std_logic_vector(31 downto 0);

begin


FLIP_FLOPS : process (CLK,CLEAR)
begin

if (CLEAR = '0') then
	CRC_AUX <= x"00000000";	
elsif ((CLK'event) and (CLK = '1')) then
	if (RESET = '0') then
		CRC_AUX <= x"00000000";	
	elsif (ENABLE = '1') then
		CRC_AUX <= CRC_NEW;
	else
		CRC_AUX <= CRC_AUX;
	end if;
end if;

end process FLIP_FLOPS;



NEXT_CRC : process(DIN, CRC_AUX)

variable D: std_logic_vector(31 downto 0);
variable C: std_logic_vector(31 downto 0);
variable NewCRC : std_logic_vector(31 downto 0);

begin

    D := DIN;
    C := CRC_AUX;

     NewCRC(0) := D(31) xor D(30) xor D(29) xor D(28) xor D(26) xor D(25) xor 
                 D(24) xor D(16) xor D(12) xor D(10) xor D(9) xor D(6) xor 
                 D(0) xor C(0) xor C(6) xor C(9) xor C(10) xor C(12) xor 
                 C(16) xor C(24) xor C(25) xor C(26) xor C(28) xor C(29) xor 
                 C(30) xor C(31);
    NewCRC(1) := D(28) xor D(27) xor D(24) xor D(17) xor D(16) xor D(13) xor 
                 D(12) xor D(11) xor D(9) xor D(7) xor D(6) xor D(1) xor 
                 D(0) xor C(0) xor C(1) xor C(6) xor C(7) xor C(9) xor 
                 C(11) xor C(12) xor C(13) xor C(16) xor C(17) xor C(24) xor 
                 C(27) xor C(28);
    NewCRC(2) := D(31) xor D(30) xor D(26) xor D(24) xor D(18) xor D(17) xor 
                 D(16) xor D(14) xor D(13) xor D(9) xor D(8) xor D(7) xor 
                 D(6) xor D(2) xor D(1) xor D(0) xor C(0) xor C(1) xor 
                 C(2) xor C(6) xor C(7) xor C(8) xor C(9) xor C(13) xor 
                 C(14) xor C(16) xor C(17) xor C(18) xor C(24) xor C(26) xor 
                 C(30) xor C(31);
    NewCRC(3) := D(31) xor D(27) xor D(25) xor D(19) xor D(18) xor D(17) xor 
                 D(15) xor D(14) xor D(10) xor D(9) xor D(8) xor D(7) xor 
                 D(3) xor D(2) xor D(1) xor C(1) xor C(2) xor C(3) xor 
                 C(7) xor C(8) xor C(9) xor C(10) xor C(14) xor C(15) xor 
                 C(17) xor C(18) xor C(19) xor C(25) xor C(27) xor C(31);
    NewCRC(4) := D(31) xor D(30) xor D(29) xor D(25) xor D(24) xor D(20) xor 
                 D(19) xor D(18) xor D(15) xor D(12) xor D(11) xor D(8) xor 
                 D(6) xor D(4) xor D(3) xor D(2) xor D(0) xor C(0) xor 
                 C(2) xor C(3) xor C(4) xor C(6) xor C(8) xor C(11) xor 
                 C(12) xor C(15) xor C(18) xor C(19) xor C(20) xor C(24) xor 
                 C(25) xor C(29) xor C(30) xor C(31);
    NewCRC(5) := D(29) xor D(28) xor D(24) xor D(21) xor D(20) xor D(19) xor 
                 D(13) xor D(10) xor D(7) xor D(6) xor D(5) xor D(4) xor 
                 D(3) xor D(1) xor D(0) xor C(0) xor C(1) xor C(3) xor 
                 C(4) xor C(5) xor C(6) xor C(7) xor C(10) xor C(13) xor 
                 C(19) xor C(20) xor C(21) xor C(24) xor C(28) xor C(29);
    NewCRC(6) := D(30) xor D(29) xor D(25) xor D(22) xor D(21) xor D(20) xor 
                 D(14) xor D(11) xor D(8) xor D(7) xor D(6) xor D(5) xor 
                 D(4) xor D(2) xor D(1) xor C(1) xor C(2) xor C(4) xor 
                 C(5) xor C(6) xor C(7) xor C(8) xor C(11) xor C(14) xor 
                 C(20) xor C(21) xor C(22) xor C(25) xor C(29) xor C(30);
    NewCRC(7) := D(29) xor D(28) xor D(25) xor D(24) xor D(23) xor D(22) xor 
                 D(21) xor D(16) xor D(15) xor D(10) xor D(8) xor D(7) xor 
                 D(5) xor D(3) xor D(2) xor D(0) xor C(0) xor C(2) xor 
                 C(3) xor C(5) xor C(7) xor C(8) xor C(10) xor C(15) xor 
                 C(16) xor C(21) xor C(22) xor C(23) xor C(24) xor C(25) xor 
                 C(28) xor C(29);
    NewCRC(8) := D(31) xor D(28) xor D(23) xor D(22) xor D(17) xor D(12) xor 
                 D(11) xor D(10) xor D(8) xor D(4) xor D(3) xor D(1) xor 
                 D(0) xor C(0) xor C(1) xor C(3) xor C(4) xor C(8) xor 
                 C(10) xor C(11) xor C(12) xor C(17) xor C(22) xor C(23) xor 
                 C(28) xor C(31);
    NewCRC(9) := D(29) xor D(24) xor D(23) xor D(18) xor D(13) xor D(12) xor 
                 D(11) xor D(9) xor D(5) xor D(4) xor D(2) xor D(1) xor 
                 C(1) xor C(2) xor C(4) xor C(5) xor C(9) xor C(11) xor 
                 C(12) xor C(13) xor C(18) xor C(23) xor C(24) xor C(29);
    NewCRC(10) := D(31) xor D(29) xor D(28) xor D(26) xor D(19) xor D(16) xor 
                  D(14) xor D(13) xor D(9) xor D(5) xor D(3) xor D(2) xor 
                  D(0) xor C(0) xor C(2) xor C(3) xor C(5) xor C(9) xor 
                  C(13) xor C(14) xor C(16) xor C(19) xor C(26) xor C(28) xor 
                  C(29) xor C(31);
    NewCRC(11) := D(31) xor D(28) xor D(27) xor D(26) xor D(25) xor D(24) xor 
                  D(20) xor D(17) xor D(16) xor D(15) xor D(14) xor D(12) xor 
                  D(9) xor D(4) xor D(3) xor D(1) xor D(0) xor C(0) xor 
                  C(1) xor C(3) xor C(4) xor C(9) xor C(12) xor C(14) xor 
                  C(15) xor C(16) xor C(17) xor C(20) xor C(24) xor C(25) xor 
                  C(26) xor C(27) xor C(28) xor C(31);
    NewCRC(12) := D(31) xor D(30) xor D(27) xor D(24) xor D(21) xor D(18) xor 
                  D(17) xor D(15) xor D(13) xor D(12) xor D(9) xor D(6) xor 
                  D(5) xor D(4) xor D(2) xor D(1) xor D(0) xor C(0) xor 
                  C(1) xor C(2) xor C(4) xor C(5) xor C(6) xor C(9) xor 
                  C(12) xor C(13) xor C(15) xor C(17) xor C(18) xor C(21) xor 
                  C(24) xor C(27) xor C(30) xor C(31);
    NewCRC(13) := D(31) xor D(28) xor D(25) xor D(22) xor D(19) xor D(18) xor 
                  D(16) xor D(14) xor D(13) xor D(10) xor D(7) xor D(6) xor 
                  D(5) xor D(3) xor D(2) xor D(1) xor C(1) xor C(2) xor 
                  C(3) xor C(5) xor C(6) xor C(7) xor C(10) xor C(13) xor 
                  C(14) xor C(16) xor C(18) xor C(19) xor C(22) xor C(25) xor 
                  C(28) xor C(31);
    NewCRC(14) := D(29) xor D(26) xor D(23) xor D(20) xor D(19) xor D(17) xor 
                  D(15) xor D(14) xor D(11) xor D(8) xor D(7) xor D(6) xor 
                  D(4) xor D(3) xor D(2) xor C(2) xor C(3) xor C(4) xor 
                  C(6) xor C(7) xor C(8) xor C(11) xor C(14) xor C(15) xor 
                  C(17) xor C(19) xor C(20) xor C(23) xor C(26) xor C(29);
    NewCRC(15) := D(30) xor D(27) xor D(24) xor D(21) xor D(20) xor D(18) xor 
                  D(16) xor D(15) xor D(12) xor D(9) xor D(8) xor D(7) xor 
                  D(5) xor D(4) xor D(3) xor C(3) xor C(4) xor C(5) xor 
                  C(7) xor C(8) xor C(9) xor C(12) xor C(15) xor C(16) xor 
                  C(18) xor C(20) xor C(21) xor C(24) xor C(27) xor C(30);
    NewCRC(16) := D(30) xor D(29) xor D(26) xor D(24) xor D(22) xor D(21) xor 
                  D(19) xor D(17) xor D(13) xor D(12) xor D(8) xor D(5) xor 
                  D(4) xor D(0) xor C(0) xor C(4) xor C(5) xor C(8) xor 
                  C(12) xor C(13) xor C(17) xor C(19) xor C(21) xor C(22) xor 
                  C(24) xor C(26) xor C(29) xor C(30);
    NewCRC(17) := D(31) xor D(30) xor D(27) xor D(25) xor D(23) xor D(22) xor 
                  D(20) xor D(18) xor D(14) xor D(13) xor D(9) xor D(6) xor 
                  D(5) xor D(1) xor C(1) xor C(5) xor C(6) xor C(9) xor 
                  C(13) xor C(14) xor C(18) xor C(20) xor C(22) xor C(23) xor 
                  C(25) xor C(27) xor C(30) xor C(31);
    NewCRC(18) := D(31) xor D(28) xor D(26) xor D(24) xor D(23) xor D(21) xor 
                  D(19) xor D(15) xor D(14) xor D(10) xor D(7) xor D(6) xor 
                  D(2) xor C(2) xor C(6) xor C(7) xor C(10) xor C(14) xor 
                  C(15) xor C(19) xor C(21) xor C(23) xor C(24) xor C(26) xor 
                  C(28) xor C(31);
    NewCRC(19) := D(29) xor D(27) xor D(25) xor D(24) xor D(22) xor D(20) xor 
                  D(16) xor D(15) xor D(11) xor D(8) xor D(7) xor D(3) xor 
                  C(3) xor C(7) xor C(8) xor C(11) xor C(15) xor C(16) xor 
                  C(20) xor C(22) xor C(24) xor C(25) xor C(27) xor C(29);
    NewCRC(20) := D(30) xor D(28) xor D(26) xor D(25) xor D(23) xor D(21) xor 
                  D(17) xor D(16) xor D(12) xor D(9) xor D(8) xor D(4) xor 
                  C(4) xor C(8) xor C(9) xor C(12) xor C(16) xor C(17) xor 
                  C(21) xor C(23) xor C(25) xor C(26) xor C(28) xor C(30);
    NewCRC(21) := D(31) xor D(29) xor D(27) xor D(26) xor D(24) xor D(22) xor 
                  D(18) xor D(17) xor D(13) xor D(10) xor D(9) xor D(5) xor 
                  C(5) xor C(9) xor C(10) xor C(13) xor C(17) xor C(18) xor 
                  C(22) xor C(24) xor C(26) xor C(27) xor C(29) xor C(31);
    NewCRC(22) := D(31) xor D(29) xor D(27) xor D(26) xor D(24) xor D(23) xor 
                  D(19) xor D(18) xor D(16) xor D(14) xor D(12) xor D(11) xor 
                  D(9) xor D(0) xor C(0) xor C(9) xor C(11) xor C(12) xor 
                  C(14) xor C(16) xor C(18) xor C(19) xor C(23) xor C(24) xor 
                  C(26) xor C(27) xor C(29) xor C(31);
    NewCRC(23) := D(31) xor D(29) xor D(27) xor D(26) xor D(20) xor D(19) xor 
                  D(17) xor D(16) xor D(15) xor D(13) xor D(9) xor D(6) xor 
                  D(1) xor D(0) xor C(0) xor C(1) xor C(6) xor C(9) xor 
                  C(13) xor C(15) xor C(16) xor C(17) xor C(19) xor C(20) xor 
                  C(26) xor C(27) xor C(29) xor C(31);
    NewCRC(24) := D(30) xor D(28) xor D(27) xor D(21) xor D(20) xor D(18) xor 
                  D(17) xor D(16) xor D(14) xor D(10) xor D(7) xor D(2) xor 
                  D(1) xor C(1) xor C(2) xor C(7) xor C(10) xor C(14) xor 
                  C(16) xor C(17) xor C(18) xor C(20) xor C(21) xor C(27) xor 
                  C(28) xor C(30);
    NewCRC(25) := D(31) xor D(29) xor D(28) xor D(22) xor D(21) xor D(19) xor 
                  D(18) xor D(17) xor D(15) xor D(11) xor D(8) xor D(3) xor 
                  D(2) xor C(2) xor C(3) xor C(8) xor C(11) xor C(15) xor 
                  C(17) xor C(18) xor C(19) xor C(21) xor C(22) xor C(28) xor 
                  C(29) xor C(31);
    NewCRC(26) := D(31) xor D(28) xor D(26) xor D(25) xor D(24) xor D(23) xor 
                  D(22) xor D(20) xor D(19) xor D(18) xor D(10) xor D(6) xor 
                  D(4) xor D(3) xor D(0) xor C(0) xor C(3) xor C(4) xor 
                  C(6) xor C(10) xor C(18) xor C(19) xor C(20) xor C(22) xor 
                  C(23) xor C(24) xor C(25) xor C(26) xor C(28) xor C(31);
    NewCRC(27) := D(29) xor D(27) xor D(26) xor D(25) xor D(24) xor D(23) xor 
                  D(21) xor D(20) xor D(19) xor D(11) xor D(7) xor D(5) xor 
                  D(4) xor D(1) xor C(1) xor C(4) xor C(5) xor C(7) xor 
                  C(11) xor C(19) xor C(20) xor C(21) xor C(23) xor C(24) xor 
                  C(25) xor C(26) xor C(27) xor C(29);
    NewCRC(28) := D(30) xor D(28) xor D(27) xor D(26) xor D(25) xor D(24) xor 
                  D(22) xor D(21) xor D(20) xor D(12) xor D(8) xor D(6) xor 
                  D(5) xor D(2) xor C(2) xor C(5) xor C(6) xor C(8) xor 
                  C(12) xor C(20) xor C(21) xor C(22) xor C(24) xor C(25) xor 
                  C(26) xor C(27) xor C(28) xor C(30);
    NewCRC(29) := D(31) xor D(29) xor D(28) xor D(27) xor D(26) xor D(25) xor 
                  D(23) xor D(22) xor D(21) xor D(13) xor D(9) xor D(7) xor 
                  D(6) xor D(3) xor C(3) xor C(6) xor C(7) xor C(9) xor 
                  C(13) xor C(21) xor C(22) xor C(23) xor C(25) xor C(26) xor 
                  C(27) xor C(28) xor C(29) xor C(31);
    NewCRC(30) := D(30) xor D(29) xor D(28) xor D(27) xor D(26) xor D(24) xor 
                  D(23) xor D(22) xor D(14) xor D(10) xor D(8) xor D(7) xor 
                  D(4) xor C(4) xor C(7) xor C(8) xor C(10) xor C(14) xor 
                  C(22) xor C(23) xor C(24) xor C(26) xor C(27) xor C(28) xor 
                  C(29) xor C(30);
    NewCRC(31) := D(31) xor D(30) xor D(29) xor D(28) xor D(27) xor D(25) xor 
                  D(24) xor D(23) xor D(15) xor D(11) xor D(9) xor D(8) xor 
                  D(5) xor C(5) xor C(8) xor C(9) xor C(11) xor C(15) xor 
                  C(23) xor C(24) xor C(25) xor C(27) xor C(28) xor C(29) xor 
                  C(30) xor C(31);

CRC_NEW <= NewCRC;

end process NEXT_CRC;

CRC_OUT <= CRC_AUX;
		 
end CRC1;


