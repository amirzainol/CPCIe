
################################################################
# This is a generated script based on design: mysystem2
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
# source mysystem2_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7vx485tffg1761-2
#    set_property BOARD_PART xilinx.com:vc707:part0:1.1 [current_project]


# CHANGE DESIGN NAME HERE
set design_name mysystem2

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

# Hierarchical cell: DecompressorSystem
proc create_hier_cell_DecompressorSystem { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_DecompressorSystem() - Empty argument(s)!"
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -from 0 -to 0 -type rst aresetn

  # Create instance: axi_d_scheduler_0, and set properties
  set axi_d_scheduler_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:axi_d_scheduler:1.0 axi_d_scheduler_0 ]

  # Create instance: engine_join_switch_d, and set properties
  set engine_join_switch_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 engine_join_switch_d ]
  set_property -dict [ list CONFIG.ARB_ALGORITHM {1} CONFIG.ARB_ON_MAX_XFERS {0} CONFIG.ARB_ON_TLAST {1} CONFIG.HAS_TLAST {1} CONFIG.NUM_SI {4} CONFIG.TDATA_NUM_BYTES {4}  ] $engine_join_switch_d

  # Create instance: header_fifo_d, and set properties
  set header_fifo_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 header_fifo_d ]
  set_property -dict [ list CONFIG.TDATA_NUM_BYTES {4}  ] $header_fifo_d

  # Create instance: output_stream_d, and set properties
  set output_stream_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 output_stream_d ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {4096} CONFIG.HAS_TKEEP {0} CONFIG.HAS_TLAST {1} CONFIG.TDATA_NUM_BYTES {4}  ] $output_stream_d

  # Create instance: split_switch_d, and set properties
  set split_switch_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 split_switch_d ]
  set_property -dict [ list CONFIG.DECODER_REG {1} CONFIG.HAS_TLAST {1} CONFIG.NUM_MI {4} CONFIG.NUM_SI {1} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {4} CONFIG.TUSER_WIDTH {21}  ] $split_switch_d

  # Create instance: xlconstant_0_d, and set properties
  set xlconstant_0_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0_d ]
  set_property -dict [ list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {32}  ] $xlconstant_0_d

  # Create instance: xlconstant_1_d, and set properties
  set xlconstant_1_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1_d ]
  set_property -dict [ list CONFIG.CONST_VAL {65535} CONFIG.CONST_WIDTH {16}  ] $xlconstant_1_d

  # Create instance: xmatchpro_decompressor_engine_0, and set properties
  set xmatchpro_decompressor_engine_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor_engine:1.0 xmatchpro_decompressor_engine_0 ]

  # Create instance: xmatchpro_decompressor_engine_1, and set properties
  set xmatchpro_decompressor_engine_1 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor_engine:1.0 xmatchpro_decompressor_engine_1 ]

  # Create instance: xmatchpro_decompressor_engine_2, and set properties
  set xmatchpro_decompressor_engine_2 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor_engine:1.0 xmatchpro_decompressor_engine_2 ]

  # Create instance: xmatchpro_decompressor_engine_3, and set properties
  set xmatchpro_decompressor_engine_3 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_decompressor_engine:1.0 xmatchpro_decompressor_engine_3 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_d_scheduler_0_AXIS_SPLIT_SWITCH [get_bd_intf_pins axi_d_scheduler_0/AXIS_SPLIT_SWITCH] [get_bd_intf_pins split_switch_d/S00_AXIS]
  connect_bd_intf_net -intf_net axi_d_scheduler_0_HEADER_OUT [get_bd_intf_pins axi_d_scheduler_0/HEADER_OUT] [get_bd_intf_pins header_fifo_d/S_AXIS]
  connect_bd_intf_net -intf_net axi_d_scheduler_0_OUTPUT_STREAM [get_bd_intf_pins axi_d_scheduler_0/OUTPUT_STREAM] [get_bd_intf_pins output_stream_d/S_AXIS]
  connect_bd_intf_net -intf_net axi_dma_sdram2fifo_d_M_AXIS_MM2S [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axi_d_scheduler_0/INPUT_STREAM]
  connect_bd_intf_net -intf_net axis_data_fifo_c1_M_AXIS [get_bd_intf_pins M_AXIS] [get_bd_intf_pins output_stream_d/M_AXIS]
  connect_bd_intf_net -intf_net engine_join_switch_d_M00_AXIS [get_bd_intf_pins axi_d_scheduler_0/AXIS_JOIN_SWITCH] [get_bd_intf_pins engine_join_switch_d/M00_AXIS]
  connect_bd_intf_net -intf_net header_fifo_d_M_AXIS [get_bd_intf_pins axi_d_scheduler_0/HEADER_IN] [get_bd_intf_pins header_fifo_d/M_AXIS]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_d_scheduler_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net split_switch_d_M00_AXIS [get_bd_intf_pins split_switch_d/M00_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_0/s00_axis]
  connect_bd_intf_net -intf_net split_switch_d_M01_AXIS [get_bd_intf_pins split_switch_d/M01_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_1/s00_axis]
  connect_bd_intf_net -intf_net split_switch_d_M02_AXIS [get_bd_intf_pins split_switch_d/M02_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_2/s00_axis]
  connect_bd_intf_net -intf_net split_switch_d_M03_AXIS [get_bd_intf_pins split_switch_d/M03_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_3/s00_axis]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_engine_0_m00_axis [get_bd_intf_pins engine_join_switch_d/S00_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_0/m00_axis]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_engine_1_m00_axis1 [get_bd_intf_pins engine_join_switch_d/S01_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_1/m00_axis]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_engine_2_m00_axis [get_bd_intf_pins engine_join_switch_d/S02_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_2/m00_axis]
  connect_bd_intf_net -intf_net xmatchpro_decompressor_engine_3_m00_axis [get_bd_intf_pins engine_join_switch_d/S03_AXIS] [get_bd_intf_pins xmatchpro_decompressor_engine_3/m00_axis]

  # Create port connections
  connect_bd_net -net axi_d_scheduler_0_command [get_bd_pins axi_d_scheduler_0/command] [get_bd_pins xmatchpro_decompressor_engine_0/command] [get_bd_pins xmatchpro_decompressor_engine_1/command] [get_bd_pins xmatchpro_decompressor_engine_2/command] [get_bd_pins xmatchpro_decompressor_engine_3/command]
  connect_bd_net -net axi_d_scheduler_0_join_suppress [get_bd_pins axi_d_scheduler_0/join_suppress] [get_bd_pins engine_join_switch_d/s_req_suppress]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins aclk] [get_bd_pins axi_d_scheduler_0/axis_join_switch_aclk] [get_bd_pins axi_d_scheduler_0/axis_split_switch_aclk] [get_bd_pins axi_d_scheduler_0/header_in_aclk] [get_bd_pins axi_d_scheduler_0/header_out_aclk] [get_bd_pins axi_d_scheduler_0/input_stream_aclk] [get_bd_pins axi_d_scheduler_0/output_stream_aclk] [get_bd_pins axi_d_scheduler_0/s_axi_lite_aclk] [get_bd_pins engine_join_switch_d/aclk] [get_bd_pins header_fifo_d/s_axis_aclk] [get_bd_pins output_stream_d/s_axis_aclk] [get_bd_pins split_switch_d/aclk] [get_bd_pins xmatchpro_decompressor_engine_0/m00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_0/s00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_0/xpro_aclk] [get_bd_pins xmatchpro_decompressor_engine_1/m00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_1/s00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_1/xpro_aclk] [get_bd_pins xmatchpro_decompressor_engine_2/m00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_2/s00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_2/xpro_aclk] [get_bd_pins xmatchpro_decompressor_engine_3/m00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_3/s00_axis_aclk] [get_bd_pins xmatchpro_decompressor_engine_3/xpro_aclk]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn1 [get_bd_pins aresetn] [get_bd_pins axi_d_scheduler_0/axis_join_switch_aresetn] [get_bd_pins axi_d_scheduler_0/axis_split_switch_aresetn] [get_bd_pins axi_d_scheduler_0/header_in_aresetn] [get_bd_pins axi_d_scheduler_0/header_out_aresetn] [get_bd_pins axi_d_scheduler_0/input_stream_aresetn] [get_bd_pins axi_d_scheduler_0/output_stream_aresetn] [get_bd_pins axi_d_scheduler_0/s_axi_lite_aresetn] [get_bd_pins engine_join_switch_d/aresetn] [get_bd_pins header_fifo_d/s_axis_aresetn] [get_bd_pins output_stream_d/s_axis_aresetn] [get_bd_pins split_switch_d/aresetn] [get_bd_pins xmatchpro_decompressor_engine_0/m00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_0/s00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_0/xpro_aresetn] [get_bd_pins xmatchpro_decompressor_engine_1/m00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_1/s00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_1/xpro_aresetn] [get_bd_pins xmatchpro_decompressor_engine_2/m00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_2/s00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_2/xpro_aresetn] [get_bd_pins xmatchpro_decompressor_engine_3/m00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_3/s00_axis_aresetn] [get_bd_pins xmatchpro_decompressor_engine_3/xpro_aresetn]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axi_d_scheduler_0/command_in] [get_bd_pins xlconstant_0_d/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins axi_d_scheduler_0/engine_ready_in] [get_bd_pins xlconstant_1_d/dout]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: CompressorSystem
