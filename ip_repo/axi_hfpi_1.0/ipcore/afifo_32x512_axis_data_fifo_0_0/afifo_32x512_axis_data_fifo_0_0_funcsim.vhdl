-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
-- Date        : Wed Nov 01 00:02:19 2017
-- Host        : IT002223 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               c:/mohd/cpcie/ip_repo/axi_hfpi_1.0/ipcore/afifo_32x512_axis_data_fifo_0_0/afifo_32x512_axis_data_fifo_0_0_funcsim.vhdl
-- Design      : afifo_32x512_axis_data_fifo_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_wrapper is
  port (
    D : out STD_LOGIC_VECTOR ( 32 downto 0 );
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    ram_rd_en_i : in STD_LOGIC;
    WEBWE : in STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_wrapper : entity is "blk_mem_gen_prim_wrapper";
end afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_wrapper;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_wrapper is
  signal \n_32_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\ : STD_LOGIC;
  signal \n_34_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\ : STD_LOGIC;
  signal \n_35_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "SDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 36
    )
    port map (
      ADDRARDADDR(13 downto 5) => O1(8 downto 0),
      ADDRARDADDR(4) => '0',
      ADDRARDADDR(3) => '0',
      ADDRARDADDR(2) => '0',
      ADDRARDADDR(1) => '0',
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(13 downto 5) => Q(8 downto 0),
      ADDRBWRADDR(4) => '0',
      ADDRBWRADDR(3) => '0',
      ADDRBWRADDR(2) => '0',
      ADDRBWRADDR(1) => '0',
      ADDRBWRADDR(0) => '0',
      CLKARDCLK => m_aclk,
      CLKBWRCLK => s_aclk,
      DIADI(15 downto 8) => s_axis_tdata(15 downto 8),
      DIADI(7 downto 1) => s_axis_tdata(6 downto 0),
      DIADI(0) => s_axis_tlast,
      DIBDI(15 downto 0) => s_axis_tdata(31 downto 16),
      DIPADIP(1) => '0',
      DIPADIP(0) => s_axis_tdata(7),
      DIPBDIP(1) => '0',
      DIPBDIP(0) => '0',
      DOADO(15 downto 8) => D(16 downto 9),
      DOADO(7 downto 0) => D(7 downto 0),
      DOBDO(15 downto 0) => D(32 downto 17),
      DOPADOP(1) => \n_32_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\,
      DOPADOP(0) => D(8),
      DOPBDOP(1) => \n_34_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\,
      DOPBDOP(0) => \n_35_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram\,
      ENARDEN => ram_rd_en_i,
      ENBWREN => WEBWE(0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1) => '0',
      WEA(0) => '0',
      WEBWE(3) => WEBWE(0),
      WEBWE(2) => WEBWE(0),
      WEBWE(1) => WEBWE(0),
      WEBWE(0) => WEBWE(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_compare is
  port (
    comp1 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_compare : entity is "compare";
end afifo_32x512_axis_data_fifo_0_0_compare;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_compare is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp1,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => v1_reg(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_compare_0 is
  port (
    comp2 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_compare_0 : entity is "compare";
end afifo_32x512_axis_data_fifo_0_0_compare_0;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_compare_0 is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp2,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => I1(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_compare_1 is
  port (
    comp0 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_compare_1 : entity is "compare";
end afifo_32x512_axis_data_fifo_0_0_compare_1;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_compare_1 is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp0,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => I1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_compare_2 is
  port (
    comp1 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_compare_2 : entity is "compare";
end afifo_32x512_axis_data_fifo_0_0_compare_2;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_compare_2 is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp1,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => I2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_rd_bin_cntr is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    O3 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_rd_bin_cntr : entity is "rd_bin_cntr";
end afifo_32x512_axis_data_fifo_0_0_rd_bin_cntr;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_rd_bin_cntr is
  signal \^o2\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \n_0_gc0.count[8]_i_2\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 8 to 8 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count[2]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gc0.count[3]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gc0.count[4]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \gc0.count[7]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \gc0.count[8]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \gc0.count[8]_i_2\ : label is "soft_lutpair20";
begin
  O2(8 downto 0) <= \^o2\(8 downto 0);
  Q(7 downto 0) <= \^q\(7 downto 0);
\gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^q\(0),
      O => plusOp(0)
    );
\gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => plusOp(1)
    );
\gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => plusOp(2)
    );
\gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(3),
      O => plusOp(3)
    );
\gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => plusOp(4)
    );
\gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(4),
      I3 => \^q\(3),
      I4 => \^q\(2),
      I5 => \^q\(5),
      O => plusOp(5)
    );
\gc0.count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_0_gc0.count[8]_i_2\,
      I1 => \^q\(5),
      I2 => \^q\(6),
      O => plusOp(6)
    );
\gc0.count[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \n_0_gc0.count[8]_i_2\,
      I1 => \^q\(5),
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => plusOp(7)
    );
\gc0.count[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \n_0_gc0.count[8]_i_2\,
      I1 => \^q\(7),
      I2 => \^q\(6),
      I3 => \^q\(5),
      I4 => rd_pntr_plus1(8),
      O => plusOp(8)
    );
\gc0.count[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => \^q\(4),
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \n_0_gc0.count[8]_i_2\
    );
\gc0.count_d1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(0),
      Q => \^o2\(0)
    );
\gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(1),
      Q => \^o2\(1)
    );
\gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(2),
      Q => \^o2\(2)
    );
\gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(3),
      Q => \^o2\(3)
    );
\gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(4),
      Q => \^o2\(4)
    );
\gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(5),
      Q => \^o2\(5)
    );
\gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(6),
      Q => \^o2\(6)
    );
\gc0.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(7),
      Q => \^o2\(7)
    );
\gc0.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => rd_pntr_plus1(8),
      Q => \^o2\(8)
    );
\gc0.count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => plusOp(0),
      PRE => I1(0),
      Q => \^q\(0)
    );
\gc0.count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(1),
      Q => \^q\(1)
    );
\gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(2),
      Q => \^q\(2)
    );
\gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(3),
      Q => \^q\(3)
    );
\gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(4),
      Q => \^q\(4)
    );
\gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(5),
      Q => \^q\(5)
    );
\gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(6),
      Q => \^q\(6)
    );
\gc0.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(7),
      Q => \^q\(7)
    );
\gc0.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(8),
      Q => rd_pntr_plus1(8)
    );
\gmux.gm[4].gms.ms_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^o2\(8),
      I1 => WR_PNTR_RD(0),
      O => O1
    );
\gmux.gm[4].gms.ms_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => rd_pntr_plus1(8),
      I1 => WR_PNTR_RD(0),
      O => O3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_rd_dc_fwft_ext_as is
  port (
    O1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    D : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I1 : in STD_LOGIC;
    user_valid : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_aclk : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_rd_dc_fwft_ext_as : entity is "rd_dc_fwft_ext_as";
end afifo_32x512_axis_data_fifo_0_0_rd_dc_fwft_ext_as;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_rd_dc_fwft_ext_as is
  signal \^o1\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal diff_wr_rd : STD_LOGIC_VECTOR ( 8 downto 3 );
  signal \n_0_gvalid_low.rd_dc_i[7]_i_2\ : STD_LOGIC;
  signal \n_0_gvalid_low.rd_dc_i[7]_i_3\ : STD_LOGIC;
  signal \n_0_gvalid_low.rd_dc_i[8]_i_4\ : STD_LOGIC;
  signal \n_0_gvalid_low.rd_dc_i[9]_i_4\ : STD_LOGIC;
  signal \n_0_gvalid_low.rd_dc_i_reg[8]_i_3\ : STD_LOGIC;
  signal \n_0_gvalid_low.rd_dc_i_reg[9]_i_3\ : STD_LOGIC;
  signal \n_1_gvalid_low.rd_dc_i_reg[8]_i_3\ : STD_LOGIC;
  signal \n_1_gvalid_low.rd_dc_i_reg[9]_i_3\ : STD_LOGIC;
  signal \n_2_gvalid_low.rd_dc_i_reg[8]_i_3\ : STD_LOGIC;
  signal \n_2_gvalid_low.rd_dc_i_reg[9]_i_3\ : STD_LOGIC;
  signal \n_3_gvalid_low.rd_dc_i_reg[8]_i_3\ : STD_LOGIC;
  signal \n_3_gvalid_low.rd_dc_i_reg[9]_i_3\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 3 );
  signal \NLW_gvalid_low.rd_dc_i_reg[9]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gvalid_low.rd_dc_i_reg[9]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gvalid_low.rd_dc_i[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \gvalid_low.rd_dc_i[7]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \gvalid_low.rd_dc_i[7]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \gvalid_low.rd_dc_i[9]_i_4\ : label is "soft_lutpair14";
begin
  O1(2 downto 0) <= \^o1\(2 downto 0);
\gvalid_low.rd_dc_i[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08808080"
    )
    port map (
      I0 => Q(0),
      I1 => user_valid,
      I2 => diff_wr_rd(3),
      I3 => \^o1\(2),
      I4 => \^o1\(1),
      O => p_0_in(3)
    );
\gvalid_low.rd_dc_i[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0880808080808080"
    )
    port map (
      I0 => Q(0),
      I1 => user_valid,
      I2 => diff_wr_rd(4),
      I3 => \^o1\(1),
      I4 => \^o1\(2),
      I5 => diff_wr_rd(3),
      O => p_0_in(4)
    );
\gvalid_low.rd_dc_i[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
    port map (
      I0 => I1,
      I1 => diff_wr_rd(5),
      I2 => diff_wr_rd(4),
      I3 => diff_wr_rd(3),
      I4 => \^o1\(1),
      I5 => \^o1\(2),
      O => p_0_in(5)
    );
\gvalid_low.rd_dc_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
    port map (
      I0 => I1,
      I1 => diff_wr_rd(6),
      I2 => diff_wr_rd(3),
      I3 => diff_wr_rd(4),
      I4 => diff_wr_rd(5),
      I5 => \n_0_gvalid_low.rd_dc_i[7]_i_3\,
      O => p_0_in(6)
    );
\gvalid_low.rd_dc_i[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
    port map (
      I0 => I1,
      I1 => diff_wr_rd(7),
      I2 => \n_0_gvalid_low.rd_dc_i[7]_i_2\,
      I3 => diff_wr_rd(3),
      I4 => diff_wr_rd(6),
      I5 => \n_0_gvalid_low.rd_dc_i[7]_i_3\,
      O => p_0_in(7)
    );
\gvalid_low.rd_dc_i[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => diff_wr_rd(4),
      I1 => diff_wr_rd(5),
      O => \n_0_gvalid_low.rd_dc_i[7]_i_2\
    );
\gvalid_low.rd_dc_i[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\(2),
      I1 => \^o1\(1),
      O => \n_0_gvalid_low.rd_dc_i[7]_i_3\
    );
\gvalid_low.rd_dc_i[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA2AAA00008000"
    )
    port map (
      I0 => I1,
      I1 => \^o1\(2),
      I2 => \^o1\(1),
      I3 => diff_wr_rd(3),
      I4 => \n_0_gvalid_low.rd_dc_i[8]_i_4\,
      I5 => diff_wr_rd(8),
      O => p_0_in(8)
    );
\gvalid_low.rd_dc_i[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => diff_wr_rd(7),
      I1 => diff_wr_rd(6),
      I2 => diff_wr_rd(5),
      I3 => diff_wr_rd(4),
      O => \n_0_gvalid_low.rd_dc_i[8]_i_4\
    );
\gvalid_low.rd_dc_i[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => user_valid,
      I1 => Q(0),
      I2 => diff_wr_rd(8),
      I3 => diff_wr_rd(7),
      I4 => diff_wr_rd(6),
      I5 => \n_0_gvalid_low.rd_dc_i[9]_i_4\,
      O => p_0_in(9)
    );
\gvalid_low.rd_dc_i[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => diff_wr_rd(3),
      I1 => diff_wr_rd(4),
      I2 => diff_wr_rd(5),
      I3 => \^o1\(1),
      I4 => \^o1\(2),
      O => \n_0_gvalid_low.rd_dc_i[9]_i_4\
    );
\gvalid_low.rd_dc_i_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => D(0),
      Q => axis_rd_data_count(0)
    );
\gvalid_low.rd_dc_i_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => D(1),
      Q => axis_rd_data_count(1)
    );
\gvalid_low.rd_dc_i_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => D(2),
      Q => axis_rd_data_count(2)
    );
\gvalid_low.rd_dc_i_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => p_0_in(3),
      Q => axis_rd_data_count(3)
    );
\gvalid_low.rd_dc_i_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => p_0_in(4),
      Q => axis_rd_data_count(4)
    );
\gvalid_low.rd_dc_i_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => p_0_in(5),
      Q => axis_rd_data_count(5)
    );
\gvalid_low.rd_dc_i_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => p_0_in(6),
      Q => axis_rd_data_count(6)
    );
\gvalid_low.rd_dc_i_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => p_0_in(7),
      Q => axis_rd_data_count(7)
    );
\gvalid_low.rd_dc_i_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => p_0_in(8),
      Q => axis_rd_data_count(8)
    );
\gvalid_low.rd_dc_i_reg[8]_i_3\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gvalid_low.rd_dc_i_reg[8]_i_3\,
      CO(2) => \n_1_gvalid_low.rd_dc_i_reg[8]_i_3\,
      CO(1) => \n_2_gvalid_low.rd_dc_i_reg[8]_i_3\,
      CO(0) => \n_3_gvalid_low.rd_dc_i_reg[8]_i_3\,
      CYINIT => '1',
      DI(3 downto 0) => WR_PNTR_RD(3 downto 0),
      O(3) => diff_wr_rd(3),
      O(2 downto 0) => \^o1\(2 downto 0),
      S(3 downto 0) => I3(3 downto 0)
    );
\gvalid_low.rd_dc_i_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I2(0),
      D => p_0_in(9),
      Q => axis_rd_data_count(9)
    );
\gvalid_low.rd_dc_i_reg[9]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gvalid_low.rd_dc_i_reg[9]_i_3\,
      CO(3 downto 0) => \NLW_gvalid_low.rd_dc_i_reg[9]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_gvalid_low.rd_dc_i_reg[9]_i_2_O_UNCONNECTED\(3 downto 1),
      O(0) => diff_wr_rd(8),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => S(0)
    );
\gvalid_low.rd_dc_i_reg[9]_i_3\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gvalid_low.rd_dc_i_reg[8]_i_3\,
      CO(3) => \n_0_gvalid_low.rd_dc_i_reg[9]_i_3\,
      CO(2) => \n_1_gvalid_low.rd_dc_i_reg[9]_i_3\,
      CO(1) => \n_2_gvalid_low.rd_dc_i_reg[9]_i_3\,
      CO(0) => \n_3_gvalid_low.rd_dc_i_reg[9]_i_3\,
      CYINIT => '0',
      DI(3 downto 0) => WR_PNTR_RD(7 downto 4),
      O(3 downto 0) => diff_wr_rd(7 downto 4),
      S(3 downto 0) => I4(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_rd_fwft is
  port (
    user_valid : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O2 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_rd_en_i : out STD_LOGIC;
    O3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O4 : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC;
    p_18_out : in STD_LOGIC;
    comp1 : in STD_LOGIC;
    comp0 : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_rd_fwft : entity is "rd_fwft";
end afifo_32x512_axis_data_fifo_0_0_rd_fwft;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_rd_fwft is
  signal \^o1\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal empty_fwft_fb : STD_LOGIC;
  signal empty_fwft_i : STD_LOGIC;
  signal empty_fwft_i0 : STD_LOGIC;
  signal next_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^user_valid\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of empty_fwft_fb_i_1 : label is "soft_lutpair17";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of empty_fwft_fb_reg : label is "no";
  attribute equivalent_register_removal of empty_fwft_i_reg : label is "no";
  attribute SOFT_HLUTNM of \gc0.count_d1[8]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \goreg_bm.dout_i[32]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[1]_i_1\ : label is "soft_lutpair16";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[1]\ : label is "no";
  attribute equivalent_register_removal of \gpregsm1.user_valid_reg\ : label is "no";
  attribute SOFT_HLUTNM of \gvalid_low.rd_dc_i[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gvalid_low.rd_dc_i[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gvalid_low.rd_dc_i[8]_i_2\ : label is "soft_lutpair18";
begin
  O1(0) <= \^o1\(0);
  user_valid <= \^user_valid\;
\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00DF"
    )
    port map (
      I0 => \^o1\(0),
      I1 => m_axis_tready,
      I2 => curr_fwft_state(0),
      I3 => p_18_out,
      O => ram_rd_en_i
    );
empty_fwft_fb_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C0EC"
    )
    port map (
      I0 => m_axis_tready,
      I1 => empty_fwft_fb,
      I2 => curr_fwft_state(0),
      I3 => \^o1\(0),
      O => empty_fwft_i0
    );
empty_fwft_fb_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => Q(1),
      Q => empty_fwft_fb
    );
empty_fwft_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => Q(1),
      Q => empty_fwft_i
    );
