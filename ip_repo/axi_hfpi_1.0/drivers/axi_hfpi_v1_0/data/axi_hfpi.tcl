

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "axi_hfpi" "NUM_INSTANCES" "DEVICE_ID"  "C_S_0_AXI_LITE_BASEADDR" "C_S_0_AXI_LITE_HIGHADDR" "C_S_1_AXI_LITE_BASEADDR" "C_S_1_AXI_LITE_HIGHADDR"
}
