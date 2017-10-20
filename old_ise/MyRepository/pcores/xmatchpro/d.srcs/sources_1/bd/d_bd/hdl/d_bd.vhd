--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Wed Jan 04 00:45:35 2017
--Host        : IT002580 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target d_bd.bd
--Design      : d_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FIFO_DC_imp_ZOTHIK is
  port (
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 );
    Res1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    empty : out STD_LOGIC_VECTOR ( 0 to 0 );
    full : out STD_LOGIC_VECTOR ( 0 to 0 );
    rst : in STD_LOGIC;
    wr_en : in STD_LOGIC
  );
end FIFO_DC_imp_ZOTHIK;

architecture STRUCTURE of FIFO_DC_imp_ZOTHIK is
  component d_bd_c_shift_ram_0_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_c_shift_ram_0_0;
  component d_bd_c_shift_ram_1_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_c_shift_ram_1_0;
  component d_bd_c_shift_ram_2_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_c_shift_ram_2_0;
  component d_bd_c_shift_ram_3_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_c_shift_ram_3_0;
  component d_bd_c_shift_ram_4_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component d_bd_c_shift_ram_4_0;
  component d_bd_c_shift_ram_6_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_c_shift_ram_6_0;
  component d_bd_fifo_generator_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  end component d_bd_fifo_generator_0_0;
  component d_bd_util_vector_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_0_0;
  component d_bd_util_vector_logic_1_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_1_0;
  component d_bd_util_vector_logic_2_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_2_0;
  component d_bd_util_vector_logic_3_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_3_0;
  component d_bd_util_vector_logic_5_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_5_0;
  component d_bd_util_vector_logic_6_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_6_0;
  signal CLK_1 : STD_LOGIC;
  signal D_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op2_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op3_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal c_shift_ram_0_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal c_shift_ram_1_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal c_shift_ram_2_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal c_shift_ram_3_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal c_shift_ram_4_Q : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal c_shift_ram_6_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal din_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal fifo_generator_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal fifo_generator_0_empty : STD_LOGIC;
  signal fifo_generator_0_full : STD_LOGIC;
  signal rst_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_3_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_5_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_6_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal wr_en_1 : STD_LOGIC;
begin
  CLK_1 <= CLK;
  D_1(0) <= D(0);
  Op2_1(0) <= Op2(0);
  Op3_1(0) <= Op3(0);
  Q(0) <= c_shift_ram_0_Q(0);
  Q1(31 downto 0) <= c_shift_ram_4_Q(31 downto 0);
  Res(0) <= util_vector_logic_0_Res(0);
  Res1(0) <= util_vector_logic_3_Res(0);
  din_1(31 downto 0) <= din(31 downto 0);
  empty(0) <= fifo_generator_0_empty;
  full(0) <= fifo_generator_0_full;
  rst_1 <= rst;
  wr_en_1 <= wr_en;
c_shift_ram_0: component d_bd_c_shift_ram_0_0
    port map (
      CLK => CLK_1,
      D(0) => D_1(0),
      Q(0) => c_shift_ram_0_Q(0)
    );
c_shift_ram_1: component d_bd_c_shift_ram_1_0
    port map (
      CLK => CLK_1,
      D(0) => fifo_generator_0_empty,
      Q(0) => c_shift_ram_1_Q(0)
    );
c_shift_ram_2: component d_bd_c_shift_ram_2_0
    port map (
      CLK => CLK_1,
      D(0) => c_shift_ram_1_Q(0),
      Q(0) => c_shift_ram_2_Q(0)
    );
c_shift_ram_3: component d_bd_c_shift_ram_3_0
    port map (
      CLK => CLK_1,
      D(0) => c_shift_ram_2_Q(0),
      Q(0) => c_shift_ram_3_Q(0)
    );
c_shift_ram_4: component d_bd_c_shift_ram_4_0
    port map (
      CE => util_vector_logic_2_Res(0),
      CLK => CLK_1,
      D(31 downto 0) => fifo_generator_0_dout(31 downto 0),
      Q(31 downto 0) => c_shift_ram_4_Q(31 downto 0)
    );
c_shift_ram_6: component d_bd_c_shift_ram_6_0
    port map (
      CLK => CLK_1,
      D(0) => util_vector_logic_5_Res(0),
      Q(0) => c_shift_ram_6_Q(0)
    );
