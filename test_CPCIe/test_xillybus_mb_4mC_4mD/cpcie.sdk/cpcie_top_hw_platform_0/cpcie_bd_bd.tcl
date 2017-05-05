
################################################################
# This is a generated script based on design: cpcie_bd
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
# source cpcie_bd_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7vx485tffg1761-2
#    set_property BOARD_PART xilinx.com:vc707:part0:1.1 [current_project]


# CHANGE DESIGN NAME HERE
set design_name cpcie_bd

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
  set PCIE_BRAM [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:bram_rtl:1.0 PCIE_BRAM ]
  set PCIE_FIFO_RD_C [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 PCIE_FIFO_RD_C ]
  set PCIE_FIFO_RD_D [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 PCIE_FIFO_RD_D ]
  set PCIE_S_AXIS_C [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 PCIE_S_AXIS_C ]
  set_property -dict [ list CONFIG.FREQ_HZ {100000000} CONFIG.HAS_TKEEP {0} CONFIG.HAS_TLAST {1} CONFIG.HAS_TREADY {1} CONFIG.HAS_TSTRB {0} CONFIG.LAYERED_METADATA {undef} CONFIG.PHASE {0.000} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {0} CONFIG.TID_WIDTH {0} CONFIG.TUSER_WIDTH {0}  ] $PCIE_S_AXIS_C
  set PCIE_S_AXIS_D [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 PCIE_S_AXIS_D ]
  set_property -dict [ list CONFIG.FREQ_HZ {100000000} CONFIG.HAS_TKEEP {0} CONFIG.HAS_TLAST {1} CONFIG.HAS_TREADY {1} CONFIG.HAS_TSTRB {0} CONFIG.LAYERED_METADATA {undef} CONFIG.PHASE {0.000} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {0} CONFIG.TID_WIDTH {0} CONFIG.TUSER_WIDTH {0}  ] $PCIE_S_AXIS_D
  set rs232_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart ]
  set sys_diff_clock [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys_diff_clock ]
  set_property -dict [ list CONFIG.FREQ_HZ {200000000}  ] $sys_diff_clock

  # Create ports
  set PCIE_CLK [ create_bd_port -dir I -type clk PCIE_CLK ]
  set_property -dict [ list CONFIG.ASSOCIATED_BUSIF {PCIE_S_AXIS_C:PCIE_S_AXIS_C_1:PCIE_M_AXIS_0:PCIE_M_AXIS_1:PCIE_S_AXIS_1:PCIE_S_AXIS_D}  ] $PCIE_CLK
  set PCIE_RST_RD_C [ create_bd_port -dir I -type rst PCIE_RST_RD_C ]
  set PCIE_RST_RD_D [ create_bd_port -dir I PCIE_RST_RD_D ]
  set PCIE_RST_WR_C [ create_bd_port -dir I -type rst PCIE_RST_WR_C ]
  set PCIE_RST_WR_D [ create_bd_port -dir I -type rst PCIE_RST_WR_D ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list CONFIG.POLARITY {ACTIVE_HIGH}  ] $reset

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_0 ]
  set_property -dict [ list CONFIG.PROTOCOL {AXI4LITE} CONFIG.SINGLE_PORT_BRAM {1}  ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_0_bram, and set properties
  set axi_bram_ctrl_0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.2 axi_bram_ctrl_0_bram ]
  set_property -dict [ list CONFIG.Enable_32bit_Address {true} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {false} CONFIG.Write_Depth_A {32} CONFIG.use_bram_block {Stand_Alone}  ] $axi_bram_ctrl_0_bram

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list CONFIG.C_BAUDRATE {115200} CONFIG.UARTLITE_BOARD_INTERFACE {rs232_uart} CONFIG.USE_BOARD_FLOW {true}  ] $axi_uartlite_0

  # Create instance: axis_data_fifo_s0, and set properties
  set axis_data_fifo_s0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_s0 ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {1024} CONFIG.HAS_TLAST {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3} CONFIG.TDATA_NUM_BYTES {4}  ] $axis_data_fifo_s0

  # Create instance: axis_data_fifo_s1, and set properties
  set axis_data_fifo_s1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_s1 ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {1024} CONFIG.HAS_TLAST {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3} CONFIG.TDATA_NUM_BYTES {4}  ] $axis_data_fifo_s1

  # Create instance: axis_switch_0, and set properties
  set axis_switch_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_0 ]
  set_property -dict [ list CONFIG.DECODER_REG {1} CONFIG.M00_AXIS_BASETDEST {0x00000001} CONFIG.M00_AXIS_HIGHTDEST {0x00000001} CONFIG.M01_AXIS_BASETDEST {0x00000002} CONFIG.M01_AXIS_HIGHTDEST {0x00000002} CONFIG.M02_AXIS_BASETDEST {0x00000004} CONFIG.M02_AXIS_HIGHTDEST {0x00000004} CONFIG.M03_AXIS_BASETDEST {0x00000008} CONFIG.M03_AXIS_HIGHTDEST {0x00000008} CONFIG.NUM_MI {4} CONFIG.NUM_SI {1} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {4}  ] $axis_switch_0

  # Create instance: axis_switch_1, and set properties
  set axis_switch_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_1 ]
  set_property -dict [ list CONFIG.ARB_ALGORITHM {1} CONFIG.ARB_ON_MAX_XFERS {1024} CONFIG.ARB_ON_NUM_CYCLES {1} CONFIG.NUM_SI {5} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {0}  ] $axis_switch_1

  # Create instance: axis_switch_2, and set properties
  set axis_switch_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_2 ]
  set_property -dict [ list CONFIG.DECODER_REG {1} CONFIG.M00_AXIS_BASETDEST {0x00000001} CONFIG.M00_AXIS_HIGHTDEST {0x00000001} CONFIG.M01_AXIS_BASETDEST {0x00000002} CONFIG.M01_AXIS_HIGHTDEST {0x00000002} CONFIG.M02_AXIS_BASETDEST {0x00000004} CONFIG.M02_AXIS_HIGHTDEST {0x00000004} CONFIG.M03_AXIS_BASETDEST {0x00000008} CONFIG.M03_AXIS_HIGHTDEST {0x00000008} CONFIG.NUM_MI {4} CONFIG.NUM_SI {1} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {4}  ] $axis_switch_2

  # Create instance: axis_switch_3, and set properties
  set axis_switch_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_3 ]
  set_property -dict [ list CONFIG.ARB_ALGORITHM {1} CONFIG.ARB_ON_MAX_XFERS {1024} CONFIG.ARB_ON_NUM_CYCLES {1} CONFIG.NUM_SI {4} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {0}  ] $axis_switch_3

  # Create instance: axis_to_fifo_0, and set properties
  set axis_to_fifo_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:axis_to_fifo:1.0 axis_to_fifo_0 ]

  # Create instance: axis_to_fifo_1, and set properties
  set axis_to_fifo_1 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:axis_to_fifo:1.0 axis_to_fifo_1 ]

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_1 ]
  set_property -dict [ list CONFIG.CLK_IN1_BOARD_INTERFACE {sys_diff_clock} CONFIG.RESET_BOARD_INTERFACE {reset} CONFIG.USE_BOARD_FLOW {true}  ] $clk_wiz_1

  # Create instance: fifo_header_depacker, and set properties
  set fifo_header_depacker [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 fifo_header_depacker ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {8192} CONFIG.TDATA_NUM_BYTES {4}  ] $fifo_header_depacker

  # Create instance: fifo_header_packer, and set properties
  set fifo_header_packer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 fifo_header_packer ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {8192} CONFIG.TDATA_NUM_BYTES {4}  ] $fifo_header_packer

  # Create instance: mCompressor_0, and set properties
  set mCompressor_0 [ create_bd_cell -type ip -vlnv mohdazainol:user:mCompressor:1.0 mCompressor_0 ]

  # Create instance: mDecompressor_0, and set properties
  set mDecompressor_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:mDecompressor:1.0 mDecompressor_0 ]

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.4 microblaze_0 ]
  set_property -dict [ list CONFIG.C_DEBUG_ENABLED {1} CONFIG.C_D_AXI {1} CONFIG.C_D_LMB {1} CONFIG.C_I_LMB {1}  ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list CONFIG.C_HAS_FAST {1}  ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list CONFIG.NUM_MI {5}  ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]
  set_property -dict [ list CONFIG.RESET_BOARD_INTERFACE {reset} CONFIG.USE_BOARD_FLOW {true}  ] $rst_clk_wiz_1_100M

  # Create instance: scheduler_cpcie_0, and set properties
  set scheduler_cpcie_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:scheduler_cpcie:1.0 scheduler_cpcie_0 ]

  # Create instance: scheduler_cpcie_1, and set properties
  set scheduler_cpcie_1 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:scheduler_cpcie:1.0 scheduler_cpcie_1 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {32}  ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list CONFIG.CONST_WIDTH {32}  ] $xlconstant_1

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list CONFIG.DIN_FROM {3} CONFIG.DIN_WIDTH {5}  ] $xlslice_0

  # Create instance: xmatchpro_compressor_0, and set properties
  set xmatchpro_compressor_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_0 ]

  # Create instance: xmatchpro_compressor_1, and set properties
  set xmatchpro_compressor_1 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_1 ]

  # Create instance: xmatchpro_compressor_2, and set properties
  set xmatchpro_compressor_2 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_2 ]

  # Create instance: xmatchpro_compressor_3, and set properties
  set xmatchpro_compressor_3 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor:1.0 xmatchpro_compressor_3 ]

  # Create instance: xmatchpro_decompressor_0, and set properties
  set xmatchpro_decompressor_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor:1.0 xmatchpro_decompressor_0 ]

  # Create instance: xmatchpro_decompressor_1, and set properties
  set xmatchpro_decompressor_1 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor:1.0 xmatchpro_decompressor_1 ]

  # Create instance: xmatchpro_decompressor_2, and set properties
  set xmatchpro_decompressor_2 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor:1.0 xmatchpro_decompressor_2 ]

  # Create instance: xmatchpro_decompressor_3, and set properties
  set xmatchpro_decompressor_3 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor:1.0 xmatchpro_decompressor_3 ]

  # Create interface connections
  connect_bd_intf_net -intf_net FIFO_RD_1 [get_bd_intf_ports PCIE_FIFO_RD_C] [get_bd_intf_pins axis_to_fifo_0/FIFO_RD]
  connect_bd_intf_net -intf_net FIFO_RD_2 [get_bd_intf_ports PCIE_FIFO_RD_D] [get_bd_intf_pins axis_to_fifo_1/FIFO_RD]
  connect_bd_intf_net -intf_net PCIE_BRAM_1 [get_bd_intf_ports PCIE_BRAM] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_ports PCIE_S_AXIS_D] [get_bd_intf_pins axis_data_fifo_s1/S_AXIS]
  connect_bd_intf_net -intf_net S_AXIS_2 [get_bd_intf_ports PCIE_S_AXIS_C] [get_bd_intf_pins axis_data_fifo_s0/S_AXIS]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports rs232_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins fifo_header_depacker/M_AXIS] [get_bd_intf_pins scheduler_cpcie_1/s_axis_header]
  connect_bd_intf_net -intf_net axis_data_fifo_s0_M_AXIS [get_bd_intf_pins axis_data_fifo_s0/M_AXIS] [get_bd_intf_pins scheduler_cpcie_0/s_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_s1_M_AXIS [get_bd_intf_pins axis_data_fifo_s1/M_AXIS] [get_bd_intf_pins scheduler_cpcie_1/s_axis]
  connect_bd_intf_net -intf_net axis_switch_0_M00_AXIS [get_bd_intf_pins axis_switch_0/M00_AXIS] [get_bd_intf_pins xmatchpro_compressor_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M00_AXIS1 [get_bd_intf_pins axis_switch_2/M00_AXIS] [get_bd_intf_pins xmatchpro_decompressor_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M01_AXIS [get_bd_intf_pins axis_switch_0/M01_AXIS] [get_bd_intf_pins xmatchpro_compressor_1/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M01_AXIS1 [get_bd_intf_pins axis_switch_2/M01_AXIS] [get_bd_intf_pins xmatchpro_decompressor_1/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M02_AXIS [get_bd_intf_pins axis_switch_0/M02_AXIS] [get_bd_intf_pins xmatchpro_compressor_2/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M02_AXIS1 [get_bd_intf_pins axis_switch_2/M02_AXIS] [get_bd_intf_pins xmatchpro_decompressor_2/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M03_AXIS [get_bd_intf_pins axis_switch_0/M03_AXIS] [get_bd_intf_pins xmatchpro_compressor_3/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M03_AXIS1 [get_bd_intf_pins axis_switch_2/M03_AXIS] [get_bd_intf_pins xmatchpro_decompressor_3/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_1_M00_AXIS [get_bd_intf_pins axis_switch_1/M00_AXIS] [get_bd_intf_pins axis_to_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_switch_3_M00_AXIS [get_bd_intf_pins axis_switch_3/M00_AXIS] [get_bd_intf_pins axis_to_fifo_1/S_AXIS]
  connect_bd_intf_net -intf_net fifo_header_packer_M_AXIS [get_bd_intf_pins axis_switch_1/S04_AXIS] [get_bd_intf_pins fifo_header_packer/M_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins mCompressor_0/S00_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins mDecompressor_0/S00_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net scheduler_cpcie_0_m_axis_fork [get_bd_intf_pins axis_switch_0/S00_AXIS] [get_bd_intf_pins scheduler_cpcie_0/m_axis_fork]
  connect_bd_intf_net -intf_net scheduler_cpcie_0_m_axis_fork1 [get_bd_intf_pins axis_switch_2/S00_AXIS] [get_bd_intf_pins scheduler_cpcie_1/m_axis_fork]
  connect_bd_intf_net -intf_net scheduler_cpcie_0_m_axis_header [get_bd_intf_pins fifo_header_packer/S_AXIS] [get_bd_intf_pins scheduler_cpcie_0/m_axis_header]
  connect_bd_intf_net -intf_net scheduler_cpcie_0_m_axis_header1 [get_bd_intf_pins fifo_header_depacker/S_AXIS] [get_bd_intf_pins scheduler_cpcie_1/m_axis_header]
  connect_bd_intf_net -intf_net sys_diff_clock_1 [get_bd_intf_ports sys_diff_clock] [get_bd_intf_pins clk_wiz_1/CLK_IN1_D]
  connect_bd_intf_net -intf_net xmatchpro_compressor_0_M_AXIS [get_bd_intf_pins axis_switch_1/S00_AXIS] [get_bd_intf_pins xmatchpro_compressor_0/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_compressor_1_M_AXIS [get_bd_intf_pins axis_switch_1/S01_AXIS] [get_bd_intf_pins xmatchpro_compressor_1/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_compressor_2_M_AXIS [get_bd_intf_pins axis_switch_1/S02_AXIS] [get_bd_intf_pins xmatchpro_compressor_2/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_compressor_3_M_AXIS [get_bd_intf_pins axis_switch_1/S03_AXIS] [get_bd_intf_pins xmatchpro_compressor_3/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_0_M_AXIS [get_bd_intf_pins axis_switch_3/S00_AXIS] [get_bd_intf_pins xmatchpro_decompressor_0/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_1_M_AXIS [get_bd_intf_pins axis_switch_3/S01_AXIS] [get_bd_intf_pins xmatchpro_decompressor_1/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_2_M_AXIS [get_bd_intf_pins axis_switch_3/S02_AXIS] [get_bd_intf_pins xmatchpro_decompressor_2/M_AXIS]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_3_M_AXIS [get_bd_intf_pins axis_switch_3/S03_AXIS] [get_bd_intf_pins xmatchpro_decompressor_3/M_AXIS]

  # Create port connections
  connect_bd_net -net PCIE_CLK_1 [get_bd_ports PCIE_CLK] [get_bd_pins axis_data_fifo_s0/s_axis_aclk] [get_bd_pins axis_data_fifo_s1/s_axis_aclk] [get_bd_pins axis_to_fifo_0/fifo_rd_clk] [get_bd_pins axis_to_fifo_1/fifo_rd_clk]
  connect_bd_net -net PCIE_RST_0_1 [get_bd_ports PCIE_RST_RD_C] [get_bd_pins axis_to_fifo_0/fifo_rd_rst]
  connect_bd_net -net PCIE_RST_N_0_1 [get_bd_ports PCIE_RST_WR_C] [get_bd_pins axis_data_fifo_s0/m_axis_aresetn] [get_bd_pins axis_data_fifo_s0/s_axis_aresetn]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net fifo_rd_rst_1 [get_bd_ports PCIE_RST_RD_D] [get_bd_pins axis_to_fifo_1/fifo_rd_rst]
  connect_bd_net -net mCompressor_0_M_COMMAND [get_bd_pins mCompressor_0/M_COMMAND] [get_bd_pins scheduler_cpcie_0/command_in]
  connect_bd_net -net mCompressor_0_M_FILESIZE [get_bd_pins mCompressor_0/M_FILESIZE] [get_bd_pins scheduler_cpcie_0/filesize_u]
  connect_bd_net -net mDecompressor_0_M_COMMAND [get_bd_pins mDecompressor_0/M_COMMAND] [get_bd_pins scheduler_cpcie_1/command_in]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins axis_data_fifo_s0/m_axis_aclk] [get_bd_pins axis_data_fifo_s1/m_axis_aclk] [get_bd_pins axis_switch_0/aclk] [get_bd_pins axis_switch_1/aclk] [get_bd_pins axis_switch_2/aclk] [get_bd_pins axis_switch_3/aclk] [get_bd_pins axis_to_fifo_0/s_axis_clk] [get_bd_pins axis_to_fifo_1/s_axis_clk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins fifo_header_depacker/s_axis_aclk] [get_bd_pins fifo_header_packer/s_axis_aclk] [get_bd_pins mCompressor_0/s00_axi_aclk] [get_bd_pins mDecompressor_0/s00_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins scheduler_cpcie_0/clk] [get_bd_pins scheduler_cpcie_1/clk] [get_bd_pins xmatchpro_compressor_0/CLK] [get_bd_pins xmatchpro_compressor_1/CLK] [get_bd_pins xmatchpro_compressor_2/CLK] [get_bd_pins xmatchpro_compressor_3/CLK] [get_bd_pins xmatchpro_decompressor_0/CLK] [get_bd_pins xmatchpro_decompressor_1/CLK] [get_bd_pins xmatchpro_decompressor_2/CLK] [get_bd_pins xmatchpro_decompressor_3/CLK]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins clk_wiz_1/reset] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/LMB_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins axis_switch_0/aresetn] [get_bd_pins axis_switch_1/aresetn] [get_bd_pins axis_switch_2/aresetn] [get_bd_pins axis_switch_3/aresetn] [get_bd_pins fifo_header_depacker/s_axis_aresetn] [get_bd_pins fifo_header_packer/s_axis_aresetn] [get_bd_pins mCompressor_0/s00_axi_aresetn] [get_bd_pins mDecompressor_0/s00_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn] [get_bd_pins scheduler_cpcie_0/rstn] [get_bd_pins scheduler_cpcie_1/rstn] [get_bd_pins xmatchpro_compressor_0/RESETN] [get_bd_pins xmatchpro_compressor_1/RESETN] [get_bd_pins xmatchpro_compressor_2/RESETN] [get_bd_pins xmatchpro_compressor_3/RESETN] [get_bd_pins xmatchpro_decompressor_0/RESETN] [get_bd_pins xmatchpro_decompressor_1/RESETN] [get_bd_pins xmatchpro_decompressor_2/RESETN] [get_bd_pins xmatchpro_decompressor_3/RESETN]
  connect_bd_net -net s_axis_aresetn_1 [get_bd_ports PCIE_RST_WR_D] [get_bd_pins axis_data_fifo_s1/m_axis_aresetn] [get_bd_pins axis_data_fifo_s1/s_axis_aresetn]
  connect_bd_net -net scheduler_cpcie_0_command_engine_0 [get_bd_pins scheduler_cpcie_0/command_engine_0] [get_bd_pins xmatchpro_compressor_0/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_1 [get_bd_pins scheduler_cpcie_0/command_engine_1] [get_bd_pins xmatchpro_compressor_1/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_2 [get_bd_pins scheduler_cpcie_0/command_engine_2] [get_bd_pins xmatchpro_compressor_2/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_3 [get_bd_pins scheduler_cpcie_0/command_engine_3] [get_bd_pins xmatchpro_compressor_3/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_4 [get_bd_pins scheduler_cpcie_1/command_engine_0] [get_bd_pins xmatchpro_decompressor_0/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_5 [get_bd_pins scheduler_cpcie_1/command_engine_1] [get_bd_pins xmatchpro_decompressor_1/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_6 [get_bd_pins scheduler_cpcie_1/command_engine_2] [get_bd_pins xmatchpro_decompressor_2/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_command_engine_7 [get_bd_pins scheduler_cpcie_1/command_engine_3] [get_bd_pins xmatchpro_decompressor_3/COMMAND]
  connect_bd_net -net scheduler_cpcie_0_compressed_size [get_bd_pins mCompressor_0/S_C_SIZE] [get_bd_pins scheduler_cpcie_0/compressed_size]
  connect_bd_net -net scheduler_cpcie_0_compressed_size_engine_0 [get_bd_pins scheduler_cpcie_1/compressed_size_engine_0] [get_bd_pins xmatchpro_decompressor_0/COMPRESSED_SIZE]
  connect_bd_net -net scheduler_cpcie_0_compressed_size_engine_1 [get_bd_pins scheduler_cpcie_1/compressed_size_engine_1] [get_bd_pins xmatchpro_decompressor_1/COMPRESSED_SIZE]
  connect_bd_net -net scheduler_cpcie_0_compressed_size_engine_2 [get_bd_pins scheduler_cpcie_1/compressed_size_engine_2] [get_bd_pins xmatchpro_decompressor_2/COMPRESSED_SIZE]
  connect_bd_net -net scheduler_cpcie_0_compressed_size_engine_3 [get_bd_pins scheduler_cpcie_1/compressed_size_engine_3] [get_bd_pins xmatchpro_decompressor_3/COMPRESSED_SIZE]
  connect_bd_net -net scheduler_cpcie_0_join_suppress [get_bd_pins axis_switch_1/s_req_suppress] [get_bd_pins scheduler_cpcie_0/join_suppress]
  connect_bd_net -net scheduler_cpcie_0_join_suppress1 [get_bd_pins scheduler_cpcie_1/join_suppress] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net scheduler_cpcie_0_status [get_bd_pins mCompressor_0/S_STATUS] [get_bd_pins scheduler_cpcie_0/status]
  connect_bd_net -net scheduler_cpcie_1_status [get_bd_pins mDecompressor_0/S_C_SIZE] [get_bd_pins mDecompressor_0/S_STATUS] [get_bd_pins scheduler_cpcie_1/status]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins scheduler_cpcie_0/s_axis_header_tdata] [get_bd_pins scheduler_cpcie_0/s_axis_header_tvalid] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_0_dout1 [get_bd_pins scheduler_cpcie_1/filesize_u] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins axis_switch_3/s_req_suppress] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xmatchpro_compressor_0_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_0] [get_bd_pins xmatchpro_compressor_0/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_0_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_0] [get_bd_pins xmatchpro_compressor_0/STATUS]
  connect_bd_net -net xmatchpro_compressor_1_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_1] [get_bd_pins xmatchpro_compressor_1/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_1_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_1] [get_bd_pins xmatchpro_compressor_1/STATUS]
  connect_bd_net -net xmatchpro_compressor_2_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_2] [get_bd_pins xmatchpro_compressor_2/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_2_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_2] [get_bd_pins xmatchpro_compressor_2/STATUS]
  connect_bd_net -net xmatchpro_compressor_3_CRC_32_C [get_bd_pins scheduler_cpcie_0/crc_engine_3] [get_bd_pins xmatchpro_compressor_3/CRC_32_C]
  connect_bd_net -net xmatchpro_compressor_3_STATUS [get_bd_pins scheduler_cpcie_0/status_engine_3] [get_bd_pins xmatchpro_compressor_3/STATUS]
  connect_bd_net -net xmatchpro_decompressor_0_CRC_32_D [get_bd_pins scheduler_cpcie_1/crc_engine_0] [get_bd_pins xmatchpro_decompressor_0/CRC_32_D]
  connect_bd_net -net xmatchpro_decompressor_0_STATUS [get_bd_pins scheduler_cpcie_1/status_engine_0] [get_bd_pins xmatchpro_decompressor_0/STATUS]
  connect_bd_net -net xmatchpro_decompressor_1_CRC_32_D [get_bd_pins scheduler_cpcie_1/crc_engine_1] [get_bd_pins xmatchpro_decompressor_1/CRC_32_D]
  connect_bd_net -net xmatchpro_decompressor_1_STATUS [get_bd_pins scheduler_cpcie_1/status_engine_1] [get_bd_pins xmatchpro_decompressor_1/STATUS]
  connect_bd_net -net xmatchpro_decompressor_2_CRC_32_D [get_bd_pins scheduler_cpcie_1/crc_engine_2] [get_bd_pins xmatchpro_decompressor_2/CRC_32_D]
  connect_bd_net -net xmatchpro_decompressor_2_STATUS [get_bd_pins scheduler_cpcie_1/status_engine_2] [get_bd_pins xmatchpro_decompressor_2/STATUS]
  connect_bd_net -net xmatchpro_decompressor_3_CRC_32_D [get_bd_pins scheduler_cpcie_1/crc_engine_3] [get_bd_pins xmatchpro_decompressor_3/CRC_32_D]
  connect_bd_net -net xmatchpro_decompressor_3_STATUS [get_bd_pins scheduler_cpcie_1/status_engine_3] [get_bd_pins xmatchpro_decompressor_3/STATUS]

  # Create address segments
  create_bd_addr_seg -range 0x2000 -offset 0xC0000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x8000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x8000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mCompressor_0/S00_AXI/S00_AXI_reg] SEG_mCompressor_0_S00_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mDecompressor_0/S00_AXI/S00_AXI_reg] SEG_mDecompressor_0_S00_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/s_axi/Reg] SEG_microblaze_0_axi_intc_Reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


