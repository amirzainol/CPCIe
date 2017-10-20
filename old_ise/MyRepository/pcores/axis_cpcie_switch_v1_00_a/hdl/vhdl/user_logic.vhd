-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
-- Author: 			Mohd Amiruddin Zainol (mohd.a.zainol@gmail.com)
-- Entity: 			user_logic.vhd
-- Version:			1.0
-- Description: This file is the user_logic for CPCIe Switch
--
-- Additional Comments:
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- DO NOT EDIT BELOW THIS LINE --------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.all;

-- DO NOT EDIT ABOVE THIS LINE --------------------

--USER libraries added here

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_NUM_REG                    -- Number of software accessible registers
--   C_SLV_DWIDTH                 -- Slave interface data bus width
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Resetn                -- Bus to IP reset
--   Bus2IP_Data                  -- Bus to IP data bus
--   Bus2IP_BE                    -- Bus to IP byte enables
--   Bus2IP_RdCE                  -- Bus to IP read chip enable
--   Bus2IP_WrCE                  -- Bus to IP write chip enable
--   IP2Bus_Data                  -- IP to Bus data bus
--   IP2Bus_RdAck                 -- IP to Bus read transfer acknowledgement
--   IP2Bus_WrAck                 -- IP to Bus write transfer acknowledgement
--   IP2Bus_Error                 -- IP to Bus error response
------------------------------------------------------------------------------

entity user_logic is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    --USER generics added here
    -- ADD USER GENERICS ABOVE THIS LINE ---------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_NUM_REG                      : integer              := 1;
    C_SLV_DWIDTH                   : integer              := 32
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
  port
  (
    -- ADD USER PORTS BELOW THIS LINE ------------------
		S_AXIS_CH0_TREADY	: out	std_logic;
		S_AXIS_CH0_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH0_TLAST	: in	std_logic;
		S_AXIS_CH0_TVALID	: in	std_logic;
		M_AXIS_CH0_TVALID	: out	std_logic;
		M_AXIS_CH0_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH0_TLAST	: out	std_logic;
		M_AXIS_CH0_TREADY	: in	std_logic;
		S_AXIS_CH1_TREADY	: out	std_logic;
		S_AXIS_CH1_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH1_TLAST	: in	std_logic;
		S_AXIS_CH1_TVALID	: in	std_logic;
		M_AXIS_CH1_TVALID	: out	std_logic;
		M_AXIS_CH1_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH1_TLAST	: out	std_logic;
		M_AXIS_CH1_TREADY	: in	std_logic;
		S_AXIS_CH2_TREADY	: out	std_logic;
		S_AXIS_CH2_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH2_TLAST	: in	std_logic;
		S_AXIS_CH2_TVALID	: in	std_logic;
		M_AXIS_CH2_TVALID	: out	std_logic;
		M_AXIS_CH2_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH2_TLAST	: out	std_logic;
		M_AXIS_CH2_TREADY	: in	std_logic;
		S_AXIS_CH3_TREADY	: out	std_logic;
		S_AXIS_CH3_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH3_TLAST	: in	std_logic;
		S_AXIS_CH3_TVALID	: in	std_logic;
		M_AXIS_CH3_TVALID	: out	std_logic;
		M_AXIS_CH3_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH3_TLAST	: out	std_logic;
		M_AXIS_CH3_TREADY	: in	std_logic;
		S_AXIS_CH4_TREADY	: out	std_logic;
		S_AXIS_CH4_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH4_TLAST	: in	std_logic;
		S_AXIS_CH4_TVALID	: in	std_logic;
		M_AXIS_CH4_TVALID	: out	std_logic;
		M_AXIS_CH4_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH4_TLAST	: out	std_logic;
		M_AXIS_CH4_TREADY	: in	std_logic;
		S_AXIS_CH5_TREADY	: out	std_logic;
		S_AXIS_CH5_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH5_TLAST	: in	std_logic;
		S_AXIS_CH5_TVALID	: in	std_logic;
		M_AXIS_CH5_TVALID	: out	std_logic;
		M_AXIS_CH5_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH5_TLAST	: out	std_logic;
		M_AXIS_CH5_TREADY	: in	std_logic;
		S_AXIS_CH6_TREADY	: out	std_logic;
		S_AXIS_CH6_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH6_TLAST	: in	std_logic;
		S_AXIS_CH6_TVALID	: in	std_logic;
		M_AXIS_CH6_TVALID	: out	std_logic;
		M_AXIS_CH6_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH6_TLAST	: out	std_logic;
		M_AXIS_CH6_TREADY	: in	std_logic;
		S_AXIS_CH7_TREADY	: out	std_logic;
		S_AXIS_CH7_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_CH7_TLAST	: in	std_logic;
		S_AXIS_CH7_TVALID	: in	std_logic;
		M_AXIS_CH7_TVALID	: out	std_logic;
		M_AXIS_CH7_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_CH7_TLAST	: out	std_logic;
		M_AXIS_CH7_TREADY	: in	std_logic;
    -- ADD USER PORTS ABOVE THIS LINE ------------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol ports, do not add to or delete
    Bus2IP_Clk                     : in  std_logic;
    Bus2IP_Resetn                  : in  std_logic;
    Bus2IP_Data                    : in  std_logic_vector(C_SLV_DWIDTH-1 downto 0);
    Bus2IP_BE                      : in  std_logic_vector(C_SLV_DWIDTH/8-1 downto 0);
    Bus2IP_RdCE                    : in  std_logic_vector(C_NUM_REG-1 downto 0);
    Bus2IP_WrCE                    : in  std_logic_vector(C_NUM_REG-1 downto 0);
    IP2Bus_Data                    : out std_logic_vector(C_SLV_DWIDTH-1 downto 0);
    IP2Bus_RdAck                   : out std_logic;
    IP2Bus_WrAck                   : out std_logic;
    IP2Bus_Error                   : out std_logic
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );

  attribute MAX_FANOUT : string;
  attribute SIGIS : string;

  attribute SIGIS of Bus2IP_Clk    : signal is "CLK";
  attribute SIGIS of Bus2IP_Resetn : signal is "RST";

