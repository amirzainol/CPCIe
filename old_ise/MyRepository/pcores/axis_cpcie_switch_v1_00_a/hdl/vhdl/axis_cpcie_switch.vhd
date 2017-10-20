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
-- Entity: 			axis_cpcie_switch.vhd
-- Version:			1.0
-- Description: This file is a switch for CPCIe
--
-- Additional Comments:
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.all;
use proc_common_v3_00_a.ipif_pkg.all;

library axi_lite_ipif_v1_01_a;
use axi_lite_ipif_v1_01_a.axi_lite_ipif;

library axis_cpcie_switch_v1_00_a;
use axis_cpcie_switch_v1_00_a.user_logic;

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_S_AXI_DATA_WIDTH           -- AXI4LITE slave: Data width
--   C_S_AXI_ADDR_WIDTH           -- AXI4LITE slave: Address Width
--   C_S_AXI_MIN_SIZE             -- AXI4LITE slave: Min Size
--   C_USE_WSTRB                  -- AXI4LITE slave: Write Strobe
--   C_DPHASE_TIMEOUT             -- AXI4LITE slave: Data Phase Timeout
--   C_BASEADDR                   -- AXI4LITE slave: base address
--   C_HIGHADDR                   -- AXI4LITE slave: high address
--   C_FAMILY                     -- FPGA Family
--   C_NUM_REG                    -- Number of software accessible registers
--   C_NUM_MEM                    -- Number of address-ranges
--   C_SLV_AWIDTH                 -- Slave interface address bus width
--   C_SLV_DWIDTH                 -- Slave interface data bus width
--
-- Definition of Ports:
--   S_AXI_ACLK                   -- AXI4LITE slave: Clock 
--   S_AXI_ARESETN                -- AXI4LITE slave: Reset
--   S_AXI_AWADDR                 -- AXI4LITE slave: Write address
--   S_AXI_AWVALID                -- AXI4LITE slave: Write address valid
--   S_AXI_WDATA                  -- AXI4LITE slave: Write data
--   S_AXI_WSTRB                  -- AXI4LITE slave: Write strobe
--   S_AXI_WVALID                 -- AXI4LITE slave: Write data valid
--   S_AXI_BREADY                 -- AXI4LITE slave: Response ready
--   S_AXI_ARADDR                 -- AXI4LITE slave: Read address
--   S_AXI_ARVALID                -- AXI4LITE slave: Read address valid
--   S_AXI_RREADY                 -- AXI4LITE slave: Read data ready
--   S_AXI_ARREADY                -- AXI4LITE slave: read addres ready
--   S_AXI_RDATA                  -- AXI4LITE slave: Read data
--   S_AXI_RRESP                  -- AXI4LITE slave: Read data response
--   S_AXI_RVALID                 -- AXI4LITE slave: Read data valid
--   S_AXI_WREADY                 -- AXI4LITE slave: Write data ready
--   S_AXI_BRESP                  -- AXI4LITE slave: Response
--   S_AXI_BVALID                 -- AXI4LITE slave: Resonse valid
--   S_AXI_AWREADY                -- AXI4LITE slave: Wrte address ready
------------------------------------------------------------------------------

