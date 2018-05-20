--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
--Date        : Tue Oct 24 12:24:44 2017
--Host        : IT002223 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target mysystem2.bd
--Design      : mysystem2
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CompressorSystem_imp_1CSQC68 is
  port (
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_tlast : in STD_LOGIC;
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tvalid : in STD_LOGIC;
    S_AXI_LITE_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_LITE_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_LITE_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_LITE_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_LITE_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_LITE_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end CompressorSystem_imp_1CSQC68;

architecture STRUCTURE of CompressorSystem_imp_1CSQC68 is
  component mysystem2_output_stream_fifo_c_0 is
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
  end component mysystem2_output_stream_fifo_c_0;
  component mysystem2_output_switch_c_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component mysystem2_output_switch_c_0;
  component mysystem2_split_switch_c_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component mysystem2_split_switch_c_0;
  component mysystem2_xlconstant_0_c_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component mysystem2_xlconstant_0_c_0;
  component mysystem2_xmatchpro_compressor_engine_0_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m_axis_h_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tlast : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_c : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tvalid : out STD_LOGIC;
    m_axis_h_tready : in STD_LOGIC;
    m_axis_h_aclk : in STD_LOGIC;
    m_axis_h_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_compressor_engine_0_0;
  component mysystem2_xmatchpro_compressor_engine_1_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m_axis_h_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tlast : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_c : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tvalid : out STD_LOGIC;
    m_axis_h_tready : in STD_LOGIC;
    m_axis_h_aclk : in STD_LOGIC;
    m_axis_h_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_compressor_engine_1_0;
  component mysystem2_xmatchpro_compressor_engine_2_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m_axis_h_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tlast : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_c : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tvalid : out STD_LOGIC;
    m_axis_h_tready : in STD_LOGIC;
    m_axis_h_aclk : in STD_LOGIC;
    m_axis_h_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_compressor_engine_2_0;
  component mysystem2_xmatchpro_compressor_engine_3_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m_axis_h_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tlast : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_c : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_h_tvalid : out STD_LOGIC;
    m_axis_h_tready : in STD_LOGIC;
    m_axis_h_aclk : in STD_LOGIC;
    m_axis_h_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_compressor_engine_3_0;
  component mysystem2_axi_c_scheduler_0_0 is
  port (
    command : out STD_LOGIC_VECTOR ( 31 downto 0 );
    join_suppress : out STD_LOGIC_VECTOR ( 1 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    total_compressed_size : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_filesize : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_join_switch_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_join_switch_tlast : in STD_LOGIC;
    axis_join_switch_tvalid : in STD_LOGIC;
    axis_join_switch_tready : out STD_LOGIC;
    axis_join_switch_aclk : in STD_LOGIC;
    axis_join_switch_aresetn : in STD_LOGIC;
    input_stream_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    input_stream_tlast : in STD_LOGIC;
    input_stream_tvalid : in STD_LOGIC;
    input_stream_tready : out STD_LOGIC;
    input_stream_aclk : in STD_LOGIC;
    input_stream_aresetn : in STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    s_axi_lite_aresetn : in STD_LOGIC;
    header_in_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    header_in_tlast : in STD_LOGIC;
    header_in_tvalid : in STD_LOGIC;
    header_in_tready : out STD_LOGIC;
    header_in_aclk : in STD_LOGIC;
    header_in_aresetn : in STD_LOGIC;
    output_stream_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    output_stream_tlast : out STD_LOGIC;
    output_stream_tvalid : out STD_LOGIC;
    output_stream_tready : in STD_LOGIC;
    output_stream_aclk : in STD_LOGIC;
    output_stream_aresetn : in STD_LOGIC;
    header_out_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    header_out_tlast : out STD_LOGIC;
    header_out_tvalid : out STD_LOGIC;
    header_out_tready : in STD_LOGIC;
    header_out_aclk : in STD_LOGIC;
    header_out_aresetn : in STD_LOGIC;
    axis_split_switch_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_split_switch_tdest : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axis_split_switch_tlast : out STD_LOGIC;
    axis_split_switch_tvalid : out STD_LOGIC;
    axis_split_switch_tready : in STD_LOGIC;
    axis_split_switch_aclk : in STD_LOGIC;
    axis_split_switch_aresetn : in STD_LOGIC
  );
  end component mysystem2_axi_c_scheduler_0_0;
  component mysystem2_engine_join_switch_c_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component mysystem2_engine_join_switch_c_0;
  component mysystem2_header_fifo_c_0 is
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
  end component mysystem2_header_fifo_c_0;
  component mysystem2_header_join_switch_c_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component mysystem2_header_join_switch_c_0;
  component mysystem2_input_stream_c_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component mysystem2_input_stream_c_0;
  signal Conn1_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn1_ARREADY : STD_LOGIC;
  signal Conn1_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn1_AWREADY : STD_LOGIC;
  signal Conn1_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_BVALID : STD_LOGIC;
  signal Conn1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_RVALID : STD_LOGIC;
  signal Conn1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_WREADY : STD_LOGIC;
  signal Conn1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_TLAST : STD_LOGIC;
  signal Conn2_TREADY : STD_LOGIC;
  signal Conn2_TVALID : STD_LOGIC;
  signal Conn3_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn3_TLAST : STD_LOGIC;
  signal Conn3_TREADY : STD_LOGIC;
  signal Conn3_TVALID : STD_LOGIC;
  signal GND_1 : STD_LOGIC;
  signal axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TDEST : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TLAST : STD_LOGIC;
  signal axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TVALID : STD_LOGIC;
  signal axi_c_scheduler_0_HEADER_OUT_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_c_scheduler_0_HEADER_OUT_TLAST : STD_LOGIC;
  signal axi_c_scheduler_0_HEADER_OUT_TREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axi_c_scheduler_0_HEADER_OUT_TVALID : STD_LOGIC;
  signal axi_c_scheduler_0_OUTPUT_STREAM_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_c_scheduler_0_OUTPUT_STREAM_TLAST : STD_LOGIC;
  signal axi_c_scheduler_0_OUTPUT_STREAM_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_c_scheduler_0_OUTPUT_STREAM_TVALID : STD_LOGIC;
  signal axi_c_scheduler_0_command : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_c_scheduler_0_join_suppress : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal engine_join_switch_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal engine_join_switch_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal engine_join_switch_M00_AXIS_TREADY : STD_LOGIC;
  signal engine_join_switch_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal header_join_fifo_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal header_join_fifo_M_AXIS_TLAST : STD_LOGIC;
  signal header_join_fifo_M_AXIS_TREADY : STD_LOGIC;
  signal header_join_fifo_M_AXIS_TVALID : STD_LOGIC;
  signal header_join_switch_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal header_join_switch_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal header_join_switch_M00_AXIS_TREADY : STD_LOGIC;
  signal header_join_switch_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal input_stream_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal input_stream_M_AXIS_TLAST : STD_LOGIC;
  signal input_stream_M_AXIS_TREADY : STD_LOGIC;
  signal input_stream_M_AXIS_TVALID : STD_LOGIC;
  signal output_switch_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal output_switch_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal output_switch_M00_AXIS_TREADY : STD_LOGIC;
  signal output_switch_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axis_aclk_1 : STD_LOGIC;
  signal s_axis_aresetn_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal split_switch_M00_AXIS_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal split_switch_M00_AXIS_tready : STD_LOGIC;
  signal split_switch_M00_AXIS_tvalid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal split_switch_M01_AXIS_tdata : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal split_switch_M01_AXIS_tready : STD_LOGIC;
  signal split_switch_M01_AXIS_tvalid : STD_LOGIC_VECTOR ( 1 to 1 );
  signal split_switch_M02_AXIS_tdata : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal split_switch_M02_AXIS_tready : STD_LOGIC;
  signal split_switch_M02_AXIS_tvalid : STD_LOGIC_VECTOR ( 2 to 2 );
  signal split_switch_M03_AXIS_tdata : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal split_switch_M03_AXIS_tready : STD_LOGIC;
  signal split_switch_M03_AXIS_tvalid : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_0_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_0_m00_axis_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_0_m00_axis_tready : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xmatchpro_compressor_engine_0_m00_axis_tvalid : STD_LOGIC;
  signal xmatchpro_compressor_engine_0_m_axis_h_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_0_m_axis_h_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_0_m_axis_h_tready : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xmatchpro_compressor_engine_0_m_axis_h_tvalid : STD_LOGIC;
  signal xmatchpro_compressor_engine_1_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_1_m00_axis_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_1_m00_axis_tready : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xmatchpro_compressor_engine_1_m00_axis_tvalid : STD_LOGIC;
  signal xmatchpro_compressor_engine_1_m_axis_h_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_1_m_axis_h_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_1_m_axis_h_tready : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xmatchpro_compressor_engine_1_m_axis_h_tvalid : STD_LOGIC;
  signal xmatchpro_compressor_engine_2_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_2_m00_axis_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_2_m00_axis_tready : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xmatchpro_compressor_engine_2_m00_axis_tvalid : STD_LOGIC;
  signal xmatchpro_compressor_engine_2_m_axis_h_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_2_m_axis_h_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_2_m_axis_h_tready : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xmatchpro_compressor_engine_2_m_axis_h_tvalid : STD_LOGIC;
  signal xmatchpro_compressor_engine_3_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_3_m00_axis_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_3_m00_axis_tready : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xmatchpro_compressor_engine_3_m00_axis_tvalid : STD_LOGIC;
  signal xmatchpro_compressor_engine_3_m_axis_h_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_compressor_engine_3_m_axis_h_tlast : STD_LOGIC;
  signal xmatchpro_compressor_engine_3_m_axis_h_tready : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xmatchpro_compressor_engine_3_m_axis_h_tvalid : STD_LOGIC;
  signal NLW_axi_c_scheduler_0_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axi_c_scheduler_0_total_compressed_size_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_engine_join_switch_c_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_header_fifo_c_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_header_fifo_c_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_header_fifo_c_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_header_join_switch_c_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_input_stream_c_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_input_stream_c_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_input_stream_c_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_input_stream_c_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_output_stream_fifo_c_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_output_stream_fifo_c_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_output_stream_fifo_c_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_output_switch_c_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_split_switch_c_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_split_switch_c_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_split_switch_c_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xmatchpro_compressor_engine_0_crc_32_c_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_compressor_engine_0_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_compressor_engine_1_crc_32_c_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_compressor_engine_1_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_compressor_engine_2_crc_32_c_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_compressor_engine_2_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_compressor_engine_3_crc_32_c_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_compressor_engine_3_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  Conn1_ARADDR(3 downto 0) <= S_AXI_LITE_araddr(3 downto 0);
  Conn1_ARPROT(2 downto 0) <= S_AXI_LITE_arprot(2 downto 0);
  Conn1_ARVALID(0) <= S_AXI_LITE_arvalid(0);
  Conn1_AWADDR(3 downto 0) <= S_AXI_LITE_awaddr(3 downto 0);
  Conn1_AWPROT(2 downto 0) <= S_AXI_LITE_awprot(2 downto 0);
  Conn1_AWVALID(0) <= S_AXI_LITE_awvalid(0);
  Conn1_BREADY(0) <= S_AXI_LITE_bready(0);
  Conn1_RREADY(0) <= S_AXI_LITE_rready(0);
  Conn1_WDATA(31 downto 0) <= S_AXI_LITE_wdata(31 downto 0);
  Conn1_WSTRB(3 downto 0) <= S_AXI_LITE_wstrb(3 downto 0);
  Conn1_WVALID(0) <= S_AXI_LITE_wvalid(0);
  Conn2_TREADY <= M_AXIS_tready;
  Conn3_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  Conn3_TKEEP(3 downto 0) <= S_AXIS_tkeep(3 downto 0);
  Conn3_TLAST <= S_AXIS_tlast;
  Conn3_TVALID <= S_AXIS_tvalid;
  M_AXIS_tdata(31 downto 0) <= Conn2_TDATA(31 downto 0);
  M_AXIS_tlast <= Conn2_TLAST;
  M_AXIS_tvalid <= Conn2_TVALID;
  S_AXIS_tready <= Conn3_TREADY;
  S_AXI_LITE_arready(0) <= Conn1_ARREADY;
  S_AXI_LITE_awready(0) <= Conn1_AWREADY;
  S_AXI_LITE_bresp(1 downto 0) <= Conn1_BRESP(1 downto 0);
  S_AXI_LITE_bvalid(0) <= Conn1_BVALID;
  S_AXI_LITE_rdata(31 downto 0) <= Conn1_RDATA(31 downto 0);
  S_AXI_LITE_rresp(1 downto 0) <= Conn1_RRESP(1 downto 0);
  S_AXI_LITE_rvalid(0) <= Conn1_RVALID;
  S_AXI_LITE_wready(0) <= Conn1_WREADY;
  s_axis_aclk_1 <= aclk;
  s_axis_aresetn_1(0) <= aresetn(0);
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
axi_c_scheduler_0: component mysystem2_axi_c_scheduler_0_0
    port map (
      axis_join_switch_aclk => s_axis_aclk_1,
      axis_join_switch_aresetn => s_axis_aresetn_1(0),
      axis_join_switch_tdata(31 downto 0) => engine_join_switch_M00_AXIS_TDATA(31 downto 0),
      axis_join_switch_tlast => engine_join_switch_M00_AXIS_TLAST(0),
      axis_join_switch_tready => engine_join_switch_M00_AXIS_TREADY,
      axis_join_switch_tvalid => engine_join_switch_M00_AXIS_TVALID(0),
      axis_split_switch_aclk => s_axis_aclk_1,
      axis_split_switch_aresetn => s_axis_aresetn_1(0),
      axis_split_switch_tdata(31 downto 0) => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TDATA(31 downto 0),
      axis_split_switch_tdest(3 downto 0) => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TDEST(3 downto 0),
      axis_split_switch_tlast => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TLAST,
      axis_split_switch_tready => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TREADY(0),
      axis_split_switch_tvalid => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TVALID,
      command(31 downto 0) => axi_c_scheduler_0_command(31 downto 0),
      header_in_aclk => s_axis_aclk_1,
      header_in_aresetn => s_axis_aresetn_1(0),
      header_in_tdata(31 downto 0) => header_join_fifo_M_AXIS_TDATA(31 downto 0),
      header_in_tlast => header_join_fifo_M_AXIS_TLAST,
      header_in_tready => header_join_fifo_M_AXIS_TREADY,
      header_in_tvalid => header_join_fifo_M_AXIS_TVALID,
      header_out_aclk => s_axis_aclk_1,
      header_out_aresetn => s_axis_aresetn_1(0),
      header_out_tdata(31 downto 0) => axi_c_scheduler_0_HEADER_OUT_TDATA(31 downto 0),
      header_out_tlast => axi_c_scheduler_0_HEADER_OUT_TLAST,
      header_out_tready => axi_c_scheduler_0_HEADER_OUT_TREADY(1),
      header_out_tvalid => axi_c_scheduler_0_HEADER_OUT_TVALID,
      in_command(31 downto 0) => xlconstant_0_dout(31 downto 0),
      in_filesize(31 downto 0) => xlconstant_0_dout(31 downto 0),
      input_stream_aclk => s_axis_aclk_1,
      input_stream_aresetn => s_axis_aresetn_1(0),
      input_stream_tdata(31 downto 0) => input_stream_M_AXIS_TDATA(31 downto 0),
      input_stream_tlast => input_stream_M_AXIS_TLAST,
      input_stream_tready => input_stream_M_AXIS_TREADY,
      input_stream_tvalid => input_stream_M_AXIS_TVALID,
      join_suppress(1 downto 0) => axi_c_scheduler_0_join_suppress(1 downto 0),
      output_stream_aclk => s_axis_aclk_1,
      output_stream_aresetn => s_axis_aresetn_1(0),
      output_stream_tdata(31 downto 0) => axi_c_scheduler_0_OUTPUT_STREAM_TDATA(31 downto 0),
      output_stream_tlast => axi_c_scheduler_0_OUTPUT_STREAM_TLAST,
      output_stream_tready => axi_c_scheduler_0_OUTPUT_STREAM_TREADY(0),
      output_stream_tvalid => axi_c_scheduler_0_OUTPUT_STREAM_TVALID,
      s_axi_lite_aclk => s_axis_aclk_1,
      s_axi_lite_araddr(3 downto 0) => Conn1_ARADDR(3 downto 0),
      s_axi_lite_aresetn => s_axis_aresetn_1(0),
      s_axi_lite_arprot(2 downto 0) => Conn1_ARPROT(2 downto 0),
      s_axi_lite_arready => Conn1_ARREADY,
      s_axi_lite_arvalid => Conn1_ARVALID(0),
      s_axi_lite_awaddr(3 downto 0) => Conn1_AWADDR(3 downto 0),
      s_axi_lite_awprot(2 downto 0) => Conn1_AWPROT(2 downto 0),
      s_axi_lite_awready => Conn1_AWREADY,
      s_axi_lite_awvalid => Conn1_AWVALID(0),
      s_axi_lite_bready => Conn1_BREADY(0),
      s_axi_lite_bresp(1 downto 0) => Conn1_BRESP(1 downto 0),
      s_axi_lite_bvalid => Conn1_BVALID,
      s_axi_lite_rdata(31 downto 0) => Conn1_RDATA(31 downto 0),
      s_axi_lite_rready => Conn1_RREADY(0),
      s_axi_lite_rresp(1 downto 0) => Conn1_RRESP(1 downto 0),
      s_axi_lite_rvalid => Conn1_RVALID,
      s_axi_lite_wdata(31 downto 0) => Conn1_WDATA(31 downto 0),
      s_axi_lite_wready => Conn1_WREADY,
      s_axi_lite_wstrb(3 downto 0) => Conn1_WSTRB(3 downto 0),
      s_axi_lite_wvalid => Conn1_WVALID(0),
      status(31 downto 0) => NLW_axi_c_scheduler_0_status_UNCONNECTED(31 downto 0),
      total_compressed_size(31 downto 0) => NLW_axi_c_scheduler_0_total_compressed_size_UNCONNECTED(31 downto 0)
    );
engine_join_switch_c: component mysystem2_engine_join_switch_c_0
    port map (
      aclk => s_axis_aclk_1,
      aresetn => s_axis_aresetn_1(0),
      m_axis_tdata(31 downto 0) => engine_join_switch_M00_AXIS_TDATA(31 downto 0),
      m_axis_tlast(0) => engine_join_switch_M00_AXIS_TLAST(0),
      m_axis_tready(0) => engine_join_switch_M00_AXIS_TREADY,
      m_axis_tvalid(0) => engine_join_switch_M00_AXIS_TVALID(0),
      s_axis_tdata(127 downto 96) => xmatchpro_compressor_engine_3_m00_axis_tdata(31 downto 0),
      s_axis_tdata(95 downto 64) => xmatchpro_compressor_engine_2_m00_axis_tdata(31 downto 0),
      s_axis_tdata(63 downto 32) => xmatchpro_compressor_engine_1_m00_axis_tdata(31 downto 0),
      s_axis_tdata(31 downto 0) => xmatchpro_compressor_engine_0_m00_axis_tdata(31 downto 0),
      s_axis_tlast(3) => xmatchpro_compressor_engine_3_m00_axis_tlast,
      s_axis_tlast(2) => xmatchpro_compressor_engine_2_m00_axis_tlast,
      s_axis_tlast(1) => xmatchpro_compressor_engine_1_m00_axis_tlast,
      s_axis_tlast(0) => xmatchpro_compressor_engine_0_m00_axis_tlast,
      s_axis_tready(3) => xmatchpro_compressor_engine_3_m00_axis_tready(3),
      s_axis_tready(2) => xmatchpro_compressor_engine_2_m00_axis_tready(2),
      s_axis_tready(1) => xmatchpro_compressor_engine_1_m00_axis_tready(1),
      s_axis_tready(0) => xmatchpro_compressor_engine_0_m00_axis_tready(0),
      s_axis_tvalid(3) => xmatchpro_compressor_engine_3_m00_axis_tvalid,
      s_axis_tvalid(2) => xmatchpro_compressor_engine_2_m00_axis_tvalid,
      s_axis_tvalid(1) => xmatchpro_compressor_engine_1_m00_axis_tvalid,
      s_axis_tvalid(0) => xmatchpro_compressor_engine_0_m00_axis_tvalid,
      s_decode_err(3 downto 0) => NLW_engine_join_switch_c_s_decode_err_UNCONNECTED(3 downto 0),
      s_req_suppress(3) => GND_1,
      s_req_suppress(2) => GND_1,
      s_req_suppress(1) => GND_1,
      s_req_suppress(0) => GND_1
    );
header_fifo_c: component mysystem2_header_fifo_c_0
    port map (
      axis_data_count(31 downto 0) => NLW_header_fifo_c_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_header_fifo_c_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_header_fifo_c_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_aclk => s_axis_aclk_1,
      m_axis_aresetn => s_axis_aresetn_1(0),
      m_axis_tdata(31 downto 0) => header_join_fifo_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => header_join_fifo_M_AXIS_TLAST,
      m_axis_tready => header_join_fifo_M_AXIS_TREADY,
      m_axis_tvalid => header_join_fifo_M_AXIS_TVALID,
      s_axis_aclk => s_axis_aclk_1,
      s_axis_aresetn => s_axis_aresetn_1(0),
      s_axis_tdata(31 downto 0) => header_join_switch_M00_AXIS_TDATA(31 downto 0),
      s_axis_tlast => header_join_switch_M00_AXIS_TLAST(0),
      s_axis_tready => header_join_switch_M00_AXIS_TREADY,
      s_axis_tvalid => header_join_switch_M00_AXIS_TVALID(0)
    );
header_join_switch_c: component mysystem2_header_join_switch_c_0
    port map (
      aclk => s_axis_aclk_1,
      aresetn => s_axis_aresetn_1(0),
      m_axis_tdata(31 downto 0) => header_join_switch_M00_AXIS_TDATA(31 downto 0),
      m_axis_tlast(0) => header_join_switch_M00_AXIS_TLAST(0),
      m_axis_tready(0) => header_join_switch_M00_AXIS_TREADY,
      m_axis_tvalid(0) => header_join_switch_M00_AXIS_TVALID(0),
      s_axis_tdata(127 downto 96) => xmatchpro_compressor_engine_3_m_axis_h_tdata(31 downto 0),
      s_axis_tdata(95 downto 64) => xmatchpro_compressor_engine_2_m_axis_h_tdata(31 downto 0),
      s_axis_tdata(63 downto 32) => xmatchpro_compressor_engine_1_m_axis_h_tdata(31 downto 0),
      s_axis_tdata(31 downto 0) => xmatchpro_compressor_engine_0_m_axis_h_tdata(31 downto 0),
      s_axis_tlast(3) => xmatchpro_compressor_engine_3_m_axis_h_tlast,
      s_axis_tlast(2) => xmatchpro_compressor_engine_2_m_axis_h_tlast,
      s_axis_tlast(1) => xmatchpro_compressor_engine_1_m_axis_h_tlast,
      s_axis_tlast(0) => xmatchpro_compressor_engine_0_m_axis_h_tlast,
      s_axis_tready(3) => xmatchpro_compressor_engine_3_m_axis_h_tready(3),
      s_axis_tready(2) => xmatchpro_compressor_engine_2_m_axis_h_tready(2),
      s_axis_tready(1) => xmatchpro_compressor_engine_1_m_axis_h_tready(1),
      s_axis_tready(0) => xmatchpro_compressor_engine_0_m_axis_h_tready(0),
      s_axis_tvalid(3) => xmatchpro_compressor_engine_3_m_axis_h_tvalid,
      s_axis_tvalid(2) => xmatchpro_compressor_engine_2_m_axis_h_tvalid,
      s_axis_tvalid(1) => xmatchpro_compressor_engine_1_m_axis_h_tvalid,
      s_axis_tvalid(0) => xmatchpro_compressor_engine_0_m_axis_h_tvalid,
      s_decode_err(3 downto 0) => NLW_header_join_switch_c_s_decode_err_UNCONNECTED(3 downto 0),
      s_req_suppress(3) => GND_1,
      s_req_suppress(2) => GND_1,
      s_req_suppress(1) => GND_1,
      s_req_suppress(0) => GND_1
    );
input_stream_c: component mysystem2_input_stream_c_0
    port map (
      axis_data_count(31 downto 0) => NLW_input_stream_c_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_input_stream_c_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_input_stream_c_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => input_stream_M_AXIS_TDATA(31 downto 0),
      m_axis_tkeep(3 downto 0) => NLW_input_stream_c_m_axis_tkeep_UNCONNECTED(3 downto 0),
      m_axis_tlast => input_stream_M_AXIS_TLAST,
      m_axis_tready => input_stream_M_AXIS_TREADY,
      m_axis_tvalid => input_stream_M_AXIS_TVALID,
      s_axis_aclk => s_axis_aclk_1,
      s_axis_aresetn => s_axis_aresetn_1(0),
      s_axis_tdata(31 downto 0) => Conn3_TDATA(31 downto 0),
      s_axis_tkeep(3 downto 0) => Conn3_TKEEP(3 downto 0),
      s_axis_tlast => Conn3_TLAST,
      s_axis_tready => Conn3_TREADY,
      s_axis_tvalid => Conn3_TVALID
    );
output_stream_fifo_c: component mysystem2_output_stream_fifo_c_0
    port map (
      axis_data_count(31 downto 0) => NLW_output_stream_fifo_c_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_output_stream_fifo_c_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_output_stream_fifo_c_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_aclk => s_axis_aclk_1,
      m_axis_aresetn => s_axis_aresetn_1(0),
      m_axis_tdata(31 downto 0) => Conn2_TDATA(31 downto 0),
      m_axis_tlast => Conn2_TLAST,
      m_axis_tready => Conn2_TREADY,
      m_axis_tvalid => Conn2_TVALID,
      s_axis_aclk => s_axis_aclk_1,
      s_axis_aresetn => s_axis_aresetn_1(0),
      s_axis_tdata(31 downto 0) => output_switch_M00_AXIS_TDATA(31 downto 0),
      s_axis_tlast => output_switch_M00_AXIS_TLAST(0),
      s_axis_tready => output_switch_M00_AXIS_TREADY,
      s_axis_tvalid => output_switch_M00_AXIS_TVALID(0)
    );
output_switch_c: component mysystem2_output_switch_c_0
    port map (
      aclk => s_axis_aclk_1,
      aresetn => s_axis_aresetn_1(0),
      m_axis_tdata(31 downto 0) => output_switch_M00_AXIS_TDATA(31 downto 0),
      m_axis_tlast(0) => output_switch_M00_AXIS_TLAST(0),
      m_axis_tready(0) => output_switch_M00_AXIS_TREADY,
      m_axis_tvalid(0) => output_switch_M00_AXIS_TVALID(0),
      s_axis_tdata(63 downto 32) => axi_c_scheduler_0_HEADER_OUT_TDATA(31 downto 0),
      s_axis_tdata(31 downto 0) => axi_c_scheduler_0_OUTPUT_STREAM_TDATA(31 downto 0),
      s_axis_tlast(1) => axi_c_scheduler_0_HEADER_OUT_TLAST,
      s_axis_tlast(0) => axi_c_scheduler_0_OUTPUT_STREAM_TLAST,
      s_axis_tready(1) => axi_c_scheduler_0_HEADER_OUT_TREADY(1),
      s_axis_tready(0) => axi_c_scheduler_0_OUTPUT_STREAM_TREADY(0),
      s_axis_tvalid(1) => axi_c_scheduler_0_HEADER_OUT_TVALID,
      s_axis_tvalid(0) => axi_c_scheduler_0_OUTPUT_STREAM_TVALID,
      s_decode_err(1 downto 0) => NLW_output_switch_c_s_decode_err_UNCONNECTED(1 downto 0),
      s_req_suppress(1 downto 0) => axi_c_scheduler_0_join_suppress(1 downto 0)
    );
split_switch_c: component mysystem2_split_switch_c_0
    port map (
      aclk => s_axis_aclk_1,
      aresetn => s_axis_aresetn_1(0),
      m_axis_tdata(127 downto 96) => split_switch_M03_AXIS_tdata(127 downto 96),
      m_axis_tdata(95 downto 64) => split_switch_M02_AXIS_tdata(95 downto 64),
      m_axis_tdata(63 downto 32) => split_switch_M01_AXIS_tdata(63 downto 32),
      m_axis_tdata(31 downto 0) => split_switch_M00_AXIS_tdata(31 downto 0),
      m_axis_tdest(15 downto 0) => NLW_split_switch_c_m_axis_tdest_UNCONNECTED(15 downto 0),
      m_axis_tlast(3 downto 0) => NLW_split_switch_c_m_axis_tlast_UNCONNECTED(3 downto 0),
      m_axis_tready(3) => split_switch_M03_AXIS_tready,
      m_axis_tready(2) => split_switch_M02_AXIS_tready,
      m_axis_tready(1) => split_switch_M01_AXIS_tready,
      m_axis_tready(0) => split_switch_M00_AXIS_tready,
      m_axis_tvalid(3) => split_switch_M03_AXIS_tvalid(3),
      m_axis_tvalid(2) => split_switch_M02_AXIS_tvalid(2),
      m_axis_tvalid(1) => split_switch_M01_AXIS_tvalid(1),
      m_axis_tvalid(0) => split_switch_M00_AXIS_tvalid(0),
      s_axis_tdata(31 downto 0) => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TDATA(31 downto 0),
      s_axis_tdest(3 downto 0) => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TDEST(3 downto 0),
      s_axis_tlast(0) => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TLAST,
      s_axis_tready(0) => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TREADY(0),
      s_axis_tvalid(0) => axi_c_scheduler_0_AXIS_SPLIT_SWITCH_TVALID,
      s_decode_err(0) => NLW_split_switch_c_s_decode_err_UNCONNECTED(0)
    );
xlconstant_0_c: component mysystem2_xlconstant_0_c_0
    port map (
      dout(31 downto 0) => xlconstant_0_dout(31 downto 0)
    );
xmatchpro_compressor_engine_0: component mysystem2_xmatchpro_compressor_engine_0_0
    port map (
      command(31 downto 0) => axi_c_scheduler_0_command(31 downto 0),
      crc_32_c(31 downto 0) => NLW_xmatchpro_compressor_engine_0_crc_32_c_UNCONNECTED(31 downto 0),
      m00_axis_aclk => s_axis_aclk_1,
      m00_axis_aresetn => s_axis_aresetn_1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_compressor_engine_0_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_compressor_engine_0_m00_axis_tlast,
      m00_axis_tready => xmatchpro_compressor_engine_0_m00_axis_tready(0),
      m00_axis_tvalid => xmatchpro_compressor_engine_0_m00_axis_tvalid,
      m_axis_h_aclk => s_axis_aclk_1,
      m_axis_h_aresetn => s_axis_aresetn_1(0),
      m_axis_h_tdata(31 downto 0) => xmatchpro_compressor_engine_0_m_axis_h_tdata(31 downto 0),
      m_axis_h_tlast => xmatchpro_compressor_engine_0_m_axis_h_tlast,
      m_axis_h_tready => xmatchpro_compressor_engine_0_m_axis_h_tready(0),
      m_axis_h_tvalid => xmatchpro_compressor_engine_0_m_axis_h_tvalid,
      s00_axis_aclk => s_axis_aclk_1,
      s00_axis_aresetn => s_axis_aresetn_1(0),
      s00_axis_tdata(31 downto 0) => split_switch_M00_AXIS_tdata(31 downto 0),
      s00_axis_tready => split_switch_M00_AXIS_tready,
      s00_axis_tvalid => split_switch_M00_AXIS_tvalid(0),
      status(31 downto 0) => NLW_xmatchpro_compressor_engine_0_status_UNCONNECTED(31 downto 0),
      xpro_aclk => s_axis_aclk_1,
      xpro_aresetn => s_axis_aresetn_1(0)
    );
xmatchpro_compressor_engine_1: component mysystem2_xmatchpro_compressor_engine_1_0
    port map (
      command(31 downto 0) => axi_c_scheduler_0_command(31 downto 0),
      crc_32_c(31 downto 0) => NLW_xmatchpro_compressor_engine_1_crc_32_c_UNCONNECTED(31 downto 0),
      m00_axis_aclk => s_axis_aclk_1,
      m00_axis_aresetn => s_axis_aresetn_1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_compressor_engine_1_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_compressor_engine_1_m00_axis_tlast,
      m00_axis_tready => xmatchpro_compressor_engine_1_m00_axis_tready(1),
      m00_axis_tvalid => xmatchpro_compressor_engine_1_m00_axis_tvalid,
      m_axis_h_aclk => s_axis_aclk_1,
      m_axis_h_aresetn => s_axis_aresetn_1(0),
      m_axis_h_tdata(31 downto 0) => xmatchpro_compressor_engine_1_m_axis_h_tdata(31 downto 0),
      m_axis_h_tlast => xmatchpro_compressor_engine_1_m_axis_h_tlast,
      m_axis_h_tready => xmatchpro_compressor_engine_1_m_axis_h_tready(1),
      m_axis_h_tvalid => xmatchpro_compressor_engine_1_m_axis_h_tvalid,
      s00_axis_aclk => s_axis_aclk_1,
      s00_axis_aresetn => s_axis_aresetn_1(0),
      s00_axis_tdata(31 downto 0) => split_switch_M01_AXIS_tdata(63 downto 32),
      s00_axis_tready => split_switch_M01_AXIS_tready,
      s00_axis_tvalid => split_switch_M01_AXIS_tvalid(1),
      status(31 downto 0) => NLW_xmatchpro_compressor_engine_1_status_UNCONNECTED(31 downto 0),
      xpro_aclk => s_axis_aclk_1,
      xpro_aresetn => s_axis_aresetn_1(0)
    );
xmatchpro_compressor_engine_2: component mysystem2_xmatchpro_compressor_engine_2_0
    port map (
      command(31 downto 0) => axi_c_scheduler_0_command(31 downto 0),
      crc_32_c(31 downto 0) => NLW_xmatchpro_compressor_engine_2_crc_32_c_UNCONNECTED(31 downto 0),
      m00_axis_aclk => s_axis_aclk_1,
      m00_axis_aresetn => s_axis_aresetn_1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_compressor_engine_2_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_compressor_engine_2_m00_axis_tlast,
      m00_axis_tready => xmatchpro_compressor_engine_2_m00_axis_tready(2),
      m00_axis_tvalid => xmatchpro_compressor_engine_2_m00_axis_tvalid,
      m_axis_h_aclk => s_axis_aclk_1,
      m_axis_h_aresetn => s_axis_aresetn_1(0),
      m_axis_h_tdata(31 downto 0) => xmatchpro_compressor_engine_2_m_axis_h_tdata(31 downto 0),
      m_axis_h_tlast => xmatchpro_compressor_engine_2_m_axis_h_tlast,
      m_axis_h_tready => xmatchpro_compressor_engine_2_m_axis_h_tready(2),
      m_axis_h_tvalid => xmatchpro_compressor_engine_2_m_axis_h_tvalid,
      s00_axis_aclk => s_axis_aclk_1,
      s00_axis_aresetn => s_axis_aresetn_1(0),
      s00_axis_tdata(31 downto 0) => split_switch_M02_AXIS_tdata(95 downto 64),
      s00_axis_tready => split_switch_M02_AXIS_tready,
      s00_axis_tvalid => split_switch_M02_AXIS_tvalid(2),
      status(31 downto 0) => NLW_xmatchpro_compressor_engine_2_status_UNCONNECTED(31 downto 0),
      xpro_aclk => s_axis_aclk_1,
      xpro_aresetn => s_axis_aresetn_1(0)
    );
xmatchpro_compressor_engine_3: component mysystem2_xmatchpro_compressor_engine_3_0
    port map (
      command(31 downto 0) => axi_c_scheduler_0_command(31 downto 0),
      crc_32_c(31 downto 0) => NLW_xmatchpro_compressor_engine_3_crc_32_c_UNCONNECTED(31 downto 0),
      m00_axis_aclk => s_axis_aclk_1,
      m00_axis_aresetn => s_axis_aresetn_1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_compressor_engine_3_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_compressor_engine_3_m00_axis_tlast,
      m00_axis_tready => xmatchpro_compressor_engine_3_m00_axis_tready(3),
      m00_axis_tvalid => xmatchpro_compressor_engine_3_m00_axis_tvalid,
      m_axis_h_aclk => s_axis_aclk_1,
      m_axis_h_aresetn => s_axis_aresetn_1(0),
      m_axis_h_tdata(31 downto 0) => xmatchpro_compressor_engine_3_m_axis_h_tdata(31 downto 0),
      m_axis_h_tlast => xmatchpro_compressor_engine_3_m_axis_h_tlast,
      m_axis_h_tready => xmatchpro_compressor_engine_3_m_axis_h_tready(3),
      m_axis_h_tvalid => xmatchpro_compressor_engine_3_m_axis_h_tvalid,
      s00_axis_aclk => s_axis_aclk_1,
      s00_axis_aresetn => s_axis_aresetn_1(0),
      s00_axis_tdata(31 downto 0) => split_switch_M03_AXIS_tdata(127 downto 96),
      s00_axis_tready => split_switch_M03_AXIS_tready,
      s00_axis_tvalid => split_switch_M03_AXIS_tvalid(3),
      status(31 downto 0) => NLW_xmatchpro_compressor_engine_3_status_UNCONNECTED(31 downto 0),
      xpro_aclk => s_axis_aclk_1,
      xpro_aresetn => s_axis_aresetn_1(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DecompressorSystem_imp_K1210C is
  port (
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tvalid : in STD_LOGIC;
    S_AXI_LITE_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_LITE_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_LITE_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_LITE_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_LITE_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_LITE_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_LITE_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end DecompressorSystem_imp_K1210C;

architecture STRUCTURE of DecompressorSystem_imp_K1210C is
  component mysystem2_output_stream_d_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component mysystem2_output_stream_d_0;
  component mysystem2_split_switch_d_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 20 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 83 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component mysystem2_split_switch_d_0;
  component mysystem2_xlconstant_0_d_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component mysystem2_xlconstant_0_d_0;
  component mysystem2_xlconstant_1_d_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component mysystem2_xlconstant_1_d_0;
  component mysystem2_xmatchpro_decompressor_engine_0_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tuser : in STD_LOGIC_VECTOR ( 20 downto 0 );
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    engine_ready : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_decompressor_engine_0_0;
  component mysystem2_xmatchpro_decompressor_engine_1_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tuser : in STD_LOGIC_VECTOR ( 20 downto 0 );
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    engine_ready : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_decompressor_engine_1_0;
  component mysystem2_xmatchpro_decompressor_engine_2_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tuser : in STD_LOGIC_VECTOR ( 20 downto 0 );
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    engine_ready : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_decompressor_engine_2_0;
  component mysystem2_xmatchpro_decompressor_engine_3_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tuser : in STD_LOGIC_VECTOR ( 20 downto 0 );
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    command : in STD_LOGIC_VECTOR ( 31 downto 0 );
    crc_32_d : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    engine_ready : out STD_LOGIC;
    xpro_aclk : in STD_LOGIC;
    xpro_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  end component mysystem2_xmatchpro_decompressor_engine_3_0;
  component mysystem2_axi_d_scheduler_0_0 is
  port (
    command : out STD_LOGIC_VECTOR ( 31 downto 0 );
    join_suppress : out STD_LOGIC_VECTOR ( 3 downto 0 );
    status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    command_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    engine_ready_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    axis_split_switch_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_split_switch_tlast : out STD_LOGIC;
    axis_split_switch_tvalid : out STD_LOGIC;
    axis_split_switch_tready : in STD_LOGIC;
    axis_split_switch_tuser : out STD_LOGIC_VECTOR ( 20 downto 0 );
    axis_split_switch_tdest : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axis_split_switch_aclk : in STD_LOGIC;
    axis_split_switch_aresetn : in STD_LOGIC;
    input_stream_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    input_stream_tvalid : in STD_LOGIC;
    input_stream_tready : out STD_LOGIC;
    input_stream_aclk : in STD_LOGIC;
    input_stream_aresetn : in STD_LOGIC;
    axis_join_switch_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_join_switch_tlast : in STD_LOGIC;
    axis_join_switch_tvalid : in STD_LOGIC;
    axis_join_switch_tready : out STD_LOGIC;
    axis_join_switch_aclk : in STD_LOGIC;
    axis_join_switch_aresetn : in STD_LOGIC;
    header_in_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    header_in_tlast : in STD_LOGIC;
    header_in_tvalid : in STD_LOGIC;
    header_in_tready : out STD_LOGIC;
    header_in_aclk : in STD_LOGIC;
    header_in_aresetn : in STD_LOGIC;
    header_out_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    header_out_tlast : out STD_LOGIC;
    header_out_tvalid : out STD_LOGIC;
    header_out_tready : in STD_LOGIC;
    header_out_aclk : in STD_LOGIC;
    header_out_aresetn : in STD_LOGIC;
    output_stream_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    output_stream_tlast : out STD_LOGIC;
    output_stream_tvalid : out STD_LOGIC;
    output_stream_tready : in STD_LOGIC;
    output_stream_aclk : in STD_LOGIC;
    output_stream_aresetn : in STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    s_axi_lite_aresetn : in STD_LOGIC
  );
  end component mysystem2_axi_d_scheduler_0_0;
  component mysystem2_engine_join_switch_d_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component mysystem2_engine_join_switch_d_0;
  component mysystem2_header_fifo_d_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component mysystem2_header_fifo_d_0;
  signal axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TDEST : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TLAST : STD_LOGIC;
  signal axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TUSER : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TVALID : STD_LOGIC;
  signal axi_d_scheduler_0_HEADER_OUT_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_d_scheduler_0_HEADER_OUT_TLAST : STD_LOGIC;
  signal axi_d_scheduler_0_HEADER_OUT_TREADY : STD_LOGIC;
  signal axi_d_scheduler_0_HEADER_OUT_TVALID : STD_LOGIC;
  signal axi_d_scheduler_0_OUTPUT_STREAM_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_d_scheduler_0_OUTPUT_STREAM_TLAST : STD_LOGIC;
  signal axi_d_scheduler_0_OUTPUT_STREAM_TREADY : STD_LOGIC;
  signal axi_d_scheduler_0_OUTPUT_STREAM_TVALID : STD_LOGIC;
  signal axi_d_scheduler_0_command : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_d_scheduler_0_join_suppress : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXIS_MM2S_TREADY : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXIS_MM2S_TVALID : STD_LOGIC;
  signal axis_data_fifo_c1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_c1_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_c1_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_c1_M_AXIS_TVALID : STD_LOGIC;
  signal engine_join_switch_d_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal engine_join_switch_d_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal engine_join_switch_d_M00_AXIS_TREADY : STD_LOGIC;
  signal engine_join_switch_d_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal header_fifo_d_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal header_fifo_d_M_AXIS_TLAST : STD_LOGIC;
  signal header_fifo_d_M_AXIS_TREADY : STD_LOGIC;
  signal header_fifo_d_M_AXIS_TVALID : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK1 : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_processing_system7_0_100M_peripheral_aresetn1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal split_switch_d_M00_AXIS_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal split_switch_d_M00_AXIS_tdest : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal split_switch_d_M00_AXIS_tlast : STD_LOGIC_VECTOR ( 0 to 0 );
  signal split_switch_d_M00_AXIS_tready : STD_LOGIC;
  signal split_switch_d_M00_AXIS_tuser : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal split_switch_d_M00_AXIS_tvalid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal split_switch_d_M01_AXIS_tdata : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal split_switch_d_M01_AXIS_tdest : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal split_switch_d_M01_AXIS_tlast : STD_LOGIC_VECTOR ( 1 to 1 );
  signal split_switch_d_M01_AXIS_tready : STD_LOGIC;
  signal split_switch_d_M01_AXIS_tuser : STD_LOGIC_VECTOR ( 41 downto 21 );
  signal split_switch_d_M01_AXIS_tvalid : STD_LOGIC_VECTOR ( 1 to 1 );
  signal split_switch_d_M02_AXIS_tdata : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal split_switch_d_M02_AXIS_tdest : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal split_switch_d_M02_AXIS_tlast : STD_LOGIC_VECTOR ( 2 to 2 );
  signal split_switch_d_M02_AXIS_tready : STD_LOGIC;
  signal split_switch_d_M02_AXIS_tuser : STD_LOGIC_VECTOR ( 62 downto 42 );
  signal split_switch_d_M02_AXIS_tvalid : STD_LOGIC_VECTOR ( 2 to 2 );
  signal split_switch_d_M03_AXIS_tdata : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal split_switch_d_M03_AXIS_tdest : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal split_switch_d_M03_AXIS_tlast : STD_LOGIC_VECTOR ( 3 to 3 );
  signal split_switch_d_M03_AXIS_tready : STD_LOGIC;
  signal split_switch_d_M03_AXIS_tuser : STD_LOGIC_VECTOR ( 83 downto 63 );
  signal split_switch_d_M03_AXIS_tvalid : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xmatchpro_decompressor_engine_0_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_decompressor_engine_0_m00_axis_tlast : STD_LOGIC;
  signal xmatchpro_decompressor_engine_0_m00_axis_tready : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xmatchpro_decompressor_engine_0_m00_axis_tvalid : STD_LOGIC;
  signal xmatchpro_decompressor_engine_1_m00_axis1_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_decompressor_engine_1_m00_axis1_tlast : STD_LOGIC;
  signal xmatchpro_decompressor_engine_1_m00_axis1_tready : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xmatchpro_decompressor_engine_1_m00_axis1_tvalid : STD_LOGIC;
  signal xmatchpro_decompressor_engine_2_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_decompressor_engine_2_m00_axis_tlast : STD_LOGIC;
  signal xmatchpro_decompressor_engine_2_m00_axis_tready : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xmatchpro_decompressor_engine_2_m00_axis_tvalid : STD_LOGIC;
  signal xmatchpro_decompressor_engine_3_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xmatchpro_decompressor_engine_3_m00_axis_tlast : STD_LOGIC;
  signal xmatchpro_decompressor_engine_3_m00_axis_tready : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xmatchpro_decompressor_engine_3_m00_axis_tvalid : STD_LOGIC;
  signal NLW_axi_d_scheduler_0_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_engine_join_switch_d_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_header_fifo_d_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_header_fifo_d_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_header_fifo_d_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_output_stream_d_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_output_stream_d_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_output_stream_d_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_split_switch_d_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xmatchpro_decompressor_engine_0_engine_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_xmatchpro_decompressor_engine_0_crc_32_d_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_decompressor_engine_0_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_decompressor_engine_1_engine_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_xmatchpro_decompressor_engine_1_crc_32_d_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_decompressor_engine_1_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_decompressor_engine_2_engine_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_xmatchpro_decompressor_engine_2_crc_32_d_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_decompressor_engine_2_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_decompressor_engine_3_engine_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_xmatchpro_decompressor_engine_3_crc_32_d_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_xmatchpro_decompressor_engine_3_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  M_AXIS_tdata(31 downto 0) <= axis_data_fifo_c1_M_AXIS_TDATA(31 downto 0);
  M_AXIS_tlast <= axis_data_fifo_c1_M_AXIS_TLAST;
  M_AXIS_tvalid <= axis_data_fifo_c1_M_AXIS_TVALID;
  S_AXIS_tready <= axi_dma_sdram2fifo_d_M_AXIS_MM2S_TREADY;
  S_AXI_LITE_arready(0) <= processing_system7_0_axi_periph_M00_AXI_ARREADY;
  S_AXI_LITE_awready(0) <= processing_system7_0_axi_periph_M00_AXI_AWREADY;
  S_AXI_LITE_bresp(1 downto 0) <= processing_system7_0_axi_periph_M00_AXI_BRESP(1 downto 0);
  S_AXI_LITE_bvalid(0) <= processing_system7_0_axi_periph_M00_AXI_BVALID;
  S_AXI_LITE_rdata(31 downto 0) <= processing_system7_0_axi_periph_M00_AXI_RDATA(31 downto 0);
  S_AXI_LITE_rresp(1 downto 0) <= processing_system7_0_axi_periph_M00_AXI_RRESP(1 downto 0);
  S_AXI_LITE_rvalid(0) <= processing_system7_0_axi_periph_M00_AXI_RVALID;
  S_AXI_LITE_wready(0) <= processing_system7_0_axi_periph_M00_AXI_WREADY;
  axi_dma_sdram2fifo_d_M_AXIS_MM2S_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  axi_dma_sdram2fifo_d_M_AXIS_MM2S_TVALID <= S_AXIS_tvalid;
  axis_data_fifo_c1_M_AXIS_TREADY <= M_AXIS_tready;
  processing_system7_0_FCLK_CLK1 <= aclk;
  processing_system7_0_axi_periph_M00_AXI_ARADDR(3 downto 0) <= S_AXI_LITE_araddr(3 downto 0);
  processing_system7_0_axi_periph_M00_AXI_ARPROT(2 downto 0) <= S_AXI_LITE_arprot(2 downto 0);
  processing_system7_0_axi_periph_M00_AXI_ARVALID(0) <= S_AXI_LITE_arvalid(0);
  processing_system7_0_axi_periph_M00_AXI_AWADDR(3 downto 0) <= S_AXI_LITE_awaddr(3 downto 0);
  processing_system7_0_axi_periph_M00_AXI_AWPROT(2 downto 0) <= S_AXI_LITE_awprot(2 downto 0);
  processing_system7_0_axi_periph_M00_AXI_AWVALID(0) <= S_AXI_LITE_awvalid(0);
  processing_system7_0_axi_periph_M00_AXI_BREADY(0) <= S_AXI_LITE_bready(0);
  processing_system7_0_axi_periph_M00_AXI_RREADY(0) <= S_AXI_LITE_rready(0);
  processing_system7_0_axi_periph_M00_AXI_WDATA(31 downto 0) <= S_AXI_LITE_wdata(31 downto 0);
  processing_system7_0_axi_periph_M00_AXI_WSTRB(3 downto 0) <= S_AXI_LITE_wstrb(3 downto 0);
  processing_system7_0_axi_periph_M00_AXI_WVALID(0) <= S_AXI_LITE_wvalid(0);
  rst_processing_system7_0_100M_peripheral_aresetn1(0) <= aresetn(0);
axi_d_scheduler_0: component mysystem2_axi_d_scheduler_0_0
    port map (
      axis_join_switch_aclk => processing_system7_0_FCLK_CLK1,
      axis_join_switch_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      axis_join_switch_tdata(31 downto 0) => engine_join_switch_d_M00_AXIS_TDATA(31 downto 0),
      axis_join_switch_tlast => engine_join_switch_d_M00_AXIS_TLAST(0),
      axis_join_switch_tready => engine_join_switch_d_M00_AXIS_TREADY,
      axis_join_switch_tvalid => engine_join_switch_d_M00_AXIS_TVALID(0),
      axis_split_switch_aclk => processing_system7_0_FCLK_CLK1,
      axis_split_switch_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      axis_split_switch_tdata(31 downto 0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TDATA(31 downto 0),
      axis_split_switch_tdest(3 downto 0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TDEST(3 downto 0),
      axis_split_switch_tlast => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TLAST,
      axis_split_switch_tready => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TREADY(0),
      axis_split_switch_tuser(20 downto 0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TUSER(20 downto 0),
      axis_split_switch_tvalid => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TVALID,
      command(31 downto 0) => axi_d_scheduler_0_command(31 downto 0),
      command_in(31 downto 0) => xlconstant_0_dout(31 downto 0),
      engine_ready_in(15 downto 0) => xlconstant_1_dout(15 downto 0),
      header_in_aclk => processing_system7_0_FCLK_CLK1,
      header_in_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      header_in_tdata(31 downto 0) => header_fifo_d_M_AXIS_TDATA(31 downto 0),
      header_in_tlast => header_fifo_d_M_AXIS_TLAST,
      header_in_tready => header_fifo_d_M_AXIS_TREADY,
      header_in_tvalid => header_fifo_d_M_AXIS_TVALID,
      header_out_aclk => processing_system7_0_FCLK_CLK1,
      header_out_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      header_out_tdata(31 downto 0) => axi_d_scheduler_0_HEADER_OUT_TDATA(31 downto 0),
      header_out_tlast => axi_d_scheduler_0_HEADER_OUT_TLAST,
      header_out_tready => axi_d_scheduler_0_HEADER_OUT_TREADY,
      header_out_tvalid => axi_d_scheduler_0_HEADER_OUT_TVALID,
      input_stream_aclk => processing_system7_0_FCLK_CLK1,
      input_stream_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      input_stream_tdata(31 downto 0) => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TDATA(31 downto 0),
      input_stream_tready => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TREADY,
      input_stream_tvalid => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TVALID,
      join_suppress(3 downto 0) => axi_d_scheduler_0_join_suppress(3 downto 0),
      output_stream_aclk => processing_system7_0_FCLK_CLK1,
      output_stream_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      output_stream_tdata(31 downto 0) => axi_d_scheduler_0_OUTPUT_STREAM_TDATA(31 downto 0),
      output_stream_tlast => axi_d_scheduler_0_OUTPUT_STREAM_TLAST,
      output_stream_tready => axi_d_scheduler_0_OUTPUT_STREAM_TREADY,
      output_stream_tvalid => axi_d_scheduler_0_OUTPUT_STREAM_TVALID,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK1,
      s_axi_lite_araddr(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARADDR(3 downto 0),
      s_axi_lite_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      s_axi_lite_arprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      s_axi_lite_arready => processing_system7_0_axi_periph_M00_AXI_ARREADY,
      s_axi_lite_arvalid => processing_system7_0_axi_periph_M00_AXI_ARVALID(0),
      s_axi_lite_awaddr(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWADDR(3 downto 0),
      s_axi_lite_awprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      s_axi_lite_awready => processing_system7_0_axi_periph_M00_AXI_AWREADY,
      s_axi_lite_awvalid => processing_system7_0_axi_periph_M00_AXI_AWVALID(0),
      s_axi_lite_bready => processing_system7_0_axi_periph_M00_AXI_BREADY(0),
      s_axi_lite_bresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => processing_system7_0_axi_periph_M00_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => processing_system7_0_axi_periph_M00_AXI_RREADY(0),
      s_axi_lite_rresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => processing_system7_0_axi_periph_M00_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => processing_system7_0_axi_periph_M00_AXI_WREADY,
      s_axi_lite_wstrb(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      s_axi_lite_wvalid => processing_system7_0_axi_periph_M00_AXI_WVALID(0),
      status(31 downto 0) => NLW_axi_d_scheduler_0_status_UNCONNECTED(31 downto 0)
    );
engine_join_switch_d: component mysystem2_engine_join_switch_d_0
    port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      m_axis_tdata(31 downto 0) => engine_join_switch_d_M00_AXIS_TDATA(31 downto 0),
      m_axis_tlast(0) => engine_join_switch_d_M00_AXIS_TLAST(0),
      m_axis_tready(0) => engine_join_switch_d_M00_AXIS_TREADY,
      m_axis_tvalid(0) => engine_join_switch_d_M00_AXIS_TVALID(0),
      s_axis_tdata(127 downto 96) => xmatchpro_decompressor_engine_3_m00_axis_tdata(31 downto 0),
      s_axis_tdata(95 downto 64) => xmatchpro_decompressor_engine_2_m00_axis_tdata(31 downto 0),
      s_axis_tdata(63 downto 32) => xmatchpro_decompressor_engine_1_m00_axis1_tdata(31 downto 0),
      s_axis_tdata(31 downto 0) => xmatchpro_decompressor_engine_0_m00_axis_tdata(31 downto 0),
      s_axis_tlast(3) => xmatchpro_decompressor_engine_3_m00_axis_tlast,
      s_axis_tlast(2) => xmatchpro_decompressor_engine_2_m00_axis_tlast,
      s_axis_tlast(1) => xmatchpro_decompressor_engine_1_m00_axis1_tlast,
      s_axis_tlast(0) => xmatchpro_decompressor_engine_0_m00_axis_tlast,
      s_axis_tready(3) => xmatchpro_decompressor_engine_3_m00_axis_tready(3),
      s_axis_tready(2) => xmatchpro_decompressor_engine_2_m00_axis_tready(2),
      s_axis_tready(1) => xmatchpro_decompressor_engine_1_m00_axis1_tready(1),
      s_axis_tready(0) => xmatchpro_decompressor_engine_0_m00_axis_tready(0),
      s_axis_tvalid(3) => xmatchpro_decompressor_engine_3_m00_axis_tvalid,
      s_axis_tvalid(2) => xmatchpro_decompressor_engine_2_m00_axis_tvalid,
      s_axis_tvalid(1) => xmatchpro_decompressor_engine_1_m00_axis1_tvalid,
      s_axis_tvalid(0) => xmatchpro_decompressor_engine_0_m00_axis_tvalid,
      s_decode_err(3 downto 0) => NLW_engine_join_switch_d_s_decode_err_UNCONNECTED(3 downto 0),
      s_req_suppress(3 downto 0) => axi_d_scheduler_0_join_suppress(3 downto 0)
    );
header_fifo_d: component mysystem2_header_fifo_d_0
    port map (
      axis_data_count(31 downto 0) => NLW_header_fifo_d_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_header_fifo_d_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_header_fifo_d_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => header_fifo_d_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => header_fifo_d_M_AXIS_TLAST,
      m_axis_tready => header_fifo_d_M_AXIS_TREADY,
      m_axis_tvalid => header_fifo_d_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      s_axis_tdata(31 downto 0) => axi_d_scheduler_0_HEADER_OUT_TDATA(31 downto 0),
      s_axis_tlast => axi_d_scheduler_0_HEADER_OUT_TLAST,
      s_axis_tready => axi_d_scheduler_0_HEADER_OUT_TREADY,
      s_axis_tvalid => axi_d_scheduler_0_HEADER_OUT_TVALID
    );
output_stream_d: component mysystem2_output_stream_d_0
    port map (
      axis_data_count(31 downto 0) => NLW_output_stream_d_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_output_stream_d_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_output_stream_d_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => axis_data_fifo_c1_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => axis_data_fifo_c1_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_c1_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_c1_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      s_axis_tdata(31 downto 0) => axi_d_scheduler_0_OUTPUT_STREAM_TDATA(31 downto 0),
      s_axis_tlast => axi_d_scheduler_0_OUTPUT_STREAM_TLAST,
      s_axis_tready => axi_d_scheduler_0_OUTPUT_STREAM_TREADY,
      s_axis_tvalid => axi_d_scheduler_0_OUTPUT_STREAM_TVALID
    );
split_switch_d: component mysystem2_split_switch_d_0
    port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      m_axis_tdata(127 downto 96) => split_switch_d_M03_AXIS_tdata(127 downto 96),
      m_axis_tdata(95 downto 64) => split_switch_d_M02_AXIS_tdata(95 downto 64),
      m_axis_tdata(63 downto 32) => split_switch_d_M01_AXIS_tdata(63 downto 32),
      m_axis_tdata(31 downto 0) => split_switch_d_M00_AXIS_tdata(31 downto 0),
      m_axis_tdest(15 downto 12) => split_switch_d_M03_AXIS_tdest(15 downto 12),
      m_axis_tdest(11 downto 8) => split_switch_d_M02_AXIS_tdest(11 downto 8),
      m_axis_tdest(7 downto 4) => split_switch_d_M01_AXIS_tdest(7 downto 4),
      m_axis_tdest(3 downto 0) => split_switch_d_M00_AXIS_tdest(3 downto 0),
      m_axis_tlast(3) => split_switch_d_M03_AXIS_tlast(3),
      m_axis_tlast(2) => split_switch_d_M02_AXIS_tlast(2),
      m_axis_tlast(1) => split_switch_d_M01_AXIS_tlast(1),
      m_axis_tlast(0) => split_switch_d_M00_AXIS_tlast(0),
      m_axis_tready(3) => split_switch_d_M03_AXIS_tready,
      m_axis_tready(2) => split_switch_d_M02_AXIS_tready,
      m_axis_tready(1) => split_switch_d_M01_AXIS_tready,
      m_axis_tready(0) => split_switch_d_M00_AXIS_tready,
      m_axis_tuser(83 downto 63) => split_switch_d_M03_AXIS_tuser(83 downto 63),
      m_axis_tuser(62 downto 42) => split_switch_d_M02_AXIS_tuser(62 downto 42),
      m_axis_tuser(41 downto 21) => split_switch_d_M01_AXIS_tuser(41 downto 21),
      m_axis_tuser(20 downto 0) => split_switch_d_M00_AXIS_tuser(20 downto 0),
      m_axis_tvalid(3) => split_switch_d_M03_AXIS_tvalid(3),
      m_axis_tvalid(2) => split_switch_d_M02_AXIS_tvalid(2),
      m_axis_tvalid(1) => split_switch_d_M01_AXIS_tvalid(1),
      m_axis_tvalid(0) => split_switch_d_M00_AXIS_tvalid(0),
      s_axis_tdata(31 downto 0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TDATA(31 downto 0),
      s_axis_tdest(3 downto 0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TDEST(3 downto 0),
      s_axis_tlast(0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TLAST,
      s_axis_tready(0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TREADY(0),
      s_axis_tuser(20 downto 0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TUSER(20 downto 0),
      s_axis_tvalid(0) => axi_d_scheduler_0_AXIS_SPLIT_SWITCH_TVALID,
      s_decode_err(0) => NLW_split_switch_d_s_decode_err_UNCONNECTED(0)
    );
xlconstant_0_d: component mysystem2_xlconstant_0_d_0
    port map (
      dout(31 downto 0) => xlconstant_0_dout(31 downto 0)
    );
xlconstant_1_d: component mysystem2_xlconstant_1_d_0
    port map (
      dout(15 downto 0) => xlconstant_1_dout(15 downto 0)
    );
xmatchpro_decompressor_engine_0: component mysystem2_xmatchpro_decompressor_engine_0_0
    port map (
      command(31 downto 0) => axi_d_scheduler_0_command(31 downto 0),
      crc_32_d(31 downto 0) => NLW_xmatchpro_decompressor_engine_0_crc_32_d_UNCONNECTED(31 downto 0),
      engine_ready => NLW_xmatchpro_decompressor_engine_0_engine_ready_UNCONNECTED,
      m00_axis_aclk => processing_system7_0_FCLK_CLK1,
      m00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_decompressor_engine_0_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_decompressor_engine_0_m00_axis_tlast,
      m00_axis_tready => xmatchpro_decompressor_engine_0_m00_axis_tready(0),
      m00_axis_tvalid => xmatchpro_decompressor_engine_0_m00_axis_tvalid,
      s00_axis_aclk => processing_system7_0_FCLK_CLK1,
      s00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      s00_axis_tdata(31 downto 0) => split_switch_d_M00_AXIS_tdata(31 downto 0),
      s00_axis_tdest(3 downto 0) => split_switch_d_M00_AXIS_tdest(3 downto 0),
      s00_axis_tlast => split_switch_d_M00_AXIS_tlast(0),
      s00_axis_tready => split_switch_d_M00_AXIS_tready,
      s00_axis_tuser(20 downto 0) => split_switch_d_M00_AXIS_tuser(20 downto 0),
      s00_axis_tvalid => split_switch_d_M00_AXIS_tvalid(0),
      status(31 downto 0) => NLW_xmatchpro_decompressor_engine_0_status_UNCONNECTED(31 downto 0),
      xpro_aclk => processing_system7_0_FCLK_CLK1,
      xpro_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0)
    );
xmatchpro_decompressor_engine_1: component mysystem2_xmatchpro_decompressor_engine_1_0
    port map (
      command(31 downto 0) => axi_d_scheduler_0_command(31 downto 0),
      crc_32_d(31 downto 0) => NLW_xmatchpro_decompressor_engine_1_crc_32_d_UNCONNECTED(31 downto 0),
      engine_ready => NLW_xmatchpro_decompressor_engine_1_engine_ready_UNCONNECTED,
      m00_axis_aclk => processing_system7_0_FCLK_CLK1,
      m00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_decompressor_engine_1_m00_axis1_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_decompressor_engine_1_m00_axis1_tlast,
      m00_axis_tready => xmatchpro_decompressor_engine_1_m00_axis1_tready(1),
      m00_axis_tvalid => xmatchpro_decompressor_engine_1_m00_axis1_tvalid,
      s00_axis_aclk => processing_system7_0_FCLK_CLK1,
      s00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      s00_axis_tdata(31 downto 0) => split_switch_d_M01_AXIS_tdata(63 downto 32),
      s00_axis_tdest(3 downto 0) => split_switch_d_M01_AXIS_tdest(7 downto 4),
      s00_axis_tlast => split_switch_d_M01_AXIS_tlast(1),
      s00_axis_tready => split_switch_d_M01_AXIS_tready,
      s00_axis_tuser(20 downto 0) => split_switch_d_M01_AXIS_tuser(41 downto 21),
      s00_axis_tvalid => split_switch_d_M01_AXIS_tvalid(1),
      status(31 downto 0) => NLW_xmatchpro_decompressor_engine_1_status_UNCONNECTED(31 downto 0),
      xpro_aclk => processing_system7_0_FCLK_CLK1,
      xpro_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0)
    );
xmatchpro_decompressor_engine_2: component mysystem2_xmatchpro_decompressor_engine_2_0
    port map (
      command(31 downto 0) => axi_d_scheduler_0_command(31 downto 0),
      crc_32_d(31 downto 0) => NLW_xmatchpro_decompressor_engine_2_crc_32_d_UNCONNECTED(31 downto 0),
      engine_ready => NLW_xmatchpro_decompressor_engine_2_engine_ready_UNCONNECTED,
      m00_axis_aclk => processing_system7_0_FCLK_CLK1,
      m00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_decompressor_engine_2_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_decompressor_engine_2_m00_axis_tlast,
      m00_axis_tready => xmatchpro_decompressor_engine_2_m00_axis_tready(2),
      m00_axis_tvalid => xmatchpro_decompressor_engine_2_m00_axis_tvalid,
      s00_axis_aclk => processing_system7_0_FCLK_CLK1,
      s00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      s00_axis_tdata(31 downto 0) => split_switch_d_M02_AXIS_tdata(95 downto 64),
      s00_axis_tdest(3 downto 0) => split_switch_d_M02_AXIS_tdest(11 downto 8),
      s00_axis_tlast => split_switch_d_M02_AXIS_tlast(2),
      s00_axis_tready => split_switch_d_M02_AXIS_tready,
      s00_axis_tuser(20 downto 0) => split_switch_d_M02_AXIS_tuser(62 downto 42),
      s00_axis_tvalid => split_switch_d_M02_AXIS_tvalid(2),
      status(31 downto 0) => NLW_xmatchpro_decompressor_engine_2_status_UNCONNECTED(31 downto 0),
      xpro_aclk => processing_system7_0_FCLK_CLK1,
      xpro_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0)
    );
xmatchpro_decompressor_engine_3: component mysystem2_xmatchpro_decompressor_engine_3_0
    port map (
      command(31 downto 0) => axi_d_scheduler_0_command(31 downto 0),
      crc_32_d(31 downto 0) => NLW_xmatchpro_decompressor_engine_3_crc_32_d_UNCONNECTED(31 downto 0),
      engine_ready => NLW_xmatchpro_decompressor_engine_3_engine_ready_UNCONNECTED,
      m00_axis_aclk => processing_system7_0_FCLK_CLK1,
      m00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      m00_axis_tdata(31 downto 0) => xmatchpro_decompressor_engine_3_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => xmatchpro_decompressor_engine_3_m00_axis_tlast,
      m00_axis_tready => xmatchpro_decompressor_engine_3_m00_axis_tready(3),
      m00_axis_tvalid => xmatchpro_decompressor_engine_3_m00_axis_tvalid,
      s00_axis_aclk => processing_system7_0_FCLK_CLK1,
      s00_axis_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0),
      s00_axis_tdata(31 downto 0) => split_switch_d_M03_AXIS_tdata(127 downto 96),
      s00_axis_tdest(3 downto 0) => split_switch_d_M03_AXIS_tdest(15 downto 12),
      s00_axis_tlast => split_switch_d_M03_AXIS_tlast(3),
      s00_axis_tready => split_switch_d_M03_AXIS_tready,
      s00_axis_tuser(20 downto 0) => split_switch_d_M03_AXIS_tuser(83 downto 63),
      s00_axis_tvalid => split_switch_d_M03_AXIS_tvalid(3),
      status(31 downto 0) => NLW_xmatchpro_decompressor_engine_3_status_UNCONNECTED(31 downto 0),
      xpro_aclk => processing_system7_0_FCLK_CLK1,
      xpro_aresetn => rst_processing_system7_0_100M_peripheral_aresetn1(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_1E4W7PA is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    S_AXI_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m00_couplers_imp_1E4W7PA;

architecture STRUCTURE of m00_couplers_imp_1E4W7PA is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal m00_couplers_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal m00_couplers_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= m00_couplers_to_m00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= m00_couplers_to_m00_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(2 downto 0) <= m00_couplers_to_m00_couplers_ARID(2 downto 0);
  M_AXI_arlen(7 downto 0) <= m00_couplers_to_m00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= m00_couplers_to_m00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= m00_couplers_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= m00_couplers_to_m00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= m00_couplers_to_m00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid(0) <= m00_couplers_to_m00_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= m00_couplers_to_m00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= m00_couplers_to_m00_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(2 downto 0) <= m00_couplers_to_m00_couplers_AWID(2 downto 0);
  M_AXI_awlen(7 downto 0) <= m00_couplers_to_m00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= m00_couplers_to_m00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= m00_couplers_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= m00_couplers_to_m00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= m00_couplers_to_m00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid(0) <= m00_couplers_to_m00_couplers_AWVALID(0);
  M_AXI_bready(0) <= m00_couplers_to_m00_couplers_BREADY(0);
  M_AXI_rready(0) <= m00_couplers_to_m00_couplers_RREADY(0);
  M_AXI_wdata(511 downto 0) <= m00_couplers_to_m00_couplers_WDATA(511 downto 0);
  M_AXI_wlast(0) <= m00_couplers_to_m00_couplers_WLAST(0);
  M_AXI_wstrb(63 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(63 downto 0);
  M_AXI_wvalid(0) <= m00_couplers_to_m00_couplers_WVALID(0);
  S_AXI_arready(0) <= m00_couplers_to_m00_couplers_ARREADY(0);
  S_AXI_awready(0) <= m00_couplers_to_m00_couplers_AWREADY(0);
  S_AXI_bid(2 downto 0) <= m00_couplers_to_m00_couplers_BID(2 downto 0);
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m00_couplers_to_m00_couplers_BVALID(0);
  S_AXI_rdata(511 downto 0) <= m00_couplers_to_m00_couplers_RDATA(511 downto 0);
  S_AXI_rid(2 downto 0) <= m00_couplers_to_m00_couplers_RID(2 downto 0);
  S_AXI_rlast(0) <= m00_couplers_to_m00_couplers_RLAST(0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m00_couplers_to_m00_couplers_RVALID(0);
  S_AXI_wready(0) <= m00_couplers_to_m00_couplers_WREADY(0);
  m00_couplers_to_m00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_m00_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m00_couplers_to_m00_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m00_couplers_to_m00_couplers_ARID(2 downto 0) <= S_AXI_arid(2 downto 0);
  m00_couplers_to_m00_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m00_couplers_to_m00_couplers_ARLOCK(0) <= S_AXI_arlock(0);
  m00_couplers_to_m00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_m00_couplers_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m00_couplers_to_m00_couplers_ARREADY(0) <= M_AXI_arready(0);
  m00_couplers_to_m00_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m00_couplers_to_m00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m00_couplers_to_m00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_m00_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m00_couplers_to_m00_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m00_couplers_to_m00_couplers_AWID(2 downto 0) <= S_AXI_awid(2 downto 0);
  m00_couplers_to_m00_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m00_couplers_to_m00_couplers_AWLOCK(0) <= S_AXI_awlock(0);
  m00_couplers_to_m00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_m00_couplers_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m00_couplers_to_m00_couplers_AWREADY(0) <= M_AXI_awready(0);
  m00_couplers_to_m00_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m00_couplers_to_m00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m00_couplers_to_m00_couplers_BID(2 downto 0) <= M_AXI_bid(2 downto 0);
  m00_couplers_to_m00_couplers_BREADY(0) <= S_AXI_bready(0);
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m00_couplers_to_m00_couplers_RDATA(511 downto 0) <= M_AXI_rdata(511 downto 0);
  m00_couplers_to_m00_couplers_RID(2 downto 0) <= M_AXI_rid(2 downto 0);
  m00_couplers_to_m00_couplers_RLAST(0) <= M_AXI_rlast(0);
  m00_couplers_to_m00_couplers_RREADY(0) <= S_AXI_rready(0);
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m00_couplers_to_m00_couplers_WDATA(511 downto 0) <= S_AXI_wdata(511 downto 0);
  m00_couplers_to_m00_couplers_WLAST(0) <= S_AXI_wlast(0);
  m00_couplers_to_m00_couplers_WREADY(0) <= M_AXI_wready(0);
  m00_couplers_to_m00_couplers_WSTRB(63 downto 0) <= S_AXI_wstrb(63 downto 0);
  m00_couplers_to_m00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_T7BQX6 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_T7BQX6;

architecture STRUCTURE of m00_couplers_imp_T7BQX6 is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(8 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(8 downto 0);
  M_AXI_arvalid <= m00_couplers_to_m00_couplers_ARVALID;
  M_AXI_awaddr(8 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(8 downto 0);
  M_AXI_awvalid <= m00_couplers_to_m00_couplers_AWVALID;
  M_AXI_bready <= m00_couplers_to_m00_couplers_BREADY;
  M_AXI_rready <= m00_couplers_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m00_couplers_to_m00_couplers_WVALID;
  S_AXI_arready <= m00_couplers_to_m00_couplers_ARREADY;
  S_AXI_awready <= m00_couplers_to_m00_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_m00_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_m00_couplers_RVALID;
  S_AXI_wready <= m00_couplers_to_m00_couplers_WREADY;
  m00_couplers_to_m00_couplers_ARADDR(8 downto 0) <= S_AXI_araddr(8 downto 0);
  m00_couplers_to_m00_couplers_ARREADY <= M_AXI_arready;
  m00_couplers_to_m00_couplers_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_m00_couplers_AWADDR(8 downto 0) <= S_AXI_awaddr(8 downto 0);
  m00_couplers_to_m00_couplers_AWREADY <= M_AXI_awready;
  m00_couplers_to_m00_couplers_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_m00_couplers_BREADY <= S_AXI_bready;
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID <= M_AXI_bvalid;
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY <= S_AXI_rready;
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID <= M_AXI_rvalid;
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_m00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_m00_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1GW7LG2 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m01_couplers_imp_1GW7LG2;

architecture STRUCTURE of m01_couplers_imp_1GW7LG2 is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(3 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(3 downto 0);
  M_AXI_arprot(2 downto 0) <= m01_couplers_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m01_couplers_to_m01_couplers_ARVALID(0);
  M_AXI_awaddr(3 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(3 downto 0);
  M_AXI_awprot(2 downto 0) <= m01_couplers_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m01_couplers_to_m01_couplers_AWVALID(0);
  M_AXI_bready(0) <= m01_couplers_to_m01_couplers_BREADY(0);
  M_AXI_rready(0) <= m01_couplers_to_m01_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m01_couplers_to_m01_couplers_WVALID(0);
  S_AXI_arready(0) <= m01_couplers_to_m01_couplers_ARREADY(0);
  S_AXI_awready(0) <= m01_couplers_to_m01_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m01_couplers_to_m01_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m01_couplers_to_m01_couplers_RVALID(0);
  S_AXI_wready(0) <= m01_couplers_to_m01_couplers_WREADY(0);
  m01_couplers_to_m01_couplers_ARADDR(3 downto 0) <= S_AXI_araddr(3 downto 0);
  m01_couplers_to_m01_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_m01_couplers_ARREADY(0) <= M_AXI_arready(0);
  m01_couplers_to_m01_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m01_couplers_to_m01_couplers_AWADDR(3 downto 0) <= S_AXI_awaddr(3 downto 0);
  m01_couplers_to_m01_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_m01_couplers_AWREADY(0) <= M_AXI_awready(0);
  m01_couplers_to_m01_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m01_couplers_to_m01_couplers_BREADY(0) <= S_AXI_bready(0);
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RREADY(0) <= S_AXI_rready(0);
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WREADY(0) <= M_AXI_wready(0);
  m01_couplers_to_m01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_m01_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_8B7HFF is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m02_couplers_imp_8B7HFF;

architecture STRUCTURE of m02_couplers_imp_8B7HFF is
  signal m02_couplers_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(3 downto 0) <= m02_couplers_to_m02_couplers_ARADDR(3 downto 0);
  M_AXI_arprot(2 downto 0) <= m02_couplers_to_m02_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m02_couplers_to_m02_couplers_ARVALID(0);
  M_AXI_awaddr(3 downto 0) <= m02_couplers_to_m02_couplers_AWADDR(3 downto 0);
  M_AXI_awprot(2 downto 0) <= m02_couplers_to_m02_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m02_couplers_to_m02_couplers_AWVALID(0);
  M_AXI_bready(0) <= m02_couplers_to_m02_couplers_BREADY(0);
  M_AXI_rready(0) <= m02_couplers_to_m02_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m02_couplers_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m02_couplers_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m02_couplers_to_m02_couplers_WVALID(0);
  S_AXI_arready(0) <= m02_couplers_to_m02_couplers_ARREADY(0);
  S_AXI_awready(0) <= m02_couplers_to_m02_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_m02_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m02_couplers_to_m02_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_m02_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_m02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m02_couplers_to_m02_couplers_RVALID(0);
  S_AXI_wready(0) <= m02_couplers_to_m02_couplers_WREADY(0);
  m02_couplers_to_m02_couplers_ARADDR(3 downto 0) <= S_AXI_araddr(3 downto 0);
  m02_couplers_to_m02_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_m02_couplers_ARREADY(0) <= M_AXI_arready(0);
  m02_couplers_to_m02_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m02_couplers_to_m02_couplers_AWADDR(3 downto 0) <= S_AXI_awaddr(3 downto 0);
  m02_couplers_to_m02_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_m02_couplers_AWREADY(0) <= M_AXI_awready(0);
  m02_couplers_to_m02_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m02_couplers_to_m02_couplers_BREADY(0) <= S_AXI_bready(0);
  m02_couplers_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m02_couplers_to_m02_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m02_couplers_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m02_couplers_to_m02_couplers_RREADY(0) <= S_AXI_rready(0);
  m02_couplers_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m02_couplers_to_m02_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m02_couplers_to_m02_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_m02_couplers_WREADY(0) <= M_AXI_wready(0);
  m02_couplers_to_m02_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_m02_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1K2M3S3 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m03_couplers_imp_1K2M3S3;

architecture STRUCTURE of m03_couplers_imp_1K2M3S3 is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(9 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(9 downto 0);
  M_AXI_arvalid(0) <= m03_couplers_to_m03_couplers_ARVALID(0);
  M_AXI_awaddr(9 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(9 downto 0);
  M_AXI_awvalid(0) <= m03_couplers_to_m03_couplers_AWVALID(0);
  M_AXI_bready(0) <= m03_couplers_to_m03_couplers_BREADY(0);
  M_AXI_rready(0) <= m03_couplers_to_m03_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wvalid(0) <= m03_couplers_to_m03_couplers_WVALID(0);
  S_AXI_arready(0) <= m03_couplers_to_m03_couplers_ARREADY(0);
  S_AXI_awready(0) <= m03_couplers_to_m03_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m03_couplers_to_m03_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m03_couplers_to_m03_couplers_RVALID(0);
  S_AXI_wready(0) <= m03_couplers_to_m03_couplers_WREADY(0);
  m03_couplers_to_m03_couplers_ARADDR(9 downto 0) <= S_AXI_araddr(9 downto 0);
  m03_couplers_to_m03_couplers_ARREADY(0) <= M_AXI_arready(0);
  m03_couplers_to_m03_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m03_couplers_to_m03_couplers_AWADDR(9 downto 0) <= S_AXI_awaddr(9 downto 0);
  m03_couplers_to_m03_couplers_AWREADY(0) <= M_AXI_awready(0);
  m03_couplers_to_m03_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m03_couplers_to_m03_couplers_BREADY(0) <= S_AXI_bready(0);
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY(0) <= S_AXI_rready(0);
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY(0) <= M_AXI_wready(0);
  m03_couplers_to_m03_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_ZK4OO8 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m04_couplers_imp_ZK4OO8;

architecture STRUCTURE of m04_couplers_imp_ZK4OO8 is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(9 downto 0) <= m04_couplers_to_m04_couplers_ARADDR(9 downto 0);
  M_AXI_arvalid(0) <= m04_couplers_to_m04_couplers_ARVALID(0);
  M_AXI_awaddr(9 downto 0) <= m04_couplers_to_m04_couplers_AWADDR(9 downto 0);
  M_AXI_awvalid(0) <= m04_couplers_to_m04_couplers_AWVALID(0);
  M_AXI_bready(0) <= m04_couplers_to_m04_couplers_BREADY(0);
  M_AXI_rready(0) <= m04_couplers_to_m04_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m04_couplers_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wvalid(0) <= m04_couplers_to_m04_couplers_WVALID(0);
  S_AXI_arready(0) <= m04_couplers_to_m04_couplers_ARREADY(0);
  S_AXI_awready(0) <= m04_couplers_to_m04_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_m04_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m04_couplers_to_m04_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_m04_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_m04_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m04_couplers_to_m04_couplers_RVALID(0);
  S_AXI_wready(0) <= m04_couplers_to_m04_couplers_WREADY(0);
  m04_couplers_to_m04_couplers_ARADDR(9 downto 0) <= S_AXI_araddr(9 downto 0);
  m04_couplers_to_m04_couplers_ARREADY(0) <= M_AXI_arready(0);
  m04_couplers_to_m04_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m04_couplers_to_m04_couplers_AWADDR(9 downto 0) <= S_AXI_awaddr(9 downto 0);
  m04_couplers_to_m04_couplers_AWREADY(0) <= M_AXI_awready(0);
  m04_couplers_to_m04_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m04_couplers_to_m04_couplers_BREADY(0) <= S_AXI_bready(0);
  m04_couplers_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m04_couplers_to_m04_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m04_couplers_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m04_couplers_to_m04_couplers_RREADY(0) <= S_AXI_rready(0);
  m04_couplers_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m04_couplers_to_m04_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m04_couplers_to_m04_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_m04_couplers_WREADY(0) <= M_AXI_wready(0);
  m04_couplers_to_m04_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_OCXL80 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m05_couplers_imp_OCXL80;

architecture STRUCTURE of m05_couplers_imp_OCXL80 is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(9 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(9 downto 0);
  M_AXI_arvalid(0) <= m05_couplers_to_m05_couplers_ARVALID(0);
  M_AXI_awaddr(9 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(9 downto 0);
  M_AXI_awvalid(0) <= m05_couplers_to_m05_couplers_AWVALID(0);
  M_AXI_bready(0) <= m05_couplers_to_m05_couplers_BREADY(0);
  M_AXI_rready(0) <= m05_couplers_to_m05_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wvalid(0) <= m05_couplers_to_m05_couplers_WVALID(0);
  S_AXI_arready(0) <= m05_couplers_to_m05_couplers_ARREADY(0);
  S_AXI_awready(0) <= m05_couplers_to_m05_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m05_couplers_to_m05_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m05_couplers_to_m05_couplers_RVALID(0);
  S_AXI_wready(0) <= m05_couplers_to_m05_couplers_WREADY(0);
  m05_couplers_to_m05_couplers_ARADDR(9 downto 0) <= S_AXI_araddr(9 downto 0);
  m05_couplers_to_m05_couplers_ARREADY(0) <= M_AXI_arready(0);
  m05_couplers_to_m05_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m05_couplers_to_m05_couplers_AWADDR(9 downto 0) <= S_AXI_awaddr(9 downto 0);
  m05_couplers_to_m05_couplers_AWREADY(0) <= M_AXI_awready(0);
  m05_couplers_to_m05_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m05_couplers_to_m05_couplers_BREADY(0) <= S_AXI_bready(0);
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RREADY(0) <= S_AXI_rready(0);
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WREADY(0) <= M_AXI_wready(0);
  m05_couplers_to_m05_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_1VVCIE1 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m06_couplers_imp_1VVCIE1;

architecture STRUCTURE of m06_couplers_imp_1VVCIE1 is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(9 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(9 downto 0);
  M_AXI_arvalid(0) <= m06_couplers_to_m06_couplers_ARVALID(0);
  M_AXI_awaddr(9 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(9 downto 0);
  M_AXI_awvalid(0) <= m06_couplers_to_m06_couplers_AWVALID(0);
  M_AXI_bready(0) <= m06_couplers_to_m06_couplers_BREADY(0);
  M_AXI_rready(0) <= m06_couplers_to_m06_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wvalid(0) <= m06_couplers_to_m06_couplers_WVALID(0);
  S_AXI_arready(0) <= m06_couplers_to_m06_couplers_ARREADY(0);
  S_AXI_awready(0) <= m06_couplers_to_m06_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m06_couplers_to_m06_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m06_couplers_to_m06_couplers_RVALID(0);
  S_AXI_wready(0) <= m06_couplers_to_m06_couplers_WREADY(0);
  m06_couplers_to_m06_couplers_ARADDR(9 downto 0) <= S_AXI_araddr(9 downto 0);
  m06_couplers_to_m06_couplers_ARREADY(0) <= M_AXI_arready(0);
  m06_couplers_to_m06_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m06_couplers_to_m06_couplers_AWADDR(9 downto 0) <= S_AXI_awaddr(9 downto 0);
  m06_couplers_to_m06_couplers_AWREADY(0) <= M_AXI_awready(0);
  m06_couplers_to_m06_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m06_couplers_to_m06_couplers_BREADY(0) <= S_AXI_bready(0);
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RREADY(0) <= S_AXI_rready(0);
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WREADY(0) <= M_AXI_wready(0);
  m06_couplers_to_m06_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m07_couplers_imp_9UJXOH is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m07_couplers_imp_9UJXOH;

architecture STRUCTURE of m07_couplers_imp_9UJXOH is
  signal m07_couplers_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(3 downto 0) <= m07_couplers_to_m07_couplers_ARADDR(3 downto 0);
  M_AXI_arvalid(0) <= m07_couplers_to_m07_couplers_ARVALID(0);
  M_AXI_awaddr(3 downto 0) <= m07_couplers_to_m07_couplers_AWADDR(3 downto 0);
  M_AXI_awvalid(0) <= m07_couplers_to_m07_couplers_AWVALID(0);
  M_AXI_bready(0) <= m07_couplers_to_m07_couplers_BREADY(0);
  M_AXI_rready(0) <= m07_couplers_to_m07_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m07_couplers_to_m07_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m07_couplers_to_m07_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m07_couplers_to_m07_couplers_WVALID(0);
  S_AXI_arready(0) <= m07_couplers_to_m07_couplers_ARREADY(0);
  S_AXI_awready(0) <= m07_couplers_to_m07_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m07_couplers_to_m07_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m07_couplers_to_m07_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m07_couplers_to_m07_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m07_couplers_to_m07_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m07_couplers_to_m07_couplers_RVALID(0);
  S_AXI_wready(0) <= m07_couplers_to_m07_couplers_WREADY(0);
  m07_couplers_to_m07_couplers_ARADDR(3 downto 0) <= S_AXI_araddr(3 downto 0);
  m07_couplers_to_m07_couplers_ARREADY(0) <= M_AXI_arready(0);
  m07_couplers_to_m07_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m07_couplers_to_m07_couplers_AWADDR(3 downto 0) <= S_AXI_awaddr(3 downto 0);
  m07_couplers_to_m07_couplers_AWREADY(0) <= M_AXI_awready(0);
  m07_couplers_to_m07_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m07_couplers_to_m07_couplers_BREADY(0) <= S_AXI_bready(0);
  m07_couplers_to_m07_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m07_couplers_to_m07_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m07_couplers_to_m07_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m07_couplers_to_m07_couplers_RREADY(0) <= S_AXI_rready(0);
  m07_couplers_to_m07_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m07_couplers_to_m07_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m07_couplers_to_m07_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m07_couplers_to_m07_couplers_WREADY(0) <= M_AXI_wready(0);
  m07_couplers_to_m07_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m07_couplers_to_m07_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity microblaze_0_local_memory_imp_6P9YJM is
  port (
    DLMB_abus : in STD_LOGIC_VECTOR ( 0 to 31 );
    DLMB_addrstrobe : in STD_LOGIC;
    DLMB_be : in STD_LOGIC_VECTOR ( 0 to 3 );
    DLMB_ce : out STD_LOGIC;
    DLMB_readdbus : out STD_LOGIC_VECTOR ( 0 to 31 );
    DLMB_readstrobe : in STD_LOGIC;
    DLMB_ready : out STD_LOGIC;
    DLMB_ue : out STD_LOGIC;
    DLMB_wait : out STD_LOGIC;
    DLMB_writedbus : in STD_LOGIC_VECTOR ( 0 to 31 );
    DLMB_writestrobe : in STD_LOGIC;
    ILMB_abus : in STD_LOGIC_VECTOR ( 0 to 31 );
    ILMB_addrstrobe : in STD_LOGIC;
    ILMB_ce : out STD_LOGIC;
    ILMB_readdbus : out STD_LOGIC_VECTOR ( 0 to 31 );
    ILMB_readstrobe : in STD_LOGIC;
    ILMB_ready : out STD_LOGIC;
    ILMB_ue : out STD_LOGIC;
    ILMB_wait : out STD_LOGIC;
    LMB_Clk : in STD_LOGIC;
    LMB_Rst : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end microblaze_0_local_memory_imp_6P9YJM;

architecture STRUCTURE of microblaze_0_local_memory_imp_6P9YJM is
  component mysystem2_dlmb_v10_0 is
  port (
    LMB_Clk : in STD_LOGIC;
    SYS_Rst : in STD_LOGIC;
    LMB_Rst : out STD_LOGIC;
    M_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    M_ReadStrobe : in STD_LOGIC;
    M_WriteStrobe : in STD_LOGIC;
    M_AddrStrobe : in STD_LOGIC;
    M_DBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    M_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_DBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    Sl_Ready : in STD_LOGIC_VECTOR ( 0 to 0 );
    Sl_Wait : in STD_LOGIC_VECTOR ( 0 to 0 );
    Sl_UE : in STD_LOGIC_VECTOR ( 0 to 0 );
    Sl_CE : in STD_LOGIC_VECTOR ( 0 to 0 );
    LMB_ABus : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_ReadStrobe : out STD_LOGIC;
    LMB_WriteStrobe : out STD_LOGIC;
    LMB_AddrStrobe : out STD_LOGIC;
    LMB_ReadDBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_Ready : out STD_LOGIC;
    LMB_Wait : out STD_LOGIC;
    LMB_UE : out STD_LOGIC;
    LMB_CE : out STD_LOGIC;
    LMB_BE : out STD_LOGIC_VECTOR ( 0 to 3 )
  );
  end component mysystem2_dlmb_v10_0;
  component mysystem2_ilmb_v10_0 is
  port (
    LMB_Clk : in STD_LOGIC;
    SYS_Rst : in STD_LOGIC;
    LMB_Rst : out STD_LOGIC;
    M_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    M_ReadStrobe : in STD_LOGIC;
    M_WriteStrobe : in STD_LOGIC;
    M_AddrStrobe : in STD_LOGIC;
    M_DBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    M_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_DBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    Sl_Ready : in STD_LOGIC_VECTOR ( 0 to 0 );
    Sl_Wait : in STD_LOGIC_VECTOR ( 0 to 0 );
    Sl_UE : in STD_LOGIC_VECTOR ( 0 to 0 );
    Sl_CE : in STD_LOGIC_VECTOR ( 0 to 0 );
    LMB_ABus : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_ReadStrobe : out STD_LOGIC;
    LMB_WriteStrobe : out STD_LOGIC;
    LMB_AddrStrobe : out STD_LOGIC;
    LMB_ReadDBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_Ready : out STD_LOGIC;
    LMB_Wait : out STD_LOGIC;
    LMB_UE : out STD_LOGIC;
    LMB_CE : out STD_LOGIC;
    LMB_BE : out STD_LOGIC_VECTOR ( 0 to 3 )
  );
  end component mysystem2_ilmb_v10_0;
  component mysystem2_dlmb_bram_if_cntlr_0 is
  port (
    LMB_Clk : in STD_LOGIC;
    LMB_Rst : in STD_LOGIC;
    LMB_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_AddrStrobe : in STD_LOGIC;
    LMB_ReadStrobe : in STD_LOGIC;
    LMB_WriteStrobe : in STD_LOGIC;
    LMB_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl_Ready : out STD_LOGIC;
    Sl_Wait : out STD_LOGIC;
    Sl_UE : out STD_LOGIC;
    Sl_CE : out STD_LOGIC;
    BRAM_Rst_A : out STD_LOGIC;
    BRAM_Clk_A : out STD_LOGIC;
    BRAM_Addr_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_EN_A : out STD_LOGIC;
    BRAM_WEN_A : out STD_LOGIC_VECTOR ( 0 to 3 );
    BRAM_Dout_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_Din_A : in STD_LOGIC_VECTOR ( 0 to 31 )
  );
  end component mysystem2_dlmb_bram_if_cntlr_0;
  component mysystem2_ilmb_bram_if_cntlr_0 is
  port (
    LMB_Clk : in STD_LOGIC;
    LMB_Rst : in STD_LOGIC;
    LMB_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_AddrStrobe : in STD_LOGIC;
    LMB_ReadStrobe : in STD_LOGIC;
    LMB_WriteStrobe : in STD_LOGIC;
    LMB_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl_Ready : out STD_LOGIC;
    Sl_Wait : out STD_LOGIC;
    Sl_UE : out STD_LOGIC;
    Sl_CE : out STD_LOGIC;
    BRAM_Rst_A : out STD_LOGIC;
    BRAM_Clk_A : out STD_LOGIC;
    BRAM_Addr_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_EN_A : out STD_LOGIC;
    BRAM_WEN_A : out STD_LOGIC_VECTOR ( 0 to 3 );
    BRAM_Dout_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_Din_A : in STD_LOGIC_VECTOR ( 0 to 31 )
  );
  end component mysystem2_ilmb_bram_if_cntlr_0;
  component mysystem2_lmb_bram_0 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component mysystem2_lmb_bram_0;
  signal GND_1 : STD_LOGIC;
  signal microblaze_0_Clk : STD_LOGIC;
  signal microblaze_0_LMB_Rst : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_dlmb_ABUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_ADDRSTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_BE : STD_LOGIC_VECTOR ( 0 to 3 );
  signal microblaze_0_dlmb_CE : STD_LOGIC;
  signal microblaze_0_dlmb_READDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_READSTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_READY : STD_LOGIC;
  signal microblaze_0_dlmb_UE : STD_LOGIC;
  signal microblaze_0_dlmb_WAIT : STD_LOGIC;
  signal microblaze_0_dlmb_WRITEDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_WRITESTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_bus_ABUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_bus_ADDRSTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_bus_BE : STD_LOGIC_VECTOR ( 0 to 3 );
  signal microblaze_0_dlmb_bus_CE : STD_LOGIC;
  signal microblaze_0_dlmb_bus_READDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_bus_READSTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_bus_READY : STD_LOGIC;
  signal microblaze_0_dlmb_bus_UE : STD_LOGIC;
  signal microblaze_0_dlmb_bus_WAIT : STD_LOGIC;
  signal microblaze_0_dlmb_bus_WRITEDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_bus_WRITESTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_cntlr_ADDR : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_cntlr_CLK : STD_LOGIC;
  signal microblaze_0_dlmb_cntlr_DIN : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_cntlr_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_dlmb_cntlr_EN : STD_LOGIC;
  signal microblaze_0_dlmb_cntlr_RST : STD_LOGIC;
  signal microblaze_0_dlmb_cntlr_WE : STD_LOGIC_VECTOR ( 0 to 3 );
  signal microblaze_0_ilmb_ABUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_ADDRSTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_CE : STD_LOGIC;
  signal microblaze_0_ilmb_READDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_READSTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_READY : STD_LOGIC;
  signal microblaze_0_ilmb_UE : STD_LOGIC;
  signal microblaze_0_ilmb_WAIT : STD_LOGIC;
  signal microblaze_0_ilmb_bus_ABUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_bus_ADDRSTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_bus_BE : STD_LOGIC_VECTOR ( 0 to 3 );
  signal microblaze_0_ilmb_bus_CE : STD_LOGIC;
  signal microblaze_0_ilmb_bus_READDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_bus_READSTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_bus_READY : STD_LOGIC;
  signal microblaze_0_ilmb_bus_UE : STD_LOGIC;
  signal microblaze_0_ilmb_bus_WAIT : STD_LOGIC;
  signal microblaze_0_ilmb_bus_WRITEDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_bus_WRITESTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_cntlr_ADDR : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_cntlr_CLK : STD_LOGIC;
  signal microblaze_0_ilmb_cntlr_DIN : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_cntlr_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_ilmb_cntlr_EN : STD_LOGIC;
  signal microblaze_0_ilmb_cntlr_RST : STD_LOGIC;
  signal microblaze_0_ilmb_cntlr_WE : STD_LOGIC_VECTOR ( 0 to 3 );
  signal NLW_dlmb_v10_LMB_Rst_UNCONNECTED : STD_LOGIC;
  signal NLW_ilmb_v10_LMB_Rst_UNCONNECTED : STD_LOGIC;
  attribute BMM_INFO_ADDRESS_SPACE : string;
  attribute BMM_INFO_ADDRESS_SPACE of dlmb_bram_if_cntlr : label is "byte  0x0 32 >  mysystem2 microblaze_0_local_memory/lmb_bram";
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of dlmb_bram_if_cntlr : label is "yes";
begin
  DLMB_ce <= microblaze_0_dlmb_CE;
  DLMB_readdbus(0 to 31) <= microblaze_0_dlmb_READDBUS(0 to 31);
  DLMB_ready <= microblaze_0_dlmb_READY;
  DLMB_ue <= microblaze_0_dlmb_UE;
  DLMB_wait <= microblaze_0_dlmb_WAIT;
  ILMB_ce <= microblaze_0_ilmb_CE;
  ILMB_readdbus(0 to 31) <= microblaze_0_ilmb_READDBUS(0 to 31);
  ILMB_ready <= microblaze_0_ilmb_READY;
  ILMB_ue <= microblaze_0_ilmb_UE;
  ILMB_wait <= microblaze_0_ilmb_WAIT;
  microblaze_0_Clk <= LMB_Clk;
  microblaze_0_LMB_Rst(0) <= LMB_Rst(0);
  microblaze_0_dlmb_ABUS(0 to 31) <= DLMB_abus(0 to 31);
  microblaze_0_dlmb_ADDRSTROBE <= DLMB_addrstrobe;
  microblaze_0_dlmb_BE(0 to 3) <= DLMB_be(0 to 3);
  microblaze_0_dlmb_READSTROBE <= DLMB_readstrobe;
  microblaze_0_dlmb_WRITEDBUS(0 to 31) <= DLMB_writedbus(0 to 31);
  microblaze_0_dlmb_WRITESTROBE <= DLMB_writestrobe;
  microblaze_0_ilmb_ABUS(0 to 31) <= ILMB_abus(0 to 31);
  microblaze_0_ilmb_ADDRSTROBE <= ILMB_addrstrobe;
  microblaze_0_ilmb_READSTROBE <= ILMB_readstrobe;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
dlmb_bram_if_cntlr: component mysystem2_dlmb_bram_if_cntlr_0
    port map (
      BRAM_Addr_A(0 to 31) => microblaze_0_dlmb_cntlr_ADDR(0 to 31),
      BRAM_Clk_A => microblaze_0_dlmb_cntlr_CLK,
      BRAM_Din_A(0) => microblaze_0_dlmb_cntlr_DOUT(31),
      BRAM_Din_A(1) => microblaze_0_dlmb_cntlr_DOUT(30),
      BRAM_Din_A(2) => microblaze_0_dlmb_cntlr_DOUT(29),
      BRAM_Din_A(3) => microblaze_0_dlmb_cntlr_DOUT(28),
      BRAM_Din_A(4) => microblaze_0_dlmb_cntlr_DOUT(27),
      BRAM_Din_A(5) => microblaze_0_dlmb_cntlr_DOUT(26),
      BRAM_Din_A(6) => microblaze_0_dlmb_cntlr_DOUT(25),
      BRAM_Din_A(7) => microblaze_0_dlmb_cntlr_DOUT(24),
      BRAM_Din_A(8) => microblaze_0_dlmb_cntlr_DOUT(23),
      BRAM_Din_A(9) => microblaze_0_dlmb_cntlr_DOUT(22),
      BRAM_Din_A(10) => microblaze_0_dlmb_cntlr_DOUT(21),
      BRAM_Din_A(11) => microblaze_0_dlmb_cntlr_DOUT(20),
      BRAM_Din_A(12) => microblaze_0_dlmb_cntlr_DOUT(19),
      BRAM_Din_A(13) => microblaze_0_dlmb_cntlr_DOUT(18),
      BRAM_Din_A(14) => microblaze_0_dlmb_cntlr_DOUT(17),
      BRAM_Din_A(15) => microblaze_0_dlmb_cntlr_DOUT(16),
      BRAM_Din_A(16) => microblaze_0_dlmb_cntlr_DOUT(15),
      BRAM_Din_A(17) => microblaze_0_dlmb_cntlr_DOUT(14),
      BRAM_Din_A(18) => microblaze_0_dlmb_cntlr_DOUT(13),
      BRAM_Din_A(19) => microblaze_0_dlmb_cntlr_DOUT(12),
      BRAM_Din_A(20) => microblaze_0_dlmb_cntlr_DOUT(11),
      BRAM_Din_A(21) => microblaze_0_dlmb_cntlr_DOUT(10),
      BRAM_Din_A(22) => microblaze_0_dlmb_cntlr_DOUT(9),
      BRAM_Din_A(23) => microblaze_0_dlmb_cntlr_DOUT(8),
      BRAM_Din_A(24) => microblaze_0_dlmb_cntlr_DOUT(7),
      BRAM_Din_A(25) => microblaze_0_dlmb_cntlr_DOUT(6),
      BRAM_Din_A(26) => microblaze_0_dlmb_cntlr_DOUT(5),
      BRAM_Din_A(27) => microblaze_0_dlmb_cntlr_DOUT(4),
      BRAM_Din_A(28) => microblaze_0_dlmb_cntlr_DOUT(3),
      BRAM_Din_A(29) => microblaze_0_dlmb_cntlr_DOUT(2),
      BRAM_Din_A(30) => microblaze_0_dlmb_cntlr_DOUT(1),
      BRAM_Din_A(31) => microblaze_0_dlmb_cntlr_DOUT(0),
      BRAM_Dout_A(0 to 31) => microblaze_0_dlmb_cntlr_DIN(0 to 31),
      BRAM_EN_A => microblaze_0_dlmb_cntlr_EN,
      BRAM_Rst_A => microblaze_0_dlmb_cntlr_RST,
      BRAM_WEN_A(0 to 3) => microblaze_0_dlmb_cntlr_WE(0 to 3),
      LMB_ABus(0 to 31) => microblaze_0_dlmb_bus_ABUS(0 to 31),
      LMB_AddrStrobe => microblaze_0_dlmb_bus_ADDRSTROBE,
      LMB_BE(0 to 3) => microblaze_0_dlmb_bus_BE(0 to 3),
      LMB_Clk => microblaze_0_Clk,
      LMB_ReadStrobe => microblaze_0_dlmb_bus_READSTROBE,
      LMB_Rst => microblaze_0_LMB_Rst(0),
      LMB_WriteDBus(0 to 31) => microblaze_0_dlmb_bus_WRITEDBUS(0 to 31),
      LMB_WriteStrobe => microblaze_0_dlmb_bus_WRITESTROBE,
      Sl_CE => microblaze_0_dlmb_bus_CE,
      Sl_DBus(0 to 31) => microblaze_0_dlmb_bus_READDBUS(0 to 31),
      Sl_Ready => microblaze_0_dlmb_bus_READY,
      Sl_UE => microblaze_0_dlmb_bus_UE,
      Sl_Wait => microblaze_0_dlmb_bus_WAIT
    );
dlmb_v10: component mysystem2_dlmb_v10_0
    port map (
      LMB_ABus(0 to 31) => microblaze_0_dlmb_bus_ABUS(0 to 31),
      LMB_AddrStrobe => microblaze_0_dlmb_bus_ADDRSTROBE,
      LMB_BE(0 to 3) => microblaze_0_dlmb_bus_BE(0 to 3),
      LMB_CE => microblaze_0_dlmb_CE,
      LMB_Clk => microblaze_0_Clk,
      LMB_ReadDBus(0 to 31) => microblaze_0_dlmb_READDBUS(0 to 31),
      LMB_ReadStrobe => microblaze_0_dlmb_bus_READSTROBE,
      LMB_Ready => microblaze_0_dlmb_READY,
      LMB_Rst => NLW_dlmb_v10_LMB_Rst_UNCONNECTED,
      LMB_UE => microblaze_0_dlmb_UE,
      LMB_Wait => microblaze_0_dlmb_WAIT,
      LMB_WriteDBus(0 to 31) => microblaze_0_dlmb_bus_WRITEDBUS(0 to 31),
      LMB_WriteStrobe => microblaze_0_dlmb_bus_WRITESTROBE,
      M_ABus(0 to 31) => microblaze_0_dlmb_ABUS(0 to 31),
      M_AddrStrobe => microblaze_0_dlmb_ADDRSTROBE,
      M_BE(0 to 3) => microblaze_0_dlmb_BE(0 to 3),
      M_DBus(0 to 31) => microblaze_0_dlmb_WRITEDBUS(0 to 31),
      M_ReadStrobe => microblaze_0_dlmb_READSTROBE,
      M_WriteStrobe => microblaze_0_dlmb_WRITESTROBE,
      SYS_Rst => microblaze_0_LMB_Rst(0),
      Sl_CE(0) => microblaze_0_dlmb_bus_CE,
      Sl_DBus(0 to 31) => microblaze_0_dlmb_bus_READDBUS(0 to 31),
      Sl_Ready(0) => microblaze_0_dlmb_bus_READY,
      Sl_UE(0) => microblaze_0_dlmb_bus_UE,
      Sl_Wait(0) => microblaze_0_dlmb_bus_WAIT
    );
ilmb_bram_if_cntlr: component mysystem2_ilmb_bram_if_cntlr_0
    port map (
      BRAM_Addr_A(0 to 31) => microblaze_0_ilmb_cntlr_ADDR(0 to 31),
      BRAM_Clk_A => microblaze_0_ilmb_cntlr_CLK,
      BRAM_Din_A(0) => microblaze_0_ilmb_cntlr_DOUT(31),
      BRAM_Din_A(1) => microblaze_0_ilmb_cntlr_DOUT(30),
      BRAM_Din_A(2) => microblaze_0_ilmb_cntlr_DOUT(29),
      BRAM_Din_A(3) => microblaze_0_ilmb_cntlr_DOUT(28),
      BRAM_Din_A(4) => microblaze_0_ilmb_cntlr_DOUT(27),
      BRAM_Din_A(5) => microblaze_0_ilmb_cntlr_DOUT(26),
      BRAM_Din_A(6) => microblaze_0_ilmb_cntlr_DOUT(25),
      BRAM_Din_A(7) => microblaze_0_ilmb_cntlr_DOUT(24),
      BRAM_Din_A(8) => microblaze_0_ilmb_cntlr_DOUT(23),
      BRAM_Din_A(9) => microblaze_0_ilmb_cntlr_DOUT(22),
      BRAM_Din_A(10) => microblaze_0_ilmb_cntlr_DOUT(21),
      BRAM_Din_A(11) => microblaze_0_ilmb_cntlr_DOUT(20),
      BRAM_Din_A(12) => microblaze_0_ilmb_cntlr_DOUT(19),
      BRAM_Din_A(13) => microblaze_0_ilmb_cntlr_DOUT(18),
      BRAM_Din_A(14) => microblaze_0_ilmb_cntlr_DOUT(17),
      BRAM_Din_A(15) => microblaze_0_ilmb_cntlr_DOUT(16),
      BRAM_Din_A(16) => microblaze_0_ilmb_cntlr_DOUT(15),
      BRAM_Din_A(17) => microblaze_0_ilmb_cntlr_DOUT(14),
      BRAM_Din_A(18) => microblaze_0_ilmb_cntlr_DOUT(13),
      BRAM_Din_A(19) => microblaze_0_ilmb_cntlr_DOUT(12),
      BRAM_Din_A(20) => microblaze_0_ilmb_cntlr_DOUT(11),
      BRAM_Din_A(21) => microblaze_0_ilmb_cntlr_DOUT(10),
      BRAM_Din_A(22) => microblaze_0_ilmb_cntlr_DOUT(9),
      BRAM_Din_A(23) => microblaze_0_ilmb_cntlr_DOUT(8),
      BRAM_Din_A(24) => microblaze_0_ilmb_cntlr_DOUT(7),
      BRAM_Din_A(25) => microblaze_0_ilmb_cntlr_DOUT(6),
      BRAM_Din_A(26) => microblaze_0_ilmb_cntlr_DOUT(5),
      BRAM_Din_A(27) => microblaze_0_ilmb_cntlr_DOUT(4),
      BRAM_Din_A(28) => microblaze_0_ilmb_cntlr_DOUT(3),
      BRAM_Din_A(29) => microblaze_0_ilmb_cntlr_DOUT(2),
      BRAM_Din_A(30) => microblaze_0_ilmb_cntlr_DOUT(1),
      BRAM_Din_A(31) => microblaze_0_ilmb_cntlr_DOUT(0),
      BRAM_Dout_A(0 to 31) => microblaze_0_ilmb_cntlr_DIN(0 to 31),
      BRAM_EN_A => microblaze_0_ilmb_cntlr_EN,
      BRAM_Rst_A => microblaze_0_ilmb_cntlr_RST,
      BRAM_WEN_A(0 to 3) => microblaze_0_ilmb_cntlr_WE(0 to 3),
      LMB_ABus(0 to 31) => microblaze_0_ilmb_bus_ABUS(0 to 31),
      LMB_AddrStrobe => microblaze_0_ilmb_bus_ADDRSTROBE,
      LMB_BE(0 to 3) => microblaze_0_ilmb_bus_BE(0 to 3),
      LMB_Clk => microblaze_0_Clk,
      LMB_ReadStrobe => microblaze_0_ilmb_bus_READSTROBE,
      LMB_Rst => microblaze_0_LMB_Rst(0),
      LMB_WriteDBus(0 to 31) => microblaze_0_ilmb_bus_WRITEDBUS(0 to 31),
      LMB_WriteStrobe => microblaze_0_ilmb_bus_WRITESTROBE,
      Sl_CE => microblaze_0_ilmb_bus_CE,
      Sl_DBus(0 to 31) => microblaze_0_ilmb_bus_READDBUS(0 to 31),
      Sl_Ready => microblaze_0_ilmb_bus_READY,
      Sl_UE => microblaze_0_ilmb_bus_UE,
      Sl_Wait => microblaze_0_ilmb_bus_WAIT
    );
ilmb_v10: component mysystem2_ilmb_v10_0
    port map (
      LMB_ABus(0 to 31) => microblaze_0_ilmb_bus_ABUS(0 to 31),
      LMB_AddrStrobe => microblaze_0_ilmb_bus_ADDRSTROBE,
      LMB_BE(0 to 3) => microblaze_0_ilmb_bus_BE(0 to 3),
      LMB_CE => microblaze_0_ilmb_CE,
      LMB_Clk => microblaze_0_Clk,
      LMB_ReadDBus(0 to 31) => microblaze_0_ilmb_READDBUS(0 to 31),
      LMB_ReadStrobe => microblaze_0_ilmb_bus_READSTROBE,
      LMB_Ready => microblaze_0_ilmb_READY,
      LMB_Rst => NLW_ilmb_v10_LMB_Rst_UNCONNECTED,
      LMB_UE => microblaze_0_ilmb_UE,
      LMB_Wait => microblaze_0_ilmb_WAIT,
      LMB_WriteDBus(0 to 31) => microblaze_0_ilmb_bus_WRITEDBUS(0 to 31),
      LMB_WriteStrobe => microblaze_0_ilmb_bus_WRITESTROBE,
      M_ABus(0 to 31) => microblaze_0_ilmb_ABUS(0 to 31),
      M_AddrStrobe => microblaze_0_ilmb_ADDRSTROBE,
      M_BE(0) => GND_1,
      M_BE(1) => GND_1,
      M_BE(2) => GND_1,
      M_BE(3) => GND_1,
      M_DBus(0) => GND_1,
      M_DBus(1) => GND_1,
      M_DBus(2) => GND_1,
      M_DBus(3) => GND_1,
      M_DBus(4) => GND_1,
      M_DBus(5) => GND_1,
      M_DBus(6) => GND_1,
      M_DBus(7) => GND_1,
      M_DBus(8) => GND_1,
      M_DBus(9) => GND_1,
      M_DBus(10) => GND_1,
      M_DBus(11) => GND_1,
      M_DBus(12) => GND_1,
      M_DBus(13) => GND_1,
      M_DBus(14) => GND_1,
      M_DBus(15) => GND_1,
      M_DBus(16) => GND_1,
      M_DBus(17) => GND_1,
      M_DBus(18) => GND_1,
      M_DBus(19) => GND_1,
      M_DBus(20) => GND_1,
      M_DBus(21) => GND_1,
      M_DBus(22) => GND_1,
      M_DBus(23) => GND_1,
      M_DBus(24) => GND_1,
      M_DBus(25) => GND_1,
      M_DBus(26) => GND_1,
      M_DBus(27) => GND_1,
      M_DBus(28) => GND_1,
      M_DBus(29) => GND_1,
      M_DBus(30) => GND_1,
      M_DBus(31) => GND_1,
      M_ReadStrobe => microblaze_0_ilmb_READSTROBE,
      M_WriteStrobe => GND_1,
      SYS_Rst => microblaze_0_LMB_Rst(0),
      Sl_CE(0) => microblaze_0_ilmb_bus_CE,
      Sl_DBus(0 to 31) => microblaze_0_ilmb_bus_READDBUS(0 to 31),
      Sl_Ready(0) => microblaze_0_ilmb_bus_READY,
      Sl_UE(0) => microblaze_0_ilmb_bus_UE,
      Sl_Wait(0) => microblaze_0_ilmb_bus_WAIT
    );
lmb_bram: component mysystem2_lmb_bram_0
    port map (
      addra(31) => microblaze_0_dlmb_cntlr_ADDR(0),
      addra(30) => microblaze_0_dlmb_cntlr_ADDR(1),
      addra(29) => microblaze_0_dlmb_cntlr_ADDR(2),
      addra(28) => microblaze_0_dlmb_cntlr_ADDR(3),
      addra(27) => microblaze_0_dlmb_cntlr_ADDR(4),
      addra(26) => microblaze_0_dlmb_cntlr_ADDR(5),
      addra(25) => microblaze_0_dlmb_cntlr_ADDR(6),
      addra(24) => microblaze_0_dlmb_cntlr_ADDR(7),
      addra(23) => microblaze_0_dlmb_cntlr_ADDR(8),
      addra(22) => microblaze_0_dlmb_cntlr_ADDR(9),
      addra(21) => microblaze_0_dlmb_cntlr_ADDR(10),
      addra(20) => microblaze_0_dlmb_cntlr_ADDR(11),
      addra(19) => microblaze_0_dlmb_cntlr_ADDR(12),
      addra(18) => microblaze_0_dlmb_cntlr_ADDR(13),
      addra(17) => microblaze_0_dlmb_cntlr_ADDR(14),
      addra(16) => microblaze_0_dlmb_cntlr_ADDR(15),
      addra(15) => microblaze_0_dlmb_cntlr_ADDR(16),
      addra(14) => microblaze_0_dlmb_cntlr_ADDR(17),
      addra(13) => microblaze_0_dlmb_cntlr_ADDR(18),
      addra(12) => microblaze_0_dlmb_cntlr_ADDR(19),
      addra(11) => microblaze_0_dlmb_cntlr_ADDR(20),
      addra(10) => microblaze_0_dlmb_cntlr_ADDR(21),
      addra(9) => microblaze_0_dlmb_cntlr_ADDR(22),
      addra(8) => microblaze_0_dlmb_cntlr_ADDR(23),
      addra(7) => microblaze_0_dlmb_cntlr_ADDR(24),
      addra(6) => microblaze_0_dlmb_cntlr_ADDR(25),
      addra(5) => microblaze_0_dlmb_cntlr_ADDR(26),
      addra(4) => microblaze_0_dlmb_cntlr_ADDR(27),
      addra(3) => microblaze_0_dlmb_cntlr_ADDR(28),
      addra(2) => microblaze_0_dlmb_cntlr_ADDR(29),
      addra(1) => microblaze_0_dlmb_cntlr_ADDR(30),
      addra(0) => microblaze_0_dlmb_cntlr_ADDR(31),
      addrb(31) => microblaze_0_ilmb_cntlr_ADDR(0),
      addrb(30) => microblaze_0_ilmb_cntlr_ADDR(1),
      addrb(29) => microblaze_0_ilmb_cntlr_ADDR(2),
      addrb(28) => microblaze_0_ilmb_cntlr_ADDR(3),
      addrb(27) => microblaze_0_ilmb_cntlr_ADDR(4),
      addrb(26) => microblaze_0_ilmb_cntlr_ADDR(5),
      addrb(25) => microblaze_0_ilmb_cntlr_ADDR(6),
      addrb(24) => microblaze_0_ilmb_cntlr_ADDR(7),
      addrb(23) => microblaze_0_ilmb_cntlr_ADDR(8),
      addrb(22) => microblaze_0_ilmb_cntlr_ADDR(9),
      addrb(21) => microblaze_0_ilmb_cntlr_ADDR(10),
      addrb(20) => microblaze_0_ilmb_cntlr_ADDR(11),
      addrb(19) => microblaze_0_ilmb_cntlr_ADDR(12),
      addrb(18) => microblaze_0_ilmb_cntlr_ADDR(13),
      addrb(17) => microblaze_0_ilmb_cntlr_ADDR(14),
      addrb(16) => microblaze_0_ilmb_cntlr_ADDR(15),
      addrb(15) => microblaze_0_ilmb_cntlr_ADDR(16),
      addrb(14) => microblaze_0_ilmb_cntlr_ADDR(17),
      addrb(13) => microblaze_0_ilmb_cntlr_ADDR(18),
      addrb(12) => microblaze_0_ilmb_cntlr_ADDR(19),
      addrb(11) => microblaze_0_ilmb_cntlr_ADDR(20),
      addrb(10) => microblaze_0_ilmb_cntlr_ADDR(21),
      addrb(9) => microblaze_0_ilmb_cntlr_ADDR(22),
      addrb(8) => microblaze_0_ilmb_cntlr_ADDR(23),
      addrb(7) => microblaze_0_ilmb_cntlr_ADDR(24),
      addrb(6) => microblaze_0_ilmb_cntlr_ADDR(25),
      addrb(5) => microblaze_0_ilmb_cntlr_ADDR(26),
      addrb(4) => microblaze_0_ilmb_cntlr_ADDR(27),
      addrb(3) => microblaze_0_ilmb_cntlr_ADDR(28),
      addrb(2) => microblaze_0_ilmb_cntlr_ADDR(29),
      addrb(1) => microblaze_0_ilmb_cntlr_ADDR(30),
      addrb(0) => microblaze_0_ilmb_cntlr_ADDR(31),
      clka => microblaze_0_dlmb_cntlr_CLK,
      clkb => microblaze_0_ilmb_cntlr_CLK,
      dina(31) => microblaze_0_dlmb_cntlr_DIN(0),
      dina(30) => microblaze_0_dlmb_cntlr_DIN(1),
      dina(29) => microblaze_0_dlmb_cntlr_DIN(2),
      dina(28) => microblaze_0_dlmb_cntlr_DIN(3),
      dina(27) => microblaze_0_dlmb_cntlr_DIN(4),
      dina(26) => microblaze_0_dlmb_cntlr_DIN(5),
      dina(25) => microblaze_0_dlmb_cntlr_DIN(6),
      dina(24) => microblaze_0_dlmb_cntlr_DIN(7),
      dina(23) => microblaze_0_dlmb_cntlr_DIN(8),
      dina(22) => microblaze_0_dlmb_cntlr_DIN(9),
      dina(21) => microblaze_0_dlmb_cntlr_DIN(10),
      dina(20) => microblaze_0_dlmb_cntlr_DIN(11),
      dina(19) => microblaze_0_dlmb_cntlr_DIN(12),
      dina(18) => microblaze_0_dlmb_cntlr_DIN(13),
      dina(17) => microblaze_0_dlmb_cntlr_DIN(14),
      dina(16) => microblaze_0_dlmb_cntlr_DIN(15),
      dina(15) => microblaze_0_dlmb_cntlr_DIN(16),
      dina(14) => microblaze_0_dlmb_cntlr_DIN(17),
      dina(13) => microblaze_0_dlmb_cntlr_DIN(18),
      dina(12) => microblaze_0_dlmb_cntlr_DIN(19),
      dina(11) => microblaze_0_dlmb_cntlr_DIN(20),
      dina(10) => microblaze_0_dlmb_cntlr_DIN(21),
      dina(9) => microblaze_0_dlmb_cntlr_DIN(22),
      dina(8) => microblaze_0_dlmb_cntlr_DIN(23),
      dina(7) => microblaze_0_dlmb_cntlr_DIN(24),
      dina(6) => microblaze_0_dlmb_cntlr_DIN(25),
      dina(5) => microblaze_0_dlmb_cntlr_DIN(26),
      dina(4) => microblaze_0_dlmb_cntlr_DIN(27),
      dina(3) => microblaze_0_dlmb_cntlr_DIN(28),
      dina(2) => microblaze_0_dlmb_cntlr_DIN(29),
      dina(1) => microblaze_0_dlmb_cntlr_DIN(30),
      dina(0) => microblaze_0_dlmb_cntlr_DIN(31),
      dinb(31) => microblaze_0_ilmb_cntlr_DIN(0),
      dinb(30) => microblaze_0_ilmb_cntlr_DIN(1),
      dinb(29) => microblaze_0_ilmb_cntlr_DIN(2),
      dinb(28) => microblaze_0_ilmb_cntlr_DIN(3),
      dinb(27) => microblaze_0_ilmb_cntlr_DIN(4),
      dinb(26) => microblaze_0_ilmb_cntlr_DIN(5),
      dinb(25) => microblaze_0_ilmb_cntlr_DIN(6),
      dinb(24) => microblaze_0_ilmb_cntlr_DIN(7),
      dinb(23) => microblaze_0_ilmb_cntlr_DIN(8),
      dinb(22) => microblaze_0_ilmb_cntlr_DIN(9),
      dinb(21) => microblaze_0_ilmb_cntlr_DIN(10),
      dinb(20) => microblaze_0_ilmb_cntlr_DIN(11),
      dinb(19) => microblaze_0_ilmb_cntlr_DIN(12),
      dinb(18) => microblaze_0_ilmb_cntlr_DIN(13),
      dinb(17) => microblaze_0_ilmb_cntlr_DIN(14),
      dinb(16) => microblaze_0_ilmb_cntlr_DIN(15),
      dinb(15) => microblaze_0_ilmb_cntlr_DIN(16),
      dinb(14) => microblaze_0_ilmb_cntlr_DIN(17),
      dinb(13) => microblaze_0_ilmb_cntlr_DIN(18),
      dinb(12) => microblaze_0_ilmb_cntlr_DIN(19),
      dinb(11) => microblaze_0_ilmb_cntlr_DIN(20),
      dinb(10) => microblaze_0_ilmb_cntlr_DIN(21),
      dinb(9) => microblaze_0_ilmb_cntlr_DIN(22),
      dinb(8) => microblaze_0_ilmb_cntlr_DIN(23),
      dinb(7) => microblaze_0_ilmb_cntlr_DIN(24),
      dinb(6) => microblaze_0_ilmb_cntlr_DIN(25),
      dinb(5) => microblaze_0_ilmb_cntlr_DIN(26),
      dinb(4) => microblaze_0_ilmb_cntlr_DIN(27),
      dinb(3) => microblaze_0_ilmb_cntlr_DIN(28),
      dinb(2) => microblaze_0_ilmb_cntlr_DIN(29),
      dinb(1) => microblaze_0_ilmb_cntlr_DIN(30),
      dinb(0) => microblaze_0_ilmb_cntlr_DIN(31),
      douta(31 downto 0) => microblaze_0_dlmb_cntlr_DOUT(31 downto 0),
      doutb(31 downto 0) => microblaze_0_ilmb_cntlr_DOUT(31 downto 0),
      ena => microblaze_0_dlmb_cntlr_EN,
      enb => microblaze_0_ilmb_cntlr_EN,
      rsta => microblaze_0_dlmb_cntlr_RST,
      rstb => microblaze_0_ilmb_cntlr_RST,
      wea(3) => microblaze_0_dlmb_cntlr_WE(0),
      wea(2) => microblaze_0_dlmb_cntlr_WE(1),
      wea(1) => microblaze_0_dlmb_cntlr_WE(2),
      wea(0) => microblaze_0_dlmb_cntlr_WE(3),
      web(3) => microblaze_0_ilmb_cntlr_WE(0),
      web(2) => microblaze_0_ilmb_cntlr_WE(1),
      web(1) => microblaze_0_ilmb_cntlr_WE(2),
      web(0) => microblaze_0_ilmb_cntlr_WE(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1UZGTW6 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s00_couplers_imp_1UZGTW6;

architecture STRUCTURE of s00_couplers_imp_1UZGTW6 is
  signal s00_couplers_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= s00_couplers_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= s00_couplers_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= s00_couplers_to_s00_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= s00_couplers_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= s00_couplers_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= s00_couplers_to_s00_couplers_AWVALID(0);
  M_AXI_bready(0) <= s00_couplers_to_s00_couplers_BREADY(0);
  M_AXI_rready(0) <= s00_couplers_to_s00_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= s00_couplers_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= s00_couplers_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= s00_couplers_to_s00_couplers_WVALID(0);
  S_AXI_arready(0) <= s00_couplers_to_s00_couplers_ARREADY(0);
  S_AXI_awready(0) <= s00_couplers_to_s00_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_s00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= s00_couplers_to_s00_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_s00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= s00_couplers_to_s00_couplers_RVALID(0);
  S_AXI_wready(0) <= s00_couplers_to_s00_couplers_WREADY(0);
  s00_couplers_to_s00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_s00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_couplers_ARREADY(0) <= M_AXI_arready(0);
  s00_couplers_to_s00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  s00_couplers_to_s00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_s00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_s00_couplers_AWREADY(0) <= M_AXI_awready(0);
  s00_couplers_to_s00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  s00_couplers_to_s00_couplers_BREADY(0) <= S_AXI_bready(0);
  s00_couplers_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s00_couplers_to_s00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  s00_couplers_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s00_couplers_to_s00_couplers_RREADY(0) <= S_AXI_rready(0);
  s00_couplers_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_couplers_to_s00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  s00_couplers_to_s00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_s00_couplers_WREADY(0) <= M_AXI_wready(0);
  s00_couplers_to_s00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_s00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_CDJ06A is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_CDJ06A;

architecture STRUCTURE of s00_couplers_imp_CDJ06A is
  component mysystem2_auto_us_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component mysystem2_auto_us_0;
  signal GND_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal auto_us_to_s00_couplers_RLAST : STD_LOGIC;
  signal auto_us_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal auto_us_to_s00_couplers_WLAST : STD_LOGIC;
  signal auto_us_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_us_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_us_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_us_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_us_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_us_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_us_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_auto_us_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_us_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_us_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_us_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_us_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_us_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_us_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_us_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_us_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_us_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_auto_us_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_us_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_us_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_us_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_us_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_us_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_us_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_us_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_us_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_us_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_us_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_us_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_us_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_us_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_us_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_us_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_us_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_us_WVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_auto_us_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_us_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_us_to_s00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_us_to_s00_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_us_to_s00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= auto_us_to_s00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_us_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_us_to_s00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_us_to_s00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_us_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_us_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_us_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_us_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_us_to_s00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= auto_us_to_s00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_us_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_us_to_s00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_us_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_us_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_us_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_us_to_s00_couplers_RREADY;
  M_AXI_wdata(511 downto 0) <= auto_us_to_s00_couplers_WDATA(511 downto 0);
  M_AXI_wlast <= auto_us_to_s00_couplers_WLAST;
  M_AXI_wstrb(63 downto 0) <= auto_us_to_s00_couplers_WSTRB(63 downto 0);
  M_AXI_wvalid <= auto_us_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_arready <= s00_couplers_to_auto_us_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_us_AWREADY;
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_us_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_us_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_us_RDATA(31 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_us_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_us_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_us_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_us_WREADY;
  auto_us_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_us_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_us_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_us_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_us_to_s00_couplers_RDATA(511 downto 0) <= M_AXI_rdata(511 downto 0);
  auto_us_to_s00_couplers_RLAST <= M_AXI_rlast;
  auto_us_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_us_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_us_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_us_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_us_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_us_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_us_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_auto_us_ARLOCK(0) <= S_AXI_arlock(0);
  s00_couplers_to_auto_us_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_us_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_us_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_us_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_us_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_us_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_us_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_us_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_auto_us_AWLOCK(0) <= S_AXI_awlock(0);
  s00_couplers_to_auto_us_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_us_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_us_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_us_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_us_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_us_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_us_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_us_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_us_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_us_WVALID <= S_AXI_wvalid;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
auto_us: component mysystem2_auto_us_0
    port map (
      m_axi_araddr(31 downto 0) => auto_us_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_us_to_s00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_us_to_s00_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_us_to_s00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_us_to_s00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_us_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_us_to_s00_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_us_to_s00_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_auto_us_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_us_to_s00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_us_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_us_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_us_to_s00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_us_to_s00_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_us_to_s00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_us_to_s00_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_us_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_us_to_s00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_us_to_s00_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => NLW_auto_us_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_us_to_s00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_us_to_s00_couplers_AWVALID,
      m_axi_bready => auto_us_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_us_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_us_to_s00_couplers_BVALID,
      m_axi_rdata(511 downto 0) => auto_us_to_s00_couplers_RDATA(511 downto 0),
      m_axi_rlast => auto_us_to_s00_couplers_RLAST,
      m_axi_rready => auto_us_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_us_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_us_to_s00_couplers_RVALID,
      m_axi_wdata(511 downto 0) => auto_us_to_s00_couplers_WDATA(511 downto 0),
      m_axi_wlast => auto_us_to_s00_couplers_WLAST,
      m_axi_wready => auto_us_to_s00_couplers_WREADY,
      m_axi_wstrb(63 downto 0) => auto_us_to_s00_couplers_WSTRB(63 downto 0),
      m_axi_wvalid => auto_us_to_s00_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_us_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_us_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_us_ARCACHE(3 downto 0),
      s_axi_aresetn => S_ARESETN_1(0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_auto_us_ARLEN(7 downto 0),
      s_axi_arlock(0) => s00_couplers_to_auto_us_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_us_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_us_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_us_ARREADY,
      s_axi_arregion(3) => GND_1,
      s_axi_arregion(2) => GND_1,
      s_axi_arregion(1) => GND_1,
      s_axi_arregion(0) => GND_1,
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_us_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_us_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_us_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_us_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_us_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_auto_us_AWLEN(7 downto 0),
      s_axi_awlock(0) => s00_couplers_to_auto_us_AWLOCK(0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_us_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_us_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_us_AWREADY,
      s_axi_awregion(3) => GND_1,
      s_axi_awregion(2) => GND_1,
      s_axi_awregion(1) => GND_1,
      s_axi_awregion(0) => GND_1,
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_us_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_us_AWVALID,
      s_axi_bready => s00_couplers_to_auto_us_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_us_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_us_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_us_RDATA(31 downto 0),
      s_axi_rlast => s00_couplers_to_auto_us_RLAST,
      s_axi_rready => s00_couplers_to_auto_us_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_us_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_us_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_us_WDATA(31 downto 0),
      s_axi_wlast => s00_couplers_to_auto_us_WLAST,
      s_axi_wready => s00_couplers_to_auto_us_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_us_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_us_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s01_couplers_imp_1XRVWFU is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC
  );
end s01_couplers_imp_1XRVWFU;

architecture STRUCTURE of s01_couplers_imp_1XRVWFU is
  component mysystem2_auto_us_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component mysystem2_auto_us_1;
  signal GND_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s01_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s01_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s01_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s01_couplers_ARREADY : STD_LOGIC;
  signal auto_us_to_s01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s01_couplers_ARVALID : STD_LOGIC;
  signal auto_us_to_s01_couplers_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal auto_us_to_s01_couplers_RLAST : STD_LOGIC;
  signal auto_us_to_s01_couplers_RREADY : STD_LOGIC;
  signal auto_us_to_s01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s01_couplers_RVALID : STD_LOGIC;
  signal s01_couplers_to_auto_us_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_us_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_auto_us_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_auto_us_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_auto_us_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_auto_us_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_auto_us_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_auto_us_ARREADY : STD_LOGIC;
  signal s01_couplers_to_auto_us_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_auto_us_ARVALID : STD_LOGIC;
  signal s01_couplers_to_auto_us_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_us_RLAST : STD_LOGIC;
  signal s01_couplers_to_auto_us_RREADY : STD_LOGIC;
  signal s01_couplers_to_auto_us_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_auto_us_RVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_us_to_s01_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_us_to_s01_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_us_to_s01_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_us_to_s01_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= auto_us_to_s01_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_us_to_s01_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_us_to_s01_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_us_to_s01_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_us_to_s01_couplers_ARVALID;
  M_AXI_rready <= auto_us_to_s01_couplers_RREADY;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_arready <= s01_couplers_to_auto_us_ARREADY;
  S_AXI_rdata(31 downto 0) <= s01_couplers_to_auto_us_RDATA(31 downto 0);
  S_AXI_rlast <= s01_couplers_to_auto_us_RLAST;
  S_AXI_rresp(1 downto 0) <= s01_couplers_to_auto_us_RRESP(1 downto 0);
  S_AXI_rvalid <= s01_couplers_to_auto_us_RVALID;
  auto_us_to_s01_couplers_ARREADY <= M_AXI_arready;
  auto_us_to_s01_couplers_RDATA(511 downto 0) <= M_AXI_rdata(511 downto 0);
  auto_us_to_s01_couplers_RLAST <= M_AXI_rlast;
  auto_us_to_s01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_us_to_s01_couplers_RVALID <= M_AXI_rvalid;
  s01_couplers_to_auto_us_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s01_couplers_to_auto_us_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s01_couplers_to_auto_us_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s01_couplers_to_auto_us_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s01_couplers_to_auto_us_ARLOCK(0) <= S_AXI_arlock(0);
  s01_couplers_to_auto_us_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s01_couplers_to_auto_us_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s01_couplers_to_auto_us_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s01_couplers_to_auto_us_ARVALID <= S_AXI_arvalid;
  s01_couplers_to_auto_us_RREADY <= S_AXI_rready;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
auto_us: component mysystem2_auto_us_1
    port map (
      m_axi_araddr(31 downto 0) => auto_us_to_s01_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_us_to_s01_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_us_to_s01_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_us_to_s01_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_us_to_s01_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_us_to_s01_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_us_to_s01_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_us_to_s01_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_auto_us_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_us_to_s01_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_us_to_s01_couplers_ARVALID,
      m_axi_rdata(511 downto 0) => auto_us_to_s01_couplers_RDATA(511 downto 0),
      m_axi_rlast => auto_us_to_s01_couplers_RLAST,
      m_axi_rready => auto_us_to_s01_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_us_to_s01_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_us_to_s01_couplers_RVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => s01_couplers_to_auto_us_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s01_couplers_to_auto_us_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s01_couplers_to_auto_us_ARCACHE(3 downto 0),
      s_axi_aresetn => S_ARESETN_1(0),
      s_axi_arlen(7 downto 0) => s01_couplers_to_auto_us_ARLEN(7 downto 0),
      s_axi_arlock(0) => s01_couplers_to_auto_us_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s01_couplers_to_auto_us_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s01_couplers_to_auto_us_ARQOS(3 downto 0),
      s_axi_arready => s01_couplers_to_auto_us_ARREADY,
      s_axi_arregion(3) => GND_1,
      s_axi_arregion(2) => GND_1,
      s_axi_arregion(1) => GND_1,
      s_axi_arregion(0) => GND_1,
      s_axi_arsize(2 downto 0) => s01_couplers_to_auto_us_ARSIZE(2 downto 0),
      s_axi_arvalid => s01_couplers_to_auto_us_ARVALID,
      s_axi_rdata(31 downto 0) => s01_couplers_to_auto_us_RDATA(31 downto 0),
      s_axi_rlast => s01_couplers_to_auto_us_RLAST,
      s_axi_rready => s01_couplers_to_auto_us_RREADY,
      s_axi_rresp(1 downto 0) => s01_couplers_to_auto_us_RRESP(1 downto 0),
      s_axi_rvalid => s01_couplers_to_auto_us_RVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s02_couplers_imp_OGTF83 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s02_couplers_imp_OGTF83;

architecture STRUCTURE of s02_couplers_imp_OGTF83 is
  component mysystem2_auto_us_2 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC
  );
  end component mysystem2_auto_us_2;
  signal GND_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s02_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s02_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s02_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s02_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s02_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s02_couplers_AWREADY : STD_LOGIC;
  signal auto_us_to_s02_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s02_couplers_AWVALID : STD_LOGIC;
  signal auto_us_to_s02_couplers_BREADY : STD_LOGIC;
  signal auto_us_to_s02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s02_couplers_BVALID : STD_LOGIC;
  signal auto_us_to_s02_couplers_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal auto_us_to_s02_couplers_WLAST : STD_LOGIC;
  signal auto_us_to_s02_couplers_WREADY : STD_LOGIC;
  signal auto_us_to_s02_couplers_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_us_to_s02_couplers_WVALID : STD_LOGIC;
  signal s02_couplers_to_auto_us_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_auto_us_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_auto_us_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_auto_us_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s02_couplers_to_auto_us_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_auto_us_AWREADY : STD_LOGIC;
  signal s02_couplers_to_auto_us_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_auto_us_AWVALID : STD_LOGIC;
  signal s02_couplers_to_auto_us_BREADY : STD_LOGIC;
  signal s02_couplers_to_auto_us_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_auto_us_BVALID : STD_LOGIC;
  signal s02_couplers_to_auto_us_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_auto_us_WLAST : STD_LOGIC;
  signal s02_couplers_to_auto_us_WREADY : STD_LOGIC;
  signal s02_couplers_to_auto_us_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_auto_us_WVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_awaddr(31 downto 0) <= auto_us_to_s02_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_us_to_s02_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_us_to_s02_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_us_to_s02_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= auto_us_to_s02_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_us_to_s02_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_us_to_s02_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_us_to_s02_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_us_to_s02_couplers_AWVALID;
  M_AXI_bready <= auto_us_to_s02_couplers_BREADY;
  M_AXI_wdata(511 downto 0) <= auto_us_to_s02_couplers_WDATA(511 downto 0);
  M_AXI_wlast <= auto_us_to_s02_couplers_WLAST;
  M_AXI_wstrb(63 downto 0) <= auto_us_to_s02_couplers_WSTRB(63 downto 0);
  M_AXI_wvalid <= auto_us_to_s02_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_awready <= s02_couplers_to_auto_us_AWREADY;
  S_AXI_bresp(1 downto 0) <= s02_couplers_to_auto_us_BRESP(1 downto 0);
  S_AXI_bvalid <= s02_couplers_to_auto_us_BVALID;
  S_AXI_wready <= s02_couplers_to_auto_us_WREADY;
  auto_us_to_s02_couplers_AWREADY <= M_AXI_awready;
  auto_us_to_s02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_us_to_s02_couplers_BVALID <= M_AXI_bvalid;
  auto_us_to_s02_couplers_WREADY <= M_AXI_wready;
  s02_couplers_to_auto_us_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s02_couplers_to_auto_us_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s02_couplers_to_auto_us_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s02_couplers_to_auto_us_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s02_couplers_to_auto_us_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s02_couplers_to_auto_us_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s02_couplers_to_auto_us_AWVALID <= S_AXI_awvalid;
  s02_couplers_to_auto_us_BREADY <= S_AXI_bready;
  s02_couplers_to_auto_us_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s02_couplers_to_auto_us_WLAST <= S_AXI_wlast;
  s02_couplers_to_auto_us_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s02_couplers_to_auto_us_WVALID <= S_AXI_wvalid;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
auto_us: component mysystem2_auto_us_2
    port map (
      m_axi_awaddr(31 downto 0) => auto_us_to_s02_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_us_to_s02_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_us_to_s02_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_us_to_s02_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_us_to_s02_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_us_to_s02_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_us_to_s02_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_us_to_s02_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => NLW_auto_us_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_us_to_s02_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_us_to_s02_couplers_AWVALID,
      m_axi_bready => auto_us_to_s02_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_us_to_s02_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_us_to_s02_couplers_BVALID,
      m_axi_wdata(511 downto 0) => auto_us_to_s02_couplers_WDATA(511 downto 0),
      m_axi_wlast => auto_us_to_s02_couplers_WLAST,
      m_axi_wready => auto_us_to_s02_couplers_WREADY,
      m_axi_wstrb(63 downto 0) => auto_us_to_s02_couplers_WSTRB(63 downto 0),
      m_axi_wvalid => auto_us_to_s02_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_aresetn => S_ARESETN_1(0),
      s_axi_awaddr(31 downto 0) => s02_couplers_to_auto_us_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s02_couplers_to_auto_us_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s02_couplers_to_auto_us_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => s02_couplers_to_auto_us_AWLEN(7 downto 0),
      s_axi_awlock(0) => GND_1,
      s_axi_awprot(2 downto 0) => s02_couplers_to_auto_us_AWPROT(2 downto 0),
      s_axi_awqos(3) => GND_1,
      s_axi_awqos(2) => GND_1,
      s_axi_awqos(1) => GND_1,
      s_axi_awqos(0) => GND_1,
      s_axi_awready => s02_couplers_to_auto_us_AWREADY,
      s_axi_awregion(3) => GND_1,
      s_axi_awregion(2) => GND_1,
      s_axi_awregion(1) => GND_1,
      s_axi_awregion(0) => GND_1,
      s_axi_awsize(2 downto 0) => s02_couplers_to_auto_us_AWSIZE(2 downto 0),
      s_axi_awvalid => s02_couplers_to_auto_us_AWVALID,
      s_axi_bready => s02_couplers_to_auto_us_BREADY,
      s_axi_bresp(1 downto 0) => s02_couplers_to_auto_us_BRESP(1 downto 0),
      s_axi_bvalid => s02_couplers_to_auto_us_BVALID,
      s_axi_wdata(31 downto 0) => s02_couplers_to_auto_us_WDATA(31 downto 0),
      s_axi_wlast => s02_couplers_to_auto_us_WLAST,
      s_axi_wready => s02_couplers_to_auto_us_WREADY,
      s_axi_wstrb(3 downto 0) => s02_couplers_to_auto_us_WSTRB(3 downto 0),
      s_axi_wvalid => s02_couplers_to_auto_us_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s03_couplers_imp_13WDQ8B is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s03_couplers_imp_13WDQ8B;

architecture STRUCTURE of s03_couplers_imp_13WDQ8B is
  component mysystem2_auto_us_3 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC
  );
  end component mysystem2_auto_us_3;
  signal GND_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s03_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s03_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s03_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s03_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s03_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s03_couplers_AWREADY : STD_LOGIC;
  signal auto_us_to_s03_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s03_couplers_AWVALID : STD_LOGIC;
  signal auto_us_to_s03_couplers_BREADY : STD_LOGIC;
  signal auto_us_to_s03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s03_couplers_BVALID : STD_LOGIC;
  signal auto_us_to_s03_couplers_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal auto_us_to_s03_couplers_WLAST : STD_LOGIC;
  signal auto_us_to_s03_couplers_WREADY : STD_LOGIC;
  signal auto_us_to_s03_couplers_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_us_to_s03_couplers_WVALID : STD_LOGIC;
  signal s03_couplers_to_auto_us_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s03_couplers_to_auto_us_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s03_couplers_to_auto_us_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_auto_us_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s03_couplers_to_auto_us_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_auto_us_AWREADY : STD_LOGIC;
  signal s03_couplers_to_auto_us_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_auto_us_AWVALID : STD_LOGIC;
  signal s03_couplers_to_auto_us_BREADY : STD_LOGIC;
  signal s03_couplers_to_auto_us_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s03_couplers_to_auto_us_BVALID : STD_LOGIC;
  signal s03_couplers_to_auto_us_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s03_couplers_to_auto_us_WLAST : STD_LOGIC;
  signal s03_couplers_to_auto_us_WREADY : STD_LOGIC;
  signal s03_couplers_to_auto_us_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_auto_us_WVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_awaddr(31 downto 0) <= auto_us_to_s03_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_us_to_s03_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_us_to_s03_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_us_to_s03_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= auto_us_to_s03_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_us_to_s03_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_us_to_s03_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_us_to_s03_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_us_to_s03_couplers_AWVALID;
  M_AXI_bready <= auto_us_to_s03_couplers_BREADY;
  M_AXI_wdata(511 downto 0) <= auto_us_to_s03_couplers_WDATA(511 downto 0);
  M_AXI_wlast <= auto_us_to_s03_couplers_WLAST;
  M_AXI_wstrb(63 downto 0) <= auto_us_to_s03_couplers_WSTRB(63 downto 0);
  M_AXI_wvalid <= auto_us_to_s03_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_awready <= s03_couplers_to_auto_us_AWREADY;
  S_AXI_bresp(1 downto 0) <= s03_couplers_to_auto_us_BRESP(1 downto 0);
  S_AXI_bvalid <= s03_couplers_to_auto_us_BVALID;
  S_AXI_wready <= s03_couplers_to_auto_us_WREADY;
  auto_us_to_s03_couplers_AWREADY <= M_AXI_awready;
  auto_us_to_s03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_us_to_s03_couplers_BVALID <= M_AXI_bvalid;
  auto_us_to_s03_couplers_WREADY <= M_AXI_wready;
  s03_couplers_to_auto_us_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s03_couplers_to_auto_us_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s03_couplers_to_auto_us_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s03_couplers_to_auto_us_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s03_couplers_to_auto_us_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s03_couplers_to_auto_us_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s03_couplers_to_auto_us_AWVALID <= S_AXI_awvalid;
  s03_couplers_to_auto_us_BREADY <= S_AXI_bready;
  s03_couplers_to_auto_us_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s03_couplers_to_auto_us_WLAST <= S_AXI_wlast;
  s03_couplers_to_auto_us_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s03_couplers_to_auto_us_WVALID <= S_AXI_wvalid;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
auto_us: component mysystem2_auto_us_3
    port map (
      m_axi_awaddr(31 downto 0) => auto_us_to_s03_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_us_to_s03_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_us_to_s03_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_us_to_s03_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_us_to_s03_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_us_to_s03_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_us_to_s03_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_us_to_s03_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => NLW_auto_us_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_us_to_s03_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_us_to_s03_couplers_AWVALID,
      m_axi_bready => auto_us_to_s03_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_us_to_s03_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_us_to_s03_couplers_BVALID,
      m_axi_wdata(511 downto 0) => auto_us_to_s03_couplers_WDATA(511 downto 0),
      m_axi_wlast => auto_us_to_s03_couplers_WLAST,
      m_axi_wready => auto_us_to_s03_couplers_WREADY,
      m_axi_wstrb(63 downto 0) => auto_us_to_s03_couplers_WSTRB(63 downto 0),
      m_axi_wvalid => auto_us_to_s03_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_aresetn => S_ARESETN_1(0),
      s_axi_awaddr(31 downto 0) => s03_couplers_to_auto_us_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s03_couplers_to_auto_us_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s03_couplers_to_auto_us_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => s03_couplers_to_auto_us_AWLEN(7 downto 0),
      s_axi_awlock(0) => GND_1,
      s_axi_awprot(2 downto 0) => s03_couplers_to_auto_us_AWPROT(2 downto 0),
      s_axi_awqos(3) => GND_1,
      s_axi_awqos(2) => GND_1,
      s_axi_awqos(1) => GND_1,
      s_axi_awqos(0) => GND_1,
      s_axi_awready => s03_couplers_to_auto_us_AWREADY,
      s_axi_awregion(3) => GND_1,
      s_axi_awregion(2) => GND_1,
      s_axi_awregion(1) => GND_1,
      s_axi_awregion(0) => GND_1,
      s_axi_awsize(2 downto 0) => s03_couplers_to_auto_us_AWSIZE(2 downto 0),
      s_axi_awvalid => s03_couplers_to_auto_us_AWVALID,
      s_axi_bready => s03_couplers_to_auto_us_BREADY,
      s_axi_bresp(1 downto 0) => s03_couplers_to_auto_us_BRESP(1 downto 0),
      s_axi_bvalid => s03_couplers_to_auto_us_BVALID,
      s_axi_wdata(31 downto 0) => s03_couplers_to_auto_us_WDATA(31 downto 0),
      s_axi_wlast => s03_couplers_to_auto_us_WLAST,
      s_axi_wready => s03_couplers_to_auto_us_WREADY,
      s_axi_wstrb(3 downto 0) => s03_couplers_to_auto_us_WSTRB(3 downto 0),
      s_axi_wvalid => s03_couplers_to_auto_us_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s04_couplers_imp_1IX8IM8 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC
  );
end s04_couplers_imp_1IX8IM8;

architecture STRUCTURE of s04_couplers_imp_1IX8IM8 is
  component mysystem2_auto_us_4 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component mysystem2_auto_us_4;
  signal GND_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s04_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s04_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s04_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s04_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s04_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s04_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s04_couplers_ARREADY : STD_LOGIC;
  signal auto_us_to_s04_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s04_couplers_ARVALID : STD_LOGIC;
  signal auto_us_to_s04_couplers_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal auto_us_to_s04_couplers_RLAST : STD_LOGIC;
  signal auto_us_to_s04_couplers_RREADY : STD_LOGIC;
  signal auto_us_to_s04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s04_couplers_RVALID : STD_LOGIC;
  signal s04_couplers_to_auto_us_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s04_couplers_to_auto_us_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s04_couplers_to_auto_us_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s04_couplers_to_auto_us_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s04_couplers_to_auto_us_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s04_couplers_to_auto_us_ARREADY : STD_LOGIC;
  signal s04_couplers_to_auto_us_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s04_couplers_to_auto_us_ARVALID : STD_LOGIC;
  signal s04_couplers_to_auto_us_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s04_couplers_to_auto_us_RLAST : STD_LOGIC;
  signal s04_couplers_to_auto_us_RREADY : STD_LOGIC;
  signal s04_couplers_to_auto_us_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s04_couplers_to_auto_us_RVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_us_to_s04_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_us_to_s04_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_us_to_s04_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_us_to_s04_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= auto_us_to_s04_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_us_to_s04_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_us_to_s04_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_us_to_s04_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_us_to_s04_couplers_ARVALID;
  M_AXI_rready <= auto_us_to_s04_couplers_RREADY;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_arready <= s04_couplers_to_auto_us_ARREADY;
  S_AXI_rdata(31 downto 0) <= s04_couplers_to_auto_us_RDATA(31 downto 0);
  S_AXI_rlast <= s04_couplers_to_auto_us_RLAST;
  S_AXI_rresp(1 downto 0) <= s04_couplers_to_auto_us_RRESP(1 downto 0);
  S_AXI_rvalid <= s04_couplers_to_auto_us_RVALID;
  auto_us_to_s04_couplers_ARREADY <= M_AXI_arready;
  auto_us_to_s04_couplers_RDATA(511 downto 0) <= M_AXI_rdata(511 downto 0);
  auto_us_to_s04_couplers_RLAST <= M_AXI_rlast;
  auto_us_to_s04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_us_to_s04_couplers_RVALID <= M_AXI_rvalid;
  s04_couplers_to_auto_us_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s04_couplers_to_auto_us_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s04_couplers_to_auto_us_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s04_couplers_to_auto_us_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s04_couplers_to_auto_us_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s04_couplers_to_auto_us_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s04_couplers_to_auto_us_ARVALID <= S_AXI_arvalid;
  s04_couplers_to_auto_us_RREADY <= S_AXI_rready;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
auto_us: component mysystem2_auto_us_4
    port map (
      m_axi_araddr(31 downto 0) => auto_us_to_s04_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_us_to_s04_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_us_to_s04_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_us_to_s04_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_us_to_s04_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_us_to_s04_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_us_to_s04_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_us_to_s04_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_auto_us_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_us_to_s04_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_us_to_s04_couplers_ARVALID,
      m_axi_rdata(511 downto 0) => auto_us_to_s04_couplers_RDATA(511 downto 0),
      m_axi_rlast => auto_us_to_s04_couplers_RLAST,
      m_axi_rready => auto_us_to_s04_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_us_to_s04_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_us_to_s04_couplers_RVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => s04_couplers_to_auto_us_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s04_couplers_to_auto_us_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s04_couplers_to_auto_us_ARCACHE(3 downto 0),
      s_axi_aresetn => S_ARESETN_1(0),
      s_axi_arlen(7 downto 0) => s04_couplers_to_auto_us_ARLEN(7 downto 0),
      s_axi_arlock(0) => GND_1,
      s_axi_arprot(2 downto 0) => s04_couplers_to_auto_us_ARPROT(2 downto 0),
      s_axi_arqos(3) => GND_1,
      s_axi_arqos(2) => GND_1,
      s_axi_arqos(1) => GND_1,
      s_axi_arqos(0) => GND_1,
      s_axi_arready => s04_couplers_to_auto_us_ARREADY,
      s_axi_arregion(3) => GND_1,
      s_axi_arregion(2) => GND_1,
      s_axi_arregion(1) => GND_1,
      s_axi_arregion(0) => GND_1,
      s_axi_arsize(2 downto 0) => s04_couplers_to_auto_us_ARSIZE(2 downto 0),
      s_axi_arvalid => s04_couplers_to_auto_us_ARVALID,
      s_axi_rdata(31 downto 0) => s04_couplers_to_auto_us_RDATA(31 downto 0),
      s_axi_rlast => s04_couplers_to_auto_us_RLAST,
      s_axi_rready => s04_couplers_to_auto_us_RREADY,
      s_axi_rresp(1 downto 0) => s04_couplers_to_auto_us_RRESP(1 downto 0),
      s_axi_rvalid => s04_couplers_to_auto_us_RVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s05_couplers_imp_50GG0O is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC
  );
end s05_couplers_imp_50GG0O;

architecture STRUCTURE of s05_couplers_imp_50GG0O is
  component mysystem2_auto_us_5 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component mysystem2_auto_us_5;
  signal GND_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s05_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s05_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s05_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s05_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s05_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s05_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s05_couplers_ARREADY : STD_LOGIC;
  signal auto_us_to_s05_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s05_couplers_ARVALID : STD_LOGIC;
  signal auto_us_to_s05_couplers_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal auto_us_to_s05_couplers_RLAST : STD_LOGIC;
  signal auto_us_to_s05_couplers_RREADY : STD_LOGIC;
  signal auto_us_to_s05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s05_couplers_RVALID : STD_LOGIC;
  signal s05_couplers_to_auto_us_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s05_couplers_to_auto_us_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s05_couplers_to_auto_us_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s05_couplers_to_auto_us_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s05_couplers_to_auto_us_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s05_couplers_to_auto_us_ARREADY : STD_LOGIC;
  signal s05_couplers_to_auto_us_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s05_couplers_to_auto_us_ARVALID : STD_LOGIC;
  signal s05_couplers_to_auto_us_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s05_couplers_to_auto_us_RLAST : STD_LOGIC;
  signal s05_couplers_to_auto_us_RREADY : STD_LOGIC;
  signal s05_couplers_to_auto_us_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s05_couplers_to_auto_us_RVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_us_to_s05_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_us_to_s05_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_us_to_s05_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_us_to_s05_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= auto_us_to_s05_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_us_to_s05_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_us_to_s05_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_us_to_s05_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_us_to_s05_couplers_ARVALID;
  M_AXI_rready <= auto_us_to_s05_couplers_RREADY;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_arready <= s05_couplers_to_auto_us_ARREADY;
  S_AXI_rdata(31 downto 0) <= s05_couplers_to_auto_us_RDATA(31 downto 0);
  S_AXI_rlast <= s05_couplers_to_auto_us_RLAST;
  S_AXI_rresp(1 downto 0) <= s05_couplers_to_auto_us_RRESP(1 downto 0);
  S_AXI_rvalid <= s05_couplers_to_auto_us_RVALID;
  auto_us_to_s05_couplers_ARREADY <= M_AXI_arready;
  auto_us_to_s05_couplers_RDATA(511 downto 0) <= M_AXI_rdata(511 downto 0);
  auto_us_to_s05_couplers_RLAST <= M_AXI_rlast;
  auto_us_to_s05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_us_to_s05_couplers_RVALID <= M_AXI_rvalid;
  s05_couplers_to_auto_us_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s05_couplers_to_auto_us_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s05_couplers_to_auto_us_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s05_couplers_to_auto_us_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s05_couplers_to_auto_us_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s05_couplers_to_auto_us_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s05_couplers_to_auto_us_ARVALID <= S_AXI_arvalid;
  s05_couplers_to_auto_us_RREADY <= S_AXI_rready;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
auto_us: component mysystem2_auto_us_5
    port map (
      m_axi_araddr(31 downto 0) => auto_us_to_s05_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_us_to_s05_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_us_to_s05_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_us_to_s05_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_us_to_s05_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_us_to_s05_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_us_to_s05_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_us_to_s05_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_auto_us_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_us_to_s05_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_us_to_s05_couplers_ARVALID,
      m_axi_rdata(511 downto 0) => auto_us_to_s05_couplers_RDATA(511 downto 0),
      m_axi_rlast => auto_us_to_s05_couplers_RLAST,
      m_axi_rready => auto_us_to_s05_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_us_to_s05_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_us_to_s05_couplers_RVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => s05_couplers_to_auto_us_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s05_couplers_to_auto_us_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s05_couplers_to_auto_us_ARCACHE(3 downto 0),
      s_axi_aresetn => S_ARESETN_1(0),
      s_axi_arlen(7 downto 0) => s05_couplers_to_auto_us_ARLEN(7 downto 0),
      s_axi_arlock(0) => GND_1,
      s_axi_arprot(2 downto 0) => s05_couplers_to_auto_us_ARPROT(2 downto 0),
      s_axi_arqos(3) => GND_1,
      s_axi_arqos(2) => GND_1,
      s_axi_arqos(1) => GND_1,
      s_axi_arqos(0) => GND_1,
      s_axi_arready => s05_couplers_to_auto_us_ARREADY,
      s_axi_arregion(3) => GND_1,
      s_axi_arregion(2) => GND_1,
      s_axi_arregion(1) => GND_1,
      s_axi_arregion(0) => GND_1,
      s_axi_arsize(2 downto 0) => s05_couplers_to_auto_us_ARSIZE(2 downto 0),
      s_axi_arvalid => s05_couplers_to_auto_us_ARVALID,
      s_axi_rdata(31 downto 0) => s05_couplers_to_auto_us_RDATA(31 downto 0),
      s_axi_rlast => s05_couplers_to_auto_us_RLAST,
      s_axi_rready => s05_couplers_to_auto_us_RREADY,
      s_axi_rresp(1 downto 0) => s05_couplers_to_auto_us_RRESP(1 downto 0),
      s_axi_rvalid => s05_couplers_to_auto_us_RVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mysystem2_axi_mem_intercon_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    M00_AXI_rid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    M00_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC;
    S01_ACLK : in STD_LOGIC;
    S01_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_arready : out STD_LOGIC;
    S01_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_arvalid : in STD_LOGIC;
    S01_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_rlast : out STD_LOGIC;
    S01_AXI_rready : in STD_LOGIC;
    S01_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_rvalid : out STD_LOGIC;
    S02_ACLK : in STD_LOGIC;
    S02_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awready : out STD_LOGIC;
    S02_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awvalid : in STD_LOGIC;
    S02_AXI_bready : in STD_LOGIC;
    S02_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_bvalid : out STD_LOGIC;
    S02_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_wlast : in STD_LOGIC;
    S02_AXI_wready : out STD_LOGIC;
    S02_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_wvalid : in STD_LOGIC;
    S03_ACLK : in STD_LOGIC;
    S03_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S03_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S03_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S03_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S03_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S03_AXI_awready : out STD_LOGIC;
    S03_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S03_AXI_awvalid : in STD_LOGIC;
    S03_AXI_bready : in STD_LOGIC;
    S03_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S03_AXI_bvalid : out STD_LOGIC;
    S03_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S03_AXI_wlast : in STD_LOGIC;
    S03_AXI_wready : out STD_LOGIC;
    S03_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_wvalid : in STD_LOGIC;
    S04_ACLK : in STD_LOGIC;
    S04_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S04_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S04_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S04_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S04_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S04_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S04_AXI_arready : out STD_LOGIC;
    S04_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S04_AXI_arvalid : in STD_LOGIC;
    S04_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S04_AXI_rlast : out STD_LOGIC;
    S04_AXI_rready : in STD_LOGIC;
    S04_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S04_AXI_rvalid : out STD_LOGIC;
    S05_ACLK : in STD_LOGIC;
    S05_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S05_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S05_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S05_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S05_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S05_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S05_AXI_arready : out STD_LOGIC;
    S05_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S05_AXI_arvalid : in STD_LOGIC;
    S05_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S05_AXI_rlast : out STD_LOGIC;
    S05_AXI_rready : in STD_LOGIC;
    S05_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S05_AXI_rvalid : out STD_LOGIC
  );
end mysystem2_axi_mem_intercon_0;

architecture STRUCTURE of mysystem2_axi_mem_intercon_0 is
  component mysystem2_xbar_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 191 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 47 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 3071 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 383 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 191 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 47 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 3071 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component mysystem2_xbar_1;
  signal GND_1 : STD_LOGIC;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_ACLK_1 : STD_LOGIC;
  signal S01_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S02_ACLK_1 : STD_LOGIC;
  signal S02_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S03_ACLK_1 : STD_LOGIC;
  signal S03_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S04_ACLK_1 : STD_LOGIC;
  signal S04_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S05_ACLK_1 : STD_LOGIC;
  signal S05_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal VCC_1 : STD_LOGIC;
  signal axi_mem_intercon_ACLK_net : STD_LOGIC;
  signal axi_mem_intercon_ARESETN_net : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_AWREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_AWVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_BREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_BVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_RLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_RREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_RVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_WLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_WREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_WVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_to_s01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_ARREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_ARVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_RLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_RREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_RVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_AWREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s02_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_AWVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s02_couplers_BREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_BVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_WLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s02_couplers_WREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s02_couplers_WVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_AWREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s03_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_AWVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s03_couplers_BREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_BVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_WLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s03_couplers_WREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s03_couplers_WVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_ARREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s04_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_ARVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_RLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s04_couplers_RREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s04_couplers_RVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_ARREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s05_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_ARVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_RLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s05_couplers_RREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s05_couplers_RVALID : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_BID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_RID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal s00_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal s00_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 1023 downto 512 );
  signal s01_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s01_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal s01_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s02_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s02_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s02_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s02_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal s02_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal s02_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s02_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s02_couplers_to_xbar_WVALID : STD_LOGIC;
  signal s03_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s03_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s03_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s03_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s03_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal s03_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s03_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s03_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal s03_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal s03_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal s03_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s03_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal s03_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s03_couplers_to_xbar_WVALID : STD_LOGIC;
  signal s04_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s04_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s04_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s04_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s04_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s04_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s04_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s04_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal s04_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s04_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s04_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 2559 downto 2048 );
  signal s04_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 4 to 4 );
  signal s04_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s04_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal s04_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal s05_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s05_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s05_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s05_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s05_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s05_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s05_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s05_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal s05_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s05_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s05_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 3071 downto 2560 );
  signal s05_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 5 to 5 );
  signal s05_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s05_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 11 downto 10 );
  signal s05_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal xbar_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal xbar_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xbar_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_xbar_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_xbar_s_axi_arready_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_xbar_s_axi_awready_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal NLW_xbar_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_xbar_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 2 );
  signal NLW_xbar_s_axi_bvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal NLW_xbar_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 2047 downto 1024 );
  signal NLW_xbar_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_xbar_s_axi_rlast_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_xbar_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_xbar_s_axi_rvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_xbar_s_axi_wready_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 1 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1(0) <= M00_ARESETN(0);
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_axi_mem_intercon_ARADDR(31 downto 0);
  M00_AXI_arburst(1 downto 0) <= m00_couplers_to_axi_mem_intercon_ARBURST(1 downto 0);
  M00_AXI_arcache(3 downto 0) <= m00_couplers_to_axi_mem_intercon_ARCACHE(3 downto 0);
  M00_AXI_arid(2 downto 0) <= m00_couplers_to_axi_mem_intercon_ARID(2 downto 0);
  M00_AXI_arlen(7 downto 0) <= m00_couplers_to_axi_mem_intercon_ARLEN(7 downto 0);
  M00_AXI_arlock(0) <= m00_couplers_to_axi_mem_intercon_ARLOCK(0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_axi_mem_intercon_ARPROT(2 downto 0);
  M00_AXI_arqos(3 downto 0) <= m00_couplers_to_axi_mem_intercon_ARQOS(3 downto 0);
  M00_AXI_arsize(2 downto 0) <= m00_couplers_to_axi_mem_intercon_ARSIZE(2 downto 0);
  M00_AXI_arvalid(0) <= m00_couplers_to_axi_mem_intercon_ARVALID(0);
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_axi_mem_intercon_AWADDR(31 downto 0);
  M00_AXI_awburst(1 downto 0) <= m00_couplers_to_axi_mem_intercon_AWBURST(1 downto 0);
  M00_AXI_awcache(3 downto 0) <= m00_couplers_to_axi_mem_intercon_AWCACHE(3 downto 0);
  M00_AXI_awid(2 downto 0) <= m00_couplers_to_axi_mem_intercon_AWID(2 downto 0);
  M00_AXI_awlen(7 downto 0) <= m00_couplers_to_axi_mem_intercon_AWLEN(7 downto 0);
  M00_AXI_awlock(0) <= m00_couplers_to_axi_mem_intercon_AWLOCK(0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_axi_mem_intercon_AWPROT(2 downto 0);
  M00_AXI_awqos(3 downto 0) <= m00_couplers_to_axi_mem_intercon_AWQOS(3 downto 0);
  M00_AXI_awsize(2 downto 0) <= m00_couplers_to_axi_mem_intercon_AWSIZE(2 downto 0);
  M00_AXI_awvalid(0) <= m00_couplers_to_axi_mem_intercon_AWVALID(0);
  M00_AXI_bready(0) <= m00_couplers_to_axi_mem_intercon_BREADY(0);
  M00_AXI_rready(0) <= m00_couplers_to_axi_mem_intercon_RREADY(0);
  M00_AXI_wdata(511 downto 0) <= m00_couplers_to_axi_mem_intercon_WDATA(511 downto 0);
  M00_AXI_wlast(0) <= m00_couplers_to_axi_mem_intercon_WLAST(0);
  M00_AXI_wstrb(63 downto 0) <= m00_couplers_to_axi_mem_intercon_WSTRB(63 downto 0);
  M00_AXI_wvalid(0) <= m00_couplers_to_axi_mem_intercon_WVALID(0);
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1(0) <= S00_ARESETN(0);
  S00_AXI_arready <= axi_mem_intercon_to_s00_couplers_ARREADY;
  S00_AXI_awready <= axi_mem_intercon_to_s00_couplers_AWREADY;
  S00_AXI_bresp(1 downto 0) <= axi_mem_intercon_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= axi_mem_intercon_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= axi_mem_intercon_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rlast <= axi_mem_intercon_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= axi_mem_intercon_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= axi_mem_intercon_to_s00_couplers_RVALID;
  S00_AXI_wready <= axi_mem_intercon_to_s00_couplers_WREADY;
  S01_ACLK_1 <= S01_ACLK;
  S01_ARESETN_1(0) <= S01_ARESETN(0);
  S01_AXI_arready <= axi_mem_intercon_to_s01_couplers_ARREADY;
  S01_AXI_rdata(31 downto 0) <= axi_mem_intercon_to_s01_couplers_RDATA(31 downto 0);
  S01_AXI_rlast <= axi_mem_intercon_to_s01_couplers_RLAST;
  S01_AXI_rresp(1 downto 0) <= axi_mem_intercon_to_s01_couplers_RRESP(1 downto 0);
  S01_AXI_rvalid <= axi_mem_intercon_to_s01_couplers_RVALID;
  S02_ACLK_1 <= S02_ACLK;
  S02_ARESETN_1(0) <= S02_ARESETN(0);
  S02_AXI_awready <= axi_mem_intercon_to_s02_couplers_AWREADY;
  S02_AXI_bresp(1 downto 0) <= axi_mem_intercon_to_s02_couplers_BRESP(1 downto 0);
  S02_AXI_bvalid <= axi_mem_intercon_to_s02_couplers_BVALID;
  S02_AXI_wready <= axi_mem_intercon_to_s02_couplers_WREADY;
  S03_ACLK_1 <= S03_ACLK;
  S03_ARESETN_1(0) <= S03_ARESETN(0);
  S03_AXI_awready <= axi_mem_intercon_to_s03_couplers_AWREADY;
  S03_AXI_bresp(1 downto 0) <= axi_mem_intercon_to_s03_couplers_BRESP(1 downto 0);
  S03_AXI_bvalid <= axi_mem_intercon_to_s03_couplers_BVALID;
  S03_AXI_wready <= axi_mem_intercon_to_s03_couplers_WREADY;
  S04_ACLK_1 <= S04_ACLK;
  S04_ARESETN_1(0) <= S04_ARESETN(0);
  S04_AXI_arready <= axi_mem_intercon_to_s04_couplers_ARREADY;
  S04_AXI_rdata(31 downto 0) <= axi_mem_intercon_to_s04_couplers_RDATA(31 downto 0);
  S04_AXI_rlast <= axi_mem_intercon_to_s04_couplers_RLAST;
  S04_AXI_rresp(1 downto 0) <= axi_mem_intercon_to_s04_couplers_RRESP(1 downto 0);
  S04_AXI_rvalid <= axi_mem_intercon_to_s04_couplers_RVALID;
  S05_ACLK_1 <= S05_ACLK;
  S05_ARESETN_1(0) <= S05_ARESETN(0);
  S05_AXI_arready <= axi_mem_intercon_to_s05_couplers_ARREADY;
  S05_AXI_rdata(31 downto 0) <= axi_mem_intercon_to_s05_couplers_RDATA(31 downto 0);
  S05_AXI_rlast <= axi_mem_intercon_to_s05_couplers_RLAST;
  S05_AXI_rresp(1 downto 0) <= axi_mem_intercon_to_s05_couplers_RRESP(1 downto 0);
  S05_AXI_rvalid <= axi_mem_intercon_to_s05_couplers_RVALID;
  axi_mem_intercon_ACLK_net <= ACLK;
  axi_mem_intercon_ARESETN_net(0) <= ARESETN(0);
  axi_mem_intercon_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  axi_mem_intercon_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  axi_mem_intercon_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  axi_mem_intercon_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  axi_mem_intercon_to_s00_couplers_ARLOCK(0) <= S00_AXI_arlock(0);
  axi_mem_intercon_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  axi_mem_intercon_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  axi_mem_intercon_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  axi_mem_intercon_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  axi_mem_intercon_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  axi_mem_intercon_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  axi_mem_intercon_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  axi_mem_intercon_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  axi_mem_intercon_to_s00_couplers_AWLOCK(0) <= S00_AXI_awlock(0);
  axi_mem_intercon_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  axi_mem_intercon_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  axi_mem_intercon_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  axi_mem_intercon_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  axi_mem_intercon_to_s00_couplers_BREADY <= S00_AXI_bready;
  axi_mem_intercon_to_s00_couplers_RREADY <= S00_AXI_rready;
  axi_mem_intercon_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  axi_mem_intercon_to_s00_couplers_WLAST <= S00_AXI_wlast;
  axi_mem_intercon_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  axi_mem_intercon_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  axi_mem_intercon_to_s01_couplers_ARADDR(31 downto 0) <= S01_AXI_araddr(31 downto 0);
  axi_mem_intercon_to_s01_couplers_ARBURST(1 downto 0) <= S01_AXI_arburst(1 downto 0);
  axi_mem_intercon_to_s01_couplers_ARCACHE(3 downto 0) <= S01_AXI_arcache(3 downto 0);
  axi_mem_intercon_to_s01_couplers_ARLEN(7 downto 0) <= S01_AXI_arlen(7 downto 0);
  axi_mem_intercon_to_s01_couplers_ARLOCK(0) <= S01_AXI_arlock(0);
  axi_mem_intercon_to_s01_couplers_ARPROT(2 downto 0) <= S01_AXI_arprot(2 downto 0);
  axi_mem_intercon_to_s01_couplers_ARQOS(3 downto 0) <= S01_AXI_arqos(3 downto 0);
  axi_mem_intercon_to_s01_couplers_ARSIZE(2 downto 0) <= S01_AXI_arsize(2 downto 0);
  axi_mem_intercon_to_s01_couplers_ARVALID <= S01_AXI_arvalid;
  axi_mem_intercon_to_s01_couplers_RREADY <= S01_AXI_rready;
  axi_mem_intercon_to_s02_couplers_AWADDR(31 downto 0) <= S02_AXI_awaddr(31 downto 0);
  axi_mem_intercon_to_s02_couplers_AWBURST(1 downto 0) <= S02_AXI_awburst(1 downto 0);
  axi_mem_intercon_to_s02_couplers_AWCACHE(3 downto 0) <= S02_AXI_awcache(3 downto 0);
  axi_mem_intercon_to_s02_couplers_AWLEN(7 downto 0) <= S02_AXI_awlen(7 downto 0);
  axi_mem_intercon_to_s02_couplers_AWPROT(2 downto 0) <= S02_AXI_awprot(2 downto 0);
  axi_mem_intercon_to_s02_couplers_AWSIZE(2 downto 0) <= S02_AXI_awsize(2 downto 0);
  axi_mem_intercon_to_s02_couplers_AWVALID <= S02_AXI_awvalid;
  axi_mem_intercon_to_s02_couplers_BREADY <= S02_AXI_bready;
  axi_mem_intercon_to_s02_couplers_WDATA(31 downto 0) <= S02_AXI_wdata(31 downto 0);
  axi_mem_intercon_to_s02_couplers_WLAST <= S02_AXI_wlast;
  axi_mem_intercon_to_s02_couplers_WSTRB(3 downto 0) <= S02_AXI_wstrb(3 downto 0);
  axi_mem_intercon_to_s02_couplers_WVALID <= S02_AXI_wvalid;
  axi_mem_intercon_to_s03_couplers_AWADDR(31 downto 0) <= S03_AXI_awaddr(31 downto 0);
  axi_mem_intercon_to_s03_couplers_AWBURST(1 downto 0) <= S03_AXI_awburst(1 downto 0);
  axi_mem_intercon_to_s03_couplers_AWCACHE(3 downto 0) <= S03_AXI_awcache(3 downto 0);
  axi_mem_intercon_to_s03_couplers_AWLEN(7 downto 0) <= S03_AXI_awlen(7 downto 0);
  axi_mem_intercon_to_s03_couplers_AWPROT(2 downto 0) <= S03_AXI_awprot(2 downto 0);
  axi_mem_intercon_to_s03_couplers_AWSIZE(2 downto 0) <= S03_AXI_awsize(2 downto 0);
  axi_mem_intercon_to_s03_couplers_AWVALID <= S03_AXI_awvalid;
  axi_mem_intercon_to_s03_couplers_BREADY <= S03_AXI_bready;
  axi_mem_intercon_to_s03_couplers_WDATA(31 downto 0) <= S03_AXI_wdata(31 downto 0);
  axi_mem_intercon_to_s03_couplers_WLAST <= S03_AXI_wlast;
  axi_mem_intercon_to_s03_couplers_WSTRB(3 downto 0) <= S03_AXI_wstrb(3 downto 0);
  axi_mem_intercon_to_s03_couplers_WVALID <= S03_AXI_wvalid;
  axi_mem_intercon_to_s04_couplers_ARADDR(31 downto 0) <= S04_AXI_araddr(31 downto 0);
  axi_mem_intercon_to_s04_couplers_ARBURST(1 downto 0) <= S04_AXI_arburst(1 downto 0);
  axi_mem_intercon_to_s04_couplers_ARCACHE(3 downto 0) <= S04_AXI_arcache(3 downto 0);
  axi_mem_intercon_to_s04_couplers_ARLEN(7 downto 0) <= S04_AXI_arlen(7 downto 0);
  axi_mem_intercon_to_s04_couplers_ARPROT(2 downto 0) <= S04_AXI_arprot(2 downto 0);
  axi_mem_intercon_to_s04_couplers_ARSIZE(2 downto 0) <= S04_AXI_arsize(2 downto 0);
  axi_mem_intercon_to_s04_couplers_ARVALID <= S04_AXI_arvalid;
  axi_mem_intercon_to_s04_couplers_RREADY <= S04_AXI_rready;
  axi_mem_intercon_to_s05_couplers_ARADDR(31 downto 0) <= S05_AXI_araddr(31 downto 0);
  axi_mem_intercon_to_s05_couplers_ARBURST(1 downto 0) <= S05_AXI_arburst(1 downto 0);
  axi_mem_intercon_to_s05_couplers_ARCACHE(3 downto 0) <= S05_AXI_arcache(3 downto 0);
  axi_mem_intercon_to_s05_couplers_ARLEN(7 downto 0) <= S05_AXI_arlen(7 downto 0);
  axi_mem_intercon_to_s05_couplers_ARPROT(2 downto 0) <= S05_AXI_arprot(2 downto 0);
  axi_mem_intercon_to_s05_couplers_ARSIZE(2 downto 0) <= S05_AXI_arsize(2 downto 0);
  axi_mem_intercon_to_s05_couplers_ARVALID <= S05_AXI_arvalid;
  axi_mem_intercon_to_s05_couplers_RREADY <= S05_AXI_rready;
  m00_couplers_to_axi_mem_intercon_ARREADY(0) <= M00_AXI_arready(0);
  m00_couplers_to_axi_mem_intercon_AWREADY(0) <= M00_AXI_awready(0);
  m00_couplers_to_axi_mem_intercon_BID(2 downto 0) <= M00_AXI_bid(2 downto 0);
  m00_couplers_to_axi_mem_intercon_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_axi_mem_intercon_BVALID(0) <= M00_AXI_bvalid(0);
  m00_couplers_to_axi_mem_intercon_RDATA(511 downto 0) <= M00_AXI_rdata(511 downto 0);
  m00_couplers_to_axi_mem_intercon_RID(2 downto 0) <= M00_AXI_rid(2 downto 0);
  m00_couplers_to_axi_mem_intercon_RLAST(0) <= M00_AXI_rlast(0);
  m00_couplers_to_axi_mem_intercon_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_axi_mem_intercon_RVALID(0) <= M00_AXI_rvalid(0);
  m00_couplers_to_axi_mem_intercon_WREADY(0) <= M00_AXI_wready(0);
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => VCC_1
    );
m00_couplers: entity work.m00_couplers_imp_1E4W7PA
    port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN(0) => M00_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m00_couplers_to_axi_mem_intercon_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m00_couplers_to_axi_mem_intercon_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m00_couplers_to_axi_mem_intercon_ARCACHE(3 downto 0),
      M_AXI_arid(2 downto 0) => m00_couplers_to_axi_mem_intercon_ARID(2 downto 0),
      M_AXI_arlen(7 downto 0) => m00_couplers_to_axi_mem_intercon_ARLEN(7 downto 0),
      M_AXI_arlock(0) => m00_couplers_to_axi_mem_intercon_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_axi_mem_intercon_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m00_couplers_to_axi_mem_intercon_ARQOS(3 downto 0),
      M_AXI_arready(0) => m00_couplers_to_axi_mem_intercon_ARREADY(0),
      M_AXI_arsize(2 downto 0) => m00_couplers_to_axi_mem_intercon_ARSIZE(2 downto 0),
      M_AXI_arvalid(0) => m00_couplers_to_axi_mem_intercon_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_axi_mem_intercon_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m00_couplers_to_axi_mem_intercon_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m00_couplers_to_axi_mem_intercon_AWCACHE(3 downto 0),
      M_AXI_awid(2 downto 0) => m00_couplers_to_axi_mem_intercon_AWID(2 downto 0),
      M_AXI_awlen(7 downto 0) => m00_couplers_to_axi_mem_intercon_AWLEN(7 downto 0),
      M_AXI_awlock(0) => m00_couplers_to_axi_mem_intercon_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_axi_mem_intercon_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m00_couplers_to_axi_mem_intercon_AWQOS(3 downto 0),
      M_AXI_awready(0) => m00_couplers_to_axi_mem_intercon_AWREADY(0),
      M_AXI_awsize(2 downto 0) => m00_couplers_to_axi_mem_intercon_AWSIZE(2 downto 0),
      M_AXI_awvalid(0) => m00_couplers_to_axi_mem_intercon_AWVALID(0),
      M_AXI_bid(2 downto 0) => m00_couplers_to_axi_mem_intercon_BID(2 downto 0),
      M_AXI_bready(0) => m00_couplers_to_axi_mem_intercon_BREADY(0),
      M_AXI_bresp(1 downto 0) => m00_couplers_to_axi_mem_intercon_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m00_couplers_to_axi_mem_intercon_BVALID(0),
      M_AXI_rdata(511 downto 0) => m00_couplers_to_axi_mem_intercon_RDATA(511 downto 0),
      M_AXI_rid(2 downto 0) => m00_couplers_to_axi_mem_intercon_RID(2 downto 0),
      M_AXI_rlast(0) => m00_couplers_to_axi_mem_intercon_RLAST(0),
      M_AXI_rready(0) => m00_couplers_to_axi_mem_intercon_RREADY(0),
      M_AXI_rresp(1 downto 0) => m00_couplers_to_axi_mem_intercon_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m00_couplers_to_axi_mem_intercon_RVALID(0),
      M_AXI_wdata(511 downto 0) => m00_couplers_to_axi_mem_intercon_WDATA(511 downto 0),
      M_AXI_wlast(0) => m00_couplers_to_axi_mem_intercon_WLAST(0),
      M_AXI_wready(0) => m00_couplers_to_axi_mem_intercon_WREADY(0),
      M_AXI_wstrb(63 downto 0) => m00_couplers_to_axi_mem_intercon_WSTRB(63 downto 0),
      M_AXI_wvalid(0) => m00_couplers_to_axi_mem_intercon_WVALID(0),
      S_ACLK => axi_mem_intercon_ACLK_net,
      S_ARESETN(0) => axi_mem_intercon_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(2 downto 0) => xbar_to_m00_couplers_ARID(2 downto 0),
      S_AXI_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      S_AXI_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      S_AXI_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(2 downto 0) => xbar_to_m00_couplers_AWID(2 downto 0),
      S_AXI_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      S_AXI_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      S_AXI_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bid(2 downto 0) => xbar_to_m00_couplers_BID(2 downto 0),
      S_AXI_bready(0) => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      S_AXI_rdata(511 downto 0) => xbar_to_m00_couplers_RDATA(511 downto 0),
      S_AXI_rid(2 downto 0) => xbar_to_m00_couplers_RID(2 downto 0),
      S_AXI_rlast(0) => xbar_to_m00_couplers_RLAST(0),
      S_AXI_rready(0) => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      S_AXI_wdata(511 downto 0) => xbar_to_m00_couplers_WDATA(511 downto 0),
      S_AXI_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      S_AXI_wready(0) => xbar_to_m00_couplers_WREADY(0),
      S_AXI_wstrb(63 downto 0) => xbar_to_m00_couplers_WSTRB(63 downto 0),
      S_AXI_wvalid(0) => xbar_to_m00_couplers_WVALID(0)
    );
s00_couplers: entity work.s00_couplers_imp_CDJ06A
    port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN(0) => axi_mem_intercon_ARESETN_net(0),
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(511 downto 0) => s00_couplers_to_xbar_RDATA(511 downto 0),
      M_AXI_rlast => s00_couplers_to_xbar_RLAST(0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(511 downto 0) => s00_couplers_to_xbar_WDATA(511 downto 0),
      M_AXI_wlast => s00_couplers_to_xbar_WLAST,
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(63 downto 0) => s00_couplers_to_xbar_WSTRB(63 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN(0) => S00_ARESETN_1(0),
      S_AXI_araddr(31 downto 0) => axi_mem_intercon_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_mem_intercon_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_mem_intercon_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_mem_intercon_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => axi_mem_intercon_to_s00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => axi_mem_intercon_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => axi_mem_intercon_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => axi_mem_intercon_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => axi_mem_intercon_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => axi_mem_intercon_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => axi_mem_intercon_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_mem_intercon_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_mem_intercon_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_mem_intercon_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => axi_mem_intercon_to_s00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => axi_mem_intercon_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => axi_mem_intercon_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => axi_mem_intercon_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_mem_intercon_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_mem_intercon_to_s00_couplers_AWVALID,
      S_AXI_bready => axi_mem_intercon_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_mem_intercon_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_mem_intercon_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => axi_mem_intercon_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rlast => axi_mem_intercon_to_s00_couplers_RLAST,
      S_AXI_rready => axi_mem_intercon_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_mem_intercon_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_mem_intercon_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => axi_mem_intercon_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wlast => axi_mem_intercon_to_s00_couplers_WLAST,
      S_AXI_wready => axi_mem_intercon_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => axi_mem_intercon_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => axi_mem_intercon_to_s00_couplers_WVALID
    );
s01_couplers: entity work.s01_couplers_imp_1XRVWFU
    port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN(0) => axi_mem_intercon_ARESETN_net(0),
      M_AXI_araddr(31 downto 0) => s01_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s01_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s01_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s01_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s01_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s01_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s01_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready => s01_couplers_to_xbar_ARREADY(1),
      M_AXI_arsize(2 downto 0) => s01_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s01_couplers_to_xbar_ARVALID,
      M_AXI_rdata(511 downto 0) => s01_couplers_to_xbar_RDATA(1023 downto 512),
      M_AXI_rlast => s01_couplers_to_xbar_RLAST(1),
      M_AXI_rready => s01_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s01_couplers_to_xbar_RRESP(3 downto 2),
      M_AXI_rvalid => s01_couplers_to_xbar_RVALID(1),
      S_ACLK => S01_ACLK_1,
      S_ARESETN(0) => S01_ARESETN_1(0),
      S_AXI_araddr(31 downto 0) => axi_mem_intercon_to_s01_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_mem_intercon_to_s01_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_mem_intercon_to_s01_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_mem_intercon_to_s01_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => axi_mem_intercon_to_s01_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => axi_mem_intercon_to_s01_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => axi_mem_intercon_to_s01_couplers_ARQOS(3 downto 0),
      S_AXI_arready => axi_mem_intercon_to_s01_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => axi_mem_intercon_to_s01_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => axi_mem_intercon_to_s01_couplers_ARVALID,
      S_AXI_rdata(31 downto 0) => axi_mem_intercon_to_s01_couplers_RDATA(31 downto 0),
      S_AXI_rlast => axi_mem_intercon_to_s01_couplers_RLAST,
      S_AXI_rready => axi_mem_intercon_to_s01_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_mem_intercon_to_s01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_mem_intercon_to_s01_couplers_RVALID
    );
s02_couplers: entity work.s02_couplers_imp_OGTF83
    port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN(0) => axi_mem_intercon_ARESETN_net(0),
      M_AXI_awaddr(31 downto 0) => s02_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s02_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s02_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s02_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s02_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s02_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s02_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready => s02_couplers_to_xbar_AWREADY(2),
      M_AXI_awsize(2 downto 0) => s02_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s02_couplers_to_xbar_AWVALID,
      M_AXI_bready => s02_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s02_couplers_to_xbar_BRESP(5 downto 4),
      M_AXI_bvalid => s02_couplers_to_xbar_BVALID(2),
      M_AXI_wdata(511 downto 0) => s02_couplers_to_xbar_WDATA(511 downto 0),
      M_AXI_wlast => s02_couplers_to_xbar_WLAST,
      M_AXI_wready => s02_couplers_to_xbar_WREADY(2),
      M_AXI_wstrb(63 downto 0) => s02_couplers_to_xbar_WSTRB(63 downto 0),
      M_AXI_wvalid => s02_couplers_to_xbar_WVALID,
      S_ACLK => S02_ACLK_1,
      S_ARESETN(0) => S02_ARESETN_1(0),
      S_AXI_awaddr(31 downto 0) => axi_mem_intercon_to_s02_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_mem_intercon_to_s02_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_mem_intercon_to_s02_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_mem_intercon_to_s02_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_mem_intercon_to_s02_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_mem_intercon_to_s02_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_mem_intercon_to_s02_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_mem_intercon_to_s02_couplers_AWVALID,
      S_AXI_bready => axi_mem_intercon_to_s02_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_mem_intercon_to_s02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_mem_intercon_to_s02_couplers_BVALID,
      S_AXI_wdata(31 downto 0) => axi_mem_intercon_to_s02_couplers_WDATA(31 downto 0),
      S_AXI_wlast => axi_mem_intercon_to_s02_couplers_WLAST,
      S_AXI_wready => axi_mem_intercon_to_s02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => axi_mem_intercon_to_s02_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => axi_mem_intercon_to_s02_couplers_WVALID
    );
s03_couplers: entity work.s03_couplers_imp_13WDQ8B
    port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN(0) => axi_mem_intercon_ARESETN_net(0),
      M_AXI_awaddr(31 downto 0) => s03_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s03_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s03_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s03_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s03_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s03_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s03_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready => s03_couplers_to_xbar_AWREADY(3),
      M_AXI_awsize(2 downto 0) => s03_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s03_couplers_to_xbar_AWVALID,
      M_AXI_bready => s03_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s03_couplers_to_xbar_BRESP(7 downto 6),
      M_AXI_bvalid => s03_couplers_to_xbar_BVALID(3),
      M_AXI_wdata(511 downto 0) => s03_couplers_to_xbar_WDATA(511 downto 0),
      M_AXI_wlast => s03_couplers_to_xbar_WLAST,
      M_AXI_wready => s03_couplers_to_xbar_WREADY(3),
      M_AXI_wstrb(63 downto 0) => s03_couplers_to_xbar_WSTRB(63 downto 0),
      M_AXI_wvalid => s03_couplers_to_xbar_WVALID,
      S_ACLK => S03_ACLK_1,
      S_ARESETN(0) => S03_ARESETN_1(0),
      S_AXI_awaddr(31 downto 0) => axi_mem_intercon_to_s03_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_mem_intercon_to_s03_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_mem_intercon_to_s03_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_mem_intercon_to_s03_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_mem_intercon_to_s03_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_mem_intercon_to_s03_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_mem_intercon_to_s03_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_mem_intercon_to_s03_couplers_AWVALID,
      S_AXI_bready => axi_mem_intercon_to_s03_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_mem_intercon_to_s03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_mem_intercon_to_s03_couplers_BVALID,
      S_AXI_wdata(31 downto 0) => axi_mem_intercon_to_s03_couplers_WDATA(31 downto 0),
      S_AXI_wlast => axi_mem_intercon_to_s03_couplers_WLAST,
      S_AXI_wready => axi_mem_intercon_to_s03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => axi_mem_intercon_to_s03_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => axi_mem_intercon_to_s03_couplers_WVALID
    );
s04_couplers: entity work.s04_couplers_imp_1IX8IM8
    port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN(0) => axi_mem_intercon_ARESETN_net(0),
      M_AXI_araddr(31 downto 0) => s04_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s04_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s04_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s04_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s04_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s04_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s04_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready => s04_couplers_to_xbar_ARREADY(4),
      M_AXI_arsize(2 downto 0) => s04_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s04_couplers_to_xbar_ARVALID,
      M_AXI_rdata(511 downto 0) => s04_couplers_to_xbar_RDATA(2559 downto 2048),
      M_AXI_rlast => s04_couplers_to_xbar_RLAST(4),
      M_AXI_rready => s04_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s04_couplers_to_xbar_RRESP(9 downto 8),
      M_AXI_rvalid => s04_couplers_to_xbar_RVALID(4),
      S_ACLK => S04_ACLK_1,
      S_ARESETN(0) => S04_ARESETN_1(0),
      S_AXI_araddr(31 downto 0) => axi_mem_intercon_to_s04_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_mem_intercon_to_s04_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_mem_intercon_to_s04_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_mem_intercon_to_s04_couplers_ARLEN(7 downto 0),
      S_AXI_arprot(2 downto 0) => axi_mem_intercon_to_s04_couplers_ARPROT(2 downto 0),
      S_AXI_arready => axi_mem_intercon_to_s04_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => axi_mem_intercon_to_s04_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => axi_mem_intercon_to_s04_couplers_ARVALID,
      S_AXI_rdata(31 downto 0) => axi_mem_intercon_to_s04_couplers_RDATA(31 downto 0),
      S_AXI_rlast => axi_mem_intercon_to_s04_couplers_RLAST,
      S_AXI_rready => axi_mem_intercon_to_s04_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_mem_intercon_to_s04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_mem_intercon_to_s04_couplers_RVALID
    );
s05_couplers: entity work.s05_couplers_imp_50GG0O
    port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN(0) => axi_mem_intercon_ARESETN_net(0),
      M_AXI_araddr(31 downto 0) => s05_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s05_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s05_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s05_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s05_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s05_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s05_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready => s05_couplers_to_xbar_ARREADY(5),
      M_AXI_arsize(2 downto 0) => s05_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s05_couplers_to_xbar_ARVALID,
      M_AXI_rdata(511 downto 0) => s05_couplers_to_xbar_RDATA(3071 downto 2560),
      M_AXI_rlast => s05_couplers_to_xbar_RLAST(5),
      M_AXI_rready => s05_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s05_couplers_to_xbar_RRESP(11 downto 10),
      M_AXI_rvalid => s05_couplers_to_xbar_RVALID(5),
      S_ACLK => S05_ACLK_1,
      S_ARESETN(0) => S05_ARESETN_1(0),
      S_AXI_araddr(31 downto 0) => axi_mem_intercon_to_s05_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_mem_intercon_to_s05_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_mem_intercon_to_s05_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_mem_intercon_to_s05_couplers_ARLEN(7 downto 0),
      S_AXI_arprot(2 downto 0) => axi_mem_intercon_to_s05_couplers_ARPROT(2 downto 0),
      S_AXI_arready => axi_mem_intercon_to_s05_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => axi_mem_intercon_to_s05_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => axi_mem_intercon_to_s05_couplers_ARVALID,
      S_AXI_rdata(31 downto 0) => axi_mem_intercon_to_s05_couplers_RDATA(31 downto 0),
      S_AXI_rlast => axi_mem_intercon_to_s05_couplers_RLAST,
      S_AXI_rready => axi_mem_intercon_to_s05_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_mem_intercon_to_s05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_mem_intercon_to_s05_couplers_RVALID
    );
xbar: component mysystem2_xbar_1
    port map (
      aclk => axi_mem_intercon_ACLK_net,
      aresetn => axi_mem_intercon_ARESETN_net(0),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(2 downto 0) => xbar_to_m00_couplers_ARID(2 downto 0),
      m_axi_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      m_axi_arregion(3 downto 0) => NLW_xbar_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(2 downto 0) => xbar_to_m00_couplers_AWID(2 downto 0),
      m_axi_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      m_axi_awregion(3 downto 0) => NLW_xbar_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bid(2 downto 0) => xbar_to_m00_couplers_BID(2 downto 0),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      m_axi_rdata(511 downto 0) => xbar_to_m00_couplers_RDATA(511 downto 0),
      m_axi_rid(2 downto 0) => xbar_to_m00_couplers_RID(2 downto 0),
      m_axi_rlast(0) => xbar_to_m00_couplers_RLAST(0),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      m_axi_wdata(511 downto 0) => xbar_to_m00_couplers_WDATA(511 downto 0),
      m_axi_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY(0),
      m_axi_wstrb(63 downto 0) => xbar_to_m00_couplers_WSTRB(63 downto 0),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(191 downto 160) => s05_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_araddr(159 downto 128) => s04_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_araddr(127) => GND_1,
      s_axi_araddr(126) => GND_1,
      s_axi_araddr(125) => GND_1,
      s_axi_araddr(124) => GND_1,
      s_axi_araddr(123) => GND_1,
      s_axi_araddr(122) => GND_1,
      s_axi_araddr(121) => GND_1,
      s_axi_araddr(120) => GND_1,
      s_axi_araddr(119) => GND_1,
      s_axi_araddr(118) => GND_1,
      s_axi_araddr(117) => GND_1,
      s_axi_araddr(116) => GND_1,
      s_axi_araddr(115) => GND_1,
      s_axi_araddr(114) => GND_1,
      s_axi_araddr(113) => GND_1,
      s_axi_araddr(112) => GND_1,
      s_axi_araddr(111) => GND_1,
      s_axi_araddr(110) => GND_1,
      s_axi_araddr(109) => GND_1,
      s_axi_araddr(108) => GND_1,
      s_axi_araddr(107) => GND_1,
      s_axi_araddr(106) => GND_1,
      s_axi_araddr(105) => GND_1,
      s_axi_araddr(104) => GND_1,
      s_axi_araddr(103) => GND_1,
      s_axi_araddr(102) => GND_1,
      s_axi_araddr(101) => GND_1,
      s_axi_araddr(100) => GND_1,
      s_axi_araddr(99) => GND_1,
      s_axi_araddr(98) => GND_1,
      s_axi_araddr(97) => GND_1,
      s_axi_araddr(96) => GND_1,
      s_axi_araddr(95) => GND_1,
      s_axi_araddr(94) => GND_1,
      s_axi_araddr(93) => GND_1,
      s_axi_araddr(92) => GND_1,
      s_axi_araddr(91) => GND_1,
      s_axi_araddr(90) => GND_1,
      s_axi_araddr(89) => GND_1,
      s_axi_araddr(88) => GND_1,
      s_axi_araddr(87) => GND_1,
      s_axi_araddr(86) => GND_1,
      s_axi_araddr(85) => GND_1,
      s_axi_araddr(84) => GND_1,
      s_axi_araddr(83) => GND_1,
      s_axi_araddr(82) => GND_1,
      s_axi_araddr(81) => GND_1,
      s_axi_araddr(80) => GND_1,
      s_axi_araddr(79) => GND_1,
      s_axi_araddr(78) => GND_1,
      s_axi_araddr(77) => GND_1,
      s_axi_araddr(76) => GND_1,
      s_axi_araddr(75) => GND_1,
      s_axi_araddr(74) => GND_1,
      s_axi_araddr(73) => GND_1,
      s_axi_araddr(72) => GND_1,
      s_axi_araddr(71) => GND_1,
      s_axi_araddr(70) => GND_1,
      s_axi_araddr(69) => GND_1,
      s_axi_araddr(68) => GND_1,
      s_axi_araddr(67) => GND_1,
      s_axi_araddr(66) => GND_1,
      s_axi_araddr(65) => GND_1,
      s_axi_araddr(64) => GND_1,
      s_axi_araddr(63 downto 32) => s01_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arburst(11 downto 10) => s05_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arburst(9 downto 8) => s04_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arburst(7) => GND_1,
      s_axi_arburst(6) => GND_1,
      s_axi_arburst(5) => GND_1,
      s_axi_arburst(4) => GND_1,
      s_axi_arburst(3 downto 2) => s01_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arcache(23 downto 20) => s05_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arcache(19 downto 16) => s04_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arcache(15) => GND_1,
      s_axi_arcache(14) => GND_1,
      s_axi_arcache(13) => GND_1,
      s_axi_arcache(12) => GND_1,
      s_axi_arcache(11) => GND_1,
      s_axi_arcache(10) => GND_1,
      s_axi_arcache(9) => GND_1,
      s_axi_arcache(8) => GND_1,
      s_axi_arcache(7 downto 4) => s01_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arid(17) => GND_1,
      s_axi_arid(16) => GND_1,
      s_axi_arid(15) => GND_1,
      s_axi_arid(14) => GND_1,
      s_axi_arid(13) => GND_1,
      s_axi_arid(12) => GND_1,
      s_axi_arid(11) => GND_1,
      s_axi_arid(10) => GND_1,
      s_axi_arid(9) => GND_1,
      s_axi_arid(8) => GND_1,
      s_axi_arid(7) => GND_1,
      s_axi_arid(6) => GND_1,
      s_axi_arid(5) => GND_1,
      s_axi_arid(4) => GND_1,
      s_axi_arid(3) => GND_1,
      s_axi_arid(2) => GND_1,
      s_axi_arid(1) => GND_1,
      s_axi_arid(0) => GND_1,
      s_axi_arlen(47 downto 40) => s05_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlen(39 downto 32) => s04_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlen(31) => GND_1,
      s_axi_arlen(30) => GND_1,
      s_axi_arlen(29) => GND_1,
      s_axi_arlen(28) => GND_1,
      s_axi_arlen(27) => GND_1,
      s_axi_arlen(26) => GND_1,
      s_axi_arlen(25) => GND_1,
      s_axi_arlen(24) => GND_1,
      s_axi_arlen(23) => GND_1,
      s_axi_arlen(22) => GND_1,
      s_axi_arlen(21) => GND_1,
      s_axi_arlen(20) => GND_1,
      s_axi_arlen(19) => GND_1,
      s_axi_arlen(18) => GND_1,
      s_axi_arlen(17) => GND_1,
      s_axi_arlen(16) => GND_1,
      s_axi_arlen(15 downto 8) => s01_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlock(5) => s05_couplers_to_xbar_ARLOCK(0),
      s_axi_arlock(4) => s04_couplers_to_xbar_ARLOCK(0),
      s_axi_arlock(3) => GND_1,
      s_axi_arlock(2) => GND_1,
      s_axi_arlock(1) => s01_couplers_to_xbar_ARLOCK(0),
      s_axi_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      s_axi_arprot(17 downto 15) => s05_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arprot(14 downto 12) => s04_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arprot(11) => GND_1,
      s_axi_arprot(10) => GND_1,
      s_axi_arprot(9) => GND_1,
      s_axi_arprot(8) => GND_1,
      s_axi_arprot(7) => GND_1,
      s_axi_arprot(6) => GND_1,
      s_axi_arprot(5 downto 3) => s01_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arqos(23 downto 20) => s05_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arqos(19 downto 16) => s04_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arqos(15) => GND_1,
      s_axi_arqos(14) => GND_1,
      s_axi_arqos(13) => GND_1,
      s_axi_arqos(12) => GND_1,
      s_axi_arqos(11) => GND_1,
      s_axi_arqos(10) => GND_1,
      s_axi_arqos(9) => GND_1,
      s_axi_arqos(8) => GND_1,
      s_axi_arqos(7 downto 4) => s01_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arready(5) => s05_couplers_to_xbar_ARREADY(5),
      s_axi_arready(4) => s04_couplers_to_xbar_ARREADY(4),
      s_axi_arready(3 downto 2) => NLW_xbar_s_axi_arready_UNCONNECTED(3 downto 2),
      s_axi_arready(1) => s01_couplers_to_xbar_ARREADY(1),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arsize(17 downto 15) => s05_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arsize(14 downto 12) => s04_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arsize(11) => GND_1,
      s_axi_arsize(10) => GND_1,
      s_axi_arsize(9) => GND_1,
      s_axi_arsize(8) => GND_1,
      s_axi_arsize(7) => GND_1,
      s_axi_arsize(6) => GND_1,
      s_axi_arsize(5 downto 3) => s01_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arvalid(5) => s05_couplers_to_xbar_ARVALID,
      s_axi_arvalid(4) => s04_couplers_to_xbar_ARVALID,
      s_axi_arvalid(3) => GND_1,
      s_axi_arvalid(2) => GND_1,
      s_axi_arvalid(1) => s01_couplers_to_xbar_ARVALID,
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(191) => GND_1,
      s_axi_awaddr(190) => GND_1,
      s_axi_awaddr(189) => GND_1,
      s_axi_awaddr(188) => GND_1,
      s_axi_awaddr(187) => GND_1,
      s_axi_awaddr(186) => GND_1,
      s_axi_awaddr(185) => GND_1,
      s_axi_awaddr(184) => GND_1,
      s_axi_awaddr(183) => GND_1,
      s_axi_awaddr(182) => GND_1,
      s_axi_awaddr(181) => GND_1,
      s_axi_awaddr(180) => GND_1,
      s_axi_awaddr(179) => GND_1,
      s_axi_awaddr(178) => GND_1,
      s_axi_awaddr(177) => GND_1,
      s_axi_awaddr(176) => GND_1,
      s_axi_awaddr(175) => GND_1,
      s_axi_awaddr(174) => GND_1,
      s_axi_awaddr(173) => GND_1,
      s_axi_awaddr(172) => GND_1,
      s_axi_awaddr(171) => GND_1,
      s_axi_awaddr(170) => GND_1,
      s_axi_awaddr(169) => GND_1,
      s_axi_awaddr(168) => GND_1,
      s_axi_awaddr(167) => GND_1,
      s_axi_awaddr(166) => GND_1,
      s_axi_awaddr(165) => GND_1,
      s_axi_awaddr(164) => GND_1,
      s_axi_awaddr(163) => VCC_1,
      s_axi_awaddr(162) => GND_1,
      s_axi_awaddr(161) => GND_1,
      s_axi_awaddr(160) => GND_1,
      s_axi_awaddr(159) => GND_1,
      s_axi_awaddr(158) => GND_1,
      s_axi_awaddr(157) => GND_1,
      s_axi_awaddr(156) => GND_1,
      s_axi_awaddr(155) => GND_1,
      s_axi_awaddr(154) => GND_1,
      s_axi_awaddr(153) => GND_1,
      s_axi_awaddr(152) => GND_1,
      s_axi_awaddr(151) => GND_1,
      s_axi_awaddr(150) => GND_1,
      s_axi_awaddr(149) => GND_1,
      s_axi_awaddr(148) => GND_1,
      s_axi_awaddr(147) => VCC_1,
      s_axi_awaddr(146) => GND_1,
      s_axi_awaddr(145) => GND_1,
      s_axi_awaddr(144) => GND_1,
      s_axi_awaddr(143) => GND_1,
      s_axi_awaddr(142) => GND_1,
      s_axi_awaddr(141) => GND_1,
      s_axi_awaddr(140) => GND_1,
      s_axi_awaddr(139) => GND_1,
      s_axi_awaddr(138) => GND_1,
      s_axi_awaddr(137) => GND_1,
      s_axi_awaddr(136) => GND_1,
      s_axi_awaddr(135) => GND_1,
      s_axi_awaddr(134) => GND_1,
      s_axi_awaddr(133) => GND_1,
      s_axi_awaddr(132) => GND_1,
      s_axi_awaddr(131) => GND_1,
      s_axi_awaddr(130) => GND_1,
      s_axi_awaddr(129) => GND_1,
      s_axi_awaddr(128) => GND_1,
      s_axi_awaddr(127 downto 96) => s03_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(95 downto 64) => s02_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(63) => GND_1,
      s_axi_awaddr(62) => GND_1,
      s_axi_awaddr(61) => GND_1,
      s_axi_awaddr(60) => GND_1,
      s_axi_awaddr(59) => GND_1,
      s_axi_awaddr(58) => GND_1,
      s_axi_awaddr(57) => GND_1,
      s_axi_awaddr(56) => GND_1,
      s_axi_awaddr(55) => GND_1,
      s_axi_awaddr(54) => GND_1,
      s_axi_awaddr(53) => GND_1,
      s_axi_awaddr(52) => GND_1,
      s_axi_awaddr(51) => GND_1,
      s_axi_awaddr(50) => GND_1,
      s_axi_awaddr(49) => GND_1,
      s_axi_awaddr(48) => GND_1,
      s_axi_awaddr(47) => GND_1,
      s_axi_awaddr(46) => GND_1,
      s_axi_awaddr(45) => GND_1,
      s_axi_awaddr(44) => GND_1,
      s_axi_awaddr(43) => GND_1,
      s_axi_awaddr(42) => GND_1,
      s_axi_awaddr(41) => GND_1,
      s_axi_awaddr(40) => GND_1,
      s_axi_awaddr(39) => GND_1,
      s_axi_awaddr(38) => GND_1,
      s_axi_awaddr(37) => GND_1,
      s_axi_awaddr(36) => GND_1,
      s_axi_awaddr(35) => GND_1,
      s_axi_awaddr(34) => GND_1,
      s_axi_awaddr(33) => GND_1,
      s_axi_awaddr(32) => GND_1,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awburst(11) => GND_1,
      s_axi_awburst(10) => GND_1,
      s_axi_awburst(9) => GND_1,
      s_axi_awburst(8) => GND_1,
      s_axi_awburst(7 downto 6) => s03_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awburst(5 downto 4) => s02_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awburst(3) => GND_1,
      s_axi_awburst(2) => GND_1,
      s_axi_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awcache(23) => GND_1,
      s_axi_awcache(22) => GND_1,
      s_axi_awcache(21) => GND_1,
      s_axi_awcache(20) => GND_1,
      s_axi_awcache(19) => GND_1,
      s_axi_awcache(18) => GND_1,
      s_axi_awcache(17) => GND_1,
      s_axi_awcache(16) => GND_1,
      s_axi_awcache(15 downto 12) => s03_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awcache(11 downto 8) => s02_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awcache(7) => GND_1,
      s_axi_awcache(6) => GND_1,
      s_axi_awcache(5) => GND_1,
      s_axi_awcache(4) => GND_1,
      s_axi_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awid(17) => GND_1,
      s_axi_awid(16) => GND_1,
      s_axi_awid(15) => GND_1,
      s_axi_awid(14) => GND_1,
      s_axi_awid(13) => GND_1,
      s_axi_awid(12) => GND_1,
      s_axi_awid(11) => GND_1,
      s_axi_awid(10) => GND_1,
      s_axi_awid(9) => GND_1,
      s_axi_awid(8) => GND_1,
      s_axi_awid(7) => GND_1,
      s_axi_awid(6) => GND_1,
      s_axi_awid(5) => GND_1,
      s_axi_awid(4) => GND_1,
      s_axi_awid(3) => GND_1,
      s_axi_awid(2) => GND_1,
      s_axi_awid(1) => GND_1,
      s_axi_awid(0) => GND_1,
      s_axi_awlen(47) => GND_1,
      s_axi_awlen(46) => GND_1,
      s_axi_awlen(45) => GND_1,
      s_axi_awlen(44) => GND_1,
      s_axi_awlen(43) => GND_1,
      s_axi_awlen(42) => GND_1,
      s_axi_awlen(41) => GND_1,
      s_axi_awlen(40) => GND_1,
      s_axi_awlen(39) => GND_1,
      s_axi_awlen(38) => GND_1,
      s_axi_awlen(37) => GND_1,
      s_axi_awlen(36) => GND_1,
      s_axi_awlen(35) => GND_1,
      s_axi_awlen(34) => GND_1,
      s_axi_awlen(33) => GND_1,
      s_axi_awlen(32) => GND_1,
      s_axi_awlen(31 downto 24) => s03_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlen(23 downto 16) => s02_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlen(15) => GND_1,
      s_axi_awlen(14) => GND_1,
      s_axi_awlen(13) => GND_1,
      s_axi_awlen(12) => GND_1,
      s_axi_awlen(11) => GND_1,
      s_axi_awlen(10) => GND_1,
      s_axi_awlen(9) => GND_1,
      s_axi_awlen(8) => GND_1,
      s_axi_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlock(5) => GND_1,
      s_axi_awlock(4) => GND_1,
      s_axi_awlock(3) => s03_couplers_to_xbar_AWLOCK(0),
      s_axi_awlock(2) => s02_couplers_to_xbar_AWLOCK(0),
      s_axi_awlock(1) => GND_1,
      s_axi_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      s_axi_awprot(17) => GND_1,
      s_axi_awprot(16) => GND_1,
      s_axi_awprot(15) => GND_1,
      s_axi_awprot(14) => GND_1,
      s_axi_awprot(13) => GND_1,
      s_axi_awprot(12) => GND_1,
      s_axi_awprot(11 downto 9) => s03_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awprot(8 downto 6) => s02_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awprot(5) => GND_1,
      s_axi_awprot(4) => GND_1,
      s_axi_awprot(3) => GND_1,
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awqos(23) => GND_1,
      s_axi_awqos(22) => GND_1,
      s_axi_awqos(21) => GND_1,
      s_axi_awqos(20) => GND_1,
      s_axi_awqos(19) => GND_1,
      s_axi_awqos(18) => GND_1,
      s_axi_awqos(17) => GND_1,
      s_axi_awqos(16) => GND_1,
      s_axi_awqos(15 downto 12) => s03_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awqos(11 downto 8) => s02_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awqos(7) => GND_1,
      s_axi_awqos(6) => GND_1,
      s_axi_awqos(5) => GND_1,
      s_axi_awqos(4) => GND_1,
      s_axi_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awready(5 downto 4) => NLW_xbar_s_axi_awready_UNCONNECTED(5 downto 4),
      s_axi_awready(3) => s03_couplers_to_xbar_AWREADY(3),
      s_axi_awready(2) => s02_couplers_to_xbar_AWREADY(2),
      s_axi_awready(1) => NLW_xbar_s_axi_awready_UNCONNECTED(1),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awsize(17) => GND_1,
      s_axi_awsize(16) => GND_1,
      s_axi_awsize(15) => GND_1,
      s_axi_awsize(14) => GND_1,
      s_axi_awsize(13) => GND_1,
      s_axi_awsize(12) => GND_1,
      s_axi_awsize(11 downto 9) => s03_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awsize(8 downto 6) => s02_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awsize(5) => GND_1,
      s_axi_awsize(4) => GND_1,
      s_axi_awsize(3) => GND_1,
      s_axi_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awvalid(5) => GND_1,
      s_axi_awvalid(4) => GND_1,
      s_axi_awvalid(3) => s03_couplers_to_xbar_AWVALID,
      s_axi_awvalid(2) => s02_couplers_to_xbar_AWVALID,
      s_axi_awvalid(1) => GND_1,
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bid(17 downto 0) => NLW_xbar_s_axi_bid_UNCONNECTED(17 downto 0),
      s_axi_bready(5) => GND_1,
      s_axi_bready(4) => GND_1,
      s_axi_bready(3) => s03_couplers_to_xbar_BREADY,
      s_axi_bready(2) => s02_couplers_to_xbar_BREADY,
      s_axi_bready(1) => GND_1,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(11 downto 8) => NLW_xbar_s_axi_bresp_UNCONNECTED(11 downto 8),
      s_axi_bresp(7 downto 6) => s03_couplers_to_xbar_BRESP(7 downto 6),
      s_axi_bresp(5 downto 4) => s02_couplers_to_xbar_BRESP(5 downto 4),
      s_axi_bresp(3 downto 2) => NLW_xbar_s_axi_bresp_UNCONNECTED(3 downto 2),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(5 downto 4) => NLW_xbar_s_axi_bvalid_UNCONNECTED(5 downto 4),
      s_axi_bvalid(3) => s03_couplers_to_xbar_BVALID(3),
      s_axi_bvalid(2) => s02_couplers_to_xbar_BVALID(2),
      s_axi_bvalid(1) => NLW_xbar_s_axi_bvalid_UNCONNECTED(1),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(3071 downto 2560) => s05_couplers_to_xbar_RDATA(3071 downto 2560),
      s_axi_rdata(2559 downto 2048) => s04_couplers_to_xbar_RDATA(2559 downto 2048),
      s_axi_rdata(2047 downto 1024) => NLW_xbar_s_axi_rdata_UNCONNECTED(2047 downto 1024),
      s_axi_rdata(1023 downto 512) => s01_couplers_to_xbar_RDATA(1023 downto 512),
      s_axi_rdata(511 downto 0) => s00_couplers_to_xbar_RDATA(511 downto 0),
      s_axi_rid(17 downto 0) => NLW_xbar_s_axi_rid_UNCONNECTED(17 downto 0),
      s_axi_rlast(5) => s05_couplers_to_xbar_RLAST(5),
      s_axi_rlast(4) => s04_couplers_to_xbar_RLAST(4),
      s_axi_rlast(3 downto 2) => NLW_xbar_s_axi_rlast_UNCONNECTED(3 downto 2),
      s_axi_rlast(1) => s01_couplers_to_xbar_RLAST(1),
      s_axi_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      s_axi_rready(5) => s05_couplers_to_xbar_RREADY,
      s_axi_rready(4) => s04_couplers_to_xbar_RREADY,
      s_axi_rready(3) => GND_1,
      s_axi_rready(2) => GND_1,
      s_axi_rready(1) => s01_couplers_to_xbar_RREADY,
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(11 downto 10) => s05_couplers_to_xbar_RRESP(11 downto 10),
      s_axi_rresp(9 downto 8) => s04_couplers_to_xbar_RRESP(9 downto 8),
      s_axi_rresp(7 downto 4) => NLW_xbar_s_axi_rresp_UNCONNECTED(7 downto 4),
      s_axi_rresp(3 downto 2) => s01_couplers_to_xbar_RRESP(3 downto 2),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(5) => s05_couplers_to_xbar_RVALID(5),
      s_axi_rvalid(4) => s04_couplers_to_xbar_RVALID(4),
      s_axi_rvalid(3 downto 2) => NLW_xbar_s_axi_rvalid_UNCONNECTED(3 downto 2),
      s_axi_rvalid(1) => s01_couplers_to_xbar_RVALID(1),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(3071) => GND_1,
      s_axi_wdata(3070) => GND_1,
      s_axi_wdata(3069) => GND_1,
      s_axi_wdata(3068) => GND_1,
      s_axi_wdata(3067) => GND_1,
      s_axi_wdata(3066) => GND_1,
      s_axi_wdata(3065) => GND_1,
      s_axi_wdata(3064) => GND_1,
      s_axi_wdata(3063) => GND_1,
      s_axi_wdata(3062) => GND_1,
      s_axi_wdata(3061) => GND_1,
      s_axi_wdata(3060) => GND_1,
      s_axi_wdata(3059) => GND_1,
      s_axi_wdata(3058) => GND_1,
      s_axi_wdata(3057) => GND_1,
      s_axi_wdata(3056) => GND_1,
      s_axi_wdata(3055) => GND_1,
      s_axi_wdata(3054) => GND_1,
      s_axi_wdata(3053) => GND_1,
      s_axi_wdata(3052) => GND_1,
      s_axi_wdata(3051) => GND_1,
      s_axi_wdata(3050) => GND_1,
      s_axi_wdata(3049) => GND_1,
      s_axi_wdata(3048) => GND_1,
      s_axi_wdata(3047) => GND_1,
      s_axi_wdata(3046) => GND_1,
      s_axi_wdata(3045) => GND_1,
      s_axi_wdata(3044) => GND_1,
      s_axi_wdata(3043) => GND_1,
      s_axi_wdata(3042) => GND_1,
      s_axi_wdata(3041) => GND_1,
      s_axi_wdata(3040) => GND_1,
      s_axi_wdata(3039) => GND_1,
      s_axi_wdata(3038) => GND_1,
      s_axi_wdata(3037) => GND_1,
      s_axi_wdata(3036) => GND_1,
      s_axi_wdata(3035) => GND_1,
      s_axi_wdata(3034) => GND_1,
      s_axi_wdata(3033) => GND_1,
      s_axi_wdata(3032) => GND_1,
      s_axi_wdata(3031) => GND_1,
      s_axi_wdata(3030) => GND_1,
      s_axi_wdata(3029) => GND_1,
      s_axi_wdata(3028) => GND_1,
      s_axi_wdata(3027) => GND_1,
      s_axi_wdata(3026) => GND_1,
      s_axi_wdata(3025) => GND_1,
      s_axi_wdata(3024) => GND_1,
      s_axi_wdata(3023) => GND_1,
      s_axi_wdata(3022) => GND_1,
      s_axi_wdata(3021) => GND_1,
      s_axi_wdata(3020) => GND_1,
      s_axi_wdata(3019) => GND_1,
      s_axi_wdata(3018) => GND_1,
      s_axi_wdata(3017) => GND_1,
      s_axi_wdata(3016) => GND_1,
      s_axi_wdata(3015) => GND_1,
      s_axi_wdata(3014) => GND_1,
      s_axi_wdata(3013) => GND_1,
      s_axi_wdata(3012) => GND_1,
      s_axi_wdata(3011) => GND_1,
      s_axi_wdata(3010) => GND_1,
      s_axi_wdata(3009) => GND_1,
      s_axi_wdata(3008) => GND_1,
      s_axi_wdata(3007) => GND_1,
      s_axi_wdata(3006) => GND_1,
      s_axi_wdata(3005) => GND_1,
      s_axi_wdata(3004) => GND_1,
      s_axi_wdata(3003) => GND_1,
      s_axi_wdata(3002) => GND_1,
      s_axi_wdata(3001) => GND_1,
      s_axi_wdata(3000) => GND_1,
      s_axi_wdata(2999) => GND_1,
      s_axi_wdata(2998) => GND_1,
      s_axi_wdata(2997) => GND_1,
      s_axi_wdata(2996) => GND_1,
      s_axi_wdata(2995) => GND_1,
      s_axi_wdata(2994) => GND_1,
      s_axi_wdata(2993) => GND_1,
      s_axi_wdata(2992) => GND_1,
      s_axi_wdata(2991) => GND_1,
      s_axi_wdata(2990) => GND_1,
      s_axi_wdata(2989) => GND_1,
      s_axi_wdata(2988) => GND_1,
      s_axi_wdata(2987) => GND_1,
      s_axi_wdata(2986) => GND_1,
      s_axi_wdata(2985) => GND_1,
      s_axi_wdata(2984) => GND_1,
      s_axi_wdata(2983) => GND_1,
      s_axi_wdata(2982) => GND_1,
      s_axi_wdata(2981) => GND_1,
      s_axi_wdata(2980) => GND_1,
      s_axi_wdata(2979) => GND_1,
      s_axi_wdata(2978) => GND_1,
      s_axi_wdata(2977) => GND_1,
      s_axi_wdata(2976) => GND_1,
      s_axi_wdata(2975) => GND_1,
      s_axi_wdata(2974) => GND_1,
      s_axi_wdata(2973) => GND_1,
      s_axi_wdata(2972) => GND_1,
      s_axi_wdata(2971) => GND_1,
      s_axi_wdata(2970) => GND_1,
      s_axi_wdata(2969) => GND_1,
      s_axi_wdata(2968) => GND_1,
      s_axi_wdata(2967) => GND_1,
      s_axi_wdata(2966) => GND_1,
      s_axi_wdata(2965) => GND_1,
      s_axi_wdata(2964) => GND_1,
      s_axi_wdata(2963) => GND_1,
      s_axi_wdata(2962) => GND_1,
      s_axi_wdata(2961) => GND_1,
      s_axi_wdata(2960) => GND_1,
      s_axi_wdata(2959) => GND_1,
      s_axi_wdata(2958) => GND_1,
      s_axi_wdata(2957) => GND_1,
      s_axi_wdata(2956) => GND_1,
      s_axi_wdata(2955) => GND_1,
      s_axi_wdata(2954) => GND_1,
      s_axi_wdata(2953) => GND_1,
      s_axi_wdata(2952) => GND_1,
      s_axi_wdata(2951) => GND_1,
      s_axi_wdata(2950) => GND_1,
      s_axi_wdata(2949) => GND_1,
      s_axi_wdata(2948) => GND_1,
      s_axi_wdata(2947) => GND_1,
      s_axi_wdata(2946) => GND_1,
      s_axi_wdata(2945) => GND_1,
      s_axi_wdata(2944) => GND_1,
      s_axi_wdata(2943) => GND_1,
      s_axi_wdata(2942) => GND_1,
      s_axi_wdata(2941) => GND_1,
      s_axi_wdata(2940) => GND_1,
      s_axi_wdata(2939) => GND_1,
      s_axi_wdata(2938) => GND_1,
      s_axi_wdata(2937) => GND_1,
      s_axi_wdata(2936) => GND_1,
      s_axi_wdata(2935) => GND_1,
      s_axi_wdata(2934) => GND_1,
      s_axi_wdata(2933) => GND_1,
      s_axi_wdata(2932) => GND_1,
      s_axi_wdata(2931) => GND_1,
      s_axi_wdata(2930) => GND_1,
      s_axi_wdata(2929) => GND_1,
      s_axi_wdata(2928) => GND_1,
      s_axi_wdata(2927) => GND_1,
      s_axi_wdata(2926) => GND_1,
      s_axi_wdata(2925) => GND_1,
      s_axi_wdata(2924) => GND_1,
      s_axi_wdata(2923) => GND_1,
      s_axi_wdata(2922) => GND_1,
      s_axi_wdata(2921) => GND_1,
      s_axi_wdata(2920) => GND_1,
      s_axi_wdata(2919) => GND_1,
      s_axi_wdata(2918) => GND_1,
      s_axi_wdata(2917) => GND_1,
      s_axi_wdata(2916) => GND_1,
      s_axi_wdata(2915) => GND_1,
      s_axi_wdata(2914) => GND_1,
      s_axi_wdata(2913) => GND_1,
      s_axi_wdata(2912) => GND_1,
      s_axi_wdata(2911) => GND_1,
      s_axi_wdata(2910) => GND_1,
      s_axi_wdata(2909) => GND_1,
      s_axi_wdata(2908) => GND_1,
      s_axi_wdata(2907) => GND_1,
      s_axi_wdata(2906) => GND_1,
      s_axi_wdata(2905) => GND_1,
      s_axi_wdata(2904) => GND_1,
      s_axi_wdata(2903) => GND_1,
      s_axi_wdata(2902) => GND_1,
      s_axi_wdata(2901) => GND_1,
      s_axi_wdata(2900) => GND_1,
      s_axi_wdata(2899) => GND_1,
      s_axi_wdata(2898) => GND_1,
      s_axi_wdata(2897) => GND_1,
      s_axi_wdata(2896) => GND_1,
      s_axi_wdata(2895) => GND_1,
      s_axi_wdata(2894) => GND_1,
      s_axi_wdata(2893) => GND_1,
      s_axi_wdata(2892) => GND_1,
      s_axi_wdata(2891) => GND_1,
      s_axi_wdata(2890) => GND_1,
      s_axi_wdata(2889) => GND_1,
      s_axi_wdata(2888) => GND_1,
      s_axi_wdata(2887) => GND_1,
      s_axi_wdata(2886) => GND_1,
      s_axi_wdata(2885) => GND_1,
      s_axi_wdata(2884) => GND_1,
      s_axi_wdata(2883) => GND_1,
      s_axi_wdata(2882) => GND_1,
      s_axi_wdata(2881) => GND_1,
      s_axi_wdata(2880) => GND_1,
      s_axi_wdata(2879) => GND_1,
      s_axi_wdata(2878) => GND_1,
      s_axi_wdata(2877) => GND_1,
      s_axi_wdata(2876) => GND_1,
      s_axi_wdata(2875) => GND_1,
      s_axi_wdata(2874) => GND_1,
      s_axi_wdata(2873) => GND_1,
      s_axi_wdata(2872) => GND_1,
      s_axi_wdata(2871) => GND_1,
      s_axi_wdata(2870) => GND_1,
      s_axi_wdata(2869) => GND_1,
      s_axi_wdata(2868) => GND_1,
      s_axi_wdata(2867) => GND_1,
      s_axi_wdata(2866) => GND_1,
      s_axi_wdata(2865) => GND_1,
      s_axi_wdata(2864) => GND_1,
      s_axi_wdata(2863) => GND_1,
      s_axi_wdata(2862) => GND_1,
      s_axi_wdata(2861) => GND_1,
      s_axi_wdata(2860) => GND_1,
      s_axi_wdata(2859) => GND_1,
      s_axi_wdata(2858) => GND_1,
      s_axi_wdata(2857) => GND_1,
      s_axi_wdata(2856) => GND_1,
      s_axi_wdata(2855) => GND_1,
      s_axi_wdata(2854) => GND_1,
      s_axi_wdata(2853) => GND_1,
      s_axi_wdata(2852) => GND_1,
      s_axi_wdata(2851) => GND_1,
      s_axi_wdata(2850) => GND_1,
      s_axi_wdata(2849) => GND_1,
      s_axi_wdata(2848) => GND_1,
      s_axi_wdata(2847) => GND_1,
      s_axi_wdata(2846) => GND_1,
      s_axi_wdata(2845) => GND_1,
      s_axi_wdata(2844) => GND_1,
      s_axi_wdata(2843) => GND_1,
      s_axi_wdata(2842) => GND_1,
      s_axi_wdata(2841) => GND_1,
      s_axi_wdata(2840) => GND_1,
      s_axi_wdata(2839) => GND_1,
      s_axi_wdata(2838) => GND_1,
      s_axi_wdata(2837) => GND_1,
      s_axi_wdata(2836) => GND_1,
      s_axi_wdata(2835) => GND_1,
      s_axi_wdata(2834) => GND_1,
      s_axi_wdata(2833) => GND_1,
      s_axi_wdata(2832) => GND_1,
      s_axi_wdata(2831) => GND_1,
      s_axi_wdata(2830) => GND_1,
      s_axi_wdata(2829) => GND_1,
      s_axi_wdata(2828) => GND_1,
      s_axi_wdata(2827) => GND_1,
      s_axi_wdata(2826) => GND_1,
      s_axi_wdata(2825) => GND_1,
      s_axi_wdata(2824) => GND_1,
      s_axi_wdata(2823) => GND_1,
      s_axi_wdata(2822) => GND_1,
      s_axi_wdata(2821) => GND_1,
      s_axi_wdata(2820) => GND_1,
      s_axi_wdata(2819) => GND_1,
      s_axi_wdata(2818) => GND_1,
      s_axi_wdata(2817) => GND_1,
      s_axi_wdata(2816) => GND_1,
      s_axi_wdata(2815) => GND_1,
      s_axi_wdata(2814) => GND_1,
      s_axi_wdata(2813) => GND_1,
      s_axi_wdata(2812) => GND_1,
      s_axi_wdata(2811) => GND_1,
      s_axi_wdata(2810) => GND_1,
      s_axi_wdata(2809) => GND_1,
      s_axi_wdata(2808) => GND_1,
      s_axi_wdata(2807) => GND_1,
      s_axi_wdata(2806) => GND_1,
      s_axi_wdata(2805) => GND_1,
      s_axi_wdata(2804) => GND_1,
      s_axi_wdata(2803) => GND_1,
      s_axi_wdata(2802) => GND_1,
      s_axi_wdata(2801) => GND_1,
      s_axi_wdata(2800) => GND_1,
      s_axi_wdata(2799) => GND_1,
      s_axi_wdata(2798) => GND_1,
      s_axi_wdata(2797) => GND_1,
      s_axi_wdata(2796) => GND_1,
      s_axi_wdata(2795) => GND_1,
      s_axi_wdata(2794) => GND_1,
      s_axi_wdata(2793) => GND_1,
      s_axi_wdata(2792) => GND_1,
      s_axi_wdata(2791) => GND_1,
      s_axi_wdata(2790) => GND_1,
      s_axi_wdata(2789) => GND_1,
      s_axi_wdata(2788) => GND_1,
      s_axi_wdata(2787) => GND_1,
      s_axi_wdata(2786) => GND_1,
      s_axi_wdata(2785) => GND_1,
      s_axi_wdata(2784) => GND_1,
      s_axi_wdata(2783) => GND_1,
      s_axi_wdata(2782) => GND_1,
      s_axi_wdata(2781) => GND_1,
      s_axi_wdata(2780) => GND_1,
      s_axi_wdata(2779) => GND_1,
      s_axi_wdata(2778) => GND_1,
      s_axi_wdata(2777) => GND_1,
      s_axi_wdata(2776) => GND_1,
      s_axi_wdata(2775) => GND_1,
      s_axi_wdata(2774) => GND_1,
      s_axi_wdata(2773) => GND_1,
      s_axi_wdata(2772) => GND_1,
      s_axi_wdata(2771) => GND_1,
      s_axi_wdata(2770) => GND_1,
      s_axi_wdata(2769) => GND_1,
      s_axi_wdata(2768) => GND_1,
      s_axi_wdata(2767) => GND_1,
      s_axi_wdata(2766) => GND_1,
      s_axi_wdata(2765) => GND_1,
      s_axi_wdata(2764) => GND_1,
      s_axi_wdata(2763) => GND_1,
      s_axi_wdata(2762) => GND_1,
      s_axi_wdata(2761) => GND_1,
      s_axi_wdata(2760) => GND_1,
      s_axi_wdata(2759) => GND_1,
      s_axi_wdata(2758) => GND_1,
      s_axi_wdata(2757) => GND_1,
      s_axi_wdata(2756) => GND_1,
      s_axi_wdata(2755) => GND_1,
      s_axi_wdata(2754) => GND_1,
      s_axi_wdata(2753) => GND_1,
      s_axi_wdata(2752) => GND_1,
      s_axi_wdata(2751) => GND_1,
      s_axi_wdata(2750) => GND_1,
      s_axi_wdata(2749) => GND_1,
      s_axi_wdata(2748) => GND_1,
      s_axi_wdata(2747) => GND_1,
      s_axi_wdata(2746) => GND_1,
      s_axi_wdata(2745) => GND_1,
      s_axi_wdata(2744) => GND_1,
      s_axi_wdata(2743) => GND_1,
      s_axi_wdata(2742) => GND_1,
      s_axi_wdata(2741) => GND_1,
      s_axi_wdata(2740) => GND_1,
      s_axi_wdata(2739) => GND_1,
      s_axi_wdata(2738) => GND_1,
      s_axi_wdata(2737) => GND_1,
      s_axi_wdata(2736) => GND_1,
      s_axi_wdata(2735) => GND_1,
      s_axi_wdata(2734) => GND_1,
      s_axi_wdata(2733) => GND_1,
      s_axi_wdata(2732) => GND_1,
      s_axi_wdata(2731) => GND_1,
      s_axi_wdata(2730) => GND_1,
      s_axi_wdata(2729) => GND_1,
      s_axi_wdata(2728) => GND_1,
      s_axi_wdata(2727) => GND_1,
      s_axi_wdata(2726) => GND_1,
      s_axi_wdata(2725) => GND_1,
      s_axi_wdata(2724) => GND_1,
      s_axi_wdata(2723) => GND_1,
      s_axi_wdata(2722) => GND_1,
      s_axi_wdata(2721) => GND_1,
      s_axi_wdata(2720) => GND_1,
      s_axi_wdata(2719) => GND_1,
      s_axi_wdata(2718) => GND_1,
      s_axi_wdata(2717) => GND_1,
      s_axi_wdata(2716) => GND_1,
      s_axi_wdata(2715) => GND_1,
      s_axi_wdata(2714) => GND_1,
      s_axi_wdata(2713) => GND_1,
      s_axi_wdata(2712) => GND_1,
      s_axi_wdata(2711) => GND_1,
      s_axi_wdata(2710) => GND_1,
      s_axi_wdata(2709) => GND_1,
      s_axi_wdata(2708) => GND_1,
      s_axi_wdata(2707) => GND_1,
      s_axi_wdata(2706) => GND_1,
      s_axi_wdata(2705) => GND_1,
      s_axi_wdata(2704) => GND_1,
      s_axi_wdata(2703) => GND_1,
      s_axi_wdata(2702) => GND_1,
      s_axi_wdata(2701) => GND_1,
      s_axi_wdata(2700) => GND_1,
      s_axi_wdata(2699) => GND_1,
      s_axi_wdata(2698) => GND_1,
      s_axi_wdata(2697) => GND_1,
      s_axi_wdata(2696) => GND_1,
      s_axi_wdata(2695) => GND_1,
      s_axi_wdata(2694) => GND_1,
      s_axi_wdata(2693) => GND_1,
      s_axi_wdata(2692) => GND_1,
      s_axi_wdata(2691) => GND_1,
      s_axi_wdata(2690) => GND_1,
      s_axi_wdata(2689) => GND_1,
      s_axi_wdata(2688) => GND_1,
      s_axi_wdata(2687) => GND_1,
      s_axi_wdata(2686) => GND_1,
      s_axi_wdata(2685) => GND_1,
      s_axi_wdata(2684) => GND_1,
      s_axi_wdata(2683) => GND_1,
      s_axi_wdata(2682) => GND_1,
      s_axi_wdata(2681) => GND_1,
      s_axi_wdata(2680) => GND_1,
      s_axi_wdata(2679) => GND_1,
      s_axi_wdata(2678) => GND_1,
      s_axi_wdata(2677) => GND_1,
      s_axi_wdata(2676) => GND_1,
      s_axi_wdata(2675) => GND_1,
      s_axi_wdata(2674) => GND_1,
      s_axi_wdata(2673) => GND_1,
      s_axi_wdata(2672) => GND_1,
      s_axi_wdata(2671) => GND_1,
      s_axi_wdata(2670) => GND_1,
      s_axi_wdata(2669) => GND_1,
      s_axi_wdata(2668) => GND_1,
      s_axi_wdata(2667) => GND_1,
      s_axi_wdata(2666) => GND_1,
      s_axi_wdata(2665) => GND_1,
      s_axi_wdata(2664) => GND_1,
      s_axi_wdata(2663) => GND_1,
      s_axi_wdata(2662) => GND_1,
      s_axi_wdata(2661) => GND_1,
      s_axi_wdata(2660) => GND_1,
      s_axi_wdata(2659) => GND_1,
      s_axi_wdata(2658) => GND_1,
      s_axi_wdata(2657) => GND_1,
      s_axi_wdata(2656) => GND_1,
      s_axi_wdata(2655) => GND_1,
      s_axi_wdata(2654) => GND_1,
      s_axi_wdata(2653) => GND_1,
      s_axi_wdata(2652) => GND_1,
      s_axi_wdata(2651) => GND_1,
      s_axi_wdata(2650) => GND_1,
      s_axi_wdata(2649) => GND_1,
      s_axi_wdata(2648) => GND_1,
      s_axi_wdata(2647) => GND_1,
      s_axi_wdata(2646) => GND_1,
      s_axi_wdata(2645) => GND_1,
      s_axi_wdata(2644) => GND_1,
      s_axi_wdata(2643) => GND_1,
      s_axi_wdata(2642) => GND_1,
      s_axi_wdata(2641) => GND_1,
      s_axi_wdata(2640) => GND_1,
      s_axi_wdata(2639) => GND_1,
      s_axi_wdata(2638) => GND_1,
      s_axi_wdata(2637) => GND_1,
      s_axi_wdata(2636) => GND_1,
      s_axi_wdata(2635) => GND_1,
      s_axi_wdata(2634) => GND_1,
      s_axi_wdata(2633) => GND_1,
      s_axi_wdata(2632) => GND_1,
      s_axi_wdata(2631) => GND_1,
      s_axi_wdata(2630) => GND_1,
      s_axi_wdata(2629) => GND_1,
      s_axi_wdata(2628) => GND_1,
      s_axi_wdata(2627) => GND_1,
      s_axi_wdata(2626) => GND_1,
      s_axi_wdata(2625) => GND_1,
      s_axi_wdata(2624) => GND_1,
      s_axi_wdata(2623) => GND_1,
      s_axi_wdata(2622) => GND_1,
      s_axi_wdata(2621) => GND_1,
      s_axi_wdata(2620) => GND_1,
      s_axi_wdata(2619) => GND_1,
      s_axi_wdata(2618) => GND_1,
      s_axi_wdata(2617) => GND_1,
      s_axi_wdata(2616) => GND_1,
      s_axi_wdata(2615) => GND_1,
      s_axi_wdata(2614) => GND_1,
      s_axi_wdata(2613) => GND_1,
      s_axi_wdata(2612) => GND_1,
      s_axi_wdata(2611) => GND_1,
      s_axi_wdata(2610) => GND_1,
      s_axi_wdata(2609) => GND_1,
      s_axi_wdata(2608) => GND_1,
      s_axi_wdata(2607) => GND_1,
      s_axi_wdata(2606) => GND_1,
      s_axi_wdata(2605) => GND_1,
      s_axi_wdata(2604) => GND_1,
      s_axi_wdata(2603) => GND_1,
      s_axi_wdata(2602) => GND_1,
      s_axi_wdata(2601) => GND_1,
      s_axi_wdata(2600) => GND_1,
      s_axi_wdata(2599) => GND_1,
      s_axi_wdata(2598) => GND_1,
      s_axi_wdata(2597) => GND_1,
      s_axi_wdata(2596) => GND_1,
      s_axi_wdata(2595) => GND_1,
      s_axi_wdata(2594) => GND_1,
      s_axi_wdata(2593) => GND_1,
      s_axi_wdata(2592) => GND_1,
      s_axi_wdata(2591) => GND_1,
      s_axi_wdata(2590) => GND_1,
      s_axi_wdata(2589) => GND_1,
      s_axi_wdata(2588) => GND_1,
      s_axi_wdata(2587) => GND_1,
      s_axi_wdata(2586) => GND_1,
      s_axi_wdata(2585) => GND_1,
      s_axi_wdata(2584) => GND_1,
      s_axi_wdata(2583) => GND_1,
      s_axi_wdata(2582) => GND_1,
      s_axi_wdata(2581) => GND_1,
      s_axi_wdata(2580) => GND_1,
      s_axi_wdata(2579) => GND_1,
      s_axi_wdata(2578) => GND_1,
      s_axi_wdata(2577) => GND_1,
      s_axi_wdata(2576) => GND_1,
      s_axi_wdata(2575) => GND_1,
      s_axi_wdata(2574) => GND_1,
      s_axi_wdata(2573) => GND_1,
      s_axi_wdata(2572) => GND_1,
      s_axi_wdata(2571) => GND_1,
      s_axi_wdata(2570) => GND_1,
      s_axi_wdata(2569) => GND_1,
      s_axi_wdata(2568) => GND_1,
      s_axi_wdata(2567) => GND_1,
      s_axi_wdata(2566) => GND_1,
      s_axi_wdata(2565) => GND_1,
      s_axi_wdata(2564) => GND_1,
      s_axi_wdata(2563) => GND_1,
      s_axi_wdata(2562) => GND_1,
      s_axi_wdata(2561) => GND_1,
      s_axi_wdata(2560) => GND_1,
      s_axi_wdata(2559) => GND_1,
      s_axi_wdata(2558) => GND_1,
      s_axi_wdata(2557) => GND_1,
      s_axi_wdata(2556) => GND_1,
      s_axi_wdata(2555) => GND_1,
      s_axi_wdata(2554) => GND_1,
      s_axi_wdata(2553) => GND_1,
      s_axi_wdata(2552) => GND_1,
      s_axi_wdata(2551) => GND_1,
      s_axi_wdata(2550) => GND_1,
      s_axi_wdata(2549) => GND_1,
      s_axi_wdata(2548) => GND_1,
      s_axi_wdata(2547) => GND_1,
      s_axi_wdata(2546) => GND_1,
      s_axi_wdata(2545) => GND_1,
      s_axi_wdata(2544) => GND_1,
      s_axi_wdata(2543) => GND_1,
      s_axi_wdata(2542) => GND_1,
      s_axi_wdata(2541) => GND_1,
      s_axi_wdata(2540) => GND_1,
      s_axi_wdata(2539) => GND_1,
      s_axi_wdata(2538) => GND_1,
      s_axi_wdata(2537) => GND_1,
      s_axi_wdata(2536) => GND_1,
      s_axi_wdata(2535) => GND_1,
      s_axi_wdata(2534) => GND_1,
      s_axi_wdata(2533) => GND_1,
      s_axi_wdata(2532) => GND_1,
      s_axi_wdata(2531) => GND_1,
      s_axi_wdata(2530) => GND_1,
      s_axi_wdata(2529) => GND_1,
      s_axi_wdata(2528) => GND_1,
      s_axi_wdata(2527) => GND_1,
      s_axi_wdata(2526) => GND_1,
      s_axi_wdata(2525) => GND_1,
      s_axi_wdata(2524) => GND_1,
      s_axi_wdata(2523) => GND_1,
      s_axi_wdata(2522) => GND_1,
      s_axi_wdata(2521) => GND_1,
      s_axi_wdata(2520) => GND_1,
      s_axi_wdata(2519) => GND_1,
      s_axi_wdata(2518) => GND_1,
      s_axi_wdata(2517) => GND_1,
      s_axi_wdata(2516) => GND_1,
      s_axi_wdata(2515) => GND_1,
      s_axi_wdata(2514) => GND_1,
      s_axi_wdata(2513) => GND_1,
      s_axi_wdata(2512) => GND_1,
      s_axi_wdata(2511) => GND_1,
      s_axi_wdata(2510) => GND_1,
      s_axi_wdata(2509) => GND_1,
      s_axi_wdata(2508) => GND_1,
      s_axi_wdata(2507) => GND_1,
      s_axi_wdata(2506) => GND_1,
      s_axi_wdata(2505) => GND_1,
      s_axi_wdata(2504) => GND_1,
      s_axi_wdata(2503) => GND_1,
      s_axi_wdata(2502) => GND_1,
      s_axi_wdata(2501) => GND_1,
      s_axi_wdata(2500) => GND_1,
      s_axi_wdata(2499) => GND_1,
      s_axi_wdata(2498) => GND_1,
      s_axi_wdata(2497) => GND_1,
      s_axi_wdata(2496) => GND_1,
      s_axi_wdata(2495) => GND_1,
      s_axi_wdata(2494) => GND_1,
      s_axi_wdata(2493) => GND_1,
      s_axi_wdata(2492) => GND_1,
      s_axi_wdata(2491) => GND_1,
      s_axi_wdata(2490) => GND_1,
      s_axi_wdata(2489) => GND_1,
      s_axi_wdata(2488) => GND_1,
      s_axi_wdata(2487) => GND_1,
      s_axi_wdata(2486) => GND_1,
      s_axi_wdata(2485) => GND_1,
      s_axi_wdata(2484) => GND_1,
      s_axi_wdata(2483) => GND_1,
      s_axi_wdata(2482) => GND_1,
      s_axi_wdata(2481) => GND_1,
      s_axi_wdata(2480) => GND_1,
      s_axi_wdata(2479) => GND_1,
      s_axi_wdata(2478) => GND_1,
      s_axi_wdata(2477) => GND_1,
      s_axi_wdata(2476) => GND_1,
      s_axi_wdata(2475) => GND_1,
      s_axi_wdata(2474) => GND_1,
      s_axi_wdata(2473) => GND_1,
      s_axi_wdata(2472) => GND_1,
      s_axi_wdata(2471) => GND_1,
      s_axi_wdata(2470) => GND_1,
      s_axi_wdata(2469) => GND_1,
      s_axi_wdata(2468) => GND_1,
      s_axi_wdata(2467) => GND_1,
      s_axi_wdata(2466) => GND_1,
      s_axi_wdata(2465) => GND_1,
      s_axi_wdata(2464) => GND_1,
      s_axi_wdata(2463) => GND_1,
      s_axi_wdata(2462) => GND_1,
      s_axi_wdata(2461) => GND_1,
      s_axi_wdata(2460) => GND_1,
      s_axi_wdata(2459) => GND_1,
      s_axi_wdata(2458) => GND_1,
      s_axi_wdata(2457) => GND_1,
      s_axi_wdata(2456) => GND_1,
      s_axi_wdata(2455) => GND_1,
      s_axi_wdata(2454) => GND_1,
      s_axi_wdata(2453) => GND_1,
      s_axi_wdata(2452) => GND_1,
      s_axi_wdata(2451) => GND_1,
      s_axi_wdata(2450) => GND_1,
      s_axi_wdata(2449) => GND_1,
      s_axi_wdata(2448) => GND_1,
      s_axi_wdata(2447) => GND_1,
      s_axi_wdata(2446) => GND_1,
      s_axi_wdata(2445) => GND_1,
      s_axi_wdata(2444) => GND_1,
      s_axi_wdata(2443) => GND_1,
      s_axi_wdata(2442) => GND_1,
      s_axi_wdata(2441) => GND_1,
      s_axi_wdata(2440) => GND_1,
      s_axi_wdata(2439) => GND_1,
      s_axi_wdata(2438) => GND_1,
      s_axi_wdata(2437) => GND_1,
      s_axi_wdata(2436) => GND_1,
      s_axi_wdata(2435) => GND_1,
      s_axi_wdata(2434) => GND_1,
      s_axi_wdata(2433) => GND_1,
      s_axi_wdata(2432) => GND_1,
      s_axi_wdata(2431) => GND_1,
      s_axi_wdata(2430) => GND_1,
      s_axi_wdata(2429) => GND_1,
      s_axi_wdata(2428) => GND_1,
      s_axi_wdata(2427) => GND_1,
      s_axi_wdata(2426) => GND_1,
      s_axi_wdata(2425) => GND_1,
      s_axi_wdata(2424) => GND_1,
      s_axi_wdata(2423) => GND_1,
      s_axi_wdata(2422) => GND_1,
      s_axi_wdata(2421) => GND_1,
      s_axi_wdata(2420) => GND_1,
      s_axi_wdata(2419) => GND_1,
      s_axi_wdata(2418) => GND_1,
      s_axi_wdata(2417) => GND_1,
      s_axi_wdata(2416) => GND_1,
      s_axi_wdata(2415) => GND_1,
      s_axi_wdata(2414) => GND_1,
      s_axi_wdata(2413) => GND_1,
      s_axi_wdata(2412) => GND_1,
      s_axi_wdata(2411) => GND_1,
      s_axi_wdata(2410) => GND_1,
      s_axi_wdata(2409) => GND_1,
      s_axi_wdata(2408) => GND_1,
      s_axi_wdata(2407) => GND_1,
      s_axi_wdata(2406) => GND_1,
      s_axi_wdata(2405) => GND_1,
      s_axi_wdata(2404) => GND_1,
      s_axi_wdata(2403) => GND_1,
      s_axi_wdata(2402) => GND_1,
      s_axi_wdata(2401) => GND_1,
      s_axi_wdata(2400) => GND_1,
      s_axi_wdata(2399) => GND_1,
      s_axi_wdata(2398) => GND_1,
      s_axi_wdata(2397) => GND_1,
      s_axi_wdata(2396) => GND_1,
      s_axi_wdata(2395) => GND_1,
      s_axi_wdata(2394) => GND_1,
      s_axi_wdata(2393) => GND_1,
      s_axi_wdata(2392) => GND_1,
      s_axi_wdata(2391) => GND_1,
      s_axi_wdata(2390) => GND_1,
      s_axi_wdata(2389) => GND_1,
      s_axi_wdata(2388) => GND_1,
      s_axi_wdata(2387) => GND_1,
      s_axi_wdata(2386) => GND_1,
      s_axi_wdata(2385) => GND_1,
      s_axi_wdata(2384) => GND_1,
      s_axi_wdata(2383) => GND_1,
      s_axi_wdata(2382) => GND_1,
      s_axi_wdata(2381) => GND_1,
      s_axi_wdata(2380) => GND_1,
      s_axi_wdata(2379) => GND_1,
      s_axi_wdata(2378) => GND_1,
      s_axi_wdata(2377) => GND_1,
      s_axi_wdata(2376) => GND_1,
      s_axi_wdata(2375) => GND_1,
      s_axi_wdata(2374) => GND_1,
      s_axi_wdata(2373) => GND_1,
      s_axi_wdata(2372) => GND_1,
      s_axi_wdata(2371) => GND_1,
      s_axi_wdata(2370) => GND_1,
      s_axi_wdata(2369) => GND_1,
      s_axi_wdata(2368) => GND_1,
      s_axi_wdata(2367) => GND_1,
      s_axi_wdata(2366) => GND_1,
      s_axi_wdata(2365) => GND_1,
      s_axi_wdata(2364) => GND_1,
      s_axi_wdata(2363) => GND_1,
      s_axi_wdata(2362) => GND_1,
      s_axi_wdata(2361) => GND_1,
      s_axi_wdata(2360) => GND_1,
      s_axi_wdata(2359) => GND_1,
      s_axi_wdata(2358) => GND_1,
      s_axi_wdata(2357) => GND_1,
      s_axi_wdata(2356) => GND_1,
      s_axi_wdata(2355) => GND_1,
      s_axi_wdata(2354) => GND_1,
      s_axi_wdata(2353) => GND_1,
      s_axi_wdata(2352) => GND_1,
      s_axi_wdata(2351) => GND_1,
      s_axi_wdata(2350) => GND_1,
      s_axi_wdata(2349) => GND_1,
      s_axi_wdata(2348) => GND_1,
      s_axi_wdata(2347) => GND_1,
      s_axi_wdata(2346) => GND_1,
      s_axi_wdata(2345) => GND_1,
      s_axi_wdata(2344) => GND_1,
      s_axi_wdata(2343) => GND_1,
      s_axi_wdata(2342) => GND_1,
      s_axi_wdata(2341) => GND_1,
      s_axi_wdata(2340) => GND_1,
      s_axi_wdata(2339) => GND_1,
      s_axi_wdata(2338) => GND_1,
      s_axi_wdata(2337) => GND_1,
      s_axi_wdata(2336) => GND_1,
      s_axi_wdata(2335) => GND_1,
      s_axi_wdata(2334) => GND_1,
      s_axi_wdata(2333) => GND_1,
      s_axi_wdata(2332) => GND_1,
      s_axi_wdata(2331) => GND_1,
      s_axi_wdata(2330) => GND_1,
      s_axi_wdata(2329) => GND_1,
      s_axi_wdata(2328) => GND_1,
      s_axi_wdata(2327) => GND_1,
      s_axi_wdata(2326) => GND_1,
      s_axi_wdata(2325) => GND_1,
      s_axi_wdata(2324) => GND_1,
      s_axi_wdata(2323) => GND_1,
      s_axi_wdata(2322) => GND_1,
      s_axi_wdata(2321) => GND_1,
      s_axi_wdata(2320) => GND_1,
      s_axi_wdata(2319) => GND_1,
      s_axi_wdata(2318) => GND_1,
      s_axi_wdata(2317) => GND_1,
      s_axi_wdata(2316) => GND_1,
      s_axi_wdata(2315) => GND_1,
      s_axi_wdata(2314) => GND_1,
      s_axi_wdata(2313) => GND_1,
      s_axi_wdata(2312) => GND_1,
      s_axi_wdata(2311) => GND_1,
      s_axi_wdata(2310) => GND_1,
      s_axi_wdata(2309) => GND_1,
      s_axi_wdata(2308) => GND_1,
      s_axi_wdata(2307) => GND_1,
      s_axi_wdata(2306) => GND_1,
      s_axi_wdata(2305) => GND_1,
      s_axi_wdata(2304) => GND_1,
      s_axi_wdata(2303) => GND_1,
      s_axi_wdata(2302) => GND_1,
      s_axi_wdata(2301) => GND_1,
      s_axi_wdata(2300) => GND_1,
      s_axi_wdata(2299) => GND_1,
      s_axi_wdata(2298) => GND_1,
      s_axi_wdata(2297) => GND_1,
      s_axi_wdata(2296) => GND_1,
      s_axi_wdata(2295) => GND_1,
      s_axi_wdata(2294) => GND_1,
      s_axi_wdata(2293) => GND_1,
      s_axi_wdata(2292) => GND_1,
      s_axi_wdata(2291) => GND_1,
      s_axi_wdata(2290) => GND_1,
      s_axi_wdata(2289) => GND_1,
      s_axi_wdata(2288) => GND_1,
      s_axi_wdata(2287) => GND_1,
      s_axi_wdata(2286) => GND_1,
      s_axi_wdata(2285) => GND_1,
      s_axi_wdata(2284) => GND_1,
      s_axi_wdata(2283) => GND_1,
      s_axi_wdata(2282) => GND_1,
      s_axi_wdata(2281) => GND_1,
      s_axi_wdata(2280) => GND_1,
      s_axi_wdata(2279) => GND_1,
      s_axi_wdata(2278) => GND_1,
      s_axi_wdata(2277) => GND_1,
      s_axi_wdata(2276) => GND_1,
      s_axi_wdata(2275) => GND_1,
      s_axi_wdata(2274) => GND_1,
      s_axi_wdata(2273) => GND_1,
      s_axi_wdata(2272) => GND_1,
      s_axi_wdata(2271) => GND_1,
      s_axi_wdata(2270) => GND_1,
      s_axi_wdata(2269) => GND_1,
      s_axi_wdata(2268) => GND_1,
      s_axi_wdata(2267) => GND_1,
      s_axi_wdata(2266) => GND_1,
      s_axi_wdata(2265) => GND_1,
      s_axi_wdata(2264) => GND_1,
      s_axi_wdata(2263) => GND_1,
      s_axi_wdata(2262) => GND_1,
      s_axi_wdata(2261) => GND_1,
      s_axi_wdata(2260) => GND_1,
      s_axi_wdata(2259) => GND_1,
      s_axi_wdata(2258) => GND_1,
      s_axi_wdata(2257) => GND_1,
      s_axi_wdata(2256) => GND_1,
      s_axi_wdata(2255) => GND_1,
      s_axi_wdata(2254) => GND_1,
      s_axi_wdata(2253) => GND_1,
      s_axi_wdata(2252) => GND_1,
      s_axi_wdata(2251) => GND_1,
      s_axi_wdata(2250) => GND_1,
      s_axi_wdata(2249) => GND_1,
      s_axi_wdata(2248) => GND_1,
      s_axi_wdata(2247) => GND_1,
      s_axi_wdata(2246) => GND_1,
      s_axi_wdata(2245) => GND_1,
      s_axi_wdata(2244) => GND_1,
      s_axi_wdata(2243) => GND_1,
      s_axi_wdata(2242) => GND_1,
      s_axi_wdata(2241) => GND_1,
      s_axi_wdata(2240) => GND_1,
      s_axi_wdata(2239) => GND_1,
      s_axi_wdata(2238) => GND_1,
      s_axi_wdata(2237) => GND_1,
      s_axi_wdata(2236) => GND_1,
      s_axi_wdata(2235) => GND_1,
      s_axi_wdata(2234) => GND_1,
      s_axi_wdata(2233) => GND_1,
      s_axi_wdata(2232) => GND_1,
      s_axi_wdata(2231) => GND_1,
      s_axi_wdata(2230) => GND_1,
      s_axi_wdata(2229) => GND_1,
      s_axi_wdata(2228) => GND_1,
      s_axi_wdata(2227) => GND_1,
      s_axi_wdata(2226) => GND_1,
      s_axi_wdata(2225) => GND_1,
      s_axi_wdata(2224) => GND_1,
      s_axi_wdata(2223) => GND_1,
      s_axi_wdata(2222) => GND_1,
      s_axi_wdata(2221) => GND_1,
      s_axi_wdata(2220) => GND_1,
      s_axi_wdata(2219) => GND_1,
      s_axi_wdata(2218) => GND_1,
      s_axi_wdata(2217) => GND_1,
      s_axi_wdata(2216) => GND_1,
      s_axi_wdata(2215) => GND_1,
      s_axi_wdata(2214) => GND_1,
      s_axi_wdata(2213) => GND_1,
      s_axi_wdata(2212) => GND_1,
      s_axi_wdata(2211) => GND_1,
      s_axi_wdata(2210) => GND_1,
      s_axi_wdata(2209) => GND_1,
      s_axi_wdata(2208) => GND_1,
      s_axi_wdata(2207) => GND_1,
      s_axi_wdata(2206) => GND_1,
      s_axi_wdata(2205) => GND_1,
      s_axi_wdata(2204) => GND_1,
      s_axi_wdata(2203) => GND_1,
      s_axi_wdata(2202) => GND_1,
      s_axi_wdata(2201) => GND_1,
      s_axi_wdata(2200) => GND_1,
      s_axi_wdata(2199) => GND_1,
      s_axi_wdata(2198) => GND_1,
      s_axi_wdata(2197) => GND_1,
      s_axi_wdata(2196) => GND_1,
      s_axi_wdata(2195) => GND_1,
      s_axi_wdata(2194) => GND_1,
      s_axi_wdata(2193) => GND_1,
      s_axi_wdata(2192) => GND_1,
      s_axi_wdata(2191) => GND_1,
      s_axi_wdata(2190) => GND_1,
      s_axi_wdata(2189) => GND_1,
      s_axi_wdata(2188) => GND_1,
      s_axi_wdata(2187) => GND_1,
      s_axi_wdata(2186) => GND_1,
      s_axi_wdata(2185) => GND_1,
      s_axi_wdata(2184) => GND_1,
      s_axi_wdata(2183) => GND_1,
      s_axi_wdata(2182) => GND_1,
      s_axi_wdata(2181) => GND_1,
      s_axi_wdata(2180) => GND_1,
      s_axi_wdata(2179) => GND_1,
      s_axi_wdata(2178) => GND_1,
      s_axi_wdata(2177) => GND_1,
      s_axi_wdata(2176) => GND_1,
      s_axi_wdata(2175) => GND_1,
      s_axi_wdata(2174) => GND_1,
      s_axi_wdata(2173) => GND_1,
      s_axi_wdata(2172) => GND_1,
      s_axi_wdata(2171) => GND_1,
      s_axi_wdata(2170) => GND_1,
      s_axi_wdata(2169) => GND_1,
      s_axi_wdata(2168) => GND_1,
      s_axi_wdata(2167) => GND_1,
      s_axi_wdata(2166) => GND_1,
      s_axi_wdata(2165) => GND_1,
      s_axi_wdata(2164) => GND_1,
      s_axi_wdata(2163) => GND_1,
      s_axi_wdata(2162) => GND_1,
      s_axi_wdata(2161) => GND_1,
      s_axi_wdata(2160) => GND_1,
      s_axi_wdata(2159) => GND_1,
      s_axi_wdata(2158) => GND_1,
      s_axi_wdata(2157) => GND_1,
      s_axi_wdata(2156) => GND_1,
      s_axi_wdata(2155) => GND_1,
      s_axi_wdata(2154) => GND_1,
      s_axi_wdata(2153) => GND_1,
      s_axi_wdata(2152) => GND_1,
      s_axi_wdata(2151) => GND_1,
      s_axi_wdata(2150) => GND_1,
      s_axi_wdata(2149) => GND_1,
      s_axi_wdata(2148) => GND_1,
      s_axi_wdata(2147) => GND_1,
      s_axi_wdata(2146) => GND_1,
      s_axi_wdata(2145) => GND_1,
      s_axi_wdata(2144) => GND_1,
      s_axi_wdata(2143) => GND_1,
      s_axi_wdata(2142) => GND_1,
      s_axi_wdata(2141) => GND_1,
      s_axi_wdata(2140) => GND_1,
      s_axi_wdata(2139) => GND_1,
      s_axi_wdata(2138) => GND_1,
      s_axi_wdata(2137) => GND_1,
      s_axi_wdata(2136) => GND_1,
      s_axi_wdata(2135) => GND_1,
      s_axi_wdata(2134) => GND_1,
      s_axi_wdata(2133) => GND_1,
      s_axi_wdata(2132) => GND_1,
      s_axi_wdata(2131) => GND_1,
      s_axi_wdata(2130) => GND_1,
      s_axi_wdata(2129) => GND_1,
      s_axi_wdata(2128) => GND_1,
      s_axi_wdata(2127) => GND_1,
      s_axi_wdata(2126) => GND_1,
      s_axi_wdata(2125) => GND_1,
      s_axi_wdata(2124) => GND_1,
      s_axi_wdata(2123) => GND_1,
      s_axi_wdata(2122) => GND_1,
      s_axi_wdata(2121) => GND_1,
      s_axi_wdata(2120) => GND_1,
      s_axi_wdata(2119) => GND_1,
      s_axi_wdata(2118) => GND_1,
      s_axi_wdata(2117) => GND_1,
      s_axi_wdata(2116) => GND_1,
      s_axi_wdata(2115) => GND_1,
      s_axi_wdata(2114) => GND_1,
      s_axi_wdata(2113) => GND_1,
      s_axi_wdata(2112) => GND_1,
      s_axi_wdata(2111) => GND_1,
      s_axi_wdata(2110) => GND_1,
      s_axi_wdata(2109) => GND_1,
      s_axi_wdata(2108) => GND_1,
      s_axi_wdata(2107) => GND_1,
      s_axi_wdata(2106) => GND_1,
      s_axi_wdata(2105) => GND_1,
      s_axi_wdata(2104) => GND_1,
      s_axi_wdata(2103) => GND_1,
      s_axi_wdata(2102) => GND_1,
      s_axi_wdata(2101) => GND_1,
      s_axi_wdata(2100) => GND_1,
      s_axi_wdata(2099) => GND_1,
      s_axi_wdata(2098) => GND_1,
      s_axi_wdata(2097) => GND_1,
      s_axi_wdata(2096) => GND_1,
      s_axi_wdata(2095) => GND_1,
      s_axi_wdata(2094) => GND_1,
      s_axi_wdata(2093) => GND_1,
      s_axi_wdata(2092) => GND_1,
      s_axi_wdata(2091) => GND_1,
      s_axi_wdata(2090) => GND_1,
      s_axi_wdata(2089) => GND_1,
      s_axi_wdata(2088) => GND_1,
      s_axi_wdata(2087) => GND_1,
      s_axi_wdata(2086) => GND_1,
      s_axi_wdata(2085) => GND_1,
      s_axi_wdata(2084) => GND_1,
      s_axi_wdata(2083) => GND_1,
      s_axi_wdata(2082) => GND_1,
      s_axi_wdata(2081) => GND_1,
      s_axi_wdata(2080) => GND_1,
      s_axi_wdata(2079) => GND_1,
      s_axi_wdata(2078) => GND_1,
      s_axi_wdata(2077) => GND_1,
      s_axi_wdata(2076) => GND_1,
      s_axi_wdata(2075) => GND_1,
      s_axi_wdata(2074) => GND_1,
      s_axi_wdata(2073) => GND_1,
      s_axi_wdata(2072) => GND_1,
      s_axi_wdata(2071) => GND_1,
      s_axi_wdata(2070) => GND_1,
      s_axi_wdata(2069) => GND_1,
      s_axi_wdata(2068) => GND_1,
      s_axi_wdata(2067) => GND_1,
      s_axi_wdata(2066) => GND_1,
      s_axi_wdata(2065) => GND_1,
      s_axi_wdata(2064) => GND_1,
      s_axi_wdata(2063) => GND_1,
      s_axi_wdata(2062) => GND_1,
      s_axi_wdata(2061) => GND_1,
      s_axi_wdata(2060) => GND_1,
      s_axi_wdata(2059) => GND_1,
      s_axi_wdata(2058) => GND_1,
      s_axi_wdata(2057) => GND_1,
      s_axi_wdata(2056) => GND_1,
      s_axi_wdata(2055) => GND_1,
      s_axi_wdata(2054) => GND_1,
      s_axi_wdata(2053) => GND_1,
      s_axi_wdata(2052) => GND_1,
      s_axi_wdata(2051) => GND_1,
      s_axi_wdata(2050) => GND_1,
      s_axi_wdata(2049) => GND_1,
      s_axi_wdata(2048) => GND_1,
      s_axi_wdata(2047 downto 1536) => s03_couplers_to_xbar_WDATA(511 downto 0),
      s_axi_wdata(1535 downto 1024) => s02_couplers_to_xbar_WDATA(511 downto 0),
      s_axi_wdata(1023) => GND_1,
      s_axi_wdata(1022) => GND_1,
      s_axi_wdata(1021) => GND_1,
      s_axi_wdata(1020) => GND_1,
      s_axi_wdata(1019) => GND_1,
      s_axi_wdata(1018) => GND_1,
      s_axi_wdata(1017) => GND_1,
      s_axi_wdata(1016) => GND_1,
      s_axi_wdata(1015) => GND_1,
      s_axi_wdata(1014) => GND_1,
      s_axi_wdata(1013) => GND_1,
      s_axi_wdata(1012) => GND_1,
      s_axi_wdata(1011) => GND_1,
      s_axi_wdata(1010) => GND_1,
      s_axi_wdata(1009) => GND_1,
      s_axi_wdata(1008) => GND_1,
      s_axi_wdata(1007) => GND_1,
      s_axi_wdata(1006) => GND_1,
      s_axi_wdata(1005) => GND_1,
      s_axi_wdata(1004) => GND_1,
      s_axi_wdata(1003) => GND_1,
      s_axi_wdata(1002) => GND_1,
      s_axi_wdata(1001) => GND_1,
      s_axi_wdata(1000) => GND_1,
      s_axi_wdata(999) => GND_1,
      s_axi_wdata(998) => GND_1,
      s_axi_wdata(997) => GND_1,
      s_axi_wdata(996) => GND_1,
      s_axi_wdata(995) => GND_1,
      s_axi_wdata(994) => GND_1,
      s_axi_wdata(993) => GND_1,
      s_axi_wdata(992) => GND_1,
      s_axi_wdata(991) => GND_1,
      s_axi_wdata(990) => GND_1,
      s_axi_wdata(989) => GND_1,
      s_axi_wdata(988) => GND_1,
      s_axi_wdata(987) => GND_1,
      s_axi_wdata(986) => GND_1,
      s_axi_wdata(985) => GND_1,
      s_axi_wdata(984) => GND_1,
      s_axi_wdata(983) => GND_1,
      s_axi_wdata(982) => GND_1,
      s_axi_wdata(981) => GND_1,
      s_axi_wdata(980) => GND_1,
      s_axi_wdata(979) => GND_1,
      s_axi_wdata(978) => GND_1,
      s_axi_wdata(977) => GND_1,
      s_axi_wdata(976) => GND_1,
      s_axi_wdata(975) => GND_1,
      s_axi_wdata(974) => GND_1,
      s_axi_wdata(973) => GND_1,
      s_axi_wdata(972) => GND_1,
      s_axi_wdata(971) => GND_1,
      s_axi_wdata(970) => GND_1,
      s_axi_wdata(969) => GND_1,
      s_axi_wdata(968) => GND_1,
      s_axi_wdata(967) => GND_1,
      s_axi_wdata(966) => GND_1,
      s_axi_wdata(965) => GND_1,
      s_axi_wdata(964) => GND_1,
      s_axi_wdata(963) => GND_1,
      s_axi_wdata(962) => GND_1,
      s_axi_wdata(961) => GND_1,
      s_axi_wdata(960) => GND_1,
      s_axi_wdata(959) => GND_1,
      s_axi_wdata(958) => GND_1,
      s_axi_wdata(957) => GND_1,
      s_axi_wdata(956) => GND_1,
      s_axi_wdata(955) => GND_1,
      s_axi_wdata(954) => GND_1,
      s_axi_wdata(953) => GND_1,
      s_axi_wdata(952) => GND_1,
      s_axi_wdata(951) => GND_1,
      s_axi_wdata(950) => GND_1,
      s_axi_wdata(949) => GND_1,
      s_axi_wdata(948) => GND_1,
      s_axi_wdata(947) => GND_1,
      s_axi_wdata(946) => GND_1,
      s_axi_wdata(945) => GND_1,
      s_axi_wdata(944) => GND_1,
      s_axi_wdata(943) => GND_1,
      s_axi_wdata(942) => GND_1,
      s_axi_wdata(941) => GND_1,
      s_axi_wdata(940) => GND_1,
      s_axi_wdata(939) => GND_1,
      s_axi_wdata(938) => GND_1,
      s_axi_wdata(937) => GND_1,
      s_axi_wdata(936) => GND_1,
      s_axi_wdata(935) => GND_1,
      s_axi_wdata(934) => GND_1,
      s_axi_wdata(933) => GND_1,
      s_axi_wdata(932) => GND_1,
      s_axi_wdata(931) => GND_1,
      s_axi_wdata(930) => GND_1,
      s_axi_wdata(929) => GND_1,
      s_axi_wdata(928) => GND_1,
      s_axi_wdata(927) => GND_1,
      s_axi_wdata(926) => GND_1,
      s_axi_wdata(925) => GND_1,
      s_axi_wdata(924) => GND_1,
      s_axi_wdata(923) => GND_1,
      s_axi_wdata(922) => GND_1,
      s_axi_wdata(921) => GND_1,
      s_axi_wdata(920) => GND_1,
      s_axi_wdata(919) => GND_1,
      s_axi_wdata(918) => GND_1,
      s_axi_wdata(917) => GND_1,
      s_axi_wdata(916) => GND_1,
      s_axi_wdata(915) => GND_1,
      s_axi_wdata(914) => GND_1,
      s_axi_wdata(913) => GND_1,
      s_axi_wdata(912) => GND_1,
      s_axi_wdata(911) => GND_1,
      s_axi_wdata(910) => GND_1,
      s_axi_wdata(909) => GND_1,
      s_axi_wdata(908) => GND_1,
      s_axi_wdata(907) => GND_1,
      s_axi_wdata(906) => GND_1,
      s_axi_wdata(905) => GND_1,
      s_axi_wdata(904) => GND_1,
      s_axi_wdata(903) => GND_1,
      s_axi_wdata(902) => GND_1,
      s_axi_wdata(901) => GND_1,
      s_axi_wdata(900) => GND_1,
      s_axi_wdata(899) => GND_1,
      s_axi_wdata(898) => GND_1,
      s_axi_wdata(897) => GND_1,
      s_axi_wdata(896) => GND_1,
      s_axi_wdata(895) => GND_1,
      s_axi_wdata(894) => GND_1,
      s_axi_wdata(893) => GND_1,
      s_axi_wdata(892) => GND_1,
      s_axi_wdata(891) => GND_1,
      s_axi_wdata(890) => GND_1,
      s_axi_wdata(889) => GND_1,
      s_axi_wdata(888) => GND_1,
      s_axi_wdata(887) => GND_1,
      s_axi_wdata(886) => GND_1,
      s_axi_wdata(885) => GND_1,
      s_axi_wdata(884) => GND_1,
      s_axi_wdata(883) => GND_1,
      s_axi_wdata(882) => GND_1,
      s_axi_wdata(881) => GND_1,
      s_axi_wdata(880) => GND_1,
      s_axi_wdata(879) => GND_1,
      s_axi_wdata(878) => GND_1,
      s_axi_wdata(877) => GND_1,
      s_axi_wdata(876) => GND_1,
      s_axi_wdata(875) => GND_1,
      s_axi_wdata(874) => GND_1,
      s_axi_wdata(873) => GND_1,
      s_axi_wdata(872) => GND_1,
      s_axi_wdata(871) => GND_1,
      s_axi_wdata(870) => GND_1,
      s_axi_wdata(869) => GND_1,
      s_axi_wdata(868) => GND_1,
      s_axi_wdata(867) => GND_1,
      s_axi_wdata(866) => GND_1,
      s_axi_wdata(865) => GND_1,
      s_axi_wdata(864) => GND_1,
      s_axi_wdata(863) => GND_1,
      s_axi_wdata(862) => GND_1,
      s_axi_wdata(861) => GND_1,
      s_axi_wdata(860) => GND_1,
      s_axi_wdata(859) => GND_1,
      s_axi_wdata(858) => GND_1,
      s_axi_wdata(857) => GND_1,
      s_axi_wdata(856) => GND_1,
      s_axi_wdata(855) => GND_1,
      s_axi_wdata(854) => GND_1,
      s_axi_wdata(853) => GND_1,
      s_axi_wdata(852) => GND_1,
      s_axi_wdata(851) => GND_1,
      s_axi_wdata(850) => GND_1,
      s_axi_wdata(849) => GND_1,
      s_axi_wdata(848) => GND_1,
      s_axi_wdata(847) => GND_1,
      s_axi_wdata(846) => GND_1,
      s_axi_wdata(845) => GND_1,
      s_axi_wdata(844) => GND_1,
      s_axi_wdata(843) => GND_1,
      s_axi_wdata(842) => GND_1,
      s_axi_wdata(841) => GND_1,
      s_axi_wdata(840) => GND_1,
      s_axi_wdata(839) => GND_1,
      s_axi_wdata(838) => GND_1,
      s_axi_wdata(837) => GND_1,
      s_axi_wdata(836) => GND_1,
      s_axi_wdata(835) => GND_1,
      s_axi_wdata(834) => GND_1,
      s_axi_wdata(833) => GND_1,
      s_axi_wdata(832) => GND_1,
      s_axi_wdata(831) => GND_1,
      s_axi_wdata(830) => GND_1,
      s_axi_wdata(829) => GND_1,
      s_axi_wdata(828) => GND_1,
      s_axi_wdata(827) => GND_1,
      s_axi_wdata(826) => GND_1,
      s_axi_wdata(825) => GND_1,
      s_axi_wdata(824) => GND_1,
      s_axi_wdata(823) => GND_1,
      s_axi_wdata(822) => GND_1,
      s_axi_wdata(821) => GND_1,
      s_axi_wdata(820) => GND_1,
      s_axi_wdata(819) => GND_1,
      s_axi_wdata(818) => GND_1,
      s_axi_wdata(817) => GND_1,
      s_axi_wdata(816) => GND_1,
      s_axi_wdata(815) => GND_1,
      s_axi_wdata(814) => GND_1,
      s_axi_wdata(813) => GND_1,
      s_axi_wdata(812) => GND_1,
      s_axi_wdata(811) => GND_1,
      s_axi_wdata(810) => GND_1,
      s_axi_wdata(809) => GND_1,
      s_axi_wdata(808) => GND_1,
      s_axi_wdata(807) => GND_1,
      s_axi_wdata(806) => GND_1,
      s_axi_wdata(805) => GND_1,
      s_axi_wdata(804) => GND_1,
      s_axi_wdata(803) => GND_1,
      s_axi_wdata(802) => GND_1,
      s_axi_wdata(801) => GND_1,
      s_axi_wdata(800) => GND_1,
      s_axi_wdata(799) => GND_1,
      s_axi_wdata(798) => GND_1,
      s_axi_wdata(797) => GND_1,
      s_axi_wdata(796) => GND_1,
      s_axi_wdata(795) => GND_1,
      s_axi_wdata(794) => GND_1,
      s_axi_wdata(793) => GND_1,
      s_axi_wdata(792) => GND_1,
      s_axi_wdata(791) => GND_1,
      s_axi_wdata(790) => GND_1,
      s_axi_wdata(789) => GND_1,
      s_axi_wdata(788) => GND_1,
      s_axi_wdata(787) => GND_1,
      s_axi_wdata(786) => GND_1,
      s_axi_wdata(785) => GND_1,
      s_axi_wdata(784) => GND_1,
      s_axi_wdata(783) => GND_1,
      s_axi_wdata(782) => GND_1,
      s_axi_wdata(781) => GND_1,
      s_axi_wdata(780) => GND_1,
      s_axi_wdata(779) => GND_1,
      s_axi_wdata(778) => GND_1,
      s_axi_wdata(777) => GND_1,
      s_axi_wdata(776) => GND_1,
      s_axi_wdata(775) => GND_1,
      s_axi_wdata(774) => GND_1,
      s_axi_wdata(773) => GND_1,
      s_axi_wdata(772) => GND_1,
      s_axi_wdata(771) => GND_1,
      s_axi_wdata(770) => GND_1,
      s_axi_wdata(769) => GND_1,
      s_axi_wdata(768) => GND_1,
      s_axi_wdata(767) => GND_1,
      s_axi_wdata(766) => GND_1,
      s_axi_wdata(765) => GND_1,
      s_axi_wdata(764) => GND_1,
      s_axi_wdata(763) => GND_1,
      s_axi_wdata(762) => GND_1,
      s_axi_wdata(761) => GND_1,
      s_axi_wdata(760) => GND_1,
      s_axi_wdata(759) => GND_1,
      s_axi_wdata(758) => GND_1,
      s_axi_wdata(757) => GND_1,
      s_axi_wdata(756) => GND_1,
      s_axi_wdata(755) => GND_1,
      s_axi_wdata(754) => GND_1,
      s_axi_wdata(753) => GND_1,
      s_axi_wdata(752) => GND_1,
      s_axi_wdata(751) => GND_1,
      s_axi_wdata(750) => GND_1,
      s_axi_wdata(749) => GND_1,
      s_axi_wdata(748) => GND_1,
      s_axi_wdata(747) => GND_1,
      s_axi_wdata(746) => GND_1,
      s_axi_wdata(745) => GND_1,
      s_axi_wdata(744) => GND_1,
      s_axi_wdata(743) => GND_1,
      s_axi_wdata(742) => GND_1,
      s_axi_wdata(741) => GND_1,
      s_axi_wdata(740) => GND_1,
      s_axi_wdata(739) => GND_1,
      s_axi_wdata(738) => GND_1,
      s_axi_wdata(737) => GND_1,
      s_axi_wdata(736) => GND_1,
      s_axi_wdata(735) => GND_1,
      s_axi_wdata(734) => GND_1,
      s_axi_wdata(733) => GND_1,
      s_axi_wdata(732) => GND_1,
      s_axi_wdata(731) => GND_1,
      s_axi_wdata(730) => GND_1,
      s_axi_wdata(729) => GND_1,
      s_axi_wdata(728) => GND_1,
      s_axi_wdata(727) => GND_1,
      s_axi_wdata(726) => GND_1,
      s_axi_wdata(725) => GND_1,
      s_axi_wdata(724) => GND_1,
      s_axi_wdata(723) => GND_1,
      s_axi_wdata(722) => GND_1,
      s_axi_wdata(721) => GND_1,
      s_axi_wdata(720) => GND_1,
      s_axi_wdata(719) => GND_1,
      s_axi_wdata(718) => GND_1,
      s_axi_wdata(717) => GND_1,
      s_axi_wdata(716) => GND_1,
      s_axi_wdata(715) => GND_1,
      s_axi_wdata(714) => GND_1,
      s_axi_wdata(713) => GND_1,
      s_axi_wdata(712) => GND_1,
      s_axi_wdata(711) => GND_1,
      s_axi_wdata(710) => GND_1,
      s_axi_wdata(709) => GND_1,
      s_axi_wdata(708) => GND_1,
      s_axi_wdata(707) => GND_1,
      s_axi_wdata(706) => GND_1,
      s_axi_wdata(705) => GND_1,
      s_axi_wdata(704) => GND_1,
      s_axi_wdata(703) => GND_1,
      s_axi_wdata(702) => GND_1,
      s_axi_wdata(701) => GND_1,
      s_axi_wdata(700) => GND_1,
      s_axi_wdata(699) => GND_1,
      s_axi_wdata(698) => GND_1,
      s_axi_wdata(697) => GND_1,
      s_axi_wdata(696) => GND_1,
      s_axi_wdata(695) => GND_1,
      s_axi_wdata(694) => GND_1,
      s_axi_wdata(693) => GND_1,
      s_axi_wdata(692) => GND_1,
      s_axi_wdata(691) => GND_1,
      s_axi_wdata(690) => GND_1,
      s_axi_wdata(689) => GND_1,
      s_axi_wdata(688) => GND_1,
      s_axi_wdata(687) => GND_1,
      s_axi_wdata(686) => GND_1,
      s_axi_wdata(685) => GND_1,
      s_axi_wdata(684) => GND_1,
      s_axi_wdata(683) => GND_1,
      s_axi_wdata(682) => GND_1,
      s_axi_wdata(681) => GND_1,
      s_axi_wdata(680) => GND_1,
      s_axi_wdata(679) => GND_1,
      s_axi_wdata(678) => GND_1,
      s_axi_wdata(677) => GND_1,
      s_axi_wdata(676) => GND_1,
      s_axi_wdata(675) => GND_1,
      s_axi_wdata(674) => GND_1,
      s_axi_wdata(673) => GND_1,
      s_axi_wdata(672) => GND_1,
      s_axi_wdata(671) => GND_1,
      s_axi_wdata(670) => GND_1,
      s_axi_wdata(669) => GND_1,
      s_axi_wdata(668) => VCC_1,
      s_axi_wdata(667) => GND_1,
      s_axi_wdata(666) => GND_1,
      s_axi_wdata(665) => GND_1,
      s_axi_wdata(664) => GND_1,
      s_axi_wdata(663) => VCC_1,
      s_axi_wdata(662) => GND_1,
      s_axi_wdata(661) => GND_1,
      s_axi_wdata(660) => GND_1,
      s_axi_wdata(659) => GND_1,
      s_axi_wdata(658) => GND_1,
      s_axi_wdata(657) => GND_1,
      s_axi_wdata(656) => GND_1,
      s_axi_wdata(655) => GND_1,
      s_axi_wdata(654) => GND_1,
      s_axi_wdata(653) => GND_1,
      s_axi_wdata(652) => GND_1,
      s_axi_wdata(651) => GND_1,
      s_axi_wdata(650) => GND_1,
      s_axi_wdata(649) => GND_1,
      s_axi_wdata(648) => GND_1,
      s_axi_wdata(647) => GND_1,
      s_axi_wdata(646) => GND_1,
      s_axi_wdata(645) => GND_1,
      s_axi_wdata(644) => GND_1,
      s_axi_wdata(643) => GND_1,
      s_axi_wdata(642) => GND_1,
      s_axi_wdata(641) => GND_1,
      s_axi_wdata(640) => GND_1,
      s_axi_wdata(639) => GND_1,
      s_axi_wdata(638) => GND_1,
      s_axi_wdata(637) => GND_1,
      s_axi_wdata(636) => GND_1,
      s_axi_wdata(635) => GND_1,
      s_axi_wdata(634) => GND_1,
      s_axi_wdata(633) => GND_1,
      s_axi_wdata(632) => GND_1,
      s_axi_wdata(631) => GND_1,
      s_axi_wdata(630) => GND_1,
      s_axi_wdata(629) => GND_1,
      s_axi_wdata(628) => GND_1,
      s_axi_wdata(627) => GND_1,
      s_axi_wdata(626) => GND_1,
      s_axi_wdata(625) => GND_1,
      s_axi_wdata(624) => GND_1,
      s_axi_wdata(623) => GND_1,
      s_axi_wdata(622) => GND_1,
      s_axi_wdata(621) => GND_1,
      s_axi_wdata(620) => GND_1,
      s_axi_wdata(619) => GND_1,
      s_axi_wdata(618) => GND_1,
      s_axi_wdata(617) => GND_1,
      s_axi_wdata(616) => GND_1,
      s_axi_wdata(615) => GND_1,
      s_axi_wdata(614) => GND_1,
      s_axi_wdata(613) => GND_1,
      s_axi_wdata(612) => GND_1,
      s_axi_wdata(611) => GND_1,
      s_axi_wdata(610) => GND_1,
      s_axi_wdata(609) => GND_1,
      s_axi_wdata(608) => GND_1,
      s_axi_wdata(607) => GND_1,
      s_axi_wdata(606) => GND_1,
      s_axi_wdata(605) => GND_1,
      s_axi_wdata(604) => GND_1,
      s_axi_wdata(603) => GND_1,
      s_axi_wdata(602) => GND_1,
      s_axi_wdata(601) => GND_1,
      s_axi_wdata(600) => GND_1,
      s_axi_wdata(599) => GND_1,
      s_axi_wdata(598) => GND_1,
      s_axi_wdata(597) => GND_1,
      s_axi_wdata(596) => GND_1,
      s_axi_wdata(595) => GND_1,
      s_axi_wdata(594) => GND_1,
      s_axi_wdata(593) => GND_1,
      s_axi_wdata(592) => GND_1,
      s_axi_wdata(591) => GND_1,
      s_axi_wdata(590) => GND_1,
      s_axi_wdata(589) => GND_1,
      s_axi_wdata(588) => GND_1,
      s_axi_wdata(587) => GND_1,
      s_axi_wdata(586) => GND_1,
      s_axi_wdata(585) => GND_1,
      s_axi_wdata(584) => GND_1,
      s_axi_wdata(583) => GND_1,
      s_axi_wdata(582) => GND_1,
      s_axi_wdata(581) => GND_1,
      s_axi_wdata(580) => GND_1,
      s_axi_wdata(579) => GND_1,
      s_axi_wdata(578) => GND_1,
      s_axi_wdata(577) => GND_1,
      s_axi_wdata(576) => GND_1,
      s_axi_wdata(575) => GND_1,
      s_axi_wdata(574) => GND_1,
      s_axi_wdata(573) => GND_1,
      s_axi_wdata(572) => GND_1,
      s_axi_wdata(571) => GND_1,
      s_axi_wdata(570) => GND_1,
      s_axi_wdata(569) => GND_1,
      s_axi_wdata(568) => GND_1,
      s_axi_wdata(567) => GND_1,
      s_axi_wdata(566) => GND_1,
      s_axi_wdata(565) => GND_1,
      s_axi_wdata(564) => GND_1,
      s_axi_wdata(563) => GND_1,
      s_axi_wdata(562) => GND_1,
      s_axi_wdata(561) => GND_1,
      s_axi_wdata(560) => GND_1,
      s_axi_wdata(559) => GND_1,
      s_axi_wdata(558) => GND_1,
      s_axi_wdata(557) => GND_1,
      s_axi_wdata(556) => GND_1,
      s_axi_wdata(555) => GND_1,
      s_axi_wdata(554) => GND_1,
      s_axi_wdata(553) => GND_1,
      s_axi_wdata(552) => GND_1,
      s_axi_wdata(551) => GND_1,
      s_axi_wdata(550) => GND_1,
      s_axi_wdata(549) => GND_1,
      s_axi_wdata(548) => GND_1,
      s_axi_wdata(547) => GND_1,
      s_axi_wdata(546) => GND_1,
      s_axi_wdata(545) => GND_1,
      s_axi_wdata(544) => GND_1,
      s_axi_wdata(543) => GND_1,
      s_axi_wdata(542) => GND_1,
      s_axi_wdata(541) => GND_1,
      s_axi_wdata(540) => GND_1,
      s_axi_wdata(539) => GND_1,
      s_axi_wdata(538) => GND_1,
      s_axi_wdata(537) => GND_1,
      s_axi_wdata(536) => GND_1,
      s_axi_wdata(535) => GND_1,
      s_axi_wdata(534) => GND_1,
      s_axi_wdata(533) => GND_1,
      s_axi_wdata(532) => GND_1,
      s_axi_wdata(531) => GND_1,
      s_axi_wdata(530) => GND_1,
      s_axi_wdata(529) => GND_1,
      s_axi_wdata(528) => GND_1,
      s_axi_wdata(527) => GND_1,
      s_axi_wdata(526) => GND_1,
      s_axi_wdata(525) => GND_1,
      s_axi_wdata(524) => GND_1,
      s_axi_wdata(523) => GND_1,
      s_axi_wdata(522) => GND_1,
      s_axi_wdata(521) => GND_1,
      s_axi_wdata(520) => GND_1,
      s_axi_wdata(519) => GND_1,
      s_axi_wdata(518) => GND_1,
      s_axi_wdata(517) => GND_1,
      s_axi_wdata(516) => GND_1,
      s_axi_wdata(515) => GND_1,
      s_axi_wdata(514) => GND_1,
      s_axi_wdata(513) => GND_1,
      s_axi_wdata(512) => GND_1,
      s_axi_wdata(511 downto 0) => s00_couplers_to_xbar_WDATA(511 downto 0),
      s_axi_wlast(5) => GND_1,
      s_axi_wlast(4) => GND_1,
      s_axi_wlast(3) => s03_couplers_to_xbar_WLAST,
      s_axi_wlast(2) => s02_couplers_to_xbar_WLAST,
      s_axi_wlast(1) => GND_1,
      s_axi_wlast(0) => s00_couplers_to_xbar_WLAST,
      s_axi_wready(5 downto 4) => NLW_xbar_s_axi_wready_UNCONNECTED(5 downto 4),
      s_axi_wready(3) => s03_couplers_to_xbar_WREADY(3),
      s_axi_wready(2) => s02_couplers_to_xbar_WREADY(2),
      s_axi_wready(1) => NLW_xbar_s_axi_wready_UNCONNECTED(1),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(383) => GND_1,
      s_axi_wstrb(382) => GND_1,
      s_axi_wstrb(381) => GND_1,
      s_axi_wstrb(380) => GND_1,
      s_axi_wstrb(379) => GND_1,
      s_axi_wstrb(378) => GND_1,
      s_axi_wstrb(377) => GND_1,
      s_axi_wstrb(376) => GND_1,
      s_axi_wstrb(375) => GND_1,
      s_axi_wstrb(374) => GND_1,
      s_axi_wstrb(373) => GND_1,
      s_axi_wstrb(372) => GND_1,
      s_axi_wstrb(371) => GND_1,
      s_axi_wstrb(370) => GND_1,
      s_axi_wstrb(369) => GND_1,
      s_axi_wstrb(368) => GND_1,
      s_axi_wstrb(367) => GND_1,
      s_axi_wstrb(366) => GND_1,
      s_axi_wstrb(365) => GND_1,
      s_axi_wstrb(364) => GND_1,
      s_axi_wstrb(363) => GND_1,
      s_axi_wstrb(362) => GND_1,
      s_axi_wstrb(361) => GND_1,
      s_axi_wstrb(360) => GND_1,
      s_axi_wstrb(359) => GND_1,
      s_axi_wstrb(358) => GND_1,
      s_axi_wstrb(357) => GND_1,
      s_axi_wstrb(356) => VCC_1,
      s_axi_wstrb(355) => GND_1,
      s_axi_wstrb(354) => GND_1,
      s_axi_wstrb(353) => GND_1,
      s_axi_wstrb(352) => GND_1,
      s_axi_wstrb(351) => GND_1,
      s_axi_wstrb(350) => GND_1,
      s_axi_wstrb(349) => GND_1,
      s_axi_wstrb(348) => GND_1,
      s_axi_wstrb(347) => GND_1,
      s_axi_wstrb(346) => GND_1,
      s_axi_wstrb(345) => GND_1,
      s_axi_wstrb(344) => GND_1,
      s_axi_wstrb(343) => GND_1,
      s_axi_wstrb(342) => GND_1,
      s_axi_wstrb(341) => GND_1,
      s_axi_wstrb(340) => GND_1,
      s_axi_wstrb(339) => GND_1,
      s_axi_wstrb(338) => GND_1,
      s_axi_wstrb(337) => GND_1,
      s_axi_wstrb(336) => GND_1,
      s_axi_wstrb(335) => GND_1,
      s_axi_wstrb(334) => GND_1,
      s_axi_wstrb(333) => GND_1,
      s_axi_wstrb(332) => GND_1,
      s_axi_wstrb(331) => GND_1,
      s_axi_wstrb(330) => GND_1,
      s_axi_wstrb(329) => GND_1,
      s_axi_wstrb(328) => GND_1,
      s_axi_wstrb(327) => GND_1,
      s_axi_wstrb(326) => GND_1,
      s_axi_wstrb(325) => GND_1,
      s_axi_wstrb(324) => GND_1,
      s_axi_wstrb(323) => GND_1,
      s_axi_wstrb(322) => GND_1,
      s_axi_wstrb(321) => GND_1,
      s_axi_wstrb(320) => GND_1,
      s_axi_wstrb(319) => GND_1,
      s_axi_wstrb(318) => GND_1,
      s_axi_wstrb(317) => GND_1,
      s_axi_wstrb(316) => GND_1,
      s_axi_wstrb(315) => GND_1,
      s_axi_wstrb(314) => GND_1,
      s_axi_wstrb(313) => GND_1,
      s_axi_wstrb(312) => GND_1,
      s_axi_wstrb(311) => GND_1,
      s_axi_wstrb(310) => GND_1,
      s_axi_wstrb(309) => GND_1,
      s_axi_wstrb(308) => GND_1,
      s_axi_wstrb(307) => GND_1,
      s_axi_wstrb(306) => GND_1,
      s_axi_wstrb(305) => GND_1,
      s_axi_wstrb(304) => GND_1,
      s_axi_wstrb(303) => GND_1,
      s_axi_wstrb(302) => GND_1,
      s_axi_wstrb(301) => GND_1,
      s_axi_wstrb(300) => GND_1,
      s_axi_wstrb(299) => GND_1,
      s_axi_wstrb(298) => GND_1,
      s_axi_wstrb(297) => GND_1,
      s_axi_wstrb(296) => GND_1,
      s_axi_wstrb(295) => GND_1,
      s_axi_wstrb(294) => GND_1,
      s_axi_wstrb(293) => GND_1,
      s_axi_wstrb(292) => GND_1,
      s_axi_wstrb(291) => GND_1,
      s_axi_wstrb(290) => GND_1,
      s_axi_wstrb(289) => GND_1,
      s_axi_wstrb(288) => GND_1,
      s_axi_wstrb(287) => GND_1,
      s_axi_wstrb(286) => GND_1,
      s_axi_wstrb(285) => GND_1,
      s_axi_wstrb(284) => GND_1,
      s_axi_wstrb(283) => GND_1,
      s_axi_wstrb(282) => GND_1,
      s_axi_wstrb(281) => GND_1,
      s_axi_wstrb(280) => GND_1,
      s_axi_wstrb(279) => GND_1,
      s_axi_wstrb(278) => GND_1,
      s_axi_wstrb(277) => GND_1,
      s_axi_wstrb(276) => GND_1,
      s_axi_wstrb(275) => GND_1,
      s_axi_wstrb(274) => GND_1,
      s_axi_wstrb(273) => GND_1,
      s_axi_wstrb(272) => GND_1,
      s_axi_wstrb(271) => GND_1,
      s_axi_wstrb(270) => GND_1,
      s_axi_wstrb(269) => GND_1,
      s_axi_wstrb(268) => GND_1,
      s_axi_wstrb(267) => GND_1,
      s_axi_wstrb(266) => GND_1,
      s_axi_wstrb(265) => GND_1,
      s_axi_wstrb(264) => GND_1,
      s_axi_wstrb(263) => GND_1,
      s_axi_wstrb(262) => GND_1,
      s_axi_wstrb(261) => GND_1,
      s_axi_wstrb(260) => GND_1,
      s_axi_wstrb(259) => GND_1,
      s_axi_wstrb(258) => GND_1,
      s_axi_wstrb(257) => GND_1,
      s_axi_wstrb(256) => GND_1,
      s_axi_wstrb(255 downto 192) => s03_couplers_to_xbar_WSTRB(63 downto 0),
      s_axi_wstrb(191 downto 128) => s02_couplers_to_xbar_WSTRB(63 downto 0),
      s_axi_wstrb(127) => GND_1,
      s_axi_wstrb(126) => GND_1,
      s_axi_wstrb(125) => GND_1,
      s_axi_wstrb(124) => GND_1,
      s_axi_wstrb(123) => GND_1,
      s_axi_wstrb(122) => GND_1,
      s_axi_wstrb(121) => GND_1,
      s_axi_wstrb(120) => GND_1,
      s_axi_wstrb(119) => GND_1,
      s_axi_wstrb(118) => GND_1,
      s_axi_wstrb(117) => GND_1,
      s_axi_wstrb(116) => GND_1,
      s_axi_wstrb(115) => GND_1,
      s_axi_wstrb(114) => GND_1,
      s_axi_wstrb(113) => GND_1,
      s_axi_wstrb(112) => GND_1,
      s_axi_wstrb(111) => GND_1,
      s_axi_wstrb(110) => GND_1,
      s_axi_wstrb(109) => GND_1,
      s_axi_wstrb(108) => GND_1,
      s_axi_wstrb(107) => GND_1,
      s_axi_wstrb(106) => GND_1,
      s_axi_wstrb(105) => GND_1,
      s_axi_wstrb(104) => GND_1,
      s_axi_wstrb(103) => GND_1,
      s_axi_wstrb(102) => GND_1,
      s_axi_wstrb(101) => GND_1,
      s_axi_wstrb(100) => GND_1,
      s_axi_wstrb(99) => GND_1,
      s_axi_wstrb(98) => GND_1,
      s_axi_wstrb(97) => GND_1,
      s_axi_wstrb(96) => GND_1,
      s_axi_wstrb(95) => GND_1,
      s_axi_wstrb(94) => GND_1,
      s_axi_wstrb(93) => GND_1,
      s_axi_wstrb(92) => GND_1,
      s_axi_wstrb(91) => GND_1,
      s_axi_wstrb(90) => GND_1,
      s_axi_wstrb(89) => GND_1,
      s_axi_wstrb(88) => GND_1,
      s_axi_wstrb(87) => GND_1,
      s_axi_wstrb(86) => GND_1,
      s_axi_wstrb(85) => GND_1,
      s_axi_wstrb(84) => GND_1,
      s_axi_wstrb(83) => GND_1,
      s_axi_wstrb(82) => GND_1,
      s_axi_wstrb(81) => GND_1,
      s_axi_wstrb(80) => GND_1,
      s_axi_wstrb(79) => GND_1,
      s_axi_wstrb(78) => GND_1,
      s_axi_wstrb(77) => GND_1,
      s_axi_wstrb(76) => GND_1,
      s_axi_wstrb(75) => GND_1,
      s_axi_wstrb(74) => GND_1,
      s_axi_wstrb(73) => GND_1,
      s_axi_wstrb(72) => GND_1,
      s_axi_wstrb(71) => GND_1,
      s_axi_wstrb(70) => GND_1,
      s_axi_wstrb(69) => GND_1,
      s_axi_wstrb(68) => GND_1,
      s_axi_wstrb(67) => GND_1,
      s_axi_wstrb(66) => GND_1,
      s_axi_wstrb(65) => GND_1,
      s_axi_wstrb(64) => GND_1,
      s_axi_wstrb(63 downto 0) => s00_couplers_to_xbar_WSTRB(63 downto 0),
      s_axi_wvalid(5) => GND_1,
      s_axi_wvalid(4) => GND_1,
      s_axi_wvalid(3) => s03_couplers_to_xbar_WVALID,
      s_axi_wvalid(2) => s02_couplers_to_xbar_WVALID,
      s_axi_wvalid(1) => GND_1,
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mysystem2_microblaze_0_axi_periph_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M03_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M03_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M04_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M04_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M05_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M05_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M06_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M06_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_ACLK : in STD_LOGIC;
    M07_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end mysystem2_microblaze_0_axi_periph_0;

architecture STRUCTURE of mysystem2_microblaze_0_axi_periph_0 is
  component mysystem2_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component mysystem2_xbar_0;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M04_ACLK_1 : STD_LOGIC;
  signal M04_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M05_ACLK_1 : STD_LOGIC;
  signal M05_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M06_ACLK_1 : STD_LOGIC;
  signal M06_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M07_ACLK_1 : STD_LOGIC;
  signal M07_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC;
  signal m00_couplers_to_microblaze_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC;
  signal m01_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_microblaze_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_ACLK_net : STD_LOGIC;
  signal microblaze_0_axi_periph_ARESETN_net : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 28 );
  signal xbar_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_xbar_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 27 downto 12 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1(0) <= M00_ARESETN(0);
  M00_AXI_araddr(8 downto 0) <= m00_couplers_to_microblaze_0_axi_periph_ARADDR(8 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_microblaze_0_axi_periph_ARVALID;
  M00_AXI_awaddr(8 downto 0) <= m00_couplers_to_microblaze_0_axi_periph_AWADDR(8 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_microblaze_0_axi_periph_AWVALID;
  M00_AXI_bready <= m00_couplers_to_microblaze_0_axi_periph_BREADY;
  M00_AXI_rready <= m00_couplers_to_microblaze_0_axi_periph_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_microblaze_0_axi_periph_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1(0) <= M01_ARESETN(0);
  M01_AXI_araddr(3 downto 0) <= m01_couplers_to_microblaze_0_axi_periph_ARADDR(3 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_microblaze_0_axi_periph_ARPROT(2 downto 0);
  M01_AXI_arvalid(0) <= m01_couplers_to_microblaze_0_axi_periph_ARVALID(0);
  M01_AXI_awaddr(3 downto 0) <= m01_couplers_to_microblaze_0_axi_periph_AWADDR(3 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_microblaze_0_axi_periph_AWPROT(2 downto 0);
  M01_AXI_awvalid(0) <= m01_couplers_to_microblaze_0_axi_periph_AWVALID(0);
  M01_AXI_bready(0) <= m01_couplers_to_microblaze_0_axi_periph_BREADY(0);
  M01_AXI_rready(0) <= m01_couplers_to_microblaze_0_axi_periph_RREADY(0);
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0);
  M01_AXI_wvalid(0) <= m01_couplers_to_microblaze_0_axi_periph_WVALID(0);
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1(0) <= M02_ARESETN(0);
  M02_AXI_araddr(3 downto 0) <= m02_couplers_to_microblaze_0_axi_periph_ARADDR(3 downto 0);
  M02_AXI_arprot(2 downto 0) <= m02_couplers_to_microblaze_0_axi_periph_ARPROT(2 downto 0);
  M02_AXI_arvalid(0) <= m02_couplers_to_microblaze_0_axi_periph_ARVALID(0);
  M02_AXI_awaddr(3 downto 0) <= m02_couplers_to_microblaze_0_axi_periph_AWADDR(3 downto 0);
  M02_AXI_awprot(2 downto 0) <= m02_couplers_to_microblaze_0_axi_periph_AWPROT(2 downto 0);
  M02_AXI_awvalid(0) <= m02_couplers_to_microblaze_0_axi_periph_AWVALID(0);
  M02_AXI_bready(0) <= m02_couplers_to_microblaze_0_axi_periph_BREADY(0);
  M02_AXI_rready(0) <= m02_couplers_to_microblaze_0_axi_periph_RREADY(0);
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0);
  M02_AXI_wvalid(0) <= m02_couplers_to_microblaze_0_axi_periph_WVALID(0);
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1(0) <= M03_ARESETN(0);
  M03_AXI_araddr(9 downto 0) <= m03_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0);
  M03_AXI_arvalid(0) <= m03_couplers_to_microblaze_0_axi_periph_ARVALID(0);
  M03_AXI_awaddr(9 downto 0) <= m03_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0);
  M03_AXI_awvalid(0) <= m03_couplers_to_microblaze_0_axi_periph_AWVALID(0);
  M03_AXI_bready(0) <= m03_couplers_to_microblaze_0_axi_periph_BREADY(0);
  M03_AXI_rready(0) <= m03_couplers_to_microblaze_0_axi_periph_RREADY(0);
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M03_AXI_wvalid(0) <= m03_couplers_to_microblaze_0_axi_periph_WVALID(0);
  M04_ACLK_1 <= M04_ACLK;
  M04_ARESETN_1(0) <= M04_ARESETN(0);
  M04_AXI_araddr(9 downto 0) <= m04_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0);
  M04_AXI_arvalid(0) <= m04_couplers_to_microblaze_0_axi_periph_ARVALID(0);
  M04_AXI_awaddr(9 downto 0) <= m04_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0);
  M04_AXI_awvalid(0) <= m04_couplers_to_microblaze_0_axi_periph_AWVALID(0);
  M04_AXI_bready(0) <= m04_couplers_to_microblaze_0_axi_periph_BREADY(0);
  M04_AXI_rready(0) <= m04_couplers_to_microblaze_0_axi_periph_RREADY(0);
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M04_AXI_wvalid(0) <= m04_couplers_to_microblaze_0_axi_periph_WVALID(0);
  M05_ACLK_1 <= M05_ACLK;
  M05_ARESETN_1(0) <= M05_ARESETN(0);
  M05_AXI_araddr(9 downto 0) <= m05_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0);
  M05_AXI_arvalid(0) <= m05_couplers_to_microblaze_0_axi_periph_ARVALID(0);
  M05_AXI_awaddr(9 downto 0) <= m05_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0);
  M05_AXI_awvalid(0) <= m05_couplers_to_microblaze_0_axi_periph_AWVALID(0);
  M05_AXI_bready(0) <= m05_couplers_to_microblaze_0_axi_periph_BREADY(0);
  M05_AXI_rready(0) <= m05_couplers_to_microblaze_0_axi_periph_RREADY(0);
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M05_AXI_wvalid(0) <= m05_couplers_to_microblaze_0_axi_periph_WVALID(0);
  M06_ACLK_1 <= M06_ACLK;
  M06_ARESETN_1(0) <= M06_ARESETN(0);
  M06_AXI_araddr(9 downto 0) <= m06_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0);
  M06_AXI_arvalid(0) <= m06_couplers_to_microblaze_0_axi_periph_ARVALID(0);
  M06_AXI_awaddr(9 downto 0) <= m06_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0);
  M06_AXI_awvalid(0) <= m06_couplers_to_microblaze_0_axi_periph_AWVALID(0);
  M06_AXI_bready(0) <= m06_couplers_to_microblaze_0_axi_periph_BREADY(0);
  M06_AXI_rready(0) <= m06_couplers_to_microblaze_0_axi_periph_RREADY(0);
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M06_AXI_wvalid(0) <= m06_couplers_to_microblaze_0_axi_periph_WVALID(0);
  M07_ACLK_1 <= M07_ACLK;
  M07_ARESETN_1(0) <= M07_ARESETN(0);
  M07_AXI_araddr(3 downto 0) <= m07_couplers_to_microblaze_0_axi_periph_ARADDR(3 downto 0);
  M07_AXI_arvalid(0) <= m07_couplers_to_microblaze_0_axi_periph_ARVALID(0);
  M07_AXI_awaddr(3 downto 0) <= m07_couplers_to_microblaze_0_axi_periph_AWADDR(3 downto 0);
  M07_AXI_awvalid(0) <= m07_couplers_to_microblaze_0_axi_periph_AWVALID(0);
  M07_AXI_bready(0) <= m07_couplers_to_microblaze_0_axi_periph_BREADY(0);
  M07_AXI_rready(0) <= m07_couplers_to_microblaze_0_axi_periph_RREADY(0);
  M07_AXI_wdata(31 downto 0) <= m07_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= m07_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0);
  M07_AXI_wvalid(0) <= m07_couplers_to_microblaze_0_axi_periph_WVALID(0);
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1(0) <= S00_ARESETN(0);
  S00_AXI_arready(0) <= microblaze_0_axi_periph_to_s00_couplers_ARREADY(0);
  S00_AXI_awready(0) <= microblaze_0_axi_periph_to_s00_couplers_AWREADY(0);
  S00_AXI_bresp(1 downto 0) <= microblaze_0_axi_periph_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid(0) <= microblaze_0_axi_periph_to_s00_couplers_BVALID(0);
  S00_AXI_rdata(31 downto 0) <= microblaze_0_axi_periph_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rresp(1 downto 0) <= microblaze_0_axi_periph_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid(0) <= microblaze_0_axi_periph_to_s00_couplers_RVALID(0);
  S00_AXI_wready(0) <= microblaze_0_axi_periph_to_s00_couplers_WREADY(0);
  m00_couplers_to_microblaze_0_axi_periph_ARREADY <= M00_AXI_arready;
  m00_couplers_to_microblaze_0_axi_periph_AWREADY <= M00_AXI_awready;
  m00_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_microblaze_0_axi_periph_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_microblaze_0_axi_periph_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_microblaze_0_axi_periph_WREADY <= M00_AXI_wready;
  m01_couplers_to_microblaze_0_axi_periph_ARREADY(0) <= M01_AXI_arready(0);
  m01_couplers_to_microblaze_0_axi_periph_AWREADY(0) <= M01_AXI_awready(0);
  m01_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_microblaze_0_axi_periph_BVALID(0) <= M01_AXI_bvalid(0);
  m01_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_microblaze_0_axi_periph_RVALID(0) <= M01_AXI_rvalid(0);
  m01_couplers_to_microblaze_0_axi_periph_WREADY(0) <= M01_AXI_wready(0);
  m02_couplers_to_microblaze_0_axi_periph_ARREADY(0) <= M02_AXI_arready(0);
  m02_couplers_to_microblaze_0_axi_periph_AWREADY(0) <= M02_AXI_awready(0);
  m02_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_microblaze_0_axi_periph_BVALID(0) <= M02_AXI_bvalid(0);
  m02_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_microblaze_0_axi_periph_RVALID(0) <= M02_AXI_rvalid(0);
  m02_couplers_to_microblaze_0_axi_periph_WREADY(0) <= M02_AXI_wready(0);
  m03_couplers_to_microblaze_0_axi_periph_ARREADY(0) <= M03_AXI_arready(0);
  m03_couplers_to_microblaze_0_axi_periph_AWREADY(0) <= M03_AXI_awready(0);
  m03_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_microblaze_0_axi_periph_BVALID(0) <= M03_AXI_bvalid(0);
  m03_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_microblaze_0_axi_periph_RVALID(0) <= M03_AXI_rvalid(0);
  m03_couplers_to_microblaze_0_axi_periph_WREADY(0) <= M03_AXI_wready(0);
  m04_couplers_to_microblaze_0_axi_periph_ARREADY(0) <= M04_AXI_arready(0);
  m04_couplers_to_microblaze_0_axi_periph_AWREADY(0) <= M04_AXI_awready(0);
  m04_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_microblaze_0_axi_periph_BVALID(0) <= M04_AXI_bvalid(0);
  m04_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_microblaze_0_axi_periph_RVALID(0) <= M04_AXI_rvalid(0);
  m04_couplers_to_microblaze_0_axi_periph_WREADY(0) <= M04_AXI_wready(0);
  m05_couplers_to_microblaze_0_axi_periph_ARREADY(0) <= M05_AXI_arready(0);
  m05_couplers_to_microblaze_0_axi_periph_AWREADY(0) <= M05_AXI_awready(0);
  m05_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_microblaze_0_axi_periph_BVALID(0) <= M05_AXI_bvalid(0);
  m05_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_microblaze_0_axi_periph_RVALID(0) <= M05_AXI_rvalid(0);
  m05_couplers_to_microblaze_0_axi_periph_WREADY(0) <= M05_AXI_wready(0);
  m06_couplers_to_microblaze_0_axi_periph_ARREADY(0) <= M06_AXI_arready(0);
  m06_couplers_to_microblaze_0_axi_periph_AWREADY(0) <= M06_AXI_awready(0);
  m06_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_microblaze_0_axi_periph_BVALID(0) <= M06_AXI_bvalid(0);
  m06_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_microblaze_0_axi_periph_RVALID(0) <= M06_AXI_rvalid(0);
  m06_couplers_to_microblaze_0_axi_periph_WREADY(0) <= M06_AXI_wready(0);
  m07_couplers_to_microblaze_0_axi_periph_ARREADY(0) <= M07_AXI_arready(0);
  m07_couplers_to_microblaze_0_axi_periph_AWREADY(0) <= M07_AXI_awready(0);
  m07_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  m07_couplers_to_microblaze_0_axi_periph_BVALID(0) <= M07_AXI_bvalid(0);
  m07_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  m07_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  m07_couplers_to_microblaze_0_axi_periph_RVALID(0) <= M07_AXI_rvalid(0);
  m07_couplers_to_microblaze_0_axi_periph_WREADY(0) <= M07_AXI_wready(0);
  microblaze_0_axi_periph_ACLK_net <= ACLK;
  microblaze_0_axi_periph_ARESETN_net(0) <= ARESETN(0);
  microblaze_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  microblaze_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  microblaze_0_axi_periph_to_s00_couplers_ARVALID(0) <= S00_AXI_arvalid(0);
  microblaze_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  microblaze_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  microblaze_0_axi_periph_to_s00_couplers_AWVALID(0) <= S00_AXI_awvalid(0);
  microblaze_0_axi_periph_to_s00_couplers_BREADY(0) <= S00_AXI_bready(0);
  microblaze_0_axi_periph_to_s00_couplers_RREADY(0) <= S00_AXI_rready(0);
  microblaze_0_axi_periph_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  microblaze_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  microblaze_0_axi_periph_to_s00_couplers_WVALID(0) <= S00_AXI_wvalid(0);
m00_couplers: entity work.m00_couplers_imp_T7BQX6
    port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN(0) => M00_ARESETN_1(0),
      M_AXI_araddr(8 downto 0) => m00_couplers_to_microblaze_0_axi_periph_ARADDR(8 downto 0),
      M_AXI_arready => m00_couplers_to_microblaze_0_axi_periph_ARREADY,
      M_AXI_arvalid => m00_couplers_to_microblaze_0_axi_periph_ARVALID,
      M_AXI_awaddr(8 downto 0) => m00_couplers_to_microblaze_0_axi_periph_AWADDR(8 downto 0),
      M_AXI_awready => m00_couplers_to_microblaze_0_axi_periph_AWREADY,
      M_AXI_awvalid => m00_couplers_to_microblaze_0_axi_periph_AWVALID,
      M_AXI_bready => m00_couplers_to_microblaze_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_microblaze_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_microblaze_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_microblaze_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_microblaze_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_microblaze_0_axi_periph_WVALID,
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(8 downto 0) => xbar_to_m00_couplers_ARADDR(8 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(8 downto 0) => xbar_to_m00_couplers_AWADDR(8 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1GW7LG2
    port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN(0) => M01_ARESETN_1(0),
      M_AXI_araddr(3 downto 0) => m01_couplers_to_microblaze_0_axi_periph_ARADDR(3 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_microblaze_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready(0) => m01_couplers_to_microblaze_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m01_couplers_to_microblaze_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(3 downto 0) => m01_couplers_to_microblaze_0_axi_periph_AWADDR(3 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_microblaze_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready(0) => m01_couplers_to_microblaze_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m01_couplers_to_microblaze_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m01_couplers_to_microblaze_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m01_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m01_couplers_to_microblaze_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m01_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m01_couplers_to_microblaze_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m01_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m01_couplers_to_microblaze_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m01_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m01_couplers_to_microblaze_0_axi_periph_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m01_couplers_to_microblaze_0_axi_periph_WVALID(0),
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(3 downto 0) => xbar_to_m01_couplers_ARADDR(35 downto 32),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arready(0) => xbar_to_m01_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(3 downto 0) => xbar_to_m01_couplers_AWADDR(35 downto 32),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awready(0) => xbar_to_m01_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready(0) => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m01_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m01_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready(0) => xbar_to_m01_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid(0) => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_8B7HFF
    port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN(0) => M02_ARESETN_1(0),
      M_AXI_araddr(3 downto 0) => m02_couplers_to_microblaze_0_axi_periph_ARADDR(3 downto 0),
      M_AXI_arprot(2 downto 0) => m02_couplers_to_microblaze_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready(0) => m02_couplers_to_microblaze_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m02_couplers_to_microblaze_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(3 downto 0) => m02_couplers_to_microblaze_0_axi_periph_AWADDR(3 downto 0),
      M_AXI_awprot(2 downto 0) => m02_couplers_to_microblaze_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready(0) => m02_couplers_to_microblaze_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m02_couplers_to_microblaze_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m02_couplers_to_microblaze_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m02_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m02_couplers_to_microblaze_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m02_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m02_couplers_to_microblaze_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m02_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m02_couplers_to_microblaze_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m02_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m02_couplers_to_microblaze_0_axi_periph_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m02_couplers_to_microblaze_0_axi_periph_WVALID(0),
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(3 downto 0) => xbar_to_m02_couplers_ARADDR(67 downto 64),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arready(0) => xbar_to_m02_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(3 downto 0) => xbar_to_m02_couplers_AWADDR(67 downto 64),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awready(0) => xbar_to_m02_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready(0) => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m02_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m02_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready(0) => xbar_to_m02_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid(0) => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1K2M3S3
    port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN(0) => M03_ARESETN_1(0),
      M_AXI_araddr(9 downto 0) => m03_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0),
      M_AXI_arready(0) => m03_couplers_to_microblaze_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m03_couplers_to_microblaze_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(9 downto 0) => m03_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0),
      M_AXI_awready(0) => m03_couplers_to_microblaze_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m03_couplers_to_microblaze_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m03_couplers_to_microblaze_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m03_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m03_couplers_to_microblaze_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m03_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m03_couplers_to_microblaze_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m03_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m03_couplers_to_microblaze_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m03_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m03_couplers_to_microblaze_0_axi_periph_WREADY(0),
      M_AXI_wvalid(0) => m03_couplers_to_microblaze_0_axi_periph_WVALID(0),
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(9 downto 0) => xbar_to_m03_couplers_ARADDR(105 downto 96),
      S_AXI_arready(0) => xbar_to_m03_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(9 downto 0) => xbar_to_m03_couplers_AWADDR(105 downto 96),
      S_AXI_awready(0) => xbar_to_m03_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready(0) => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m03_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m03_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready(0) => xbar_to_m03_couplers_WREADY(0),
      S_AXI_wvalid(0) => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_ZK4OO8
    port map (
      M_ACLK => M04_ACLK_1,
      M_ARESETN(0) => M04_ARESETN_1(0),
      M_AXI_araddr(9 downto 0) => m04_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0),
      M_AXI_arready(0) => m04_couplers_to_microblaze_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m04_couplers_to_microblaze_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(9 downto 0) => m04_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0),
      M_AXI_awready(0) => m04_couplers_to_microblaze_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m04_couplers_to_microblaze_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m04_couplers_to_microblaze_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m04_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m04_couplers_to_microblaze_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m04_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m04_couplers_to_microblaze_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m04_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m04_couplers_to_microblaze_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m04_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m04_couplers_to_microblaze_0_axi_periph_WREADY(0),
      M_AXI_wvalid(0) => m04_couplers_to_microblaze_0_axi_periph_WVALID(0),
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(9 downto 0) => xbar_to_m04_couplers_ARADDR(137 downto 128),
      S_AXI_arready(0) => xbar_to_m04_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(9 downto 0) => xbar_to_m04_couplers_AWADDR(137 downto 128),
      S_AXI_awready(0) => xbar_to_m04_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready(0) => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m04_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m04_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wready(0) => xbar_to_m04_couplers_WREADY(0),
      S_AXI_wvalid(0) => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_OCXL80
    port map (
      M_ACLK => M05_ACLK_1,
      M_ARESETN(0) => M05_ARESETN_1(0),
      M_AXI_araddr(9 downto 0) => m05_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0),
      M_AXI_arready(0) => m05_couplers_to_microblaze_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m05_couplers_to_microblaze_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(9 downto 0) => m05_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0),
      M_AXI_awready(0) => m05_couplers_to_microblaze_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m05_couplers_to_microblaze_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m05_couplers_to_microblaze_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m05_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m05_couplers_to_microblaze_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m05_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m05_couplers_to_microblaze_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m05_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m05_couplers_to_microblaze_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m05_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m05_couplers_to_microblaze_0_axi_periph_WREADY(0),
      M_AXI_wvalid(0) => m05_couplers_to_microblaze_0_axi_periph_WVALID(0),
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(9 downto 0) => xbar_to_m05_couplers_ARADDR(169 downto 160),
      S_AXI_arready(0) => xbar_to_m05_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(9 downto 0) => xbar_to_m05_couplers_AWADDR(169 downto 160),
      S_AXI_awready(0) => xbar_to_m05_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready(0) => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m05_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m05_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready(0) => xbar_to_m05_couplers_WREADY(0),
      S_AXI_wvalid(0) => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_1VVCIE1
    port map (
      M_ACLK => M06_ACLK_1,
      M_ARESETN(0) => M06_ARESETN_1(0),
      M_AXI_araddr(9 downto 0) => m06_couplers_to_microblaze_0_axi_periph_ARADDR(9 downto 0),
      M_AXI_arready(0) => m06_couplers_to_microblaze_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m06_couplers_to_microblaze_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(9 downto 0) => m06_couplers_to_microblaze_0_axi_periph_AWADDR(9 downto 0),
      M_AXI_awready(0) => m06_couplers_to_microblaze_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m06_couplers_to_microblaze_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m06_couplers_to_microblaze_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m06_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m06_couplers_to_microblaze_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m06_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m06_couplers_to_microblaze_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m06_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m06_couplers_to_microblaze_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m06_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m06_couplers_to_microblaze_0_axi_periph_WREADY(0),
      M_AXI_wvalid(0) => m06_couplers_to_microblaze_0_axi_periph_WVALID(0),
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(9 downto 0) => xbar_to_m06_couplers_ARADDR(201 downto 192),
      S_AXI_arready(0) => xbar_to_m06_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(9 downto 0) => xbar_to_m06_couplers_AWADDR(201 downto 192),
      S_AXI_awready(0) => xbar_to_m06_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready(0) => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m06_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m06_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready(0) => xbar_to_m06_couplers_WREADY(0),
      S_AXI_wvalid(0) => xbar_to_m06_couplers_WVALID(6)
    );
m07_couplers: entity work.m07_couplers_imp_9UJXOH
    port map (
      M_ACLK => M07_ACLK_1,
      M_ARESETN(0) => M07_ARESETN_1(0),
      M_AXI_araddr(3 downto 0) => m07_couplers_to_microblaze_0_axi_periph_ARADDR(3 downto 0),
      M_AXI_arready(0) => m07_couplers_to_microblaze_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m07_couplers_to_microblaze_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(3 downto 0) => m07_couplers_to_microblaze_0_axi_periph_AWADDR(3 downto 0),
      M_AXI_awready(0) => m07_couplers_to_microblaze_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m07_couplers_to_microblaze_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m07_couplers_to_microblaze_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m07_couplers_to_microblaze_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m07_couplers_to_microblaze_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m07_couplers_to_microblaze_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m07_couplers_to_microblaze_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m07_couplers_to_microblaze_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m07_couplers_to_microblaze_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m07_couplers_to_microblaze_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m07_couplers_to_microblaze_0_axi_periph_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m07_couplers_to_microblaze_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m07_couplers_to_microblaze_0_axi_periph_WVALID(0),
      S_ACLK => microblaze_0_axi_periph_ACLK_net,
      S_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      S_AXI_araddr(3 downto 0) => xbar_to_m07_couplers_ARADDR(227 downto 224),
      S_AXI_arready(0) => xbar_to_m07_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m07_couplers_ARVALID(7),
      S_AXI_awaddr(3 downto 0) => xbar_to_m07_couplers_AWADDR(227 downto 224),
      S_AXI_awready(0) => xbar_to_m07_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m07_couplers_AWVALID(7),
      S_AXI_bready(0) => xbar_to_m07_couplers_BREADY(7),
      S_AXI_bresp(1 downto 0) => xbar_to_m07_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m07_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m07_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m07_couplers_RREADY(7),
      S_AXI_rresp(1 downto 0) => xbar_to_m07_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m07_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m07_couplers_WDATA(255 downto 224),
      S_AXI_wready(0) => xbar_to_m07_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      S_AXI_wvalid(0) => xbar_to_m07_couplers_WVALID(7)
    );
s00_couplers: entity work.s00_couplers_imp_1UZGTW6
    port map (
      M_ACLK => microblaze_0_axi_periph_ACLK_net,
      M_ARESETN(0) => microblaze_0_axi_periph_ARESETN_net(0),
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      M_AXI_bready(0) => s00_couplers_to_xbar_BREADY(0),
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready(0) => s00_couplers_to_xbar_RREADY(0),
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready(0) => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => s00_couplers_to_xbar_WVALID(0),
      S_ACLK => S00_ACLK_1,
      S_ARESETN(0) => S00_ARESETN_1(0),
      S_AXI_araddr(31 downto 0) => microblaze_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => microblaze_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arready(0) => microblaze_0_axi_periph_to_s00_couplers_ARREADY(0),
      S_AXI_arvalid(0) => microblaze_0_axi_periph_to_s00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => microblaze_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => microblaze_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awready(0) => microblaze_0_axi_periph_to_s00_couplers_AWREADY(0),
      S_AXI_awvalid(0) => microblaze_0_axi_periph_to_s00_couplers_AWVALID(0),
      S_AXI_bready(0) => microblaze_0_axi_periph_to_s00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => microblaze_0_axi_periph_to_s00_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => microblaze_0_axi_periph_to_s00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => microblaze_0_axi_periph_to_s00_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wready(0) => microblaze_0_axi_periph_to_s00_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => microblaze_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => microblaze_0_axi_periph_to_s00_couplers_WVALID(0)
    );
xbar: component mysystem2_xbar_0
    port map (
      aclk => microblaze_0_axi_periph_ACLK_net,
      aresetn => microblaze_0_axi_periph_ARESETN_net(0),
      m_axi_araddr(255 downto 224) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      m_axi_araddr(223 downto 192) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(23 downto 9) => NLW_xbar_m_axi_arprot_UNCONNECTED(23 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => NLW_xbar_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready(7) => xbar_to_m07_couplers_ARREADY(0),
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY(0),
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY(0),
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY(0),
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY(0),
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY(0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY(0),
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(7) => xbar_to_m07_couplers_ARVALID(7),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(255 downto 224) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      m_axi_awaddr(223 downto 192) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(23 downto 9) => NLW_xbar_m_axi_awprot_UNCONNECTED(23 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => NLW_xbar_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready(7) => xbar_to_m07_couplers_AWREADY(0),
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY(0),
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY(0),
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY(0),
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY(0),
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY(0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY(0),
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(7) => xbar_to_m07_couplers_AWVALID(7),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(7) => xbar_to_m07_couplers_BREADY(7),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(15 downto 14) => xbar_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(7) => xbar_to_m07_couplers_BVALID(0),
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID(0),
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID(0),
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID(0),
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID(0),
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID(0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID(0),
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(255 downto 224) => xbar_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(7) => xbar_to_m07_couplers_RREADY(7),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(15 downto 14) => xbar_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(7) => xbar_to_m07_couplers_RVALID(0),
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID(0),
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID(0),
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID(0),
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID(0),
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID(0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID(0),
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(255 downto 224) => xbar_to_m07_couplers_WDATA(255 downto 224),
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(7) => xbar_to_m07_couplers_WREADY(0),
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY(0),
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY(0),
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY(0),
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY(0),
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY(0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY(0),
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(31 downto 28) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      m_axi_wstrb(27 downto 12) => NLW_xbar_m_axi_wstrb_UNCONNECTED(27 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(7) => xbar_to_m07_couplers_WVALID(7),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY(0),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY(0),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mysystem2 is
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
    reset : in STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    sys_diff_clock_clk_n : in STD_LOGIC;
    sys_diff_clock_clk_p : in STD_LOGIC
  );
end mysystem2;

architecture STRUCTURE of mysystem2 is
  component mysystem2_axi_dma_fifo2sdram_c_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component mysystem2_axi_dma_fifo2sdram_c_0;
  component mysystem2_axi_dma_fifo2sdram_d_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component mysystem2_axi_dma_fifo2sdram_d_0;
  component mysystem2_axi_dma_sdram2fifo_c_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    mm2s_introut : out STD_LOGIC
  );
  end component mysystem2_axi_dma_sdram2fifo_c_0;
  component mysystem2_axi_dma_sdram2fifo_d_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    mm2s_introut : out STD_LOGIC
  );
  end component mysystem2_axi_dma_sdram2fifo_d_0;
  component mysystem2_mig_7series_0_0 is
  port (
    sys_rst : in STD_LOGIC;
    ddr3_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr3_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ddr3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ddr3_ras_n : out STD_LOGIC;
    ddr3_cas_n : out STD_LOGIC;
    ddr3_we_n : out STD_LOGIC;
    ddr3_reset_n : out STD_LOGIC;
    ddr3_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    ui_clk_sync_rst : out STD_LOGIC;
    ui_clk : out STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    mmcm_locked : out STD_LOGIC;
    sys_clk_p : in STD_LOGIC;
    sys_clk_n : in STD_LOGIC;
    init_calib_complete : out STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  end component mysystem2_mig_7series_0_0;
  component mysystem2_axi_uartlite_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  end component mysystem2_axi_uartlite_0_0;
  component mysystem2_microblaze_0_0 is
  port (
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Interrupt : in STD_LOGIC;
    Interrupt_Address : in STD_LOGIC_VECTOR ( 0 to 31 );
    Interrupt_Ack : out STD_LOGIC_VECTOR ( 0 to 1 );
    Instr_Addr : out STD_LOGIC_VECTOR ( 0 to 31 );
    Instr : in STD_LOGIC_VECTOR ( 0 to 31 );
    IFetch : out STD_LOGIC;
    I_AS : out STD_LOGIC;
    IReady : in STD_LOGIC;
    IWAIT : in STD_LOGIC;
    ICE : in STD_LOGIC;
    IUE : in STD_LOGIC;
    Data_Addr : out STD_LOGIC_VECTOR ( 0 to 31 );
    Data_Read : in STD_LOGIC_VECTOR ( 0 to 31 );
    Data_Write : out STD_LOGIC_VECTOR ( 0 to 31 );
    D_AS : out STD_LOGIC;
    Read_Strobe : out STD_LOGIC;
    Write_Strobe : out STD_LOGIC;
    DReady : in STD_LOGIC;
    DWait : in STD_LOGIC;
    DCE : in STD_LOGIC;
    DUE : in STD_LOGIC;
    Byte_Enable : out STD_LOGIC_VECTOR ( 0 to 3 );
    M_AXI_DP_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DP_AWVALID : out STD_LOGIC;
    M_AXI_DP_AWREADY : in STD_LOGIC;
    M_AXI_DP_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DP_WVALID : out STD_LOGIC;
    M_AXI_DP_WREADY : in STD_LOGIC;
    M_AXI_DP_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_BVALID : in STD_LOGIC;
    M_AXI_DP_BREADY : out STD_LOGIC;
    M_AXI_DP_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DP_ARVALID : out STD_LOGIC;
    M_AXI_DP_ARREADY : in STD_LOGIC;
    M_AXI_DP_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_RVALID : in STD_LOGIC;
    M_AXI_DP_RREADY : out STD_LOGIC;
    Dbg_Clk : in STD_LOGIC;
    Dbg_TDI : in STD_LOGIC;
    Dbg_TDO : out STD_LOGIC;
    Dbg_Reg_En : in STD_LOGIC_VECTOR ( 0 to 7 );
    Dbg_Shift : in STD_LOGIC;
    Dbg_Capture : in STD_LOGIC;
    Dbg_Update : in STD_LOGIC;
    Debug_Rst : in STD_LOGIC;
    M_AXI_IC_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_IC_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_AWLOCK : out STD_LOGIC;
    M_AXI_IC_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_AWVALID : out STD_LOGIC;
    M_AXI_IC_AWREADY : in STD_LOGIC;
    M_AXI_IC_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_WLAST : out STD_LOGIC;
    M_AXI_IC_WVALID : out STD_LOGIC;
    M_AXI_IC_WREADY : in STD_LOGIC;
    M_AXI_IC_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_BVALID : in STD_LOGIC;
    M_AXI_IC_BREADY : out STD_LOGIC;
    M_AXI_IC_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_IC_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_ARLOCK : out STD_LOGIC;
    M_AXI_IC_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_ARVALID : out STD_LOGIC;
    M_AXI_IC_ARREADY : in STD_LOGIC;
    M_AXI_IC_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_RLAST : in STD_LOGIC;
    M_AXI_IC_RVALID : in STD_LOGIC;
    M_AXI_IC_RREADY : out STD_LOGIC;
    M_AXI_DC_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_DC_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_AWLOCK : out STD_LOGIC;
    M_AXI_DC_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_AWVALID : out STD_LOGIC;
    M_AXI_DC_AWREADY : in STD_LOGIC;
    M_AXI_DC_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_WLAST : out STD_LOGIC;
    M_AXI_DC_WVALID : out STD_LOGIC;
    M_AXI_DC_WREADY : in STD_LOGIC;
    M_AXI_DC_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_BVALID : in STD_LOGIC;
    M_AXI_DC_BREADY : out STD_LOGIC;
    M_AXI_DC_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_DC_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_ARLOCK : out STD_LOGIC;
    M_AXI_DC_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_ARVALID : out STD_LOGIC;
    M_AXI_DC_ARREADY : in STD_LOGIC;
    M_AXI_DC_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_RLAST : in STD_LOGIC;
    M_AXI_DC_RVALID : in STD_LOGIC;
    M_AXI_DC_RREADY : out STD_LOGIC
  );
  end component mysystem2_microblaze_0_0;
  component mysystem2_microblaze_0_axi_intc_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    intr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    processor_clk : in STD_LOGIC;
    processor_rst : in STD_LOGIC;
    irq : out STD_LOGIC;
    processor_ack : in STD_LOGIC_VECTOR ( 1 downto 0 );
    interrupt_address : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component mysystem2_microblaze_0_axi_intc_0;
  component mysystem2_microblaze_0_xlconcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component mysystem2_microblaze_0_xlconcat_0;
  component mysystem2_mdm_1_0 is
  port (
    Debug_SYS_Rst : out STD_LOGIC;
    Dbg_Clk_0 : out STD_LOGIC;
    Dbg_TDI_0 : out STD_LOGIC;
    Dbg_TDO_0 : in STD_LOGIC;
    Dbg_Reg_En_0 : out STD_LOGIC_VECTOR ( 0 to 7 );
    Dbg_Capture_0 : out STD_LOGIC;
    Dbg_Shift_0 : out STD_LOGIC;
    Dbg_Update_0 : out STD_LOGIC;
    Dbg_Rst_0 : out STD_LOGIC
  );
  end component mysystem2_mdm_1_0;
  component mysystem2_rst_mig_7series_0_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component mysystem2_rst_mig_7series_0_100M_0;
  signal CompressorSystem_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CompressorSystem_M_AXIS_TLAST : STD_LOGIC;
  signal CompressorSystem_M_AXIS_TREADY : STD_LOGIC;
  signal CompressorSystem_M_AXIS_TVALID : STD_LOGIC;
  signal DecompressorSystem_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DecompressorSystem_M_AXIS_TLAST : STD_LOGIC;
  signal DecompressorSystem_M_AXIS_TREADY : STD_LOGIC;
  signal DecompressorSystem_M_AXIS_TVALID : STD_LOGIC;
  signal GND_1 : STD_LOGIC;
  signal VCC_1 : STD_LOGIC;
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_fifo2sdram_c_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_fifo2sdram_d_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXIS_MM2S_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXIS_MM2S_TLAST : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXIS_MM2S_TREADY : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXIS_MM2S_TVALID : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_sdram2fifo_c_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXIS_MM2S_TREADY : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXIS_MM2S_TVALID : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_sdram2fifo_d_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI1_BID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI1_BVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI1_RDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal axi_mem_intercon_M00_AXI1_RID : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI1_RLAST : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI1_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI1_RVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI1_WDATA : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal axi_mem_intercon_M00_AXI1_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI1_WREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI1_WSTRB : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_mem_intercon_M00_AXI1_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_uartlite_0_UART1_RxD : STD_LOGIC;
  signal axi_uartlite_0_UART1_TxD : STD_LOGIC;
  signal axi_uartlite_0_interrupt1 : STD_LOGIC;
  signal mdm_1_debug_sys_rst_2 : STD_LOGIC;
  signal microblaze_0_Clk_1 : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_M_AXI_DC1_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_M_AXI_DC1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_M_AXI_DC1_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal microblaze_0_M_AXI_DC1_ARLOCK : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_M_AXI_DC1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_M_AXI_DC1_ARREADY : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_M_AXI_DC1_ARVALID : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_M_AXI_DC1_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_M_AXI_DC1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_M_AXI_DC1_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal microblaze_0_M_AXI_DC1_AWLOCK : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_M_AXI_DC1_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_M_AXI_DC1_AWREADY : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_M_AXI_DC1_AWVALID : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_BREADY : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_M_AXI_DC1_BVALID : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_M_AXI_DC1_RLAST : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_RREADY : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_M_AXI_DC1_RVALID : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_M_AXI_DC1_WLAST : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_WREADY : STD_LOGIC;
  signal microblaze_0_M_AXI_DC1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_M_AXI_DC1_WVALID : STD_LOGIC;
  signal microblaze_0_M_AXI_IC1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_M_AXI_IC1_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_M_AXI_IC1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_M_AXI_IC1_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal microblaze_0_M_AXI_IC1_ARLOCK : STD_LOGIC;
  signal microblaze_0_M_AXI_IC1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_M_AXI_IC1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_M_AXI_IC1_ARREADY : STD_LOGIC;
  signal microblaze_0_M_AXI_IC1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_M_AXI_IC1_ARVALID : STD_LOGIC;
  signal microblaze_0_M_AXI_IC1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_M_AXI_IC1_RLAST : STD_LOGIC;
  signal microblaze_0_M_AXI_IC1_RREADY : STD_LOGIC;
  signal microblaze_0_M_AXI_IC1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_M_AXI_IC1_RVALID : STD_LOGIC;
  signal microblaze_0_axi_dp_2_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_dp_2_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_dp_2_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_dp_2_ARVALID : STD_LOGIC;
  signal microblaze_0_axi_dp_2_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_dp_2_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_dp_2_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_dp_2_AWVALID : STD_LOGIC;
  signal microblaze_0_axi_dp_2_BREADY : STD_LOGIC;
  signal microblaze_0_axi_dp_2_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_dp_2_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_dp_2_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_dp_2_RREADY : STD_LOGIC;
  signal microblaze_0_axi_dp_2_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_dp_2_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_dp_2_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_dp_2_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_dp_2_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_dp_2_WVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M01_AXI1_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M01_AXI1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M01_AXI1_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M02_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M03_AXI_ARREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M03_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M03_AXI_AWREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M03_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M03_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M03_AXI_BVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M03_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M03_AXI_RVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M03_AXI_WREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M03_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M04_AXI_ARREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M04_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M04_AXI_AWREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M04_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M04_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M04_AXI_BVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M04_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M04_AXI_RVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M04_AXI_WREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M04_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M05_AXI_ARREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M05_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M05_AXI_AWREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M05_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M05_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M05_AXI_BVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M05_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M05_AXI_RVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M05_AXI_WREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M05_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M06_AXI_ARREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M06_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal microblaze_0_axi_periph_M06_AXI_AWREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M06_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M06_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M06_AXI_BVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M06_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M06_AXI_RVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M06_AXI_WREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M06_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M07_AXI_ARREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M07_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M07_AXI_AWREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M07_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M07_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M07_AXI_BVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M07_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_axi_periph_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_axi_periph_M07_AXI_RVALID : STD_LOGIC;
  signal microblaze_0_axi_periph_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_axi_periph_M07_AXI_WREADY : STD_LOGIC;
  signal microblaze_0_axi_periph_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_axi_periph_M07_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal microblaze_0_debug_2_CAPTURE : STD_LOGIC;
  signal microblaze_0_debug_2_CLK : STD_LOGIC;
  signal microblaze_0_debug_2_REG_EN : STD_LOGIC_VECTOR ( 0 to 7 );
  signal microblaze_0_debug_2_RST : STD_LOGIC;
  signal microblaze_0_debug_2_SHIFT : STD_LOGIC;
  signal microblaze_0_debug_2_TDI : STD_LOGIC;
  signal microblaze_0_debug_2_TDO : STD_LOGIC;
  signal microblaze_0_debug_2_UPDATE : STD_LOGIC;
  signal microblaze_0_dlmb_2_ABUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_2_ADDRSTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_2_BE : STD_LOGIC_VECTOR ( 0 to 3 );
  signal microblaze_0_dlmb_2_CE : STD_LOGIC;
  signal microblaze_0_dlmb_2_READDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_2_READSTROBE : STD_LOGIC;
  signal microblaze_0_dlmb_2_READY : STD_LOGIC;
  signal microblaze_0_dlmb_2_UE : STD_LOGIC;
  signal microblaze_0_dlmb_2_WAIT : STD_LOGIC;
  signal microblaze_0_dlmb_2_WRITEDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_dlmb_2_WRITESTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_2_ABUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_2_ADDRSTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_2_CE : STD_LOGIC;
  signal microblaze_0_ilmb_2_READDBUS : STD_LOGIC_VECTOR ( 0 to 31 );
  signal microblaze_0_ilmb_2_READSTROBE : STD_LOGIC;
  signal microblaze_0_ilmb_2_READY : STD_LOGIC;
  signal microblaze_0_ilmb_2_UE : STD_LOGIC;
  signal microblaze_0_ilmb_2_WAIT : STD_LOGIC;
  signal microblaze_0_intc_axi_2_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal microblaze_0_intc_axi_2_ARREADY : STD_LOGIC;
  signal microblaze_0_intc_axi_2_ARVALID : STD_LOGIC;
  signal microblaze_0_intc_axi_2_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal microblaze_0_intc_axi_2_AWREADY : STD_LOGIC;
  signal microblaze_0_intc_axi_2_AWVALID : STD_LOGIC;
  signal microblaze_0_intc_axi_2_BREADY : STD_LOGIC;
  signal microblaze_0_intc_axi_2_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_intc_axi_2_BVALID : STD_LOGIC;
  signal microblaze_0_intc_axi_2_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_intc_axi_2_RREADY : STD_LOGIC;
  signal microblaze_0_intc_axi_2_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal microblaze_0_intc_axi_2_RVALID : STD_LOGIC;
  signal microblaze_0_intc_axi_2_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_intc_axi_2_WREADY : STD_LOGIC;
  signal microblaze_0_intc_axi_2_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal microblaze_0_intc_axi_2_WVALID : STD_LOGIC;
  signal microblaze_0_interrupt_2_ACK : STD_LOGIC_VECTOR ( 0 to 1 );
  signal microblaze_0_interrupt_2_ADDRESS : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal microblaze_0_interrupt_2_INTERRUPT : STD_LOGIC;
  signal microblaze_0_intr_2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal mig_7series_0_DDR4_ADDR : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal mig_7series_0_DDR4_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal mig_7series_0_DDR4_CAS_N : STD_LOGIC;
  signal mig_7series_0_DDR4_CKE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mig_7series_0_DDR4_CK_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mig_7series_0_DDR4_CK_P : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mig_7series_0_DDR4_CS_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mig_7series_0_DDR4_DM : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal mig_7series_0_DDR4_DQ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal mig_7series_0_DDR4_DQS_N : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal mig_7series_0_DDR4_DQS_P : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal mig_7series_0_DDR4_ODT : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mig_7series_0_DDR4_RAS_N : STD_LOGIC;
  signal mig_7series_0_DDR4_RESET_N : STD_LOGIC;
  signal mig_7series_0_DDR4_WE_N : STD_LOGIC;
  signal mig_7series_0_mmcm_locked1 : STD_LOGIC;
  signal mig_7series_0_ui_clk_sync_rst1 : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal rst_mig_7series_0_100M_bus_struct_reset1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_mig_7series_0_100M_interconnect_aresetn1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_mig_7series_0_100M_mb_reset1 : STD_LOGIC;
  signal rst_mig_7series_0_100M_peripheral_aresetn1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sys_diff_clock_1_CLK_N : STD_LOGIC;
  signal sys_diff_clock_1_CLK_P : STD_LOGIC;
  signal NLW_axi_dma_fifo2sdram_c_s2mm_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_fifo2sdram_c_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_fifo2sdram_d_s2mm_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_fifo2sdram_d_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_sdram2fifo_c_mm2s_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_sdram2fifo_c_mm2s_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_sdram2fifo_d_m_axis_mm2s_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_sdram2fifo_d_mm2s_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_sdram2fifo_d_mm2s_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_sdram2fifo_d_m_axis_mm2s_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_microblaze_0_M_AXI_IC_AWVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_microblaze_0_M_AXI_IC_BREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_microblaze_0_M_AXI_IC_WLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_microblaze_0_M_AXI_IC_WVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_microblaze_0_M_AXI_DC_ARID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_microblaze_0_M_AXI_DC_AWID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_microblaze_0_M_AXI_IC_ARID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_AWSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_WDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_microblaze_0_M_AXI_IC_WSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mig_7series_0_init_calib_complete_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_mig_7series_0_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute BMM_INFO_PROCESSOR : string;
  attribute BMM_INFO_PROCESSOR of microblaze_0 : label is "microblaze-le > mysystem2 microblaze_0_local_memory/dlmb_bram_if_cntlr";
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of microblaze_0 : label is "yes";
begin
  axi_uartlite_0_UART1_RxD <= rs232_uart_rxd;
  ddr3_sdram_addr(13 downto 0) <= mig_7series_0_DDR4_ADDR(13 downto 0);
  ddr3_sdram_ba(2 downto 0) <= mig_7series_0_DDR4_BA(2 downto 0);
  ddr3_sdram_cas_n <= mig_7series_0_DDR4_CAS_N;
  ddr3_sdram_ck_n(0) <= mig_7series_0_DDR4_CK_N(0);
  ddr3_sdram_ck_p(0) <= mig_7series_0_DDR4_CK_P(0);
  ddr3_sdram_cke(0) <= mig_7series_0_DDR4_CKE(0);
  ddr3_sdram_cs_n(0) <= mig_7series_0_DDR4_CS_N(0);
  ddr3_sdram_dm(7 downto 0) <= mig_7series_0_DDR4_DM(7 downto 0);
  ddr3_sdram_odt(0) <= mig_7series_0_DDR4_ODT(0);
  ddr3_sdram_ras_n <= mig_7series_0_DDR4_RAS_N;
  ddr3_sdram_reset_n <= mig_7series_0_DDR4_RESET_N;
  ddr3_sdram_we_n <= mig_7series_0_DDR4_WE_N;
  reset_1 <= reset;
  rs232_uart_txd <= axi_uartlite_0_UART1_TxD;
  sys_diff_clock_1_CLK_N <= sys_diff_clock_clk_n;
  sys_diff_clock_1_CLK_P <= sys_diff_clock_clk_p;
CompressorSystem: entity work.CompressorSystem_imp_1CSQC68
    port map (
      M_AXIS_tdata(31 downto 0) => CompressorSystem_M_AXIS_TDATA(31 downto 0),
      M_AXIS_tlast => CompressorSystem_M_AXIS_TLAST,
      M_AXIS_tready => CompressorSystem_M_AXIS_TREADY,
      M_AXIS_tvalid => CompressorSystem_M_AXIS_TVALID,
      S_AXIS_tdata(31 downto 0) => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TDATA(31 downto 0),
      S_AXIS_tkeep(3 downto 0) => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TKEEP(3 downto 0),
      S_AXIS_tlast => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TLAST,
      S_AXIS_tready => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TREADY,
      S_AXIS_tvalid => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TVALID,
      S_AXI_LITE_araddr(3 downto 0) => microblaze_0_axi_periph_M01_AXI1_ARADDR(3 downto 0),
      S_AXI_LITE_arprot(2 downto 0) => microblaze_0_axi_periph_M01_AXI1_ARPROT(2 downto 0),
      S_AXI_LITE_arready(0) => microblaze_0_axi_periph_M01_AXI1_ARREADY(0),
      S_AXI_LITE_arvalid(0) => microblaze_0_axi_periph_M01_AXI1_ARVALID(0),
      S_AXI_LITE_awaddr(3 downto 0) => microblaze_0_axi_periph_M01_AXI1_AWADDR(3 downto 0),
      S_AXI_LITE_awprot(2 downto 0) => microblaze_0_axi_periph_M01_AXI1_AWPROT(2 downto 0),
      S_AXI_LITE_awready(0) => microblaze_0_axi_periph_M01_AXI1_AWREADY(0),
      S_AXI_LITE_awvalid(0) => microblaze_0_axi_periph_M01_AXI1_AWVALID(0),
      S_AXI_LITE_bready(0) => microblaze_0_axi_periph_M01_AXI1_BREADY(0),
      S_AXI_LITE_bresp(1 downto 0) => microblaze_0_axi_periph_M01_AXI1_BRESP(1 downto 0),
      S_AXI_LITE_bvalid(0) => microblaze_0_axi_periph_M01_AXI1_BVALID(0),
      S_AXI_LITE_rdata(31 downto 0) => microblaze_0_axi_periph_M01_AXI1_RDATA(31 downto 0),
      S_AXI_LITE_rready(0) => microblaze_0_axi_periph_M01_AXI1_RREADY(0),
      S_AXI_LITE_rresp(1 downto 0) => microblaze_0_axi_periph_M01_AXI1_RRESP(1 downto 0),
      S_AXI_LITE_rvalid(0) => microblaze_0_axi_periph_M01_AXI1_RVALID(0),
      S_AXI_LITE_wdata(31 downto 0) => microblaze_0_axi_periph_M01_AXI1_WDATA(31 downto 0),
      S_AXI_LITE_wready(0) => microblaze_0_axi_periph_M01_AXI1_WREADY(0),
      S_AXI_LITE_wstrb(3 downto 0) => microblaze_0_axi_periph_M01_AXI1_WSTRB(3 downto 0),
      S_AXI_LITE_wvalid(0) => microblaze_0_axi_periph_M01_AXI1_WVALID(0),
      aclk => microblaze_0_Clk_1,
      aresetn(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0)
    );
DecompressorSystem: entity work.DecompressorSystem_imp_K1210C
    port map (
      M_AXIS_tdata(31 downto 0) => DecompressorSystem_M_AXIS_TDATA(31 downto 0),
      M_AXIS_tlast => DecompressorSystem_M_AXIS_TLAST,
      M_AXIS_tready => DecompressorSystem_M_AXIS_TREADY,
      M_AXIS_tvalid => DecompressorSystem_M_AXIS_TVALID,
      S_AXIS_tdata(31 downto 0) => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TDATA(31 downto 0),
      S_AXIS_tready => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TREADY,
      S_AXIS_tvalid => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TVALID,
      S_AXI_LITE_araddr(3 downto 0) => microblaze_0_axi_periph_M02_AXI_ARADDR(3 downto 0),
      S_AXI_LITE_arprot(2 downto 0) => microblaze_0_axi_periph_M02_AXI_ARPROT(2 downto 0),
      S_AXI_LITE_arready(0) => microblaze_0_axi_periph_M02_AXI_ARREADY(0),
      S_AXI_LITE_arvalid(0) => microblaze_0_axi_periph_M02_AXI_ARVALID(0),
      S_AXI_LITE_awaddr(3 downto 0) => microblaze_0_axi_periph_M02_AXI_AWADDR(3 downto 0),
      S_AXI_LITE_awprot(2 downto 0) => microblaze_0_axi_periph_M02_AXI_AWPROT(2 downto 0),
      S_AXI_LITE_awready(0) => microblaze_0_axi_periph_M02_AXI_AWREADY(0),
      S_AXI_LITE_awvalid(0) => microblaze_0_axi_periph_M02_AXI_AWVALID(0),
      S_AXI_LITE_bready(0) => microblaze_0_axi_periph_M02_AXI_BREADY(0),
      S_AXI_LITE_bresp(1 downto 0) => microblaze_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      S_AXI_LITE_bvalid(0) => microblaze_0_axi_periph_M02_AXI_BVALID(0),
      S_AXI_LITE_rdata(31 downto 0) => microblaze_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      S_AXI_LITE_rready(0) => microblaze_0_axi_periph_M02_AXI_RREADY(0),
      S_AXI_LITE_rresp(1 downto 0) => microblaze_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      S_AXI_LITE_rvalid(0) => microblaze_0_axi_periph_M02_AXI_RVALID(0),
      S_AXI_LITE_wdata(31 downto 0) => microblaze_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      S_AXI_LITE_wready(0) => microblaze_0_axi_periph_M02_AXI_WREADY(0),
      S_AXI_LITE_wstrb(3 downto 0) => microblaze_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      S_AXI_LITE_wvalid(0) => microblaze_0_axi_periph_M02_AXI_WVALID(0),
      aclk => microblaze_0_Clk_1,
      aresetn(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0)
    );
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => VCC_1
    );
axi_dma_fifo2sdram_c: component mysystem2_axi_dma_fifo2sdram_c_0
    port map (
      axi_resetn => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      m_axi_s2mm_aclk => microblaze_0_Clk_1,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_fifo2sdram_c_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_fifo2sdram_c_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_WDATA(31 downto 0),
      m_axi_s2mm_wlast => axi_dma_fifo2sdram_c_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_fifo2sdram_c_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => axi_dma_fifo2sdram_c_M_AXI_S2MM_WVALID,
      s2mm_introut => NLW_axi_dma_fifo2sdram_c_s2mm_introut_UNCONNECTED,
      s2mm_prmry_reset_out_n => NLW_axi_dma_fifo2sdram_c_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => microblaze_0_Clk_1,
      s_axi_lite_araddr(9 downto 0) => microblaze_0_axi_periph_M03_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => microblaze_0_axi_periph_M03_AXI_ARREADY,
      s_axi_lite_arvalid => microblaze_0_axi_periph_M03_AXI_ARVALID(0),
      s_axi_lite_awaddr(9 downto 0) => microblaze_0_axi_periph_M03_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => microblaze_0_axi_periph_M03_AXI_AWREADY,
      s_axi_lite_awvalid => microblaze_0_axi_periph_M03_AXI_AWVALID(0),
      s_axi_lite_bready => microblaze_0_axi_periph_M03_AXI_BREADY(0),
      s_axi_lite_bresp(1 downto 0) => microblaze_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => microblaze_0_axi_periph_M03_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => microblaze_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => microblaze_0_axi_periph_M03_AXI_RREADY(0),
      s_axi_lite_rresp(1 downto 0) => microblaze_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => microblaze_0_axi_periph_M03_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => microblaze_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => microblaze_0_axi_periph_M03_AXI_WREADY,
      s_axi_lite_wvalid => microblaze_0_axi_periph_M03_AXI_WVALID(0),
      s_axis_s2mm_tdata(31 downto 0) => CompressorSystem_M_AXIS_TDATA(31 downto 0),
      s_axis_s2mm_tkeep(3) => VCC_1,
      s_axis_s2mm_tkeep(2) => VCC_1,
      s_axis_s2mm_tkeep(1) => VCC_1,
      s_axis_s2mm_tkeep(0) => VCC_1,
      s_axis_s2mm_tlast => CompressorSystem_M_AXIS_TLAST,
      s_axis_s2mm_tready => CompressorSystem_M_AXIS_TREADY,
      s_axis_s2mm_tvalid => CompressorSystem_M_AXIS_TVALID
    );
axi_dma_fifo2sdram_d: component mysystem2_axi_dma_fifo2sdram_d_0
    port map (
      axi_resetn => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      m_axi_s2mm_aclk => microblaze_0_Clk_1,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_fifo2sdram_d_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_fifo2sdram_d_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_WDATA(31 downto 0),
      m_axi_s2mm_wlast => axi_dma_fifo2sdram_d_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_fifo2sdram_d_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => axi_dma_fifo2sdram_d_M_AXI_S2MM_WVALID,
      s2mm_introut => NLW_axi_dma_fifo2sdram_d_s2mm_introut_UNCONNECTED,
      s2mm_prmry_reset_out_n => NLW_axi_dma_fifo2sdram_d_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => microblaze_0_Clk_1,
      s_axi_lite_araddr(9 downto 0) => microblaze_0_axi_periph_M04_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => microblaze_0_axi_periph_M04_AXI_ARREADY,
      s_axi_lite_arvalid => microblaze_0_axi_periph_M04_AXI_ARVALID(0),
      s_axi_lite_awaddr(9 downto 0) => microblaze_0_axi_periph_M04_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => microblaze_0_axi_periph_M04_AXI_AWREADY,
      s_axi_lite_awvalid => microblaze_0_axi_periph_M04_AXI_AWVALID(0),
      s_axi_lite_bready => microblaze_0_axi_periph_M04_AXI_BREADY(0),
      s_axi_lite_bresp(1 downto 0) => microblaze_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => microblaze_0_axi_periph_M04_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => microblaze_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => microblaze_0_axi_periph_M04_AXI_RREADY(0),
      s_axi_lite_rresp(1 downto 0) => microblaze_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => microblaze_0_axi_periph_M04_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => microblaze_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => microblaze_0_axi_periph_M04_AXI_WREADY,
      s_axi_lite_wvalid => microblaze_0_axi_periph_M04_AXI_WVALID(0),
      s_axis_s2mm_tdata(31 downto 0) => DecompressorSystem_M_AXIS_TDATA(31 downto 0),
      s_axis_s2mm_tkeep(3) => VCC_1,
      s_axis_s2mm_tkeep(2) => VCC_1,
      s_axis_s2mm_tkeep(1) => VCC_1,
      s_axis_s2mm_tkeep(0) => VCC_1,
      s_axis_s2mm_tlast => DecompressorSystem_M_AXIS_TLAST,
      s_axis_s2mm_tready => DecompressorSystem_M_AXIS_TREADY,
      s_axis_s2mm_tvalid => DecompressorSystem_M_AXIS_TVALID
    );
axi_dma_sdram2fifo_c: component mysystem2_axi_dma_sdram2fifo_c_0
    port map (
      axi_resetn => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      m_axi_mm2s_aclk => microblaze_0_Clk_1,
      m_axi_mm2s_araddr(31 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARADDR(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARBURST(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARCACHE(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARLEN(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARPROT(2 downto 0),
      m_axi_mm2s_arready => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARREADY,
      m_axi_mm2s_arsize(2 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARSIZE(2 downto 0),
      m_axi_mm2s_arvalid => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARVALID,
      m_axi_mm2s_rdata(31 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_RDATA(31 downto 0),
      m_axi_mm2s_rlast => axi_dma_sdram2fifo_c_M_AXI_MM2S_RLAST,
      m_axi_mm2s_rready => axi_dma_sdram2fifo_c_M_AXI_MM2S_RREADY,
      m_axi_mm2s_rresp(1 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_RRESP(1 downto 0),
      m_axi_mm2s_rvalid => axi_dma_sdram2fifo_c_M_AXI_MM2S_RVALID,
      m_axis_mm2s_tdata(31 downto 0) => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TDATA(31 downto 0),
      m_axis_mm2s_tkeep(3 downto 0) => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TKEEP(3 downto 0),
      m_axis_mm2s_tlast => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TLAST,
      m_axis_mm2s_tready => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TREADY,
      m_axis_mm2s_tvalid => axi_dma_sdram2fifo_c_M_AXIS_MM2S_TVALID,
      mm2s_introut => NLW_axi_dma_sdram2fifo_c_mm2s_introut_UNCONNECTED,
      mm2s_prmry_reset_out_n => NLW_axi_dma_sdram2fifo_c_mm2s_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => microblaze_0_Clk_1,
      s_axi_lite_araddr(9 downto 0) => microblaze_0_axi_periph_M05_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => microblaze_0_axi_periph_M05_AXI_ARREADY,
      s_axi_lite_arvalid => microblaze_0_axi_periph_M05_AXI_ARVALID(0),
      s_axi_lite_awaddr(9 downto 0) => microblaze_0_axi_periph_M05_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => microblaze_0_axi_periph_M05_AXI_AWREADY,
      s_axi_lite_awvalid => microblaze_0_axi_periph_M05_AXI_AWVALID(0),
      s_axi_lite_bready => microblaze_0_axi_periph_M05_AXI_BREADY(0),
      s_axi_lite_bresp(1 downto 0) => microblaze_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => microblaze_0_axi_periph_M05_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => microblaze_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => microblaze_0_axi_periph_M05_AXI_RREADY(0),
      s_axi_lite_rresp(1 downto 0) => microblaze_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => microblaze_0_axi_periph_M05_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => microblaze_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => microblaze_0_axi_periph_M05_AXI_WREADY,
      s_axi_lite_wvalid => microblaze_0_axi_periph_M05_AXI_WVALID(0)
    );
axi_dma_sdram2fifo_d: component mysystem2_axi_dma_sdram2fifo_d_0
    port map (
      axi_resetn => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      m_axi_mm2s_aclk => microblaze_0_Clk_1,
      m_axi_mm2s_araddr(31 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARADDR(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARBURST(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARCACHE(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARLEN(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARPROT(2 downto 0),
      m_axi_mm2s_arready => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARREADY,
      m_axi_mm2s_arsize(2 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARSIZE(2 downto 0),
      m_axi_mm2s_arvalid => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARVALID,
      m_axi_mm2s_rdata(31 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_RDATA(31 downto 0),
      m_axi_mm2s_rlast => axi_dma_sdram2fifo_d_M_AXI_MM2S_RLAST,
      m_axi_mm2s_rready => axi_dma_sdram2fifo_d_M_AXI_MM2S_RREADY,
      m_axi_mm2s_rresp(1 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_RRESP(1 downto 0),
      m_axi_mm2s_rvalid => axi_dma_sdram2fifo_d_M_AXI_MM2S_RVALID,
      m_axis_mm2s_tdata(31 downto 0) => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TDATA(31 downto 0),
      m_axis_mm2s_tkeep(3 downto 0) => NLW_axi_dma_sdram2fifo_d_m_axis_mm2s_tkeep_UNCONNECTED(3 downto 0),
      m_axis_mm2s_tlast => NLW_axi_dma_sdram2fifo_d_m_axis_mm2s_tlast_UNCONNECTED,
      m_axis_mm2s_tready => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TREADY,
      m_axis_mm2s_tvalid => axi_dma_sdram2fifo_d_M_AXIS_MM2S_TVALID,
      mm2s_introut => NLW_axi_dma_sdram2fifo_d_mm2s_introut_UNCONNECTED,
      mm2s_prmry_reset_out_n => NLW_axi_dma_sdram2fifo_d_mm2s_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => microblaze_0_Clk_1,
      s_axi_lite_araddr(9 downto 0) => microblaze_0_axi_periph_M06_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => microblaze_0_axi_periph_M06_AXI_ARREADY,
      s_axi_lite_arvalid => microblaze_0_axi_periph_M06_AXI_ARVALID(0),
      s_axi_lite_awaddr(9 downto 0) => microblaze_0_axi_periph_M06_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => microblaze_0_axi_periph_M06_AXI_AWREADY,
      s_axi_lite_awvalid => microblaze_0_axi_periph_M06_AXI_AWVALID(0),
      s_axi_lite_bready => microblaze_0_axi_periph_M06_AXI_BREADY(0),
      s_axi_lite_bresp(1 downto 0) => microblaze_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => microblaze_0_axi_periph_M06_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => microblaze_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => microblaze_0_axi_periph_M06_AXI_RREADY(0),
      s_axi_lite_rresp(1 downto 0) => microblaze_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => microblaze_0_axi_periph_M06_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => microblaze_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => microblaze_0_axi_periph_M06_AXI_WREADY,
      s_axi_lite_wvalid => microblaze_0_axi_periph_M06_AXI_WVALID(0)
    );
axi_mem_intercon: entity work.mysystem2_axi_mem_intercon_0
    port map (
      ACLK => microblaze_0_Clk_1,
      ARESETN(0) => rst_mig_7series_0_100M_interconnect_aresetn1(0),
      M00_ACLK => microblaze_0_Clk_1,
      M00_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M00_AXI_araddr(31 downto 0) => axi_mem_intercon_M00_AXI1_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_mem_intercon_M00_AXI1_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_mem_intercon_M00_AXI1_ARCACHE(3 downto 0),
      M00_AXI_arid(2 downto 0) => axi_mem_intercon_M00_AXI1_ARID(2 downto 0),
      M00_AXI_arlen(7 downto 0) => axi_mem_intercon_M00_AXI1_ARLEN(7 downto 0),
      M00_AXI_arlock(0) => axi_mem_intercon_M00_AXI1_ARLOCK(0),
      M00_AXI_arprot(2 downto 0) => axi_mem_intercon_M00_AXI1_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => axi_mem_intercon_M00_AXI1_ARQOS(3 downto 0),
      M00_AXI_arready(0) => axi_mem_intercon_M00_AXI1_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_mem_intercon_M00_AXI1_ARSIZE(2 downto 0),
      M00_AXI_arvalid(0) => axi_mem_intercon_M00_AXI1_ARVALID(0),
      M00_AXI_awaddr(31 downto 0) => axi_mem_intercon_M00_AXI1_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_mem_intercon_M00_AXI1_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_mem_intercon_M00_AXI1_AWCACHE(3 downto 0),
      M00_AXI_awid(2 downto 0) => axi_mem_intercon_M00_AXI1_AWID(2 downto 0),
      M00_AXI_awlen(7 downto 0) => axi_mem_intercon_M00_AXI1_AWLEN(7 downto 0),
      M00_AXI_awlock(0) => axi_mem_intercon_M00_AXI1_AWLOCK(0),
      M00_AXI_awprot(2 downto 0) => axi_mem_intercon_M00_AXI1_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_mem_intercon_M00_AXI1_AWQOS(3 downto 0),
      M00_AXI_awready(0) => axi_mem_intercon_M00_AXI1_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_mem_intercon_M00_AXI1_AWSIZE(2 downto 0),
      M00_AXI_awvalid(0) => axi_mem_intercon_M00_AXI1_AWVALID(0),
      M00_AXI_bid(2 downto 0) => axi_mem_intercon_M00_AXI1_BID(2 downto 0),
      M00_AXI_bready(0) => axi_mem_intercon_M00_AXI1_BREADY(0),
      M00_AXI_bresp(1 downto 0) => axi_mem_intercon_M00_AXI1_BRESP(1 downto 0),
      M00_AXI_bvalid(0) => axi_mem_intercon_M00_AXI1_BVALID,
      M00_AXI_rdata(511 downto 0) => axi_mem_intercon_M00_AXI1_RDATA(511 downto 0),
      M00_AXI_rid(2 downto 0) => axi_mem_intercon_M00_AXI1_RID(2 downto 0),
      M00_AXI_rlast(0) => axi_mem_intercon_M00_AXI1_RLAST,
      M00_AXI_rready(0) => axi_mem_intercon_M00_AXI1_RREADY(0),
      M00_AXI_rresp(1 downto 0) => axi_mem_intercon_M00_AXI1_RRESP(1 downto 0),
      M00_AXI_rvalid(0) => axi_mem_intercon_M00_AXI1_RVALID,
      M00_AXI_wdata(511 downto 0) => axi_mem_intercon_M00_AXI1_WDATA(511 downto 0),
      M00_AXI_wlast(0) => axi_mem_intercon_M00_AXI1_WLAST(0),
      M00_AXI_wready(0) => axi_mem_intercon_M00_AXI1_WREADY,
      M00_AXI_wstrb(63 downto 0) => axi_mem_intercon_M00_AXI1_WSTRB(63 downto 0),
      M00_AXI_wvalid(0) => axi_mem_intercon_M00_AXI1_WVALID(0),
      S00_ACLK => microblaze_0_Clk_1,
      S00_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      S00_AXI_araddr(31 downto 0) => microblaze_0_M_AXI_DC1_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => microblaze_0_M_AXI_DC1_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => microblaze_0_M_AXI_DC1_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => microblaze_0_M_AXI_DC1_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => microblaze_0_M_AXI_DC1_ARLOCK,
      S00_AXI_arprot(2 downto 0) => microblaze_0_M_AXI_DC1_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => microblaze_0_M_AXI_DC1_ARQOS(3 downto 0),
      S00_AXI_arready => microblaze_0_M_AXI_DC1_ARREADY,
      S00_AXI_arsize(2 downto 0) => microblaze_0_M_AXI_DC1_ARSIZE(2 downto 0),
      S00_AXI_arvalid => microblaze_0_M_AXI_DC1_ARVALID,
      S00_AXI_awaddr(31 downto 0) => microblaze_0_M_AXI_DC1_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => microblaze_0_M_AXI_DC1_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => microblaze_0_M_AXI_DC1_AWCACHE(3 downto 0),
      S00_AXI_awlen(7 downto 0) => microblaze_0_M_AXI_DC1_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => microblaze_0_M_AXI_DC1_AWLOCK,
      S00_AXI_awprot(2 downto 0) => microblaze_0_M_AXI_DC1_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => microblaze_0_M_AXI_DC1_AWQOS(3 downto 0),
      S00_AXI_awready => microblaze_0_M_AXI_DC1_AWREADY,
      S00_AXI_awsize(2 downto 0) => microblaze_0_M_AXI_DC1_AWSIZE(2 downto 0),
      S00_AXI_awvalid => microblaze_0_M_AXI_DC1_AWVALID,
      S00_AXI_bready => microblaze_0_M_AXI_DC1_BREADY,
      S00_AXI_bresp(1 downto 0) => microblaze_0_M_AXI_DC1_BRESP(1 downto 0),
      S00_AXI_bvalid => microblaze_0_M_AXI_DC1_BVALID,
      S00_AXI_rdata(31 downto 0) => microblaze_0_M_AXI_DC1_RDATA(31 downto 0),
      S00_AXI_rlast => microblaze_0_M_AXI_DC1_RLAST,
      S00_AXI_rready => microblaze_0_M_AXI_DC1_RREADY,
      S00_AXI_rresp(1 downto 0) => microblaze_0_M_AXI_DC1_RRESP(1 downto 0),
      S00_AXI_rvalid => microblaze_0_M_AXI_DC1_RVALID,
      S00_AXI_wdata(31 downto 0) => microblaze_0_M_AXI_DC1_WDATA(31 downto 0),
      S00_AXI_wlast => microblaze_0_M_AXI_DC1_WLAST,
      S00_AXI_wready => microblaze_0_M_AXI_DC1_WREADY,
      S00_AXI_wstrb(3 downto 0) => microblaze_0_M_AXI_DC1_WSTRB(3 downto 0),
      S00_AXI_wvalid => microblaze_0_M_AXI_DC1_WVALID,
      S01_ACLK => microblaze_0_Clk_1,
      S01_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      S01_AXI_araddr(31 downto 0) => microblaze_0_M_AXI_IC1_ARADDR(31 downto 0),
      S01_AXI_arburst(1 downto 0) => microblaze_0_M_AXI_IC1_ARBURST(1 downto 0),
      S01_AXI_arcache(3 downto 0) => microblaze_0_M_AXI_IC1_ARCACHE(3 downto 0),
      S01_AXI_arlen(7 downto 0) => microblaze_0_M_AXI_IC1_ARLEN(7 downto 0),
      S01_AXI_arlock(0) => microblaze_0_M_AXI_IC1_ARLOCK,
      S01_AXI_arprot(2 downto 0) => microblaze_0_M_AXI_IC1_ARPROT(2 downto 0),
      S01_AXI_arqos(3 downto 0) => microblaze_0_M_AXI_IC1_ARQOS(3 downto 0),
      S01_AXI_arready => microblaze_0_M_AXI_IC1_ARREADY,
      S01_AXI_arsize(2 downto 0) => microblaze_0_M_AXI_IC1_ARSIZE(2 downto 0),
      S01_AXI_arvalid => microblaze_0_M_AXI_IC1_ARVALID,
      S01_AXI_rdata(31 downto 0) => microblaze_0_M_AXI_IC1_RDATA(31 downto 0),
      S01_AXI_rlast => microblaze_0_M_AXI_IC1_RLAST,
      S01_AXI_rready => microblaze_0_M_AXI_IC1_RREADY,
      S01_AXI_rresp(1 downto 0) => microblaze_0_M_AXI_IC1_RRESP(1 downto 0),
      S01_AXI_rvalid => microblaze_0_M_AXI_IC1_RVALID,
      S02_ACLK => microblaze_0_Clk_1,
      S02_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      S02_AXI_awaddr(31 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWADDR(31 downto 0),
      S02_AXI_awburst(1 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWBURST(1 downto 0),
      S02_AXI_awcache(3 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWCACHE(3 downto 0),
      S02_AXI_awlen(7 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWLEN(7 downto 0),
      S02_AXI_awprot(2 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWPROT(2 downto 0),
      S02_AXI_awready => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWREADY,
      S02_AXI_awsize(2 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWSIZE(2 downto 0),
      S02_AXI_awvalid => axi_dma_fifo2sdram_c_M_AXI_S2MM_AWVALID,
      S02_AXI_bready => axi_dma_fifo2sdram_c_M_AXI_S2MM_BREADY,
      S02_AXI_bresp(1 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_BRESP(1 downto 0),
      S02_AXI_bvalid => axi_dma_fifo2sdram_c_M_AXI_S2MM_BVALID,
      S02_AXI_wdata(31 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_WDATA(31 downto 0),
      S02_AXI_wlast => axi_dma_fifo2sdram_c_M_AXI_S2MM_WLAST,
      S02_AXI_wready => axi_dma_fifo2sdram_c_M_AXI_S2MM_WREADY,
      S02_AXI_wstrb(3 downto 0) => axi_dma_fifo2sdram_c_M_AXI_S2MM_WSTRB(3 downto 0),
      S02_AXI_wvalid => axi_dma_fifo2sdram_c_M_AXI_S2MM_WVALID,
      S03_ACLK => microblaze_0_Clk_1,
      S03_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      S03_AXI_awaddr(31 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWADDR(31 downto 0),
      S03_AXI_awburst(1 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWBURST(1 downto 0),
      S03_AXI_awcache(3 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWCACHE(3 downto 0),
      S03_AXI_awlen(7 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWLEN(7 downto 0),
      S03_AXI_awprot(2 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWPROT(2 downto 0),
      S03_AXI_awready => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWREADY,
      S03_AXI_awsize(2 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWSIZE(2 downto 0),
      S03_AXI_awvalid => axi_dma_fifo2sdram_d_M_AXI_S2MM_AWVALID,
      S03_AXI_bready => axi_dma_fifo2sdram_d_M_AXI_S2MM_BREADY,
      S03_AXI_bresp(1 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_BRESP(1 downto 0),
      S03_AXI_bvalid => axi_dma_fifo2sdram_d_M_AXI_S2MM_BVALID,
      S03_AXI_wdata(31 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_WDATA(31 downto 0),
      S03_AXI_wlast => axi_dma_fifo2sdram_d_M_AXI_S2MM_WLAST,
      S03_AXI_wready => axi_dma_fifo2sdram_d_M_AXI_S2MM_WREADY,
      S03_AXI_wstrb(3 downto 0) => axi_dma_fifo2sdram_d_M_AXI_S2MM_WSTRB(3 downto 0),
      S03_AXI_wvalid => axi_dma_fifo2sdram_d_M_AXI_S2MM_WVALID,
      S04_ACLK => microblaze_0_Clk_1,
      S04_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      S04_AXI_araddr(31 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARADDR(31 downto 0),
      S04_AXI_arburst(1 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARBURST(1 downto 0),
      S04_AXI_arcache(3 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARCACHE(3 downto 0),
      S04_AXI_arlen(7 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARLEN(7 downto 0),
      S04_AXI_arprot(2 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARPROT(2 downto 0),
      S04_AXI_arready => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARREADY,
      S04_AXI_arsize(2 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARSIZE(2 downto 0),
      S04_AXI_arvalid => axi_dma_sdram2fifo_c_M_AXI_MM2S_ARVALID,
      S04_AXI_rdata(31 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_RDATA(31 downto 0),
      S04_AXI_rlast => axi_dma_sdram2fifo_c_M_AXI_MM2S_RLAST,
      S04_AXI_rready => axi_dma_sdram2fifo_c_M_AXI_MM2S_RREADY,
      S04_AXI_rresp(1 downto 0) => axi_dma_sdram2fifo_c_M_AXI_MM2S_RRESP(1 downto 0),
      S04_AXI_rvalid => axi_dma_sdram2fifo_c_M_AXI_MM2S_RVALID,
      S05_ACLK => microblaze_0_Clk_1,
      S05_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      S05_AXI_araddr(31 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARADDR(31 downto 0),
      S05_AXI_arburst(1 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARBURST(1 downto 0),
      S05_AXI_arcache(3 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARCACHE(3 downto 0),
      S05_AXI_arlen(7 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARLEN(7 downto 0),
      S05_AXI_arprot(2 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARPROT(2 downto 0),
      S05_AXI_arready => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARREADY,
      S05_AXI_arsize(2 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARSIZE(2 downto 0),
      S05_AXI_arvalid => axi_dma_sdram2fifo_d_M_AXI_MM2S_ARVALID,
      S05_AXI_rdata(31 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_RDATA(31 downto 0),
      S05_AXI_rlast => axi_dma_sdram2fifo_d_M_AXI_MM2S_RLAST,
      S05_AXI_rready => axi_dma_sdram2fifo_d_M_AXI_MM2S_RREADY,
      S05_AXI_rresp(1 downto 0) => axi_dma_sdram2fifo_d_M_AXI_MM2S_RRESP(1 downto 0),
      S05_AXI_rvalid => axi_dma_sdram2fifo_d_M_AXI_MM2S_RVALID
    );
axi_uartlite_0: component mysystem2_axi_uartlite_0_0
    port map (
      interrupt => axi_uartlite_0_interrupt1,
      rx => axi_uartlite_0_UART1_RxD,
      s_axi_aclk => microblaze_0_Clk_1,
      s_axi_araddr(3 downto 0) => microblaze_0_axi_periph_M07_AXI_ARADDR(3 downto 0),
      s_axi_aresetn => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      s_axi_arready => microblaze_0_axi_periph_M07_AXI_ARREADY,
      s_axi_arvalid => microblaze_0_axi_periph_M07_AXI_ARVALID(0),
      s_axi_awaddr(3 downto 0) => microblaze_0_axi_periph_M07_AXI_AWADDR(3 downto 0),
      s_axi_awready => microblaze_0_axi_periph_M07_AXI_AWREADY,
      s_axi_awvalid => microblaze_0_axi_periph_M07_AXI_AWVALID(0),
      s_axi_bready => microblaze_0_axi_periph_M07_AXI_BREADY(0),
      s_axi_bresp(1 downto 0) => microblaze_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      s_axi_bvalid => microblaze_0_axi_periph_M07_AXI_BVALID,
      s_axi_rdata(31 downto 0) => microblaze_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      s_axi_rready => microblaze_0_axi_periph_M07_AXI_RREADY(0),
      s_axi_rresp(1 downto 0) => microblaze_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      s_axi_rvalid => microblaze_0_axi_periph_M07_AXI_RVALID,
      s_axi_wdata(31 downto 0) => microblaze_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      s_axi_wready => microblaze_0_axi_periph_M07_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => microblaze_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => microblaze_0_axi_periph_M07_AXI_WVALID(0),
      tx => axi_uartlite_0_UART1_TxD
    );
mdm_1: component mysystem2_mdm_1_0
    port map (
      Dbg_Capture_0 => microblaze_0_debug_2_CAPTURE,
      Dbg_Clk_0 => microblaze_0_debug_2_CLK,
      Dbg_Reg_En_0(0 to 7) => microblaze_0_debug_2_REG_EN(0 to 7),
      Dbg_Rst_0 => microblaze_0_debug_2_RST,
      Dbg_Shift_0 => microblaze_0_debug_2_SHIFT,
      Dbg_TDI_0 => microblaze_0_debug_2_TDI,
      Dbg_TDO_0 => microblaze_0_debug_2_TDO,
      Dbg_Update_0 => microblaze_0_debug_2_UPDATE,
      Debug_SYS_Rst => mdm_1_debug_sys_rst_2
    );
microblaze_0: component mysystem2_microblaze_0_0
    port map (
      Byte_Enable(0 to 3) => microblaze_0_dlmb_2_BE(0 to 3),
      Clk => microblaze_0_Clk_1,
      DCE => microblaze_0_dlmb_2_CE,
      DReady => microblaze_0_dlmb_2_READY,
      DUE => microblaze_0_dlmb_2_UE,
      DWait => microblaze_0_dlmb_2_WAIT,
      D_AS => microblaze_0_dlmb_2_ADDRSTROBE,
      Data_Addr(0 to 31) => microblaze_0_dlmb_2_ABUS(0 to 31),
      Data_Read(0 to 31) => microblaze_0_dlmb_2_READDBUS(0 to 31),
      Data_Write(0 to 31) => microblaze_0_dlmb_2_WRITEDBUS(0 to 31),
      Dbg_Capture => microblaze_0_debug_2_CAPTURE,
      Dbg_Clk => microblaze_0_debug_2_CLK,
      Dbg_Reg_En(0 to 7) => microblaze_0_debug_2_REG_EN(0 to 7),
      Dbg_Shift => microblaze_0_debug_2_SHIFT,
      Dbg_TDI => microblaze_0_debug_2_TDI,
      Dbg_TDO => microblaze_0_debug_2_TDO,
      Dbg_Update => microblaze_0_debug_2_UPDATE,
      Debug_Rst => microblaze_0_debug_2_RST,
      ICE => microblaze_0_ilmb_2_CE,
      IFetch => microblaze_0_ilmb_2_READSTROBE,
      IReady => microblaze_0_ilmb_2_READY,
      IUE => microblaze_0_ilmb_2_UE,
      IWAIT => microblaze_0_ilmb_2_WAIT,
      I_AS => microblaze_0_ilmb_2_ADDRSTROBE,
      Instr(0 to 31) => microblaze_0_ilmb_2_READDBUS(0 to 31),
      Instr_Addr(0 to 31) => microblaze_0_ilmb_2_ABUS(0 to 31),
      Interrupt => microblaze_0_interrupt_2_INTERRUPT,
      Interrupt_Ack(0 to 1) => microblaze_0_interrupt_2_ACK(0 to 1),
      Interrupt_Address(0) => microblaze_0_interrupt_2_ADDRESS(31),
      Interrupt_Address(1) => microblaze_0_interrupt_2_ADDRESS(30),
      Interrupt_Address(2) => microblaze_0_interrupt_2_ADDRESS(29),
      Interrupt_Address(3) => microblaze_0_interrupt_2_ADDRESS(28),
      Interrupt_Address(4) => microblaze_0_interrupt_2_ADDRESS(27),
      Interrupt_Address(5) => microblaze_0_interrupt_2_ADDRESS(26),
      Interrupt_Address(6) => microblaze_0_interrupt_2_ADDRESS(25),
      Interrupt_Address(7) => microblaze_0_interrupt_2_ADDRESS(24),
      Interrupt_Address(8) => microblaze_0_interrupt_2_ADDRESS(23),
      Interrupt_Address(9) => microblaze_0_interrupt_2_ADDRESS(22),
      Interrupt_Address(10) => microblaze_0_interrupt_2_ADDRESS(21),
      Interrupt_Address(11) => microblaze_0_interrupt_2_ADDRESS(20),
      Interrupt_Address(12) => microblaze_0_interrupt_2_ADDRESS(19),
      Interrupt_Address(13) => microblaze_0_interrupt_2_ADDRESS(18),
      Interrupt_Address(14) => microblaze_0_interrupt_2_ADDRESS(17),
      Interrupt_Address(15) => microblaze_0_interrupt_2_ADDRESS(16),
      Interrupt_Address(16) => microblaze_0_interrupt_2_ADDRESS(15),
      Interrupt_Address(17) => microblaze_0_interrupt_2_ADDRESS(14),
      Interrupt_Address(18) => microblaze_0_interrupt_2_ADDRESS(13),
      Interrupt_Address(19) => microblaze_0_interrupt_2_ADDRESS(12),
      Interrupt_Address(20) => microblaze_0_interrupt_2_ADDRESS(11),
      Interrupt_Address(21) => microblaze_0_interrupt_2_ADDRESS(10),
      Interrupt_Address(22) => microblaze_0_interrupt_2_ADDRESS(9),
      Interrupt_Address(23) => microblaze_0_interrupt_2_ADDRESS(8),
      Interrupt_Address(24) => microblaze_0_interrupt_2_ADDRESS(7),
      Interrupt_Address(25) => microblaze_0_interrupt_2_ADDRESS(6),
      Interrupt_Address(26) => microblaze_0_interrupt_2_ADDRESS(5),
      Interrupt_Address(27) => microblaze_0_interrupt_2_ADDRESS(4),
      Interrupt_Address(28) => microblaze_0_interrupt_2_ADDRESS(3),
      Interrupt_Address(29) => microblaze_0_interrupt_2_ADDRESS(2),
      Interrupt_Address(30) => microblaze_0_interrupt_2_ADDRESS(1),
      Interrupt_Address(31) => microblaze_0_interrupt_2_ADDRESS(0),
      M_AXI_DC_ARADDR(31 downto 0) => microblaze_0_M_AXI_DC1_ARADDR(31 downto 0),
      M_AXI_DC_ARBURST(1 downto 0) => microblaze_0_M_AXI_DC1_ARBURST(1 downto 0),
      M_AXI_DC_ARCACHE(3 downto 0) => microblaze_0_M_AXI_DC1_ARCACHE(3 downto 0),
      M_AXI_DC_ARID(0) => NLW_microblaze_0_M_AXI_DC_ARID_UNCONNECTED(0),
      M_AXI_DC_ARLEN(7 downto 0) => microblaze_0_M_AXI_DC1_ARLEN(7 downto 0),
      M_AXI_DC_ARLOCK => microblaze_0_M_AXI_DC1_ARLOCK,
      M_AXI_DC_ARPROT(2 downto 0) => microblaze_0_M_AXI_DC1_ARPROT(2 downto 0),
      M_AXI_DC_ARQOS(3 downto 0) => microblaze_0_M_AXI_DC1_ARQOS(3 downto 0),
      M_AXI_DC_ARREADY => microblaze_0_M_AXI_DC1_ARREADY,
      M_AXI_DC_ARSIZE(2 downto 0) => microblaze_0_M_AXI_DC1_ARSIZE(2 downto 0),
      M_AXI_DC_ARVALID => microblaze_0_M_AXI_DC1_ARVALID,
      M_AXI_DC_AWADDR(31 downto 0) => microblaze_0_M_AXI_DC1_AWADDR(31 downto 0),
      M_AXI_DC_AWBURST(1 downto 0) => microblaze_0_M_AXI_DC1_AWBURST(1 downto 0),
      M_AXI_DC_AWCACHE(3 downto 0) => microblaze_0_M_AXI_DC1_AWCACHE(3 downto 0),
      M_AXI_DC_AWID(0) => NLW_microblaze_0_M_AXI_DC_AWID_UNCONNECTED(0),
      M_AXI_DC_AWLEN(7 downto 0) => microblaze_0_M_AXI_DC1_AWLEN(7 downto 0),
      M_AXI_DC_AWLOCK => microblaze_0_M_AXI_DC1_AWLOCK,
      M_AXI_DC_AWPROT(2 downto 0) => microblaze_0_M_AXI_DC1_AWPROT(2 downto 0),
      M_AXI_DC_AWQOS(3 downto 0) => microblaze_0_M_AXI_DC1_AWQOS(3 downto 0),
      M_AXI_DC_AWREADY => microblaze_0_M_AXI_DC1_AWREADY,
      M_AXI_DC_AWSIZE(2 downto 0) => microblaze_0_M_AXI_DC1_AWSIZE(2 downto 0),
      M_AXI_DC_AWVALID => microblaze_0_M_AXI_DC1_AWVALID,
      M_AXI_DC_BID(0) => GND_1,
      M_AXI_DC_BREADY => microblaze_0_M_AXI_DC1_BREADY,
      M_AXI_DC_BRESP(1 downto 0) => microblaze_0_M_AXI_DC1_BRESP(1 downto 0),
      M_AXI_DC_BVALID => microblaze_0_M_AXI_DC1_BVALID,
      M_AXI_DC_RDATA(31 downto 0) => microblaze_0_M_AXI_DC1_RDATA(31 downto 0),
      M_AXI_DC_RID(0) => GND_1,
      M_AXI_DC_RLAST => microblaze_0_M_AXI_DC1_RLAST,
      M_AXI_DC_RREADY => microblaze_0_M_AXI_DC1_RREADY,
      M_AXI_DC_RRESP(1 downto 0) => microblaze_0_M_AXI_DC1_RRESP(1 downto 0),
      M_AXI_DC_RVALID => microblaze_0_M_AXI_DC1_RVALID,
      M_AXI_DC_WDATA(31 downto 0) => microblaze_0_M_AXI_DC1_WDATA(31 downto 0),
      M_AXI_DC_WLAST => microblaze_0_M_AXI_DC1_WLAST,
      M_AXI_DC_WREADY => microblaze_0_M_AXI_DC1_WREADY,
      M_AXI_DC_WSTRB(3 downto 0) => microblaze_0_M_AXI_DC1_WSTRB(3 downto 0),
      M_AXI_DC_WVALID => microblaze_0_M_AXI_DC1_WVALID,
      M_AXI_DP_ARADDR(31 downto 0) => microblaze_0_axi_dp_2_ARADDR(31 downto 0),
      M_AXI_DP_ARPROT(2 downto 0) => microblaze_0_axi_dp_2_ARPROT(2 downto 0),
      M_AXI_DP_ARREADY => microblaze_0_axi_dp_2_ARREADY(0),
      M_AXI_DP_ARVALID => microblaze_0_axi_dp_2_ARVALID,
      M_AXI_DP_AWADDR(31 downto 0) => microblaze_0_axi_dp_2_AWADDR(31 downto 0),
      M_AXI_DP_AWPROT(2 downto 0) => microblaze_0_axi_dp_2_AWPROT(2 downto 0),
      M_AXI_DP_AWREADY => microblaze_0_axi_dp_2_AWREADY(0),
      M_AXI_DP_AWVALID => microblaze_0_axi_dp_2_AWVALID,
      M_AXI_DP_BREADY => microblaze_0_axi_dp_2_BREADY,
      M_AXI_DP_BRESP(1 downto 0) => microblaze_0_axi_dp_2_BRESP(1 downto 0),
      M_AXI_DP_BVALID => microblaze_0_axi_dp_2_BVALID(0),
      M_AXI_DP_RDATA(31 downto 0) => microblaze_0_axi_dp_2_RDATA(31 downto 0),
      M_AXI_DP_RREADY => microblaze_0_axi_dp_2_RREADY,
      M_AXI_DP_RRESP(1 downto 0) => microblaze_0_axi_dp_2_RRESP(1 downto 0),
      M_AXI_DP_RVALID => microblaze_0_axi_dp_2_RVALID(0),
      M_AXI_DP_WDATA(31 downto 0) => microblaze_0_axi_dp_2_WDATA(31 downto 0),
      M_AXI_DP_WREADY => microblaze_0_axi_dp_2_WREADY(0),
      M_AXI_DP_WSTRB(3 downto 0) => microblaze_0_axi_dp_2_WSTRB(3 downto 0),
      M_AXI_DP_WVALID => microblaze_0_axi_dp_2_WVALID,
      M_AXI_IC_ARADDR(31 downto 0) => microblaze_0_M_AXI_IC1_ARADDR(31 downto 0),
      M_AXI_IC_ARBURST(1 downto 0) => microblaze_0_M_AXI_IC1_ARBURST(1 downto 0),
      M_AXI_IC_ARCACHE(3 downto 0) => microblaze_0_M_AXI_IC1_ARCACHE(3 downto 0),
      M_AXI_IC_ARID(0) => NLW_microblaze_0_M_AXI_IC_ARID_UNCONNECTED(0),
      M_AXI_IC_ARLEN(7 downto 0) => microblaze_0_M_AXI_IC1_ARLEN(7 downto 0),
      M_AXI_IC_ARLOCK => microblaze_0_M_AXI_IC1_ARLOCK,
      M_AXI_IC_ARPROT(2 downto 0) => microblaze_0_M_AXI_IC1_ARPROT(2 downto 0),
      M_AXI_IC_ARQOS(3 downto 0) => microblaze_0_M_AXI_IC1_ARQOS(3 downto 0),
      M_AXI_IC_ARREADY => microblaze_0_M_AXI_IC1_ARREADY,
      M_AXI_IC_ARSIZE(2 downto 0) => microblaze_0_M_AXI_IC1_ARSIZE(2 downto 0),
      M_AXI_IC_ARVALID => microblaze_0_M_AXI_IC1_ARVALID,
      M_AXI_IC_AWADDR(31 downto 0) => NLW_microblaze_0_M_AXI_IC_AWADDR_UNCONNECTED(31 downto 0),
      M_AXI_IC_AWBURST(1 downto 0) => NLW_microblaze_0_M_AXI_IC_AWBURST_UNCONNECTED(1 downto 0),
      M_AXI_IC_AWCACHE(3 downto 0) => NLW_microblaze_0_M_AXI_IC_AWCACHE_UNCONNECTED(3 downto 0),
      M_AXI_IC_AWID(0) => NLW_microblaze_0_M_AXI_IC_AWID_UNCONNECTED(0),
      M_AXI_IC_AWLEN(7 downto 0) => NLW_microblaze_0_M_AXI_IC_AWLEN_UNCONNECTED(7 downto 0),
      M_AXI_IC_AWLOCK => NLW_microblaze_0_M_AXI_IC_AWLOCK_UNCONNECTED,
      M_AXI_IC_AWPROT(2 downto 0) => NLW_microblaze_0_M_AXI_IC_AWPROT_UNCONNECTED(2 downto 0),
      M_AXI_IC_AWQOS(3 downto 0) => NLW_microblaze_0_M_AXI_IC_AWQOS_UNCONNECTED(3 downto 0),
      M_AXI_IC_AWREADY => GND_1,
      M_AXI_IC_AWSIZE(2 downto 0) => NLW_microblaze_0_M_AXI_IC_AWSIZE_UNCONNECTED(2 downto 0),
      M_AXI_IC_AWVALID => NLW_microblaze_0_M_AXI_IC_AWVALID_UNCONNECTED,
      M_AXI_IC_BID(0) => GND_1,
      M_AXI_IC_BREADY => NLW_microblaze_0_M_AXI_IC_BREADY_UNCONNECTED,
      M_AXI_IC_BRESP(1) => GND_1,
      M_AXI_IC_BRESP(0) => GND_1,
      M_AXI_IC_BVALID => GND_1,
      M_AXI_IC_RDATA(31 downto 0) => microblaze_0_M_AXI_IC1_RDATA(31 downto 0),
      M_AXI_IC_RID(0) => GND_1,
      M_AXI_IC_RLAST => microblaze_0_M_AXI_IC1_RLAST,
      M_AXI_IC_RREADY => microblaze_0_M_AXI_IC1_RREADY,
      M_AXI_IC_RRESP(1 downto 0) => microblaze_0_M_AXI_IC1_RRESP(1 downto 0),
      M_AXI_IC_RVALID => microblaze_0_M_AXI_IC1_RVALID,
      M_AXI_IC_WDATA(31 downto 0) => NLW_microblaze_0_M_AXI_IC_WDATA_UNCONNECTED(31 downto 0),
      M_AXI_IC_WLAST => NLW_microblaze_0_M_AXI_IC_WLAST_UNCONNECTED,
      M_AXI_IC_WREADY => GND_1,
      M_AXI_IC_WSTRB(3 downto 0) => NLW_microblaze_0_M_AXI_IC_WSTRB_UNCONNECTED(3 downto 0),
      M_AXI_IC_WVALID => NLW_microblaze_0_M_AXI_IC_WVALID_UNCONNECTED,
      Read_Strobe => microblaze_0_dlmb_2_READSTROBE,
      Reset => rst_mig_7series_0_100M_mb_reset1,
      Write_Strobe => microblaze_0_dlmb_2_WRITESTROBE
    );
microblaze_0_axi_intc: component mysystem2_microblaze_0_axi_intc_0
    port map (
      interrupt_address(31 downto 0) => microblaze_0_interrupt_2_ADDRESS(31 downto 0),
      intr(1 downto 0) => microblaze_0_intr_2(1 downto 0),
      irq => microblaze_0_interrupt_2_INTERRUPT,
      processor_ack(1) => microblaze_0_interrupt_2_ACK(0),
      processor_ack(0) => microblaze_0_interrupt_2_ACK(1),
      processor_clk => microblaze_0_Clk_1,
      processor_rst => rst_mig_7series_0_100M_mb_reset1,
      s_axi_aclk => microblaze_0_Clk_1,
      s_axi_araddr(8 downto 0) => microblaze_0_intc_axi_2_ARADDR(8 downto 0),
      s_axi_aresetn => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      s_axi_arready => microblaze_0_intc_axi_2_ARREADY,
      s_axi_arvalid => microblaze_0_intc_axi_2_ARVALID,
      s_axi_awaddr(8 downto 0) => microblaze_0_intc_axi_2_AWADDR(8 downto 0),
      s_axi_awready => microblaze_0_intc_axi_2_AWREADY,
      s_axi_awvalid => microblaze_0_intc_axi_2_AWVALID,
      s_axi_bready => microblaze_0_intc_axi_2_BREADY,
      s_axi_bresp(1 downto 0) => microblaze_0_intc_axi_2_BRESP(1 downto 0),
      s_axi_bvalid => microblaze_0_intc_axi_2_BVALID,
      s_axi_rdata(31 downto 0) => microblaze_0_intc_axi_2_RDATA(31 downto 0),
      s_axi_rready => microblaze_0_intc_axi_2_RREADY,
      s_axi_rresp(1 downto 0) => microblaze_0_intc_axi_2_RRESP(1 downto 0),
      s_axi_rvalid => microblaze_0_intc_axi_2_RVALID,
      s_axi_wdata(31 downto 0) => microblaze_0_intc_axi_2_WDATA(31 downto 0),
      s_axi_wready => microblaze_0_intc_axi_2_WREADY,
      s_axi_wstrb(3 downto 0) => microblaze_0_intc_axi_2_WSTRB(3 downto 0),
      s_axi_wvalid => microblaze_0_intc_axi_2_WVALID
    );
microblaze_0_axi_periph: entity work.mysystem2_microblaze_0_axi_periph_0
    port map (
      ACLK => microblaze_0_Clk_1,
      ARESETN(0) => rst_mig_7series_0_100M_interconnect_aresetn1(0),
      M00_ACLK => microblaze_0_Clk_1,
      M00_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M00_AXI_araddr(8 downto 0) => microblaze_0_intc_axi_2_ARADDR(8 downto 0),
      M00_AXI_arready => microblaze_0_intc_axi_2_ARREADY,
      M00_AXI_arvalid => microblaze_0_intc_axi_2_ARVALID,
      M00_AXI_awaddr(8 downto 0) => microblaze_0_intc_axi_2_AWADDR(8 downto 0),
      M00_AXI_awready => microblaze_0_intc_axi_2_AWREADY,
      M00_AXI_awvalid => microblaze_0_intc_axi_2_AWVALID,
      M00_AXI_bready => microblaze_0_intc_axi_2_BREADY,
      M00_AXI_bresp(1 downto 0) => microblaze_0_intc_axi_2_BRESP(1 downto 0),
      M00_AXI_bvalid => microblaze_0_intc_axi_2_BVALID,
      M00_AXI_rdata(31 downto 0) => microblaze_0_intc_axi_2_RDATA(31 downto 0),
      M00_AXI_rready => microblaze_0_intc_axi_2_RREADY,
      M00_AXI_rresp(1 downto 0) => microblaze_0_intc_axi_2_RRESP(1 downto 0),
      M00_AXI_rvalid => microblaze_0_intc_axi_2_RVALID,
      M00_AXI_wdata(31 downto 0) => microblaze_0_intc_axi_2_WDATA(31 downto 0),
      M00_AXI_wready => microblaze_0_intc_axi_2_WREADY,
      M00_AXI_wstrb(3 downto 0) => microblaze_0_intc_axi_2_WSTRB(3 downto 0),
      M00_AXI_wvalid => microblaze_0_intc_axi_2_WVALID,
      M01_ACLK => microblaze_0_Clk_1,
      M01_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M01_AXI_araddr(3 downto 0) => microblaze_0_axi_periph_M01_AXI1_ARADDR(3 downto 0),
      M01_AXI_arprot(2 downto 0) => microblaze_0_axi_periph_M01_AXI1_ARPROT(2 downto 0),
      M01_AXI_arready(0) => microblaze_0_axi_periph_M01_AXI1_ARREADY(0),
      M01_AXI_arvalid(0) => microblaze_0_axi_periph_M01_AXI1_ARVALID(0),
      M01_AXI_awaddr(3 downto 0) => microblaze_0_axi_periph_M01_AXI1_AWADDR(3 downto 0),
      M01_AXI_awprot(2 downto 0) => microblaze_0_axi_periph_M01_AXI1_AWPROT(2 downto 0),
      M01_AXI_awready(0) => microblaze_0_axi_periph_M01_AXI1_AWREADY(0),
      M01_AXI_awvalid(0) => microblaze_0_axi_periph_M01_AXI1_AWVALID(0),
      M01_AXI_bready(0) => microblaze_0_axi_periph_M01_AXI1_BREADY(0),
      M01_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_M01_AXI1_BRESP(1 downto 0),
      M01_AXI_bvalid(0) => microblaze_0_axi_periph_M01_AXI1_BVALID(0),
      M01_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_M01_AXI1_RDATA(31 downto 0),
      M01_AXI_rready(0) => microblaze_0_axi_periph_M01_AXI1_RREADY(0),
      M01_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_M01_AXI1_RRESP(1 downto 0),
      M01_AXI_rvalid(0) => microblaze_0_axi_periph_M01_AXI1_RVALID(0),
      M01_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_M01_AXI1_WDATA(31 downto 0),
      M01_AXI_wready(0) => microblaze_0_axi_periph_M01_AXI1_WREADY(0),
      M01_AXI_wstrb(3 downto 0) => microblaze_0_axi_periph_M01_AXI1_WSTRB(3 downto 0),
      M01_AXI_wvalid(0) => microblaze_0_axi_periph_M01_AXI1_WVALID(0),
      M02_ACLK => microblaze_0_Clk_1,
      M02_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M02_AXI_araddr(3 downto 0) => microblaze_0_axi_periph_M02_AXI_ARADDR(3 downto 0),
      M02_AXI_arprot(2 downto 0) => microblaze_0_axi_periph_M02_AXI_ARPROT(2 downto 0),
      M02_AXI_arready(0) => microblaze_0_axi_periph_M02_AXI_ARREADY(0),
      M02_AXI_arvalid(0) => microblaze_0_axi_periph_M02_AXI_ARVALID(0),
      M02_AXI_awaddr(3 downto 0) => microblaze_0_axi_periph_M02_AXI_AWADDR(3 downto 0),
      M02_AXI_awprot(2 downto 0) => microblaze_0_axi_periph_M02_AXI_AWPROT(2 downto 0),
      M02_AXI_awready(0) => microblaze_0_axi_periph_M02_AXI_AWREADY(0),
      M02_AXI_awvalid(0) => microblaze_0_axi_periph_M02_AXI_AWVALID(0),
      M02_AXI_bready(0) => microblaze_0_axi_periph_M02_AXI_BREADY(0),
      M02_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid(0) => microblaze_0_axi_periph_M02_AXI_BVALID(0),
      M02_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready(0) => microblaze_0_axi_periph_M02_AXI_RREADY(0),
      M02_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid(0) => microblaze_0_axi_periph_M02_AXI_RVALID(0),
      M02_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready(0) => microblaze_0_axi_periph_M02_AXI_WREADY(0),
      M02_AXI_wstrb(3 downto 0) => microblaze_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid(0) => microblaze_0_axi_periph_M02_AXI_WVALID(0),
      M03_ACLK => microblaze_0_Clk_1,
      M03_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M03_AXI_araddr(9 downto 0) => microblaze_0_axi_periph_M03_AXI_ARADDR(9 downto 0),
      M03_AXI_arready(0) => microblaze_0_axi_periph_M03_AXI_ARREADY,
      M03_AXI_arvalid(0) => microblaze_0_axi_periph_M03_AXI_ARVALID(0),
      M03_AXI_awaddr(9 downto 0) => microblaze_0_axi_periph_M03_AXI_AWADDR(9 downto 0),
      M03_AXI_awready(0) => microblaze_0_axi_periph_M03_AXI_AWREADY,
      M03_AXI_awvalid(0) => microblaze_0_axi_periph_M03_AXI_AWVALID(0),
      M03_AXI_bready(0) => microblaze_0_axi_periph_M03_AXI_BREADY(0),
      M03_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid(0) => microblaze_0_axi_periph_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready(0) => microblaze_0_axi_periph_M03_AXI_RREADY(0),
      M03_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid(0) => microblaze_0_axi_periph_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready(0) => microblaze_0_axi_periph_M03_AXI_WREADY,
      M03_AXI_wvalid(0) => microblaze_0_axi_periph_M03_AXI_WVALID(0),
      M04_ACLK => microblaze_0_Clk_1,
      M04_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M04_AXI_araddr(9 downto 0) => microblaze_0_axi_periph_M04_AXI_ARADDR(9 downto 0),
      M04_AXI_arready(0) => microblaze_0_axi_periph_M04_AXI_ARREADY,
      M04_AXI_arvalid(0) => microblaze_0_axi_periph_M04_AXI_ARVALID(0),
      M04_AXI_awaddr(9 downto 0) => microblaze_0_axi_periph_M04_AXI_AWADDR(9 downto 0),
      M04_AXI_awready(0) => microblaze_0_axi_periph_M04_AXI_AWREADY,
      M04_AXI_awvalid(0) => microblaze_0_axi_periph_M04_AXI_AWVALID(0),
      M04_AXI_bready(0) => microblaze_0_axi_periph_M04_AXI_BREADY(0),
      M04_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid(0) => microblaze_0_axi_periph_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready(0) => microblaze_0_axi_periph_M04_AXI_RREADY(0),
      M04_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid(0) => microblaze_0_axi_periph_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready(0) => microblaze_0_axi_periph_M04_AXI_WREADY,
      M04_AXI_wvalid(0) => microblaze_0_axi_periph_M04_AXI_WVALID(0),
      M05_ACLK => microblaze_0_Clk_1,
      M05_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M05_AXI_araddr(9 downto 0) => microblaze_0_axi_periph_M05_AXI_ARADDR(9 downto 0),
      M05_AXI_arready(0) => microblaze_0_axi_periph_M05_AXI_ARREADY,
      M05_AXI_arvalid(0) => microblaze_0_axi_periph_M05_AXI_ARVALID(0),
      M05_AXI_awaddr(9 downto 0) => microblaze_0_axi_periph_M05_AXI_AWADDR(9 downto 0),
      M05_AXI_awready(0) => microblaze_0_axi_periph_M05_AXI_AWREADY,
      M05_AXI_awvalid(0) => microblaze_0_axi_periph_M05_AXI_AWVALID(0),
      M05_AXI_bready(0) => microblaze_0_axi_periph_M05_AXI_BREADY(0),
      M05_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid(0) => microblaze_0_axi_periph_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready(0) => microblaze_0_axi_periph_M05_AXI_RREADY(0),
      M05_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid(0) => microblaze_0_axi_periph_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready(0) => microblaze_0_axi_periph_M05_AXI_WREADY,
      M05_AXI_wvalid(0) => microblaze_0_axi_periph_M05_AXI_WVALID(0),
      M06_ACLK => microblaze_0_Clk_1,
      M06_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M06_AXI_araddr(9 downto 0) => microblaze_0_axi_periph_M06_AXI_ARADDR(9 downto 0),
      M06_AXI_arready(0) => microblaze_0_axi_periph_M06_AXI_ARREADY,
      M06_AXI_arvalid(0) => microblaze_0_axi_periph_M06_AXI_ARVALID(0),
      M06_AXI_awaddr(9 downto 0) => microblaze_0_axi_periph_M06_AXI_AWADDR(9 downto 0),
      M06_AXI_awready(0) => microblaze_0_axi_periph_M06_AXI_AWREADY,
      M06_AXI_awvalid(0) => microblaze_0_axi_periph_M06_AXI_AWVALID(0),
      M06_AXI_bready(0) => microblaze_0_axi_periph_M06_AXI_BREADY(0),
      M06_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid(0) => microblaze_0_axi_periph_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready(0) => microblaze_0_axi_periph_M06_AXI_RREADY(0),
      M06_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid(0) => microblaze_0_axi_periph_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready(0) => microblaze_0_axi_periph_M06_AXI_WREADY,
      M06_AXI_wvalid(0) => microblaze_0_axi_periph_M06_AXI_WVALID(0),
      M07_ACLK => microblaze_0_Clk_1,
      M07_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      M07_AXI_araddr(3 downto 0) => microblaze_0_axi_periph_M07_AXI_ARADDR(3 downto 0),
      M07_AXI_arready(0) => microblaze_0_axi_periph_M07_AXI_ARREADY,
      M07_AXI_arvalid(0) => microblaze_0_axi_periph_M07_AXI_ARVALID(0),
      M07_AXI_awaddr(3 downto 0) => microblaze_0_axi_periph_M07_AXI_AWADDR(3 downto 0),
      M07_AXI_awready(0) => microblaze_0_axi_periph_M07_AXI_AWREADY,
      M07_AXI_awvalid(0) => microblaze_0_axi_periph_M07_AXI_AWVALID(0),
      M07_AXI_bready(0) => microblaze_0_axi_periph_M07_AXI_BREADY(0),
      M07_AXI_bresp(1 downto 0) => microblaze_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid(0) => microblaze_0_axi_periph_M07_AXI_BVALID,
      M07_AXI_rdata(31 downto 0) => microblaze_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready(0) => microblaze_0_axi_periph_M07_AXI_RREADY(0),
      M07_AXI_rresp(1 downto 0) => microblaze_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid(0) => microblaze_0_axi_periph_M07_AXI_RVALID,
      M07_AXI_wdata(31 downto 0) => microblaze_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready(0) => microblaze_0_axi_periph_M07_AXI_WREADY,
      M07_AXI_wstrb(3 downto 0) => microblaze_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid(0) => microblaze_0_axi_periph_M07_AXI_WVALID(0),
      S00_ACLK => microblaze_0_Clk_1,
      S00_ARESETN(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      S00_AXI_araddr(31 downto 0) => microblaze_0_axi_dp_2_ARADDR(31 downto 0),
      S00_AXI_arprot(2 downto 0) => microblaze_0_axi_dp_2_ARPROT(2 downto 0),
      S00_AXI_arready(0) => microblaze_0_axi_dp_2_ARREADY(0),
      S00_AXI_arvalid(0) => microblaze_0_axi_dp_2_ARVALID,
      S00_AXI_awaddr(31 downto 0) => microblaze_0_axi_dp_2_AWADDR(31 downto 0),
      S00_AXI_awprot(2 downto 0) => microblaze_0_axi_dp_2_AWPROT(2 downto 0),
      S00_AXI_awready(0) => microblaze_0_axi_dp_2_AWREADY(0),
      S00_AXI_awvalid(0) => microblaze_0_axi_dp_2_AWVALID,
      S00_AXI_bready(0) => microblaze_0_axi_dp_2_BREADY,
      S00_AXI_bresp(1 downto 0) => microblaze_0_axi_dp_2_BRESP(1 downto 0),
      S00_AXI_bvalid(0) => microblaze_0_axi_dp_2_BVALID(0),
      S00_AXI_rdata(31 downto 0) => microblaze_0_axi_dp_2_RDATA(31 downto 0),
      S00_AXI_rready(0) => microblaze_0_axi_dp_2_RREADY,
      S00_AXI_rresp(1 downto 0) => microblaze_0_axi_dp_2_RRESP(1 downto 0),
      S00_AXI_rvalid(0) => microblaze_0_axi_dp_2_RVALID(0),
      S00_AXI_wdata(31 downto 0) => microblaze_0_axi_dp_2_WDATA(31 downto 0),
      S00_AXI_wready(0) => microblaze_0_axi_dp_2_WREADY(0),
      S00_AXI_wstrb(3 downto 0) => microblaze_0_axi_dp_2_WSTRB(3 downto 0),
      S00_AXI_wvalid(0) => microblaze_0_axi_dp_2_WVALID
    );
microblaze_0_local_memory: entity work.microblaze_0_local_memory_imp_6P9YJM
    port map (
      DLMB_abus(0 to 31) => microblaze_0_dlmb_2_ABUS(0 to 31),
      DLMB_addrstrobe => microblaze_0_dlmb_2_ADDRSTROBE,
      DLMB_be(0 to 3) => microblaze_0_dlmb_2_BE(0 to 3),
      DLMB_ce => microblaze_0_dlmb_2_CE,
      DLMB_readdbus(0 to 31) => microblaze_0_dlmb_2_READDBUS(0 to 31),
      DLMB_readstrobe => microblaze_0_dlmb_2_READSTROBE,
      DLMB_ready => microblaze_0_dlmb_2_READY,
      DLMB_ue => microblaze_0_dlmb_2_UE,
      DLMB_wait => microblaze_0_dlmb_2_WAIT,
      DLMB_writedbus(0 to 31) => microblaze_0_dlmb_2_WRITEDBUS(0 to 31),
      DLMB_writestrobe => microblaze_0_dlmb_2_WRITESTROBE,
      ILMB_abus(0 to 31) => microblaze_0_ilmb_2_ABUS(0 to 31),
      ILMB_addrstrobe => microblaze_0_ilmb_2_ADDRSTROBE,
      ILMB_ce => microblaze_0_ilmb_2_CE,
      ILMB_readdbus(0 to 31) => microblaze_0_ilmb_2_READDBUS(0 to 31),
      ILMB_readstrobe => microblaze_0_ilmb_2_READSTROBE,
      ILMB_ready => microblaze_0_ilmb_2_READY,
      ILMB_ue => microblaze_0_ilmb_2_UE,
      ILMB_wait => microblaze_0_ilmb_2_WAIT,
      LMB_Clk => microblaze_0_Clk_1,
      LMB_Rst(0) => rst_mig_7series_0_100M_bus_struct_reset1(0)
    );
microblaze_0_xlconcat: component mysystem2_microblaze_0_xlconcat_0
    port map (
      In0(0) => axi_uartlite_0_interrupt1,
      In1(0) => axi_uartlite_0_interrupt1,
      dout(1 downto 0) => microblaze_0_intr_2(1 downto 0)
    );
mig_7series_0: component mysystem2_mig_7series_0_0
    port map (
      aresetn => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      ddr3_addr(13 downto 0) => mig_7series_0_DDR4_ADDR(13 downto 0),
      ddr3_ba(2 downto 0) => mig_7series_0_DDR4_BA(2 downto 0),
      ddr3_cas_n => mig_7series_0_DDR4_CAS_N,
      ddr3_ck_n(0) => mig_7series_0_DDR4_CK_N(0),
      ddr3_ck_p(0) => mig_7series_0_DDR4_CK_P(0),
      ddr3_cke(0) => mig_7series_0_DDR4_CKE(0),
      ddr3_cs_n(0) => mig_7series_0_DDR4_CS_N(0),
      ddr3_dm(7 downto 0) => mig_7series_0_DDR4_DM(7 downto 0),
      ddr3_dq(63 downto 0) => ddr3_sdram_dq(63 downto 0),
      ddr3_dqs_n(7 downto 0) => ddr3_sdram_dqs_n(7 downto 0),
      ddr3_dqs_p(7 downto 0) => ddr3_sdram_dqs_p(7 downto 0),
      ddr3_odt(0) => mig_7series_0_DDR4_ODT(0),
      ddr3_ras_n => mig_7series_0_DDR4_RAS_N,
      ddr3_reset_n => mig_7series_0_DDR4_RESET_N,
      ddr3_we_n => mig_7series_0_DDR4_WE_N,
      init_calib_complete => NLW_mig_7series_0_init_calib_complete_UNCONNECTED,
      mmcm_locked => mig_7series_0_mmcm_locked1,
      s_axi_araddr(31 downto 0) => axi_mem_intercon_M00_AXI1_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => axi_mem_intercon_M00_AXI1_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => axi_mem_intercon_M00_AXI1_ARCACHE(3 downto 0),
      s_axi_arid(2 downto 0) => axi_mem_intercon_M00_AXI1_ARID(2 downto 0),
      s_axi_arlen(7 downto 0) => axi_mem_intercon_M00_AXI1_ARLEN(7 downto 0),
      s_axi_arlock => axi_mem_intercon_M00_AXI1_ARLOCK(0),
      s_axi_arprot(2 downto 0) => axi_mem_intercon_M00_AXI1_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => axi_mem_intercon_M00_AXI1_ARQOS(3 downto 0),
      s_axi_arready => axi_mem_intercon_M00_AXI1_ARREADY,
      s_axi_arsize(2 downto 0) => axi_mem_intercon_M00_AXI1_ARSIZE(2 downto 0),
      s_axi_arvalid => axi_mem_intercon_M00_AXI1_ARVALID(0),
      s_axi_awaddr(31 downto 0) => axi_mem_intercon_M00_AXI1_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => axi_mem_intercon_M00_AXI1_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => axi_mem_intercon_M00_AXI1_AWCACHE(3 downto 0),
      s_axi_awid(2 downto 0) => axi_mem_intercon_M00_AXI1_AWID(2 downto 0),
      s_axi_awlen(7 downto 0) => axi_mem_intercon_M00_AXI1_AWLEN(7 downto 0),
      s_axi_awlock => axi_mem_intercon_M00_AXI1_AWLOCK(0),
      s_axi_awprot(2 downto 0) => axi_mem_intercon_M00_AXI1_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => axi_mem_intercon_M00_AXI1_AWQOS(3 downto 0),
      s_axi_awready => axi_mem_intercon_M00_AXI1_AWREADY,
      s_axi_awsize(2 downto 0) => axi_mem_intercon_M00_AXI1_AWSIZE(2 downto 0),
      s_axi_awvalid => axi_mem_intercon_M00_AXI1_AWVALID(0),
      s_axi_bid(2 downto 0) => axi_mem_intercon_M00_AXI1_BID(2 downto 0),
      s_axi_bready => axi_mem_intercon_M00_AXI1_BREADY(0),
      s_axi_bresp(1 downto 0) => axi_mem_intercon_M00_AXI1_BRESP(1 downto 0),
      s_axi_bvalid => axi_mem_intercon_M00_AXI1_BVALID,
      s_axi_rdata(511 downto 0) => axi_mem_intercon_M00_AXI1_RDATA(511 downto 0),
      s_axi_rid(2 downto 0) => axi_mem_intercon_M00_AXI1_RID(2 downto 0),
      s_axi_rlast => axi_mem_intercon_M00_AXI1_RLAST,
      s_axi_rready => axi_mem_intercon_M00_AXI1_RREADY(0),
      s_axi_rresp(1 downto 0) => axi_mem_intercon_M00_AXI1_RRESP(1 downto 0),
      s_axi_rvalid => axi_mem_intercon_M00_AXI1_RVALID,
      s_axi_wdata(511 downto 0) => axi_mem_intercon_M00_AXI1_WDATA(511 downto 0),
      s_axi_wlast => axi_mem_intercon_M00_AXI1_WLAST(0),
      s_axi_wready => axi_mem_intercon_M00_AXI1_WREADY,
      s_axi_wstrb(63 downto 0) => axi_mem_intercon_M00_AXI1_WSTRB(63 downto 0),
      s_axi_wvalid => axi_mem_intercon_M00_AXI1_WVALID(0),
      sys_clk_n => sys_diff_clock_1_CLK_N,
      sys_clk_p => sys_diff_clock_1_CLK_P,
      sys_rst => reset_1,
      ui_clk => microblaze_0_Clk_1,
      ui_clk_sync_rst => mig_7series_0_ui_clk_sync_rst1
    );
rst_mig_7series_0_100M: component mysystem2_rst_mig_7series_0_100M_0
    port map (
      aux_reset_in => VCC_1,
      bus_struct_reset(0) => rst_mig_7series_0_100M_bus_struct_reset1(0),
      dcm_locked => mig_7series_0_mmcm_locked1,
      ext_reset_in => mig_7series_0_ui_clk_sync_rst1,
      interconnect_aresetn(0) => rst_mig_7series_0_100M_interconnect_aresetn1(0),
      mb_debug_sys_rst => mdm_1_debug_sys_rst_2,
      mb_reset => rst_mig_7series_0_100M_mb_reset1,
      peripheral_aresetn(0) => rst_mig_7series_0_100M_peripheral_aresetn1(0),
      peripheral_reset(0) => NLW_rst_mig_7series_0_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => microblaze_0_Clk_1
    );
end STRUCTURE;