end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

  --USER signal declarations added here, as needed for user logic

  ------------------------------------------
  -- Signals for user logic slave model s/w accessible register example
  ------------------------------------------
  signal slv_reg0                       : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal slv_reg_write_sel              : std_logic_vector(0 to 0);
  signal slv_reg_read_sel               : std_logic_vector(0 to 0);
  signal slv_ip2bus_data                : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal slv_read_ack                   : std_logic;
  signal slv_write_ack                  : std_logic;

begin

	M_AXIS_CH0_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0( 2 downto  0) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0( 2 downto  0) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0( 2 downto  0) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0( 2 downto  0) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0( 2 downto  0) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0( 2 downto  0) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0( 2 downto  0) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0( 2 downto  0) = "000") else
							S_AXIS_CH0_TVALID;
	M_AXIS_CH0_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0( 2 downto  0) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0( 2 downto  0) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0( 2 downto  0) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0( 2 downto  0) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0( 2 downto  0) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0( 2 downto  0) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0( 2 downto  0) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0( 2 downto  0) = "000") else
							S_AXIS_CH0_TDATA;
	M_AXIS_CH0_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0( 2 downto  0) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0( 2 downto  0) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0( 2 downto  0) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0( 2 downto  0) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0( 2 downto  0) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0( 2 downto  0) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0( 2 downto  0) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0( 2 downto  0) = "000") else
							S_AXIS_CH0_TLAST;
							
	M_AXIS_CH1_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0( 6 downto  4) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0( 6 downto  4) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0( 6 downto  4) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0( 6 downto  4) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0( 6 downto  4) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0( 6 downto  4) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0( 6 downto  4) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0( 6 downto  4) = "000") else
							S_AXIS_CH1_TVALID;
	M_AXIS_CH1_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0( 6 downto  4) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0( 6 downto  4) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0( 6 downto  4) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0( 6 downto  4) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0( 6 downto  4) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0( 6 downto  4) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0( 6 downto  4) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0( 6 downto  4) = "000") else
							S_AXIS_CH1_TDATA;
	M_AXIS_CH1_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0( 6 downto  4) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0( 6 downto  4) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0( 6 downto  4) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0( 6 downto  4) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0( 6 downto  4) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0( 6 downto  4) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0( 6 downto  4) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0( 6 downto  4) = "000") else
							S_AXIS_CH1_TLAST;

	M_AXIS_CH2_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0(10 downto  8) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0(10 downto  8) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0(10 downto  8) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0(10 downto  8) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0(10 downto  8) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0(10 downto  8) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0(10 downto  8) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0(10 downto  8) = "000") else
							S_AXIS_CH2_TVALID;
	M_AXIS_CH2_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0(10 downto  8) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0(10 downto  8) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0(10 downto  8) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0(10 downto  8) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0(10 downto  8) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0(10 downto  8) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0(10 downto  8) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0(10 downto  8) = "000") else
							S_AXIS_CH2_TDATA;
	M_AXIS_CH2_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0(10 downto  8) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0(10 downto  8) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0(10 downto  8) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0(10 downto  8) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0(10 downto  8) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0(10 downto  8) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0(10 downto  8) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0(10 downto  8) = "000") else
							S_AXIS_CH2_TLAST;

	M_AXIS_CH3_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0(14 downto 12) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0(14 downto 12) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0(14 downto 12) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0(14 downto 12) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0(14 downto 12) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0(14 downto 12) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0(14 downto 12) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0(14 downto 12) = "000") else
							S_AXIS_CH3_TVALID;
	M_AXIS_CH3_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0(14 downto 12) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0(14 downto 12) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0(14 downto 12) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0(14 downto 12) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0(14 downto 12) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0(14 downto 12) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0(14 downto 12) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0(14 downto 12) = "000") else
							S_AXIS_CH3_TDATA;
	M_AXIS_CH3_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0(14 downto 12) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0(14 downto 12) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0(14 downto 12) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0(14 downto 12) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0(14 downto 12) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0(14 downto 12) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0(14 downto 12) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0(14 downto 12) = "000") else
							S_AXIS_CH3_TLAST;
							
	M_AXIS_CH4_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0(18 downto 16) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0(18 downto 16) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0(18 downto 16) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0(18 downto 16) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0(18 downto 16) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0(18 downto 16) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0(18 downto 16) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0(18 downto 16) = "000") else
							S_AXIS_CH4_TVALID;
	M_AXIS_CH4_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0(18 downto 16) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0(18 downto 16) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0(18 downto 16) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0(18 downto 16) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0(18 downto 16) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0(18 downto 16) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0(18 downto 16) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0(18 downto 16) = "000") else
							S_AXIS_CH4_TDATA;
	M_AXIS_CH4_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0(18 downto 16) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0(18 downto 16) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0(18 downto 16) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0(18 downto 16) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0(18 downto 16) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0(18 downto 16) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0(18 downto 16) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0(18 downto 16) = "000") else
							S_AXIS_CH4_TLAST;

	M_AXIS_CH5_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0(22 downto 20) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0(22 downto 20) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0(22 downto 20) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0(22 downto 20) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0(22 downto 20) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0(22 downto 20) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0(22 downto 20) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0(22 downto 20) = "000") else
							S_AXIS_CH5_TVALID;
	M_AXIS_CH5_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0(22 downto 20) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0(22 downto 20) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0(22 downto 20) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0(22 downto 20) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0(22 downto 20) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0(22 downto 20) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0(22 downto 20) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0(22 downto 20) = "000") else
							S_AXIS_CH5_TDATA;
	M_AXIS_CH5_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0(22 downto 20) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0(22 downto 20) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0(22 downto 20) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0(22 downto 20) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0(22 downto 20) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0(22 downto 20) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0(22 downto 20) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0(22 downto 20) = "000") else
							S_AXIS_CH5_TLAST;
							
	M_AXIS_CH6_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0(26 downto 24) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0(26 downto 24) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0(26 downto 24) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0(26 downto 24) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0(26 downto 24) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0(26 downto 24) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0(26 downto 24) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0(26 downto 24) = "000") else
							S_AXIS_CH6_TVALID;
	M_AXIS_CH6_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0(26 downto 24) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0(26 downto 24) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0(26 downto 24) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0(26 downto 24) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0(26 downto 24) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0(26 downto 24) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0(26 downto 24) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0(26 downto 24) = "000") else
							S_AXIS_CH6_TDATA;
	M_AXIS_CH6_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0(26 downto 24) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0(26 downto 24) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0(26 downto 24) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0(26 downto 24) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0(26 downto 24) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0(26 downto 24) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0(26 downto 24) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0(26 downto 24) = "000") else
							S_AXIS_CH6_TLAST;
							
	M_AXIS_CH7_TVALID	<= 	S_AXIS_CH7_TVALID when (slv_reg0(30 downto 28) = "111") else
							S_AXIS_CH6_TVALID when (slv_reg0(30 downto 28) = "110") else
							S_AXIS_CH5_TVALID when (slv_reg0(30 downto 28) = "101") else
							S_AXIS_CH4_TVALID when (slv_reg0(30 downto 28) = "100") else
							S_AXIS_CH3_TVALID when (slv_reg0(30 downto 28) = "011") else
							S_AXIS_CH2_TVALID when (slv_reg0(30 downto 28) = "010") else
							S_AXIS_CH1_TVALID when (slv_reg0(30 downto 28) = "001") else
							S_AXIS_CH0_TVALID when (slv_reg0(30 downto 28) = "000") else
							S_AXIS_CH7_TVALID;
	M_AXIS_CH7_TDATA	<= 	S_AXIS_CH7_TDATA when (slv_reg0(30 downto 28) = "111") else
							S_AXIS_CH6_TDATA when (slv_reg0(30 downto 28) = "110") else
							S_AXIS_CH5_TDATA when (slv_reg0(30 downto 28) = "101") else
							S_AXIS_CH4_TDATA when (slv_reg0(30 downto 28) = "100") else
							S_AXIS_CH3_TDATA when (slv_reg0(30 downto 28) = "011") else
							S_AXIS_CH2_TDATA when (slv_reg0(30 downto 28) = "010") else
							S_AXIS_CH1_TDATA when (slv_reg0(30 downto 28) = "001") else
							S_AXIS_CH0_TDATA when (slv_reg0(30 downto 28) = "000") else
							S_AXIS_CH7_TDATA;
	M_AXIS_CH7_TLAST	<= 	S_AXIS_CH7_TLAST when (slv_reg0(30 downto 28) = "111") else
							S_AXIS_CH6_TLAST when (slv_reg0(30 downto 28) = "110") else
							S_AXIS_CH5_TLAST when (slv_reg0(30 downto 28) = "101") else
							S_AXIS_CH4_TLAST when (slv_reg0(30 downto 28) = "100") else
							S_AXIS_CH3_TLAST when (slv_reg0(30 downto 28) = "011") else
							S_AXIS_CH2_TLAST when (slv_reg0(30 downto 28) = "010") else
							S_AXIS_CH1_TLAST when (slv_reg0(30 downto 28) = "001") else
							S_AXIS_CH0_TLAST when (slv_reg0(30 downto 28) = "000") else
							S_AXIS_CH7_TLAST;

	S_AXIS_CH0_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "000") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "000") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "000") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "000") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "000") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "000") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "000") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "000") else
							M_AXIS_CH0_TREADY;
							
	S_AXIS_CH1_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "001") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "001") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "001") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "001") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "001") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "001") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "001") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "001") else
							M_AXIS_CH1_TREADY;
							
	S_AXIS_CH2_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "010") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "010") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "010") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "010") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "010") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "010") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "010") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "010") else
							M_AXIS_CH2_TREADY;

	S_AXIS_CH3_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "011") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "011") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "011") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "011") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "011") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "011") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "011") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "011") else
							M_AXIS_CH3_TREADY;
							
	S_AXIS_CH4_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "100") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "100") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "100") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "100") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "100") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "100") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "100") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "100") else
							M_AXIS_CH4_TREADY;
							
	S_AXIS_CH5_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "101") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "101") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "101") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "101") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "101") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "101") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "101") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "101") else
							M_AXIS_CH5_TREADY;
							
	S_AXIS_CH6_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "110") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "110") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "110") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "110") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "110") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "110") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "110") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "110") else
							M_AXIS_CH6_TREADY;

	S_AXIS_CH7_TREADY	<= 	M_AXIS_CH7_TREADY when (slv_reg0(30 downto 28) = "111") else
							M_AXIS_CH6_TREADY when (slv_reg0(26 downto 24) = "111") else
							M_AXIS_CH5_TREADY when (slv_reg0(22 downto 20) = "111") else
							M_AXIS_CH4_TREADY when (slv_reg0(18 downto 16) = "111") else
							M_AXIS_CH3_TREADY when (slv_reg0(14 downto 12) = "111") else
							M_AXIS_CH2_TREADY when (slv_reg0(10 downto  8) = "111") else
							M_AXIS_CH1_TREADY when (slv_reg0( 6 downto  4) = "111") else
							M_AXIS_CH0_TREADY when (slv_reg0( 2 downto  0) = "111") else
							M_AXIS_CH7_TREADY;
							
  slv_reg_write_sel <= Bus2IP_WrCE(0 downto 0);
  slv_reg_read_sel  <= Bus2IP_RdCE(0 downto 0);
  slv_write_ack     <= Bus2IP_WrCE(0);
  slv_read_ack      <= Bus2IP_RdCE(0);

  -- implement slave model software accessible register(s)
  SLAVE_REG_WRITE_PROC : process( Bus2IP_Clk ) is
  begin

    if Bus2IP_Clk'event and Bus2IP_Clk = '1' then
      if Bus2IP_Resetn = '0' then
        slv_reg0 <= (others => '0');
      else
        case slv_reg_write_sel is
          when "1" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg0(byte_index*8+7 downto byte_index*8) <= Bus2IP_Data(byte_index*8+7 downto byte_index*8);
              end if;
            end loop;
          when others => null;
        end case;
      end if;
    end if;

  end process SLAVE_REG_WRITE_PROC;

  -- implement slave model software accessible register(s) read mux
  SLAVE_REG_READ_PROC : process( slv_reg_read_sel, slv_reg0 ) is
  begin

    case slv_reg_read_sel is
      when "1" => slv_ip2bus_data <= slv_reg0;
      when others => slv_ip2bus_data <= (others => '0');
    end case;

  end process SLAVE_REG_READ_PROC;

  ------------------------------------------
  -- Example code to drive IP to Bus signals
  ------------------------------------------
  IP2Bus_Data  <= slv_ip2bus_data when slv_read_ack = '1' else
                  (others => '0');

  IP2Bus_WrAck <= slv_write_ack;
  IP2Bus_RdAck <= slv_read_ack;
  IP2Bus_Error <= '0';

end IMP;
