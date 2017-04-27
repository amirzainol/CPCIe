--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Thu Apr 27 12:56:41 2017
--Host        : IT002223 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target cpcie_bd_wrapper.bd
--Design      : cpcie_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cpcie_bd_wrapper is
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
end cpcie_bd_wrapper;

architecture STRUCTURE of cpcie_bd_wrapper is
  component cpcie_bd is
  port (
    PCIE_CLK : in STD_LOGIC;
    PCIE_RST_RD_0 : in STD_LOGIC;
    PCIE_RST_WR_0 : in STD_LOGIC;
    reset : in STD_LOGIC;
    PCIE_FIFO_RD_0_rd_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PCIE_FIFO_RD_0_rd_en : in STD_LOGIC;
    PCIE_FIFO_RD_0_empty : out STD_LOGIC;
    PCIE_BRAM_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PCIE_BRAM_clk : in STD_LOGIC;
    PCIE_BRAM_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PCIE_BRAM_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PCIE_BRAM_en : in STD_LOGIC;
    PCIE_BRAM_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
    PCIE_S_AXIS_0_tvalid : in STD_LOGIC;
    PCIE_S_AXIS_0_tready : out STD_LOGIC;
    PCIE_S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PCIE_S_AXIS_0_tlast : in STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    sys_diff_clock_clk_n : in STD_LOGIC;
    sys_diff_clock_clk_p : in STD_LOGIC
  );
  end component cpcie_bd;
begin
cpcie_bd_i: component cpcie_bd
    port map (
      PCIE_BRAM_addr(31 downto 0) => PCIE_BRAM_addr(31 downto 0),
      PCIE_BRAM_clk => PCIE_BRAM_clk,
      PCIE_BRAM_din(31 downto 0) => PCIE_BRAM_din(31 downto 0),
      PCIE_BRAM_dout(31 downto 0) => PCIE_BRAM_dout(31 downto 0),
      PCIE_BRAM_en => PCIE_BRAM_en,
      PCIE_BRAM_we(3 downto 0) => PCIE_BRAM_we(3 downto 0),
      PCIE_CLK => PCIE_CLK,
      PCIE_FIFO_RD_0_empty => PCIE_FIFO_RD_0_empty,
      PCIE_FIFO_RD_0_rd_data(31 downto 0) => PCIE_FIFO_RD_0_rd_data(31 downto 0),
      PCIE_FIFO_RD_0_rd_en => PCIE_FIFO_RD_0_rd_en,
      PCIE_RST_RD_0 => PCIE_RST_RD_0,
      PCIE_RST_WR_0 => PCIE_RST_WR_0,
      PCIE_S_AXIS_0_tdata(31 downto 0) => PCIE_S_AXIS_0_tdata(31 downto 0),
      PCIE_S_AXIS_0_tlast => PCIE_S_AXIS_0_tlast,
      PCIE_S_AXIS_0_tready => PCIE_S_AXIS_0_tready,
      PCIE_S_AXIS_0_tvalid => PCIE_S_AXIS_0_tvalid,
      reset => reset,
      rs232_uart_rxd => rs232_uart_rxd,
      rs232_uart_txd => rs232_uart_txd,
      sys_diff_clock_clk_n => sys_diff_clock_clk_n,
      sys_diff_clock_clk_p => sys_diff_clock_clk_p
    );
end STRUCTURE;
