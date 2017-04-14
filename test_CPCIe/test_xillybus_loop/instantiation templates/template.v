  // Clock and quiesce
  wire  bus_clk;
  wire  quiesce;


  // Wires related to /dev/xillybus_hcr
  wire  user_r_hcr_rden;
  wire  user_r_hcr_empty;
  wire [31:0] user_r_hcr_data;
  wire  user_r_hcr_eof;
  wire  user_r_hcr_open;

  // Wires related to /dev/xillybus_hcw
  wire  user_w_hcw_wren;
  wire  user_w_hcw_full;
  wire [31:0] user_w_hcw_data;
  wire  user_w_hcw_open;


  xillybus xillybus_ins (

    // Ports related to /dev/xillybus_hcr
    // FPGA to CPU signals:
    .user_r_hcr_rden(user_r_hcr_rden),
    .user_r_hcr_empty(user_r_hcr_empty),
    .user_r_hcr_data(user_r_hcr_data),
    .user_r_hcr_eof(user_r_hcr_eof),
    .user_r_hcr_open(user_r_hcr_open),


    // Ports related to /dev/xillybus_hcw
    // CPU to FPGA signals:
    .user_w_hcw_wren(user_w_hcw_wren),
    .user_w_hcw_full(user_w_hcw_full),
    .user_w_hcw_data(user_w_hcw_data),
    .user_w_hcw_open(user_w_hcw_open),


    // General signals
    .PCIE_PERST_B_LS(PCIE_PERST_B_LS),
    .PCIE_REFCLK_N(PCIE_REFCLK_N),
    .PCIE_REFCLK_P(PCIE_REFCLK_P),
    .PCIE_RX_N(PCIE_RX_N),
    .PCIE_RX_P(PCIE_RX_P),
    .GPIO_LED(GPIO_LED),
    .PCIE_TX_N(PCIE_TX_N),
    .PCIE_TX_P(PCIE_TX_P),
    .bus_clk(bus_clk),
    .quiesce(quiesce)
  );
