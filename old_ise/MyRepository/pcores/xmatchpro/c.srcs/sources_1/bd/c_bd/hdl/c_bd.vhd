--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Thu Jan 05 10:50:13 2017
--Host        : IT002580 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target c_bd.bd
--Design      : c_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FIFO_CC_imp_4GVZH is
  port (
    L : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 );
    Res1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    flush_fifo : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tdatafifo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_treadyfifo : in STD_LOGIC;
    m_axis_tvalid1 : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end FIFO_CC_imp_4GVZH;

architecture STRUCTURE of FIFO_CC_imp_4GVZH is
  component c_bd_axis_data_fifo_cc1_0 is
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
  end component c_bd_axis_data_fifo_cc1_0;
  component c_bd_axis_data_fifo_cc2_0 is
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
  end component c_bd_axis_data_fifo_cc2_0;
  component c_bd_c_shift_ram_7_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_c_shift_ram_7_0;
  component c_bd_count_down_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_count_down_0;
  component c_bd_count_finish_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_count_finish_0;
  component c_bd_util_vector_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_0_0;
  component c_bd_util_vector_logic_1_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_1_0;
  component c_bd_util_vector_logic_2_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_2_0;
  component c_bd_util_vector_logic_5_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_5_0;
  component c_bd_util_vector_logic_7_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_7_0;
  component c_bd_util_vector_logic_8_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_8_0;
  component c_bd_util_vector_logic_9_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_9_0;
  component c_bd_util_vector_logic_10_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_10_0;
  signal Op1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op2_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op3_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op4_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op5_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op6_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op7_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_data_fifo_0_m_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_0_m_axis_tvalid : STD_LOGIC;
  signal axis_data_fifo_0_s_axis_tready : STD_LOGIC;
  signal axis_data_fifo_1_m_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_1_m_axis_tvalid : STD_LOGIC;
  signal c_shift_ram_7_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count_down_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count_finish_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m_axis_treadyfifo_1 : STD_LOGIC;
  signal s_axis_aclk_1 : STD_LOGIC;
  signal s_axis_tdata_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_10_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_5_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_7_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_8_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_9_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_data_fifo_cc1_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_axis_data_fifo_cc1_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_cc1_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_cc1_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_cc2_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_cc2_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_cc2_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  Op1_1(0) <= Op1(0);
  Op2_1(0) <= Op2(0);
  Op3_1(0) <= Op3(0);
  Op4_1(0) <= Op4(0);
  Op5_1(0) <= Op5(0);
  Op6_1(0) <= Op6(0);
  Op7_1(0) <= flush_fifo(0);
  Res(0) <= util_vector_logic_2_Res(0);
  Res1(0) <= util_vector_logic_9_Res(0);
  m_axis_tdata(31 downto 0) <= axis_data_fifo_1_m_axis_tdata(31 downto 0);
  m_axis_tdatafifo(31 downto 0) <= axis_data_fifo_0_m_axis_tdata(31 downto 0);
  m_axis_treadyfifo_1 <= m_axis_treadyfifo;
  m_axis_tvalid1 <= axis_data_fifo_0_m_axis_tvalid;
  s_axis_aclk_1 <= s_axis_aclk;
  s_axis_tdata_1(31 downto 0) <= s_axis_tdata(31 downto 0);
axis_data_fifo_cc1: component c_bd_axis_data_fifo_cc1_0
    port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_cc1_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_cc1_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_cc1_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => axis_data_fifo_1_m_axis_tdata(31 downto 0),
      m_axis_tready => util_vector_logic_7_Res(0),
      m_axis_tvalid => axis_data_fifo_1_m_axis_tvalid,
      s_axis_aclk => s_axis_aclk_1,
      s_axis_aresetn => util_vector_logic_1_Res(0),
      s_axis_tdata(31 downto 0) => s_axis_tdata_1(31 downto 0),
      s_axis_tready => NLW_axis_data_fifo_cc1_s_axis_tready_UNCONNECTED,
      s_axis_tvalid => util_vector_logic_0_Res(0)
    );
axis_data_fifo_cc2: component c_bd_axis_data_fifo_cc2_0
    port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_cc2_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_cc2_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_cc2_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => axis_data_fifo_0_m_axis_tdata(31 downto 0),
      m_axis_tready => util_vector_logic_10_Res(0),
      m_axis_tvalid => axis_data_fifo_0_m_axis_tvalid,
      s_axis_aclk => s_axis_aclk_1,
      s_axis_aresetn => util_vector_logic_1_Res(0),
      s_axis_tdata(31 downto 0) => s_axis_tdata_1(31 downto 0),
      s_axis_tready => axis_data_fifo_0_s_axis_tready,
      s_axis_tvalid => util_vector_logic_0_Res(0)
    );
c_shift_ram_7: component c_bd_c_shift_ram_7_0
    port map (
      CLK => s_axis_aclk_1,
      D(0) => util_vector_logic_8_Res(0),
      Q(0) => c_shift_ram_7_Q(0)
    );
count_down: component c_bd_count_down_0
    port map (
      Op1(0) => axis_data_fifo_1_m_axis_tvalid,
      Op2(0) => util_vector_logic_7_Res(0),
      Res(0) => count_down_Res(0)
    );
count_finish: component c_bd_count_finish_0
    port map (
      Op1(0) => Op4_1(0),
      Res(0) => count_finish_Res(0)
    );
