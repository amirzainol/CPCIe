library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity xillydemo is
  port (
    PCIE_PERST_B_LS : IN std_logic;
    PCIE_REFCLK_N : IN std_logic;
    PCIE_REFCLK_P : IN std_logic;
    PCIE_RX_N : IN std_logic_vector(7 DOWNTO 0);
    PCIE_RX_P : IN std_logic_vector(7 DOWNTO 0);
    GPIO_LED : OUT std_logic_vector(3 DOWNTO 0);
    PCIE_TX_N : OUT std_logic_vector(7 DOWNTO 0);
    PCIE_TX_P : OUT std_logic_vector(7 DOWNTO 0));
end xillydemo;

architecture sample_arch of xillydemo is

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

  component fifo_32x512
    port (
      clk: IN std_logic;
      srst: IN std_logic;
      din: IN std_logic_VECTOR(31 downto 0);
      wr_en: IN std_logic;
      rd_en: IN std_logic;
      dout: OUT std_logic_VECTOR(31 downto 0);
      full: OUT std_logic;
      empty: OUT std_logic);
  end component;

-- Synplicity black box declaration
  attribute syn_black_box : boolean;
  attribute syn_black_box of fifo_32x512: component is true;

  signal reset_32 : std_logic;
  
  signal bus_clk :  std_logic;
  signal quiesce : std_logic;
  signal user_r_hcr_rden :  std_logic;
  signal user_r_hcr_empty :  std_logic;
  signal user_r_hcr_data :  std_logic_vector(31 DOWNTO 0);
  signal user_r_hcr_eof :  std_logic;
  signal user_r_hcr_open :  std_logic;
  signal user_w_hcw_wren :  std_logic;
  signal user_w_hcw_full :  std_logic;
  signal user_w_hcw_data :  std_logic_vector(31 DOWNTO 0);
  signal user_w_hcw_open :  std_logic;

begin

  xillybus_ins : xillybus
    port map (
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

--  32-bit loopback

  fifo_32 : fifo_32x512
    port map(
      clk        => bus_clk,
      srst       => reset_32,
      din        => user_w_hcw_data,
      wr_en      => user_w_hcw_wren,
      rd_en      => user_r_hcr_rden,
      dout       => user_r_hcr_data,
      full       => user_w_hcw_full,
      empty      => user_r_hcr_empty
      );

  reset_32 <= not (user_w_hcw_open or user_r_hcr_open);

  user_r_hcr_eof <= '0';
  
end sample_arch;
