library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity cpcie_top is
  port (
    PCIE_PERST_B_LS : IN std_logic;
    PCIE_REFCLK_N : IN std_logic;
    PCIE_REFCLK_P : IN std_logic;
    PCIE_RX_N : IN std_logic_vector(7 DOWNTO 0);
    PCIE_RX_P : IN std_logic_vector(7 DOWNTO 0);
    GPIO_LED : OUT std_logic_vector(3 DOWNTO 0);
    PCIE_TX_N : OUT std_logic_vector(7 DOWNTO 0);
    PCIE_TX_P : OUT std_logic_vector(7 DOWNTO 0);
    reset : in STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    sys_diff_clock_clk_n : in STD_LOGIC;
    sys_diff_clock_clk_p : in STD_LOGIC
    );
end cpcie_top;

architecture sample_arch of cpcie_top is

  component xillybus
    port (
      PCIE_PERST_B_LS : IN std_logic;
      PCIE_REFCLK_N : IN std_logic;
      PCIE_REFCLK_P : IN std_logic;
      PCIE_RX_N : IN std_logic_vector(7 DOWNTO 0);
      PCIE_RX_P : IN std_logic_vector(7 DOWNTO 0);
      GPIO_LED : OUT std_logic_vector(3 DOWNTO 0);
      PCIE_TX_N : OUT std_logic_vector(7 DOWNTO 0);
      PCIE_TX_P : OUT std_logic_vector(7 DOWNTO 0);
      bus_clk : OUT std_logic;
      quiesce : OUT std_logic;
      user_r_hc_dpram_rden : OUT std_logic;
      user_r_hc_dpram_empty : IN std_logic;
      user_r_hc_dpram_data : IN std_logic_vector(31 DOWNTO 0);
      user_r_hc_dpram_eof : IN std_logic;
      user_r_hc_dpram_open : OUT std_logic;
      user_w_hc_dpram_wren : OUT std_logic;
      user_w_hc_dpram_full : IN std_logic;
      user_w_hc_dpram_data : OUT std_logic_vector(31 DOWNTO 0);
      user_w_hc_dpram_open : OUT std_logic;
      user_hc_dpram_addr : OUT std_logic_vector(4 DOWNTO 0);
      user_hc_dpram_addr_update : OUT std_logic;
      user_r_hcr_rden : OUT std_logic;
      user_r_hcr_empty : IN std_logic;
      user_r_hcr_data : IN std_logic_vector(31 DOWNTO 0);
      user_r_hcr_eof : IN std_logic;
      user_r_hcr_open : OUT std_logic;
      user_w_hcw_wren : OUT std_logic;
      user_w_hcw_full : IN std_logic;
      user_w_hcw_data : OUT std_logic_vector(31 DOWNTO 0);
      user_w_hcw_open : OUT std_logic);
  end component;

  component cpcie_bd_wrapper
  port (
    PCIE_BRAM_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
  PCIE_BRAM_clk : in STD_LOGIC;
  PCIE_BRAM_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
  PCIE_BRAM_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
  PCIE_BRAM_en : in STD_LOGIC;
  PCIE_BRAM_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
  PCIE_CLK : in STD_LOGIC;
  PCIE_FIFO_RD_0_empty : out STD_LOGIC;
  PCIE_FIFO_RD_0_rd_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
  PCIE_FIFO_RD_0_rd_en : in STD_LOGIC;
  PCIE_RST_RD_0 : in STD_LOGIC;
  PCIE_RST_WR_0 : in STD_LOGIC;
  PCIE_S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
  PCIE_S_AXIS_0_tlast : in STD_LOGIC;
  PCIE_S_AXIS_0_tready : out STD_LOGIC;
  PCIE_S_AXIS_0_tvalid : in STD_LOGIC;
  reset : in STD_LOGIC;
  rs232_uart_rxd : in STD_LOGIC;
  rs232_uart_txd : out STD_LOGIC;
  sys_diff_clock_clk_n : in STD_LOGIC;
  sys_diff_clock_clk_p : in STD_LOGIC
  );
  end component;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~ Definition ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  signal bus_clk :  std_logic;
  
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~ Xillybus'  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  signal quiesce : std_logic;
  signal user_r_hc_dpram_rden :  std_logic;
  signal user_r_hc_dpram_empty :  std_logic;
  signal user_r_hc_dpram_data :  std_logic_vector(31 DOWNTO 0);
  signal user_r_hc_dpram_eof :  std_logic;
  signal user_r_hc_dpram_open :  std_logic;
  signal user_w_hc_dpram_wren :  std_logic;
  signal user_w_hc_dpram_full :  std_logic;
  signal user_w_hc_dpram_data :  std_logic_vector(31 DOWNTO 0);
  signal user_w_hc_dpram_open :  std_logic;
  signal user_hc_dpram_addr :  std_logic_vector(4 DOWNTO 0);
  signal user_hc_dpram_addr_update :  std_logic;
  signal user_r_hcr_rden :  std_logic;
  signal user_r_hcr_empty :  std_logic;
  signal user_r_hcr_data :  std_logic_vector(31 DOWNTO 0);
  signal user_r_hcr_eof :  std_logic;
  signal user_r_hcr_open :  std_logic;
  signal user_w_hcw_wren :  std_logic;
  signal user_w_hcw_full :  std_logic;
  signal user_w_hcw_data :  std_logic_vector(31 DOWNTO 0);
  signal user_w_hcw_open :  std_logic;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~ Custom PCIe's Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  signal rst_rd_0 : std_logic;
  signal rst_wr_0 : std_logic;
  signal s_tready_0 : std_logic;
  signal user_w_wr_0_tlast : std_logic;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~ Register Memory  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  type reg_mem is array(0 TO 31) of std_logic_vector(31 DOWNTO 0);
  signal array_xcw : reg_mem;
  signal xcw_ctrl_addr : integer range 0 to 31;
  
  signal user_xc_ctrl_addr : std_logic_vector(31 DOWNTO 0);
  signal user_xc_ctrl_en : std_logic;
  signal user_xc_ctrl_dout : std_logic_vector(31 DOWNTO 0);
  signal user_xc_ctrl_din : std_logic_vector(31 DOWNTO 0);
  signal user_xc_ctrl_we : std_logic_vector(3 DOWNTO 0);

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~ Big/Little Endian ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  signal user_w_hcw_data_endian : std_logic_vector(31 DOWNTO 0);
  signal user_r_hcr_data_endian : std_logic_vector(31 DOWNTO 0);
  
