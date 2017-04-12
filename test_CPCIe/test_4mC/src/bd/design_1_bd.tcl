
################################################################
# This is a generated script based on design: design_bd
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_bd_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7vx485tffg1761-2
#    set_property BOARD_PART xilinx.com:vc707:part0:1.1 [current_project]


# CHANGE DESIGN NAME HERE
set design_name design_bd

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst LMB_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list CONFIG.C_ECC {0}  ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list CONFIG.C_ECC {0}  ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.2 lmb_bram ]
  set_property -dict [ list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.use_bram_block {BRAM_Controller}  ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_0_LMB_Rst [get_bd_pins LMB_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr3_sdram [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr3_sdram ]
  set rs232_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart ]
  set sys_diff_clock [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys_diff_clock ]
  set_property -dict [ list CONFIG.FREQ_HZ {100000000}  ] $sys_diff_clock

  # Create ports
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list CONFIG.POLARITY {ACTIVE_HIGH}  ] $reset

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list CONFIG.c_include_sg {0} CONFIG.c_mm2s_burst_size {256} CONFIG.c_s2mm_burst_size {256} CONFIG.c_sg_length_width {23}  ] $axi_dma_0

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list CONFIG.NUM_MI {1} CONFIG.NUM_SI {4}  ] $axi_mem_intercon

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list CONFIG.C_BAUDRATE {115200} CONFIG.UARTLITE_BOARD_INTERFACE {rs232_uart} CONFIG.USE_BOARD_FLOW {true}  ] $axi_uartlite_0

  # Create instance: axis_data_fifo_m1, and set properties
  set axis_data_fifo_m1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_m1 ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {16384} CONFIG.TDATA_NUM_BYTES {4}  ] $axis_data_fifo_m1

  # Create instance: axis_data_fifo_m2, and set properties
  set axis_data_fifo_m2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_m2 ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {32768} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {4}  ] $axis_data_fifo_m2

  # Create instance: axis_switch_0, and set properties
  set axis_switch_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_0 ]
  set_property -dict [ list CONFIG.DECODER_REG {1} CONFIG.M00_AXIS_BASETDEST {0x00000001} CONFIG.M00_AXIS_HIGHTDEST {0x00000001} CONFIG.M01_AXIS_BASETDEST {0x00000002} CONFIG.M01_AXIS_HIGHTDEST {0x00000002} CONFIG.M02_AXIS_BASETDEST {0x00000004} CONFIG.M02_AXIS_HIGHTDEST {0x00000004} CONFIG.M03_AXIS_BASETDEST {0x00000008} CONFIG.M03_AXIS_HIGHTDEST {0x00000008} CONFIG.NUM_MI {4} CONFIG.NUM_SI {1} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {4}  ] $axis_switch_0

  # Create instance: axis_switch_1, and set properties
  set axis_switch_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_1 ]
  set_property -dict [ list CONFIG.ARB_ALGORITHM {1} CONFIG.ARB_ON_MAX_XFERS {1024} CONFIG.ARB_ON_NUM_CYCLES {1} CONFIG.NUM_SI {5} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {0}  ] $axis_switch_1

  # Create instance: fifo_header_packer, and set properties
  set fifo_header_packer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 fifo_header_packer ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {8192} CONFIG.TDATA_NUM_BYTES {4}  ] $fifo_header_packer

  # Create instance: mCompressor_0, and set properties
  set mCompressor_0 [ create_bd_cell -type ip -vlnv mohdazainol:user:mCompressor:1.0 mCompressor_0 ]

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.4 microblaze_0 ]
  set_property -dict [ list CONFIG.C_CACHE_BYTE_SIZE {16384} CONFIG.C_DCACHE_BYTE_SIZE {16384} CONFIG.C_DEBUG_ENABLED {1} CONFIG.C_D_AXI {1} CONFIG.C_D_LMB {1} CONFIG.C_I_LMB {1} CONFIG.C_USE_DCACHE {1} CONFIG.C_USE_ICACHE {1}  ] $microblaze_0

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list CONFIG.NUM_MI {3}  ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:2.3 mig_7series_0 ]
  set_property -dict [ list CONFIG.BOARD_MIG_PARAM {ddr3_sdram} CONFIG.RESET_BOARD_INTERFACE {reset}  ] $mig_7series_0

  # Create instance: rst_mig_7series_0_100M, and set properties
  set rst_mig_7series_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_100M ]

  # Create instance: scheduler_cpcie_0, and set properties
  set scheduler_cpcie_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:scheduler_cpcie:1.0 scheduler_cpcie_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {32}  ] $xlconstant_0

  # Create instance: xmatchpro_compressor_0, and set properties
  set xmatchpro_compressor_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_0 ]

  # Create instance: xmatchpro_compressor_1, and set properties
  set xmatchpro_compressor_1 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_1 ]

  # Create instance: xmatchpro_compressor_2, and set properties
  set xmatchpro_compressor_2 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_2 ]

  # Create instance: xmatchpro_compressor_3, and set properties
  set xmatchpro_compressor_3 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_3 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins axis_data_fifo_m1/S_AXIS]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_S2MM [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S03_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports rs232_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_pins axis_data_fifo_m1/M_AXIS] [get_bd_intf_pins scheduler_cpcie_0/s_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_m2_M_AXIS [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins axis_data_fifo_m2/M_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M00_AXIS [get_bd_intf_pins axis_switch_0/M00_AXIS] [get_bd_intf_pins xmatchpro_compressor_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M01_AXIS [get_bd_intf_pins axis_switch_0/M01_AXIS] [get_bd_intf_pins xmatchpro_compressor_1/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M02_AXIS [get_bd_intf_pins axis_switch_0/M02_AXIS] [get_bd_intf_pins xmatchpro_compressor_2/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M03_AXIS [get_bd_intf_pins axis_switch_0/M03_AXIS] [get_bd_intf_pins xmatchpro_compressor_3/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_1_M00_AXIS [get_bd_intf_pins axis_data_fifo_m2/S_AXIS] [get_bd_intf_pins axis_switch_1/M00_AXIS]
  connect_bd_intf_net -intf_net fifo_header_packer_M_AXIS [get_bd_intf_pins axis_switch_1/S04_AXIS] [get_bd_intf_pins fifo_header_packer/M_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DP [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M00_AXI [get_bd_intf_pins axi_dma_0/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins mCompressor_0/S00_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net mig_7series_0_DDR3 [get_bd_intf_ports ddr3_sdram] [get_bd_intf_pins mig_7series_0/DDR3]
  connect_bd_intf_net -intf_net scheduler_cpcie_0_m_axis_fork [get_bd_intf_pins axis_switch_0/S00_AXIS] [get_bd_intf_pins scheduler_cpcie_0/m_axis_fork]
  connect_bd_intf_net -intf_net scheduler_cpcie_0_m_axis_header [get_bd_intf_pins fifo_header_packer/S_AXIS] [get_bd_intf_pins scheduler_cpcie_0/m_axis_header]
  connect_bd_intf_net -intf_net sys_diff_clock_1 [get_bd_intf_ports sys_diff_clock] [get_bd_intf_pins mig_7series_0/SYS_CLK]
  connect_bd_intf_net -intf_net xmatchpro_compressor_0_M_AXIS [get_bd_intf_pins axis_switch_1/S00_AXIS] [get_bd_intf_pins xmatchpro_compressor_0/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_compressor_1_M_AXIS [get_bd_intf_pins axis_switch_1/S01_AXIS] [get_bd_intf_pins xmatchpro_compressor_1/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_compressor_2_M_AXIS [get_bd_intf_pins axis_switch_1/S02_AXIS] [get_bd_intf_pins xmatchpro_compressor_2/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_compressor_3_M_AXIS [get_bd_intf_pins axis_switch_1/S03_AXIS] [get_bd_intf_pins xmatchpro_compressor_3/M_AXIS]

  # Create port connections
  connect_bd_net -net mCompressor_0_M_COMMAND [get_bd_pins mCompressor_0/M_COMMAND] [get_bd_pins scheduler_cpcie_0/command_in]
  connect_bd_net -net mCompressor_0_M_FILESIZE [get_bd_pins mCompressor_0/M_FILESIZE] [get_bd_pins scheduler_cpcie_0/filesize_u]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_mig_7series_0_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins axi_mem_intercon/S03_ACLK] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins axis_data_fifo_m1/s_axis_aclk] [get_bd_pins axis_data_fifo_m2/s_axis_aclk] [get_bd_pins axis_switch_0/aclk] [get_bd_pins axis_switch_1/aclk] [get_bd_pins fifo_header_packer/s_axis_aclk] [get_bd_pins mCompressor_0/s00_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins mig_7series_0/ui_clk] [get_bd_pins rst_mig_7series_0_100M/slowest_sync_clk] [get_bd_pins scheduler_cpcie_0/clk] [get_bd_pins xmatchpro_compressor_0/CLK] [get_bd_pins xmatchpro_compressor_1/CLK] [get_bd_pins xmatchpro_compressor_2/CLK] [get_bd_pins xmatchpro_compressor_3/CLK]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins rst_mig_7series_0_100M/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst [get_bd_pins mig_7series_0/ui_clk_sync_rst] [get_bd_pins rst_mig_7series_0_100M/ext_reset_in]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins mig_7series_0/sys_rst]
  connect_bd_net -net rst_mig_7series_0_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/LMB_Rst] [get_bd_pins rst_mig_7series_0_100M/bus_struct_reset]
  connect_bd_net -net rst_mig_7series_0_100M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_mig_7series_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_mig_7series_0_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins rst_mig_7series_0_100M/mb_reset]
  connect_bd_net -net rst_mig_7series_0_100M_peripheral_aresetn [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins axi_mem_intercon/S03_ARESETN] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins axis_data_fifo_m1/s_axis_aresetn] [get_bd_pins axis_data_fifo_m2/s_axis_aresetn] [get_bd_pins axis_switch_0/aresetn] [get_bd_pins axis_switch_1/aresetn] [get_bd_pins fifo_header_packer/s_axis_aresetn] [get_bd_pins mCompressor_0/s00_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins rst_mig_7series_0_100M/peripheral_aresetn] [get_bd_pins scheduler_cpcie_0/rstn] [get_bd_pins xmatchpro_compressor_0/RESETN] [get_bd_pins xmatchpro_compressor_1/RESETN] [get_bd_pins xmatchpro_compressor_2/RESETN] [get_bd_pins xmatchpro_compressor_3/RESETN]
  connect_bd_net -net scheduler_cpcie_0_command_engine_0 [get_bd_pins scheduler_cpcie_0/command_engine_0] [get_bd_pins xmatchpro_compressor_0/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_1 [get_bd_pins scheduler_cpcie_0/command_engine_1] [get_bd_pins xmatchpro_compressor_1/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_2 [get_bd_pins scheduler_cpcie_0/command_engine_2] [get_bd_pins xmatchpro_compressor_2/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_3 [get_bd_pins scheduler_cpcie_0/command_engine_3] [get_bd_pins xmatchpro_compressor_3/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_join_suppress [get_bd_pins axis_switch_1/s_req_suppress] [get_bd_pins scheduler_cpcie_0/join_suppress]
  connect_bd_net -net scheduler_cpcie_0_status [get_bd_pins mCompressor_0/S_STATUS] [get_bd_pins scheduler_cpcie_0/status]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins scheduler_cpcie_0/s_axis_header_tdata] [get_bd_pins scheduler_cpcie_0/s_axis_header_tvalid] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xmatchpro_compressor_0_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_0] [get_bd_pins xmatchpro_compressor_0/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_0_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_0] [get_bd_pins xmatchpro_compressor_0/STATUS]
  connect_bd_net -net xmatchpro_compressor_1_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_1] [get_bd_pins xmatchpro_compressor_1/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_1_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_1] [get_bd_pins xmatchpro_compressor_1/STATUS]
  connect_bd_net -net xmatchpro_compressor_2_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_2] [get_bd_pins xmatchpro_compressor_2/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_2_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_2] [get_bd_pins xmatchpro_compressor_2/STATUS]
  connect_bd_net -net xmatchpro_compressor_3_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_3] [get_bd_pins xmatchpro_compressor_3/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_3_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_3] [get_bd_pins xmatchpro_compressor_3/STATUS]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x10000 -offset 0x41E00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x20000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x20000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mCompressor_0/S00_AXI/S00_AXI_reg] SEG_mCompressor_0_S00_AXI_reg
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


