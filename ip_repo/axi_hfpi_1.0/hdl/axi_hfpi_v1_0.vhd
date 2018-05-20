--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.

--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--Lesser General Public License for more details.

--You should have received a copy of the GNU Lesser General Public
--License along with this library; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

-- e_mail : mohd.a.zainol@gmail.com

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
--  ENTITY          : axi_hfpi_v1_0 
--      version     : 1.0            
--      last update : 26/10/2017     
--      author      : Mohd A. Zainol
-- 
--  FUNCTION        Hostpc-FPGA via PCIe Interface               
--                 (H)    (F)      (P)  (I)
-- 
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--Memory Map for hostpc_mem_addr

--Address     Addr (binary)       Description
--0           00000               Filesize of FIFO 0
--1           00001               Filesize of FIFO 1
--2           00010               
--31          11111               Filesize of SDRAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity axi_hfpi_v1_0 is
	generic(
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Parameters of Axi Slave Bus Interface S_0_AXI_LITE
		C_S_0_AXI_LITE_DATA_WIDTH   : integer := 32;
		C_S_0_AXI_LITE_ADDR_WIDTH   : integer := 7;
		-- Parameters of Axi Slave Bus Interface S_1_AXI_LITE
		C_S_1_AXI_LITE_DATA_WIDTH   : integer := 32;
		C_S_1_AXI_LITE_ADDR_WIDTH   : integer := 7;
		-- Parameters of Axi Slave Bus Interface S_SDRAM_AXIS
		C_S_SDRAM_AXIS_TDATA_WIDTH  : integer := 32;
		-- Parameters of Axi Master Bus Interface M_SDRAM_AXIS
		C_M_SDRAM_AXIS_TDATA_WIDTH  : integer := 32;
		C_M_SDRAM_AXIS_START_COUNT  : integer := 32;
		-- Parameters of Axi Slave Bus Interface S_FIFO_0_AXIS
		C_S_FIFO_0_AXIS_TDATA_WIDTH : integer := 32;
		-- Parameters of Axi Master Bus Interface M_FIFO_0_AXIS
		C_M_FIFO_0_AXIS_TDATA_WIDTH : integer := 32;
		C_M_FIFO_0_AXIS_START_COUNT : integer := 32;
		-- Parameters of Axi Slave Bus Interface S_FIFO_1_AXIS
		C_S_FIFO_1_AXIS_TDATA_WIDTH : integer := 32;
		-- Parameters of Axi Master Bus Interface M_FIFO_1_AXIS
		C_M_FIFO_1_AXIS_TDATA_WIDTH : integer := 32;
		C_M_FIFO_1_AXIS_START_COUNT : integer := 32
	);
	port(
		hostpc_clk             : in  std_logic;
		hostpc_rstn_sdram      : in  std_logic;
		hostpc_rstn_fifo_0     : in  std_logic;
		hostpc_rstn_fifo_1     : in  std_logic;
		hostpc_mem_en          : in  std_logic;
		hostpc_mem_we          : in  std_logic;
		hostpc_mem_din         : in  std_logic_vector(31 downto 0);
		hostpc_mem_dout        : out std_logic_vector(31 downto 0);
		hostpc_mem_addr        : in  std_logic_vector(4 downto 0);
		hostpc_sdram_rd_en     : in  std_logic;
		hostpc_sdram_rd_empty  : out std_logic;
		hostpc_sdram_rd_data   : out std_logic_vector(31 downto 0);
		hostpc_sdram_wr_en     : in  std_logic;
		hostpc_sdram_wr_full   : out std_logic;
		hostpc_sdram_wr_data   : in  std_logic_vector(31 downto 0);
		hostpc_fifo_rd_0_en    : in  std_logic;
		hostpc_fifo_rd_0_empty : out std_logic;
		hostpc_fifo_rd_0_data  : out std_logic_vector(31 downto 0);
		hostpc_fifo_wr_0_en    : in  std_logic;
		hostpc_fifo_wr_0_full  : out std_logic;
		hostpc_fifo_wr_0_data  : in  std_logic_vector(31 downto 0);
		hostpc_fifo_rd_1_en    : in  std_logic;
		hostpc_fifo_rd_1_empty : out std_logic;
		hostpc_fifo_rd_1_data  : out std_logic_vector(31 downto 0);
		hostpc_fifo_wr_1_en    : in  std_logic;
		hostpc_fifo_wr_1_full  : out std_logic;
		hostpc_fifo_wr_1_data  : in  std_logic_vector(31 downto 0);
		-- Ports of Axi Slave Bus Interface S_0_AXI_LITE
		s_0_axi_lite_aclk      : in  std_logic;
		s_0_axi_lite_aresetn   : in  std_logic;
		s_0_axi_lite_awaddr    : in  std_logic_vector(C_S_0_AXI_LITE_ADDR_WIDTH - 1 downto 0);
		s_0_axi_lite_awprot    : in  std_logic_vector(2 downto 0);
		s_0_axi_lite_awvalid   : in  std_logic;
		s_0_axi_lite_awready   : out std_logic;
		s_0_axi_lite_wdata     : in  std_logic_vector(C_S_0_AXI_LITE_DATA_WIDTH - 1 downto 0);
		s_0_axi_lite_wstrb     : in  std_logic_vector((C_S_0_AXI_LITE_DATA_WIDTH/8) - 1 downto 0);
		s_0_axi_lite_wvalid    : in  std_logic;
		s_0_axi_lite_wready    : out std_logic;
		s_0_axi_lite_bresp     : out std_logic_vector(1 downto 0);
		s_0_axi_lite_bvalid    : out std_logic;
		s_0_axi_lite_bready    : in  std_logic;
		s_0_axi_lite_araddr    : in  std_logic_vector(C_S_0_AXI_LITE_ADDR_WIDTH - 1 downto 0);
		s_0_axi_lite_arprot    : in  std_logic_vector(2 downto 0);
		s_0_axi_lite_arvalid   : in  std_logic;
		s_0_axi_lite_arready   : out std_logic;
		s_0_axi_lite_rdata     : out std_logic_vector(C_S_0_AXI_LITE_DATA_WIDTH - 1 downto 0);
		s_0_axi_lite_rresp     : out std_logic_vector(1 downto 0);
		s_0_axi_lite_rvalid    : out std_logic;
		s_0_axi_lite_rready    : in  std_logic;
		-- Ports of Axi Slave Bus Interface S_1_AXI_LITE
		s_1_axi_lite_aclk      : in  std_logic;
		s_1_axi_lite_aresetn   : in  std_logic;
		s_1_axi_lite_awaddr    : in  std_logic_vector(C_S_1_AXI_LITE_ADDR_WIDTH - 1 downto 0);
		s_1_axi_lite_awprot    : in  std_logic_vector(2 downto 0);
		s_1_axi_lite_awvalid   : in  std_logic;
		s_1_axi_lite_awready   : out std_logic;
		s_1_axi_lite_wdata     : in  std_logic_vector(C_S_1_AXI_LITE_DATA_WIDTH - 1 downto 0);
		s_1_axi_lite_wstrb     : in  std_logic_vector((C_S_1_AXI_LITE_DATA_WIDTH/8) - 1 downto 0);
		s_1_axi_lite_wvalid    : in  std_logic;
		s_1_axi_lite_wready    : out std_logic;
		s_1_axi_lite_bresp     : out std_logic_vector(1 downto 0);
		s_1_axi_lite_bvalid    : out std_logic;
		s_1_axi_lite_bready    : in  std_logic;
		s_1_axi_lite_araddr    : in  std_logic_vector(C_S_1_AXI_LITE_ADDR_WIDTH - 1 downto 0);
		s_1_axi_lite_arprot    : in  std_logic_vector(2 downto 0);
		s_1_axi_lite_arvalid   : in  std_logic;
		s_1_axi_lite_arready   : out std_logic;
		s_1_axi_lite_rdata     : out std_logic_vector(C_S_1_AXI_LITE_DATA_WIDTH - 1 downto 0);
		s_1_axi_lite_rresp     : out std_logic_vector(1 downto 0);
		s_1_axi_lite_rvalid    : out std_logic;
		s_1_axi_lite_rready    : in  std_logic;
		-- Ports of Axi Slave Bus Interface S_SDRAM_AXIS
		s_sdram_axis_aclk      : in  std_logic;
		s_sdram_axis_aresetn   : in  std_logic;
		s_sdram_axis_tready    : out std_logic;
		s_sdram_axis_tdata     : in  std_logic_vector(C_S_SDRAM_AXIS_TDATA_WIDTH - 1 downto 0);
		s_sdram_axis_tlast     : in  std_logic;
		s_sdram_axis_tvalid    : in  std_logic;
		-- Ports of Axi Master Bus Interface M_SDRAM_AXIS
		m_sdram_axis_aclk      : in  std_logic;
		m_sdram_axis_aresetn   : in  std_logic;
		m_sdram_axis_tvalid    : out std_logic;
		m_sdram_axis_tdata     : out std_logic_vector(C_M_SDRAM_AXIS_TDATA_WIDTH - 1 downto 0);
		m_sdram_axis_tlast     : out std_logic;
		m_sdram_axis_tready    : in  std_logic;
		-- Ports of Axi Slave Bus Interface S_FIFO_0_AXIS
		s_fifo_0_axis_aclk     : in  std_logic;
		s_fifo_0_axis_aresetn  : in  std_logic;
		s_fifo_0_axis_tready   : out std_logic;
		s_fifo_0_axis_tdata    : in  std_logic_vector(C_S_FIFO_0_AXIS_TDATA_WIDTH - 1 downto 0);
		s_fifo_0_axis_tlast    : in  std_logic;
		s_fifo_0_axis_tvalid   : in  std_logic;
		-- Ports of Axi Master Bus Interface M_FIFO_0_AXIS
		m_fifo_0_axis_aclk     : in  std_logic;
		m_fifo_0_axis_aresetn  : in  std_logic;
		m_fifo_0_axis_tvalid   : out std_logic;
		m_fifo_0_axis_tdata    : out std_logic_vector(C_M_FIFO_0_AXIS_TDATA_WIDTH - 1 downto 0);
		m_fifo_0_axis_tlast    : out std_logic;
		m_fifo_0_axis_tready   : in  std_logic;
		-- Ports of Axi Slave Bus Interface S_FIFO_1_AXIS
		s_fifo_1_axis_aclk     : in  std_logic;
		s_fifo_1_axis_aresetn  : in  std_logic;
		s_fifo_1_axis_tready   : out std_logic;
		s_fifo_1_axis_tdata    : in  std_logic_vector(C_S_FIFO_1_AXIS_TDATA_WIDTH - 1 downto 0);
		s_fifo_1_axis_tlast    : in  std_logic;
		s_fifo_1_axis_tvalid   : in  std_logic;
		-- Ports of Axi Master Bus Interface M_FIFO_1_AXIS
		m_fifo_1_axis_aclk     : in  std_logic;
		m_fifo_1_axis_aresetn  : in  std_logic;
		m_fifo_1_axis_tvalid   : out std_logic;
		m_fifo_1_axis_tdata    : out std_logic_vector(C_M_FIFO_1_AXIS_TDATA_WIDTH - 1 downto 0);
		m_fifo_1_axis_tlast    : out std_logic;
		m_fifo_1_axis_tready   : in  std_logic
	);