begin

  xillybus_ins : xillybus
  port map (
    -- Ports related to /dev/xillybus_hc_dpram
    -- FPGA to CPU signals:
    user_r_hc_dpram_rden => user_r_hc_dpram_rden,
    user_r_hc_dpram_empty => user_r_hc_dpram_empty,
    user_r_hc_dpram_data => user_r_hc_dpram_data,
    user_r_hc_dpram_eof => user_r_hc_dpram_eof,
    user_r_hc_dpram_open => user_r_hc_dpram_open,
    -- CPU to FPGA signals:
    user_w_hc_dpram_wren => user_w_hc_dpram_wren,
    user_w_hc_dpram_full => user_w_hc_dpram_full,
    user_w_hc_dpram_data => user_w_hc_dpram_data,
    user_w_hc_dpram_open => user_w_hc_dpram_open,
    -- Address signals:
    user_hc_dpram_addr => user_hc_dpram_addr,
    user_hc_dpram_addr_update => user_hc_dpram_addr_update,

    -- Ports related to /dev/xillybus_hcr
    -- FPGA to CPU signals:
    user_r_hcr_rden => user_r_hcr_rden,
    user_r_hcr_empty => user_r_hcr_empty,
    user_r_hcr_data => user_r_hcr_data,
    user_r_hcr_eof => user_r_hcr_eof,
    user_r_hcr_open => user_r_hcr_open,

    -- Ports related to /dev/xillybus_hcw
    -- CPU to FPGA signals:
    user_w_hcw_wren => user_w_hcw_wren,
    user_w_hcw_full => user_w_hcw_full,
    user_w_hcw_data => user_w_hcw_data,
    user_w_hcw_open => user_w_hcw_open,

    -- General signals
    PCIE_PERST_B_LS => PCIE_PERST_B_LS,
    PCIE_REFCLK_N => PCIE_REFCLK_N,
    PCIE_REFCLK_P => PCIE_REFCLK_P,
    PCIE_RX_N => PCIE_RX_N,
    PCIE_RX_P => PCIE_RX_P,
    GPIO_LED => GPIO_LED,
    PCIE_TX_N => PCIE_TX_N,
    PCIE_TX_P => PCIE_TX_P,
    bus_clk => bus_clk,
    quiesce => quiesce
);
 
