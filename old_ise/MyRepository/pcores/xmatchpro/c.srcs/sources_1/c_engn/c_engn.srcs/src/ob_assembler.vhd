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

-----------------------------------
--  ENTITY       = OB_ASSEMBLER  --
--  version      = 2.0           --
--  last update  = 6/06/01      --
--  author       = Jose Nunez    --
-----------------------------------


-- FUNCTION
-- final assembly stage for output compressed data.


-- PIN LIST
-- CLK          = master clock
-- CLEAR        = asynchronous clear signal (active LOW)
-- CODE_OLD     = current contents of the output code register
-- LENGTH_OLD   = current length of the output code register
-- CODE_IN      = new input code to be added to the current code
-- LENGTH_IN    = length of the input code
-- COMP         = indicates that we are in compression mode (active low)
-- FLUSH_IN     = indicates that we are at the end of compression and thus must flush any
--                remaining data from the output code register (new input data is no
--                longer valid)
-- CODE_NEW     = new data for the output code register
-- LENGTH_NEW   = new output code register length
-- OVERFLOW_LENGTH = new overflow status (active low). Will go active if more than 64 bits
--                of the new code are valid
-- OVERFLOW_FLUSH  = indicates a flushing overflow (data must go out when flushing )
-- FLUSH_END    = indicates end of flushing operation (active low)


--library ieee,dzx;
--use ieee.std_logic_1164.all;
--use dzx.bit_arith.all;
--use dzx.bit_utils.all; 

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- updated by Mohd A. Zainol
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

-- when others => CODE_NEW <= CODE_NEW;
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity OB_ASSEMBLER is
port
(
	CLK : in std_logic;
	CLEAR : in std_logic;
	RESET : in std_logic;
   	CODE_OLD : in std_logic_vector(97 downto 0);
	LENGTH_OLD : in std_logic_vector(5 downto 0);
	CODE_IN : in std_logic_vector(34 downto 0);
	LENGTH_IN : in std_logic_vector(5 downto 0);
	COMP : in std_logic;
	FLUSH_IN : in std_logic;
	OVERFLOW_OLD : in std_logic;
	CODE_NEW : out std_logic_vector(97 downto 0);
	LENGTH_NEW : out std_logic_vector(5 downto 0);
	OVERFLOW_LENGTH : out std_logic;
	OVERFLOW_FLUSH : out std_logic;
	SHORT : out std_logic;
	FLUSH_END : out std_logic
);



end OB_ASSEMBLER;


architecture ASSEMBLE2 of OB_ASSEMBLER is

signal FLUSHING_D : std_logic;
signal FLUSHING_Q : std_logic;
signal EFC_D : std_logic;
signal EFC_Q : std_logic;
signal LENGTH_ZERO : std_logic;
signal INT_CODE_IN : std_logic_vector(34 downto 0);
signal INT_LENGTH_IN : std_logic_vector(5 downto 0);
signal CYCLE1_END : std_logic;
signal CYCLE1_FORCE : std_logic;
signal OVERFLOW_FLUSH_AUX : std_logic;
signal LONG_WORD_D : std_logic;
signal LONG_WORD_Q : std_logic;

  function Or_Bits (v: std_logic_Vector) return std_logic is
    variable ret: std_logic := '0';
  begin
    for j in v'range loop
      ret := ret or v(j);
    end loop;

    return ret;
  end Or_Bits;

  function Nor_Bits (v: std_logic_Vector) return std_logic is
  begin
    return (not Or_Bits(v));
  end Nor_Bits;
  
begin

LENGTH_ZERO <= Nor_Bits(LENGTH_OLD);
EFC_D <= FLUSH_IN or LENGTH_ZERO or OVERFLOW_OLD;
FLUSHING_D <= FLUSH_IN and FLUSHING_Q;
CYCLE1_END <= FLUSH_IN or not(OVERFLOW_OLD or LENGTH_ZERO);
CYCLE1_FORCE <= FLUSH_IN or LENGTH_ZERO or not(OVERFLOW_OLD);



FLUSH_END <= CYCLE1_END and EFC_Q;
OVERFLOW_FLUSH_AUX <= CYCLE1_FORCE and EFC_Q;
OVERFLOW_FLUSH <= OVERFLOW_FLUSH_AUX;
SHORT <= OVERFLOW_FLUSH_AUX or LONG_WORD_Q; 

VALIDATE_INPUTS : process( COMP, CODE_IN , LENGTH_IN , FLUSHING_D )
begin
if (FLUSHING_D = '1' and COMP='0') then
	INT_CODE_IN <= CODE_IN;
	INT_LENGTH_IN <= LENGTH_IN;