util_vector_logic_0: component c_bd_util_vector_logic_0_0
    port map (
      Op1(0) => Op1_1(0),
      Res(0) => util_vector_logic_0_Res(0)
    );
util_vector_logic_1: component c_bd_util_vector_logic_1_0
    port map (
      Op1(0) => Op3_1(0),
      Res(0) => util_vector_logic_1_Res(0)
    );
util_vector_logic_10: component c_bd_util_vector_logic_10_0
    port map (
      Op1(0) => Op7_1(0),
      Op2(0) => m_axis_treadyfifo_1,
      Res(0) => util_vector_logic_10_Res(0)
    );
util_vector_logic_2: component c_bd_util_vector_logic_2_0
    port map (
      Op1(0) => axis_data_fifo_0_s_axis_tready,
      Op2(0) => Op2_1(0),
      Res(0) => util_vector_logic_2_Res(0)
    );
util_vector_logic_5: component c_bd_util_vector_logic_5_0
    port map (
      Op1(0) => Op5_1(0),
      Res(0) => util_vector_logic_5_Res(0)
    );
util_vector_logic_7: component c_bd_util_vector_logic_7_0
    port map (
      Op1(0) => c_shift_ram_7_Q(0),
      Op2(0) => util_vector_logic_5_Res(0),
      Res(0) => util_vector_logic_7_Res(0)
    );
util_vector_logic_8: component c_bd_util_vector_logic_8_0
    port map (
      Op1(0) => Op6_1(0),
      Res(0) => util_vector_logic_8_Res(0)
    );
