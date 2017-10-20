
################################################################
# This is a generated script based on design: c_bd
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
# source c_bd_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7vx485tffg1761-2
#    set_property BOARD_PART xilinx.com:vc707:part0:1.1 [current_project]


# CHANGE DESIGN NAME HERE
set design_name c_bd

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
  create_bd_pin -dir I -type clk CLK
  create_bd_pin -dir I -from 0 -to 0 In0
  create_bd_pin -dir I -from 0 -to 0 In1
  create_bd_pin -dir I -from 0 -to 0 In2
  create_bd_pin -dir I -from 0 -to 0 In4
  create_bd_pin -dir I -from 0 -to 0 In5
  create_bd_pin -dir I -from 0 -to 0 In6
  create_bd_pin -dir I -from 0 -to 0 In7
  create_bd_pin -dir I -from 0 -to 0 In8
  create_bd_pin -dir I -from 0 -to 0 Op2
  create_bd_pin -dir I -from 0 -to 0 Op3
  create_bd_pin -dir O -from 15 -to 0 Q
  create_bd_pin -dir I -type rst SCLR
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: c_counter_binary_0, and set properties
  set c_counter_binary_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 c_counter_binary_0 ]
  set_property -dict [ list CONFIG.CE {true} CONFIG.SCLR {true}  ] $c_counter_binary_0

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_2

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list CONFIG.NUM_PORTS {16}  ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list CONFIG.IN0_WIDTH {16} CONFIG.IN1_WIDTH {16}  ] $xlconcat_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {0}  ] $xlconstant_0

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_pins CLK] [get_bd_pins c_counter_binary_0/CLK]
  connect_bd_net -net In6_1 [get_bd_pins In6] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net In8_1 [get_bd_pins In8] [get_bd_pins xlconcat_0/In6]
  connect_bd_net -net Op3_1 [get_bd_pins Op3] [get_bd_pins util_vector_logic_0/Op2]
  connect_bd_net -net SCLR_1 [get_bd_pins SCLR] [get_bd_pins c_counter_binary_0/SCLR]
  connect_bd_net -net c_counter_binary_0_Q [get_bd_pins Q] [get_bd_pins c_counter_binary_0/Q] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins xlconcat_0/In8]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins c_counter_binary_0/CE] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins util_vector_logic_2/Res]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xlconcat_0/dout] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins dout] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_0/In9] [get_bd_pins xlconcat_0/In10] [get_bd_pins xlconcat_0/In11] [get_bd_pins xlconcat_0/In12] [get_bd_pins xlconcat_0/In13] [get_bd_pins xlconcat_0/In14] [get_bd_pins xlconcat_0/In15] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xpro_c_engine_0_BUS_REQUEST_CC [get_bd_pins In7] [get_bd_pins xlconcat_0/In7]
  connect_bd_net -net xpro_c_engine_0_CODING_OVERFLOW [get_bd_pins In4] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net xpro_c_engine_0_COMPRESSING [get_bd_pins In1] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net xpro_c_engine_0_CRC_ERROR [get_bd_pins In5] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net xpro_c_engine_0_C_DATA_VALID [get_bd_pins Op2] [get_bd_pins util_vector_logic_1/Op1] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net xpro_c_engine_0_FINISHED_C [get_bd_pins In0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net xpro_c_engine_0_FLUSHING_C [get_bd_pins In2] [get_bd_pins xlconcat_0/In2]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: FIFO_CU
proc create_hier_cell_FIFO_CU { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_FIFO_CU() - Empty argument(s)!"
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
  create_bd_pin -dir I -from 0 -to 0 Op1
  create_bd_pin -dir O -from 9 -to 0 -type data Q3
  create_bd_pin -dir I -from 0 -to 0 -type data busy
  create_bd_pin -dir I -from 31 -to 0 din
  create_bd_pin -dir O -from 0 -to 0 dout
  create_bd_pin -dir O -from 31 -to 0 doutb
  create_bd_pin -dir I -type ce read_fifo_cu
  create_bd_pin -dir I rst
  create_bd_pin -dir O -from 0 -to 0 s_axis_tready
  create_bd_pin -dir O -from 31 -to 0 -type data tdata
  create_bd_pin -dir I -type ce u_wait_cu
  create_bd_pin -dir O -from 0 -to 0 wait_cu
  create_bd_pin -dir I -from 0 -to 0 wait_cu_ctlr
  create_bd_pin -dir I wr_en

  # Create instance: axis_data_fifo_cu1, and set properties
  set axis_data_fifo_cu1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_cu1 ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {64} CONFIG.TDATA_NUM_BYTES {4}  ] $axis_data_fifo_cu1

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.2 blk_mem_gen_0 ]
  set_property -dict [ list CONFIG.Enable_32bit_Address {false} CONFIG.Enable_A {Use_ENA_Pin} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Operating_Mode_A {WRITE_FIRST} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Write_Depth_A {1024} CONFIG.use_bram_block {Stand_Alone}  ] $blk_mem_gen_0

  # Create instance: c_shift_ram_4, and set properties
  set c_shift_ram_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_4 ]
  set_property -dict [ list CONFIG.AsyncInitVal {00000000000000000000000000000000} CONFIG.CE {true} CONFIG.DefaultData {00000000000000000000000000000000} CONFIG.Depth {1} CONFIG.ShiftRegType {Fixed_Length} CONFIG.Width {32}  ] $c_shift_ram_4

  # Create instance: c_shift_ram_5, and set properties
  set c_shift_ram_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_5 ]
  set_property -dict [ list CONFIG.AsyncInitVal {00000000000000000000000000000000} CONFIG.CE {true} CONFIG.DefaultData {00000000000000000000000000000000} CONFIG.Depth {1} CONFIG.ShiftRegType {Fixed_Length} CONFIG.Width {32}  ] $c_shift_ram_5

  # Create instance: c_shift_ram_6, and set properties
  set c_shift_ram_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_6 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.CE {true} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.ShiftRegType {Fixed_Length} CONFIG.Width {1}  ] $c_shift_ram_6

  # Create instance: counter_addra, and set properties
  set counter_addra [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 counter_addra ]
  set_property -dict [ list CONFIG.CE {true} CONFIG.Output_Width {10} CONFIG.Restrict_Count {false} CONFIG.SCLR {false}  ] $counter_addra

  # Create instance: counter_addrb, and set properties
  set counter_addrb [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 counter_addrb ]
  set_property -dict [ list CONFIG.CE {true} CONFIG.Output_Width {10} CONFIG.Restrict_Count {false} CONFIG.SCLR {true}  ] $counter_addrb

  # Create instance: delay_1_rdy_vld_1, and set properties
  set delay_1_rdy_vld_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 delay_1_rdy_vld_1 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $delay_1_rdy_vld_1

  # Create instance: delay_1_rdy_vld_2, and set properties
  set delay_1_rdy_vld_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 delay_1_rdy_vld_2 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $delay_1_rdy_vld_2

  # Create instance: m_tvalid_busy, and set properties
  set m_tvalid_busy [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 m_tvalid_busy ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $m_tvalid_busy

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $util_vector_logic_2

  # Create instance: util_vector_logic_3, and set properties
  set util_vector_logic_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_3 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_3

  # Create instance: util_vector_logic_4, and set properties
  set util_vector_logic_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_4 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_4

  # Create instance: util_vector_logic_5, and set properties
  set util_vector_logic_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_5 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_5

  # Create instance: util_vector_logic_6, and set properties
  set util_vector_logic_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_6 ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $util_vector_logic_6

  # Create instance: wait_cu_both, and set properties
  set wait_cu_both [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 wait_cu_both ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $wait_cu_both

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create port connections
  connect_bd_net -net CE1_1 [get_bd_pins read_fifo_cu] [get_bd_pins util_vector_logic_6/Op1]
  connect_bd_net -net CE_1 [get_bd_pins u_wait_cu] [get_bd_pins util_vector_logic_5/Op1]
  connect_bd_net -net CLK_1 [get_bd_pins CLK] [get_bd_pins axis_data_fifo_cu1/s_axis_aclk] [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins blk_mem_gen_0/clkb] [get_bd_pins c_shift_ram_4/CLK] [get_bd_pins c_shift_ram_5/CLK] [get_bd_pins c_shift_ram_6/CLK] [get_bd_pins counter_addra/CLK] [get_bd_pins counter_addrb/CLK] [get_bd_pins delay_1_rdy_vld_1/CLK] [get_bd_pins delay_1_rdy_vld_2/CLK]
  connect_bd_net -net Op1_2 [get_bd_pins Op1] [get_bd_pins util_vector_logic_3/Op1]
  connect_bd_net -net axis_data_fifo_0_m_axis_tdata [get_bd_pins tdata] [get_bd_pins axis_data_fifo_cu1/m_axis_tdata]
  connect_bd_net -net axis_data_fifo_0_m_axis_tvalid [get_bd_pins axis_data_fifo_cu1/m_axis_tvalid] [get_bd_pins m_tvalid_busy/Op1]
  connect_bd_net -net axis_data_fifo_0_s_axis_tready [get_bd_pins axis_data_fifo_cu1/s_axis_tready] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins blk_mem_gen_0/doutb] [get_bd_pins c_shift_ram_4/D]
  connect_bd_net -net busy_1 [get_bd_pins busy] [get_bd_pins blk_mem_gen_0/ena] [get_bd_pins m_tvalid_busy/Op2] [get_bd_pins util_vector_logic_1/Op2]
  connect_bd_net -net c_counter_binary_0_Q [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins counter_addra/Q]
  connect_bd_net -net c_counter_binary_1_Q [get_bd_pins Q3] [get_bd_pins blk_mem_gen_0/addrb] [get_bd_pins counter_addrb/Q]
  connect_bd_net -net c_shift_ram_4_Q [get_bd_pins doutb] [get_bd_pins c_shift_ram_4/Q]
  connect_bd_net -net c_shift_ram_5_Q [get_bd_pins blk_mem_gen_0/dina] [get_bd_pins c_shift_ram_5/Q]
  connect_bd_net -net c_shift_ram_6_Q [get_bd_pins blk_mem_gen_0/wea] [get_bd_pins c_shift_ram_6/Q]
  connect_bd_net -net delay_1_rdy_vld_1_Q [get_bd_pins delay_1_rdy_vld_1/Q] [get_bd_pins util_vector_logic_2/Op2]
  connect_bd_net -net delay_1_rdy_vld_2_Q [get_bd_pins counter_addra/CE] [get_bd_pins delay_1_rdy_vld_2/Q]
  connect_bd_net -net din_1 [get_bd_pins din] [get_bd_pins axis_data_fifo_cu1/s_axis_tdata] [get_bd_pins c_shift_ram_5/D]
  connect_bd_net -net m_tvalid_busy_Res [get_bd_pins m_tvalid_busy/Res] [get_bd_pins wait_cu_both/Op2]
  connect_bd_net -net rst_1 [get_bd_pins rst] [get_bd_pins counter_addrb/SCLR] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins axis_data_fifo_cu1/s_axis_aresetn] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins s_axis_tready] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins util_vector_logic_2/Res] [get_bd_pins util_vector_logic_4/Op1]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins util_vector_logic_3/Res] [get_bd_pins util_vector_logic_4/Op2]
  connect_bd_net -net util_vector_logic_4_Res [get_bd_pins wait_cu] [get_bd_pins util_vector_logic_4/Res]
  connect_bd_net -net util_vector_logic_5_Res [get_bd_pins util_vector_logic_5/Res] [get_bd_pins util_vector_logic_6/Op2]
  connect_bd_net -net util_vector_logic_6_Res [get_bd_pins blk_mem_gen_0/enb] [get_bd_pins c_shift_ram_4/CE] [get_bd_pins counter_addrb/CE] [get_bd_pins util_vector_logic_6/Res]
  connect_bd_net -net wait_cu_both_Res [get_bd_pins axis_data_fifo_cu1/m_axis_tready] [get_bd_pins delay_1_rdy_vld_1/D] [get_bd_pins util_vector_logic_2/Op1] [get_bd_pins wait_cu_both/Res]
  connect_bd_net -net wait_cu_ctlr_1 [get_bd_pins wait_cu_ctlr] [get_bd_pins util_vector_logic_5/Op2] [get_bd_pins wait_cu_both/Op1]
  connect_bd_net -net wr_en_1 [get_bd_pins wr_en] [get_bd_pins axis_data_fifo_cu1/s_axis_tvalid] [get_bd_pins c_shift_ram_5/CE] [get_bd_pins c_shift_ram_6/CE] [get_bd_pins c_shift_ram_6/D] [get_bd_pins delay_1_rdy_vld_2/D]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins dout] [get_bd_pins xlconstant_1/dout]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: FIFO_CC