else
	INT_CODE_IN <= "00000000000000000000000000000000000";
	INT_LENGTH_IN <= "000000";
end if;
end process VALIDATE_INPUTS;


CONTROL_FLIPS : process(CLEAR,CLK)
begin
if (CLEAR='0') then
 		FLUSHING_Q <= '1';
		EFC_Q <= '1';
		LONG_WORD_Q <= '1';
elsif ((CLK'event) and (CLK = '1')) then
	if ((RESET = '0') or (COMP = '1')) then
		FLUSHING_Q <= '1';
		EFC_Q <= '1';
                LONG_WORD_Q <= '1';
	else
		FLUSHING_Q <= FLUSHING_D;
		EFC_Q <= EFC_D;
		LONG_WORD_Q <= LONG_WORD_D;
	end if;
end if;
end process CONTROL_FLIPS;


LENGTH_CALC : process( LENGTH_OLD , INT_LENGTH_IN , FLUSHING_D , COMP)
variable TEMP_LENGTH : std_logic_vector(6 downto 0);
variable TEMP_LENGTH_AUX : std_logic_vector(6 downto 0);

begin

TEMP_LENGTH_AUX := ('0' & LENGTH_OLD) + ('0' & INT_LENGTH_IN);

LONG_WORD_D <= TEMP_LENGTH_AUX(6) or (TEMP_LENGTH_AUX(5) and or_bits(TEMP_LENGTH_AUX(4 downto 0)));

if ((COMP = '1') or (FLUSHING_D = '0')) then
    TEMP_LENGTH := "0000000";
else
    TEMP_LENGTH := TEMP_LENGTH_AUX;
end if;


LENGTH_NEW <= TEMP_LENGTH(5 downto 0);
OVERFLOW_LENGTH <= not(TEMP_LENGTH(6));
end process LENGTH_CALC;



CODE_SHIFT : process (CODE_OLD , LENGTH_OLD , INT_CODE_IN , OVERFLOW_OLD)
begin
--if (COMP = '0') then
case LENGTH_OLD is
    when "000000" => CODE_NEW <= INT_CODE_IN & x"000000000000000" & "000";
    
    when "000001" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97) <= CODE_OLD(33);
		     else
		        	    CODE_NEW(97) <= CODE_OLD(97);
		     end if;
		     CODE_NEW(96 downto 62) <= INT_CODE_IN;
		     CODE_NEW(61 downto 0) <= x"000000000000000" & "00";

    when "000010" => if (OVERFLOW_OLD = '0') then
    	    	CODE_NEW(97 downto 96) <= CODE_OLD(33 downto 32);
		     else
		     	CODE_NEW(97 downto 96) <= CODE_OLD(97 downto 96);
		     end if;
		     CODE_NEW(95 downto 61) <= INT_CODE_IN;
		     CODE_NEW(60 downto 0) <= x"000000000000000" & "0";
		     
    when "000011" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 95) <= CODE_OLD(33 downto 31);
		     else
		     	CODE_NEW(97 downto 95) <= CODE_OLD(97 downto 95);
		     end if;
		     CODE_NEW(94 downto 60) <= INT_CODE_IN;
		     CODE_NEW(59 downto 0) <= x"000000000000000";
		     
    when "000100" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 94) <= CODE_OLD(33 downto 30);
		     else
		     	CODE_NEW(97 downto 94) <= CODE_OLD(97 downto 94);
		     end if;
		     CODE_NEW(93 downto 59) <= INT_CODE_IN;
		     CODE_NEW(58 downto 0) <= x"00000000000000" & "000";
		     
    when "000101" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 93) <= CODE_OLD(33 downto 29);
		     else
		     	CODE_NEW(97 downto 93) <= CODE_OLD(97 downto 93);
		     end if;
		     CODE_NEW(92 downto 58) <= INT_CODE_IN;
		     CODE_NEW(57 downto 0) <= x"00000000000000" & "00";
    
    when "000110" => if (OVERFLOW_OLD = '0') then
    	    	 CODE_NEW(97 downto 92) <= CODE_OLD(33 downto 28);
		     else
		     	 CODE_NEW(97 downto 92) <= CODE_OLD(97 downto 92);
		     end if;
		     CODE_NEW(91 downto 57) <= INT_CODE_IN;
		     CODE_NEW(56 downto 0) <= x"00000000000000" & "0";
		     
    when "000111" => if (OVERFLOW_OLD = '0') then
    	    	CODE_NEW(97 downto 91) <= CODE_OLD(33 downto 27);
		     else
		     	CODE_NEW(97 downto 91) <= CODE_OLD(97 downto 91);
		     end if;
		     CODE_NEW(90 downto 56) <= INT_CODE_IN;
		     CODE_NEW(55 downto 0) <= x"00000000000000";
		     
    when "001000" => if (OVERFLOW_OLD = '0') then
    	    	CODE_NEW(97 downto 90) <= CODE_OLD(33 downto 26);
		     else
		     	CODE_NEW(97 downto 90) <= CODE_OLD(97 downto 90);
		     end if;
		     CODE_NEW(89 downto 55) <= INT_CODE_IN;
		     CODE_NEW(54 downto 0) <= x"0000000000000" & "000";
		     
    when "001001" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 89) <= CODE_OLD(33 downto 25);
		     else
		     	CODE_NEW(97 downto 89) <= CODE_OLD(97 downto 89);
		     end if;
		     CODE_NEW(88 downto 54) <= INT_CODE_IN;
		     CODE_NEW(53 downto 0) <= x"0000000000000" & "00";
    
    when "001010" => if (OVERFLOW_OLD = '0') then
    	    	CODE_NEW(97 downto 88) <= CODE_OLD(33 downto 24);
		     else
		     	CODE_NEW(97 downto 88) <= CODE_OLD(97 downto 88);
		     end if;
		     CODE_NEW(87 downto 53) <= INT_CODE_IN;
		     CODE_NEW(52 downto 0) <= x"0000000000000" & "0";
		     
    when "001011" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 87) <= CODE_OLD(33 downto 23);
		     else
		     	CODE_NEW(97 downto 87) <= CODE_OLD(97 downto 87);
		     end if;
		     CODE_NEW(86 downto 52) <= INT_CODE_IN;
		     CODE_NEW(51 downto 0) <= x"0000000000000";
		     
    when "001100" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 86) <= CODE_OLD(33 downto 22);
		     else
		     	CODE_NEW(97 downto 86) <= CODE_OLD(97 downto 86);
		     end if;
		     CODE_NEW(85 downto 51) <= INT_CODE_IN;
		     CODE_NEW(50 downto 0) <= x"000000000000" & "000";
		     
    when "001101" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 85) <= CODE_OLD(33 downto 21);
		     else
		     	CODE_NEW(97 downto 85) <= CODE_OLD(97 downto 85);
		     end if;
		     CODE_NEW(84 downto 50) <= INT_CODE_IN;
		     CODE_NEW(49 downto 0) <= x"000000000000" & "00";
    
    when "001110" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 84) <= CODE_OLD(33 downto 20);
		     else
		     	CODE_NEW(97 downto 84) <= CODE_OLD(97 downto 84);
		     end if;
		     CODE_NEW(83 downto 49) <= INT_CODE_IN;
		     CODE_NEW(48 downto 0) <= x"000000000000" & "0";
		     
    when "001111" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 83) <= CODE_OLD(33 downto 19);
		     else
		     	CODE_NEW(97 downto 83) <= CODE_OLD(97 downto 83);
		     end if;
		     CODE_NEW(82 downto 48) <= INT_CODE_IN;
		     CODE_NEW(47 downto 0) <= x"000000000000";
		     
    when "010000" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 82) <= CODE_OLD(33 downto 18);
		     else
		     	CODE_NEW(97 downto 82) <= CODE_OLD(97 downto 82);
		     end if;
		     CODE_NEW(81 downto 47) <= INT_CODE_IN;
		     CODE_NEW(46 downto 0) <= x"00000000000" & "000";
		     
    when "010001" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 81) <= CODE_OLD(33 downto 17);
		     else
		     	CODE_NEW(97 downto 81) <= CODE_OLD(97 downto 81);
		     end if;
		     CODE_NEW(80 downto 46) <= INT_CODE_IN;
		     CODE_NEW(45 downto 0) <= x"00000000000" & "00";
    
    when "010010" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 80) <= CODE_OLD(33 downto 16);
		     else
		     	CODE_NEW(97 downto 80) <= CODE_OLD(97 downto 80);
		     end if;
		     CODE_NEW(79 downto 45) <= INT_CODE_IN;
		     CODE_NEW(44 downto 0) <= x"00000000000" & "0";
		     
    when "010011" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 79) <= CODE_OLD(33 downto 15);
		     else
		     	CODE_NEW(97 downto 79) <= CODE_OLD(97 downto 79);
		     end if;
		     CODE_NEW(78 downto 44) <= INT_CODE_IN;
		     CODE_NEW(43 downto 0) <= x"00000000000";
		     
    when "010100" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 78) <= CODE_OLD(33 downto 14);
		     else
		     	CODE_NEW(97 downto 78) <= CODE_OLD(97 downto 78);
		     end if;
		     CODE_NEW(77 downto 43) <= INT_CODE_IN;
		     CODE_NEW(42 downto 0) <= x"0000000000" & "000";
		     
    when "010101" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 77) <= CODE_OLD(33 downto 13);
		     else
		     	CODE_NEW(97 downto 77) <= CODE_OLD(97 downto 77);
		     end if;
		     CODE_NEW(76 downto 42) <= INT_CODE_IN;
		     CODE_NEW(41 downto 0) <= x"0000000000" & "00";
    
    when "010110" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 76) <= CODE_OLD(33 downto 12);
		     else
		     	CODE_NEW(97 downto 76) <= CODE_OLD(97 downto 76);
		     end if;
		     CODE_NEW(75 downto 41) <= INT_CODE_IN;
		     CODE_NEW(40 downto 0) <= x"0000000000" & "0";
		     
    when "010111" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 75) <= CODE_OLD(33 downto 11);
		     else
		     	CODE_NEW(97 downto 75) <= CODE_OLD(97 downto 75);
		     end if;
		     CODE_NEW(74 downto 40) <= INT_CODE_IN;
		     CODE_NEW(39 downto 0) <= x"0000000000";
		     
    when "011000" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 74) <= CODE_OLD(33 downto 10);
		     else
		     	CODE_NEW(97 downto 74) <= CODE_OLD(97 downto 74);
		     end if;
		     CODE_NEW(73 downto 39) <= INT_CODE_IN;
		     CODE_NEW(38 downto 0) <= x"000000000" & "000";
		     
    when "011001" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 73) <= CODE_OLD(33 downto 9);
		     else
		     	CODE_NEW(97 downto 73) <= CODE_OLD(97 downto 73);
		     end if;
		     CODE_NEW(72 downto 38) <= INT_CODE_IN;
		     CODE_NEW(37 downto 0) <= x"000000000" & "00";
    
    when "011010" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 72) <= CODE_OLD(33 downto 8);
		     else
		     	CODE_NEW(97 downto 72) <= CODE_OLD(97 downto 72);
		     end if;
		     CODE_NEW(71 downto 37) <= INT_CODE_IN;
		     CODE_NEW(36 downto 0) <= x"000000000" & "0";
		     
    when "011011" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 71) <= CODE_OLD(33 downto 7);
		     else
		     	CODE_NEW(97 downto 71) <= CODE_OLD(97 downto 71);
		     end if;
		     CODE_NEW(70 downto 36) <= INT_CODE_IN;
		     CODE_NEW(35 downto 0) <= x"000000000";
		     
    when "011100" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 70) <= CODE_OLD(33 downto 6);
		     else
		     	CODE_NEW(97 downto 70) <= CODE_OLD(97 downto 70);
		     end if;
		     CODE_NEW(69 downto 35) <= INT_CODE_IN;
		     CODE_NEW(34 downto 0) <= x"00000000" & "000";
		     
    when "011101" => if (OVERFLOW_OLD = '0') then
    	    	CODE_NEW(97 downto 69) <= CODE_OLD(33 downto 5);
		     else
		     	CODE_NEW(97 downto 69) <= CODE_OLD(97 downto 69);
		     end if;
		     CODE_NEW(68 downto 34) <= INT_CODE_IN;
		     CODE_NEW(33 downto 0) <= x"00000000" & "00";
    
    when "011110" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 68) <= CODE_OLD(33 downto 4);
		     else
		     	CODE_NEW(97 downto 68) <= CODE_OLD(97 downto 68);
		     end if;
		     CODE_NEW(67 downto 33) <= INT_CODE_IN;
		     CODE_NEW(32 downto 0) <= x"00000000" & "0";
		     
    when "011111" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 67) <= CODE_OLD(33 downto 3);
		     else
		     	CODE_NEW(97 downto 67) <= CODE_OLD(97 downto 67);
		     end if;
		     CODE_NEW(66 downto 32) <= INT_CODE_IN;
		     CODE_NEW(31 downto 0) <= x"00000000";
		     
    when "100000" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 66) <= CODE_OLD(33 downto 2);
		     else
		     	CODE_NEW(97 downto 66) <= CODE_OLD(97 downto 66);
		     end if;
		     CODE_NEW(65 downto 31) <= INT_CODE_IN;
		     CODE_NEW(30 downto 0) <= x"0000000" & "000";

   when "100001" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 65) <= CODE_OLD(33 downto 1);
		     else
		     	CODE_NEW(97 downto 65) <= CODE_OLD(97 downto 65);
		     end if;
		     CODE_NEW(64 downto 30) <= INT_CODE_IN;
		     CODE_NEW(29 downto 0) <= x"0000000" & "00";

   when "100010" => if (OVERFLOW_OLD = '0') then
    	    	    	CODE_NEW(97 downto 64) <= CODE_OLD(33 downto 0);
		     else
		     	CODE_NEW(97 downto 64) <= CODE_OLD(97 downto 64);
		     end if;
		     CODE_NEW(63 downto 29) <= INT_CODE_IN;
		     CODE_NEW(28 downto 0) <= x"0000000" & "0";
		     
    when "100011" => CODE_NEW <= CODE_OLD(97 downto 63) & INT_CODE_IN & x"0000000";
		     
    when "100100" => CODE_NEW <= CODE_OLD(97 downto 62) & INT_CODE_IN & x"000000" & "000";
    
    when "100101" => CODE_NEW <= CODE_OLD(97 downto 61) & INT_CODE_IN & x"000000" & "00";
		     
    when "100110" => CODE_NEW <= CODE_OLD(97 downto 60) & INT_CODE_IN & x"000000" & "0";
		     
    when "100111" => CODE_NEW <= CODE_OLD(97 downto 59) & INT_CODE_IN & x"000000";
		     
    when "101000" => CODE_NEW <= CODE_OLD(97 downto 58) & INT_CODE_IN & x"00000" & "000";
    
    when "101001" => CODE_NEW <= CODE_OLD(97 downto 57) & INT_CODE_IN & x"00000" & "00";
		     
    when "101010" => CODE_NEW <= CODE_OLD(97 downto 56) & INT_CODE_IN & x"00000" & "0";
		     
    when "101011" => CODE_NEW <= CODE_OLD(97 downto 55) & INT_CODE_IN & x"00000";
		     
    when "101100" => CODE_NEW <= CODE_OLD(97 downto 54) & INT_CODE_IN & x"0000" & "000";
    
    when "101101" => CODE_NEW <= CODE_OLD(97 downto 53) & INT_CODE_IN & x"0000" & "00";
		     
    when "101110" => CODE_NEW <= CODE_OLD(97 downto 52) & INT_CODE_IN & x"0000" & "0";
		     
    when "101111" => CODE_NEW <= CODE_OLD(97 downto 51) & INT_CODE_IN & x"0000";
		     
    when "110000" => CODE_NEW <= CODE_OLD(97 downto 50) & INT_CODE_IN & x"000" & "000";
    
    when "110001" => CODE_NEW <= CODE_OLD(97 downto 49) & INT_CODE_IN & x"000" & "00";
		     
    when "110010" => CODE_NEW <= CODE_OLD(97 downto 48) & INT_CODE_IN & x"000" & "0";
		     
    when "110011" => CODE_NEW <= CODE_OLD(97 downto 47) & INT_CODE_IN & x"000";
		     
    when "110100" => CODE_NEW <= CODE_OLD(97 downto 46) & INT_CODE_IN & x"00" & "000";
    
    when "110101" => CODE_NEW <= CODE_OLD(97 downto 45) & INT_CODE_IN & x"00" & "00";
		     
    when "110110" => CODE_NEW <= CODE_OLD(97 downto 44) & INT_CODE_IN & x"00" & "0";
		     
    when "110111" => CODE_NEW <= CODE_OLD(97 downto 43) & INT_CODE_IN & x"00";
		     
    when "111000" => CODE_NEW <= CODE_OLD(97 downto 42) & INT_CODE_IN & x"0" & "000";
    
    when "111001" => CODE_NEW <= CODE_OLD(97 downto 41) & INT_CODE_IN & x"0" & "00";
		     
    when "111010" => CODE_NEW <= CODE_OLD(97 downto 40) & INT_CODE_IN & x"0" & "0";
		     
    when "111011" => CODE_NEW <= CODE_OLD(97 downto 39) & INT_CODE_IN & x"0";
		     
    when "111100" => CODE_NEW <= CODE_OLD(97 downto 38) & INT_CODE_IN & "000";
    
    when "111101" => CODE_NEW <= CODE_OLD(97 downto 37) & INT_CODE_IN & "00";
		     
    when "111110" => CODE_NEW <= CODE_OLD(97 downto 36) & INT_CODE_IN & "0";
		     
    when "111111" => CODE_NEW <= CODE_OLD(97 downto 35) & INT_CODE_IN;
    
    when others => null;
end case;
--else
--     CODE_NEW <= x"000000000000000000000000";
--end if;
end process CODE_SHIFT;


end ASSEMBLE2; -- end of architecture