util_vector_logic_9: component c_bd_util_vector_logic_9_0
    port map (
      Op1(0) => count_down_Res(0),
      Op2(0) => count_finish_Res(0),
      Res(0) => util_vector_logic_9_Res(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FIFO_CU_imp_1UJJ8B3 is
  port (
    CLK : in STD_LOGIC;
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q3 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    busy : in STD_LOGIC_VECTOR ( 0 to 0 );
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 0 to 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    read_fifo_cu : in STD_LOGIC;
    rst : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    u_wait_cu : in STD_LOGIC;
    wait_cu : out STD_LOGIC_VECTOR ( 0 to 0 );
    wait_cu_ctlr : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_en : in STD_LOGIC
  );
end FIFO_CU_imp_1UJJ8B3;

architecture STRUCTURE of FIFO_CU_imp_1UJJ8B3 is
  component c_bd_axis_data_fifo_cu1_0 is
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
  end component c_bd_axis_data_fifo_cu1_0;
  component c_bd_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component c_bd_blk_mem_gen_0_0;
  component c_bd_c_shift_ram_4_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component c_bd_c_shift_ram_4_0;
  component c_bd_c_shift_ram_5_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component c_bd_c_shift_ram_5_0;
  component c_bd_c_shift_ram_6_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_c_shift_ram_6_0;
  component c_bd_counter_addra_0 is
  port (
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component c_bd_counter_addra_0;
  component c_bd_counter_addrb_0 is
  port (
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component c_bd_counter_addrb_0;
  component c_bd_delay_1_rdy_vld_1_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_delay_1_rdy_vld_1_0;
  component c_bd_delay_1_rdy_vld_2_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_delay_1_rdy_vld_2_0;
  component c_bd_m_tvalid_busy_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_m_tvalid_busy_0;
  component c_bd_util_vector_logic_0_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_0_1;
  component c_bd_util_vector_logic_1_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_1_1;
  component c_bd_util_vector_logic_2_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_2_1;
  component c_bd_util_vector_logic_3_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_3_0;
  component c_bd_util_vector_logic_4_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_4_0;
  component c_bd_util_vector_logic_5_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_5_1;
  component c_bd_util_vector_logic_6_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_6_0;
  component c_bd_wait_cu_both_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_wait_cu_both_0;
  component c_bd_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_xlconstant_1_0;
  signal CE1_1 : STD_LOGIC;
  signal CE_1 : STD_LOGIC;
  signal CLK_1 : STD_LOGIC;
  signal Op1_2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_data_fifo_0_m_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_0_m_axis_tvalid : STD_LOGIC;
  signal axis_data_fifo_0_s_axis_tready : STD_LOGIC;
  signal blk_mem_gen_0_doutb : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal busy_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal c_counter_binary_0_Q : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal c_counter_binary_1_Q : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal c_shift_ram_4_Q : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal c_shift_ram_5_Q : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal c_shift_ram_6_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal delay_1_rdy_vld_1_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal delay_1_rdy_vld_2_Q : STD_LOGIC_VECTOR ( 0 to 0 );
  signal din_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m_tvalid_busy_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_3_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_4_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_5_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_6_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal wait_cu_both_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal wait_cu_ctlr_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal wr_en_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_data_fifo_cu1_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_cu1_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_cu1_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  CE1_1 <= read_fifo_cu;
  CE_1 <= u_wait_cu;
  CLK_1 <= CLK;
  Op1_2(0) <= Op1(0);
  Q3(9 downto 0) <= c_counter_binary_1_Q(9 downto 0);
  busy_1(0) <= busy(0);
  din_1(31 downto 0) <= din(31 downto 0);
  dout(0) <= xlconstant_1_dout(0);
  doutb(31 downto 0) <= c_shift_ram_4_Q(31 downto 0);
  rst_1 <= rst;
  s_axis_tready(0) <= util_vector_logic_1_Res(0);
  tdata(31 downto 0) <= axis_data_fifo_0_m_axis_tdata(31 downto 0);
  wait_cu(0) <= util_vector_logic_4_Res(0);
  wait_cu_ctlr_1(0) <= wait_cu_ctlr(0);
  wr_en_1 <= wr_en;
axis_data_fifo_cu1: component c_bd_axis_data_fifo_cu1_0
    port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_cu1_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_cu1_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_cu1_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => axis_data_fifo_0_m_axis_tdata(31 downto 0),
      m_axis_tready => wait_cu_both_Res(0),
      m_axis_tvalid => axis_data_fifo_0_m_axis_tvalid,
      s_axis_aclk => CLK_1,
      s_axis_aresetn => util_vector_logic_0_Res(0),
      s_axis_tdata(31 downto 0) => din_1(31 downto 0),
      s_axis_tready => axis_data_fifo_0_s_axis_tready,
      s_axis_tvalid => wr_en_1
    );
blk_mem_gen_0: component c_bd_blk_mem_gen_0_0
    port map (
      addra(9 downto 0) => c_counter_binary_0_Q(9 downto 0),
      addrb(9 downto 0) => c_counter_binary_1_Q(9 downto 0),
      clka => CLK_1,
      clkb => CLK_1,
      dina(31 downto 0) => c_shift_ram_5_Q(31 downto 0),
      doutb(31 downto 0) => blk_mem_gen_0_doutb(31 downto 0),
      ena => busy_1(0),
      enb => util_vector_logic_6_Res(0),
      wea(0) => c_shift_ram_6_Q(0)
    );
c_shift_ram_4: component c_bd_c_shift_ram_4_0
    port map (
      CE => util_vector_logic_6_Res(0),
      CLK => CLK_1,
      D(31 downto 0) => blk_mem_gen_0_doutb(31 downto 0),
      Q(31 downto 0) => c_shift_ram_4_Q(31 downto 0)
    );
c_shift_ram_5: component c_bd_c_shift_ram_5_0
    port map (
      CE => wr_en_1,
      CLK => CLK_1,
      D(31 downto 0) => din_1(31 downto 0),
      Q(31 downto 0) => c_shift_ram_5_Q(31 downto 0)
    );
c_shift_ram_6: component c_bd_c_shift_ram_6_0
    port map (
      CE => wr_en_1,
      CLK => CLK_1,
      D(0) => wr_en_1,
      Q(0) => c_shift_ram_6_Q(0)
    );
counter_addra: component c_bd_counter_addra_0
    port map (
      CE => delay_1_rdy_vld_2_Q(0),
      CLK => CLK_1,
      Q(9 downto 0) => c_counter_binary_0_Q(9 downto 0)
    );
counter_addrb: component c_bd_counter_addrb_0
    port map (
      CE => util_vector_logic_6_Res(0),
      CLK => CLK_1,
      Q(9 downto 0) => c_counter_binary_1_Q(9 downto 0),
      SCLR => rst_1
    );
delay_1_rdy_vld_1: component c_bd_delay_1_rdy_vld_1_0
    port map (
      CLK => CLK_1,
      D(0) => wait_cu_both_Res(0),
      Q(0) => delay_1_rdy_vld_1_Q(0)
    );
delay_1_rdy_vld_2: component c_bd_delay_1_rdy_vld_2_0
    port map (
      CLK => CLK_1,
      D(0) => wr_en_1,
      Q(0) => delay_1_rdy_vld_2_Q(0)
    );
m_tvalid_busy: component c_bd_m_tvalid_busy_0
    port map (
      Op1(0) => axis_data_fifo_0_m_axis_tvalid,
      Op2(0) => busy_1(0),
      Res(0) => m_tvalid_busy_Res(0)
    );
util_vector_logic_0: component c_bd_util_vector_logic_0_1
    port map (
      Op1(0) => rst_1,
      Res(0) => util_vector_logic_0_Res(0)
    );
util_vector_logic_1: component c_bd_util_vector_logic_1_1
    port map (
      Op1(0) => axis_data_fifo_0_s_axis_tready,
      Op2(0) => busy_1(0),
      Res(0) => util_vector_logic_1_Res(0)
    );
util_vector_logic_2: component c_bd_util_vector_logic_2_1
    port map (
      Op1(0) => wait_cu_both_Res(0),
      Op2(0) => delay_1_rdy_vld_1_Q(0),
      Res(0) => util_vector_logic_2_Res(0)
    );
util_vector_logic_3: component c_bd_util_vector_logic_3_0
    port map (
      Op1(0) => Op1_2(0),
      Res(0) => util_vector_logic_3_Res(0)
    );
util_vector_logic_4: component c_bd_util_vector_logic_4_0
    port map (
      Op1(0) => util_vector_logic_2_Res(0),
      Op2(0) => util_vector_logic_3_Res(0),
      Res(0) => util_vector_logic_4_Res(0)
    );
util_vector_logic_5: component c_bd_util_vector_logic_5_1
    port map (
      Op1(0) => CE_1,
      Op2(0) => wait_cu_ctlr_1(0),
      Res(0) => util_vector_logic_5_Res(0)
    );
util_vector_logic_6: component c_bd_util_vector_logic_6_0
    port map (
      Op1(0) => CE1_1,
      Op2(0) => util_vector_logic_5_Res(0),
      Res(0) => util_vector_logic_6_Res(0)
    );
wait_cu_both: component c_bd_wait_cu_both_0
    port map (
      Op1(0) => wait_cu_ctlr_1(0),
      Op2(0) => m_tvalid_busy_Res(0),
      Res(0) => wait_cu_both_Res(0)
    );
xlconstant_1: component c_bd_xlconstant_1_0
    port map (
      dout(0) => xlconstant_1_dout(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity STAT_imp_1TWESUZ is
  port (
    CLK : in STD_LOGIC;
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SCLR : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end STAT_imp_1TWESUZ;

architecture STRUCTURE of STAT_imp_1TWESUZ is
  component c_bd_c_counter_binary_0_0 is
  port (
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component c_bd_c_counter_binary_0_0;
  component c_bd_util_vector_logic_0_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_0_2;
  component c_bd_util_vector_logic_1_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_1_2;
  component c_bd_util_vector_logic_2_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_util_vector_logic_2_2;
  component c_bd_xlconcat_0_0 is
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
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component c_bd_xlconcat_0_0;
  component c_bd_xlconcat_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component c_bd_xlconcat_1_0;
  component c_bd_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c_bd_xlconstant_0_0;
  signal CLK_1 : STD_LOGIC;
  signal In6_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In8_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op3_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SCLR_1 : STD_LOGIC;
  signal c_counter_binary_0_Q : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xpro_c_engine_0_BUS_REQUEST_CC : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xpro_c_engine_0_CODING_OVERFLOW : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xpro_c_engine_0_COMPRESSING : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xpro_c_engine_0_CRC_ERROR : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xpro_c_engine_0_C_DATA_VALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xpro_c_engine_0_FINISHED_C : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xpro_c_engine_0_FLUSHING_C : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  CLK_1 <= CLK;
  In6_1(0) <= In6(0);
  In8_1(0) <= In8(0);
  Op3_1(0) <= Op3(0);
  Q(15 downto 0) <= c_counter_binary_0_Q(15 downto 0);
  SCLR_1 <= SCLR;
  dout(31 downto 0) <= xlconcat_1_dout(31 downto 0);
  xpro_c_engine_0_BUS_REQUEST_CC(0) <= In7(0);
  xpro_c_engine_0_CODING_OVERFLOW(0) <= In4(0);
  xpro_c_engine_0_COMPRESSING(0) <= In1(0);
  xpro_c_engine_0_CRC_ERROR(0) <= In5(0);
  xpro_c_engine_0_C_DATA_VALID(0) <= Op2(0);
  xpro_c_engine_0_FINISHED_C(0) <= In0(0);
  xpro_c_engine_0_FLUSHING_C(0) <= In2(0);
c_counter_binary_0: component c_bd_c_counter_binary_0_0
    port map (
      CE => util_vector_logic_1_Res(0),
      CLK => CLK_1,
      Q(15 downto 0) => c_counter_binary_0_Q(15 downto 0),
      SCLR => SCLR_1
    );
util_vector_logic_0: component c_bd_util_vector_logic_0_2
    port map (
      Op1(0) => util_vector_logic_2_Res(0),
      Op2(0) => Op3_1(0),
      Res(0) => util_vector_logic_0_Res(0)
    );
util_vector_logic_1: component c_bd_util_vector_logic_1_2
    port map (
      Op1(0) => xpro_c_engine_0_C_DATA_VALID(0),
      Res(0) => util_vector_logic_1_Res(0)
    );
util_vector_logic_2: component c_bd_util_vector_logic_2_2
    port map (
      Op1(0) => In6_1(0),
      Res(0) => util_vector_logic_2_Res(0)
    );
xlconcat_0: component c_bd_xlconcat_0_0
    port map (
      In0(0) => xpro_c_engine_0_FINISHED_C(0),
      In1(0) => xpro_c_engine_0_COMPRESSING(0),
      In10(0) => xlconstant_0_dout(0),
      In11(0) => xlconstant_0_dout(0),
      In12(0) => xlconstant_0_dout(0),
      In13(0) => xlconstant_0_dout(0),
      In14(0) => xlconstant_0_dout(0),
      In15(0) => xlconstant_0_dout(0),
      In2(0) => xpro_c_engine_0_FLUSHING_C(0),
      In3(0) => xpro_c_engine_0_C_DATA_VALID(0),
      In4(0) => xpro_c_engine_0_CODING_OVERFLOW(0),
      In5(0) => xpro_c_engine_0_CRC_ERROR(0),
      In6(0) => In8_1(0),
      In7(0) => xpro_c_engine_0_BUS_REQUEST_CC(0),
      In8(0) => util_vector_logic_0_Res(0),
      In9(0) => xlconstant_0_dout(0),
      dout(15 downto 0) => xlconcat_0_dout(15 downto 0)
    );
xlconcat_1: component c_bd_xlconcat_1_0
    port map (
      In0(15 downto 0) => xlconcat_0_dout(15 downto 0),
      In1(15 downto 0) => c_counter_binary_0_Q(15 downto 0),
      dout(31 downto 0) => xlconcat_1_dout(31 downto 0)
    );
xlconstant_0: component c_bd_xlconstant_0_0
    port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c_bd is
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
end c_bd;

architecture STRUCTURE of c_bd is
  component c_bd_xpro_c_controller_0_0 is
  port (
    CLK : in STD_LOGIC;
    CLEAR : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BUS_REQ_CC : in STD_LOGIC;
    BUS_REQ_CU : in STD_LOGIC;
    BUS_ACK_CC : out STD_LOGIC;
    BUS_ACK_CU : out STD_LOGIC;
    INTR_ACK_C : out STD_LOGIC;
    INTR_REQ_CTLR : out STD_LOGIC;
    INTR_REQ_C : in STD_LOGIC;
    INTR_REQ_D : in STD_LOGIC;
    WAIT_CC : out STD_LOGIC;
    WAIT_CU : out STD_LOGIC;
    CS_RW : out STD_LOGIC;
    ADDR : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CTRL_IN : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RST_FIFO_CU : out STD_LOGIC;
    RST_FIFO_CC : out STD_LOGIC;
    RST_ENGINE : out STD_LOGIC;
    BUSY : out STD_LOGIC;
    READ_FIFO_CU : out STD_LOGIC;
    COUNTER_ADDRB : in STD_LOGIC_VECTOR ( 9 downto 0 );
    CRC_OUT_C : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CRC_OUT_D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_TVALID : in STD_LOGIC;
    U_DATA_OUT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    U_WAIT_CU : out STD_LOGIC;
    BRAM_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_TVALID : in STD_LOGIC;
    RESTART_DECOMPRESSOR : out STD_LOGIC;
    FLUSH_FIFO_CC : out STD_LOGIC;
    M_AXIS_TVALID_IN : in STD_LOGIC;
    M_AXIS_TVALID_OUT : out STD_LOGIC
  );
  end component c_bd_xpro_c_controller_0_0;
  component c_bd_xpro_c_engine_0_0 is
  port (
    CS : in STD_LOGIC;
    RW : in STD_LOGIC;
    ADDRESSC : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CONTROL_IN_C : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CONTROL_OUT_C : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    CLEAR : in STD_LOGIC;
    BUS_ACKNOWLEDGE_CC : in STD_LOGIC;
    BUS_ACKNOWLEDGE_CU : in STD_LOGIC;
    WAIT_CU : in STD_LOGIC;
    WAIT_CC : in STD_LOGIC;
    U_DATAIN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_DATAOUT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FINISHED_C : out STD_LOGIC;
    COMPRESSING : out STD_LOGIC;
    FLUSHING_C : out STD_LOGIC;
    C_DATA_VALID : out STD_LOGIC;
    CODING_OVERFLOW : out STD_LOGIC;
    CRC_ERROR : out STD_LOGIC;
    INTERRUPT_REQ_C : out STD_LOGIC;
    INTERRUPT_ACK_C : in STD_LOGIC;
    BUS_REQUEST_CC : out STD_LOGIC;
    BUS_REQUEST_CU : out STD_LOGIC;
    CRC_32_C : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component c_bd_xpro_c_engine_0_0;
  component c_bd_xpro_d_controller_0_0 is
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
  end component c_bd_xpro_d_controller_0_0;
  component c_bd_xpro_d_engine_0_0 is
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
  end component c_bd_xpro_d_engine_0_0;
  signal CLK_1 : STD_LOGIC;
  signal COMMAND_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_CC_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_CC_Res1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_CC_m_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_CC_m_axis_tdata1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_CC_m_axis_tvalid1 : STD_LOGIC;
  signal FIFO_CU_Q3 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal FIFO_CU_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_CU_doutb : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_CU_s_axis_tready : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FIFO_CU_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FIFO_CU_wait_cu : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M_AXIS_tready_1 : STD_LOGIC;
  signal Op4_2 : STD_LOGIC;
  signal RESETN_1 : STD_LOGIC;
  signal STAT_Q : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S_AXIS_tvalid_1 : STD_LOGIC;
  signal din_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axis_tdata_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_c_controller_0_ADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xpro_c_controller_0_BUSY : STD_LOGIC;
  signal xpro_c_controller_0_BUS_ACK_CC : STD_LOGIC;
  signal xpro_c_controller_0_BUS_ACK_CU : STD_LOGIC;
  signal xpro_c_controller_0_CS_RW : STD_LOGIC;
  signal xpro_c_controller_0_CTRL_IN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_c_controller_0_FLUSH_FIFO_CC : STD_LOGIC;
  signal xpro_c_controller_0_INTR_ACK_C : STD_LOGIC;
  signal xpro_c_controller_0_M_AXIS_TVALID_OUT : STD_LOGIC;
  signal xpro_c_controller_0_READ_FIFO_CU : STD_LOGIC;
  signal xpro_c_controller_0_RESTART_DECOMPRESSOR : STD_LOGIC;
  signal xpro_c_controller_0_RST_ENGINE : STD_LOGIC;
  signal xpro_c_controller_0_RST_FIFO_CC : STD_LOGIC;
  signal xpro_c_controller_0_RST_FIFO_CU : STD_LOGIC;
  signal xpro_c_controller_0_U_DATA_OUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_c_controller_0_U_WAIT_CU : STD_LOGIC;
  signal xpro_c_controller_0_WAIT_CC : STD_LOGIC;
  signal xpro_c_controller_0_WAIT_CU : STD_LOGIC;
  signal xpro_c_engine_0_BUS_REQUEST_CC : STD_LOGIC;
  signal xpro_c_engine_0_BUS_REQUEST_CU : STD_LOGIC;
  signal xpro_c_engine_0_CODING_OVERFLOW : STD_LOGIC;
  signal xpro_c_engine_0_COMPRESSING : STD_LOGIC;
  signal xpro_c_engine_0_CRC_32_C : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_c_engine_0_CRC_ERROR : STD_LOGIC;
  signal xpro_c_engine_0_C_DATA_VALID : STD_LOGIC;
  signal xpro_c_engine_0_FINISHED_C : STD_LOGIC;
  signal xpro_c_engine_0_FLUSHING_C : STD_LOGIC;
  signal xpro_d_controller_0_ADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xpro_d_controller_0_BUS_ACK_DC : STD_LOGIC;
  signal xpro_d_controller_0_BUS_ACK_DU : STD_LOGIC;
  signal xpro_d_controller_0_CS_RW : STD_LOGIC;
  signal xpro_d_controller_0_CTRL_IN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_d_controller_0_RST_ENGINE : STD_LOGIC;
  signal xpro_d_controller_0_WAIT_DU : STD_LOGIC;
  signal xpro_d_engine_0_BUS_REQUEST_DC : STD_LOGIC;
  signal xpro_d_engine_0_BUS_REQUEST_DU : STD_LOGIC;
  signal xpro_d_engine_0_CRC_OUT_D_32 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xpro_d_engine_0_INTERRUPT_REQ_D : STD_LOGIC;
  signal NLW_xpro_c_controller_0_INTR_REQ_CTLR_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_c_engine_0_CONTROL_OUT_C_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xpro_d_controller_0_COUNT_FINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_controller_0_INTR_ACK_D_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_controller_0_RST_FIFO_DC_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_controller_0_RST_FIFO_DU_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_controller_0_WAIT_DC_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_engine_0_CRC_ERROR_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_engine_0_DECODING_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_engine_0_DECOMPRESSING_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_engine_0_FINISHED_D_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_engine_0_FLUSHING_D_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_engine_0_U_DATA_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_xpro_d_engine_0_CONTROL_OUT_D_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xpro_d_engine_0_U_DATAOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  CLK_1 <= CLK;
  COMMAND_1(31 downto 0) <= COMMAND(31 downto 0);
  CRC_32_C(31 downto 0) <= xpro_c_engine_0_CRC_32_C(31 downto 0);
  INTERRUPT_REQ_C(0) <= xpro_c_controller_0_FLUSH_FIFO_CC;
  M_AXIS_tdata(31 downto 0) <= FIFO_CC_m_axis_tdata(31 downto 0);
  M_AXIS_tready_1 <= M_AXIS_tready;
  M_AXIS_tvalid <= xpro_c_controller_0_M_AXIS_TVALID_OUT;
  RESETN_1 <= RESETN;
  STATUS(31 downto 0) <= xlconcat_1_dout(31 downto 0);
  S_AXIS_tready(0) <= FIFO_CU_s_axis_tready(0);
  S_AXIS_tvalid_1 <= S_AXIS_tvalid;
  din_1(31 downto 0) <= S_AXIS_tdata(31 downto 0);
FIFO_CC: entity work.FIFO_CC_imp_4GVZH
    port map (
      L(15 downto 0) => STAT_Q(15 downto 0),
      Op1(0) => xpro_c_engine_0_C_DATA_VALID,
      Op2(0) => xpro_c_controller_0_WAIT_CC,
      Op3(0) => xpro_c_controller_0_RST_FIFO_CC,
      Op4(0) => Op4_2,
      Op5(0) => xpro_d_engine_0_BUS_REQUEST_DC,
      Op6(0) => xpro_d_controller_0_BUS_ACK_DC,
      Res(0) => FIFO_CC_Res(0),
      Res1(0) => FIFO_CC_Res1(0),
      flush_fifo(0) => xpro_c_controller_0_FLUSH_FIFO_CC,
      m_axis_tdata(31 downto 0) => FIFO_CC_m_axis_tdata1(31 downto 0),
      m_axis_tdatafifo(31 downto 0) => FIFO_CC_m_axis_tdata(31 downto 0),
      m_axis_treadyfifo => M_AXIS_tready_1,
      m_axis_tvalid1 => FIFO_CC_m_axis_tvalid1,
      s_axis_aclk => CLK_1,
      s_axis_tdata(31 downto 0) => s_axis_tdata_1(31 downto 0)
    );
FIFO_CU: entity work.FIFO_CU_imp_1UJJ8B3
    port map (
      CLK => CLK_1,
      Op1(0) => xpro_c_engine_0_BUS_REQUEST_CU,
      Q3(9 downto 0) => FIFO_CU_Q3(9 downto 0),
      busy(0) => xpro_c_controller_0_BUSY,
      din(31 downto 0) => din_1(31 downto 0),
      dout(0) => FIFO_CU_dout(0),
      doutb(31 downto 0) => FIFO_CU_doutb(31 downto 0),
      read_fifo_cu => xpro_c_controller_0_READ_FIFO_CU,
      rst => xpro_c_controller_0_RST_FIFO_CU,
      s_axis_tready(0) => FIFO_CU_s_axis_tready(0),
      tdata(31 downto 0) => FIFO_CU_tdata(31 downto 0),
      u_wait_cu => xpro_c_controller_0_U_WAIT_CU,
      wait_cu(0) => FIFO_CU_wait_cu(0),
      wait_cu_ctlr(0) => xpro_c_controller_0_WAIT_CU,
      wr_en => S_AXIS_tvalid_1
    );
STAT: entity work.STAT_imp_1TWESUZ
    port map (
      CLK => CLK_1,
      In0(0) => xpro_c_engine_0_FINISHED_C,
      In1(0) => xpro_c_engine_0_COMPRESSING,
      In2(0) => xpro_c_engine_0_FLUSHING_C,
      In4(0) => xpro_c_engine_0_CODING_OVERFLOW,
      In5(0) => xpro_c_engine_0_CRC_ERROR,
      In6(0) => xpro_c_controller_0_FLUSH_FIFO_CC,
      In7(0) => xpro_c_engine_0_BUS_REQUEST_CC,
      In8(0) => xpro_c_engine_0_BUS_REQUEST_CU,
      Op2(0) => xpro_c_engine_0_C_DATA_VALID,
      Op3(0) => xpro_c_controller_0_M_AXIS_TVALID_OUT,
      Q(15 downto 0) => STAT_Q(15 downto 0),
      SCLR => xpro_c_controller_0_RESTART_DECOMPRESSOR,
      dout(31 downto 0) => xlconcat_1_dout(31 downto 0)
    );
xpro_c_controller_0: component c_bd_xpro_c_controller_0_0
    port map (
      ADDR(3 downto 0) => xpro_c_controller_0_ADDR(3 downto 0),
      BRAM_TDATA(31 downto 0) => FIFO_CU_doutb(31 downto 0),
      BRAM_TVALID => FIFO_CU_dout(0),
      BUSY => xpro_c_controller_0_BUSY,
      BUS_ACK_CC => xpro_c_controller_0_BUS_ACK_CC,
      BUS_ACK_CU => xpro_c_controller_0_BUS_ACK_CU,
      BUS_REQ_CC => xpro_c_engine_0_BUS_REQUEST_CC,
      BUS_REQ_CU => xpro_c_engine_0_BUS_REQUEST_CU,
      CLEAR => RESETN_1,
      CLK => CLK_1,
      COMMAND(31 downto 0) => COMMAND_1(31 downto 0),
      COUNTER_ADDRB(9 downto 0) => FIFO_CU_Q3(9 downto 0),
      CRC_OUT_C(31 downto 0) => xpro_c_engine_0_CRC_32_C(31 downto 0),
      CRC_OUT_D(31 downto 0) => xpro_d_engine_0_CRC_OUT_D_32(31 downto 0),
      CS_RW => xpro_c_controller_0_CS_RW,
      CTRL_IN(31 downto 0) => xpro_c_controller_0_CTRL_IN(31 downto 0),
      FLUSH_FIFO_CC => xpro_c_controller_0_FLUSH_FIFO_CC,
      INTR_ACK_C => xpro_c_controller_0_INTR_ACK_C,
      INTR_REQ_C => Op4_2,
      INTR_REQ_CTLR => NLW_xpro_c_controller_0_INTR_REQ_CTLR_UNCONNECTED,
      INTR_REQ_D => xpro_d_engine_0_INTERRUPT_REQ_D,
      M_AXIS_TVALID_IN => FIFO_CC_m_axis_tvalid1,
      M_AXIS_TVALID_OUT => xpro_c_controller_0_M_AXIS_TVALID_OUT,
      M_TDATA(31 downto 0) => FIFO_CU_tdata(31 downto 0),
      M_TVALID => FIFO_CU_wait_cu(0),
      READ_FIFO_CU => xpro_c_controller_0_READ_FIFO_CU,
      RESTART_DECOMPRESSOR => xpro_c_controller_0_RESTART_DECOMPRESSOR,
      RST_ENGINE => xpro_c_controller_0_RST_ENGINE,
      RST_FIFO_CC => xpro_c_controller_0_RST_FIFO_CC,
      RST_FIFO_CU => xpro_c_controller_0_RST_FIFO_CU,
      U_DATA_OUT(31 downto 0) => xpro_c_controller_0_U_DATA_OUT(31 downto 0),
      U_WAIT_CU => xpro_c_controller_0_U_WAIT_CU,
      WAIT_CC => xpro_c_controller_0_WAIT_CC,
      WAIT_CU => xpro_c_controller_0_WAIT_CU
    );
xpro_c_engine_0: component c_bd_xpro_c_engine_0_0
    port map (
      ADDRESSC(3 downto 0) => xpro_c_controller_0_ADDR(3 downto 0),
      BUS_ACKNOWLEDGE_CC => xpro_c_controller_0_BUS_ACK_CC,
      BUS_ACKNOWLEDGE_CU => xpro_c_controller_0_BUS_ACK_CU,
      BUS_REQUEST_CC => xpro_c_engine_0_BUS_REQUEST_CC,
      BUS_REQUEST_CU => xpro_c_engine_0_BUS_REQUEST_CU,
      CLEAR => xpro_c_controller_0_RST_ENGINE,
      CLK => CLK_1,
      CODING_OVERFLOW => xpro_c_engine_0_CODING_OVERFLOW,
      COMPRESSING => xpro_c_engine_0_COMPRESSING,
      CONTROL_IN_C(31 downto 0) => xpro_c_controller_0_CTRL_IN(31 downto 0),
      CONTROL_OUT_C(31 downto 0) => NLW_xpro_c_engine_0_CONTROL_OUT_C_UNCONNECTED(31 downto 0),
      CRC_32_C(31 downto 0) => xpro_c_engine_0_CRC_32_C(31 downto 0),
      CRC_ERROR => xpro_c_engine_0_CRC_ERROR,
      CS => xpro_c_controller_0_CS_RW,
      C_DATAOUT(31 downto 0) => s_axis_tdata_1(31 downto 0),
      C_DATA_VALID => xpro_c_engine_0_C_DATA_VALID,
      FINISHED_C => xpro_c_engine_0_FINISHED_C,
      FLUSHING_C => xpro_c_engine_0_FLUSHING_C,
      INTERRUPT_ACK_C => xpro_c_controller_0_INTR_ACK_C,
      INTERRUPT_REQ_C => Op4_2,
      RW => xpro_c_controller_0_CS_RW,
      U_DATAIN(31 downto 0) => xpro_c_controller_0_U_DATA_OUT(31 downto 0),
      WAIT_CC => FIFO_CC_Res(0),
      WAIT_CU => xpro_c_controller_0_U_WAIT_CU
    );
xpro_d_controller_0: component c_bd_xpro_d_controller_0_0
    port map (
      ADDR(3 downto 0) => xpro_d_controller_0_ADDR(3 downto 0),
      BUS_ACK_DC => xpro_d_controller_0_BUS_ACK_DC,
      BUS_ACK_DU => xpro_d_controller_0_BUS_ACK_DU,
      BUS_REQ_DC => xpro_d_engine_0_BUS_REQUEST_DC,
      BUS_REQ_DU => xpro_d_engine_0_BUS_REQUEST_DU,
      CLEAR => RESETN_1,
      CLK => CLK_1,
      COMMAND(31 downto 0) => COMMAND_1(31 downto 0),
      COMPRESSED_SIZE(15 downto 0) => STAT_Q(15 downto 0),
      COUNT_FINISH => NLW_xpro_d_controller_0_COUNT_FINISH_UNCONNECTED,
      CS_RW => xpro_d_controller_0_CS_RW,
      CTRL_IN(31 downto 0) => xpro_d_controller_0_CTRL_IN(31 downto 0),
      FIFO_DC_EMPTY => RESETN_1,
      INTR_ACK_D => NLW_xpro_d_controller_0_INTR_ACK_D_UNCONNECTED,
      INTR_REQ_D => M_AXIS_tready_1,
      RESTART => xpro_c_controller_0_RESTART_DECOMPRESSOR,
      RST_ENGINE => xpro_d_controller_0_RST_ENGINE,
      RST_FIFO_DC => NLW_xpro_d_controller_0_RST_FIFO_DC_UNCONNECTED,
      RST_FIFO_DU => NLW_xpro_d_controller_0_RST_FIFO_DU_UNCONNECTED,
      WAIT_DC => NLW_xpro_d_controller_0_WAIT_DC_UNCONNECTED,
      WAIT_DU => xpro_d_controller_0_WAIT_DU
    );
xpro_d_engine_0: component c_bd_xpro_d_engine_0_0
    port map (
      ADDRESSD(3 downto 0) => xpro_d_controller_0_ADDR(3 downto 0),
      BUS_ACKNOWLEDGE_DC => xpro_d_controller_0_BUS_ACK_DC,
      BUS_ACKNOWLEDGE_DU => xpro_d_controller_0_BUS_ACK_DU,
      BUS_REQUEST_DC => xpro_d_engine_0_BUS_REQUEST_DC,
      BUS_REQUEST_DU => xpro_d_engine_0_BUS_REQUEST_DU,
      CLEAR => xpro_d_controller_0_RST_ENGINE,
      CLK => CLK_1,
      CONTROL_IND(31 downto 0) => xpro_d_controller_0_CTRL_IN(31 downto 0),
      CONTROL_OUT_D(31 downto 0) => NLW_xpro_d_engine_0_CONTROL_OUT_D_UNCONNECTED(31 downto 0),
      CRC_ERROR => NLW_xpro_d_engine_0_CRC_ERROR_UNCONNECTED,
      CRC_OUT_D_32(31 downto 0) => xpro_d_engine_0_CRC_OUT_D_32(31 downto 0),
      CS => xpro_d_controller_0_CS_RW,
      C_DATAIN(31 downto 0) => FIFO_CC_m_axis_tdata1(31 downto 0),
      DECODING_OVERFLOW => NLW_xpro_d_engine_0_DECODING_OVERFLOW_UNCONNECTED,
      DECOMPRESSING => NLW_xpro_d_engine_0_DECOMPRESSING_UNCONNECTED,
      FINISHED_D => NLW_xpro_d_engine_0_FINISHED_D_UNCONNECTED,
      FLUSHING_D => NLW_xpro_d_engine_0_FLUSHING_D_UNCONNECTED,
      INTERRUPT_ACK_D => xpro_c_controller_0_INTR_ACK_C,
      INTERRUPT_REQ_D => xpro_d_engine_0_INTERRUPT_REQ_D,
      RW => xpro_d_controller_0_CS_RW,
      U_DATAOUT(31 downto 0) => NLW_xpro_d_engine_0_U_DATAOUT_UNCONNECTED(31 downto 0),
      U_DATA_VALID => NLW_xpro_d_engine_0_U_DATA_VALID_UNCONNECTED,
      WAIT_DC => FIFO_CC_Res1(0),
      WAIT_DU => xpro_d_controller_0_WAIT_DU
    );
end STRUCTURE;
