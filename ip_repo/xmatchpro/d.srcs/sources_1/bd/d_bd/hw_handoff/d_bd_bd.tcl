
################################################################
# This is a generated script based on design: d_bd
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
# source d_bd_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7vx485tffg1761-2
#    set_property BOARD_PART xilinx.com:vc707:part0:1.1 [current_project]


# CHANGE DESIGN NAME HERE
set design_name d_bd

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


# Hierarchical cell: STAT
proc create_hier_cell_STAT { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_STAT() - Empty argument(s)!"
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

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 In0
  create_bd_pin -dir I -from 0 -to 0 In3
  create_bd_pin -dir I -from 0 -to 0 In6
  create_bd_pin -dir I -from 0 -to 0 In7
  create_bd_pin -dir I -from 0 -to 0 In8
  create_bd_pin -dir I -from 0 -to 0 In10
  create_bd_pin -dir I -from 0 -to 0 In11
  create_bd_pin -dir I -from 0 -to 0 In16
  create_bd_pin -dir I -from 0 -to 0 In17
  create_bd_pin -dir I -from 0 -to 0 In18
  create_bd_pin -dir I -from 0 -to 0 In19
  create_bd_pin -dir I -from 0 -to 0 Op1
  create_bd_pin -dir I -from 0 -to 0 Op2
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list CONFIG.NUM_PORTS {32}  ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {0}  ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list CONFIG.CONST_VAL {0}  ] $xlconstant_1

  # Create port connections
  connect_bd_net -net In0_1 [get_bd_pins In0] [get_bd_pins xlconcat_0/In8]
  connect_bd_net -net In10_1 [get_bd_pins In10] [get_bd_pins xlconcat_0/In10]
  connect_bd_net -net In11_1 [get_bd_pins In11] [get_bd_pins xlconcat_0/In11]
  connect_bd_net -net In16_1 [get_bd_pins In16] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net In17_1 [get_bd_pins In17] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net In18_1 [get_bd_pins In18] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net In19_1 [get_bd_pins In19] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net In3_1 [get_bd_pins In3] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net In6_1 [get_bd_pins In6] [get_bd_pins xlconcat_0/In6]
  connect_bd_net -net In7_1 [get_bd_pins In7] [get_bd_pins xlconcat_0/In7]
  connect_bd_net -net In8_1 [get_bd_pins In8] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net Op1_1 [get_bd_pins Op1] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net Op2_1 [get_bd_pins Op2] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins xlconcat_0/In9]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins util_vector_logic_1/Res] [get_bd_pins xlconcat_0/In12]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins dout] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_0/In16] [get_bd_pins xlconcat_0/In17] [get_bd_pins xlconcat_0/In18] [get_bd_pins xlconcat_0/In19] [get_bd_pins xlconcat_0/In20] [get_bd_pins xlconcat_0/In21] [get_bd_pins xlconcat_0/In22] [get_bd_pins xlconcat_0/In23] [get_bd_pins xlconcat_0/In24] [get_bd_pins xlconcat_0/In25] [get_bd_pins xlconcat_0/In26] [get_bd_pins xlconcat_0/In27] [get_bd_pins xlconcat_0/In28] [get_bd_pins xlconcat_0/In29] [get_bd_pins xlconcat_0/In30] [get_bd_pins xlconcat_0/In31] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xlconcat_0/In13] [get_bd_pins xlconcat_0/In14] [get_bd_pins xlconcat_0/In15] [get_bd_pins xlconstant_1/dout]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: FIFO_DU
