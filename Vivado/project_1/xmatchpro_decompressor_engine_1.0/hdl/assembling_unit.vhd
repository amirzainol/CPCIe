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
--  ENTITY       = ASSEMBLING_UNIT            --
--  version      = 1.0                     --
--  last update  = 30/05/01                --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- The assembling unit assembles the output uncompressed data in words of 32 bits

--  PIN LIST

--  ENABLE = asssembling unit active
--  DATA_IN_32  = data to be assemble from the decompression engine
--  MASK = 4 bit indicating how many bytes of the 32 are valid
--  DATA_OUT_32  = output data to the output buffer
--  WRITE    =  data ready to be written in the output buffer
--  CLEAR    = asynchronous clear
--  CLK      = master clock


library ieee;
use ieee.std_logic_1164.all;

entity ASSEMBLING_UNIT is
port
(
	ENABLE: in std_logic;
	DATA_IN_32 : in std_logic_vector(31 downto 0);
	CLEAR : in std_logic ;
	RESET : in std_logic;
	CLK : in std_logic ;
	MASK : in std_logic_vector(3 downto 0);
	WRITE : out std_logic;
	DATA_OUT_32: out std_logic_vector(31 downto 0)
);

end ASSEMBLING_UNIT;


architecture STRUCTURAL of ASSEMBLING_UNIT is


component ASSEMBLER_REGISTER
port (
	  WRITE_IN : in std_logic;
	  DATA_IN : in std_logic_vector(55 downto 0);
	  LENGTH_IN : in std_logic_vector(2 downto 0);
	  CLK : in std_logic;
	  CLEAR : in std_logic;
	  RESET : in std_logic;
	  ENABLE : in std_logic;
	  WRITE_OUT : out std_logic;
	  DATA_OUT : out std_logic_vector(55 downto 0);
	  LENGTH_OUT: out std_logic_vector(2 downto 0)
	 );
end component;

  
component ASSEMBLER
port (
	  ENABLE : in std_logic;
	  DATA_IN : in std_logic_vector(31 downto 0);
	  MASK_IN : in std_logic_vector(3 downto 0);
	  DATA_OLD : in std_logic_vector(55 downto 0);
	  LENGTH_OLD : in std_logic_vector(2 downto 0);
	  DATA_NEW : out std_logic_vector(55 downto 0);
	  LENGTH_NEW : out std_logic_vector(2 downto 0);
	  WRITE : out std_logic
	 );
end component;

signal DATA_NEW, DATA_OLD : std_logic_vector(55 downto 0);
signal LENGTH_NEW, LENGTH_OLD : std_logic_vector(2 downto 0);
signal WRITE_AUX : std_logic;
signal WRITE_INT: std_logic;

begin



ASSEMBLER_REGISTER_1 : ASSEMBLER_REGISTER
port map (
  	  WRITE_IN => WRITE_AUX,
  	  DATA_IN => DATA_NEW,
	  LENGTH_IN => LENGTH_NEW,
	  CLK => CLK,
	  CLEAR => CLEAR,
	  RESET => RESET,
	  ENABLE => ENABLE,
	  WRITE_OUT => WRITE_INT,
	  DATA_OUT => DATA_OLD,
	  LENGTH_OUT => LENGTH_OLD
	 );

ASSEMBLER_1 : ASSEMBLER
port map(
	  ENABLE => ENABLE,
	  DATA_IN => DATA_IN_32,
	  MASK_IN => MASK, 
	  DATA_OLD => DATA_OLD,
	  LENGTH_OLD => LENGTH_OLD,
	  DATA_NEW => DATA_NEW,
	  LENGTH_NEW => LENGTH_NEW,
	  WRITE => WRITE_AUX
	 );

DATA_OUT_32 <= DATA_OLD(55 downto 24);
WRITE <= WRITE_INT; 

end STRUCTURAL;