end axi_hfpi_v1_0;

architecture arch_imp of axi_hfpi_v1_0 is

	-- component declaration
	component axi_hfpi_v1_0_S_0_AXI_LITE is
		generic(
			C_S_AXI_DATA_WIDTH : integer := 32;
			C_S_AXI_ADDR_WIDTH : integer := 7
		);
		port(
			hostpc_clk      : in  std_logic;
			hostpc_mem_en   : in  std_logic;
			hostpc_mem_we   : in  std_logic;
			hostpc_mem_din  : in  std_logic_vector(31 downto 0);
			hostpc_mem_dout : out std_logic_vector(31 downto 0);
			hostpc_mem_addr : in  std_logic_vector(4 downto 0);
			S_AXI_ACLK      : in  std_logic;
			S_AXI_ARESETN   : in  std_logic;
			S_AXI_AWADDR    : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_AWPROT    : in  std_logic_vector(2 downto 0);
			S_AXI_AWVALID   : in  std_logic;
			S_AXI_AWREADY   : out std_logic;
			S_AXI_WDATA     : in  std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_WSTRB     : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8) - 1 downto 0);
			S_AXI_WVALID    : in  std_logic;
			S_AXI_WREADY    : out std_logic;
			S_AXI_BRESP     : out std_logic_vector(1 downto 0);
			S_AXI_BVALID    : out std_logic;
			S_AXI_BREADY    : in  std_logic;
			S_AXI_ARADDR    : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_ARPROT    : in  std_logic_vector(2 downto 0);
			S_AXI_ARVALID   : in  std_logic;
			S_AXI_ARREADY   : out std_logic;
			S_AXI_RDATA     : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_RRESP     : out std_logic_vector(1 downto 0);
			S_AXI_RVALID    : out std_logic;
			S_AXI_RREADY    : in  std_logic
		);
	end component axi_hfpi_v1_0_S_0_AXI_LITE;

	component axi_hfpi_v1_0_S_1_AXI_LITE is
		generic(
			C_S_AXI_DATA_WIDTH : integer := 32;
			C_S_AXI_ADDR_WIDTH : integer := 7
		);
		port(
			hostpc_clk      : in  std_logic;
			hostpc_mem_en   : in  std_logic;
			hostpc_mem_we   : in  std_logic;
			hostpc_mem_din  : in  std_logic_vector(31 downto 0);
			hostpc_mem_dout : out std_logic_vector(31 downto 0);
			hostpc_mem_addr : in  std_logic_vector(4 downto 0);
			S_AXI_ACLK      : in  std_logic;
			S_AXI_ARESETN   : in  std_logic;
			S_AXI_AWADDR    : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_AWPROT    : in  std_logic_vector(2 downto 0);
			S_AXI_AWVALID   : in  std_logic;
			S_AXI_AWREADY   : out std_logic;
			S_AXI_WDATA     : in  std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_WSTRB     : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8) - 1 downto 0);
			S_AXI_WVALID    : in  std_logic;
			S_AXI_WREADY    : out std_logic;
			S_AXI_BRESP     : out std_logic_vector(1 downto 0);
			S_AXI_BVALID    : out std_logic;
			S_AXI_BREADY    : in  std_logic;
			S_AXI_ARADDR    : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_ARPROT    : in  std_logic_vector(2 downto 0);
			S_AXI_ARVALID   : in  std_logic;
			S_AXI_ARREADY   : out std_logic;
			S_AXI_RDATA     : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_RRESP     : out std_logic_vector(1 downto 0);
			S_AXI_RVALID    : out std_logic;
			S_AXI_RREADY    : in  std_logic
		);
	end component axi_hfpi_v1_0_S_1_AXI_LITE;

	component afifo_32x512_axis_data_fifo_0_0 is
		port(
			s_axis_aresetn     : in  STD_LOGIC;
			m_axis_aresetn     : in  STD_LOGIC;
			s_axis_aclk        : in  STD_LOGIC;
			s_axis_tvalid      : in  STD_LOGIC;
			s_axis_tready      : out STD_LOGIC;
			s_axis_tdata       : in  STD_LOGIC_VECTOR(31 downto 0);
			s_axis_tlast       : in  STD_LOGIC;
			m_axis_aclk        : in  STD_LOGIC;
			m_axis_tvalid      : out STD_LOGIC;
			m_axis_tready      : in  STD_LOGIC;
			m_axis_tdata       : out STD_LOGIC_VECTOR(31 downto 0);
			m_axis_tlast       : out STD_LOGIC;
			axis_data_count    : out STD_LOGIC_VECTOR(31 downto 0);
			axis_wr_data_count : out STD_LOGIC_VECTOR(31 downto 0);
			axis_rd_data_count : out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;

	component afifo_32x512_fifo_generator_0_0 is
		port(
			rst    : in  STD_LOGIC;
			wr_clk : in  STD_LOGIC;
			rd_clk : in  STD_LOGIC;
			din    : in  STD_LOGIC_VECTOR(31 downto 0);
			wr_en  : in  STD_LOGIC;
			rd_en  : in  STD_LOGIC;
			dout   : out STD_LOGIC_VECTOR(31 downto 0);
			full   : out STD_LOGIC;
			empty  : out STD_LOGIC
		);
	end component;

	signal reset_sdram : std_logic;
	signal reset_sdram_n : std_logic;
	signal reset_fifo_0   : std_logic;
	signal reset_fifo_0_n   : std_logic;
	signal reset_fifo_1   : std_logic;
    signal reset_fifo_1_n   : std_logic;

	signal axis_to_fifo_0_full       : std_logic;
	signal s_fifo_0_axis_tlast_afifo : std_logic;
	signal hostpc_fifo_wr_0_full_n   : std_logic;
	signal filesize_0_countdown      : std_logic_vector(31 downto 0);
	signal m_fifo_0_axis_tready_aux  : std_logic;
	signal m_fifo_0_axis_tvalid_aux  : std_logic;

	signal axis_to_fifo_1_full       : std_logic;
	signal s_fifo_1_axis_tlast_afifo : std_logic;
	signal hostpc_fifo_wr_1_full_n   : std_logic;
	signal filesize_1_countdown      : std_logic_vector(31 downto 0);
	signal m_fifo_1_axis_tready_aux  : std_logic;
	signal m_fifo_1_axis_tvalid_aux  : std_logic;

	signal axis_to_sdram_full       : std_logic;
	signal s_sdram_axis_tlast_afifo : std_logic;
	signal hostpc_sdram_wr_full_n   : std_logic;
	signal filesize_sdram_countdown : std_logic_vector(31 downto 0);
	signal m_sdram_axis_tready_aux  : std_logic;
	signal m_sdram_axis_tvalid_aux  : std_logic;

begin

	reset_sdram   <= not hostpc_rstn_sdram;
	reset_sdram_n <= hostpc_rstn_sdram;

	reset_fifo_0   <= not hostpc_rstn_fifo_0;
	reset_fifo_0_n <= hostpc_rstn_fifo_0;

	reset_fifo_1   <= not hostpc_rstn_fifo_1;
	reset_fifo_1_n <= hostpc_rstn_fifo_1;

	-- Instantiation of Axi Bus Interface S_0_AXI_LITE
	axi_hfpi_v1_0_S_0_AXI_LITE_inst : axi_hfpi_v1_0_S_0_AXI_LITE
		generic map(
			C_S_AXI_DATA_WIDTH => C_S_0_AXI_LITE_DATA_WIDTH,
			C_S_AXI_ADDR_WIDTH => C_S_0_AXI_LITE_ADDR_WIDTH
		)
		port map(
			hostpc_clk      => hostpc_clk,
			hostpc_mem_en   => hostpc_mem_en,
			hostpc_mem_we   => hostpc_mem_we,
			hostpc_mem_din  => hostpc_mem_din,
			hostpc_mem_dout => hostpc_mem_dout,
			hostpc_mem_addr => hostpc_mem_addr,
			S_AXI_ACLK      => s_0_axi_lite_aclk,
			S_AXI_ARESETN   => s_0_axi_lite_aresetn,
			S_AXI_AWADDR    => s_0_axi_lite_awaddr,
			S_AXI_AWPROT    => s_0_axi_lite_awprot,
			S_AXI_AWVALID   => s_0_axi_lite_awvalid,
			S_AXI_AWREADY   => s_0_axi_lite_awready,
			S_AXI_WDATA     => s_0_axi_lite_wdata,
			S_AXI_WSTRB     => s_0_axi_lite_wstrb,
			S_AXI_WVALID    => s_0_axi_lite_wvalid,
			S_AXI_WREADY    => s_0_axi_lite_wready,
			S_AXI_BRESP     => s_0_axi_lite_bresp,
			S_AXI_BVALID    => s_0_axi_lite_bvalid,
			S_AXI_BREADY    => s_0_axi_lite_bready,
			S_AXI_ARADDR    => s_0_axi_lite_araddr,
			S_AXI_ARPROT    => s_0_axi_lite_arprot,
			S_AXI_ARVALID   => s_0_axi_lite_arvalid,
			S_AXI_ARREADY   => s_0_axi_lite_arready,
			S_AXI_RDATA     => s_0_axi_lite_rdata,
			S_AXI_RRESP     => s_0_axi_lite_rresp,
			S_AXI_RVALID    => s_0_axi_lite_rvalid,
			S_AXI_RREADY    => s_0_axi_lite_rready
		);

		-- Instantiation of Axi Bus Interface S_1_AXI_LITE
	axi_hfpi_v1_0_S_1_AXI_LITE_inst : axi_hfpi_v1_0_S_1_AXI_LITE
		generic map(
			C_S_AXI_DATA_WIDTH => C_S_1_AXI_LITE_DATA_WIDTH,
			C_S_AXI_ADDR_WIDTH => C_S_1_AXI_LITE_ADDR_WIDTH
		)
		port map(
			hostpc_clk      => hostpc_clk,
			hostpc_mem_en   => hostpc_mem_en,
			hostpc_mem_we   => hostpc_mem_we,
			hostpc_mem_din  => hostpc_mem_din,
			hostpc_mem_dout => open,    -- S_1_AXI_LITE is used for PowMon
			hostpc_mem_addr => hostpc_mem_addr,
			S_AXI_ACLK      => s_1_axi_lite_aclk,
			S_AXI_ARESETN   => s_1_axi_lite_aresetn,
			S_AXI_AWADDR    => s_1_axi_lite_awaddr,
			S_AXI_AWPROT    => s_1_axi_lite_awprot,
			S_AXI_AWVALID   => s_1_axi_lite_awvalid,
			S_AXI_AWREADY   => s_1_axi_lite_awready,
			S_AXI_WDATA     => s_1_axi_lite_wdata,
			S_AXI_WSTRB     => s_1_axi_lite_wstrb,
			S_AXI_WVALID    => s_1_axi_lite_wvalid,
			S_AXI_WREADY    => s_1_axi_lite_wready,
			S_AXI_BRESP     => s_1_axi_lite_bresp,
			S_AXI_BVALID    => s_1_axi_lite_bvalid,
			S_AXI_BREADY    => s_1_axi_lite_bready,
			S_AXI_ARADDR    => s_1_axi_lite_araddr,
			S_AXI_ARPROT    => s_1_axi_lite_arprot,
			S_AXI_ARVALID   => s_1_axi_lite_arvalid,
			S_AXI_ARREADY   => s_1_axi_lite_arready,
			S_AXI_RDATA     => s_1_axi_lite_rdata,
			S_AXI_RRESP     => s_1_axi_lite_rresp,
			S_AXI_RVALID    => s_1_axi_lite_rvalid,
			S_AXI_RREADY    => s_1_axi_lite_rready
		);

		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- FIFO 0
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	fifo_0_in : afifo_32x512_axis_data_fifo_0_0
		port map(
			axis_data_count    => open,
			axis_rd_data_count => open,
			axis_wr_data_count => open,
			m_axis_aclk        => m_fifo_0_axis_aclk,
			m_axis_aresetn     => m_fifo_0_axis_aresetn,
			m_axis_tdata       => m_fifo_0_axis_tdata,
			m_axis_tlast       => open,
			m_axis_tready      => m_fifo_0_axis_tready_aux,
			m_axis_tvalid      => m_fifo_0_axis_tvalid_aux,
			s_axis_aclk        => hostpc_clk,
			s_axis_aresetn     => reset_fifo_0_n,
			s_axis_tdata       => hostpc_fifo_wr_0_data,
			s_axis_tlast       => '0',
			s_axis_tready      => hostpc_fifo_wr_0_full_n,
			s_axis_tvalid      => hostpc_fifo_wr_0_en
		);

	fifo_0_out : afifo_32x512_fifo_generator_0_0
		port map(
			din    => s_fifo_0_axis_tdata,
			dout   => hostpc_fifo_rd_0_data,
			empty  => hostpc_fifo_rd_0_empty,
			full   => axis_to_fifo_0_full,
			rd_clk => hostpc_clk,
			rd_en  => hostpc_fifo_rd_0_en,
			rst    => reset_fifo_0,
			wr_clk => s_fifo_0_axis_aclk,
			wr_en  => s_fifo_0_axis_tvalid
		);

	s_fifo_0_axis_tready      <= not axis_to_fifo_0_full;
	s_fifo_0_axis_tlast_afifo <= s_fifo_0_axis_tlast; -- not used at the moment
	hostpc_fifo_wr_0_full     <= not hostpc_fifo_wr_0_full_n;
	m_fifo_0_axis_tlast       <= '1' when filesize_0_countdown = x"00000001" else '0';
	m_fifo_0_axis_tready_aux  <= m_fifo_0_axis_tready;
	m_fifo_0_axis_tvalid      <= '0' when filesize_0_countdown = x"00000000" else m_fifo_0_axis_tvalid_aux;

	process(hostpc_clk)
	begin
		if hostpc_clk = '1' and hostpc_clk'event then
			if hostpc_mem_we = '1' and hostpc_mem_addr = "00000" then -- "00000" is the addr of Filesize from HostPC
				filesize_0_countdown <= "00" & hostpc_mem_din(31 downto 2); -- divided by 4
			elsif m_fifo_0_axis_tready_aux = '1' and m_fifo_0_axis_tvalid_aux = '1' then
				filesize_0_countdown <= filesize_0_countdown - 1;
			end if;
		end if;
	end process;

	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- FIFO 1
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	fifo_1_in : afifo_32x512_axis_data_fifo_0_0
		port map(
			axis_data_count    => open,
			axis_rd_data_count => open,
			axis_wr_data_count => open,
			m_axis_aclk        => m_fifo_1_axis_aclk,
			m_axis_aresetn     => m_fifo_1_axis_aresetn,
			m_axis_tdata       => m_fifo_1_axis_tdata,
			m_axis_tlast       => open,
			m_axis_tready      => m_fifo_1_axis_tready_aux,
			m_axis_tvalid      => m_fifo_1_axis_tvalid_aux,
			s_axis_aclk        => hostpc_clk,
			s_axis_aresetn     => reset_fifo_1_n,
			s_axis_tdata       => hostpc_fifo_wr_1_data,
			s_axis_tlast       => '0',
			s_axis_tready      => hostpc_fifo_wr_1_full_n,
			s_axis_tvalid      => hostpc_fifo_wr_1_en
		);

	fifo_1_out : afifo_32x512_fifo_generator_0_0
		port map(
			din    => s_fifo_1_axis_tdata,
			dout   => hostpc_fifo_rd_1_data,
			empty  => hostpc_fifo_rd_1_empty,
			full   => axis_to_fifo_1_full,
			rd_clk => hostpc_clk,
			rd_en  => hostpc_fifo_rd_1_en,
			rst    => reset_fifo_1,
			wr_clk => s_fifo_1_axis_aclk,
			wr_en  => s_fifo_1_axis_tvalid
		);

	s_fifo_1_axis_tready      <= not axis_to_fifo_1_full;
	s_fifo_1_axis_tlast_afifo <= s_fifo_1_axis_tlast; -- not used at the moment
	hostpc_fifo_wr_1_full     <= not hostpc_fifo_wr_1_full_n;
	m_fifo_1_axis_tlast       <= '1' when filesize_1_countdown = x"00000001" else '0';
	m_fifo_1_axis_tready_aux  <= m_fifo_1_axis_tready;
	m_fifo_1_axis_tvalid      <= '0' when filesize_1_countdown = x"00000000" else m_fifo_1_axis_tvalid_aux;

	process(hostpc_clk)
	begin
		if hostpc_clk = '1' and hostpc_clk'event then
			if hostpc_mem_we = '1' and hostpc_mem_addr = "00001" then -- "00001" is the addr of Filesize from HostPC
				filesize_1_countdown <= "00" & hostpc_mem_din(31 downto 2); -- divided by 4
			elsif m_fifo_1_axis_tready_aux = '1' and m_fifo_1_axis_tvalid_aux = '1' then
				filesize_1_countdown <= filesize_1_countdown - 1;
			end if;
		end if;
	end process;

	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- SDRAM
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	fifo_sdram_in : afifo_32x512_axis_data_fifo_0_0
		port map(
			axis_data_count    => open,
			axis_rd_data_count => open,
			axis_wr_data_count => open,
			m_axis_aclk        => m_sdram_axis_aclk,
			m_axis_aresetn     => m_sdram_axis_aresetn,
			m_axis_tdata       => m_sdram_axis_tdata,
			m_axis_tlast       => open,
			m_axis_tready      => m_sdram_axis_tready_aux,
			m_axis_tvalid      => m_sdram_axis_tvalid_aux,
			s_axis_aclk        => hostpc_clk,
			s_axis_aresetn     => reset_sdram_n,
			s_axis_tdata       => hostpc_sdram_wr_data,
			s_axis_tlast       => '0',
			s_axis_tready      => hostpc_sdram_wr_full_n,
			s_axis_tvalid      => hostpc_sdram_wr_en
		);

	fifo_sdram_out : afifo_32x512_fifo_generator_0_0
		port map(
			din    => s_sdram_axis_tdata,
			dout   => hostpc_sdram_rd_data,
			empty  => hostpc_sdram_rd_empty,
			full   => axis_to_sdram_full,
			rd_clk => hostpc_clk,
			rd_en  => hostpc_sdram_rd_en,
			rst    => reset_sdram,
			wr_clk => s_sdram_axis_aclk,
			wr_en  => s_sdram_axis_tvalid
		);

	s_sdram_axis_tready      <= not axis_to_sdram_full;
	s_sdram_axis_tlast_afifo <= s_sdram_axis_tlast; -- not used at the moment
	hostpc_sdram_wr_full     <= not hostpc_sdram_wr_full_n;
	m_sdram_axis_tlast       <= '1' when filesize_sdram_countdown = x"00000001" else '0';
	m_sdram_axis_tready_aux  <= m_sdram_axis_tready;
	m_sdram_axis_tvalid      <= '0' when filesize_sdram_countdown = x"00000000" else m_sdram_axis_tvalid_aux;

	process(hostpc_clk)
	begin
		if hostpc_clk = '1' and hostpc_clk'event then
			if hostpc_mem_we = '1' and hostpc_mem_addr = "11111" then -- "11111" is the addr of Filesize from HostPC
				filesize_sdram_countdown <= "00" & hostpc_mem_din(31 downto 2); -- divided by 4
			elsif m_sdram_axis_tready_aux = '1' and m_sdram_axis_tvalid_aux = '1' then
				filesize_sdram_countdown <= filesize_sdram_countdown - 1;
			end if;
		end if;
	end process;

end arch_imp;