\gc0.count_d1[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00DF"
    )
    port map (
      I0 => \^o1\(0),
      I1 => m_axis_tready,
      I2 => curr_fwft_state(0),
      I3 => p_18_out,
      O => E(0)
    );
\goreg_bm.dout_i[32]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4404"
    )
    port map (
      I0 => Q(0),
      I1 => \^o1\(0),
      I2 => curr_fwft_state(0),
      I3 => m_axis_tready,
      O => O3(0)
    );
\gpregsm1.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => \^o1\(0),
      I1 => curr_fwft_state(0),
      I2 => m_axis_tready,
      O => next_fwft_state(0)
    );
\gpregsm1.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20FF"
    )
    port map (
      I0 => \^o1\(0),
      I1 => m_axis_tready,
      I2 => curr_fwft_state(0),
      I3 => p_18_out,
      O => next_fwft_state(1)
    );
\gpregsm1.curr_fwft_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => Q(1),
      D => next_fwft_state(0),
      Q => curr_fwft_state(0)
    );
\gpregsm1.curr_fwft_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => Q(1),
      D => next_fwft_state(1),
      Q => \^o1\(0)
    );
\gpregsm1.user_valid_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => Q(1),
      D => next_fwft_state(0),
      Q => \^user_valid\
    );
\gvalid_low.rd_dc_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      I0 => \^o1\(0),
      I1 => I1(0),
      I2 => \^user_valid\,
      O => D(0)
    );
\gvalid_low.rd_dc_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => \^o1\(0),
      I1 => \^user_valid\,
      I2 => I1(1),
      O => D(1)
    );
\gvalid_low.rd_dc_i[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0880"
    )
    port map (
      I0 => \^o1\(0),
      I1 => \^user_valid\,
      I2 => I1(2),
      I3 => I1(1),
      O => D(2)
    );
\gvalid_low.rd_dc_i[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^user_valid\,
      I1 => \^o1\(0),
      O => O4
    );
m_axis_tvalid_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => empty_fwft_i,
      O => m_axis_tvalid
    );
ram_empty_fb_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000DF00"
    )
    port map (
      I0 => curr_fwft_state(0),
      I1 => m_axis_tready,
      I2 => \^o1\(0),
      I3 => comp1,
      I4 => p_18_out,
      I5 => comp0,
      O => O2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_reset_blk_ramfifo is
  port (
    rst_d2 : out STD_LOGIC;
    rst_full_gen_i : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_aclk : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_reset_blk_ramfifo : entity is "reset_blk_ramfifo";
end afifo_32x512_axis_data_fifo_0_0_reset_blk_ramfifo;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_reset_blk_ramfifo is
  signal inverted_reset : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\ : STD_LOGIC;
  signal rd_rst_asreg : STD_LOGIC;
  signal rd_rst_asreg_d1 : STD_LOGIC;
  signal rd_rst_asreg_d2 : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal \^rst_d2\ : STD_LOGIC;
  signal rst_d3 : STD_LOGIC;
  signal wr_rst_asreg : STD_LOGIC;
  signal wr_rst_asreg_d1 : STD_LOGIC;
  signal wr_rst_asreg_d2 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "false";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is std.standard.true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "false";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is std.standard.true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is "false";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\ : label is "no";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is "false";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\ : label is "no";
begin
  rst_d2 <= \^rst_d2\;
\grstd1.grst_full.grst_f.RST_FULL_GEN_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => inverted_reset,
      D => rst_d3,
      Q => rst_full_gen_i
    );
\grstd1.grst_full.grst_f.rst_d1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => inverted_reset,
      Q => rst_d1
    );
\grstd1.grst_full.grst_f.rst_d2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => rst_d1,
      PRE => inverted_reset,
      Q => \^rst_d2\
    );
\grstd1.grst_full.grst_f.rst_d3_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => \^rst_d2\,
      PRE => inverted_reset,
      Q => rst_d3
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => rd_rst_asreg,
      Q => rd_rst_asreg_d1,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => rd_rst_asreg_d1,
      Q => rd_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => m_aclk,
      CE => rd_rst_asreg_d1,
      D => '0',
      PRE => inverted_reset,
      Q => rd_rst_asreg
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_rst_asreg,
      I1 => rd_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => O1(0)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => O1(1)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => O1(2)
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => wr_rst_asreg,
      Q => wr_rst_asreg_d1,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => wr_rst_asreg_d1,
      Q => wr_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => s_aresetn,
      O => inverted_reset
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => s_aclk,
      CE => wr_rst_asreg_d1,
      D => '0',
      PRE => inverted_reset,
      Q => wr_rst_asreg
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wr_rst_asreg,
      I1 => wr_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\,
      Q => Q(0)
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\,
      Q => Q(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_synchronizer_ff is
  port (
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_aclk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff : entity is "synchronizer_ff";
end afifo_32x512_axis_data_fifo_0_0_synchronizer_ff;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(6),
      Q => Q(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(7),
      Q => Q(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => I1(8),
      Q => Q(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_3 is
  port (
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_3 : entity is "synchronizer_ff";
end afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_3;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_3 is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(6),
      Q => Q(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(7),
      Q => Q(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I1(8),
      Q => Q(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_4 is
  port (
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_aclk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_4 : entity is "synchronizer_ff";
end afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_4;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_4 is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(6),
      Q => Q(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(7),
      Q => Q(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(8),
      Q => Q(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_5 is
  port (
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_5 : entity is "synchronizer_ff";
end afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_5;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_5 is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(6),
      Q => Q(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(7),
      Q => Q(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(8),
      Q => Q(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_6 is
  port (
    p_0_in : out STD_LOGIC_VECTOR ( 8 downto 0 );
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_aclk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_6 : entity is "synchronizer_ff";
end afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_6;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_6 is
  signal \n_0_Q_reg_reg[0]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[1]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[3]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[4]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[5]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[6]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[7]\ : STD_LOGIC;
  signal \^p_0_in\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \wr_pntr_bin[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_pntr_bin[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_pntr_bin[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_pntr_bin[5]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_pntr_bin[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wr_pntr_bin[7]_i_1\ : label is "soft_lutpair2";
begin
  p_0_in(8 downto 0) <= \^p_0_in\(8 downto 0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(0),
      Q => \n_0_Q_reg_reg[0]\
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(1),
      Q => \n_0_Q_reg_reg[1]\
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(2),
      Q => \n_0_Q_reg_reg[2]\
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(3),
      Q => \n_0_Q_reg_reg[3]\
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(4),
      Q => \n_0_Q_reg_reg[4]\
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(5),
      Q => \n_0_Q_reg_reg[5]\
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(6),
      Q => \n_0_Q_reg_reg[6]\
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(7),
      Q => \n_0_Q_reg_reg[7]\
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => D(8),
      Q => \^p_0_in\(8)
    );
\wr_pntr_bin[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \n_0_Q_reg_reg[0]\,
      I3 => \^p_0_in\(3),
      O => \^p_0_in\(0)
    );
\wr_pntr_bin[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \^p_0_in\(3),
      O => \^p_0_in\(1)
    );
\wr_pntr_bin[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^p_0_in\(3),
      I1 => \n_0_Q_reg_reg[2]\,
      O => \^p_0_in\(2)
    );
\wr_pntr_bin[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[4]\,
      I1 => \^p_0_in\(8),
      I2 => \n_0_Q_reg_reg[6]\,
      I3 => \n_0_Q_reg_reg[7]\,
      I4 => \n_0_Q_reg_reg[5]\,
      I5 => \n_0_Q_reg_reg[3]\,
      O => \^p_0_in\(3)
    );
\wr_pntr_bin[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[5]\,
      I1 => \n_0_Q_reg_reg[7]\,
      I2 => \n_0_Q_reg_reg[6]\,
      I3 => \^p_0_in\(8),
      I4 => \n_0_Q_reg_reg[4]\,
      O => \^p_0_in\(4)
    );
\wr_pntr_bin[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \^p_0_in\(8),
      I1 => \n_0_Q_reg_reg[6]\,
      I2 => \n_0_Q_reg_reg[7]\,
      I3 => \n_0_Q_reg_reg[5]\,
      O => \^p_0_in\(5)
    );
\wr_pntr_bin[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[7]\,
      I1 => \n_0_Q_reg_reg[6]\,
      I2 => \^p_0_in\(8),
      O => \^p_0_in\(6)
    );
\wr_pntr_bin[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_Q_reg_reg[7]\,
      I1 => \^p_0_in\(8),
      O => \^p_0_in\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_7 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_7 : entity is "synchronizer_ff";
end afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_7;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_7 is
  signal \^o1\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \n_0_Q_reg_reg[0]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[1]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[3]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[4]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[5]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[6]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[7]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_pntr_bin[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rd_pntr_bin[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rd_pntr_bin[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rd_pntr_bin[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rd_pntr_bin[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rd_pntr_bin[7]_i_1\ : label is "soft_lutpair5";
begin
  O1(7 downto 0) <= \^o1\(7 downto 0);
  Q(0) <= \^q\(0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(0),
      Q => \n_0_Q_reg_reg[0]\
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(1),
      Q => \n_0_Q_reg_reg[1]\
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(2),
      Q => \n_0_Q_reg_reg[2]\
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(3),
      Q => \n_0_Q_reg_reg[3]\
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(4),
      Q => \n_0_Q_reg_reg[4]\
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(5),
      Q => \n_0_Q_reg_reg[5]\
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(6),
      Q => \n_0_Q_reg_reg[6]\
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(7),
      Q => \n_0_Q_reg_reg[7]\
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => D(8),
      Q => \^q\(0)
    );
\rd_pntr_bin[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \n_0_Q_reg_reg[0]\,
      I3 => \^o1\(3),
      O => \^o1\(0)
    );
\rd_pntr_bin[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \^o1\(3),
      O => \^o1\(1)
    );
\rd_pntr_bin[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^o1\(3),
      I1 => \n_0_Q_reg_reg[2]\,
      O => \^o1\(2)
    );
\rd_pntr_bin[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[4]\,
      I1 => \^q\(0),
      I2 => \n_0_Q_reg_reg[6]\,
      I3 => \n_0_Q_reg_reg[7]\,
      I4 => \n_0_Q_reg_reg[5]\,
      I5 => \n_0_Q_reg_reg[3]\,
      O => \^o1\(3)
    );
\rd_pntr_bin[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[5]\,
      I1 => \n_0_Q_reg_reg[7]\,
      I2 => \n_0_Q_reg_reg[6]\,
      I3 => \^q\(0),
      I4 => \n_0_Q_reg_reg[4]\,
      O => \^o1\(4)
    );
\rd_pntr_bin[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \^q\(0),
      I1 => \n_0_Q_reg_reg[6]\,
      I2 => \n_0_Q_reg_reg[7]\,
      I3 => \n_0_Q_reg_reg[5]\,
      O => \^o1\(5)
    );
\rd_pntr_bin[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[7]\,
      I1 => \n_0_Q_reg_reg[6]\,
      I2 => \^q\(0),
      O => \^o1\(6)
    );
\rd_pntr_bin[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_Q_reg_reg[7]\,
      I1 => \^q\(0),
      O => \^o1\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_wr_bin_cntr is
  port (
    I3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    I1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    v1_reg : out STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    RD_PNTR_WR : in STD_LOGIC_VECTOR ( 8 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_wr_bin_cntr : entity is "wr_bin_cntr";
end afifo_32x512_axis_data_fifo_0_0_wr_bin_cntr;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_wr_bin_cntr is
  signal \^o1\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \n_0_gic0.gc0.count[8]_i_2\ : STD_LOGIC;
  signal p_8_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gic0.gc0.count[0]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gic0.gc0.count[2]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gic0.gc0.count[3]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gic0.gc0.count[4]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gic0.gc0.count[7]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \gic0.gc0.count[8]_i_1\ : label is "soft_lutpair28";
begin
  O1(0) <= \^o1\(0);
  Q(8 downto 0) <= \^q\(8 downto 0);
\gic0.gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      O => \plusOp__1\(0)
    );
\gic0.gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      O => \plusOp__1\(1)
    );
\gic0.gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(2),
      O => \plusOp__1\(2)
    );
\gic0.gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => wr_pntr_plus2(1),
      I1 => wr_pntr_plus2(0),
      I2 => wr_pntr_plus2(2),
      I3 => wr_pntr_plus2(3),
      O => \plusOp__1\(3)
    );
\gic0.gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => wr_pntr_plus2(2),
      I1 => wr_pntr_plus2(0),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(3),
      I4 => wr_pntr_plus2(4),
      O => \plusOp__1\(4)
    );
\gic0.gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => wr_pntr_plus2(3),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(0),
      I3 => wr_pntr_plus2(2),
      I4 => wr_pntr_plus2(4),
      I5 => wr_pntr_plus2(5),
      O => \plusOp__1\(5)
    );
\gic0.gc0.count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_gic0.gc0.count[8]_i_2\,
      I1 => wr_pntr_plus2(6),
      O => \plusOp__1\(6)
    );
\gic0.gc0.count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_0_gic0.gc0.count[8]_i_2\,
      I1 => wr_pntr_plus2(6),
      I2 => wr_pntr_plus2(7),
      O => \plusOp__1\(7)
    );
\gic0.gc0.count[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => wr_pntr_plus2(6),
      I1 => \n_0_gic0.gc0.count[8]_i_2\,
      I2 => wr_pntr_plus2(7),
      I3 => \^o1\(0),
      O => \plusOp__1\(8)
    );
\gic0.gc0.count[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => wr_pntr_plus2(5),
      I1 => wr_pntr_plus2(3),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(0),
      I4 => wr_pntr_plus2(2),
      I5 => wr_pntr_plus2(4),
      O => \n_0_gic0.gc0.count[8]_i_2\
    );
\gic0.gc0.count_d1_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => wr_pntr_plus2(0),
      PRE => I2(0),
      Q => p_8_out(0)
    );
\gic0.gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => wr_pntr_plus2(1),
      Q => p_8_out(1)
    );
\gic0.gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => wr_pntr_plus2(2),
      Q => p_8_out(2)
    );
\gic0.gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => wr_pntr_plus2(3),
      Q => p_8_out(3)
    );
\gic0.gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => wr_pntr_plus2(4),
      Q => p_8_out(4)
    );
\gic0.gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => wr_pntr_plus2(5),
      Q => p_8_out(5)
    );
\gic0.gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => wr_pntr_plus2(6),
      Q => p_8_out(6)
    );
\gic0.gc0.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => wr_pntr_plus2(7),
      Q => p_8_out(7)
    );
\gic0.gc0.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \^o1\(0),
      Q => p_8_out(8)
    );
\gic0.gc0.count_d2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(0),
      Q => \^q\(0)
    );
\gic0.gc0.count_d2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(1),
      Q => \^q\(1)
    );
\gic0.gc0.count_d2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(2),
      Q => \^q\(2)
    );
\gic0.gc0.count_d2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(3),
      Q => \^q\(3)
    );
\gic0.gc0.count_d2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(4),
      Q => \^q\(4)
    );
\gic0.gc0.count_d2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(5),
      Q => \^q\(5)
    );
\gic0.gc0.count_d2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(6),
      Q => \^q\(6)
    );
\gic0.gc0.count_d2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(7),
      Q => \^q\(7)
    );
\gic0.gc0.count_d2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => p_8_out(8),
      Q => \^q\(8)
    );
\gic0.gc0.count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(0),
      Q => wr_pntr_plus2(0)
    );
\gic0.gc0.count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => \plusOp__1\(1),
      PRE => I2(0),
      Q => wr_pntr_plus2(1)
    );
\gic0.gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(2),
      Q => wr_pntr_plus2(2)
    );
\gic0.gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(3),
      Q => wr_pntr_plus2(3)
    );
\gic0.gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(4),
      Q => wr_pntr_plus2(4)
    );
\gic0.gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(5),
      Q => wr_pntr_plus2(5)
    );
\gic0.gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(6),
      Q => wr_pntr_plus2(6)
    );
\gic0.gc0.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(7),
      Q => wr_pntr_plus2(7)
    );
\gic0.gc0.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => I2(0),
      D => \plusOp__1\(8),
      Q => \^o1\(0)
    );
\gmux.gm[0].gm1.m1_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out(0),
      I1 => RD_PNTR_WR(0),
      I2 => p_8_out(1),
      I3 => RD_PNTR_WR(1),
      O => v1_reg(0)
    );
\gmux.gm[0].gm1.m1_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => RD_PNTR_WR(0),
      I2 => wr_pntr_plus2(1),
      I3 => RD_PNTR_WR(1),
      O => v1_reg_0(0)
    );
\gmux.gm[1].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out(2),
      I1 => RD_PNTR_WR(2),
      I2 => p_8_out(3),
      I3 => RD_PNTR_WR(3),
      O => v1_reg(1)
    );
\gmux.gm[1].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(2),
      I1 => RD_PNTR_WR(2),
      I2 => wr_pntr_plus2(3),
      I3 => RD_PNTR_WR(3),
      O => v1_reg_0(1)
    );