proc create_hier_cell_FIFO_DU { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_FIFO_DU() - Empty argument(s)!"
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

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 Op1
  create_bd_pin -dir I -from 0 -to 0 Op2
  create_bd_pin -dir I -from 0 -to 0 Op3
  create_bd_pin -dir O -from 0 -to 0 Res
  create_bd_pin -dir O -from 31 -to 0 m_axis_tdata
  create_bd_pin -dir I m_axis_tready
  create_bd_pin -dir O m_axis_tvalid
  create_bd_pin -dir I -type clk s_axis_aclk
  create_bd_pin -dir I -from 31 -to 0 s_axis_tdata
  create_bd_pin -dir O -from 0 -to 0 s_axis_tready

  # Create instance: axis_data_fifo_du, and set properties
  set axis_data_fifo_du [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_du ]
  set_property -dict [ list CONFIG.TDATA_NUM_BYTES {4}  ] $axis_data_fifo_du

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_2

  # Create port connections
  connect_bd_net -net Op1_1 [get_bd_pins Op1] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net Op2_1 [get_bd_pins Op2] [get_bd_pins util_vector_logic_0/Op2]
  connect_bd_net -net Op3_1 [get_bd_pins Op3] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net axis_data_fifo_0_m_axis_tdata [get_bd_pins m_axis_tdata] [get_bd_pins axis_data_fifo_du/m_axis_tdata]
  connect_bd_net -net axis_data_fifo_0_m_axis_tvalid [get_bd_pins m_axis_tvalid] [get_bd_pins axis_data_fifo_du/m_axis_tvalid]
  connect_bd_net -net axis_data_fifo_0_s_axis_tready [get_bd_pins s_axis_tready] [get_bd_pins axis_data_fifo_du/s_axis_tready] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net m_axis_tready_1 [get_bd_pins m_axis_tready] [get_bd_pins axis_data_fifo_du/m_axis_tready]
  connect_bd_net -net s_axis_aclk_1 [get_bd_pins s_axis_aclk] [get_bd_pins axis_data_fifo_du/s_axis_aclk]
  connect_bd_net -net s_axis_tdata_1 [get_bd_pins s_axis_tdata] [get_bd_pins axis_data_fifo_du/s_axis_tdata]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins Res] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins axis_data_fifo_du/s_axis_tvalid] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins axis_data_fifo_du/s_axis_aresetn] [get_bd_pins util_vector_logic_2/Res]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: FIFO_DC
