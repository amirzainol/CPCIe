#-------------------------------------------------------------
# Generated Example Tcl script for IP 'pcie_k7_vivado' (xilinx.com:ip:pcie_7x:3.0)
#-------------------------------------------------------------

# Declare source IP directory
set srcIpDir "c:/mohd/cpcie/test_xillybus_loop/vivado-essentials/pcie_k7_vivado"

# Create project
create_project -name pcie_k7_vivado_example -force
set_property part xc7vx485tffg1761-2 [current_project]
set_property target_language vhdl [current_project]
set_property simulator_language MIXED [current_project]
set returnCode 0

# Import the original IP (excluding example files)
import_ip -files [list [file join $srcIpDir pcie_k7_vivado.xci]] -name pcie_k7_vivado
reset_target {example} [get_ips pcie_k7_vivado]

# Generate the IP
proc _filter_supported_targets {targets ip} {
  set res {}
  set all [get_property SUPPORTED_TARGETS $ip]
  foreach target $targets {
    lappend res {*}[lsearch -all -inline -nocase $all $target]
  }
  return $res
}
generate_target [_filter_supported_targets {instantiation_template synthesis simulation implementation shared_logic} [get_ips pcie_k7_vivado]] [get_ips pcie_k7_vivado]

# Add example synthesis HDL files
add_files -scan_for_includes -quiet -fileset [current_fileset] \
  [list [file join $srcIpDir example_design/PIO.vhd]] \
  [list [file join $srcIpDir example_design/EP_MEM.vhd]] \
  [list [file join $srcIpDir example_design/PIO_EP_MEM_ACCESS.vhd]] \
  [list [file join $srcIpDir example_design/PIO_EP.vhd]] \
  [list [file join $srcIpDir example_design/PIO_RX_ENGINE.vhd]] \
  [list [file join $srcIpDir example_design/PIO_TO_CTRL.vhd]] \
  [list [file join $srcIpDir example_design/PIO_TX_ENGINE.vhd]] \
  [list [file join $srcIpDir example_design/pcie_app_7x.vhd]] \
  [list [file join $srcIpDir example_design/xilinx_pcie_2_1_ep_7x.vhd]] \
  [list [file join $srcIpDir example_design/support/pcie_k7_vivado_support.vhd]] \
  [list [file join $srcIpDir example_design/support/pcie_k7_vivado_pipe_clock.v]]

# Add example miscellaneous synthesis files
add_files -quiet -fileset [current_fileset] \
  [list [file join $srcIpDir hierarchy.txt]]

# Add example XDC files
add_files -quiet -fileset [current_fileset -constrset] \
  [list [file join $srcIpDir example_design/xilinx_pcie_7x_ep_x8g1_VC707.xdc]]


# Add example simulation HDL files
if { [catch {current_fileset -simset} exc] } { create_fileset -simset sim_1 }
add_files -quiet -scan_for_includes -fileset [current_fileset -simset] \
  [list [file join $srcIpDir simulation/dsport/pci_exp_usrapp_cfg.vhd]] \
  [list [file join $srcIpDir simulation/dsport/pci_exp_usrapp_pl.vhd]] \
  [list [file join $srcIpDir simulation/dsport/pci_exp_usrapp_rx.vhd]] \
  [list [file join $srcIpDir simulation/dsport/pci_exp_usrapp_tx.vhd]] \
  [list [file join $srcIpDir simulation/functional/sys_clk_gen_ds.vhd]] \
  [list [file join $srcIpDir simulation/functional/sys_clk_gen.vhd]] \
  [list [file join $srcIpDir simulation/dsport/pcie_axi_trn_bridge.vhd]] \
  [list [file join $srcIpDir simulation/functional/board.vhd]] \
  [list [file join $srcIpDir simulation/dsport/pcie_2_1_rport_7x.vhd]] \
  [list [file join $srcIpDir simulation/dsport/xilinx_pcie_2_1_rport_7x.vhd]] \
  [list [file join $srcIpDir simulation/dsport/test_interface.vhd]] \
  [list [file join $srcIpDir simulation/tests/tests.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/pci_exp_usrapp_cfg.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/pci_exp_usrapp_pl.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/pci_exp_usrapp_rx.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/pci_exp_usrapp_tx.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/functional/sys_clk_gen_ds.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/functional/sys_clk_gen.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/pcie_axi_trn_bridge.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/functional/board.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/pcie_2_1_rport_7x.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/xilinx_pcie_2_1_rport_7x.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/dsport/test_interface.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [file join $srcIpDir simulation/tests/tests.vhd]]

# Import all files while preserving hierarchy
import_files

# Set top
set_property TOP [lindex [find_top] 0] [current_fileset]

# Update compile order
update_compile_order -fileset [current_fileset]
update_compile_order -fileset [current_fileset -simset]

set dfile c:/mohd/cpcie/test_xillybus_loop/vivado-essentials/pcie_k7_vivado/oepdone.txt
set doneFile [open $dfile w]
puts $doneFile "Open Example Project DONE"
close $doneFile
if { $returnCode != 0 } {
  error "Problems were encountered while executing the example design script, please review the log files."
}