fifo_generator_0: component d_bd_fifo_generator_0_0
    port map (
      clk => CLK_1,
      din(31 downto 0) => din_1(31 downto 0),
      dout(31 downto 0) => fifo_generator_0_dout(31 downto 0),
      empty => fifo_generator_0_empty,
      full => fifo_generator_0_full,
      rd_en => util_vector_logic_2_Res(0),
      rst => rst_1,
      wr_en => wr_en_1
    );
util_vector_logic_0: component d_bd_util_vector_logic_0_0
    port map (
      Op1(0) => util_vector_logic_6_Res(0),
      Op2(0) => Op3_1(0),
      Res(0) => util_vector_logic_0_Res(0)
    );
util_vector_logic_1: component d_bd_util_vector_logic_1_0
    port map (
      Op1(0) => fifo_generator_0_empty,
      Res(0) => util_vector_logic_1_Res(0)
    );
util_vector_logic_2: component d_bd_util_vector_logic_2_0
    port map (
      Op1(0) => c_shift_ram_6_Q(0),
      Op2(0) => Op2_1(0),
      Res(0) => util_vector_logic_2_Res(0)
    );
util_vector_logic_3: component d_bd_util_vector_logic_3_0
    port map (
      Op1(0) => fifo_generator_0_full,
      Res(0) => util_vector_logic_3_Res(0)
    );
util_vector_logic_5: component d_bd_util_vector_logic_5_0
    port map (
      Op1(0) => util_vector_logic_1_Res(0),
      Op2(0) => Op2_1(0),
      Res(0) => util_vector_logic_5_Res(0)
    );
