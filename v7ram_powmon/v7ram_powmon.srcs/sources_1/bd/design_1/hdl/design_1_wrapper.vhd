--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Thu Feb 02 12:34:33 2017
--Host        : IT002223 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    ddr3_sdram_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ddr3_sdram_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ddr3_sdram_cas_n : out STD_LOGIC;
    ddr3_sdram_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_sdram_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr3_sdram_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_sdram_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_sdram_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ras_n : out STD_LOGIC;
    ddr3_sdram_reset_n : out STD_LOGIC;
    ddr3_sdram_we_n : out STD_LOGIC;
    pmbus_scl_io : inout STD_LOGIC;
    pmbus_sda_io : inout STD_LOGIC;
    reset : in STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    sys_diff_clock_clk_n : in STD_LOGIC;
    sys_diff_clock_clk_p : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    reset : in STD_LOGIC;
    pmbus_scl_i : in STD_LOGIC;
    pmbus_scl_o : out STD_LOGIC;
    pmbus_scl_t : out STD_LOGIC;
    pmbus_sda_i : in STD_LOGIC;
    pmbus_sda_o : out STD_LOGIC;
    pmbus_sda_t : out STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    ddr3_sdram_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr3_sdram_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_sdram_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_sdram_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ddr3_sdram_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ddr3_sdram_ras_n : out STD_LOGIC;
    ddr3_sdram_cas_n : out STD_LOGIC;
    ddr3_sdram_we_n : out STD_LOGIC;
    ddr3_sdram_reset_n : out STD_LOGIC;
    ddr3_sdram_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_sdram_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    sys_diff_clock_clk_p : in STD_LOGIC;
    sys_diff_clock_clk_n : in STD_LOGIC
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal pmbus_scl_i : STD_LOGIC;
  signal pmbus_scl_o : STD_LOGIC;
  signal pmbus_scl_t : STD_LOGIC;
  signal pmbus_sda_i : STD_LOGIC;
  signal pmbus_sda_o : STD_LOGIC;
  signal pmbus_sda_t : STD_LOGIC;
begin
design_1_i: component design_1
    port map (
      ddr3_sdram_addr(13 downto 0) => ddr3_sdram_addr(13 downto 0),
      ddr3_sdram_ba(2 downto 0) => ddr3_sdram_ba(2 downto 0),
      ddr3_sdram_cas_n => ddr3_sdram_cas_n,
      ddr3_sdram_ck_n(0) => ddr3_sdram_ck_n(0),
      ddr3_sdram_ck_p(0) => ddr3_sdram_ck_p(0),
      ddr3_sdram_cke(0) => ddr3_sdram_cke(0),
      ddr3_sdram_cs_n(0) => ddr3_sdram_cs_n(0),
      ddr3_sdram_dm(7 downto 0) => ddr3_sdram_dm(7 downto 0),
      ddr3_sdram_dq(63 downto 0) => ddr3_sdram_dq(63 downto 0),
      ddr3_sdram_dqs_n(7 downto 0) => ddr3_sdram_dqs_n(7 downto 0),
      ddr3_sdram_dqs_p(7 downto 0) => ddr3_sdram_dqs_p(7 downto 0),
      ddr3_sdram_odt(0) => ddr3_sdram_odt(0),
      ddr3_sdram_ras_n => ddr3_sdram_ras_n,
      ddr3_sdram_reset_n => ddr3_sdram_reset_n,
      ddr3_sdram_we_n => ddr3_sdram_we_n,
      pmbus_scl_i => pmbus_scl_i,
      pmbus_scl_o => pmbus_scl_o,
      pmbus_scl_t => pmbus_scl_t,
      pmbus_sda_i => pmbus_sda_i,
      pmbus_sda_o => pmbus_sda_o,
      pmbus_sda_t => pmbus_sda_t,
      reset => reset,
      rs232_uart_rxd => rs232_uart_rxd,
      rs232_uart_txd => rs232_uart_txd,
      sys_diff_clock_clk_n => sys_diff_clock_clk_n,
      sys_diff_clock_clk_p => sys_diff_clock_clk_p
    );
pmbus_scl_iobuf: component IOBUF
    port map (
      I => pmbus_scl_o,
      IO => pmbus_scl_io,
      O => pmbus_scl_i,
      T => pmbus_scl_t
    );
pmbus_sda_iobuf: component IOBUF
    port map (
      I => pmbus_sda_o,
      IO => pmbus_sda_io,
      O => pmbus_sda_i,
      T => pmbus_sda_t
    );
end STRUCTURE;