\gmux.gm[2].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out(4),
      I1 => RD_PNTR_WR(4),
      I2 => p_8_out(5),
      I3 => RD_PNTR_WR(5),
      O => v1_reg(2)
    );
\gmux.gm[2].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(4),
      I1 => RD_PNTR_WR(4),
      I2 => wr_pntr_plus2(5),
      I3 => RD_PNTR_WR(5),
      O => v1_reg_0(2)
    );
\gmux.gm[3].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out(6),
      I1 => RD_PNTR_WR(6),
      I2 => p_8_out(7),
      I3 => RD_PNTR_WR(7),
      O => v1_reg(3)
    );
\gmux.gm[3].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(6),
      I1 => RD_PNTR_WR(6),
      I2 => wr_pntr_plus2(7),
      I3 => RD_PNTR_WR(7),
      O => v1_reg_0(3)
    );
\gmux.gm[4].gms.ms_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => p_8_out(8),
      I1 => RD_PNTR_WR(8),
      O => v1_reg(4)
    );
\wr_data_count_i[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(3),
      I1 => RD_PNTR_WR(3),
      O => S(3)
    );
\wr_data_count_i[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(2),
      I1 => RD_PNTR_WR(2),
      O => S(2)
    );
\wr_data_count_i[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(1),
      I1 => RD_PNTR_WR(1),
      O => S(1)
    );
\wr_data_count_i[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(0),
      I1 => RD_PNTR_WR(0),
      O => S(0)
    );
\wr_data_count_i[9]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(8),
      I1 => RD_PNTR_WR(8),
      O => I3(0)
    );
\wr_data_count_i[9]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(7),
      I1 => RD_PNTR_WR(7),
      O => I1(3)
    );
\wr_data_count_i[9]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(6),
      I1 => RD_PNTR_WR(6),
      O => I1(2)
    );
\wr_data_count_i[9]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(5),
      I1 => RD_PNTR_WR(5),
      O => I1(1)
    );
\wr_data_count_i[9]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(4),
      I1 => RD_PNTR_WR(4),
      O => I1(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_wr_dc_fwft_ext_as is
  port (
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    s_aclk : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_wr_dc_fwft_ext_as : entity is "wr_dc_fwft_ext_as";
end afifo_32x512_axis_data_fifo_0_0_wr_dc_fwft_ext_as;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_wr_dc_fwft_ext_as is
  signal \n_0_wr_data_count_i[1]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[2]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[3]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[4]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[5]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[6]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[7]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[7]_i_2\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[8]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[9]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i[9]_i_3\ : STD_LOGIC;
  signal \n_0_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_0_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \n_1_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_1_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \n_2_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_2_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \n_3_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_3_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \n_4_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_4_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \n_5_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_5_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \n_6_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_6_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \n_7_wr_data_count_i_reg[0]_i_1\ : STD_LOGIC;
  signal \n_7_wr_data_count_i_reg[9]_i_2\ : STD_LOGIC;
  signal \n_7_wr_data_count_i_reg[9]_i_4\ : STD_LOGIC;
  signal \NLW_wr_data_count_i_reg[9]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wr_data_count_i_reg[9]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \wr_data_count_i[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \wr_data_count_i[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \wr_data_count_i[3]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \wr_data_count_i[4]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \wr_data_count_i[5]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \wr_data_count_i[7]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \wr_data_count_i[8]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \wr_data_count_i[9]_i_1\ : label is "soft_lutpair24";
begin
\wr_data_count_i[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \n_6_wr_data_count_i_reg[0]_i_1\,
      O => \n_0_wr_data_count_i[1]_i_1\
    );
\wr_data_count_i[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_6_wr_data_count_i_reg[0]_i_1\,
      I1 => \n_5_wr_data_count_i_reg[0]_i_1\,
      O => \n_0_wr_data_count_i[2]_i_1\
    );
\wr_data_count_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_6_wr_data_count_i_reg[0]_i_1\,
      I1 => \n_5_wr_data_count_i_reg[0]_i_1\,
      I2 => \n_4_wr_data_count_i_reg[0]_i_1\,
      O => \n_0_wr_data_count_i[3]_i_1\
    );
\wr_data_count_i[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \n_5_wr_data_count_i_reg[0]_i_1\,
      I1 => \n_6_wr_data_count_i_reg[0]_i_1\,
      I2 => \n_4_wr_data_count_i_reg[0]_i_1\,
      I3 => \n_7_wr_data_count_i_reg[9]_i_4\,
      O => \n_0_wr_data_count_i[4]_i_1\
    );
\wr_data_count_i[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \n_4_wr_data_count_i_reg[0]_i_1\,
      I1 => \n_6_wr_data_count_i_reg[0]_i_1\,
      I2 => \n_5_wr_data_count_i_reg[0]_i_1\,
      I3 => \n_7_wr_data_count_i_reg[9]_i_4\,
      I4 => \n_6_wr_data_count_i_reg[9]_i_4\,
      O => \n_0_wr_data_count_i[5]_i_1\
    );
\wr_data_count_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \n_6_wr_data_count_i_reg[9]_i_4\,
      I1 => \n_7_wr_data_count_i_reg[9]_i_4\,
      I2 => \n_4_wr_data_count_i_reg[0]_i_1\,
      I3 => \n_5_wr_data_count_i_reg[0]_i_1\,
      I4 => \n_6_wr_data_count_i_reg[0]_i_1\,
      I5 => \n_5_wr_data_count_i_reg[9]_i_4\,
      O => \n_0_wr_data_count_i[6]_i_1\
    );
\wr_data_count_i[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \n_0_wr_data_count_i[7]_i_2\,
      I1 => \n_5_wr_data_count_i_reg[9]_i_4\,
      I2 => \n_6_wr_data_count_i_reg[9]_i_4\,
      I3 => \n_4_wr_data_count_i_reg[0]_i_1\,
      I4 => \n_7_wr_data_count_i_reg[9]_i_4\,
      I5 => \n_4_wr_data_count_i_reg[9]_i_4\,
      O => \n_0_wr_data_count_i[7]_i_1\
    );
\wr_data_count_i[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \n_5_wr_data_count_i_reg[0]_i_1\,
      I1 => \n_6_wr_data_count_i_reg[0]_i_1\,
      O => \n_0_wr_data_count_i[7]_i_2\
    );
\wr_data_count_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_0_wr_data_count_i[9]_i_3\,
      I1 => \n_4_wr_data_count_i_reg[9]_i_4\,
      I2 => \n_7_wr_data_count_i_reg[9]_i_2\,
      O => \n_0_wr_data_count_i[8]_i_1\
    );
\wr_data_count_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => \n_7_wr_data_count_i_reg[9]_i_2\,
      I1 => \n_0_wr_data_count_i[9]_i_3\,
      I2 => \n_4_wr_data_count_i_reg[9]_i_4\,
      O => \n_0_wr_data_count_i[9]_i_1\
    );
\wr_data_count_i[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => \n_7_wr_data_count_i_reg[9]_i_4\,
      I1 => \n_4_wr_data_count_i_reg[0]_i_1\,
      I2 => \n_6_wr_data_count_i_reg[9]_i_4\,
      I3 => \n_5_wr_data_count_i_reg[9]_i_4\,
      I4 => \n_5_wr_data_count_i_reg[0]_i_1\,
      I5 => \n_6_wr_data_count_i_reg[0]_i_1\,
      O => \n_0_wr_data_count_i[9]_i_3\
    );
\wr_data_count_i_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_7_wr_data_count_i_reg[0]_i_1\,
      Q => axis_wr_data_count(0)
    );
\wr_data_count_i_reg[0]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_wr_data_count_i_reg[0]_i_1\,
      CO(2) => \n_1_wr_data_count_i_reg[0]_i_1\,
      CO(1) => \n_2_wr_data_count_i_reg[0]_i_1\,
      CO(0) => \n_3_wr_data_count_i_reg[0]_i_1\,
      CYINIT => '1',
      DI(3 downto 0) => Q(3 downto 0),
      O(3) => \n_4_wr_data_count_i_reg[0]_i_1\,
      O(2) => \n_5_wr_data_count_i_reg[0]_i_1\,
      O(1) => \n_6_wr_data_count_i_reg[0]_i_1\,
      O(0) => \n_7_wr_data_count_i_reg[0]_i_1\,
      S(3 downto 0) => S(3 downto 0)
    );
\wr_data_count_i_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[1]_i_1\,
      Q => axis_wr_data_count(1)
    );
\wr_data_count_i_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[2]_i_1\,
      Q => axis_wr_data_count(2)
    );
\wr_data_count_i_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[3]_i_1\,
      Q => axis_wr_data_count(3)
    );
\wr_data_count_i_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[4]_i_1\,
      Q => axis_wr_data_count(4)
    );
\wr_data_count_i_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[5]_i_1\,
      Q => axis_wr_data_count(5)
    );
\wr_data_count_i_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[6]_i_1\,
      Q => axis_wr_data_count(6)
    );
\wr_data_count_i_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[7]_i_1\,
      Q => axis_wr_data_count(7)
    );
\wr_data_count_i_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[8]_i_1\,
      Q => axis_wr_data_count(8)
    );
\wr_data_count_i_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I2(0),
      D => \n_0_wr_data_count_i[9]_i_1\,
      Q => axis_wr_data_count(9)
    );
\wr_data_count_i_reg[9]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wr_data_count_i_reg[9]_i_4\,
      CO(3 downto 0) => \NLW_wr_data_count_i_reg[9]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_wr_data_count_i_reg[9]_i_2_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_wr_data_count_i_reg[9]_i_2\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => I3(0)
    );
\wr_data_count_i_reg[9]_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wr_data_count_i_reg[0]_i_1\,
      CO(3) => \n_0_wr_data_count_i_reg[9]_i_4\,
      CO(2) => \n_1_wr_data_count_i_reg[9]_i_4\,
      CO(1) => \n_2_wr_data_count_i_reg[9]_i_4\,
      CO(0) => \n_3_wr_data_count_i_reg[9]_i_4\,
      CYINIT => '0',
      DI(3 downto 0) => Q(7 downto 4),
      O(3) => \n_4_wr_data_count_i_reg[9]_i_4\,
      O(2) => \n_5_wr_data_count_i_reg[9]_i_4\,
      O(1) => \n_6_wr_data_count_i_reg[9]_i_4\,
      O(0) => \n_7_wr_data_count_i_reg[9]_i_4\,
      S(3 downto 0) => I1(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_width is
  port (
    D : out STD_LOGIC_VECTOR ( 32 downto 0 );
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    ram_rd_en_i : in STD_LOGIC;
    WEBWE : in STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_width;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_width is
begin
\prim_noinit.ram\: entity work.afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_wrapper
    port map (
      D(32 downto 0) => D(32 downto 0),
      O1(8 downto 0) => O1(8 downto 0),
      Q(8 downto 0) => Q(8 downto 0),
      WEBWE(0) => WEBWE(0),
      m_aclk => m_aclk,
      ram_rd_en_i => ram_rd_en_i,
      s_aclk => s_aclk,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_clk_x_pntrs is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    WR_PNTR_RD : out STD_LOGIC_VECTOR ( 8 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    v1_reg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    v1_reg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    v1_reg_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    RD_PNTR_WR : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I3 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_aclk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_clk_x_pntrs : entity is "clk_x_pntrs";
end afifo_32x512_axis_data_fifo_0_0_clk_x_pntrs;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_clk_x_pntrs is
  signal Q_0 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^rd_pntr_wr\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^wr_pntr_rd\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \n_0_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_0_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_0_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_0_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[0]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[1]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[2]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[3]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[4]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[5]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[6]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[7]_i_1\ : STD_LOGIC;
  signal \n_1_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_1_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_1_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_1_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_7_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_7_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_7_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_7_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_8_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_8_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_8_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_8_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_0_in7_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rd_pntr_gc : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal wr_pntr_gc : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_pntr_gc[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rd_pntr_gc[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rd_pntr_gc[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rd_pntr_gc[3]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rd_pntr_gc[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rd_pntr_gc[5]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rd_pntr_gc[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rd_pntr_gc[7]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \wr_pntr_gc[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_pntr_gc[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_pntr_gc[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \wr_pntr_gc[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \wr_pntr_gc[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_pntr_gc[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_pntr_gc[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wr_pntr_gc[7]_i_1\ : label is "soft_lutpair9";
begin
  RD_PNTR_WR(8 downto 0) <= \^rd_pntr_wr\(8 downto 0);
  WR_PNTR_RD(8 downto 0) <= \^wr_pntr_rd\(8 downto 0);
\gmux.gm[0].gm1.m1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(0),
      I1 => Q(0),
      I2 => \^wr_pntr_rd\(1),
      I3 => Q(1),
      O => v1_reg(0)
    );
\gmux.gm[0].gm1.m1_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(0),
      I1 => I1(0),
      I2 => \^wr_pntr_rd\(1),
      I3 => I1(1),
      O => v1_reg_0(0)
    );
\gmux.gm[1].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(2),
      I1 => Q(2),
      I2 => \^wr_pntr_rd\(3),
      I3 => Q(3),
      O => v1_reg(1)
    );
\gmux.gm[1].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(2),
      I1 => I1(2),
      I2 => \^wr_pntr_rd\(3),
      I3 => I1(3),
      O => v1_reg_0(1)
    );
\gmux.gm[2].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(4),
      I1 => Q(4),
      I2 => \^wr_pntr_rd\(5),
      I3 => Q(5),
      O => v1_reg(2)
    );
\gmux.gm[2].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(4),
      I1 => I1(4),
      I2 => \^wr_pntr_rd\(5),
      I3 => I1(5),
      O => v1_reg_0(2)
    );
\gmux.gm[3].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(6),
      I1 => Q(6),
      I2 => \^wr_pntr_rd\(7),
      I3 => Q(7),
      O => v1_reg(3)
    );
\gmux.gm[3].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^wr_pntr_rd\(6),
      I1 => I1(6),
      I2 => \^wr_pntr_rd\(7),
      I3 => I1(7),
      O => v1_reg_0(3)
    );
\gmux.gm[4].gms.ms_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^rd_pntr_wr\(8),
      I1 => I2(0),
      O => v1_reg_1(0)
    );
\gsync_stage[1].rd_stg_inst\: entity work.afifo_32x512_axis_data_fifo_0_0_synchronizer_ff
    port map (
      I1(8 downto 0) => wr_pntr_gc(8 downto 0),
      I5(0) => I5(0),
      Q(8 downto 0) => Q_0(8 downto 0),
      m_aclk => m_aclk
    );
\gsync_stage[1].wr_stg_inst\: entity work.afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_3
    port map (
      I1(8 downto 0) => rd_pntr_gc(8 downto 0),
      I4(0) => I4(0),
      Q(8) => \n_0_gsync_stage[1].wr_stg_inst\,
      Q(7) => \n_1_gsync_stage[1].wr_stg_inst\,
      Q(6) => \n_2_gsync_stage[1].wr_stg_inst\,
      Q(5) => \n_3_gsync_stage[1].wr_stg_inst\,
      Q(4) => \n_4_gsync_stage[1].wr_stg_inst\,
      Q(3) => \n_5_gsync_stage[1].wr_stg_inst\,
      Q(2) => \n_6_gsync_stage[1].wr_stg_inst\,
      Q(1) => \n_7_gsync_stage[1].wr_stg_inst\,
      Q(0) => \n_8_gsync_stage[1].wr_stg_inst\,
      s_aclk => s_aclk
    );
\gsync_stage[2].rd_stg_inst\: entity work.afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_4
    port map (
      D(8 downto 0) => Q_0(8 downto 0),
      I5(0) => I5(0),
      Q(8) => \n_0_gsync_stage[2].rd_stg_inst\,
      Q(7) => \n_1_gsync_stage[2].rd_stg_inst\,
      Q(6) => \n_2_gsync_stage[2].rd_stg_inst\,
      Q(5) => \n_3_gsync_stage[2].rd_stg_inst\,
      Q(4) => \n_4_gsync_stage[2].rd_stg_inst\,
      Q(3) => \n_5_gsync_stage[2].rd_stg_inst\,
      Q(2) => \n_6_gsync_stage[2].rd_stg_inst\,
      Q(1) => \n_7_gsync_stage[2].rd_stg_inst\,
      Q(0) => \n_8_gsync_stage[2].rd_stg_inst\,
      m_aclk => m_aclk
    );
\gsync_stage[2].wr_stg_inst\: entity work.afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_5
    port map (
      D(8) => \n_0_gsync_stage[1].wr_stg_inst\,
      D(7) => \n_1_gsync_stage[1].wr_stg_inst\,
      D(6) => \n_2_gsync_stage[1].wr_stg_inst\,
      D(5) => \n_3_gsync_stage[1].wr_stg_inst\,
      D(4) => \n_4_gsync_stage[1].wr_stg_inst\,
      D(3) => \n_5_gsync_stage[1].wr_stg_inst\,
      D(2) => \n_6_gsync_stage[1].wr_stg_inst\,
      D(1) => \n_7_gsync_stage[1].wr_stg_inst\,
      D(0) => \n_8_gsync_stage[1].wr_stg_inst\,
      I4(0) => I4(0),
      Q(8) => \n_0_gsync_stage[2].wr_stg_inst\,
      Q(7) => \n_1_gsync_stage[2].wr_stg_inst\,
      Q(6) => \n_2_gsync_stage[2].wr_stg_inst\,
      Q(5) => \n_3_gsync_stage[2].wr_stg_inst\,
      Q(4) => \n_4_gsync_stage[2].wr_stg_inst\,
      Q(3) => \n_5_gsync_stage[2].wr_stg_inst\,
      Q(2) => \n_6_gsync_stage[2].wr_stg_inst\,
      Q(1) => \n_7_gsync_stage[2].wr_stg_inst\,
      Q(0) => \n_8_gsync_stage[2].wr_stg_inst\,
      s_aclk => s_aclk
    );
\gsync_stage[3].rd_stg_inst\: entity work.afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_6
    port map (
      D(8) => \n_0_gsync_stage[2].rd_stg_inst\,
      D(7) => \n_1_gsync_stage[2].rd_stg_inst\,
      D(6) => \n_2_gsync_stage[2].rd_stg_inst\,
      D(5) => \n_3_gsync_stage[2].rd_stg_inst\,
      D(4) => \n_4_gsync_stage[2].rd_stg_inst\,
      D(3) => \n_5_gsync_stage[2].rd_stg_inst\,
      D(2) => \n_6_gsync_stage[2].rd_stg_inst\,
      D(1) => \n_7_gsync_stage[2].rd_stg_inst\,
      D(0) => \n_8_gsync_stage[2].rd_stg_inst\,
      I5(0) => I5(0),
      m_aclk => m_aclk,
      p_0_in(8 downto 0) => p_0_in(8 downto 0)
    );
\gsync_stage[3].wr_stg_inst\: entity work.afifo_32x512_axis_data_fifo_0_0_synchronizer_ff_7
    port map (
      D(8) => \n_0_gsync_stage[2].wr_stg_inst\,
      D(7) => \n_1_gsync_stage[2].wr_stg_inst\,
      D(6) => \n_2_gsync_stage[2].wr_stg_inst\,
      D(5) => \n_3_gsync_stage[2].wr_stg_inst\,
      D(4) => \n_4_gsync_stage[2].wr_stg_inst\,
      D(3) => \n_5_gsync_stage[2].wr_stg_inst\,
      D(2) => \n_6_gsync_stage[2].wr_stg_inst\,
      D(1) => \n_7_gsync_stage[2].wr_stg_inst\,
      D(0) => \n_8_gsync_stage[2].wr_stg_inst\,
      I4(0) => I4(0),
      O1(7) => \n_1_gsync_stage[3].wr_stg_inst\,
      O1(6) => \n_2_gsync_stage[3].wr_stg_inst\,
      O1(5) => \n_3_gsync_stage[3].wr_stg_inst\,
      O1(4) => \n_4_gsync_stage[3].wr_stg_inst\,
      O1(3) => \n_5_gsync_stage[3].wr_stg_inst\,
      O1(2) => \n_6_gsync_stage[3].wr_stg_inst\,
      O1(1) => \n_7_gsync_stage[3].wr_stg_inst\,
      O1(0) => \n_8_gsync_stage[3].wr_stg_inst\,
      Q(0) => \n_0_gsync_stage[3].wr_stg_inst\,
      s_aclk => s_aclk
    );
\gvalid_low.rd_dc_i[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(3),
      I1 => Q(3),
      O => O2(3)
    );
\gvalid_low.rd_dc_i[8]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(2),
      I1 => Q(2),
      O => O2(2)
    );
\gvalid_low.rd_dc_i[8]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(1),
      I1 => Q(1),
      O => O2(1)
    );
\gvalid_low.rd_dc_i[8]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(0),
      I1 => Q(0),
      O => O2(0)
    );
\gvalid_low.rd_dc_i[9]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(8),
      I1 => Q(8),
      O => S(0)
    );
\gvalid_low.rd_dc_i[9]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(7),
      I1 => Q(7),
      O => O1(3)
    );
\gvalid_low.rd_dc_i[9]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(6),
      I1 => Q(6),
      O => O1(2)
    );
\gvalid_low.rd_dc_i[9]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(5),
      I1 => Q(5),
      O => O1(1)
    );
