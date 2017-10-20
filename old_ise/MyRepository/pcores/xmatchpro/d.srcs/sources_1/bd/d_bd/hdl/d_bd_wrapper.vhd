--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Wed Jan 04 00:45:35 2017
--Host        : IT002580 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target d_bd_wrapper.bd
--Design      : d_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xmatchpro_decompressor is
  port (
    CLK : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR ( 31 downto 0 );
    COMPRESSED_SIZE : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CRC_32_D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERRUPT_REQ_D : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    RESETN : in STD_LOGIC;
    STATUS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tvalid : in STD_LOGIC
  );
end xmatchpro_decompressor;

architecture STRUCTURE of xmatchpro_decompressor is
  component d_bd is
  port (
    CLK : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR ( 31 downto 0 );
    COMPRESSED_SIZE : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CRC_32_D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERRUPT_REQ_D : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    RESETN : in STD_LOGIC;
    STATUS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tvalid : in STD_LOGIC
  );
  end component d_bd;
begin
d_bd_i: component d_bd
    port map (
      CLK => CLK,
      COMMAND(31 downto 0) => COMMAND(31 downto 0),
      COMPRESSED_SIZE(15 downto 0) => COMPRESSED_SIZE(15 downto 0),
      CRC_32_D(31 downto 0) => CRC_32_D(31 downto 0),
      INTERRUPT_REQ_D(0) => INTERRUPT_REQ_D(0),
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
