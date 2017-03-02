--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Wed Jan 04 01:18:27 2017
--Host        : IT002580 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target c_bd_wrapper.bd
--Design      : c_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xmatchpro_compressor is
  port (
    CLK : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CRC_32_C : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERRUPT_REQ_C : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    RESETN : in STD_LOGIC;
    STATUS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tvalid : in STD_LOGIC
  );
end xmatchpro_compressor;

architecture STRUCTURE of xmatchpro_compressor is
  component c_bd is
  port (
    CLK : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CRC_32_C : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERRUPT_REQ_C : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    RESETN : in STD_LOGIC;
    STATUS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tvalid : in STD_LOGIC
  );
  end component c_bd;
begin
c_bd_i: component c_bd
    port map (
      CLK => CLK,
      COMMAND(31 downto 0) => COMMAND(31 downto 0),
      CRC_32_C(31 downto 0) => CRC_32_C(31 downto 0),
      INTERRUPT_REQ_C(0) => INTERRUPT_REQ_C(0),
      M_AXIS_tdata(31 downto 0) => M_AXIS_tdata(31 downto 0),
      M_AXIS_tready => M_AXIS_tready,
      M_AXIS_tvalid => M_AXIS_tvalid,
      RESETN => RESETN,
      STATUS(31 downto 0) => STATUS(31 downto 0),
      S_AXIS_tdata(31 downto 0) => S_AXIS_tdata(31 downto 0),
      S_AXIS_tready(0) => S_AXIS_tready,
      S_AXIS_tvalid => S_AXIS_tvalid
    );
end STRUCTURE;
