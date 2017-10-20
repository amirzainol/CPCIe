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
--  ENTITY       = PARSING_UNIT            --
--  version      = 1.0                     --
--  last update  = 30/05/00                --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- The parsing unit parses the input data in words using the space as the parser

--  PIN LIST

--  ENABLE = parsing unit active
--  DATA_IN_32  = data to be parse from the buffer
--  MASK = 4 bit indicatin how many bytes of the 32 are valid
--  DATA_OUT_32  = output data to the search register
--  CLEAR    = asynchronous clear
--  CLK      = master clock


library ieee;
use ieee.std_logic_1164.all;

entity PARSING_UNIT is
port
(
	ENABLE: in std_logic; -- buffer ready
	FINISH : in std_logic; -- all the data has been processed
	DATA_IN_32 : in std_logic_vector(31 downto 0);
	CLEAR : in std_logic ;
	CLK : in std_logic ;
	MASK : out std_logic_vector(4 downto 0);
    READ : out std_logic;
	START_ENGINE : out std_logic;
	FINISH_PARSING : out std_logic;
	DATA_OUT_32: out std_logic_vector(31 downto 0)
);

end PARSING_UNIT;


architecture STRUCTURAL of PARSING_UNIT is


component PARSER_REGISTER
port (
	  ENABLE_IN : in std_logic;
	  DATA_IN : in std_logic_vector(55 downto 0);
	  LENGTH_IN : in std_logic_vector(2 downto 0);
	  CLK : in std_logic;
	  CLEAR : in std_logic;
	  RESET : in std_logic;
	  ENABLE_OUT : out std_logic;
	  DATA_OUT : out std_logic_vector(55 downto 0);
	  LENGTH_OUT: out std_logic_vector(2 downto 0)
	 );
end component;

  
component PARSER
port (
	  DATA_IN : in std_logic_vector(55 downto 0);
	  LENGTH_IN : in std_logic_vector(2 downto 0);
	  ENABLE : in std_logic; -- hold the state when the buffer is empty but still more data in the block
	  FINISH : in std_logic; -- last block is over
	  DATA_SEARCH : out std_logic_vector(31 downto 0);
	  DATA_OUT : out std_logic_vector(55 downto 0);
	  MASK : out std_logic_vector(4 downto 0);
	  LENGTH_OUT : out std_logic_vector(2 downto 0)
	 );
end component;


component PARSER_CONCATENATOR
port
	(
	DATA_IN_BUFFER : in std_logic_vector(31 downto 0);
	ENABLE : in std_logic;
	READ : in std_logic;
	DATA_OLD : in std_logic_vector(55 downto 0);
	LENGTH_OLD : in std_logic_vector(2 downto 0);
	DATA_NEW : out std_logic_vector(55 downto 0);
	LENGTH_NEW : out std_logic_vector(2 downto 0)
	);
end component;

signal DATA_NEW, DATA_REG, DATA_PARSER : std_logic_vector(55 downto 0);
signal LENGTH_NEW, LENGTH_REG, LENGTH_PARSER: std_logic_vector(2 downto 0);
signal ENABLE_INT : std_logic;
signal READ_NOW : std_logic;
signal READ_INT : std_logic;

begin



PARSER_REGISTER_1 : PARSER_REGISTER
port map (
	  ENABLE_IN => READ_INT,
	  DATA_IN =>DATA_NEW,
	  LENGTH_IN =>LENGTH_NEW,
	  CLK =>CLK,
	  CLEAR =>CLEAR,
	  RESET =>CLEAR,
	  ENABLE_OUT => READ_NOW,
	  DATA_OUT =>DATA_REG,
	  LENGTH_OUT =>LENGTH_REG
	 );

PARSER_1 : PARSER
port map(
	  DATA_IN => DATA_PARSER,
	  LENGTH_IN => LENGTH_PARSER,
	  ENABLE => ENABLE,  -- hold the state when the buffer is empty but still more data in the block
	  FINISH => FINISH, -- last block is over
	  DATA_SEARCH => DATA_OUT_32,
	  DATA_OUT => DATA_NEW,
	  MASK => MASK,
	  LENGTH_OUT => LENGTH_NEW
	 );


PARSER_CONCATENATOR_1 : PARSER_CONCATENATOR
port map
	(
	DATA_IN_BUFFER =>DATA_IN_32,
	ENABLE => ENABLE,
	READ => READ_NOW,
	DATA_OLD => DATA_REG,
	LENGTH_OLD =>LENGTH_REG,
	DATA_NEW =>DATA_PARSER,
	LENGTH_NEW=> LENGTH_PARSER
	);


READ_INT <= not(LENGTH_NEW(2)); -- and ENABLE;

READ <= READ_INT;

START_ENGINE <= '1' when (ENABLE = '1' or (LENGTH_PARSER > "000" and FINISH = '1')) else '0';

FINISH_PARSING <= '1' when (LENGTH_PARSER= "000" and FINISH = '1') else '0'; 

end STRUCTURAL;
