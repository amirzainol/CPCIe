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
--  ENTITY       = DECOMP_ASSEM_5  --
--  version      = 1.0           --
--  last update  = 7/01/00      --
--  author       = Jose Nunez    --
-----------------------------------

-- FUNCTION
-- Assembles input data and remaining valid data into 33 bit elements
-- for application to the decoder.

-- PIN LIST
-- OLD_DATA     = previous data available to the decoder.
-- OLD_LENGTH   = length of previous data available to the decoder.
-- MATCH_LENGTH = length of data matched by the decoder.
-- DATA_IN      = input data from external RAM.
-- NEW_DATA     = next data to be made available to the decoder.
-- NEW_LENGTH   = length of next data to be made available to the decoder.
-- UNDERFLOW    = indicates that more data is required from the RAM,
--                 i.e data presently on DATA_IN must be read.

library dzx;
use dzx.bit_arith.all;
use dzx.attributes.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DECOMP_ASSEM_9 is
	port(
		OLD_DATA           : in  std_logic_vector(132 downto 0);
		OLD_LENGTH         : in  std_logic_vector(6 downto 0);
		DECODING_UNDERFLOW : in  std_logic;
		MATCH_LENGTH       : in  std_logic_vector(5 downto 0);
		DATA_IN            : in  std_logic_vector(63 downto 0);
		NEW_DATA           : out std_logic_vector(132 downto 0);
		NEW_LENGTH         : out std_logic_vector(6 downto 0);
		UNDERFLOW          : out std_logic
	);

end DECOMP_ASSEM_9;

architecture DEC_ASS of DECOMP_ASSEM_9 is

	signal INT_UNDERFLOW     : std_logic; -- temporary underflow signal
	signal TEMP_NEW_DATA_OUT : std_logic_vector(132 downto 0);