\gvalid_low.rd_dc_i[9]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(4),
      I1 => Q(4),
      O => O1(0)
    );
\rd_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_8_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(0)
    );
\rd_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_7_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(1)
    );
\rd_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_6_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(2)
    );
\rd_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_5_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(3)
    );
\rd_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_4_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(4)
    );
\rd_pntr_bin_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_3_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(5)
    );
\rd_pntr_bin_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_2_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(6)
    );
\rd_pntr_bin_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_1_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(7)
    );
\rd_pntr_bin_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => \n_0_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(8)
    );
\rd_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \n_0_rd_pntr_gc[0]_i_1\
    );
\rd_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(1),
      I1 => Q(2),
      O => \n_0_rd_pntr_gc[1]_i_1\
    );
\rd_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(2),
      I1 => Q(3),
      O => \n_0_rd_pntr_gc[2]_i_1\
    );
\rd_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(3),
      I1 => Q(4),
      O => \n_0_rd_pntr_gc[3]_i_1\
    );
\rd_pntr_gc[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(4),
      I1 => Q(5),
      O => \n_0_rd_pntr_gc[4]_i_1\
    );
\rd_pntr_gc[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(5),
      I1 => Q(6),
      O => \n_0_rd_pntr_gc[5]_i_1\
    );
\rd_pntr_gc[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(6),
      I1 => Q(7),
      O => \n_0_rd_pntr_gc[6]_i_1\
    );
\rd_pntr_gc[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(7),
      I1 => Q(8),
      O => \n_0_rd_pntr_gc[7]_i_1\
    );
\rd_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[0]_i_1\,
      Q => rd_pntr_gc(0)
    );
\rd_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[1]_i_1\,
      Q => rd_pntr_gc(1)
    );
\rd_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[2]_i_1\,
      Q => rd_pntr_gc(2)
    );
\rd_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[3]_i_1\,
      Q => rd_pntr_gc(3)
    );
\rd_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[4]_i_1\,
      Q => rd_pntr_gc(4)
    );
\rd_pntr_gc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[5]_i_1\,
      Q => rd_pntr_gc(5)
    );
\rd_pntr_gc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[6]_i_1\,
      Q => rd_pntr_gc(6)
    );
\rd_pntr_gc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_rd_pntr_gc[7]_i_1\,
      Q => rd_pntr_gc(7)
    );
\rd_pntr_gc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => Q(8),
      Q => rd_pntr_gc(8)
    );
\wr_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(0),
      Q => \^wr_pntr_rd\(0)
    );
\wr_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(1),
      Q => \^wr_pntr_rd\(1)
    );
\wr_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(2),
      Q => \^wr_pntr_rd\(2)
    );
\wr_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(3),
      Q => \^wr_pntr_rd\(3)
    );
\wr_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(4),
      Q => \^wr_pntr_rd\(4)
    );
\wr_pntr_bin_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(5),
      Q => \^wr_pntr_rd\(5)
    );
\wr_pntr_bin_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(6),
      Q => \^wr_pntr_rd\(6)
    );
\wr_pntr_bin_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(7),
      Q => \^wr_pntr_rd\(7)
    );
\wr_pntr_bin_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in(8),
      Q => \^wr_pntr_rd\(8)
    );
\wr_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(0),
      I1 => I3(1),
      O => p_0_in7_out(0)
    );
\wr_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(1),
      I1 => I3(2),
      O => p_0_in7_out(1)
    );
\wr_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(2),
      I1 => I3(3),
      O => p_0_in7_out(2)
    );
\wr_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(3),
      I1 => I3(4),
      O => p_0_in7_out(3)
    );
\wr_pntr_gc[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(4),
      I1 => I3(5),
      O => p_0_in7_out(4)
    );
\wr_pntr_gc[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(5),
      I1 => I3(6),
      O => p_0_in7_out(5)
    );
\wr_pntr_gc[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(6),
      I1 => I3(7),
      O => p_0_in7_out(6)
    );
\wr_pntr_gc[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I3(7),
      I1 => I3(8),
      O => p_0_in7_out(7)
    );
\wr_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(0),
      Q => wr_pntr_gc(0)
    );
\wr_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(1),
      Q => wr_pntr_gc(1)
    );
\wr_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(2),
      Q => wr_pntr_gc(2)
    );
\wr_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(3),
      Q => wr_pntr_gc(3)
    );
\wr_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(4),
      Q => wr_pntr_gc(4)
    );
\wr_pntr_gc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(5),
      Q => wr_pntr_gc(5)
    );
\wr_pntr_gc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(6),
      Q => wr_pntr_gc(6)
    );
\wr_pntr_gc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => p_0_in7_out(7),
      Q => wr_pntr_gc(7)
    );
\wr_pntr_gc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => I4(0),
      D => I3(8),
      Q => wr_pntr_gc(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_rd_status_flags_as is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_18_out : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_rd_status_flags_as : entity is "rd_status_flags_as";
end afifo_32x512_axis_data_fifo_0_0_rd_status_flags_as;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_rd_status_flags_as is
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_empty_fb_i_reg : label is "no";
begin
c0: entity work.afifo_32x512_axis_data_fifo_0_0_compare_1
    port map (
      I1 => I1,
      comp0 => comp0,
      v1_reg(3 downto 0) => v1_reg(3 downto 0)
    );
c1: entity work.afifo_32x512_axis_data_fifo_0_0_compare_2
    port map (
      I2 => I2,
      comp1 => comp1,
      v1_reg_0(3 downto 0) => v1_reg_0(3 downto 0)
    );
ram_empty_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_aclk,
      CE => '1',
      D => I3,
      PRE => Q(0),
      Q => p_18_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_wr_status_flags_as is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    rst_full_gen_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_wr_status_flags_as : entity is "wr_status_flags_as";
end afifo_32x512_axis_data_fifo_0_0_wr_status_flags_as;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_wr_status_flags_as is
  signal comp1 : STD_LOGIC;
  signal comp2 : STD_LOGIC;
  signal p_1_out : STD_LOGIC;
  signal ram_full_i : STD_LOGIC;
  signal ram_full_i_0 : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_full_fb_i_reg : label is "no";
  attribute equivalent_register_removal of ram_full_i_reg : label is "no";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => p_1_out,
      O => E(0)
    );
c1: entity work.afifo_32x512_axis_data_fifo_0_0_compare
    port map (
      comp1 => comp1,
      v1_reg(4 downto 0) => v1_reg(4 downto 0)
    );
c2: entity work.afifo_32x512_axis_data_fifo_0_0_compare_0
    port map (
      I1(0) => I1(0),
      comp2 => comp2,
      v1_reg_0(3 downto 0) => v1_reg_0(3 downto 0)
    );
ram_full_fb_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55550400"
    )
    port map (
      I0 => rst_full_gen_i,
      I1 => comp2,
      I2 => p_1_out,
      I3 => s_axis_tvalid,
      I4 => comp1,
      O => ram_full_i_0
    );
ram_full_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => ram_full_i_0,
      PRE => rst_d2,
      Q => p_1_out
    );
ram_full_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => ram_full_i_0,
      PRE => rst_d2,
      Q => ram_full_i
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => ram_full_i,
      O => s_axis_tready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_generic_cstr is
  port (
    D : out STD_LOGIC_VECTOR ( 32 downto 0 );
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    ram_rd_en_i : in STD_LOGIC;
    WEBWE : in STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_generic_cstr;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_prim_width
    port map (
      D(32 downto 0) => D(32 downto 0),
      O1(8 downto 0) => O1(8 downto 0),
      Q(8 downto 0) => Q(8 downto 0),
      WEBWE(0) => WEBWE(0),
      m_aclk => m_aclk,
      ram_rd_en_i => ram_rd_en_i,
      s_aclk => s_aclk,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_rd_logic is
  port (
    O1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    O2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ram_rd_en_i : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axis_tready : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_rd_logic : entity is "rd_logic";
end afifo_32x512_axis_data_fifo_0_0_rd_logic;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_rd_logic is
  signal comp0 : STD_LOGIC;
  signal comp1 : STD_LOGIC;
  signal diff_wr_rd : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal n_0_rpntr : STD_LOGIC;
  signal n_10_rpntr : STD_LOGIC;
  signal \n_2_gr1.rfwft\ : STD_LOGIC;
  signal \n_9_gr1.rfwft\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal p_14_out : STD_LOGIC;
  signal p_18_out : STD_LOGIC;
  signal p_2_out : STD_LOGIC;
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal user_valid : STD_LOGIC;
begin
\gr1.grdc2.rdc\: entity work.afifo_32x512_axis_data_fifo_0_0_rd_dc_fwft_ext_as
    port map (
      D(2 downto 0) => p_0_in(2 downto 0),
      I1 => \n_9_gr1.rfwft\,
      I2(0) => Q(1),
      I3(3 downto 0) => I1(3 downto 0),
      I4(3 downto 0) => I2(3 downto 0),
      O1(2 downto 1) => diff_wr_rd(2 downto 1),
      O1(0) => \plusOp__0\(0),
      Q(0) => p_2_out,
      S(0) => S(0),
      WR_PNTR_RD(7 downto 0) => WR_PNTR_RD(7 downto 0),
      axis_rd_data_count(9 downto 0) => axis_rd_data_count(9 downto 0),
      m_aclk => m_aclk,
      user_valid => user_valid
    );
\gr1.rfwft\: entity work.afifo_32x512_axis_data_fifo_0_0_rd_fwft
    port map (
      D(2 downto 0) => p_0_in(2 downto 0),
      E(0) => p_14_out,
      I1(2 downto 1) => diff_wr_rd(2 downto 1),
      I1(0) => \plusOp__0\(0),
      O1(0) => p_2_out,
      O2 => \n_2_gr1.rfwft\,
      O3(0) => E(0),
      O4 => \n_9_gr1.rfwft\,
      Q(1 downto 0) => Q(1 downto 0),
      comp0 => comp0,
      comp1 => comp1,
      m_aclk => m_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      p_18_out => p_18_out,
      ram_rd_en_i => ram_rd_en_i,
      user_valid => user_valid
    );
\gras.rsts\: entity work.afifo_32x512_axis_data_fifo_0_0_rd_status_flags_as
    port map (
      I1 => n_0_rpntr,
      I2 => n_10_rpntr,
      I3 => \n_2_gr1.rfwft\,
      Q(0) => Q(1),
      comp0 => comp0,
      comp1 => comp1,
      m_aclk => m_aclk,
      p_18_out => p_18_out,
      v1_reg(3 downto 0) => v1_reg(3 downto 0),
      v1_reg_0(3 downto 0) => v1_reg_0(3 downto 0)
    );
rpntr: entity work.afifo_32x512_axis_data_fifo_0_0_rd_bin_cntr
    port map (
      E(0) => p_14_out,
      I1(0) => Q(1),
      O1 => n_0_rpntr,
      O2(8 downto 0) => O1(8 downto 0),
      O3 => n_10_rpntr,
      Q(7 downto 0) => O2(7 downto 0),
      WR_PNTR_RD(0) => WR_PNTR_RD(8),
      m_aclk => m_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_wr_logic is
  port (
    WEBWE : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC;
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    RD_PNTR_WR : in STD_LOGIC_VECTOR ( 8 downto 0 );
    rst_full_gen_i : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_wr_logic : entity is "wr_logic";
end afifo_32x512_axis_data_fifo_0_0_wr_logic;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_wr_logic is
  signal \^q\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^webwe\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \c1/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \c2/v1_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal n_0_wpntr : STD_LOGIC;
  signal n_10_wpntr : STD_LOGIC;
  signal n_11_wpntr : STD_LOGIC;
  signal n_12_wpntr : STD_LOGIC;
  signal n_13_wpntr : STD_LOGIC;
  signal n_14_wpntr : STD_LOGIC;
  signal n_15_wpntr : STD_LOGIC;
  signal n_16_wpntr : STD_LOGIC;
  signal n_17_wpntr : STD_LOGIC;
begin
  Q(8 downto 0) <= \^q\(8 downto 0);
  WEBWE(0) <= \^webwe\(0);
\gwas.gwdc1.wdcext\: entity work.afifo_32x512_axis_data_fifo_0_0_wr_dc_fwft_ext_as
    port map (
      I1(3) => n_10_wpntr,
      I1(2) => n_11_wpntr,
      I1(1) => n_12_wpntr,
      I1(0) => n_13_wpntr,
      I2(0) => I2(0),
      I3(0) => n_0_wpntr,
      Q(7 downto 0) => \^q\(7 downto 0),
      S(3) => n_14_wpntr,
      S(2) => n_15_wpntr,
      S(1) => n_16_wpntr,
      S(0) => n_17_wpntr,
      axis_wr_data_count(9 downto 0) => axis_wr_data_count(9 downto 0),
      s_aclk => s_aclk
    );
\gwas.wsts\: entity work.afifo_32x512_axis_data_fifo_0_0_wr_status_flags_as
    port map (
      E(0) => \^webwe\(0),
      I1(0) => I1(0),
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_aclk => s_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid,
      v1_reg(4 downto 0) => \c1/v1_reg\(4 downto 0),
      v1_reg_0(3 downto 0) => \c2/v1_reg\(3 downto 0)
    );
wpntr: entity work.afifo_32x512_axis_data_fifo_0_0_wr_bin_cntr
    port map (
      E(0) => \^webwe\(0),
      I1(3) => n_10_wpntr,
      I1(2) => n_11_wpntr,
      I1(1) => n_12_wpntr,
      I1(0) => n_13_wpntr,
      I2(0) => I2(0),
      I3(0) => n_0_wpntr,
      O1(0) => O1(0),
      Q(8 downto 0) => \^q\(8 downto 0),
      RD_PNTR_WR(8 downto 0) => RD_PNTR_WR(8 downto 0),
      S(3) => n_14_wpntr,
      S(2) => n_15_wpntr,
      S(1) => n_16_wpntr,
      S(0) => n_17_wpntr,
      s_aclk => s_aclk,
      v1_reg(4 downto 0) => \c1/v1_reg\(4 downto 0),
      v1_reg_0(3 downto 0) => \c2/v1_reg\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_top is
  port (
    D : out STD_LOGIC_VECTOR ( 32 downto 0 );
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    ram_rd_en_i : in STD_LOGIC;
    WEBWE : in STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_top : entity is "blk_mem_gen_top";
end afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_top;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_top is
begin
\valid.cstr\: entity work.afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_generic_cstr
    port map (
      D(32 downto 0) => D(32 downto 0),
      O1(8 downto 0) => O1(8 downto 0),
      Q(8 downto 0) => Q(8 downto 0),
      WEBWE(0) => WEBWE(0),
      m_aclk => m_aclk,
      ram_rd_en_i => ram_rd_en_i,
      s_aclk => s_aclk,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2_synth is
  port (
    D : out STD_LOGIC_VECTOR ( 32 downto 0 );
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    ram_rd_en_i : in STD_LOGIC;
    WEBWE : in STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2_synth : entity is "blk_mem_gen_v8_2_synth";
end afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2_synth;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2_synth is
begin
\gnativebmg.native_blk_mem_gen\: entity work.afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_top
    port map (
      D(32 downto 0) => D(32 downto 0),
      O1(8 downto 0) => O1(8 downto 0),
      Q(8 downto 0) => Q(8 downto 0),
      WEBWE(0) => WEBWE(0),
      m_aclk => m_aclk,
      ram_rd_en_i => ram_rd_en_i,
      s_aclk => s_aclk,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2__parameterized0\ is
  port (
    D : out STD_LOGIC_VECTOR ( 32 downto 0 );
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    ram_rd_en_i : in STD_LOGIC;
    WEBWE : in STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2__parameterized0\ : entity is "blk_mem_gen_v8_2";
end \afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2__parameterized0\;

architecture STRUCTURE of \afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2__parameterized0\ is
begin
inst_blk_mem_gen: entity work.afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2_synth
    port map (
      D(32 downto 0) => D(32 downto 0),
      O1(8 downto 0) => O1(8 downto 0),
      Q(8 downto 0) => Q(8 downto 0),
      WEBWE(0) => WEBWE(0),
      m_aclk => m_aclk,
      ram_rd_en_i => ram_rd_en_i,
      s_aclk => s_aclk,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_memory is
  port (
    O2 : out STD_LOGIC_VECTOR ( 32 downto 0 );
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    ram_rd_en_i : in STD_LOGIC;
    WEBWE : in STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_memory : entity is "memory";
end afifo_32x512_axis_data_fifo_0_0_memory;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_memory is
  signal doutb : STD_LOGIC_VECTOR ( 32 downto 0 );
begin
\gbm.gbmg.gbmga.ngecc.bmg\: entity work.\afifo_32x512_axis_data_fifo_0_0_blk_mem_gen_v8_2__parameterized0\
    port map (
      D(32 downto 0) => doutb(32 downto 0),
      O1(8 downto 0) => O1(8 downto 0),
      Q(8 downto 0) => Q(8 downto 0),
      WEBWE(0) => WEBWE(0),
      m_aclk => m_aclk,
      ram_rd_en_i => ram_rd_en_i,
      s_aclk => s_aclk,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast
    );
\goreg_bm.dout_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(0),
      Q => O2(0),
      R => '0'
    );
\goreg_bm.dout_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(10),
      Q => O2(10),
      R => '0'
    );
\goreg_bm.dout_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(11),
      Q => O2(11),
      R => '0'
    );
\goreg_bm.dout_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(12),
      Q => O2(12),
      R => '0'
    );
\goreg_bm.dout_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(13),
      Q => O2(13),
      R => '0'
    );
\goreg_bm.dout_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(14),
      Q => O2(14),
      R => '0'
    );
\goreg_bm.dout_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(15),
      Q => O2(15),
      R => '0'
    );
\goreg_bm.dout_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(16),
      Q => O2(16),
      R => '0'
    );
\goreg_bm.dout_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(17),
      Q => O2(17),
      R => '0'
    );
\goreg_bm.dout_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(18),
      Q => O2(18),
      R => '0'
    );
\goreg_bm.dout_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(19),
      Q => O2(19),
      R => '0'
    );
\goreg_bm.dout_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(1),
      Q => O2(1),
      R => '0'
    );
\goreg_bm.dout_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(20),
      Q => O2(20),
      R => '0'
    );