proc create_hier_cell_FIFO_CC { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_FIFO_CC() - Empty argument(s)!"
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
  create_bd_pin -dir I -from 15 -to 0 L
  create_bd_pin -dir I -from 0 -to 0 Op1
  create_bd_pin -dir I -from 0 -to 0 Op2
  create_bd_pin -dir I -from 0 -to 0 Op3
  create_bd_pin -dir I -from 0 -to 0 Op4
  create_bd_pin -dir I -from 0 -to 0 Op5
  create_bd_pin -dir I -from 0 -to 0 Op6
  create_bd_pin -dir O -from 0 -to 0 Res
  create_bd_pin -dir O -from 0 -to 0 Res1
  create_bd_pin -dir I -from 0 -to 0 flush_fifo
  create_bd_pin -dir O -from 31 -to 0 m_axis_tdata
  create_bd_pin -dir O -from 31 -to 0 m_axis_tdatafifo
  create_bd_pin -dir I m_axis_treadyfifo
  create_bd_pin -dir O m_axis_tvalid1
  create_bd_pin -dir I -type clk s_axis_aclk
  create_bd_pin -dir I -from 31 -to 0 s_axis_tdata

  # Create instance: axis_data_fifo_cc1, and set properties
  set axis_data_fifo_cc1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_cc1 ]
  set_property -dict [ list CONFIG.FIFO_DEPTH {64} CONFIG.TDATA_NUM_BYTES {4}  ] $axis_data_fifo_cc1

  # Create instance: axis_data_fifo_cc2, and set properties
  set axis_data_fifo_cc2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_cc2 ]
  set_property -dict [ list CONFIG.TDATA_NUM_BYTES {4}  ] $axis_data_fifo_cc2

  # Create instance: c_shift_ram_7, and set properties
  set c_shift_ram_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_7 ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.CE {false} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.ShiftRegType {Fixed_Length} CONFIG.Width {1}  ] $c_shift_ram_7

  # Create instance: count_down, and set properties
  set count_down [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 count_down ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $count_down

  # Create instance: count_finish, and set properties
  set count_finish [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 count_finish ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $count_finish

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_2

  # Create instance: util_vector_logic_5, and set properties
  set util_vector_logic_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_5 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_5

  # Create instance: util_vector_logic_7, and set properties
  set util_vector_logic_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_7 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_7

  # Create instance: util_vector_logic_8, and set properties
  set util_vector_logic_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_8 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_8

  # Create instance: util_vector_logic_9, and set properties
  set util_vector_logic_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_9 ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $util_vector_logic_9

  # Create instance: util_vector_logic_10, and set properties
  set util_vector_logic_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_10 ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $util_vector_logic_10

  # Create port connections
  connect_bd_net -net Op1_1 [get_bd_pins Op1] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net Op2_1 [get_bd_pins Op2] [get_bd_pins util_vector_logic_2/Op2]
  connect_bd_net -net Op3_1 [get_bd_pins Op3] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net Op4_1 [get_bd_pins Op4] [get_bd_pins count_finish/Op1]
  connect_bd_net -net Op5_1 [get_bd_pins Op5] [get_bd_pins util_vector_logic_5/Op1]
  connect_bd_net -net Op6_1 [get_bd_pins Op6] [get_bd_pins util_vector_logic_8/Op1]
  connect_bd_net -net Op7_1 [get_bd_pins flush_fifo] [get_bd_pins util_vector_logic_10/Op1]
  connect_bd_net -net axis_data_fifo_0_m_axis_tdata [get_bd_pins m_axis_tdatafifo] [get_bd_pins axis_data_fifo_cc2/m_axis_tdata]
  connect_bd_net -net axis_data_fifo_0_m_axis_tvalid [get_bd_pins m_axis_tvalid1] [get_bd_pins axis_data_fifo_cc2/m_axis_tvalid]
  connect_bd_net -net axis_data_fifo_0_s_axis_tready [get_bd_pins axis_data_fifo_cc2/s_axis_tready] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net axis_data_fifo_1_m_axis_tdata [get_bd_pins m_axis_tdata] [get_bd_pins axis_data_fifo_cc1/m_axis_tdata]
  connect_bd_net -net axis_data_fifo_1_m_axis_tvalid [get_bd_pins axis_data_fifo_cc1/m_axis_tvalid] [get_bd_pins count_down/Op1]
  connect_bd_net -net c_shift_ram_7_Q [get_bd_pins c_shift_ram_7/Q] [get_bd_pins util_vector_logic_7/Op1]
  connect_bd_net -net count_down_Res [get_bd_pins count_down/Res] [get_bd_pins util_vector_logic_9/Op1]
  connect_bd_net -net count_finish_Res [get_bd_pins count_finish/Res] [get_bd_pins util_vector_logic_9/Op2]
  connect_bd_net -net m_axis_treadyfifo_1 [get_bd_pins m_axis_treadyfifo] [get_bd_pins util_vector_logic_10/Op2]
  connect_bd_net -net s_axis_aclk_1 [get_bd_pins s_axis_aclk] [get_bd_pins axis_data_fifo_cc1/s_axis_aclk] [get_bd_pins axis_data_fifo_cc2/s_axis_aclk] [get_bd_pins c_shift_ram_7/CLK]
  connect_bd_net -net s_axis_tdata_1 [get_bd_pins s_axis_tdata] [get_bd_pins axis_data_fifo_cc1/s_axis_tdata] [get_bd_pins axis_data_fifo_cc2/s_axis_tdata]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins axis_data_fifo_cc1/s_axis_tvalid] [get_bd_pins axis_data_fifo_cc2/s_axis_tvalid] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_10_Res [get_bd_pins axis_data_fifo_cc2/m_axis_tready] [get_bd_pins util_vector_logic_10/Res]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins axis_data_fifo_cc1/s_axis_aresetn] [get_bd_pins axis_data_fifo_cc2/s_axis_aresetn] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins Res] [get_bd_pins util_vector_logic_2/Res]
  connect_bd_net -net util_vector_logic_5_Res [get_bd_pins util_vector_logic_5/Res] [get_bd_pins util_vector_logic_7/Op2]
  connect_bd_net -net util_vector_logic_7_Res [get_bd_pins axis_data_fifo_cc1/m_axis_tready] [get_bd_pins count_down/Op2] [get_bd_pins util_vector_logic_7/Res]
  connect_bd_net -net util_vector_logic_8_Res [get_bd_pins c_shift_ram_7/D] [get_bd_pins util_vector_logic_8/Res]
  connect_bd_net -net util_vector_logic_9_Res [get_bd_pins Res1] [get_bd_pins util_vector_logic_9/Res]
  
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
  set CRC_32_C [ create_bd_port -dir O -from 31 -to 0 CRC_32_C ]
  set INTERRUPT_REQ_C [ create_bd_port -dir O -from 0 -to 0 INTERRUPT_REQ_C ]
  set M_AXIS_tdata [ create_bd_port -dir O -from 31 -to 0 M_AXIS_tdata ]
  set M_AXIS_tready [ create_bd_port -dir I M_AXIS_tready ]
  set M_AXIS_tvalid [ create_bd_port -dir O M_AXIS_tvalid ]
  set RESETN [ create_bd_port -dir I RESETN ]
  set STATUS [ create_bd_port -dir O -from 31 -to 0 STATUS ]
  set S_AXIS_tdata [ create_bd_port -dir I -from 31 -to 0 S_AXIS_tdata ]
  set S_AXIS_tready [ create_bd_port -dir O -from 0 -to 0 S_AXIS_tready ]
  set S_AXIS_tvalid [ create_bd_port -dir I S_AXIS_tvalid ]

  # Create instance: FIFO_CC
  create_hier_cell_FIFO_CC [current_bd_instance .] FIFO_CC

  # Create instance: FIFO_CU
  create_hier_cell_FIFO_CU [current_bd_instance .] FIFO_CU

  # Create instance: STAT
  create_hier_cell_STAT [current_bd_instance .] STAT

  # Create instance: xpro_c_controller_0, and set properties
  set xpro_c_controller_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xpro_c_controller:1.0 xpro_c_controller_0 ]

  # Create instance: xpro_c_engine_0, and set properties
  set xpro_c_engine_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xpro_c_engine:1.0 xpro_c_engine_0 ]

  # Create instance: xpro_d_controller_0, and set properties
  set xpro_d_controller_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xpro_d_controller:1.0 xpro_d_controller_0 ]

  # Create instance: xpro_d_engine_0, and set properties
  set xpro_d_engine_0 [ create_bd_cell -type ip -vlnv mohdazainol:user_ip:xpro_d_engine:1.0 xpro_d_engine_0 ]

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins FIFO_CC/s_axis_aclk] [get_bd_pins FIFO_CU/CLK] [get_bd_pins STAT/CLK] [get_bd_pins xpro_c_controller_0/CLK] [get_bd_pins xpro_c_engine_0/CLK] [get_bd_pins xpro_d_controller_0/CLK] [get_bd_pins xpro_d_engine_0/CLK]
  connect_bd_net -net COMMAND_1 [get_bd_ports COMMAND] [get_bd_pins xpro_c_controller_0/COMMAND] [get_bd_pins xpro_d_controller_0/COMMAND]
  connect_bd_net -net FIFO_CC_Res [get_bd_pins FIFO_CC/Res] [get_bd_pins xpro_c_engine_0/WAIT_CC]
  connect_bd_net -net FIFO_CC_Res1 [get_bd_pins FIFO_CC/Res1] [get_bd_pins xpro_d_engine_0/WAIT_DC]
  connect_bd_net -net FIFO_CC_m_axis_tdata [get_bd_ports M_AXIS_tdata] [get_bd_pins FIFO_CC/m_axis_tdatafifo]
  connect_bd_net -net FIFO_CC_m_axis_tdata1 [get_bd_pins FIFO_CC/m_axis_tdata] [get_bd_pins xpro_d_engine_0/C_DATAIN]
  connect_bd_net -net FIFO_CC_m_axis_tvalid1 [get_bd_pins FIFO_CC/m_axis_tvalid1] [get_bd_pins xpro_c_controller_0/M_AXIS_TVALID_IN]
  connect_bd_net -net FIFO_CU_Q3 [get_bd_pins FIFO_CU/Q3] [get_bd_pins xpro_c_controller_0/COUNTER_ADDRB]
  connect_bd_net -net FIFO_CU_dout [get_bd_pins FIFO_CU/dout] [get_bd_pins xpro_c_controller_0/BRAM_TVALID]
  connect_bd_net -net FIFO_CU_doutb [get_bd_pins FIFO_CU/doutb] [get_bd_pins xpro_c_controller_0/BRAM_TDATA]
  connect_bd_net -net FIFO_CU_s_axis_tready [get_bd_ports S_AXIS_tready] [get_bd_pins FIFO_CU/s_axis_tready]
  connect_bd_net -net FIFO_CU_tdata [get_bd_pins FIFO_CU/tdata] [get_bd_pins xpro_c_controller_0/M_TDATA]
  connect_bd_net -net FIFO_CU_wait_cu [get_bd_pins FIFO_CU/wait_cu] [get_bd_pins xpro_c_controller_0/M_TVALID]
  connect_bd_net -net M_AXIS_tready_1 [get_bd_ports M_AXIS_tready] [get_bd_pins FIFO_CC/m_axis_treadyfifo] [get_bd_pins xpro_d_controller_0/INTR_REQ_D]
  connect_bd_net -net Op4_2 [get_bd_pins FIFO_CC/Op4] [get_bd_pins xpro_c_controller_0/INTR_REQ_C] [get_bd_pins xpro_c_engine_0/INTERRUPT_REQ_C]
  connect_bd_net -net RESETN_1 [get_bd_ports RESETN] [get_bd_pins xpro_c_controller_0/CLEAR] [get_bd_pins xpro_d_controller_0/CLEAR] [get_bd_pins xpro_d_controller_0/FIFO_DC_EMPTY]
  connect_bd_net -net STAT_Q [get_bd_pins FIFO_CC/L] [get_bd_pins STAT/Q] [get_bd_pins xpro_d_controller_0/COMPRESSED_SIZE]
  connect_bd_net -net S_AXIS_tvalid_1 [get_bd_ports S_AXIS_tvalid] [get_bd_pins FIFO_CU/wr_en]
  connect_bd_net -net din_1 [get_bd_ports S_AXIS_tdata] [get_bd_pins FIFO_CU/din]
  connect_bd_net -net s_axis_tdata_1 [get_bd_pins FIFO_CC/s_axis_tdata] [get_bd_pins xpro_c_engine_0/C_DATAOUT]
  connect_bd_net -net xlconcat_1_dout [get_bd_ports STATUS] [get_bd_pins STAT/dout]
  connect_bd_net -net xpro_c_controller_0_ADDR [get_bd_pins xpro_c_controller_0/ADDR] [get_bd_pins xpro_c_engine_0/ADDRESSC]
  connect_bd_net -net xpro_c_controller_0_BUSY [get_bd_pins FIFO_CU/busy] [get_bd_pins xpro_c_controller_0/BUSY]
  connect_bd_net -net xpro_c_controller_0_BUS_ACK_CC [get_bd_pins xpro_c_controller_0/BUS_ACK_CC] [get_bd_pins xpro_c_engine_0/BUS_ACKNOWLEDGE_CC]
  connect_bd_net -net xpro_c_controller_0_BUS_ACK_CU [get_bd_pins xpro_c_controller_0/BUS_ACK_CU] [get_bd_pins xpro_c_engine_0/BUS_ACKNOWLEDGE_CU]
  connect_bd_net -net xpro_c_controller_0_CS_RW [get_bd_pins xpro_c_controller_0/CS_RW] [get_bd_pins xpro_c_engine_0/CS] [get_bd_pins xpro_c_engine_0/RW]
  connect_bd_net -net xpro_c_controller_0_CTRL_IN [get_bd_pins xpro_c_controller_0/CTRL_IN] [get_bd_pins xpro_c_engine_0/CONTROL_IN_C]
  connect_bd_net -net xpro_c_controller_0_FLUSH_FIFO_CC [get_bd_ports INTERRUPT_REQ_C] [get_bd_pins FIFO_CC/flush_fifo] [get_bd_pins STAT/In6] [get_bd_pins xpro_c_controller_0/FLUSH_FIFO_CC]
  connect_bd_net -net xpro_c_controller_0_INTR_ACK_C [get_bd_pins xpro_c_controller_0/INTR_ACK_C] [get_bd_pins xpro_c_engine_0/INTERRUPT_ACK_C] [get_bd_pins xpro_d_engine_0/INTERRUPT_ACK_D]
  connect_bd_net -net xpro_c_controller_0_M_AXIS_TVALID_OUT [get_bd_ports M_AXIS_tvalid] [get_bd_pins STAT/Op3] [get_bd_pins xpro_c_controller_0/M_AXIS_TVALID_OUT]
  connect_bd_net -net xpro_c_controller_0_READ_FIFO_CU [get_bd_pins FIFO_CU/read_fifo_cu] [get_bd_pins xpro_c_controller_0/READ_FIFO_CU]
  connect_bd_net -net xpro_c_controller_0_RESTART_DECOMPRESSOR [get_bd_pins STAT/SCLR] [get_bd_pins xpro_c_controller_0/RESTART_DECOMPRESSOR] [get_bd_pins xpro_d_controller_0/RESTART]
  connect_bd_net -net xpro_c_controller_0_RST_ENGINE [get_bd_pins xpro_c_controller_0/RST_ENGINE] [get_bd_pins xpro_c_engine_0/CLEAR]
  connect_bd_net -net xpro_c_controller_0_RST_FIFO_CC [get_bd_pins FIFO_CC/Op3] [get_bd_pins xpro_c_controller_0/RST_FIFO_CC]
  connect_bd_net -net xpro_c_controller_0_RST_FIFO_CU [get_bd_pins FIFO_CU/rst] [get_bd_pins xpro_c_controller_0/RST_FIFO_CU]
  connect_bd_net -net xpro_c_controller_0_U_DATA_OUT [get_bd_pins xpro_c_controller_0/U_DATA_OUT] [get_bd_pins xpro_c_engine_0/U_DATAIN]
  connect_bd_net -net xpro_c_controller_0_U_WAIT_CU [get_bd_pins FIFO_CU/u_wait_cu] [get_bd_pins xpro_c_controller_0/U_WAIT_CU] [get_bd_pins xpro_c_engine_0/WAIT_CU]
  connect_bd_net -net xpro_c_controller_0_WAIT_CC [get_bd_pins FIFO_CC/Op2] [get_bd_pins xpro_c_controller_0/WAIT_CC]
  connect_bd_net -net xpro_c_controller_0_WAIT_CU [get_bd_pins FIFO_CU/wait_cu_ctlr] [get_bd_pins xpro_c_controller_0/WAIT_CU]
  connect_bd_net -net xpro_c_engine_0_BUS_REQUEST_CC [get_bd_pins STAT/In7] [get_bd_pins xpro_c_controller_0/BUS_REQ_CC] [get_bd_pins xpro_c_engine_0/BUS_REQUEST_CC]
  connect_bd_net -net xpro_c_engine_0_BUS_REQUEST_CU [get_bd_pins FIFO_CU/Op1] [get_bd_pins STAT/In8] [get_bd_pins xpro_c_controller_0/BUS_REQ_CU] [get_bd_pins xpro_c_engine_0/BUS_REQUEST_CU]
  connect_bd_net -net xpro_c_engine_0_CODING_OVERFLOW [get_bd_pins STAT/In4] [get_bd_pins xpro_c_engine_0/CODING_OVERFLOW]
  connect_bd_net -net xpro_c_engine_0_COMPRESSING [get_bd_pins STAT/In1] [get_bd_pins xpro_c_engine_0/COMPRESSING]
  connect_bd_net -net xpro_c_engine_0_CRC_32_C [get_bd_ports CRC_32_C] [get_bd_pins xpro_c_controller_0/CRC_OUT_C] [get_bd_pins xpro_c_engine_0/CRC_32_C]
  connect_bd_net -net xpro_c_engine_0_CRC_ERROR [get_bd_pins STAT/In5] [get_bd_pins xpro_c_engine_0/CRC_ERROR]
  connect_bd_net -net xpro_c_engine_0_C_DATA_VALID [get_bd_pins FIFO_CC/Op1] [get_bd_pins STAT/Op2] [get_bd_pins xpro_c_engine_0/C_DATA_VALID]
  connect_bd_net -net xpro_c_engine_0_FINISHED_C [get_bd_pins STAT/In0] [get_bd_pins xpro_c_engine_0/FINISHED_C]
  connect_bd_net -net xpro_c_engine_0_FLUSHING_C [get_bd_pins STAT/In2] [get_bd_pins xpro_c_engine_0/FLUSHING_C]
  connect_bd_net -net xpro_d_controller_0_ADDR [get_bd_pins xpro_d_controller_0/ADDR] [get_bd_pins xpro_d_engine_0/ADDRESSD]
  connect_bd_net -net xpro_d_controller_0_BUS_ACK_DC [get_bd_pins FIFO_CC/Op6] [get_bd_pins xpro_d_controller_0/BUS_ACK_DC] [get_bd_pins xpro_d_engine_0/BUS_ACKNOWLEDGE_DC]
  connect_bd_net -net xpro_d_controller_0_BUS_ACK_DU [get_bd_pins xpro_d_controller_0/BUS_ACK_DU] [get_bd_pins xpro_d_engine_0/BUS_ACKNOWLEDGE_DU]
  connect_bd_net -net xpro_d_controller_0_CS_RW [get_bd_pins xpro_d_controller_0/CS_RW] [get_bd_pins xpro_d_engine_0/CS] [get_bd_pins xpro_d_engine_0/RW]
  connect_bd_net -net xpro_d_controller_0_CTRL_IN [get_bd_pins xpro_d_controller_0/CTRL_IN] [get_bd_pins xpro_d_engine_0/CONTROL_IND]
  connect_bd_net -net xpro_d_controller_0_RST_ENGINE [get_bd_pins xpro_d_controller_0/RST_ENGINE] [get_bd_pins xpro_d_engine_0/CLEAR]
  connect_bd_net -net xpro_d_controller_0_WAIT_DU [get_bd_pins xpro_d_controller_0/WAIT_DU] [get_bd_pins xpro_d_engine_0/WAIT_DU]
  connect_bd_net -net xpro_d_engine_0_BUS_REQUEST_DC [get_bd_pins FIFO_CC/Op5] [get_bd_pins xpro_d_controller_0/BUS_REQ_DC] [get_bd_pins xpro_d_engine_0/BUS_REQUEST_DC]
  connect_bd_net -net xpro_d_engine_0_BUS_REQUEST_DU [get_bd_pins xpro_d_controller_0/BUS_REQ_DU] [get_bd_pins xpro_d_engine_0/BUS_REQUEST_DU]
  connect_bd_net -net xpro_d_engine_0_CRC_OUT_D_32 [get_bd_pins xpro_c_controller_0/CRC_OUT_D] [get_bd_pins xpro_d_engine_0/CRC_OUT_D_32]
  connect_bd_net -net xpro_d_engine_0_INTERRUPT_REQ_D [get_bd_pins xpro_c_controller_0/INTR_REQ_D] [get_bd_pins xpro_d_engine_0/INTERRUPT_REQ_D]

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