begin

	LENGTH_CALC : process(OLD_LENGTH, MATCH_LENGTH, DECODING_UNDERFLOW)
		variable NEW_LENGTH_AUX : std_logic_vector(6 downto 0);
		variable TEMP_LENGTH    : std_logic_vector(6 downto 0);
	begin
		TEMP_LENGTH := OLD_LENGTH;

		if (OLD_LENGTH < "0100011") then -- at least 35 bits. The other 35 are always present for a total of 70
			if (DECODING_UNDERFLOW = '0') then -- data in buffer
				TEMP_LENGTH(6) := '1';
				NEW_LENGTH_AUX := TEMP_LENGTH - MATCH_LENGTH; -- current decoding operation takes place
			else
				NEW_LENGTH_AUX := TEMP_LENGTH; --current decoding operation not done			
			end if;
			INT_UNDERFLOW <= '0';
		else
			NEW_LENGTH_AUX := TEMP_LENGTH - MATCH_LENGTH;
			INT_UNDERFLOW  <= '1';
		end if;

		NEW_LENGTH <= NEW_LENGTH_AUX;

	end process LENGTH_CALC;

	CODE_CALC : process(OLD_DATA, OLD_LENGTH, DATA_IN)
		variable TEMP_NEW_DATA : std_logic_vector(132 downto 0);

	begin
		TEMP_NEW_DATA(132 downto 98) := OLD_DATA(132 downto 98);

		case OLD_LENGTH is
			when "0000000" => TEMP_NEW_DATA(97 downto 0) := DATA_IN & "0000000000000000000000000000000000";
			when "0000001" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97) & DATA_IN & "000000000000000000000000000000000";
			when "0000010" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 96) & DATA_IN & "00000000000000000000000000000000";
			when "0000011" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 95) & DATA_IN & "0000000000000000000000000000000";
			when "0000100" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 94) & DATA_IN & "000000000000000000000000000000";
			when "0000101" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 93) & DATA_IN & "00000000000000000000000000000";
			when "0000110" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 92) & DATA_IN & "0000000000000000000000000000";
			when "0000111" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 91) & DATA_IN & "000000000000000000000000000";
			when "0001000" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 90) & DATA_IN & "00000000000000000000000000";
			when "0001001" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 89) & DATA_IN & "0000000000000000000000000";
			when "0001010" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 88) & DATA_IN & "000000000000000000000000";
			when "0001011" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 87) & DATA_IN & "00000000000000000000000";
			when "0001100" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 86) & DATA_IN & "0000000000000000000000";
			when "0001101" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 85) & DATA_IN & "000000000000000000000";
			when "0001110" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 84) & DATA_IN & "00000000000000000000";
			when "0001111" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 83) & DATA_IN & "0000000000000000000";
			when "0010000" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 82) & DATA_IN & "000000000000000000";
			when "0010001" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 81) & DATA_IN & "00000000000000000";
			when "0010010" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 80) & DATA_IN & "0000000000000000";
			when "0010011" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 79) & DATA_IN & "000000000000000";
			when "0010100" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 78) & DATA_IN & "00000000000000";
			when "0010101" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 77) & DATA_IN & "0000000000000";
			when "0010110" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 76) & DATA_IN & "000000000000";
			when "0010111" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 75) & DATA_IN & "00000000000";
			when "0011000" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 74) & DATA_IN & "0000000000";
			when "0011001" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 73) & DATA_IN & "000000000";
			when "0011010" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 72) & DATA_IN & "00000000";
			when "0011011" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 71) & DATA_IN & "0000000";
			when "0011100" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 70) & DATA_IN & "000000";
			when "0011101" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 69) & DATA_IN & "00000";
			when "0011110" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 68) & DATA_IN & "0000";
			when "0011111" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 67) & DATA_IN & "000";
			when "0100000" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 66) & DATA_IN & "00";
			when "0100001" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 65) & DATA_IN & "0";
			when "0100010" => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 64) & DATA_IN;
			when others    => TEMP_NEW_DATA(97 downto 0) := OLD_DATA(97 downto 0);
		end case;

		TEMP_NEW_DATA_OUT <= TEMP_NEW_DATA;

	end process CODE_CALC;

	MOVE : process(TEMP_NEW_DATA_OUT, MATCH_LENGTH)
	begin
		case MATCH_LENGTH is
			when "000000" => NEW_DATA <= TEMP_NEW_DATA_OUT(132 downto 0);
			when "000001" => NEW_DATA <= TEMP_NEW_DATA_OUT(131 downto 0) & '0';
			when "000010" => NEW_DATA <= TEMP_NEW_DATA_OUT(130 downto 0) & "00";
			when "000011" => NEW_DATA <= TEMP_NEW_DATA_OUT(129 downto 0) & "000";
			when "000100" => NEW_DATA <= TEMP_NEW_DATA_OUT(128 downto 0) & "0000";
			when "000101" => NEW_DATA <= TEMP_NEW_DATA_OUT(127 downto 0) & "00000";
			when "000110" => NEW_DATA <= TEMP_NEW_DATA_OUT(126 downto 0) & "000000";
			when "000111" => NEW_DATA <= TEMP_NEW_DATA_OUT(125 downto 0) & "0000000";
			when "001000" => NEW_DATA <= TEMP_NEW_DATA_OUT(124 downto 0) & "00000000";
			when "001001" => NEW_DATA <= TEMP_NEW_DATA_OUT(123 downto 0) & "000000000";
			when "001010" => NEW_DATA <= TEMP_NEW_DATA_OUT(122 downto 0) & "0000000000";
			when "001011" => NEW_DATA <= TEMP_NEW_DATA_OUT(121 downto 0) & "00000000000";
			when "001100" => NEW_DATA <= TEMP_NEW_DATA_OUT(120 downto 0) & "000000000000";
			when "001101" => NEW_DATA <= TEMP_NEW_DATA_OUT(119 downto 0) & "0000000000000";
			when "001110" => NEW_DATA <= TEMP_NEW_DATA_OUT(118 downto 0) & "00000000000000";
			when "001111" => NEW_DATA <= TEMP_NEW_DATA_OUT(117 downto 0) & "000000000000000";
			when "010000" => NEW_DATA <= TEMP_NEW_DATA_OUT(116 downto 0) & "0000000000000000";
			when "010001" => NEW_DATA <= TEMP_NEW_DATA_OUT(115 downto 0) & "00000000000000000";
			when "010010" => NEW_DATA <= TEMP_NEW_DATA_OUT(114 downto 0) & "000000000000000000";
			when "010011" => NEW_DATA <= TEMP_NEW_DATA_OUT(113 downto 0) & "0000000000000000000";
			when "010100" => NEW_DATA <= TEMP_NEW_DATA_OUT(112 downto 0) & "00000000000000000000";
			when "010101" => NEW_DATA <= TEMP_NEW_DATA_OUT(111 downto 0) & "000000000000000000000";
			when "010110" => NEW_DATA <= TEMP_NEW_DATA_OUT(110 downto 0) & "0000000000000000000000";
			when "010111" => NEW_DATA <= TEMP_NEW_DATA_OUT(109 downto 0) & "00000000000000000000000";
			when "011000" => NEW_DATA <= TEMP_NEW_DATA_OUT(108 downto 0) & "000000000000000000000000";
			when "011001" => NEW_DATA <= TEMP_NEW_DATA_OUT(107 downto 0) & "0000000000000000000000000";
			when "011010" => NEW_DATA <= TEMP_NEW_DATA_OUT(106 downto 0) & "00000000000000000000000000";
			when "011011" => NEW_DATA <= TEMP_NEW_DATA_OUT(105 downto 0) & "000000000000000000000000000";
			when "011100" => NEW_DATA <= TEMP_NEW_DATA_OUT(104 downto 0) & "0000000000000000000000000000";
			when "011101" => NEW_DATA <= TEMP_NEW_DATA_OUT(103 downto 0) & "00000000000000000000000000000";
			when "011110" => NEW_DATA <= TEMP_NEW_DATA_OUT(102 downto 0) & "000000000000000000000000000000";
			when "011111" => NEW_DATA <= TEMP_NEW_DATA_OUT(101 downto 0) & "0000000000000000000000000000000";
			when "100000" => NEW_DATA <= TEMP_NEW_DATA_OUT(100 downto 0) & "00000000000000000000000000000000";
			when "100001" => NEW_DATA <= TEMP_NEW_DATA_OUT(99 downto 0) & "000000000000000000000000000000000";
			when "100010" => NEW_DATA <= TEMP_NEW_DATA_OUT(98 downto 0) & "0000000000000000000000000000000000";
			when "100011" => NEW_DATA <= TEMP_NEW_DATA_OUT(97 downto 0) & "00000000000000000000000000000000000";
			when others   => NEW_DATA <= TEMP_NEW_DATA_OUT;
		end case;

	end process MOVE;

	UNDERFLOW <= INT_UNDERFLOW;

end DEC_ASS;                            -- end of architecture

