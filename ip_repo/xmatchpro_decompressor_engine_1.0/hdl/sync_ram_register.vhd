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
--  ENTITY       = OUT_REGISTER--
--  version      = 1.0         --
--  last update  = 21/08/00    --
--  author       = Jose Nunez  --
---------------------------------

-- FUNCTION
-- out register

--  PIN LIST
--  DIN   = 32 bit input data

--  U_DATA_VALID_IN = the data is valid in the bus in 
--  CLEAR = asynchronous clear of register
--  CLK   = clock
--  DOUT  = 32 bit output of flip-flops

--  U_DATA_VALID_OUT = the data is valid in the bus out

library ieee, dzx;
use ieee.std_logic_1164.all;
use dzx.attributes.all;

entity SYNC_RAM_REGISTER is
	port(
		WRITE_ADDRESS_IN  : in  std_logic_vector(3 downto 0);
		MATCH_TYPE_IN     : in  std_logic_vector(3 downto 0);
		LITERAL_DATA_IN   : in  std_logic_vector(31 downto 0);
		LITERAL_MASK_IN   : in  std_logic_vector(4 downto 0);
		U_DATA_VALID_IN   : in  std_logic;
		ENABLE            : in  std_logic;
		CLEAR             : in  std_logic;
		RESET             : in  std_logic;
		CLK               : in  std_logic;
		WRITE_ADDRESS_OUT : out std_logic_vector(3 downto 0);
		MATCH_TYPE_OUT    : out std_logic_vector(3 downto 0);
		LITERAL_DATA_OUT  : out std_logic_vector(31 downto 0);
		LITERAL_MASK_OUT  : out std_logic_vector(4 downto 0);
		U_DATA_VALID_OUT  : out std_logic);

end SYNC_RAM_REGISTER;

architecture LATCH of SYNC_RAM_REGISTER is

	signal WRITE_ADDRESS_OUT_AUX : std_logic_vector(3 downto 0);
	signal MATCH_TYPE_OUT_AUX    : std_logic_vector(3 downto 0);
	signal LITERAL_DATA_OUT_AUX  : std_logic_vector(31 downto 0);
	signal LITERAL_MASK_OUT_AUX  : std_logic_vector(4 downto 0);
	signal U_DATA_VALID_OUT_AUX  : std_logic;

begin

	FLIP_FLOPS : process(CLK, CLEAR)
	begin
		-- asynchronous RESET signal forces all outputs LOW
		if (CLEAR = '0') then
			WRITE_ADDRESS_OUT_AUX <= "0000";
			MATCH_TYPE_OUT_AUX    <= "1111";
			LITERAL_DATA_OUT_AUX  <= x"11111111";
			LITERAL_MASK_OUT_AUX  <= "11111";
			U_DATA_VALID_OUT_AUX  <= '1';
			-- check for +ve clock edge
		elsif ((CLK'event) and (CLK = '1')) then
			-- check for synchronous clear signal
			if (RESET = '0') then
				WRITE_ADDRESS_OUT_AUX <= "0000";
				MATCH_TYPE_OUT_AUX    <= "1111";
				LITERAL_DATA_OUT_AUX  <= x"11111111";
				LITERAL_MASK_OUT_AUX  <= "11111";
				U_DATA_VALID_OUT_AUX  <= '1';
			elsif ENABLE = '0' then
				WRITE_ADDRESS_OUT_AUX <= WRITE_ADDRESS_IN;
				MATCH_TYPE_OUT_AUX    <= MATCH_TYPE_IN;
				LITERAL_DATA_OUT_AUX  <= LITERAL_DATA_IN;
				LITERAL_MASK_OUT_AUX  <= LITERAL_MASK_IN;
				U_DATA_VALID_OUT_AUX  <= U_DATA_VALID_IN;
			else
				WRITE_ADDRESS_OUT_AUX <= WRITE_ADDRESS_OUT_AUX;
				MATCH_TYPE_OUT_AUX    <= MATCH_TYPE_OUT_AUX;
				LITERAL_DATA_OUT_AUX  <= LITERAL_DATA_OUT_AUX;
				LITERAL_MASK_OUT_AUX  <= LITERAL_MASK_OUT_AUX;
				U_DATA_VALID_OUT_AUX  <= U_DATA_VALID_IN; -- the data valid carries on 
			end if;
		end if;

	end process FLIP_FLOPS;

	WRITE_ADDRESS_OUT <= WRITE_ADDRESS_OUT_AUX;
	MATCH_TYPE_OUT    <= MATCH_TYPE_OUT_AUX;
	LITERAL_DATA_OUT  <= LITERAL_DATA_OUT_AUX;
	LITERAL_MASK_OUT  <= LITERAL_MASK_OUT_AUX;
	U_DATA_VALID_OUT  <= U_DATA_VALID_OUT_AUX; -- the data valid carries on 

end LATCH;