proc create_hier_cell_FIFO_DC { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_FIFO_DC() - Empty argument(s)!"
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

  # Create pins
  create_bd_pin -dir I -type clk CLK
  create_bd_pin -dir I -from 0 -to 0 -type data D
  create_bd_pin -dir I -from 0 -to 0 Op2
  create_bd_pin -dir I -from 0 -to 0 Op3
  create_bd_pin -dir O -from 0 -to 0 -type data Q
  create_bd_pin -dir O -from 31 -to 0 -type data Q1
  create_bd_pin -dir O -from 0 -to 0 Res
  create_bd_pin -dir O -from 0 -to 0 Res1
  create_bd_pin -dir I -from 31 -to 0 din
  create_bd_pin -dir O -from 0 -to 0 empty
  create_bd_pin -dir O -from 0 -to 0 full
  create_bd_pin -dir I rst
  create_bd_pin -dir I wr_en

  # Create instance: c_shift_ram_0, and set properties
  set c_shift_ram_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_0 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $c_shift_ram_0

  # Create instance: c_shift_ram_1, and set properties
  set c_shift_ram_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_1 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $c_shift_ram_1

  # Create instance: c_shift_ram_2, and set properties
  set c_shift_ram_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_2 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $c_shift_ram_2

  # Create instance: c_shift_ram_3, and set properties
  set c_shift_ram_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_3 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $c_shift_ram_3

  # Create instance: c_shift_ram_4, and set properties
  set c_shift_ram_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_4 ]
  set_property -dict [ list CONFIG.AsyncInitVal {00000000000000000000000000000000} CONFIG.CE {true} CONFIG.DefaultData {00000000000000000000000000000000} CONFIG.Depth {1} CONFIG.Width {32}  ] $c_shift_ram_4

  # Create instance: c_shift_ram_6, and set properties
  set c_shift_ram_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_6 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $c_shift_ram_6

  # Create instance: fifo_generator_0, and set properties
  set fifo_generator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:12.0 fifo_generator_0 ]
  set_property -dict [ list CONFIG.Input_Data_Width {32}  ] $fifo_generator_0

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_2

  # Create instance: util_vector_logic_3, and set properties
  set util_vector_logic_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_3 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_3

  # Create instance: util_vector_logic_5, and set properties
  set util_vector_logic_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_5 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_5

  # Create instance: util_vector_logic_6, and set properties
  set util_vector_logic_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_6 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_6

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_pins CLK] [get_bd_pins c_shift_ram_0/CLK] [get_bd_pins c_shift_ram_1/CLK] [get_bd_pins c_shift_ram_2/CLK] [get_bd_pins c_shift_ram_3/CLK] [get_bd_pins c_shift_ram_4/CLK] [get_bd_pins c_shift_ram_6/CLK] [get_bd_pins fifo_generator_0/clk]
  connect_bd_net -net D_1 [get_bd_pins D] [get_bd_pins c_shift_ram_0/D]
  connect_bd_net -net Op2_1 [get_bd_pins Op2] [get_bd_pins util_vector_logic_2/Op2] [get_bd_pins util_vector_logic_5/Op2]
  connect_bd_net -net Op3_1 [get_bd_pins Op3] [get_bd_pins util_vector_logic_0/Op2]
  connect_bd_net -net c_shift_ram_0_Q [get_bd_pins Q] [get_bd_pins c_shift_ram_0/Q]
  connect_bd_net -net c_shift_ram_1_Q [get_bd_pins c_shift_ram_1/Q] [get_bd_pins c_shift_ram_2/D]
  connect_bd_net -net c_shift_ram_2_Q [get_bd_pins c_shift_ram_2/Q] [get_bd_pins c_shift_ram_3/D]
  connect_bd_net -net c_shift_ram_3_Q [get_bd_pins c_shift_ram_3/Q] [get_bd_pins util_vector_logic_6/Op1]
  connect_bd_net -net c_shift_ram_4_Q [get_bd_pins Q1] [get_bd_pins c_shift_ram_4/Q]
  connect_bd_net -net c_shift_ram_6_Q [get_bd_pins c_shift_ram_6/Q] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net din_1 [get_bd_pins din] [get_bd_pins fifo_generator_0/din]
  connect_bd_net -net fifo_generator_0_dout [get_bd_pins c_shift_ram_4/D] [get_bd_pins fifo_generator_0/dout]
  connect_bd_net -net fifo_generator_0_empty [get_bd_pins empty] [get_bd_pins c_shift_ram_1/D] [get_bd_pins fifo_generator_0/empty] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net fifo_generator_0_full [get_bd_pins full] [get_bd_pins fifo_generator_0/full] [get_bd_pins util_vector_logic_3/Op1]
  connect_bd_net -net rst_1 [get_bd_pins rst] [get_bd_pins fifo_generator_0/rst]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins Res] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins util_vector_logic_1/Res] [get_bd_pins util_vector_logic_5/Op1]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins c_shift_ram_4/CE] [get_bd_pins fifo_generator_0/rd_en] [get_bd_pins util_vector_logic_2/Res]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins Res1] [get_bd_pins util_vector_logic_3/Res]
  connect_bd_net -net util_vector_logic_5_Res [get_bd_pins c_shift_ram_6/D] [get_bd_pins util_vector_logic_5/Res]
  connect_bd_net -net util_vector_logic_6_Res [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins util_vector_logic_6/Res]
  connect_bd_net -net wr_en_1 [get_bd_pins wr_en] [get_bd_pins fifo_generator_0/wr_en]
  
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

  # Create ports
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set COMMAND [ create_bd_port -dir I -from 31 -to 0 COMMAND ]
  set COMPRESSED_SIZE [ create_bd_port -dir I -from 15 -to 0 COMPRESSED_SIZE ]
  set CRC_32_D [ create_bd_port -dir O -from 31 -to 0 CRC_32_D ]
  set INTERRUPT_REQ_D [ create_bd_port -dir O -from 0 -to 0 INTERRUPT_REQ_D ]
  set M_AXIS_tdata [ create_bd_port -dir O -from 31 -to 0 M_AXIS_tdata ]
  set M_AXIS_tready [ create_bd_port -dir I M_AXIS_tready ]
  set M_AXIS_tvalid [ create_bd_port -dir O M_AXIS_tvalid ]
  set RESETN [ create_bd_port -dir I RESETN ]
  set STATUS [ create_bd_port -dir O -from 31 -to 0 STATUS ]
  set S_AXIS_tdata [ create_bd_port -dir I -from 31 -to 0 S_AXIS_tdata ]
  set S_AXIS_tready [ create_bd_port -dir O -from 0 -to 0 S_AXIS_tready ]
  set S_AXIS_tvalid [ create_bd_port -dir I S_AXIS_tvalid ]

  # Create instance: FIFO_DC
  create_hier_cell_FIFO_DC [current_bd_instance .] FIFO_DC

  # Create instance: FIFO_DU
  create_hier_cell_FIFO_DU [current_bd_instance .] FIFO_DU

  # Create instance: STAT
  create_hier_cell_STAT [current_bd_instance .] STAT

  # Create instance: gnd, and set properties
  set gnd [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gnd ]
  set_property -dict [ list CONFIG.CONST_VAL {0}  ] $gnd

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: xpro_d_controller_0, and set properties
  set xpro_d_controller_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xpro_d_controller:1.0 xpro_d_controller_0 ]

  # Create instance: xpro_d_engine_0, and set properties
  set xpro_d_engine_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xpro_d_engine:1.0 xpro_d_engine_0 ]

  # Create port connections
  connect_bd_net -net CLEAR_1 [get_bd_ports RESETN] [get_bd_pins xpro_d_controller_0/CLEAR]
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins FIFO_DC/CLK] [get_bd_pins FIFO_DU/s_axis_aclk] [get_bd_pins xpro_d_controller_0/CLK] [get_bd_pins xpro_d_engine_0/CLK]
  connect_bd_net -net COMMAND_1 [get_bd_ports COMMAND] [get_bd_pins xpro_d_controller_0/COMMAND]
  connect_bd_net -net COMPRESSED_SIZE_1 [get_bd_ports COMPRESSED_SIZE] [get_bd_pins xpro_d_controller_0/COMPRESSED_SIZE]
  connect_bd_net -net FIFO_DC_Q [get_bd_pins FIFO_DC/Q] [get_bd_pins xpro_d_engine_0/BUS_ACKNOWLEDGE_DC]
  connect_bd_net -net FIFO_DC_Q1 [get_bd_pins FIFO_DC/Q1] [get_bd_pins xpro_d_engine_0/C_DATAIN]
  connect_bd_net -net FIFO_DC_Res [get_bd_pins FIFO_DC/Res] [get_bd_pins xpro_d_engine_0/WAIT_DC]
  connect_bd_net -net FIFO_DC_Res1 [get_bd_ports S_AXIS_tready] [get_bd_pins FIFO_DC/Res1]
  connect_bd_net -net FIFO_DU_Res [get_bd_pins FIFO_DU/Res] [get_bd_pins xpro_d_engine_0/WAIT_DU]
  connect_bd_net -net FIFO_DU_m_axis_tdata [get_bd_ports M_AXIS_tdata] [get_bd_pins FIFO_DU/m_axis_tdata]
  connect_bd_net -net FIFO_DU_m_axis_tvalid [get_bd_ports M_AXIS_tvalid] [get_bd_pins FIFO_DU/m_axis_tvalid] [get_bd_pins STAT/In11]
  connect_bd_net -net In10_1 [get_bd_pins FIFO_DC/full] [get_bd_pins STAT/In10]
  connect_bd_net -net Op1_1 [get_bd_pins FIFO_DC/empty] [get_bd_pins STAT/Op1] [get_bd_pins xpro_d_controller_0/FIFO_DC_EMPTY]
  connect_bd_net -net Op2_1 [get_bd_pins FIFO_DU/s_axis_tready] [get_bd_pins STAT/Op2]
  connect_bd_net -net STAT_dout [get_bd_ports STATUS] [get_bd_pins STAT/dout]
  connect_bd_net -net din_1 [get_bd_ports S_AXIS_tdata] [get_bd_pins FIFO_DC/din]
  connect_bd_net -net gnd_dout [get_bd_pins gnd/dout] [get_bd_pins xpro_d_controller_0/RESTART]
  connect_bd_net -net m_axis_tready_1 [get_bd_ports M_AXIS_tready] [get_bd_pins FIFO_DU/m_axis_tready]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_ports INTERRUPT_REQ_D] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net wr_en_1 [get_bd_ports S_AXIS_tvalid] [get_bd_pins FIFO_DC/wr_en]
  connect_bd_net -net xpro_d_controller_0_ADDR [get_bd_pins xpro_d_controller_0/ADDR] [get_bd_pins xpro_d_engine_0/ADDRESSD]
  connect_bd_net -net xpro_d_controller_0_BUS_ACK_DC [get_bd_pins FIFO_DC/D] [get_bd_pins xpro_d_controller_0/BUS_ACK_DC]
  connect_bd_net -net xpro_d_controller_0_BUS_ACK_DU [get_bd_pins xpro_d_controller_0/BUS_ACK_DU] [get_bd_pins xpro_d_engine_0/BUS_ACKNOWLEDGE_DU]
  connect_bd_net -net xpro_d_controller_0_COUNT_FINISH [get_bd_pins FIFO_DC/Op3] [get_bd_pins xpro_d_controller_0/COUNT_FINISH]
  connect_bd_net -net xpro_d_controller_0_CS_RW [get_bd_pins xpro_d_controller_0/CS_RW] [get_bd_pins xpro_d_engine_0/CS] [get_bd_pins xpro_d_engine_0/RW]
  connect_bd_net -net xpro_d_controller_0_CTRL_IN [get_bd_pins xpro_d_controller_0/CTRL_IN] [get_bd_pins xpro_d_engine_0/CONTROL_IND]
  connect_bd_net -net xpro_d_controller_0_INTR_ACK_D [get_bd_pins xpro_d_controller_0/INTR_ACK_D] [get_bd_pins xpro_d_engine_0/INTERRUPT_ACK_D]
  connect_bd_net -net xpro_d_controller_0_RST_ENGINE [get_bd_pins xpro_d_controller_0/RST_ENGINE] [get_bd_pins xpro_d_engine_0/CLEAR]
  connect_bd_net -net xpro_d_controller_0_RST_FIFO_DC [get_bd_pins FIFO_DC/rst] [get_bd_pins xpro_d_controller_0/RST_FIFO_DC]
  connect_bd_net -net xpro_d_controller_0_RST_FIFO_DU [get_bd_pins FIFO_DU/Op3] [get_bd_pins xpro_d_controller_0/RST_FIFO_DU]
  connect_bd_net -net xpro_d_controller_0_WAIT_DC [get_bd_pins FIFO_DC/Op2] [get_bd_pins xpro_d_controller_0/WAIT_DC]
  connect_bd_net -net xpro_d_controller_0_WAIT_DU [get_bd_pins FIFO_DU/Op2] [get_bd_pins xpro_d_controller_0/WAIT_DU]
  connect_bd_net -net xpro_d_engine_0_BUS_REQUEST_DC [get_bd_pins STAT/In6] [get_bd_pins xpro_d_controller_0/BUS_REQ_DC] [get_bd_pins xpro_d_engine_0/BUS_REQUEST_DC]
  connect_bd_net -net xpro_d_engine_0_BUS_REQUEST_DU [get_bd_pins STAT/In7] [get_bd_pins xpro_d_controller_0/BUS_REQ_DU] [get_bd_pins xpro_d_engine_0/BUS_REQUEST_DU]
  connect_bd_net -net xpro_d_engine_0_CRC_ERROR [get_bd_pins STAT/In19] [get_bd_pins xpro_d_engine_0/CRC_ERROR]
  connect_bd_net -net xpro_d_engine_0_CRC_OUT_D_32 [get_bd_ports CRC_32_D] [get_bd_pins xpro_d_engine_0/CRC_OUT_D_32]
  connect_bd_net -net xpro_d_engine_0_DECODING_OVERFLOW [get_bd_pins STAT/In18] [get_bd_pins xpro_d_engine_0/DECODING_OVERFLOW]
  connect_bd_net -net xpro_d_engine_0_DECOMPRESSING [get_bd_pins STAT/In17] [get_bd_pins xpro_d_engine_0/DECOMPRESSING]
  connect_bd_net -net xpro_d_engine_0_FINISHED_D [get_bd_pins STAT/In16] [get_bd_pins xpro_d_engine_0/FINISHED_D]
  connect_bd_net -net xpro_d_engine_0_FLUSHING_D [get_bd_pins STAT/In8] [get_bd_pins xpro_d_engine_0/FLUSHING_D]
  connect_bd_net -net xpro_d_engine_0_INTERRUPT_REQ_D [get_bd_pins STAT/In0] [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins xpro_d_controller_0/INTR_REQ_D] [get_bd_pins xpro_d_engine_0/INTERRUPT_REQ_D]
  connect_bd_net -net xpro_d_engine_0_U_DATAOUT [get_bd_pins FIFO_DU/s_axis_tdata] [get_bd_pins xpro_d_engine_0/U_DATAOUT]
  connect_bd_net -net xpro_d_engine_0_U_DATA_VALID [get_bd_pins FIFO_DU/Op1] [get_bd_pins STAT/In3] [get_bd_pins xpro_d_engine_0/U_DATA_VALID]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