\goreg_bm.dout_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(21),
      Q => O2(21),
      R => '0'
    );
\goreg_bm.dout_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(22),
      Q => O2(22),
      R => '0'
    );
\goreg_bm.dout_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(23),
      Q => O2(23),
      R => '0'
    );
\goreg_bm.dout_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(24),
      Q => O2(24),
      R => '0'
    );
\goreg_bm.dout_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(25),
      Q => O2(25),
      R => '0'
    );
\goreg_bm.dout_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(26),
      Q => O2(26),
      R => '0'
    );
\goreg_bm.dout_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(27),
      Q => O2(27),
      R => '0'
    );
\goreg_bm.dout_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(28),
      Q => O2(28),
      R => '0'
    );
\goreg_bm.dout_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(29),
      Q => O2(29),
      R => '0'
    );
\goreg_bm.dout_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(2),
      Q => O2(2),
      R => '0'
    );
\goreg_bm.dout_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(30),
      Q => O2(30),
      R => '0'
    );
\goreg_bm.dout_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(31),
      Q => O2(31),
      R => '0'
    );
\goreg_bm.dout_i_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(32),
      Q => O2(32),
      R => '0'
    );
\goreg_bm.dout_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(3),
      Q => O2(3),
      R => '0'
    );
\goreg_bm.dout_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(4),
      Q => O2(4),
      R => '0'
    );
\goreg_bm.dout_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(5),
      Q => O2(5),
      R => '0'
    );
\goreg_bm.dout_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(6),
      Q => O2(6),
      R => '0'
    );
\goreg_bm.dout_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(7),
      Q => O2(7),
      R => '0'
    );
\goreg_bm.dout_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(8),
      Q => O2(8),
      R => '0'
    );