cpcie_bd_wrapper_i: component cpcie_bd_wrapper
    port map (
    PCIE_BRAM_addr => user_xc_ctrl_addr,
    PCIE_BRAM_clk => bus_clk,
    PCIE_BRAM_din => user_xc_ctrl_din,
    PCIE_BRAM_dout => user_xc_ctrl_dout,
    PCIE_BRAM_en => user_xc_ctrl_en,
    PCIE_BRAM_we => user_xc_ctrl_we,
    PCIE_CLK => bus_clk,
    PCIE_FIFO_RD_0_empty => user_r_hcr_empty,
    PCIE_FIFO_RD_0_rd_data => user_r_hcr_data_endian,
    PCIE_FIFO_RD_0_rd_en => user_r_hcr_rden,
    PCIE_RST_RD_0 => rst_rd_0,
    PCIE_RST_WR_0 => rst_wr_0,
    PCIE_S_AXIS_0_tdata => user_w_hcw_data_endian,
    PCIE_S_AXIS_0_tlast => user_w_wr_0_tlast,
    PCIE_S_AXIS_0_tready => s_tready_0,
    PCIE_S_AXIS_0_tvalid => user_w_hcw_wren,
    reset => reset,
    rs232_uart_rxd => rs232_uart_rxd,
    rs232_uart_txd => rs232_uart_txd,
    sys_diff_clock_clk_n => sys_diff_clock_clk_n,
    sys_diff_clock_clk_p => sys_diff_clock_clk_p
    );

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~ Big/Little Endian ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  user_w_hcw_data_endian <= user_w_hcw_data(7 downto 0) & 
                            user_w_hcw_data(15 downto 8) & 
                            user_w_hcw_data(23 downto 16) & 
                            user_w_hcw_data(31 downto 24);

  user_r_hcr_data_endian <= user_r_hcr_data(7 downto 0) & 
                            user_r_hcr_data(15 downto 8) & 
                            user_r_hcr_data(23 downto 16) & 
                            user_r_hcr_data(31 downto 24);
                            
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
------------------------------ BRAM interface ----------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
-- if the software perform write_addr(ADDR08, 0xDEADBEEF),
-- the following signals are:
-- user_w_cmd_stat_wren = '1'
-- user_cmd_stat_addr = x"08"
--

  user_xc_ctrl_addr <= "0000000000000000000000000" & user_hc_dpram_addr & "00";
  user_xc_ctrl_en <= user_w_hc_dpram_wren or user_r_hc_dpram_rden;
  user_xc_ctrl_din <= user_w_hc_dpram_data;
  user_xc_ctrl_we <= "1111" when user_w_hc_dpram_wren = '1' else "0000";
  user_r_hc_dpram_data <= user_xc_ctrl_dout;
  user_r_hc_dpram_empty <= '0';
  user_r_hc_dpram_eof <= '0';
  user_w_hc_dpram_full <= '0';

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-------------------- PCIE CHANNEL 0 : READ -------------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  rst_rd_0 <= not (user_r_hcr_open);
  user_r_hcr_eof <= '0';
  
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-------------------- PCIE CHANNEL 0 : WRITE ------------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  rst_wr_0 <= (user_w_hcw_open);
  user_w_hcw_full <= not s_tready_0;    
  
end sample_arch;