proc create_hier_cell_CompressorSystem { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_CompressorSystem() - Empty argument(s)!"
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -from 0 -to 0 -type rst aresetn

  # Create instance: axi_c_scheduler_0, and set properties
  set axi_c_scheduler_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:axi_c_scheduler:1.0 axi_c_scheduler_0 ]

  # Create instance: engine_join_switch_c, and set properties
  set engine_join_switch_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 engine_join_switch_c ]
  set_property -dict [ list CONFIG.ARB_ON_MAX_XFERS {0} CONFIG.ARB_ON_TLAST {1} CONFIG.HAS_TLAST {1} CONFIG.NUM_SI {4} CONFIG.TDATA_NUM_BYTES {4}  ] $engine_join_switch_c

  # Create instance: header_fifo_c, and set properties
  set header_fifo_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 header_fifo_c ]
  set_property -dict [ list CONFIG.HAS_TLAST {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3} CONFIG.TDATA_NUM_BYTES {4}  ] $header_fifo_c

  # Create instance: header_join_switch_c, and set properties
  set header_join_switch_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 header_join_switch_c ]
  set_property -dict [ list CONFIG.ARB_ON_MAX_XFERS {0} CONFIG.ARB_ON_TLAST {1} CONFIG.HAS_TLAST {1} CONFIG.NUM_SI {4} CONFIG.TDATA_NUM_BYTES {4}  ] $header_join_switch_c

  # Create instance: input_stream_c, and set properties
  set input_stream_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 input_stream_c ]
  set_property -dict [ list CONFIG.HAS_TLAST {1} CONFIG.TDATA_NUM_BYTES {4}  ] $input_stream_c

  # Create instance: output_stream_fifo_c, and set properties
  set output_stream_fifo_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 output_stream_fifo_c ]
  set_property -dict [ list CONFIG.HAS_TLAST {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3} CONFIG.TDATA_NUM_BYTES {4}  ] $output_stream_fifo_c

  # Create instance: output_switch_c, and set properties
  set output_switch_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 output_switch_c ]
  set_property -dict [ list CONFIG.ARB_ALGORITHM {1} CONFIG.ARB_ON_MAX_XFERS {1024} CONFIG.ARB_ON_NUM_CYCLES {64} CONFIG.ARB_ON_TLAST {0} CONFIG.HAS_TLAST {1} CONFIG.NUM_SI {2} CONFIG.TDATA_NUM_BYTES {4}  ] $output_switch_c

  # Create instance: split_switch_c, and set properties
  set split_switch_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 split_switch_c ]
  set_property -dict [ list CONFIG.DECODER_REG {1} CONFIG.HAS_TLAST {1} CONFIG.NUM_MI {4} CONFIG.NUM_SI {1} CONFIG.TDATA_NUM_BYTES {4} CONFIG.TDEST_WIDTH {4}  ] $split_switch_c

  # Create instance: xlconstant_0_c, and set properties
  set xlconstant_0_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0_c ]
  set_property -dict [ list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {32}  ] $xlconstant_0_c

  # Create instance: xmatchpro_compressor_engine_0, and set properties
  set xmatchpro_compressor_engine_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor_engine:1.0 xmatchpro_compressor_engine_0 ]

  # Create instance: xmatchpro_compressor_engine_1, and set properties
  set xmatchpro_compressor_engine_1 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor_engine:1.0 xmatchpro_compressor_engine_1 ]

  # Create instance: xmatchpro_compressor_engine_2, and set properties
  set xmatchpro_compressor_engine_2 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor_engine:1.0 xmatchpro_compressor_engine_2 ]

  # Create instance: xmatchpro_compressor_engine_3, and set properties
  set xmatchpro_compressor_engine_3 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xmatchpro_compressor_engine:1.0 xmatchpro_compressor_engine_3 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_c_scheduler_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS] [get_bd_intf_pins output_stream_fifo_c/M_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins input_stream_c/S_AXIS]
  connect_bd_intf_net -intf_net axi_c_scheduler_0_AXIS_SPLIT_SWITCH [get_bd_intf_pins axi_c_scheduler_0/AXIS_SPLIT_SWITCH] [get_bd_intf_pins split_switch_c/S00_AXIS]
  connect_bd_intf_net -intf_net axi_c_scheduler_0_HEADER_OUT [get_bd_intf_pins axi_c_scheduler_0/HEADER_OUT] [get_bd_intf_pins output_switch_c/S01_AXIS]
  connect_bd_intf_net -intf_net axi_c_scheduler_0_OUTPUT_STREAM [get_bd_intf_pins axi_c_scheduler_0/OUTPUT_STREAM] [get_bd_intf_pins output_switch_c/S00_AXIS]
  connect_bd_intf_net -intf_net engine_join_switch_M00_AXIS [get_bd_intf_pins axi_c_scheduler_0/AXIS_JOIN_SWITCH] [get_bd_intf_pins engine_join_switch_c/M00_AXIS]
  connect_bd_intf_net -intf_net header_join_fifo_M_AXIS [get_bd_intf_pins axi_c_scheduler_0/HEADER_IN] [get_bd_intf_pins header_fifo_c/M_AXIS]
  connect_bd_intf_net -intf_net header_join_switch_M00_AXIS [get_bd_intf_pins header_fifo_c/S_AXIS] [get_bd_intf_pins header_join_switch_c/M00_AXIS]
  connect_bd_intf_net -intf_net input_stream_M_AXIS [get_bd_intf_pins axi_c_scheduler_0/INPUT_STREAM] [get_bd_intf_pins input_stream_c/M_AXIS]
  connect_bd_intf_net -intf_net output_switch_M00_AXIS [get_bd_intf_pins output_stream_fifo_c/S_AXIS] [get_bd_intf_pins output_switch_c/M00_AXIS]
  connect_bd_intf_net -intf_net split_switch_M00_AXIS [get_bd_intf_pins split_switch_c/M00_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_0/s00_axis]
  connect_bd_intf_net -intf_net split_switch_M01_AXIS [get_bd_intf_pins split_switch_c/M01_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_1/s00_axis]
  connect_bd_intf_net -intf_net split_switch_M02_AXIS [get_bd_intf_pins split_switch_c/M02_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_2/s00_axis]
  connect_bd_intf_net -intf_net split_switch_M03_AXIS [get_bd_intf_pins split_switch_c/M03_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_3/s00_axis]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_0_m00_axis [get_bd_intf_pins engine_join_switch_c/S00_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_0/m00_axis]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_0_m_axis_h [get_bd_intf_pins header_join_switch_c/S00_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_0/m_axis_h]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_1_m00_axis [get_bd_intf_pins engine_join_switch_c/S01_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_1/m00_axis]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_1_m_axis_h [get_bd_intf_pins header_join_switch_c/S01_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_1/m_axis_h]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_2_m00_axis [get_bd_intf_pins engine_join_switch_c/S02_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_2/m00_axis]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_2_m_axis_h [get_bd_intf_pins header_join_switch_c/S02_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_2/m_axis_h]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_3_m00_axis [get_bd_intf_pins engine_join_switch_c/S03_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_3/m00_axis]
  connect_bd_intf_net -intf_net xmatchpro_compressor_engine_3_m_axis_h [get_bd_intf_pins header_join_switch_c/S03_AXIS] [get_bd_intf_pins xmatchpro_compressor_engine_3/m_axis_h]

  # Create port connections
  connect_bd_net -net axi_c_scheduler_0_command [get_bd_pins axi_c_scheduler_0/command] [get_bd_pins xmatchpro_compressor_engine_0/command] [get_bd_pins xmatchpro_compressor_engine_1/command] [get_bd_pins xmatchpro_compressor_engine_2/command] [get_bd_pins xmatchpro_compressor_engine_3/command]
  connect_bd_net -net axi_c_scheduler_0_join_suppress [get_bd_pins axi_c_scheduler_0/join_suppress] [get_bd_pins output_switch_c/s_req_suppress]
  connect_bd_net -net s_axis_aclk_1 [get_bd_pins aclk] [get_bd_pins axi_c_scheduler_0/axis_join_switch_aclk] [get_bd_pins axi_c_scheduler_0/axis_split_switch_aclk] [get_bd_pins axi_c_scheduler_0/header_in_aclk] [get_bd_pins axi_c_scheduler_0/header_out_aclk] [get_bd_pins axi_c_scheduler_0/input_stream_aclk] [get_bd_pins axi_c_scheduler_0/output_stream_aclk] [get_bd_pins axi_c_scheduler_0/s_axi_lite_aclk] [get_bd_pins engine_join_switch_c/aclk] [get_bd_pins header_fifo_c/m_axis_aclk] [get_bd_pins header_fifo_c/s_axis_aclk] [get_bd_pins header_join_switch_c/aclk] [get_bd_pins input_stream_c/s_axis_aclk] [get_bd_pins output_stream_fifo_c/m_axis_aclk] [get_bd_pins output_stream_fifo_c/s_axis_aclk] [get_bd_pins output_switch_c/aclk] [get_bd_pins split_switch_c/aclk] [get_bd_pins xmatchpro_compressor_engine_0/m00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_0/m_axis_h_aclk] [get_bd_pins xmatchpro_compressor_engine_0/s00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_0/xpro_aclk] [get_bd_pins xmatchpro_compressor_engine_1/m00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_1/m_axis_h_aclk] [get_bd_pins xmatchpro_compressor_engine_1/s00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_1/xpro_aclk] [get_bd_pins xmatchpro_compressor_engine_2/m00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_2/m_axis_h_aclk] [get_bd_pins xmatchpro_compressor_engine_2/s00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_2/xpro_aclk] [get_bd_pins xmatchpro_compressor_engine_3/m00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_3/m_axis_h_aclk] [get_bd_pins xmatchpro_compressor_engine_3/s00_axis_aclk] [get_bd_pins xmatchpro_compressor_engine_3/xpro_aclk]
  connect_bd_net -net s_axis_aresetn_1 [get_bd_pins aresetn] [get_bd_pins axi_c_scheduler_0/axis_join_switch_aresetn] [get_bd_pins axi_c_scheduler_0/axis_split_switch_aresetn] [get_bd_pins axi_c_scheduler_0/header_in_aresetn] [get_bd_pins axi_c_scheduler_0/header_out_aresetn] [get_bd_pins axi_c_scheduler_0/input_stream_aresetn] [get_bd_pins axi_c_scheduler_0/output_stream_aresetn] [get_bd_pins axi_c_scheduler_0/s_axi_lite_aresetn] [get_bd_pins engine_join_switch_c/aresetn] [get_bd_pins header_fifo_c/m_axis_aresetn] [get_bd_pins header_fifo_c/s_axis_aresetn] [get_bd_pins header_join_switch_c/aresetn] [get_bd_pins input_stream_c/s_axis_aresetn] [get_bd_pins output_stream_fifo_c/m_axis_aresetn] [get_bd_pins output_stream_fifo_c/s_axis_aresetn] [get_bd_pins output_switch_c/aresetn] [get_bd_pins split_switch_c/aresetn] [get_bd_pins xmatchpro_compressor_engine_0/m00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_0/m_axis_h_aresetn] [get_bd_pins xmatchpro_compressor_engine_0/s00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_0/xpro_aresetn] [get_bd_pins xmatchpro_compressor_engine_1/m00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_1/m_axis_h_aresetn] [get_bd_pins xmatchpro_compressor_engine_1/s00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_1/xpro_aresetn] [get_bd_pins xmatchpro_compressor_engine_2/m00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_2/m_axis_h_aresetn] [get_bd_pins xmatchpro_compressor_engine_2/s00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_2/xpro_aresetn] [get_bd_pins xmatchpro_compressor_engine_3/m00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_3/m_axis_h_aresetn] [get_bd_pins xmatchpro_compressor_engine_3/s00_axis_aresetn] [get_bd_pins xmatchpro_compressor_engine_3/xpro_aresetn]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axi_c_scheduler_0/in_command] [get_bd_pins axi_c_scheduler_0/in_filesize] [get_bd_pins xlconstant_0_c/dout]
  
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

  # Create instance: CompressorSystem
  create_hier_cell_CompressorSystem [current_bd_instance .] CompressorSystem

  # Create instance: DecompressorSystem
  create_hier_cell_DecompressorSystem [current_bd_instance .] DecompressorSystem

  # Create instance: axi_dma_fifo2sdram_c, and set properties
  set axi_dma_fifo2sdram_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_fifo2sdram_c ]
  set_property -dict [ list CONFIG.c_include_mm2s {0} CONFIG.c_include_sg {0} CONFIG.c_s2mm_burst_size {256} CONFIG.c_sg_length_width {23}  ] $axi_dma_fifo2sdram_c

  # Create instance: axi_dma_fifo2sdram_d, and set properties
  set axi_dma_fifo2sdram_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_fifo2sdram_d ]
  set_property -dict [ list CONFIG.c_include_mm2s {0} CONFIG.c_include_s2mm {1} CONFIG.c_include_sg {0} CONFIG.c_s2mm_burst_size {256} CONFIG.c_sg_length_width {23}  ] $axi_dma_fifo2sdram_d

  # Create instance: axi_dma_sdram2fifo_c, and set properties
  set axi_dma_sdram2fifo_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_sdram2fifo_c ]
  set_property -dict [ list CONFIG.c_include_mm2s {1} CONFIG.c_include_s2mm {0} CONFIG.c_include_sg {0} CONFIG.c_mm2s_burst_size {256} CONFIG.c_sg_length_width {23}  ] $axi_dma_sdram2fifo_c

  # Create instance: axi_dma_sdram2fifo_d, and set properties
  set axi_dma_sdram2fifo_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_sdram2fifo_d ]
  set_property -dict [ list CONFIG.c_include_s2mm {0} CONFIG.c_include_sg {0} CONFIG.c_mm2s_burst_size {256} CONFIG.c_sg_length_width {23}  ] $axi_dma_sdram2fifo_d

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list CONFIG.NUM_MI {1} CONFIG.NUM_SI {6}  ] $axi_mem_intercon

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list CONFIG.C_BAUDRATE {115200} CONFIG.UARTLITE_BOARD_INTERFACE {rs232_uart} CONFIG.USE_BOARD_FLOW {true}  ] $axi_uartlite_0

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.4 microblaze_0 ]
  set_property -dict [ list CONFIG.C_CACHE_BYTE_SIZE {16384} CONFIG.C_DCACHE_BYTE_SIZE {16384} CONFIG.C_DEBUG_ENABLED {1} CONFIG.C_D_AXI {1} CONFIG.C_D_LMB {1} CONFIG.C_I_LMB {1} CONFIG.C_USE_DCACHE {1} CONFIG.C_USE_ICACHE {1}  ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list CONFIG.C_HAS_FAST {1}  ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list CONFIG.NUM_MI {8}  ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:2.3 mig_7series_0 ]
  set_property -dict [ list CONFIG.BOARD_MIG_PARAM {ddr3_sdram} CONFIG.RESET_BOARD_INTERFACE {reset}  ] $mig_7series_0

  # Create instance: rst_mig_7series_0_100M, and set properties
  set rst_mig_7series_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net CompressorSystem_M_AXIS [get_bd_intf_pins CompressorSystem/M_AXIS] [get_bd_intf_pins axi_dma_fifo2sdram_c/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net DecompressorSystem_M_AXIS [get_bd_intf_pins DecompressorSystem/M_AXIS] [get_bd_intf_pins axi_dma_fifo2sdram_d/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net axi_dma_fifo2sdram_c_M_AXI_S2MM [get_bd_intf_pins axi_dma_fifo2sdram_c/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_fifo2sdram_d_M_AXI_S2MM [get_bd_intf_pins axi_dma_fifo2sdram_d/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S03_AXI]
  connect_bd_intf_net -intf_net axi_dma_sdram2fifo_c_M_AXIS_MM2S [get_bd_intf_pins CompressorSystem/S_AXIS] [get_bd_intf_pins axi_dma_sdram2fifo_c/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_sdram2fifo_c_M_AXI_MM2S [get_bd_intf_pins axi_dma_sdram2fifo_c/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon/S04_AXI]
  connect_bd_intf_net -intf_net axi_dma_sdram2fifo_d_M_AXIS_MM2S [get_bd_intf_pins DecompressorSystem/S_AXIS] [get_bd_intf_pins axi_dma_sdram2fifo_d/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_sdram2fifo_d_M_AXI_MM2S [get_bd_intf_pins axi_dma_sdram2fifo_d/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon/S05_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI1 [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART1 [get_bd_intf_ports rs232_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC1 [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC1 [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp_2 [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI1 [get_bd_intf_pins CompressorSystem/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins DecompressorSystem/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_dma_fifo2sdram_c/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins axi_dma_fifo2sdram_d/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins axi_dma_sdram2fifo_c/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M06_AXI [get_bd_intf_pins axi_dma_sdram2fifo_d/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M07_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug_2 [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_2 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_2 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi_2 [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt_2 [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net mig_7series_0_DDR4 [get_bd_intf_ports ddr3_sdram] [get_bd_intf_pins mig_7series_0/DDR3]
  connect_bd_intf_net -intf_net sys_diff_clock_1 [get_bd_intf_ports sys_diff_clock] [get_bd_intf_pins mig_7series_0/SYS_CLK]

  # Create port connections
  connect_bd_net -net axi_uartlite_0_interrupt1 [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net mdm_1_debug_sys_rst_2 [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_mig_7series_0_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk_1 [get_bd_pins CompressorSystem/aclk] [get_bd_pins DecompressorSystem/aclk] [get_bd_pins axi_dma_fifo2sdram_c/m_axi_s2mm_aclk] [get_bd_pins axi_dma_fifo2sdram_c/s_axi_lite_aclk] [get_bd_pins axi_dma_fifo2sdram_d/m_axi_s2mm_aclk] [get_bd_pins axi_dma_fifo2sdram_d/s_axi_lite_aclk] [get_bd_pins axi_dma_sdram2fifo_c/m_axi_mm2s_aclk] [get_bd_pins axi_dma_sdram2fifo_c/s_axi_lite_aclk] [get_bd_pins axi_dma_sdram2fifo_d/m_axi_mm2s_aclk] [get_bd_pins axi_dma_sdram2fifo_d/s_axi_lite_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins axi_mem_intercon/S03_ACLK] [get_bd_pins axi_mem_intercon/S04_ACLK] [get_bd_pins axi_mem_intercon/S05_ACLK] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins mig_7series_0/ui_clk] [get_bd_pins rst_mig_7series_0_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_0_intr_2 [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net mig_7series_0_mmcm_locked1 [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins rst_mig_7series_0_100M/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst1 [get_bd_pins mig_7series_0/ui_clk_sync_rst] [get_bd_pins rst_mig_7series_0_100M/ext_reset_in]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins mig_7series_0/sys_rst]
  connect_bd_net -net rst_mig_7series_0_100M_bus_struct_reset1 [get_bd_pins microblaze_0_local_memory/LMB_Rst] [get_bd_pins rst_mig_7series_0_100M/bus_struct_reset]
  connect_bd_net -net rst_mig_7series_0_100M_interconnect_aresetn1 [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_mig_7series_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_mig_7series_0_100M_mb_reset1 [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_mig_7series_0_100M/mb_reset]
  connect_bd_net -net rst_mig_7series_0_100M_peripheral_aresetn1 [get_bd_pins CompressorSystem/aresetn] [get_bd_pins DecompressorSystem/aresetn] [get_bd_pins axi_dma_fifo2sdram_c/axi_resetn] [get_bd_pins axi_dma_fifo2sdram_d/axi_resetn] [get_bd_pins axi_dma_sdram2fifo_c/axi_resetn] [get_bd_pins axi_dma_sdram2fifo_d/axi_resetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins axi_mem_intercon/S03_ARESETN] [get_bd_pins axi_mem_intercon/S04_ARESETN] [get_bd_pins axi_mem_intercon/S05_ARESETN] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins rst_mig_7series_0_100M/peripheral_aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_fifo2sdram_c/Data_S2MM] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_fifo2sdram_d/Data_S2MM] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_sdram2fifo_c/Data_MM2S] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_sdram2fifo_d/Data_MM2S] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs CompressorSystem/axi_c_scheduler_0/S_AXI_LITE/S_AXI_LITE_reg] SEG_axi_c_scheduler_0_S_AXI_LITE_reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs DecompressorSystem/axi_d_scheduler_0/S_AXI_LITE/S_AXI_LITE_reg] SEG_axi_d_scheduler_0_S_AXI_LITE_reg
  create_bd_addr_seg -range 0x10000 -offset 0x41E00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_dma_fifo2sdram_c/S_AXI_LITE/Reg] SEG_axi_dma_fifo2sdram_c_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41E10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_dma_fifo2sdram_d/S_AXI_LITE/Reg] SEG_axi_dma_fifo2sdram_d_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41E20000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_dma_sdram2fifo_c/S_AXI_LITE/Reg] SEG_axi_dma_sdram2fifo_c_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41E30000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_dma_sdram2fifo_d/S_AXI_LITE/Reg] SEG_axi_dma_sdram2fifo_d_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x20000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x20000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/s_axi/Reg] SEG_microblaze_0_axi_intc_Reg
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