entity axis_cpcie_switch is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    --USER generics added here
    -- ADD USER GENERICS ABOVE THIS LINE ---------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_S_AXI_DATA_WIDTH             : integer              := 32;
    C_S_AXI_ADDR_WIDTH             : integer              := 32;
    C_S_AXI_MIN_SIZE               : std_logic_vector     := X"000001FF";
    C_USE_WSTRB                    : integer              := 0;
    C_DPHASE_TIMEOUT               : integer              := 8;
    C_BASEADDR                     : std_logic_vector     := X"FFFFFFFF";
    C_HIGHADDR                     : std_logic_vector     := X"00000000";
    C_FAMILY                       : string               := "virtex6";
    C_NUM_REG                      : integer              := 1;
    C_NUM_MEM                      : integer              := 1;
    C_SLV_AWIDTH                   : integer              := 32;
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
    S_AXI_ACLK                     : in  std_logic;
    S_AXI_ARESETN                  : in  std_logic;
    S_AXI_AWADDR                   : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWVALID                  : in  std_logic;
    S_AXI_WDATA                    : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB                    : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID                   : in  std_logic;
    S_AXI_BREADY                   : in  std_logic;
    S_AXI_ARADDR                   : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARVALID                  : in  std_logic;
    S_AXI_RREADY                   : in  std_logic;
    S_AXI_ARREADY                  : out std_logic;
    S_AXI_RDATA                    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP                    : out std_logic_vector(1 downto 0);
    S_AXI_RVALID                   : out std_logic;
    S_AXI_WREADY                   : out std_logic;
    S_AXI_BRESP                    : out std_logic_vector(1 downto 0);
    S_AXI_BVALID                   : out std_logic;
    S_AXI_AWREADY                  : out std_logic
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );

  attribute MAX_FANOUT : string;
  attribute SIGIS : string;
  attribute MAX_FANOUT of S_AXI_ACLK       : signal is "10000";
  attribute MAX_FANOUT of S_AXI_ARESETN       : signal is "10000";
  attribute SIGIS of S_AXI_ACLK       : signal is "Clk";
  attribute SIGIS of S_AXI_ARESETN       : signal is "Rst";
