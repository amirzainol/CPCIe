--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Wed Oct 12 11:45:45 2016
--Host        : IT002223 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target axis_to_fifo.bd
--Design      : axis_to_fifo
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axis_to_fifo is
  port (
    FIFO_RD_CLK : in STD_LOGIC;
    FIFO_RD_RST : in STD_LOGIC;
    FIFO_RD_empty : out STD_LOGIC;
    FIFO_RD_rd_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FIFO_RD_rd_en : in STD_LOGIC;
    FIFO_WR_full : out STD_LOGIC;
    FIFO_WR_wr_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FIFO_WR_wr_en : in STD_LOGIC;
    S_AXIS_CLK : in STD_LOGIC
  );
end axis_to_fifo;

architecture STRUCTURE of axis_to_fifo is
  component axis_to_fifo_fifo_generator_0_0 is
  port (
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  end component axis_to_fifo_fifo_generator_0_0;
  signal FIFO_READ_1_EMPTY : STD_LOGIC;
  signal FIFO_READ_1_RD_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_READ_1_RD_EN : STD_LOGIC;
  signal FIFO_WRITE_1_FULL : STD_LOGIC;
  signal FIFO_WRITE_1_WR_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_WRITE_1_WR_EN : STD_LOGIC;
  signal rd_clk_1 : STD_LOGIC;
  signal rst_1 : STD_LOGIC;
  signal wr_clk_1 : STD_LOGIC;
begin
  FIFO_RD_empty <= FIFO_READ_1_EMPTY;
  FIFO_RD_rd_data(31 downto 0) <= FIFO_READ_1_RD_DATA(31 downto 0);
  FIFO_READ_1_RD_EN <= FIFO_RD_rd_en;
  FIFO_WRITE_1_WR_DATA(31 downto 0) <= FIFO_WR_wr_data(31 downto 0);
  FIFO_WRITE_1_WR_EN <= FIFO_WR_wr_en;
  FIFO_WR_full <= FIFO_WRITE_1_FULL;
  rd_clk_1 <= FIFO_RD_CLK;
  rst_1 <= FIFO_RD_RST;
  wr_clk_1 <= S_AXIS_CLK;
fifo_gen_axis_to_fifo: component axis_to_fifo_fifo_generator_0_0
    port map (
      din(31 downto 0) => FIFO_WRITE_1_WR_DATA(31 downto 0),
      dout(31 downto 0) => FIFO_READ_1_RD_DATA(31 downto 0),
      empty => FIFO_READ_1_EMPTY,
      full => FIFO_WRITE_1_FULL,
      rd_clk => rd_clk_1,
      rd_en => FIFO_READ_1_RD_EN,
      rst => rst_1,
      wr_clk => wr_clk_1,
      wr_en => FIFO_WRITE_1_WR_EN
    );
end STRUCTURE;
