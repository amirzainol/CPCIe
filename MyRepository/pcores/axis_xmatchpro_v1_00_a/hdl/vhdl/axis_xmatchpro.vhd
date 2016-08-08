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
-- Entity: 			axis_xmatchpro.vhd
-- Version:			1.0
-- Description: This file is the top file for axis_xmatchpro
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
use proc_common_v3_00_a.soft_reset;

library axi_lite_ipif_v1_01_a;
use axi_lite_ipif_v1_01_a.axi_lite_ipif;

library axis_xmatchpro_v1_00_a;
use axis_xmatchpro_v1_00_a.user_logic;

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

entity axis_xmatchpro is
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

 PORT_S_AXIS_CD_IN_TREADY			: out STD_LOGIC;
 PORT_S_AXIS_CD_IN_TDATA			: out  STD_LOGIC_VECTOR(31 DOWNTO 0);
 PORT_S_AXIS_CD_IN_TVALID			: out  STD_LOGIC;
 PORT_S_AXIS_CD_IN_TLAST			: out  STD_LOGIC;
 PORT_M_AXIS_CD_OUT_TREADY			: out  STD_LOGIC;
 PORT_M_AXIS_CD_OUT_TDATA			: out STD_LOGIC_VECTOR(31 DOWNTO 0);
 PORT_M_AXIS_CD_OUT_TVALID			: out STD_LOGIC;
 PORT_M_AXIS_CD_OUT_TLAST			: out STD_LOGIC;

 PORT_S_AXIS_UC_IN_TREADY			: out STD_LOGIC;
 PORT_S_AXIS_UC_IN_TDATA			: out STD_LOGIC_VECTOR(31 DOWNTO 0);
 PORT_S_AXIS_UC_IN_TVALID			: out STD_LOGIC;
 PORT_S_AXIS_UC_IN_TLAST			: out  STD_LOGIC;
 PORT_M_AXIS_UC_OUT_TREADY			: out  STD_LOGIC;
 PORT_M_AXIS_UC_OUT_TDATA			: out STD_LOGIC_VECTOR(31 DOWNTO 0);
 PORT_M_AXIS_UC_OUT_TVALID			: out STD_LOGIC;
 PORT_M_AXIS_UC_OUT_TLAST			: out STD_LOGIC;

	PORT_XMATCH_C_SIZE				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PORT_XMATCH_C_STAT				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PORT_XMATCH_D_SIZE				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PORT_XMATCH_D_STAT				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

	rst_HOST								: IN STD_LOGIC;
	clk_HOST 							: IN STD_LOGIC;
	din_HOST 							: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	wr_en_HOST 							: IN STD_LOGIC;
	rd_en_HOST 							: IN STD_LOGIC;
	dout_HOST 							: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	full_HOST 							: OUT STD_LOGIC;
	empty_HOST 							: OUT STD_LOGIC;

 S_AXIS_UC_IN_TREADY				: out STD_LOGIC;
 S_AXIS_UC_IN_TDATA				: in STD_LOGIC_VECTOR(31 DOWNTO 0);
 S_AXIS_UC_IN_TVALID				: in STD_LOGIC;
 S_AXIS_UC_IN_TLAST				: in  STD_LOGIC;
 M_AXIS_UC_OUT_TREADY			: in  STD_LOGIC;
 M_AXIS_UC_OUT_TDATA				: out STD_LOGIC_VECTOR(31 DOWNTO 0);
 M_AXIS_UC_OUT_TVALID			: out STD_LOGIC;
 M_AXIS_UC_OUT_TLAST				: out STD_LOGIC;

 S_AXIS_CD_IN_TREADY				: out STD_LOGIC;
 S_AXIS_CD_IN_TDATA				: in  STD_LOGIC_VECTOR(31 DOWNTO 0);
 S_AXIS_CD_IN_TVALID				: in  STD_LOGIC;
 S_AXIS_CD_IN_TLAST				: in  STD_LOGIC;
 M_AXIS_CD_OUT_TREADY			: in  STD_LOGIC;
 M_AXIS_CD_OUT_TDATA				: out STD_LOGIC_VECTOR(31 DOWNTO 0);
 M_AXIS_CD_OUT_TVALID			: out STD_LOGIC;
 M_AXIS_CD_OUT_TLAST				: out STD_LOGIC;

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
end entity axis_xmatchpro;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of axis_xmatchpro is

  constant USER_SLV_DWIDTH                : integer              := C_S_AXI_DATA_WIDTH;

  constant IPIF_SLV_DWIDTH                : integer              := C_S_AXI_DATA_WIDTH;

  constant ZERO_ADDR_PAD                  : std_logic_vector(0 to 31) := (others => '0');
  constant RST_BASEADDR                   : std_logic_vector     := C_BASEADDR or X"00000100";
  constant RST_HIGHADDR                   : std_logic_vector     := C_BASEADDR or X"000001FF";
  constant USER_SLV_BASEADDR              : std_logic_vector     := C_BASEADDR or X"00000000";
  constant USER_SLV_HIGHADDR              : std_logic_vector     := C_BASEADDR or X"000000FF";

  constant IPIF_ARD_ADDR_RANGE_ARRAY      : SLV64_ARRAY_TYPE     :=
    (
      ZERO_ADDR_PAD & RST_BASEADDR,       -- soft reset space base address
      ZERO_ADDR_PAD & RST_HIGHADDR,       -- soft reset space high address
      ZERO_ADDR_PAD & USER_SLV_BASEADDR,  -- user logic slave space base address
      ZERO_ADDR_PAD & USER_SLV_HIGHADDR   -- user logic slave space high address
    );

  constant RST_NUM_CE                     : integer              := 1;
  constant USER_SLV_NUM_REG               : integer              := 32;
  constant USER_NUM_REG                   : integer              := USER_SLV_NUM_REG;
  constant TOTAL_IPIF_CE                  : integer              := USER_NUM_REG + RST_NUM_CE;

  constant IPIF_ARD_NUM_CE_ARRAY          : INTEGER_ARRAY_TYPE   :=
    (
      0  => (RST_NUM_CE),                 -- number of ce for soft reset space
      1  => (USER_SLV_NUM_REG)            -- number of ce for user logic slave space
    );

  ------------------------------------------
  -- Width of triggered reset in bus clocks
  ------------------------------------------
  constant RESET_WIDTH                    : integer              := 8;

  ------------------------------------------
  -- Index for CS/CE
  ------------------------------------------
  constant RST_CS_INDEX                   : integer              := 0;
  constant RST_CE_INDEX                   : integer              := USER_NUM_REG;
  constant USER_SLV_CS_INDEX              : integer              := 1;
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
  signal ipif_Bus2IP_Reset              : std_logic;
  signal rst_Bus2IP_Reset               : std_logic;
  signal rst_IP2Bus_WrAck               : std_logic;
  signal rst_IP2Bus_Error               : std_logic;
  signal rst_Bus2IP_Reset_tmp           : std_logic;
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
  -- instantiate soft_reset
  ------------------------------------------
  SOFT_RESET_I : entity proc_common_v3_00_a.soft_reset
    generic map
    (
      C_SIPIF_DWIDTH                 => IPIF_SLV_DWIDTH,
      C_RESET_WIDTH                  => RESET_WIDTH
    )
    port map
    (
      Bus2IP_Reset                   => ipif_Bus2IP_Reset,
      Bus2IP_Clk                     => ipif_Bus2IP_Clk,
      Bus2IP_WrCE                    => ipif_Bus2IP_WrCE(RST_CE_INDEX),
      Bus2IP_Data                    => ipif_Bus2IP_Data,
      Bus2IP_BE                      => ipif_Bus2IP_BE,
      Reset2IP_Reset                 => rst_Bus2IP_Reset,
      Reset2Bus_WrAck                => rst_IP2Bus_WrAck,
      Reset2Bus_Error                => rst_IP2Bus_Error,
      Reset2Bus_ToutSup              => open
    );

  ------------------------------------------
  -- instantiate User Logic
  ------------------------------------------
  USER_LOGIC_I : entity axis_xmatchpro_v1_00_a.user_logic
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

		PORT_S_AXIS_CD_IN_TREADY 		=> PORT_S_AXIS_CD_IN_TREADY,
		PORT_S_AXIS_CD_IN_TDATA  		=> PORT_S_AXIS_CD_IN_TDATA,
		PORT_S_AXIS_CD_IN_TVALID  		=> PORT_S_AXIS_CD_IN_TVALID,
		PORT_S_AXIS_CD_IN_TLAST  		=> PORT_S_AXIS_CD_IN_TLAST,
		PORT_M_AXIS_CD_OUT_TREADY 		=> PORT_M_AXIS_CD_OUT_TREADY,
		PORT_M_AXIS_CD_OUT_TDATA  		=> PORT_M_AXIS_CD_OUT_TDATA,
		PORT_M_AXIS_CD_OUT_TVALID  	=> PORT_M_AXIS_CD_OUT_TVALID,
		PORT_M_AXIS_CD_OUT_TLAST  		=> PORT_M_AXIS_CD_OUT_TLAST,
		PORT_S_AXIS_UC_IN_TREADY 		=> PORT_S_AXIS_UC_IN_TREADY,
		PORT_S_AXIS_UC_IN_TDATA  		=> PORT_S_AXIS_UC_IN_TDATA,
		PORT_S_AXIS_UC_IN_TLAST  		=> PORT_S_AXIS_UC_IN_TLAST,
		PORT_S_AXIS_UC_IN_TVALID  		=> PORT_S_AXIS_UC_IN_TVALID,
		PORT_M_AXIS_UC_OUT_TREADY 		=> PORT_M_AXIS_UC_OUT_TREADY,
		PORT_M_AXIS_UC_OUT_TDATA  		=> PORT_M_AXIS_UC_OUT_TDATA,
		PORT_M_AXIS_UC_OUT_TVALID  	=> PORT_M_AXIS_UC_OUT_TVALID,
		PORT_M_AXIS_UC_OUT_TLAST  		=> PORT_M_AXIS_UC_OUT_TLAST,
	PORT_XMATCH_C_SIZE				=> PORT_XMATCH_C_SIZE,
	PORT_XMATCH_C_STAT				=> PORT_XMATCH_C_STAT,
	PORT_XMATCH_D_SIZE				=> PORT_XMATCH_D_SIZE,
	PORT_XMATCH_D_STAT				=> PORT_XMATCH_D_STAT,
		rst_HOST								=> rst_HOST,
		clk_HOST 							=> clk_HOST,
		din_HOST 							=> din_HOST,
		wr_en_HOST 							=> wr_en_HOST,
		rd_en_HOST 							=> rd_en_HOST,
		dout_HOST 							=> dout_HOST,
		full_HOST 							=> full_HOST,
		empty_HOST 							=> empty_HOST,
		S_AXIS_CD_IN_TREADY 				=> S_AXIS_CD_IN_TREADY,
		S_AXIS_CD_IN_TDATA  				=> S_AXIS_CD_IN_TDATA,
		S_AXIS_CD_IN_TVALID  			=> S_AXIS_CD_IN_TVALID,
		S_AXIS_CD_IN_TLAST  				=> S_AXIS_CD_IN_TLAST,
		M_AXIS_CD_OUT_TREADY 			=> M_AXIS_CD_OUT_TREADY,
		M_AXIS_CD_OUT_TDATA  			=> M_AXIS_CD_OUT_TDATA,
		M_AXIS_CD_OUT_TVALID  			=> M_AXIS_CD_OUT_TVALID,
		M_AXIS_CD_OUT_TLAST  			=> M_AXIS_CD_OUT_TLAST,
		S_AXIS_UC_IN_TREADY 				=> S_AXIS_UC_IN_TREADY,
		S_AXIS_UC_IN_TDATA  				=> S_AXIS_UC_IN_TDATA,
		S_AXIS_UC_IN_TLAST  				=> S_AXIS_UC_IN_TLAST,
		S_AXIS_UC_IN_TVALID  			=> S_AXIS_UC_IN_TVALID,
		M_AXIS_UC_OUT_TREADY 			=> M_AXIS_UC_OUT_TREADY,
		M_AXIS_UC_OUT_TDATA  			=> M_AXIS_UC_OUT_TDATA,
		M_AXIS_UC_OUT_TVALID  			=> M_AXIS_UC_OUT_TVALID,
		M_AXIS_UC_OUT_TLAST  			=> M_AXIS_UC_OUT_TLAST,

      -- MAP USER PORTS ABOVE THIS LINE ------------------

      Bus2IP_Clk                     => ipif_Bus2IP_Clk,
      Bus2IP_Resetn                  => rst_Bus2IP_Reset_tmp,
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
  IP2BUS_DATA_MUX_PROC : process( ipif_Bus2IP_CS, user_IP2Bus_Data ) is
  begin

    case ipif_Bus2IP_CS (1 downto 0)  is
      when "01" => ipif_IP2Bus_Data <= user_IP2Bus_Data;
      when "10" => ipif_IP2Bus_Data <= (others => '0');
      when others => ipif_IP2Bus_Data <= (others => '0');
    end case;

  end process IP2BUS_DATA_MUX_PROC;

  ipif_IP2Bus_WrAck <= user_IP2Bus_WrAck or rst_IP2Bus_WrAck;
  ipif_IP2Bus_RdAck <= user_IP2Bus_RdAck;
  ipif_IP2Bus_Error <= user_IP2Bus_Error or rst_IP2Bus_Error;

  user_Bus2IP_RdCE <= ipif_Bus2IP_RdCE(USER_NUM_REG-1 downto 0);
  user_Bus2IP_WrCE <= ipif_Bus2IP_WrCE(USER_NUM_REG-1 downto 0);

  ipif_Bus2IP_Reset <= not ipif_Bus2IP_Resetn;
  rst_Bus2IP_Reset_tmp <= not rst_Bus2IP_Reset;
end IMP;