util_vector_logic_6: component d_bd_util_vector_logic_6_0
    port map (
      Op1(0) => c_shift_ram_3_Q(0),
      Res(0) => util_vector_logic_6_Res(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FIFO_DU_imp_USS6HA is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tready : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end FIFO_DU_imp_USS6HA;

architecture STRUCTURE of FIFO_DU_imp_USS6HA is
  component d_bd_axis_data_fifo_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component d_bd_axis_data_fifo_0_0;
  component d_bd_util_vector_logic_0_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_0_1;
  component d_bd_util_vector_logic_1_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_1_1;
  component d_bd_util_vector_logic_2_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_2_1;
  signal Op1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op2_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op3_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_data_fifo_0_m_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_0_m_axis_tvalid : STD_LOGIC;
  signal axis_data_fifo_0_s_axis_tready : STD_LOGIC;
  signal m_axis_tready_1 : STD_LOGIC;
  signal s_axis_aclk_1 : STD_LOGIC;
  signal s_axis_tdata_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_data_fifo_du_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_du_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_du_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  Op1_1(0) <= Op1(0);
  Op2_1(0) <= Op2(0);
  Op3_1(0) <= Op3(0);
  Res(0) <= util_vector_logic_0_Res(0);
  m_axis_tdata(31 downto 0) <= axis_data_fifo_0_m_axis_tdata(31 downto 0);
  m_axis_tready_1 <= m_axis_tready;
  m_axis_tvalid <= axis_data_fifo_0_m_axis_tvalid;
  s_axis_aclk_1 <= s_axis_aclk;
  s_axis_tdata_1(31 downto 0) <= s_axis_tdata(31 downto 0);
  s_axis_tready(0) <= axis_data_fifo_0_s_axis_tready;
axis_data_fifo_du: component d_bd_axis_data_fifo_0_0
    port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_du_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_du_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_du_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => axis_data_fifo_0_m_axis_tdata(31 downto 0),
      m_axis_tready => m_axis_tready_1,
      m_axis_tvalid => axis_data_fifo_0_m_axis_tvalid,
      s_axis_aclk => s_axis_aclk_1,
      s_axis_aresetn => util_vector_logic_2_Res(0),
      s_axis_tdata(31 downto 0) => s_axis_tdata_1(31 downto 0),
      s_axis_tready => axis_data_fifo_0_s_axis_tready,
      s_axis_tvalid => util_vector_logic_1_Res(0)
    );
util_vector_logic_0: component d_bd_util_vector_logic_0_1
    port map (
      Op1(0) => axis_data_fifo_0_s_axis_tready,
      Op2(0) => Op2_1(0),
      Res(0) => util_vector_logic_0_Res(0)
    );
util_vector_logic_1: component d_bd_util_vector_logic_1_1
    port map (
      Op1(0) => Op1_1(0),
      Res(0) => util_vector_logic_1_Res(0)
    );
util_vector_logic_2: component d_bd_util_vector_logic_2_1
    port map (
      Op1(0) => Op3_1(0),
      Res(0) => util_vector_logic_2_Res(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity STAT_imp_V62K9U is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In17 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end STAT_imp_V62K9U;

architecture STRUCTURE of STAT_imp_V62K9U is
  component d_bd_util_vector_logic_0_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_0_2;
  component d_bd_util_vector_logic_1_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_1_2;
  component d_bd_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In17 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In20 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In23 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In24 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In25 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In26 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In27 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In28 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In29 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In30 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In31 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component d_bd_xlconcat_0_0;
  component d_bd_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_xlconstant_0_0;
  component d_bd_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_xlconstant_1_0;
  signal In0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In10_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In11_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In16_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In17_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In18_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In19_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In3_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In6_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In7_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In8_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op2_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  In0_1(0) <= In0(0);
  In10_1(0) <= In10(0);
  In11_1(0) <= In11(0);
  In16_1(0) <= In16(0);
  In17_1(0) <= In17(0);
  In18_1(0) <= In18(0);
  In19_1(0) <= In19(0);
  In3_1(0) <= In3(0);
  In6_1(0) <= In6(0);
  In7_1(0) <= In7(0);
  In8_1(0) <= In8(0);
  Op1_1(0) <= Op1(0);
  Op2_1(0) <= Op2(0);
  dout(31 downto 0) <= xlconcat_0_dout(31 downto 0);
util_vector_logic_0: component d_bd_util_vector_logic_0_2
    port map (
      Op1(0) => Op1_1(0),
      Res(0) => util_vector_logic_0_Res(0)
    );
util_vector_logic_1: component d_bd_util_vector_logic_1_2
    port map (
      Op1(0) => Op2_1(0),
      Res(0) => util_vector_logic_1_Res(0)
    );
xlconcat_0: component d_bd_xlconcat_0_0
    port map (
      In0(0) => In16_1(0),
      In1(0) => In17_1(0),
      In10(0) => In10_1(0),
      In11(0) => In11_1(0),
      In12(0) => util_vector_logic_1_Res(0),
      In13(0) => xlconstant_1_dout(0),
      In14(0) => xlconstant_1_dout(0),
      In15(0) => xlconstant_1_dout(0),
      In16(0) => xlconstant_0_dout(0),
      In17(0) => xlconstant_0_dout(0),
      In18(0) => xlconstant_0_dout(0),
      In19(0) => xlconstant_0_dout(0),
      In2(0) => In8_1(0),
      In20(0) => xlconstant_0_dout(0),
      In21(0) => xlconstant_0_dout(0),
      In22(0) => xlconstant_0_dout(0),
      In23(0) => xlconstant_0_dout(0),
      In24(0) => xlconstant_0_dout(0),
      In25(0) => xlconstant_0_dout(0),
      In26(0) => xlconstant_0_dout(0),
      In27(0) => xlconstant_0_dout(0),
      In28(0) => xlconstant_0_dout(0),
      In29(0) => xlconstant_0_dout(0),
      In3(0) => In3_1(0),
      In30(0) => xlconstant_0_dout(0),
      In31(0) => xlconstant_0_dout(0),
      In4(0) => In18_1(0),
      In5(0) => In19_1(0),
      In6(0) => In6_1(0),
      In7(0) => In7_1(0),
      In8(0) => In0_1(0),
      In9(0) => util_vector_logic_0_Res(0),
      dout(31 downto 0) => xlconcat_0_dout(31 downto 0)
    );
xlconstant_0: component d_bd_xlconstant_0_0
    port map (
      dout(0) => xlconstant_0_dout(0)
    );
xlconstant_1: component d_bd_xlconstant_1_0
    port map (
      dout(0) => xlconstant_1_dout(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity d_bd is
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
end d_bd;

architecture STRUCTURE of d_bd is
  component d_bd_gnd_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_gnd_0;
  component d_bd_util_vector_logic_0_3 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component d_bd_util_vector_logic_0_3;
  component d_bd_xpro_d_controller_0_0 is
  port (
    CLK : in STD_LOGIC;
    CLEAR : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR ( 31 downto 0 );
    COMPRESSED_SIZE : in STD_LOGIC_VECTOR ( 15 downto 0 );
    RESTART : in STD_LOGIC;
    BUS_REQ_DC : in STD_LOGIC;
    BUS_REQ_DU : in STD_LOGIC;
    BUS_ACK_DC : out STD_LOGIC;
    BUS_ACK_DU : out STD_LOGIC;
    INTR_ACK_D : out STD_LOGIC;
    INTR_REQ_D : in STD_LOGIC;
    WAIT_DC : out STD_LOGIC;
    WAIT_DU : out STD_LOGIC;
    CS_RW : out STD_LOGIC;
    ADDR : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CTRL_IN : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RST_FIFO_DU : out STD_LOGIC;
    RST_FIFO_DC : out STD_LOGIC;
    RST_ENGINE : out STD_LOGIC;
    COUNT_FINISH : out STD_LOGIC;
    FIFO_DC_EMPTY : in STD_LOGIC
  );
  end component d_bd_xpro_d_controller_0_0;
  component d_bd_xpro_d_engine_0_0 is
  port (
    CS : in STD_LOGIC;
    RW : in STD_LOGIC;
    ADDRESSD : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CONTROL_IND : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CONTROL_OUT_D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    CLEAR : in STD_LOGIC;
    BUS_ACKNOWLEDGE_DC : in STD_LOGIC;
    BUS_ACKNOWLEDGE_DU : in STD_LOGIC;
    WAIT_DC : in STD_LOGIC;
    WAIT_DU : in STD_LOGIC;
    C_DATAIN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    U_DATAOUT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FINISHED_D : out STD_LOGIC;
    FLUSHING_D : out STD_LOGIC;
    DECOMPRESSING : out STD_LOGIC;
    U_DATA_VALID : out STD_LOGIC;
    DECODING_OVERFLOW : out STD_LOGIC;
    CRC_ERROR : out STD_LOGIC;
    INTERRUPT_REQ_D : out STD_LOGIC;
    INTERRUPT_ACK_D : in STD_LOGIC;
    BUS_REQUEST_DC : out STD_LOGIC;
    BUS_REQUEST_DU : out STD_LOGIC;
    CRC_OUT_D_32 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component d_bd_xpro_d_engine_0_0;
  signal CLEAR_1 : STD_LOGIC;
  signal CLK_1 : STD_LOGIC;
  signal COMMAND_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal COMPRESSED_SIZE_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal FIFO_DC_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_DC_Q1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_DC_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_DC_Res1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_DU_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_DU_m_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_DU_m_axis_tvalid : STD_LOGIC;
  signal In10_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op2_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal STAT_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal din_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal gnd_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m_axis_tready_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal wr_en_1 : STD_LOGIC;
  signal xpro_d_controller_0_ADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xpro_d_controller_0_BUS_ACK_DC : STD_LOGIC;
  signal xpro_d_controller_0_BUS_ACK_DU : STD_LOGIC;
  signal xpro_d_controller_0_COUNT_FINISH : STD_LOGIC;
  signal xpro_d_controller_0_CS_RW : STD_LOGIC;
  signal xpro_d_controller_0_CTRL_IN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_d_controller_0_INTR_ACK_D : STD_LOGIC;
  signal xpro_d_controller_0_RST_ENGINE : STD_LOGIC;
  signal xpro_d_controller_0_RST_FIFO_DC : STD_LOGIC;
  signal xpro_d_controller_0_RST_FIFO_DU : STD_LOGIC;
  signal xpro_d_controller_0_WAIT_DC : STD_LOGIC;
  signal xpro_d_controller_0_WAIT_DU : STD_LOGIC;
  signal xpro_d_engine_0_BUS_REQUEST_DC : STD_LOGIC;
  signal xpro_d_engine_0_BUS_REQUEST_DU : STD_LOGIC;
  signal xpro_d_engine_0_CRC_ERROR : STD_LOGIC;
  signal xpro_d_engine_0_CRC_OUT_D_32 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_d_engine_0_DECODING_OVERFLOW : STD_LOGIC;
  signal xpro_d_engine_0_DECOMPRESSING : STD_LOGIC;
  signal xpro_d_engine_0_FINISHED_D : STD_LOGIC;
  signal xpro_d_engine_0_FLUSHING_D : STD_LOGIC;
  signal xpro_d_engine_0_INTERRUPT_REQ_D : STD_LOGIC;
  signal xpro_d_engine_0_U_DATAOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_d_engine_0_U_DATA_VALID : STD_LOGIC;
  signal NLW_xpro_d_engine_0_CONTROL_OUT_D_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  CLEAR_1 <= RESETN;
  CLK_1 <= CLK;
  COMMAND_1(31 downto 0) <= COMMAND(31 downto 0);
  COMPRESSED_SIZE_1(15 downto 0) <= COMPRESSED_SIZE(15 downto 0);
  CRC_32_D(31 downto 0) <= xpro_d_engine_0_CRC_OUT_D_32(31 downto 0);
  INTERRUPT_REQ_D(0) <= util_vector_logic_0_Res(0);
  M_AXIS_tdata(31 downto 0) <= FIFO_DU_m_axis_tdata(31 downto 0);
  M_AXIS_tvalid <= FIFO_DU_m_axis_tvalid;
  STATUS(31 downto 0) <= STAT_dout(31 downto 0);
  S_AXIS_tready(0) <= FIFO_DC_Res1(0);
  din_1(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  m_axis_tready_1 <= M_AXIS_tready;
  wr_en_1 <= S_AXIS_tvalid;
FIFO_DC: entity work.FIFO_DC_imp_ZOTHIK
    port map (
      CLK => CLK_1,
      D(0) => xpro_d_controller_0_BUS_ACK_DC,
      Op2(0) => xpro_d_controller_0_WAIT_DC,
      Op3(0) => xpro_d_controller_0_COUNT_FINISH,
      Q(0) => FIFO_DC_Q(0),
      Q1(31 downto 0) => FIFO_DC_Q1(31 downto 0),
      Res(0) => FIFO_DC_Res(0),
      Res1(0) => FIFO_DC_Res1(0),
      din(31 downto 0) => din_1(31 downto 0),
      empty(0) => Op1_1(0),
      full(0) => In10_1(0),
      rst => xpro_d_controller_0_RST_FIFO_DC,
      wr_en => wr_en_1
    );
FIFO_DU: entity work.FIFO_DU_imp_USS6HA
    port map (
      Op1(0) => xpro_d_engine_0_U_DATA_VALID,
      Op2(0) => xpro_d_controller_0_WAIT_DU,
      Op3(0) => xpro_d_controller_0_RST_FIFO_DU,
      Res(0) => FIFO_DU_Res(0),
      m_axis_tdata(31 downto 0) => FIFO_DU_m_axis_tdata(31 downto 0),
      m_axis_tready => m_axis_tready_1,
      m_axis_tvalid => FIFO_DU_m_axis_tvalid,
      s_axis_aclk => CLK_1,
      s_axis_tdata(31 downto 0) => xpro_d_engine_0_U_DATAOUT(31 downto 0),
      s_axis_tready(0) => Op2_1(0)
    );
STAT: entity work.STAT_imp_V62K9U
    port map (
      In0(0) => xpro_d_engine_0_INTERRUPT_REQ_D,
      In10(0) => In10_1(0),
      In11(0) => FIFO_DU_m_axis_tvalid,
      In16(0) => xpro_d_engine_0_FINISHED_D,
      In17(0) => xpro_d_engine_0_DECOMPRESSING,
      In18(0) => xpro_d_engine_0_DECODING_OVERFLOW,
      In19(0) => xpro_d_engine_0_CRC_ERROR,
      In3(0) => xpro_d_engine_0_U_DATA_VALID,
      In6(0) => xpro_d_engine_0_BUS_REQUEST_DC,
      In7(0) => xpro_d_engine_0_BUS_REQUEST_DU,
      In8(0) => xpro_d_engine_0_FLUSHING_D,
      Op1(0) => Op1_1(0),
      Op2(0) => Op2_1(0),
      dout(31 downto 0) => STAT_dout(31 downto 0)
    );
gnd: component d_bd_gnd_0
    port map (
      dout(0) => gnd_dout(0)
    );
util_vector_logic_0: component d_bd_util_vector_logic_0_3
    port map (
      Op1(0) => xpro_d_engine_0_INTERRUPT_REQ_D,
      Res(0) => util_vector_logic_0_Res(0)
    );
xpro_d_controller_0: component d_bd_xpro_d_controller_0_0
    port map (
      ADDR(3 downto 0) => xpro_d_controller_0_ADDR(3 downto 0),
      BUS_ACK_DC => xpro_d_controller_0_BUS_ACK_DC,
      BUS_ACK_DU => xpro_d_controller_0_BUS_ACK_DU,
      BUS_REQ_DC => xpro_d_engine_0_BUS_REQUEST_DC,
      BUS_REQ_DU => xpro_d_engine_0_BUS_REQUEST_DU,
      CLEAR => CLEAR_1,
      CLK => CLK_1,
      COMMAND(31 downto 0) => COMMAND_1(31 downto 0),
      COMPRESSED_SIZE(15 downto 0) => COMPRESSED_SIZE_1(15 downto 0),
      COUNT_FINISH => xpro_d_controller_0_COUNT_FINISH,
      CS_RW => xpro_d_controller_0_CS_RW,
      CTRL_IN(31 downto 0) => xpro_d_controller_0_CTRL_IN(31 downto 0),
      FIFO_DC_EMPTY => Op1_1(0),
      INTR_ACK_D => xpro_d_controller_0_INTR_ACK_D,
      INTR_REQ_D => xpro_d_engine_0_INTERRUPT_REQ_D,
      RESTART => gnd_dout(0),
      RST_ENGINE => xpro_d_controller_0_RST_ENGINE,
      RST_FIFO_DC => xpro_d_controller_0_RST_FIFO_DC,
      RST_FIFO_DU => xpro_d_controller_0_RST_FIFO_DU,
      WAIT_DC => xpro_d_controller_0_WAIT_DC,
      WAIT_DU => xpro_d_controller_0_WAIT_DU
    );
xpro_d_engine_0: component d_bd_xpro_d_engine_0_0
    port map (
      ADDRESSD(3 downto 0) => xpro_d_controller_0_ADDR(3 downto 0),
      BUS_ACKNOWLEDGE_DC => FIFO_DC_Q(0),
      BUS_ACKNOWLEDGE_DU => xpro_d_controller_0_BUS_ACK_DU,
      BUS_REQUEST_DC => xpro_d_engine_0_BUS_REQUEST_DC,
      BUS_REQUEST_DU => xpro_d_engine_0_BUS_REQUEST_DU,
      CLEAR => xpro_d_controller_0_RST_ENGINE,
      CLK => CLK_1,
      CONTROL_IND(31 downto 0) => xpro_d_controller_0_CTRL_IN(31 downto 0),
      CONTROL_OUT_D(31 downto 0) => NLW_xpro_d_engine_0_CONTROL_OUT_D_UNCONNECTED(31 downto 0),
      CRC_ERROR => xpro_d_engine_0_CRC_ERROR,
      CRC_OUT_D_32(31 downto 0) => xpro_d_engine_0_CRC_OUT_D_32(31 downto 0),
      CS => xpro_d_controller_0_CS_RW,
      C_DATAIN(31 downto 0) => FIFO_DC_Q1(31 downto 0),
      DECODING_OVERFLOW => xpro_d_engine_0_DECODING_OVERFLOW,
      DECOMPRESSING => xpro_d_engine_0_DECOMPRESSING,
      FINISHED_D => xpro_d_engine_0_FINISHED_D,
      FLUSHING_D => xpro_d_engine_0_FLUSHING_D,
      INTERRUPT_ACK_D => xpro_d_controller_0_INTR_ACK_D,
      INTERRUPT_REQ_D => xpro_d_engine_0_INTERRUPT_REQ_D,
      RW => xpro_d_controller_0_CS_RW,
      U_DATAOUT(31 downto 0) => xpro_d_engine_0_U_DATAOUT(31 downto 0),
      U_DATA_VALID => xpro_d_engine_0_U_DATA_VALID,
      WAIT_DC => FIFO_DC_Res(0),
      WAIT_DU => FIFO_DU_Res(0)
    );
end STRUCTURE;