\goreg_bm.dout_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_aclk,
      CE => E(0),
      D => doutb(9),
      Q => O2(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_fifo_generator_ramfifo is
  port (
    Q : out STD_LOGIC_VECTOR ( 32 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_fifo_generator_ramfifo : entity is "fifo_generator_ramfifo";
end afifo_32x512_axis_data_fifo_0_0_fifo_generator_ramfifo;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_ramfifo is
  signal RD_RST : STD_LOGIC;
  signal WR_RST : STD_LOGIC;
  signal \gras.rsts/c0/v1_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \gras.rsts/c1/v1_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \gwas.wsts/c2/v1_reg\ : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \n_0_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_0_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal \n_10_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_11_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_12_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_13_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_14_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_15_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_16_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_17_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_18_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_1_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_20_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ram_rd_en_i : STD_LOGIC;
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rd_rst_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rst_d2 : STD_LOGIC;
  signal rst_full_gen_i : STD_LOGIC;
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal wr_rst_i : STD_LOGIC_VECTOR ( 0 to 0 );
begin
\gntv_or_sync_fifo.gcx.clkx\: entity work.afifo_32x512_axis_data_fifo_0_0_clk_x_pntrs
    port map (
      I1(7 downto 0) => rd_pntr_plus1(7 downto 0),
      I2(0) => wr_pntr_plus2(8),
      I3(8 downto 0) => p_9_out(8 downto 0),
      I4(0) => wr_rst_i(0),
      I5(0) => rd_rst_i(1),
      O1(3) => \n_10_gntv_or_sync_fifo.gcx.clkx\,
      O1(2) => \n_11_gntv_or_sync_fifo.gcx.clkx\,
      O1(1) => \n_12_gntv_or_sync_fifo.gcx.clkx\,
      O1(0) => \n_13_gntv_or_sync_fifo.gcx.clkx\,
      O2(3) => \n_14_gntv_or_sync_fifo.gcx.clkx\,
      O2(2) => \n_15_gntv_or_sync_fifo.gcx.clkx\,
      O2(1) => \n_16_gntv_or_sync_fifo.gcx.clkx\,
      O2(0) => \n_17_gntv_or_sync_fifo.gcx.clkx\,
      Q(8 downto 0) => p_20_out(8 downto 0),
      RD_PNTR_WR(8 downto 0) => p_0_out(8 downto 0),
      S(0) => \n_0_gntv_or_sync_fifo.gcx.clkx\,
      WR_PNTR_RD(8 downto 0) => p_1_out(8 downto 0),
      m_aclk => m_aclk,
      s_aclk => s_aclk,
      v1_reg(3 downto 0) => \gras.rsts/c0/v1_reg\(3 downto 0),
      v1_reg_0(3 downto 0) => \gras.rsts/c1/v1_reg\(3 downto 0),
      v1_reg_1(0) => \gwas.wsts/c2/v1_reg\(4)
    );
\gntv_or_sync_fifo.gl0.rd\: entity work.afifo_32x512_axis_data_fifo_0_0_rd_logic
    port map (
      E(0) => \n_18_gntv_or_sync_fifo.gl0.rd\,
      I1(3) => \n_14_gntv_or_sync_fifo.gcx.clkx\,
      I1(2) => \n_15_gntv_or_sync_fifo.gcx.clkx\,
      I1(1) => \n_16_gntv_or_sync_fifo.gcx.clkx\,
      I1(0) => \n_17_gntv_or_sync_fifo.gcx.clkx\,
      I2(3) => \n_10_gntv_or_sync_fifo.gcx.clkx\,
      I2(2) => \n_11_gntv_or_sync_fifo.gcx.clkx\,
      I2(1) => \n_12_gntv_or_sync_fifo.gcx.clkx\,
      I2(0) => \n_13_gntv_or_sync_fifo.gcx.clkx\,
      O1(8 downto 0) => p_20_out(8 downto 0),
      O2(7 downto 0) => rd_pntr_plus1(7 downto 0),
      Q(1) => RD_RST,
      Q(0) => rd_rst_i(0),
      S(0) => \n_0_gntv_or_sync_fifo.gcx.clkx\,
      WR_PNTR_RD(8 downto 0) => p_1_out(8 downto 0),
      axis_rd_data_count(9 downto 0) => axis_rd_data_count(9 downto 0),
      m_aclk => m_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      ram_rd_en_i => ram_rd_en_i,
      v1_reg(3 downto 0) => \gras.rsts/c0/v1_reg\(3 downto 0),
      v1_reg_0(3 downto 0) => \gras.rsts/c1/v1_reg\(3 downto 0)
    );
\gntv_or_sync_fifo.gl0.wr\: entity work.afifo_32x512_axis_data_fifo_0_0_wr_logic
    port map (
      I1(0) => \gwas.wsts/c2/v1_reg\(4),
      I2(0) => WR_RST,
      O1(0) => wr_pntr_plus2(8),
      Q(8 downto 0) => p_9_out(8 downto 0),
      RD_PNTR_WR(8 downto 0) => p_0_out(8 downto 0),
      WEBWE(0) => \n_0_gntv_or_sync_fifo.gl0.wr\,
      axis_wr_data_count(9 downto 0) => axis_wr_data_count(9 downto 0),
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_aclk => s_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
\gntv_or_sync_fifo.mem\: entity work.afifo_32x512_axis_data_fifo_0_0_memory
    port map (
      E(0) => \n_18_gntv_or_sync_fifo.gl0.rd\,
      O1(8 downto 0) => p_20_out(8 downto 0),
      O2(32 downto 0) => Q(32 downto 0),
      Q(8 downto 0) => p_9_out(8 downto 0),
      WEBWE(0) => \n_0_gntv_or_sync_fifo.gl0.wr\,
      m_aclk => m_aclk,
      ram_rd_en_i => ram_rd_en_i,
      s_aclk => s_aclk,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast
    );
rstblk: entity work.afifo_32x512_axis_data_fifo_0_0_reset_blk_ramfifo
    port map (
      O1(2) => RD_RST,
      O1(1 downto 0) => rd_rst_i(1 downto 0),
      Q(1) => WR_RST,
      Q(0) => wr_rst_i(0),
      m_aclk => m_aclk,
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_fifo_generator_top is
  port (
    Q : out STD_LOGIC_VECTOR ( 32 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_fifo_generator_top : entity is "fifo_generator_top";
end afifo_32x512_axis_data_fifo_0_0_fifo_generator_top;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_top is
begin
\grf.rf\: entity work.afifo_32x512_axis_data_fifo_0_0_fifo_generator_ramfifo
    port map (
      Q(32 downto 0) => Q(32 downto 0),
      axis_rd_data_count(9 downto 0) => axis_rd_data_count(9 downto 0),
      axis_wr_data_count(9 downto 0) => axis_wr_data_count(9 downto 0),
      m_aclk => m_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0_synth is
  port (
    Q : out STD_LOGIC_VECTOR ( 32 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0_synth : entity is "fifo_generator_v12_0_synth";
end afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0_synth;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0_synth is
begin
\gaxis_fifo.gaxisf.axisf\: entity work.afifo_32x512_axis_data_fifo_0_0_fifo_generator_top
    port map (
      Q(32 downto 0) => Q(32 downto 0),
      axis_rd_data_count(9 downto 0) => axis_rd_data_count(9 downto 0),
      axis_wr_data_count(9 downto 0) => axis_wr_data_count(9 downto 0),
      m_aclk => m_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 17 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 9 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 10;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 18;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 18;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "virtex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "BlankString";
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "4kx4";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 2;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 3;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1022;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1021;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 10;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1024;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 10;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 10;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1024;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 10;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 3;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 4;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 32;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 64;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 2;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 32;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 4;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 4;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 11;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "512x36";
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 2;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 64;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 33;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 16;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1024;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 512;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 10;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 9;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 511;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 510;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 : entity is "fifo_generator_v12_0";
end afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  almost_empty <= \<const1>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const0>\;
  axis_prog_full <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  data_count(9) <= \<const0>\;
  data_count(8) <= \<const0>\;
  data_count(7) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  dout(17) <= \<const0>\;
  dout(16) <= \<const0>\;
  dout(15) <= \<const0>\;
  dout(14) <= \<const0>\;
  dout(13) <= \<const0>\;
  dout(12) <= \<const0>\;
  dout(11) <= \<const0>\;
  dout(10) <= \<const0>\;
  dout(9) <= \<const0>\;
  dout(8) <= \<const0>\;
  dout(7) <= \<const0>\;
  dout(6) <= \<const0>\;
  dout(5) <= \<const0>\;
  dout(4) <= \<const0>\;
  dout(3) <= \<const0>\;
  dout(2) <= \<const0>\;
  dout(1) <= \<const0>\;
  dout(0) <= \<const0>\;
  empty <= \<const1>\;
  full <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(3) <= \<const0>\;
  m_axi_arid(2) <= \<const0>\;
  m_axi_arid(1) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(1) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(3) <= \<const0>\;
  m_axi_awid(2) <= \<const0>\;
  m_axi_awid(1) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(1) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(3) <= \<const0>\;
  m_axi_wid(2) <= \<const0>\;
  m_axi_wid(1) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(3) <= \<const0>\;
  m_axis_tkeep(2) <= \<const0>\;
  m_axis_tkeep(1) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tstrb(3) <= \<const0>\;
  m_axis_tstrb(2) <= \<const0>\;
  m_axis_tstrb(1) <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const1>\;
  prog_full <= \<const0>\;
  rd_data_count(9) <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  valid <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(9) <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const0>\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0_synth
    port map (
      Q(32 downto 1) => m_axis_tdata(31 downto 0),
      Q(0) => m_axis_tlast,
      axis_rd_data_count(9 downto 0) => axis_rd_data_count(9 downto 0),
      axis_wr_data_count(9 downto 0) => axis_wr_data_count(9 downto 0),
      m_aclk => m_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclk : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute C_FAMILY : string;
  attribute C_FAMILY of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is "virtex7";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 32;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is "32'b00000000000000000000000000010011";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 512;
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 3;
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 5;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 6;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 7;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 16;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 32;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 64;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_TREADY_EXISTS : integer;
  attribute P_TREADY_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TDATA_EXISTS : integer;
  attribute P_TDATA_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TSTRB_EXISTS : integer;
  attribute P_TSTRB_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_TKEEP_EXISTS : integer;
  attribute P_TKEEP_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_TLAST_EXISTS : integer;
  attribute P_TLAST_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TID_EXISTS : integer;
  attribute P_TID_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_TDEST_EXISTS : integer;
  attribute P_TDEST_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_TUSER_EXISTS : integer;
  attribute P_TUSER_EXISTS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_AXIS_PAYLOAD_WIDTH : integer;
  attribute P_AXIS_PAYLOAD_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 33;
  attribute P_WR_PNTR_WIDTH : integer;
  attribute P_WR_PNTR_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 9;
  attribute P_FIFO_COUNT_WIDTH : integer;
  attribute P_FIFO_COUNT_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute P_FIFO_TYPE : integer;
  attribute P_FIFO_TYPE of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute P_IMPLEMENTATION_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 11;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_MSGON_VAL : integer;
  attribute P_MSGON_VAL of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_APPLICATION_TYPE_AXIS : integer;
  attribute P_APPLICATION_TYPE_AXIS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 18;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 18;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 32;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 64;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_RD_PNTR_WIDTH_RACH : integer;
  attribute C_RD_PNTR_WIDTH_RACH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_RD_PNTR_WIDTH_RDCH : integer;
  attribute C_RD_PNTR_WIDTH_RDCH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_RD_PNTR_WIDTH_WACH : integer;
  attribute C_RD_PNTR_WIDTH_WACH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_RD_PNTR_WIDTH_WDCH : integer;
  attribute C_RD_PNTR_WIDTH_WDCH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_RD_PNTR_WIDTH_WRCH : integer;
  attribute C_RD_PNTR_WIDTH_WRCH of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is 9;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo : entity is "axis_data_fifo_v1_1_axis_data_fifo";
end afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo is
  signal \<const0>\ : STD_LOGIC;
  signal \^axis_rd_data_count\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^axis_wr_data_count\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal s_and_m_aresetn_i : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of s_and_m_aresetn_i : signal is "true";
  signal \NLW_gen_fifo_generator.fifo_generator_inst_almost_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_almost_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axis_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axis_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axis_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axis_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arvalid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awvalid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_bready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_rready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wlast_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wvalid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_rd_rst_busy_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_arready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_awready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bvalid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rlast_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rvalid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_wready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_valid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_wr_ack_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_wr_rst_busy_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_rd_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_wr_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_rd_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_wr_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_rd_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_wr_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_rd_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_wr_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_rd_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_wr_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_axis_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_dout_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_araddr_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arburst_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arcache_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arid_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlen_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlock_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arprot_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arqos_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arregion_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arsize_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_aruser_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awaddr_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awburst_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awcache_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awid_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlen_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlock_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awprot_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awqos_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awregion_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awsize_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awuser_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wdata_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wid_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wstrb_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wuser_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_rd_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bid_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bresp_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_buser_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rdata_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rid_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rresp_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_ruser_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo_generator.fifo_generator_inst_wr_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_AXIS_TDATA_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 32;
  attribute C_AXIS_TDEST_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_AXIS_TID_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 4;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 4;
  attribute C_AXIS_TUSER_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_AXI_ADDR_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 32;
  attribute C_AXI_ARUSER_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_AXI_AWUSER_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_AXI_BUSER_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_AXI_DATA_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 64;
  attribute C_AXI_ID_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 4;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 2;
  attribute C_AXI_RUSER_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_AXI_WUSER_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_DATA_COUNT_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 10;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of \gen_fifo_generator.fifo_generator_inst\ : label is "BlankString";
  attribute C_DIN_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 18;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 33;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is "0";
  attribute C_DOUT_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 18;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_FAMILY of \gen_fifo_generator.fifo_generator_inst\ : label is "virtex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 11;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 2;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 2;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 2;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of \gen_fifo_generator.fifo_generator_inst\ : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is "4kx4";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is 2;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 510;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 14;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is 3;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is 1022;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 15;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of \gen_fifo_generator.fifo_generator_inst\ : label is 1021;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 10;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1024;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_RD_PNTR_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 10;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_SYNCHRONIZER_STAGE of \gen_fifo_generator.fifo_generator_inst\ : label is 3;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of \gen_fifo_generator.fifo_generator_inst\ : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 10;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of \gen_fifo_generator.fifo_generator_inst\ : label is 1024;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 512;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute C_WR_PNTR_WIDTH of \gen_fifo_generator.fifo_generator_inst\ : label is 10;
  attribute C_WR_PNTR_WIDTH_AXIS of \gen_fifo_generator.fifo_generator_inst\ : label is 9;
  attribute C_WR_PNTR_WIDTH_RACH of \gen_fifo_generator.fifo_generator_inst\ : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH of \gen_fifo_generator.fifo_generator_inst\ : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH of \gen_fifo_generator.fifo_generator_inst\ : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH of \gen_fifo_generator.fifo_generator_inst\ : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of \gen_fifo_generator.fifo_generator_inst\ : label is 1;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of \gen_fifo_generator.fifo_generator_inst\ : label is std.standard.true;
begin
  axis_data_count(31) <= \<const0>\;
  axis_data_count(30) <= \<const0>\;
  axis_data_count(29) <= \<const0>\;
  axis_data_count(28) <= \<const0>\;
  axis_data_count(27) <= \<const0>\;
  axis_data_count(26) <= \<const0>\;
  axis_data_count(25) <= \<const0>\;
  axis_data_count(24) <= \<const0>\;
  axis_data_count(23) <= \<const0>\;
  axis_data_count(22) <= \<const0>\;
  axis_data_count(21) <= \<const0>\;
  axis_data_count(20) <= \<const0>\;
  axis_data_count(19) <= \<const0>\;
  axis_data_count(18) <= \<const0>\;
  axis_data_count(17) <= \<const0>\;
  axis_data_count(16) <= \<const0>\;
  axis_data_count(15) <= \<const0>\;
  axis_data_count(14) <= \<const0>\;
  axis_data_count(13) <= \<const0>\;
  axis_data_count(12) <= \<const0>\;
  axis_data_count(11) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9 downto 0) <= \^axis_wr_data_count\(9 downto 0);
  axis_rd_data_count(31) <= \<const0>\;
  axis_rd_data_count(30) <= \<const0>\;
  axis_rd_data_count(29) <= \<const0>\;
  axis_rd_data_count(28) <= \<const0>\;
  axis_rd_data_count(27) <= \<const0>\;
  axis_rd_data_count(26) <= \<const0>\;
  axis_rd_data_count(25) <= \<const0>\;
  axis_rd_data_count(24) <= \<const0>\;
  axis_rd_data_count(23) <= \<const0>\;
  axis_rd_data_count(22) <= \<const0>\;
  axis_rd_data_count(21) <= \<const0>\;
  axis_rd_data_count(20) <= \<const0>\;
  axis_rd_data_count(19) <= \<const0>\;
  axis_rd_data_count(18) <= \<const0>\;
  axis_rd_data_count(17) <= \<const0>\;
  axis_rd_data_count(16) <= \<const0>\;
  axis_rd_data_count(15) <= \<const0>\;
  axis_rd_data_count(14) <= \<const0>\;
  axis_rd_data_count(13) <= \<const0>\;
  axis_rd_data_count(12) <= \<const0>\;
  axis_rd_data_count(11) <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9 downto 0) <= \^axis_rd_data_count\(9 downto 0);
  axis_wr_data_count(31) <= \<const0>\;
  axis_wr_data_count(30) <= \<const0>\;
  axis_wr_data_count(29) <= \<const0>\;
  axis_wr_data_count(28) <= \<const0>\;
  axis_wr_data_count(27) <= \<const0>\;
  axis_wr_data_count(26) <= \<const0>\;
  axis_wr_data_count(25) <= \<const0>\;
  axis_wr_data_count(24) <= \<const0>\;
  axis_wr_data_count(23) <= \<const0>\;
  axis_wr_data_count(22) <= \<const0>\;
  axis_wr_data_count(21) <= \<const0>\;
  axis_wr_data_count(20) <= \<const0>\;
  axis_wr_data_count(19) <= \<const0>\;
  axis_wr_data_count(18) <= \<const0>\;
  axis_wr_data_count(17) <= \<const0>\;
  axis_wr_data_count(16) <= \<const0>\;
  axis_wr_data_count(15) <= \<const0>\;
  axis_wr_data_count(14) <= \<const0>\;
  axis_wr_data_count(13) <= \<const0>\;
  axis_wr_data_count(12) <= \<const0>\;
  axis_wr_data_count(11) <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9 downto 0) <= \^axis_wr_data_count\(9 downto 0);
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
\gen_fifo_generator.fifo_generator_inst\: entity work.afifo_32x512_axis_data_fifo_0_0_fifo_generator_v12_0
    port map (
      almost_empty => \NLW_gen_fifo_generator.fifo_generator_inst_almost_empty_UNCONNECTED\,
      almost_full => \NLW_gen_fifo_generator.fifo_generator_inst_almost_full_UNCONNECTED\,
      axi_ar_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_data_count_UNCONNECTED\(4 downto 0),
      axi_ar_dbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_dbiterr_UNCONNECTED\,
      axi_ar_injectdbiterr => \<const0>\,
      axi_ar_injectsbiterr => \<const0>\,
      axi_ar_overflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_overflow_UNCONNECTED\,
      axi_ar_prog_empty => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_empty_UNCONNECTED\,
      axi_ar_prog_empty_thresh(3) => \<const0>\,
      axi_ar_prog_empty_thresh(2) => \<const0>\,
      axi_ar_prog_empty_thresh(1) => \<const0>\,
      axi_ar_prog_empty_thresh(0) => \<const0>\,
      axi_ar_prog_full => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_full_UNCONNECTED\,
      axi_ar_prog_full_thresh(3) => \<const0>\,
      axi_ar_prog_full_thresh(2) => \<const0>\,
      axi_ar_prog_full_thresh(1) => \<const0>\,
      axi_ar_prog_full_thresh(0) => \<const0>\,
      axi_ar_rd_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_rd_data_count_UNCONNECTED\(4 downto 0),
      axi_ar_sbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_sbiterr_UNCONNECTED\,
      axi_ar_underflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_underflow_UNCONNECTED\,
      axi_ar_wr_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_wr_data_count_UNCONNECTED\(4 downto 0),
      axi_aw_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_data_count_UNCONNECTED\(4 downto 0),
      axi_aw_dbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_dbiterr_UNCONNECTED\,
      axi_aw_injectdbiterr => \<const0>\,
      axi_aw_injectsbiterr => \<const0>\,
      axi_aw_overflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_overflow_UNCONNECTED\,
      axi_aw_prog_empty => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_empty_UNCONNECTED\,
      axi_aw_prog_empty_thresh(3) => \<const0>\,
      axi_aw_prog_empty_thresh(2) => \<const0>\,
      axi_aw_prog_empty_thresh(1) => \<const0>\,
      axi_aw_prog_empty_thresh(0) => \<const0>\,
      axi_aw_prog_full => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_full_UNCONNECTED\,
      axi_aw_prog_full_thresh(3) => \<const0>\,
      axi_aw_prog_full_thresh(2) => \<const0>\,
      axi_aw_prog_full_thresh(1) => \<const0>\,
      axi_aw_prog_full_thresh(0) => \<const0>\,
      axi_aw_rd_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_rd_data_count_UNCONNECTED\(4 downto 0),
      axi_aw_sbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_sbiterr_UNCONNECTED\,
      axi_aw_underflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_underflow_UNCONNECTED\,
      axi_aw_wr_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_wr_data_count_UNCONNECTED\(4 downto 0),
      axi_b_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_data_count_UNCONNECTED\(4 downto 0),
      axi_b_dbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_dbiterr_UNCONNECTED\,
      axi_b_injectdbiterr => \<const0>\,
      axi_b_injectsbiterr => \<const0>\,
      axi_b_overflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_overflow_UNCONNECTED\,
      axi_b_prog_empty => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_empty_UNCONNECTED\,
      axi_b_prog_empty_thresh(3) => \<const0>\,
      axi_b_prog_empty_thresh(2) => \<const0>\,
      axi_b_prog_empty_thresh(1) => \<const0>\,
      axi_b_prog_empty_thresh(0) => \<const0>\,
      axi_b_prog_full => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_full_UNCONNECTED\,
      axi_b_prog_full_thresh(3) => \<const0>\,
      axi_b_prog_full_thresh(2) => \<const0>\,
      axi_b_prog_full_thresh(1) => \<const0>\,
      axi_b_prog_full_thresh(0) => \<const0>\,
      axi_b_rd_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_rd_data_count_UNCONNECTED\(4 downto 0),
      axi_b_sbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_sbiterr_UNCONNECTED\,
      axi_b_underflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_underflow_UNCONNECTED\,
      axi_b_wr_data_count(4 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_wr_data_count_UNCONNECTED\(4 downto 0),
      axi_r_data_count(10 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_data_count_UNCONNECTED\(10 downto 0),
      axi_r_dbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_dbiterr_UNCONNECTED\,
      axi_r_injectdbiterr => \<const0>\,
      axi_r_injectsbiterr => \<const0>\,
      axi_r_overflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_overflow_UNCONNECTED\,
      axi_r_prog_empty => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_empty_UNCONNECTED\,
      axi_r_prog_empty_thresh(9) => \<const0>\,
      axi_r_prog_empty_thresh(8) => \<const0>\,
      axi_r_prog_empty_thresh(7) => \<const0>\,
      axi_r_prog_empty_thresh(6) => \<const0>\,
      axi_r_prog_empty_thresh(5) => \<const0>\,
      axi_r_prog_empty_thresh(4) => \<const0>\,
      axi_r_prog_empty_thresh(3) => \<const0>\,
      axi_r_prog_empty_thresh(2) => \<const0>\,
      axi_r_prog_empty_thresh(1) => \<const0>\,
      axi_r_prog_empty_thresh(0) => \<const0>\,
      axi_r_prog_full => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_full_UNCONNECTED\,
      axi_r_prog_full_thresh(9) => \<const0>\,
      axi_r_prog_full_thresh(8) => \<const0>\,
      axi_r_prog_full_thresh(7) => \<const0>\,
      axi_r_prog_full_thresh(6) => \<const0>\,
      axi_r_prog_full_thresh(5) => \<const0>\,
      axi_r_prog_full_thresh(4) => \<const0>\,
      axi_r_prog_full_thresh(3) => \<const0>\,
      axi_r_prog_full_thresh(2) => \<const0>\,
      axi_r_prog_full_thresh(1) => \<const0>\,
      axi_r_prog_full_thresh(0) => \<const0>\,
      axi_r_rd_data_count(10 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_rd_data_count_UNCONNECTED\(10 downto 0),
      axi_r_sbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_sbiterr_UNCONNECTED\,
      axi_r_underflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_underflow_UNCONNECTED\,
      axi_r_wr_data_count(10 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_wr_data_count_UNCONNECTED\(10 downto 0),
      axi_w_data_count(10 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_data_count_UNCONNECTED\(10 downto 0),
      axi_w_dbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_dbiterr_UNCONNECTED\,
      axi_w_injectdbiterr => \<const0>\,
      axi_w_injectsbiterr => \<const0>\,
      axi_w_overflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_overflow_UNCONNECTED\,
      axi_w_prog_empty => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_empty_UNCONNECTED\,
      axi_w_prog_empty_thresh(9) => \<const0>\,
      axi_w_prog_empty_thresh(8) => \<const0>\,
      axi_w_prog_empty_thresh(7) => \<const0>\,
      axi_w_prog_empty_thresh(6) => \<const0>\,
      axi_w_prog_empty_thresh(5) => \<const0>\,
      axi_w_prog_empty_thresh(4) => \<const0>\,
      axi_w_prog_empty_thresh(3) => \<const0>\,
      axi_w_prog_empty_thresh(2) => \<const0>\,
      axi_w_prog_empty_thresh(1) => \<const0>\,
      axi_w_prog_empty_thresh(0) => \<const0>\,
      axi_w_prog_full => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_full_UNCONNECTED\,
      axi_w_prog_full_thresh(9) => \<const0>\,
      axi_w_prog_full_thresh(8) => \<const0>\,
      axi_w_prog_full_thresh(7) => \<const0>\,
      axi_w_prog_full_thresh(6) => \<const0>\,
      axi_w_prog_full_thresh(5) => \<const0>\,
      axi_w_prog_full_thresh(4) => \<const0>\,
      axi_w_prog_full_thresh(3) => \<const0>\,
      axi_w_prog_full_thresh(2) => \<const0>\,
      axi_w_prog_full_thresh(1) => \<const0>\,
      axi_w_prog_full_thresh(0) => \<const0>\,
      axi_w_rd_data_count(10 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_rd_data_count_UNCONNECTED\(10 downto 0),
      axi_w_sbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_sbiterr_UNCONNECTED\,
      axi_w_underflow => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_underflow_UNCONNECTED\,
      axi_w_wr_data_count(10 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_wr_data_count_UNCONNECTED\(10 downto 0),
      axis_data_count(9 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_axis_data_count_UNCONNECTED\(9 downto 0),
      axis_dbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axis_dbiterr_UNCONNECTED\,
      axis_injectdbiterr => \<const0>\,
      axis_injectsbiterr => \<const0>\,
      axis_overflow => \NLW_gen_fifo_generator.fifo_generator_inst_axis_overflow_UNCONNECTED\,
      axis_prog_empty => \NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_empty_UNCONNECTED\,
      axis_prog_empty_thresh(8) => \<const0>\,
      axis_prog_empty_thresh(7) => \<const0>\,
      axis_prog_empty_thresh(6) => \<const0>\,
      axis_prog_empty_thresh(5) => \<const0>\,
      axis_prog_empty_thresh(4) => \<const0>\,
      axis_prog_empty_thresh(3) => \<const0>\,
      axis_prog_empty_thresh(2) => \<const0>\,
      axis_prog_empty_thresh(1) => \<const0>\,
      axis_prog_empty_thresh(0) => \<const0>\,
      axis_prog_full => \NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_full_UNCONNECTED\,
      axis_prog_full_thresh(8) => \<const0>\,
      axis_prog_full_thresh(7) => \<const0>\,
      axis_prog_full_thresh(6) => \<const0>\,
      axis_prog_full_thresh(5) => \<const0>\,
      axis_prog_full_thresh(4) => \<const0>\,
      axis_prog_full_thresh(3) => \<const0>\,
      axis_prog_full_thresh(2) => \<const0>\,
      axis_prog_full_thresh(1) => \<const0>\,
      axis_prog_full_thresh(0) => \<const0>\,
      axis_rd_data_count(9 downto 0) => \^axis_rd_data_count\(9 downto 0),
      axis_sbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_axis_sbiterr_UNCONNECTED\,
      axis_underflow => \NLW_gen_fifo_generator.fifo_generator_inst_axis_underflow_UNCONNECTED\,
      axis_wr_data_count(9 downto 0) => \^axis_wr_data_count\(9 downto 0),
      backup => \<const0>\,
      backup_marker => \<const0>\,
      clk => \<const0>\,
      data_count(9 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_data_count_UNCONNECTED\(9 downto 0),
      dbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_dbiterr_UNCONNECTED\,
      din(17) => \<const0>\,
      din(16) => \<const0>\,
      din(15) => \<const0>\,
      din(14) => \<const0>\,
      din(13) => \<const0>\,
      din(12) => \<const0>\,
      din(11) => \<const0>\,
      din(10) => \<const0>\,
      din(9) => \<const0>\,
      din(8) => \<const0>\,
      din(7) => \<const0>\,
      din(6) => \<const0>\,
      din(5) => \<const0>\,
      din(4) => \<const0>\,
      din(3) => \<const0>\,
      din(2) => \<const0>\,
      din(1) => \<const0>\,
      din(0) => \<const0>\,
      dout(17 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_dout_UNCONNECTED\(17 downto 0),
      empty => \NLW_gen_fifo_generator.fifo_generator_inst_empty_UNCONNECTED\,
      full => \NLW_gen_fifo_generator.fifo_generator_inst_full_UNCONNECTED\,
      injectdbiterr => \<const0>\,
      injectsbiterr => \<const0>\,
      int_clk => \<const0>\,
      m_aclk => m_axis_aclk,
      m_aclk_en => \<const0>\,
      m_axi_araddr(31 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_araddr_UNCONNECTED\(31 downto 0),
      m_axi_arburst(1 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arburst_UNCONNECTED\(1 downto 0),
      m_axi_arcache(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arcache_UNCONNECTED\(3 downto 0),
      m_axi_arid(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arid_UNCONNECTED\(3 downto 0),
      m_axi_arlen(7 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlen_UNCONNECTED\(7 downto 0),
      m_axi_arlock(1 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlock_UNCONNECTED\(1 downto 0),
      m_axi_arprot(2 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arprot_UNCONNECTED\(2 downto 0),
      m_axi_arqos(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arqos_UNCONNECTED\(3 downto 0),
      m_axi_arready => \<const0>\,
      m_axi_arregion(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arregion_UNCONNECTED\(3 downto 0),
      m_axi_arsize(2 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arsize_UNCONNECTED\(2 downto 0),
      m_axi_aruser(0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_aruser_UNCONNECTED\(0),
      m_axi_arvalid => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arvalid_UNCONNECTED\,
      m_axi_awaddr(31 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awaddr_UNCONNECTED\(31 downto 0),
      m_axi_awburst(1 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awburst_UNCONNECTED\(1 downto 0),
      m_axi_awcache(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awcache_UNCONNECTED\(3 downto 0),
      m_axi_awid(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awid_UNCONNECTED\(3 downto 0),
      m_axi_awlen(7 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlen_UNCONNECTED\(7 downto 0),
      m_axi_awlock(1 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlock_UNCONNECTED\(1 downto 0),
      m_axi_awprot(2 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awprot_UNCONNECTED\(2 downto 0),
      m_axi_awqos(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awqos_UNCONNECTED\(3 downto 0),
      m_axi_awready => \<const0>\,
      m_axi_awregion(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awregion_UNCONNECTED\(3 downto 0),
      m_axi_awsize(2 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awsize_UNCONNECTED\(2 downto 0),
      m_axi_awuser(0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awuser_UNCONNECTED\(0),
      m_axi_awvalid => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awvalid_UNCONNECTED\,
      m_axi_bid(3) => \<const0>\,
      m_axi_bid(2) => \<const0>\,
      m_axi_bid(1) => \<const0>\,
      m_axi_bid(0) => \<const0>\,
      m_axi_bready => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_bready_UNCONNECTED\,
      m_axi_bresp(1) => \<const0>\,
      m_axi_bresp(0) => \<const0>\,
      m_axi_buser(0) => \<const0>\,
      m_axi_bvalid => \<const0>\,
      m_axi_rdata(63) => \<const0>\,
      m_axi_rdata(62) => \<const0>\,
      m_axi_rdata(61) => \<const0>\,
      m_axi_rdata(60) => \<const0>\,
      m_axi_rdata(59) => \<const0>\,
      m_axi_rdata(58) => \<const0>\,
      m_axi_rdata(57) => \<const0>\,
      m_axi_rdata(56) => \<const0>\,
      m_axi_rdata(55) => \<const0>\,
      m_axi_rdata(54) => \<const0>\,
      m_axi_rdata(53) => \<const0>\,
      m_axi_rdata(52) => \<const0>\,
      m_axi_rdata(51) => \<const0>\,
      m_axi_rdata(50) => \<const0>\,
      m_axi_rdata(49) => \<const0>\,
      m_axi_rdata(48) => \<const0>\,
      m_axi_rdata(47) => \<const0>\,
      m_axi_rdata(46) => \<const0>\,
      m_axi_rdata(45) => \<const0>\,
      m_axi_rdata(44) => \<const0>\,
      m_axi_rdata(43) => \<const0>\,
      m_axi_rdata(42) => \<const0>\,
      m_axi_rdata(41) => \<const0>\,
      m_axi_rdata(40) => \<const0>\,
      m_axi_rdata(39) => \<const0>\,
      m_axi_rdata(38) => \<const0>\,
      m_axi_rdata(37) => \<const0>\,
      m_axi_rdata(36) => \<const0>\,
      m_axi_rdata(35) => \<const0>\,
      m_axi_rdata(34) => \<const0>\,
      m_axi_rdata(33) => \<const0>\,
      m_axi_rdata(32) => \<const0>\,
      m_axi_rdata(31) => \<const0>\,
      m_axi_rdata(30) => \<const0>\,
      m_axi_rdata(29) => \<const0>\,
      m_axi_rdata(28) => \<const0>\,
      m_axi_rdata(27) => \<const0>\,
      m_axi_rdata(26) => \<const0>\,
      m_axi_rdata(25) => \<const0>\,
      m_axi_rdata(24) => \<const0>\,
      m_axi_rdata(23) => \<const0>\,
      m_axi_rdata(22) => \<const0>\,
      m_axi_rdata(21) => \<const0>\,
      m_axi_rdata(20) => \<const0>\,
      m_axi_rdata(19) => \<const0>\,
      m_axi_rdata(18) => \<const0>\,
      m_axi_rdata(17) => \<const0>\,
      m_axi_rdata(16) => \<const0>\,
      m_axi_rdata(15) => \<const0>\,
      m_axi_rdata(14) => \<const0>\,
      m_axi_rdata(13) => \<const0>\,
      m_axi_rdata(12) => \<const0>\,
      m_axi_rdata(11) => \<const0>\,
      m_axi_rdata(10) => \<const0>\,
      m_axi_rdata(9) => \<const0>\,
      m_axi_rdata(8) => \<const0>\,
      m_axi_rdata(7) => \<const0>\,
      m_axi_rdata(6) => \<const0>\,
      m_axi_rdata(5) => \<const0>\,
      m_axi_rdata(4) => \<const0>\,
      m_axi_rdata(3) => \<const0>\,
      m_axi_rdata(2) => \<const0>\,
      m_axi_rdata(1) => \<const0>\,
      m_axi_rdata(0) => \<const0>\,
      m_axi_rid(3) => \<const0>\,
      m_axi_rid(2) => \<const0>\,
      m_axi_rid(1) => \<const0>\,
      m_axi_rid(0) => \<const0>\,
      m_axi_rlast => \<const0>\,
      m_axi_rready => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_rready_UNCONNECTED\,
      m_axi_rresp(1) => \<const0>\,
      m_axi_rresp(0) => \<const0>\,
      m_axi_ruser(0) => \<const0>\,
      m_axi_rvalid => \<const0>\,
      m_axi_wdata(63 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wdata_UNCONNECTED\(63 downto 0),
      m_axi_wid(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wid_UNCONNECTED\(3 downto 0),
      m_axi_wlast => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wlast_UNCONNECTED\,
      m_axi_wready => \<const0>\,
      m_axi_wstrb(7 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wstrb_UNCONNECTED\(7 downto 0),
      m_axi_wuser(0) => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wuser_UNCONNECTED\(0),
      m_axi_wvalid => \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wvalid_UNCONNECTED\,
      m_axis_tdata(31 downto 0) => m_axis_tdata(31 downto 0),
      m_axis_tdest(0) => m_axis_tdest(0),
      m_axis_tid(0) => m_axis_tid(0),
      m_axis_tkeep(3 downto 0) => m_axis_tkeep(3 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(3 downto 0) => m_axis_tstrb(3 downto 0),
      m_axis_tuser(0) => m_axis_tuser(0),
      m_axis_tvalid => m_axis_tvalid,
      overflow => \NLW_gen_fifo_generator.fifo_generator_inst_overflow_UNCONNECTED\,
      prog_empty => \NLW_gen_fifo_generator.fifo_generator_inst_prog_empty_UNCONNECTED\,
      prog_empty_thresh(9) => \<const0>\,
      prog_empty_thresh(8) => \<const0>\,
      prog_empty_thresh(7) => \<const0>\,
      prog_empty_thresh(6) => \<const0>\,
      prog_empty_thresh(5) => \<const0>\,
      prog_empty_thresh(4) => \<const0>\,
      prog_empty_thresh(3) => \<const0>\,
      prog_empty_thresh(2) => \<const0>\,
      prog_empty_thresh(1) => \<const0>\,
      prog_empty_thresh(0) => \<const0>\,
      prog_empty_thresh_assert(9) => \<const0>\,
      prog_empty_thresh_assert(8) => \<const0>\,
      prog_empty_thresh_assert(7) => \<const0>\,
      prog_empty_thresh_assert(6) => \<const0>\,
      prog_empty_thresh_assert(5) => \<const0>\,
      prog_empty_thresh_assert(4) => \<const0>\,
      prog_empty_thresh_assert(3) => \<const0>\,
      prog_empty_thresh_assert(2) => \<const0>\,
      prog_empty_thresh_assert(1) => \<const0>\,
      prog_empty_thresh_assert(0) => \<const0>\,
      prog_empty_thresh_negate(9) => \<const0>\,
      prog_empty_thresh_negate(8) => \<const0>\,
      prog_empty_thresh_negate(7) => \<const0>\,
      prog_empty_thresh_negate(6) => \<const0>\,
      prog_empty_thresh_negate(5) => \<const0>\,
      prog_empty_thresh_negate(4) => \<const0>\,
      prog_empty_thresh_negate(3) => \<const0>\,
      prog_empty_thresh_negate(2) => \<const0>\,
      prog_empty_thresh_negate(1) => \<const0>\,
      prog_empty_thresh_negate(0) => \<const0>\,
      prog_full => \NLW_gen_fifo_generator.fifo_generator_inst_prog_full_UNCONNECTED\,
      prog_full_thresh(9) => \<const0>\,
      prog_full_thresh(8) => \<const0>\,
      prog_full_thresh(7) => \<const0>\,
      prog_full_thresh(6) => \<const0>\,
      prog_full_thresh(5) => \<const0>\,
      prog_full_thresh(4) => \<const0>\,
      prog_full_thresh(3) => \<const0>\,
      prog_full_thresh(2) => \<const0>\,
      prog_full_thresh(1) => \<const0>\,
      prog_full_thresh(0) => \<const0>\,
      prog_full_thresh_assert(9) => \<const0>\,
      prog_full_thresh_assert(8) => \<const0>\,
      prog_full_thresh_assert(7) => \<const0>\,
      prog_full_thresh_assert(6) => \<const0>\,
      prog_full_thresh_assert(5) => \<const0>\,
      prog_full_thresh_assert(4) => \<const0>\,
      prog_full_thresh_assert(3) => \<const0>\,
      prog_full_thresh_assert(2) => \<const0>\,
      prog_full_thresh_assert(1) => \<const0>\,
      prog_full_thresh_assert(0) => \<const0>\,
      prog_full_thresh_negate(9) => \<const0>\,
      prog_full_thresh_negate(8) => \<const0>\,
      prog_full_thresh_negate(7) => \<const0>\,
      prog_full_thresh_negate(6) => \<const0>\,
      prog_full_thresh_negate(5) => \<const0>\,
      prog_full_thresh_negate(4) => \<const0>\,
      prog_full_thresh_negate(3) => \<const0>\,
      prog_full_thresh_negate(2) => \<const0>\,
      prog_full_thresh_negate(1) => \<const0>\,
      prog_full_thresh_negate(0) => \<const0>\,
      rd_clk => \<const0>\,
      rd_data_count(9 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_rd_data_count_UNCONNECTED\(9 downto 0),
      rd_en => \<const0>\,
      rd_rst => \<const0>\,
      rd_rst_busy => \NLW_gen_fifo_generator.fifo_generator_inst_rd_rst_busy_UNCONNECTED\,
      rst => \<const0>\,
      s_aclk => s_axis_aclk,
      s_aclk_en => \<const0>\,
      s_aresetn => s_and_m_aresetn_i,
      s_axi_araddr(31) => \<const0>\,
      s_axi_araddr(30) => \<const0>\,
      s_axi_araddr(29) => \<const0>\,
      s_axi_araddr(28) => \<const0>\,
      s_axi_araddr(27) => \<const0>\,
      s_axi_araddr(26) => \<const0>\,
      s_axi_araddr(25) => \<const0>\,
      s_axi_araddr(24) => \<const0>\,
      s_axi_araddr(23) => \<const0>\,
      s_axi_araddr(22) => \<const0>\,
      s_axi_araddr(21) => \<const0>\,
      s_axi_araddr(20) => \<const0>\,
      s_axi_araddr(19) => \<const0>\,
      s_axi_araddr(18) => \<const0>\,
      s_axi_araddr(17) => \<const0>\,
      s_axi_araddr(16) => \<const0>\,
      s_axi_araddr(15) => \<const0>\,
      s_axi_araddr(14) => \<const0>\,
      s_axi_araddr(13) => \<const0>\,
      s_axi_araddr(12) => \<const0>\,
      s_axi_araddr(11) => \<const0>\,
      s_axi_araddr(10) => \<const0>\,
      s_axi_araddr(9) => \<const0>\,
      s_axi_araddr(8) => \<const0>\,
      s_axi_araddr(7) => \<const0>\,
      s_axi_araddr(6) => \<const0>\,
      s_axi_araddr(5) => \<const0>\,
      s_axi_araddr(4) => \<const0>\,
      s_axi_araddr(3) => \<const0>\,
      s_axi_araddr(2) => \<const0>\,
      s_axi_araddr(1) => \<const0>\,
      s_axi_araddr(0) => \<const0>\,
      s_axi_arburst(1) => \<const0>\,
      s_axi_arburst(0) => \<const0>\,
      s_axi_arcache(3) => \<const0>\,
      s_axi_arcache(2) => \<const0>\,
      s_axi_arcache(1) => \<const0>\,
      s_axi_arcache(0) => \<const0>\,
      s_axi_arid(3) => \<const0>\,
      s_axi_arid(2) => \<const0>\,
      s_axi_arid(1) => \<const0>\,
      s_axi_arid(0) => \<const0>\,
      s_axi_arlen(7) => \<const0>\,
      s_axi_arlen(6) => \<const0>\,
      s_axi_arlen(5) => \<const0>\,
      s_axi_arlen(4) => \<const0>\,
      s_axi_arlen(3) => \<const0>\,
      s_axi_arlen(2) => \<const0>\,
      s_axi_arlen(1) => \<const0>\,
      s_axi_arlen(0) => \<const0>\,
      s_axi_arlock(1) => \<const0>\,
      s_axi_arlock(0) => \<const0>\,
      s_axi_arprot(2) => \<const0>\,
      s_axi_arprot(1) => \<const0>\,
      s_axi_arprot(0) => \<const0>\,
      s_axi_arqos(3) => \<const0>\,
      s_axi_arqos(2) => \<const0>\,
      s_axi_arqos(1) => \<const0>\,
      s_axi_arqos(0) => \<const0>\,
      s_axi_arready => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_arready_UNCONNECTED\,
      s_axi_arregion(3) => \<const0>\,
      s_axi_arregion(2) => \<const0>\,
      s_axi_arregion(1) => \<const0>\,
      s_axi_arregion(0) => \<const0>\,
      s_axi_arsize(2) => \<const0>\,
      s_axi_arsize(1) => \<const0>\,
      s_axi_arsize(0) => \<const0>\,
      s_axi_aruser(0) => \<const0>\,
      s_axi_arvalid => \<const0>\,
      s_axi_awaddr(31) => \<const0>\,
      s_axi_awaddr(30) => \<const0>\,
      s_axi_awaddr(29) => \<const0>\,
      s_axi_awaddr(28) => \<const0>\,
      s_axi_awaddr(27) => \<const0>\,
      s_axi_awaddr(26) => \<const0>\,
      s_axi_awaddr(25) => \<const0>\,
      s_axi_awaddr(24) => \<const0>\,
      s_axi_awaddr(23) => \<const0>\,
      s_axi_awaddr(22) => \<const0>\,
      s_axi_awaddr(21) => \<const0>\,
      s_axi_awaddr(20) => \<const0>\,
      s_axi_awaddr(19) => \<const0>\,
      s_axi_awaddr(18) => \<const0>\,
      s_axi_awaddr(17) => \<const0>\,
      s_axi_awaddr(16) => \<const0>\,
      s_axi_awaddr(15) => \<const0>\,
      s_axi_awaddr(14) => \<const0>\,
      s_axi_awaddr(13) => \<const0>\,
      s_axi_awaddr(12) => \<const0>\,
      s_axi_awaddr(11) => \<const0>\,
      s_axi_awaddr(10) => \<const0>\,
      s_axi_awaddr(9) => \<const0>\,
      s_axi_awaddr(8) => \<const0>\,
      s_axi_awaddr(7) => \<const0>\,
      s_axi_awaddr(6) => \<const0>\,
      s_axi_awaddr(5) => \<const0>\,
      s_axi_awaddr(4) => \<const0>\,
      s_axi_awaddr(3) => \<const0>\,
      s_axi_awaddr(2) => \<const0>\,
      s_axi_awaddr(1) => \<const0>\,
      s_axi_awaddr(0) => \<const0>\,
      s_axi_awburst(1) => \<const0>\,
      s_axi_awburst(0) => \<const0>\,
      s_axi_awcache(3) => \<const0>\,
      s_axi_awcache(2) => \<const0>\,
      s_axi_awcache(1) => \<const0>\,
      s_axi_awcache(0) => \<const0>\,
      s_axi_awid(3) => \<const0>\,
      s_axi_awid(2) => \<const0>\,
      s_axi_awid(1) => \<const0>\,
      s_axi_awid(0) => \<const0>\,
      s_axi_awlen(7) => \<const0>\,
      s_axi_awlen(6) => \<const0>\,
      s_axi_awlen(5) => \<const0>\,
      s_axi_awlen(4) => \<const0>\,
      s_axi_awlen(3) => \<const0>\,
      s_axi_awlen(2) => \<const0>\,
      s_axi_awlen(1) => \<const0>\,
      s_axi_awlen(0) => \<const0>\,
      s_axi_awlock(1) => \<const0>\,
      s_axi_awlock(0) => \<const0>\,
      s_axi_awprot(2) => \<const0>\,
      s_axi_awprot(1) => \<const0>\,
      s_axi_awprot(0) => \<const0>\,
      s_axi_awqos(3) => \<const0>\,
      s_axi_awqos(2) => \<const0>\,
      s_axi_awqos(1) => \<const0>\,
      s_axi_awqos(0) => \<const0>\,
      s_axi_awready => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_awready_UNCONNECTED\,
      s_axi_awregion(3) => \<const0>\,
      s_axi_awregion(2) => \<const0>\,
      s_axi_awregion(1) => \<const0>\,
      s_axi_awregion(0) => \<const0>\,
      s_axi_awsize(2) => \<const0>\,
      s_axi_awsize(1) => \<const0>\,
      s_axi_awsize(0) => \<const0>\,
      s_axi_awuser(0) => \<const0>\,
      s_axi_awvalid => \<const0>\,
      s_axi_bid(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bid_UNCONNECTED\(3 downto 0),
      s_axi_bready => \<const0>\,
      s_axi_bresp(1 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bresp_UNCONNECTED\(1 downto 0),
      s_axi_buser(0) => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_buser_UNCONNECTED\(0),
      s_axi_bvalid => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bvalid_UNCONNECTED\,
      s_axi_rdata(63 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rdata_UNCONNECTED\(63 downto 0),
      s_axi_rid(3 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rid_UNCONNECTED\(3 downto 0),
      s_axi_rlast => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rlast_UNCONNECTED\,
      s_axi_rready => \<const0>\,
      s_axi_rresp(1 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rresp_UNCONNECTED\(1 downto 0),
      s_axi_ruser(0) => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_ruser_UNCONNECTED\(0),
      s_axi_rvalid => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rvalid_UNCONNECTED\,
      s_axi_wdata(63) => \<const0>\,
      s_axi_wdata(62) => \<const0>\,
      s_axi_wdata(61) => \<const0>\,
      s_axi_wdata(60) => \<const0>\,
      s_axi_wdata(59) => \<const0>\,
      s_axi_wdata(58) => \<const0>\,
      s_axi_wdata(57) => \<const0>\,
      s_axi_wdata(56) => \<const0>\,
      s_axi_wdata(55) => \<const0>\,
      s_axi_wdata(54) => \<const0>\,
      s_axi_wdata(53) => \<const0>\,
      s_axi_wdata(52) => \<const0>\,
      s_axi_wdata(51) => \<const0>\,
      s_axi_wdata(50) => \<const0>\,
      s_axi_wdata(49) => \<const0>\,
      s_axi_wdata(48) => \<const0>\,
      s_axi_wdata(47) => \<const0>\,
      s_axi_wdata(46) => \<const0>\,
      s_axi_wdata(45) => \<const0>\,
      s_axi_wdata(44) => \<const0>\,
      s_axi_wdata(43) => \<const0>\,
      s_axi_wdata(42) => \<const0>\,
      s_axi_wdata(41) => \<const0>\,
      s_axi_wdata(40) => \<const0>\,
      s_axi_wdata(39) => \<const0>\,
      s_axi_wdata(38) => \<const0>\,
      s_axi_wdata(37) => \<const0>\,
      s_axi_wdata(36) => \<const0>\,
      s_axi_wdata(35) => \<const0>\,
      s_axi_wdata(34) => \<const0>\,
      s_axi_wdata(33) => \<const0>\,
      s_axi_wdata(32) => \<const0>\,
      s_axi_wdata(31) => \<const0>\,
      s_axi_wdata(30) => \<const0>\,
      s_axi_wdata(29) => \<const0>\,
      s_axi_wdata(28) => \<const0>\,
      s_axi_wdata(27) => \<const0>\,
      s_axi_wdata(26) => \<const0>\,
      s_axi_wdata(25) => \<const0>\,
      s_axi_wdata(24) => \<const0>\,
      s_axi_wdata(23) => \<const0>\,
      s_axi_wdata(22) => \<const0>\,
      s_axi_wdata(21) => \<const0>\,
      s_axi_wdata(20) => \<const0>\,
      s_axi_wdata(19) => \<const0>\,
      s_axi_wdata(18) => \<const0>\,
      s_axi_wdata(17) => \<const0>\,
      s_axi_wdata(16) => \<const0>\,
      s_axi_wdata(15) => \<const0>\,
      s_axi_wdata(14) => \<const0>\,
      s_axi_wdata(13) => \<const0>\,
      s_axi_wdata(12) => \<const0>\,
      s_axi_wdata(11) => \<const0>\,
      s_axi_wdata(10) => \<const0>\,
      s_axi_wdata(9) => \<const0>\,
      s_axi_wdata(8) => \<const0>\,
      s_axi_wdata(7) => \<const0>\,
      s_axi_wdata(6) => \<const0>\,
      s_axi_wdata(5) => \<const0>\,
      s_axi_wdata(4) => \<const0>\,
      s_axi_wdata(3) => \<const0>\,
      s_axi_wdata(2) => \<const0>\,
      s_axi_wdata(1) => \<const0>\,
      s_axi_wdata(0) => \<const0>\,
      s_axi_wid(3) => \<const0>\,
      s_axi_wid(2) => \<const0>\,
      s_axi_wid(1) => \<const0>\,
      s_axi_wid(0) => \<const0>\,
      s_axi_wlast => \<const0>\,
      s_axi_wready => \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_wready_UNCONNECTED\,
      s_axi_wstrb(7) => \<const0>\,
      s_axi_wstrb(6) => \<const0>\,
      s_axi_wstrb(5) => \<const0>\,
      s_axi_wstrb(4) => \<const0>\,
      s_axi_wstrb(3) => \<const0>\,
      s_axi_wstrb(2) => \<const0>\,
      s_axi_wstrb(1) => \<const0>\,
      s_axi_wstrb(0) => \<const0>\,
      s_axi_wuser(0) => \<const0>\,
      s_axi_wvalid => \<const0>\,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tdest(0) => s_axis_tdest(0),
      s_axis_tid(0) => s_axis_tid(0),
      s_axis_tkeep(3 downto 0) => s_axis_tkeep(3 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(3 downto 0) => s_axis_tstrb(3 downto 0),
      s_axis_tuser(0) => s_axis_tuser(0),
      s_axis_tvalid => s_axis_tvalid,
      sbiterr => \NLW_gen_fifo_generator.fifo_generator_inst_sbiterr_UNCONNECTED\,
      sleep => \<const0>\,
      srst => \<const0>\,
      underflow => \NLW_gen_fifo_generator.fifo_generator_inst_underflow_UNCONNECTED\,
      valid => \NLW_gen_fifo_generator.fifo_generator_inst_valid_UNCONNECTED\,
      wr_ack => \NLW_gen_fifo_generator.fifo_generator_inst_wr_ack_UNCONNECTED\,
      wr_clk => \<const0>\,
      wr_data_count(9 downto 0) => \NLW_gen_fifo_generator.fifo_generator_inst_wr_data_count_UNCONNECTED\(9 downto 0),
      wr_en => \<const0>\,
      wr_rst => \<const0>\,
      wr_rst_busy => \NLW_gen_fifo_generator.fifo_generator_inst_wr_rst_busy_UNCONNECTED\
    );
s_and_m_aresetn_i_inferred_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => s_axis_aresetn,
      I1 => m_axis_aresetn,
      O => s_and_m_aresetn_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity afifo_32x512_axis_data_fifo_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of afifo_32x512_axis_data_fifo_0_0 : entity is true;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of afifo_32x512_axis_data_fifo_0_0 : entity is "axis_data_fifo_v1_1_axis_data_fifo,Vivado 2014.4";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of afifo_32x512_axis_data_fifo_0_0 : entity is "afifo_32x512_axis_data_fifo_0_0,axis_data_fifo_v1_1_axis_data_fifo,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of afifo_32x512_axis_data_fifo_0_0 : entity is "afifo_32x512_axis_data_fifo_0_0,axis_data_fifo_v1_1_axis_data_fifo,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_data_fifo,x_ipVersion=1.1,x_ipCoreRevision=5,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_FAMILY=virtex7,C_AXIS_TDATA_WIDTH=32,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_AXIS_TUSER_WIDTH=1,C_AXIS_SIGNAL_SET=0b00000000000000000000000000010011,C_FIFO_DEPTH=512,C_FIFO_MODE=1,C_IS_ACLK_ASYNC=1,C_SYNCHRONIZER_STAGE=3,C_ACLKEN_CONV_MODE=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of afifo_32x512_axis_data_fifo_0_0 : entity is "yes";
end afifo_32x512_axis_data_fifo_0_0;

architecture STRUCTURE of afifo_32x512_axis_data_fifo_0_0 is
  signal NLW_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of inst : label is 0;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000000010011";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 32;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 1;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of inst : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of inst : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of inst : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of inst : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of inst : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of inst : label is 4;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of inst : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of inst : label is 1;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of inst : label is 10;
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of inst : label is 18;
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of inst : label is 18;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "virtex7";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of inst : label is 512;
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of inst : label is 1;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of inst : label is 1;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH_RACH : integer;
  attribute C_RD_PNTR_WIDTH_RACH of inst : label is 4;
  attribute C_RD_PNTR_WIDTH_RDCH : integer;
  attribute C_RD_PNTR_WIDTH_RDCH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH_WACH : integer;
  attribute C_RD_PNTR_WIDTH_WACH of inst : label is 4;
  attribute C_RD_PNTR_WIDTH_WDCH : integer;
  attribute C_RD_PNTR_WIDTH_WDCH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH_WRCH : integer;
  attribute C_RD_PNTR_WIDTH_WRCH of inst : label is 4;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of inst : label is 3;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of inst : label is 9;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of inst : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of inst : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of inst : label is 4;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of inst : label is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of inst : label is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of inst : label is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of inst : label is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of inst : label is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of inst : label is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of inst : label is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of inst : label is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of inst : label is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of inst : label is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of inst : label is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of inst : label is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of inst : label is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of inst : label is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of inst : label is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of inst : label is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of inst : label is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of inst : label is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of inst : label is 1;
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute P_APPLICATION_TYPE_AXIS : integer;
  attribute P_APPLICATION_TYPE_AXIS of inst : label is 0;
  attribute P_AXIS_PAYLOAD_WIDTH : integer;
  attribute P_AXIS_PAYLOAD_WIDTH of inst : label is 33;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of inst : label is 0;
  attribute P_FIFO_COUNT_WIDTH : integer;
  attribute P_FIFO_COUNT_WIDTH of inst : label is 10;
  attribute P_FIFO_TYPE : integer;
  attribute P_FIFO_TYPE of inst : label is 1;
  attribute P_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute P_IMPLEMENTATION_TYPE_AXIS of inst : label is 11;
  attribute P_MSGON_VAL : integer;
  attribute P_MSGON_VAL of inst : label is 0;
  attribute P_TDATA_EXISTS : integer;
  attribute P_TDATA_EXISTS of inst : label is 1;
  attribute P_TDEST_EXISTS : integer;
  attribute P_TDEST_EXISTS of inst : label is 0;
  attribute P_TID_EXISTS : integer;
  attribute P_TID_EXISTS of inst : label is 0;
  attribute P_TKEEP_EXISTS : integer;
  attribute P_TKEEP_EXISTS of inst : label is 0;
  attribute P_TLAST_EXISTS : integer;
  attribute P_TLAST_EXISTS of inst : label is 1;
  attribute P_TREADY_EXISTS : integer;
  attribute P_TREADY_EXISTS of inst : label is 1;
  attribute P_TSTRB_EXISTS : integer;
  attribute P_TSTRB_EXISTS of inst : label is 0;
  attribute P_TUSER_EXISTS : integer;
  attribute P_TUSER_EXISTS of inst : label is 0;
  attribute P_WR_PNTR_WIDTH : integer;
  attribute P_WR_PNTR_WIDTH of inst : label is 9;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of inst : label is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
begin
inst: entity work.afifo_32x512_axis_data_fifo_0_0_axis_data_fifo_v1_1_axis_data_fifo
    port map (
      axis_data_count(31 downto 0) => axis_data_count(31 downto 0),
      axis_rd_data_count(31 downto 0) => axis_rd_data_count(31 downto 0),
      axis_wr_data_count(31 downto 0) => axis_wr_data_count(31 downto 0),
      m_axis_aclk => m_axis_aclk,
      m_axis_aclken => '1',
      m_axis_aresetn => m_axis_aresetn,
      m_axis_tdata(31 downto 0) => m_axis_tdata(31 downto 0),
      m_axis_tdest(0) => NLW_inst_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(3 downto 0) => NLW_inst_m_axis_tkeep_UNCONNECTED(3 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(3 downto 0) => NLW_inst_m_axis_tstrb_UNCONNECTED(3 downto 0),
      m_axis_tuser(0) => NLW_inst_m_axis_tuser_UNCONNECTED(0),
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => '1',
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(3) => '1',
      s_axis_tkeep(2) => '1',
      s_axis_tkeep(1) => '1',
      s_axis_tkeep(0) => '1',
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(3) => '1',
      s_axis_tstrb(2) => '1',
      s_axis_tstrb(1) => '1',
      s_axis_tstrb(0) => '1',
      s_axis_tuser(0) => '0',
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
