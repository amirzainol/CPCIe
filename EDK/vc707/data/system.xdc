#
# pin constraints
#
set_property LOC E18 [ get_ports CLK_N]
set_property IOSTANDARD LVDS [ get_ports CLK_N]

set_property LOC E19 [ get_ports CLK_P]
set_property IOSTANDARD LVDS [ get_ports CLK_P]

set_property LOC AV40 [ get_ports RESET]
set_property IOSTANDARD LVCMOS18 [ get_ports RESET]

set_property LOC AU33 [ get_ports RS232_Uart_1_sin]
set_property IOSTANDARD LVCMOS18 [ get_ports RS232_Uart_1_sin]

set_property LOC AU36 [ get_ports RS232_Uart_1_sout]
set_property IOSTANDARD LVCMOS18 [ get_ports RS232_Uart_1_sout]

#
# additional constraints
#
create_clock -name sys_clk_pin -period "5.0" [get_ports "CLK_P"]
