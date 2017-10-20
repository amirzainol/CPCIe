# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}


proc update_MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_S00_AXIS_TDATA_WIDTH". Setting updated value from the model parameter.
set_property value 32 ${MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_M00_AXIS_TDATA_WIDTH". Setting updated value from the model parameter.
set_property value 32 ${MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_START_COUNT { MODELPARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_M00_AXIS_START_COUNT". Setting updated value from the model parameter.
set_property value 32 ${MODELPARAM_VALUE.C_M00_AXIS_START_COUNT}
}

