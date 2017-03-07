library ieee;
use ieee.std_logic_1164.all;

package xil_comp is
  component DP_RAM_XILINX_256 IS
	port (
	addra: IN std_logic_VECTOR(7 downto 0);
	addrb: IN std_logic_VECTOR(7 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(31 downto 0);
	doutb: OUT std_logic_VECTOR(31 downto 0);
	enb: IN std_logic;
	wea: IN std_logic_vector(0 downto 0));
END component;

component DP_RAM_XILINX_512 IS
	port (
	addra: IN std_logic_VECTOR(8 downto 0);
	addrb: IN std_logic_VECTOR(8 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(31 downto 0);
	doutb: OUT std_logic_VECTOR(31 downto 0);
	enb: IN std_logic;
	wea: IN std_logic_vector(0 downto 0));
END component;

component DP_RAM_XILINX_MASK IS
	port (
	addra: IN std_logic_VECTOR(7 downto 0);
	addrb: IN std_logic_VECTOR(7 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(3 downto 0);
	doutb: OUT std_logic_VECTOR(3 downto 0);
	enb: IN std_logic;
	wea: IN std_logic_vector(0 downto 0));
END component;
end package;