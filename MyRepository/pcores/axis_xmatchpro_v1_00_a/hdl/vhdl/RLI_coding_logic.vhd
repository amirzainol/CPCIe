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

---------------------------------------------
--  ENTITY       =  RLI_coding_logic       --
--  Version      =  1.0                    --
--  last update  =  22/11/99               --
--  author       =  Jose Nunez             --
---------------------------------------------


-- FUNCTION
-- RLI logic for the compression process


--  PIN LIST
--  RL_DETECTED : run length detection
--  COUNT_IN : count coming from the share counter
--  COMP_IN : control signal from csm
--  FLUSH_IN : control signal from csm
--  CODE_IN :normal code in
--  LENGTH_IN : length of code in
--  CLEAR : asyncronous clear
--  CLK : master clock
--  FLUSH_OUT : control signal from csm
--  COMP_OUT : control signal from csm
--  CODE_OUT : 33 bits code out
--  LENGTH_OUT : length of code out

library ieee;
use ieee.std_logic_1164.all;

entity RLI_coding_logic is
port
(
	  RL_DETECTED : in bit;
	  COUNT_IN : in bit_vector(7 downto 0);
	  COMP_IN : in bit;
	  MOVE_ENABLE_IN : in bit;
	  FLUSH_IN: in bit;
    FLUSH_RLI : in bit;
	  CODE_IN : in bit_vector(34 downto 0);
	  LENGTH_IN : in bit_vector(5 downto 0);
	  CODE_RLI : in bit_vector(4 downto 0);
      CODE_RLI_LENGTH : in bit_vector(2 downto 0);
	  CLEAR : in bit;
	  RESET : in bit;
	  CLK : in bit;
	  FLUSH_OUT: out bit;
	  COMP_OUT: out bit;
	  CODE_OUT : out bit_vector(34 downto 0);
	  LENGTH_OUT : out bit_vector(5 downto 0)
);
end RLI_coding_logic;

architecture STRUCTURAL of RLI_coding_logic is



component RLI_CCU
port
(
      CODE_IN : in bit_vector(34 downto 0) ;
	  MOVE_ENABLE_IN: in bit;
	  FLUSH_IN : in bit;
	  LENGTH_IN : in bit_vector (5 downto 0);
	  CODE_RLI : in bit_vector(4 downto 0);
	  CODE_RLI_LENGTH : in bit_vector(2 downto 0);
	  COUNT : in bit_vector(7 downto 0);
	  RL_DETECTED : in bit;
      CLEAR : in bit ;
	  RESET : in bit;
      CLK : in bit ;
      CODE_OUT : out bit_vector(34 downto 0);
 	  LENGTH_OUT : out bit_vector(5 downto 0)
);
end component;

component RLI_CR 
port	     (
			FLUSH_IN : in bit;
			CODE_IN : in bit_vector (34 downto 0);
			LENGTH_IN : in bit_vector (5 downto 0);
			CODE_RLI_IN : in bit_vector(4 downto 0);
			CODE_RLI_LENGTH_IN : in bit_vector(2  downto 0);
			COMP_IN :in bit;
			MOVE_ENABLE_IN: in bit;
			CLEAR:in bit;
			RESET: in bit;
			CLK :in bit;
			FLUSH_OUT:out bit;
			CODE_OUT:out bit_vector(34 downto 0);
			LENGTH_OUT:out bit_vector(5 downto 0);
			CODE_RLI_OUT : out bit_vector(4 downto 0);
			CODE_RLI_LENGTH_OUT : out bit_vector(2 downto 0);
			COMP_OUT: out bit;
			MOVE_ENABLE_OUT : out bit
		);
end component;


signal LENGTH_OUT_INT : bit_vector(5 downto 0); -- length to the control unit
signal CODE_OUT_INT : bit_vector(34 downto 0); -- code to the control unit
signal CODE_RLI_OUT_INT : bit_vector(4 downto 0);
signal CODE_RLI_LENGTH_OUT_INT : bit_vector(2  downto 0);
signal MOVE_ENABLE_OUT: bit;
signal FLUSH_OUT_INT: bit;


begin


coding_register : RLI_CR 
port map(
			FLUSH_IN => FLUSH_IN,
			CODE_IN => CODE_IN,
			LENGTH_IN => LENGTH_IN,
			CODE_RLI_IN => CODE_RLI,
			CODE_RLI_LENGTH_IN => CODE_RLI_LENGTH,
			COMP_IN => COMP_IN,
			MOVE_ENABLE_IN => MOVE_ENABLE_IN,
			CLEAR => CLEAR,
			RESET => RESET,
			CLK => CLK,
			FLUSH_OUT => FLUSH_OUT_INT,
			CODE_OUT => CODE_OUT_INT,
			LENGTH_OUT => LENGTH_OUT_INT,
			CODE_RLI_OUT => CODE_RLI_OUT_INT,
			CODE_RLI_LENGTH_OUT => CODE_RLI_LENGTH_OUT_INT,
 			COMP_OUT => COMP_OUT,
			MOVE_ENABLE_OUT => MOVE_ENABLE_OUT
		);

control_unit : RLI_CCU
port map
(
      CODE_IN => CODE_OUT_INT,
	  MOVE_ENABLE_IN => MOVE_ENABLE_IN,
	  FLUSH_IN => FLUSH_RLI,
	  LENGTH_IN => LENGTH_OUT_INT,
      CODE_RLI => CODE_RLI_OUT_INT,
	  CODE_RLI_LENGTH => CODE_RLI_LENGTH_OUT_INT,       
	  COUNT => COUNT_IN,
	  RL_DETECTED => RL_DETECTED,
      CLEAR => CLEAR,
	  RESET => RESET,
      CLK => CLK,
      CODE_OUT => CODE_OUT,
 	  LENGTH_OUT => LENGTH_OUT
);


FLUSH_OUT <= FLUSH_OUT_INT;

end STRUCTURAL;