end entity axis_cpcie_switch;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of axis_cpcie_switch is

  constant USER_SLV_DWIDTH                : integer              := C_S_AXI_DATA_WIDTH;

  constant IPIF_SLV_DWIDTH                : integer              := C_S_AXI_DATA_WIDTH;

  constant ZERO_ADDR_PAD                  : std_logic_vector(0 to 31) := (others => '0');
  constant USER_SLV_BASEADDR              : std_logic_vector     := C_BASEADDR;
  constant USER_SLV_HIGHADDR              : std_logic_vector     := C_HIGHADDR;

  constant IPIF_ARD_ADDR_RANGE_ARRAY      : SLV64_ARRAY_TYPE     := 
    (
      ZERO_ADDR_PAD & USER_SLV_BASEADDR,  -- user logic slave space base address
      ZERO_ADDR_PAD & USER_SLV_HIGHADDR   -- user logic slave space high address
    );

  constant USER_SLV_NUM_REG               : integer              := 1;
  constant USER_NUM_REG                   : integer              := USER_SLV_NUM_REG;
  constant TOTAL_IPIF_CE                  : integer              := USER_NUM_REG;

  constant IPIF_ARD_NUM_CE_ARRAY          : INTEGER_ARRAY_TYPE   := 
    (
      0  => (USER_SLV_NUM_REG)            -- number of ce for user logic slave space
    );

  ------------------------------------------
  -- Index for CS/CE
  ------------------------------------------
  constant USER_SLV_CS_INDEX              : integer              := 0;
  constant USER_SLV_CE_INDEX              : integer              := calc_start_ce_index(IPIF_ARD_NUM_CE_ARRAY, USER_SLV_CS_INDEX);

  constant USER_CE_INDEX                  : integer              := USER_SLV_CE_INDEX;

  ------------------------------------------
  -- IP Interconnect (IPIC) signal declarations
  ------------------------------------------
  signal ipif_Bus2IP_Clk                : std_logic;
  signal ipif_Bus2IP_Resetn             : std_logic;
  signal ipif_Bus2IP_Addr               : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  signal ipif_Bus2IP_RNW                : std_logic;
  signal ipif_Bus2IP_BE                 : std_logic_vector(IPIF_SLV_DWIDTH/8-1 downto 0);
  signal ipif_Bus2IP_CS                 : std_logic_vector((IPIF_ARD_ADDR_RANGE_ARRAY'LENGTH)/2-1 downto 0);
  signal ipif_Bus2IP_RdCE               : std_logic_vector(calc_num_ce(IPIF_ARD_NUM_CE_ARRAY)-1 downto 0);
  signal ipif_Bus2IP_WrCE               : std_logic_vector(calc_num_ce(IPIF_ARD_NUM_CE_ARRAY)-1 downto 0);
  signal ipif_Bus2IP_Data               : std_logic_vector(IPIF_SLV_DWIDTH-1 downto 0);
  signal ipif_IP2Bus_WrAck              : std_logic;
  signal ipif_IP2Bus_RdAck              : std_logic;
  signal ipif_IP2Bus_Error              : std_logic;
  signal ipif_IP2Bus_Data               : std_logic_vector(IPIF_SLV_DWIDTH-1 downto 0);
  signal user_Bus2IP_RdCE               : std_logic_vector(USER_NUM_REG-1 downto 0);
  signal user_Bus2IP_WrCE               : std_logic_vector(USER_NUM_REG-1 downto 0);
  signal user_IP2Bus_Data               : std_logic_vector(USER_SLV_DWIDTH-1 downto 0);
  signal user_IP2Bus_RdAck              : std_logic;
  signal user_IP2Bus_WrAck              : std_logic;
  signal user_IP2Bus_Error              : std_logic;

begin

  ------------------------------------------
  -- instantiate axi_lite_ipif
  ------------------------------------------
  AXI_LITE_IPIF_I : entity axi_lite_ipif_v1_01_a.axi_lite_ipif
    generic map
    (
      C_S_AXI_DATA_WIDTH             => IPIF_SLV_DWIDTH,
      C_S_AXI_ADDR_WIDTH             => C_S_AXI_ADDR_WIDTH,
      C_S_AXI_MIN_SIZE               => C_S_AXI_MIN_SIZE,
      C_USE_WSTRB                    => C_USE_WSTRB,
      C_DPHASE_TIMEOUT               => C_DPHASE_TIMEOUT,
      C_ARD_ADDR_RANGE_ARRAY         => IPIF_ARD_ADDR_RANGE_ARRAY,
      C_ARD_NUM_CE_ARRAY             => IPIF_ARD_NUM_CE_ARRAY,
      C_FAMILY                       => C_FAMILY
    )
    port map
    (
      S_AXI_ACLK                     => S_AXI_ACLK,
      S_AXI_ARESETN                  => S_AXI_ARESETN,
      S_AXI_AWADDR                   => S_AXI_AWADDR,
      S_AXI_AWVALID                  => S_AXI_AWVALID,
      S_AXI_WDATA                    => S_AXI_WDATA,
      S_AXI_WSTRB                    => S_AXI_WSTRB,
      S_AXI_WVALID                   => S_AXI_WVALID,
      S_AXI_BREADY                   => S_AXI_BREADY,
      S_AXI_ARADDR                   => S_AXI_ARADDR,
      S_AXI_ARVALID                  => S_AXI_ARVALID,
      S_AXI_RREADY                   => S_AXI_RREADY,
      S_AXI_ARREADY                  => S_AXI_ARREADY,
      S_AXI_RDATA                    => S_AXI_RDATA,
      S_AXI_RRESP                    => S_AXI_RRESP,
      S_AXI_RVALID                   => S_AXI_RVALID,
      S_AXI_WREADY                   => S_AXI_WREADY,
      S_AXI_BRESP                    => S_AXI_BRESP,
      S_AXI_BVALID                   => S_AXI_BVALID,
      S_AXI_AWREADY                  => S_AXI_AWREADY,
      Bus2IP_Clk                     => ipif_Bus2IP_Clk,
      Bus2IP_Resetn                  => ipif_Bus2IP_Resetn,
      Bus2IP_Addr                    => ipif_Bus2IP_Addr,
      Bus2IP_RNW                     => ipif_Bus2IP_RNW,
      Bus2IP_BE                      => ipif_Bus2IP_BE,
      Bus2IP_CS                      => ipif_Bus2IP_CS,
      Bus2IP_RdCE                    => ipif_Bus2IP_RdCE,
      Bus2IP_WrCE                    => ipif_Bus2IP_WrCE,
      Bus2IP_Data                    => ipif_Bus2IP_Data,
      IP2Bus_WrAck                   => ipif_IP2Bus_WrAck,
      IP2Bus_RdAck                   => ipif_IP2Bus_RdAck,
      IP2Bus_Error                   => ipif_IP2Bus_Error,
      IP2Bus_Data                    => ipif_IP2Bus_Data
    );

  ------------------------------------------
  -- instantiate User Logic
  ------------------------------------------
  USER_LOGIC_I : entity axis_cpcie_switch_v1_00_a.user_logic
    generic map
    (
      -- MAP USER GENERICS BELOW THIS LINE ---------------
      --USER generics mapped here
      -- MAP USER GENERICS ABOVE THIS LINE ---------------

      C_NUM_REG                      => USER_NUM_REG,
      C_SLV_DWIDTH                   => USER_SLV_DWIDTH
    )
    port map
    (
      -- MAP USER PORTS BELOW THIS LINE ------------------
		S_AXIS_CH0_TREADY	=> S_AXIS_CH0_TREADY,
		S_AXIS_CH0_TDATA	=> S_AXIS_CH0_TDATA,
		S_AXIS_CH0_TLAST	=> S_AXIS_CH0_TLAST,
		S_AXIS_CH0_TVALID	=> S_AXIS_CH0_TVALID,
		M_AXIS_CH0_TVALID	=> M_AXIS_CH0_TVALID,
		M_AXIS_CH0_TDATA	=> M_AXIS_CH0_TDATA,
		M_AXIS_CH0_TLAST	=> M_AXIS_CH0_TLAST,
		M_AXIS_CH0_TREADY	=> M_AXIS_CH0_TREADY,
		S_AXIS_CH1_TREADY	=> S_AXIS_CH1_TREADY,
		S_AXIS_CH1_TDATA	=> S_AXIS_CH1_TDATA,
		S_AXIS_CH1_TLAST	=> S_AXIS_CH1_TLAST,
		S_AXIS_CH1_TVALID	=> S_AXIS_CH1_TVALID,
		M_AXIS_CH1_TVALID	=> M_AXIS_CH1_TVALID,
		M_AXIS_CH1_TDATA	=> M_AXIS_CH1_TDATA,
		M_AXIS_CH1_TLAST	=> M_AXIS_CH1_TLAST,
		M_AXIS_CH1_TREADY	=> M_AXIS_CH1_TREADY,
		S_AXIS_CH2_TREADY	=> S_AXIS_CH2_TREADY,
		S_AXIS_CH2_TDATA	=> S_AXIS_CH2_TDATA,
		S_AXIS_CH2_TLAST	=> S_AXIS_CH2_TLAST,
		S_AXIS_CH2_TVALID	=> S_AXIS_CH2_TVALID,
		M_AXIS_CH2_TVALID	=> M_AXIS_CH2_TVALID,
		M_AXIS_CH2_TDATA	=> M_AXIS_CH2_TDATA,
		M_AXIS_CH2_TLAST	=> M_AXIS_CH2_TLAST,
		M_AXIS_CH2_TREADY	=> M_AXIS_CH2_TREADY,
		S_AXIS_CH3_TREADY	=> S_AXIS_CH3_TREADY,
		S_AXIS_CH3_TDATA	=> S_AXIS_CH3_TDATA,
		S_AXIS_CH3_TLAST	=> S_AXIS_CH3_TLAST,
		S_AXIS_CH3_TVALID	=> S_AXIS_CH3_TVALID,
		M_AXIS_CH3_TVALID	=> M_AXIS_CH3_TVALID,
		M_AXIS_CH3_TDATA	=> M_AXIS_CH3_TDATA,
		M_AXIS_CH3_TLAST	=> M_AXIS_CH3_TLAST,
		M_AXIS_CH3_TREADY	=> M_AXIS_CH3_TREADY,
		S_AXIS_CH4_TREADY	=> S_AXIS_CH4_TREADY,
		S_AXIS_CH4_TDATA	=> S_AXIS_CH4_TDATA,
		S_AXIS_CH4_TLAST	=> S_AXIS_CH4_TLAST,
		S_AXIS_CH4_TVALID	=> S_AXIS_CH4_TVALID,
		M_AXIS_CH4_TVALID	=> M_AXIS_CH4_TVALID,
		M_AXIS_CH4_TDATA	=> M_AXIS_CH4_TDATA,
		M_AXIS_CH4_TLAST	=> M_AXIS_CH4_TLAST,
		M_AXIS_CH4_TREADY	=> M_AXIS_CH4_TREADY,
		S_AXIS_CH5_TREADY	=> S_AXIS_CH5_TREADY,
		S_AXIS_CH5_TDATA	=> S_AXIS_CH5_TDATA,
		S_AXIS_CH5_TLAST	=> S_AXIS_CH5_TLAST,
		S_AXIS_CH5_TVALID	=> S_AXIS_CH5_TVALID,
		M_AXIS_CH5_TVALID	=> M_AXIS_CH5_TVALID,
		M_AXIS_CH5_TDATA	=> M_AXIS_CH5_TDATA,
		M_AXIS_CH5_TLAST	=> M_AXIS_CH5_TLAST,
		M_AXIS_CH5_TREADY	=> M_AXIS_CH5_TREADY,
		S_AXIS_CH6_TREADY	=> S_AXIS_CH6_TREADY,
		S_AXIS_CH6_TDATA	=> S_AXIS_CH6_TDATA,
		S_AXIS_CH6_TLAST	=> S_AXIS_CH6_TLAST,
		S_AXIS_CH6_TVALID	=> S_AXIS_CH6_TVALID,
		M_AXIS_CH6_TVALID	=> M_AXIS_CH6_TVALID,
		M_AXIS_CH6_TDATA	=> M_AXIS_CH6_TDATA,
		M_AXIS_CH6_TLAST	=> M_AXIS_CH6_TLAST,
		M_AXIS_CH6_TREADY	=> M_AXIS_CH6_TREADY,
		S_AXIS_CH7_TREADY	=> S_AXIS_CH7_TREADY,
		S_AXIS_CH7_TDATA	=> S_AXIS_CH7_TDATA,
		S_AXIS_CH7_TLAST	=> S_AXIS_CH7_TLAST,
		S_AXIS_CH7_TVALID	=> S_AXIS_CH7_TVALID,
		M_AXIS_CH7_TVALID	=> M_AXIS_CH7_TVALID,
		M_AXIS_CH7_TDATA	=> M_AXIS_CH7_TDATA,
		M_AXIS_CH7_TLAST	=> M_AXIS_CH7_TLAST,
		M_AXIS_CH7_TREADY	=> M_AXIS_CH7_TREADY,
      -- MAP USER PORTS ABOVE THIS LINE ------------------

      Bus2IP_Clk                     => ipif_Bus2IP_Clk,
      Bus2IP_Resetn                  => ipif_Bus2IP_Resetn,
      Bus2IP_Data                    => ipif_Bus2IP_Data,
      Bus2IP_BE                      => ipif_Bus2IP_BE,
      Bus2IP_RdCE                    => user_Bus2IP_RdCE,
      Bus2IP_WrCE                    => user_Bus2IP_WrCE,
      IP2Bus_Data                    => user_IP2Bus_Data,
      IP2Bus_RdAck                   => user_IP2Bus_RdAck,
      IP2Bus_WrAck                   => user_IP2Bus_WrAck,
      IP2Bus_Error                   => user_IP2Bus_Error
    );

  ------------------------------------------
  -- connect internal signals
  ------------------------------------------
  ipif_IP2Bus_Data <= user_IP2Bus_Data;
  ipif_IP2Bus_WrAck <= user_IP2Bus_WrAck;
  ipif_IP2Bus_RdAck <= user_IP2Bus_RdAck;
  ipif_IP2Bus_Error <= user_IP2Bus_Error;

  user_Bus2IP_RdCE <= ipif_Bus2IP_RdCE(USER_NUM_REG-1 downto 0);
  user_Bus2IP_WrCE <= ipif_Bus2IP_WrCE(USER_NUM_REG-1 downto 0);

end IMP;
