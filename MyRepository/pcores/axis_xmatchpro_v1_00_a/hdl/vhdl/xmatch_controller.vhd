-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
-- Author: 			Mohd Amiruddin Zainol (mohd.a.zainol@gmail.com)
-- Entity: 			xmatch_controller.vhd
-- Version:			1.0
-- Description: This file is a controller for XMatch-PRO
--
-- Additional Comments:
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ENTITY: xmatch_controller
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ENTITY xmatch_controller IS
PORT
(
	S_AXIS_UC_IN_TREADY			: OUT	STD_LOGIC;
	S_AXIS_UC_IN_TDATA			: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	S_AXIS_UC_IN_TLAST			: IN  STD_LOGIC;
	S_AXIS_UC_IN_TVALID			: IN  STD_LOGIC;
	M_AXIS_UC_OUT_TVALID			: OUT	STD_LOGIC;
	M_AXIS_UC_OUT_TDATA			: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	M_AXIS_UC_OUT_TREADY			: IN  STD_LOGIC;
	M_AXIS_UC_OUT_TLAST			: OUT	STD_LOGIC;
	S_AXIS_CD_IN_TREADY			: OUT	STD_LOGIC;
	S_AXIS_CD_IN_TDATA			: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	S_AXIS_CD_IN_TLAST			: IN  STD_LOGIC;
	S_AXIS_CD_IN_TVALID			: IN  STD_LOGIC;
	M_AXIS_CD_OUT_TVALID			: OUT	STD_LOGIC;
	M_AXIS_CD_OUT_TDATA			: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	M_AXIS_CD_OUT_TREADY			: IN  STD_LOGIC;
	M_AXIS_CD_OUT_TLAST			: OUT	STD_LOGIC;
	XMATCH_RSTN						: IN  STD_LOGIC;
	XMATCH_CLK 						: IN  STD_LOGIC;
	HOST_RST							: IN  STD_LOGIC;
	HOST_CLK 						: IN  STD_LOGIC;
	HOST_DIN 						: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	HOST_WR_EN 						: IN  STD_LOGIC;
	HOST_RD_EN 						: IN  STD_LOGIC;
	HOST_DOUT 						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	HOST_FULL 						: OUT STD_LOGIC;
	HOST_EMPTY 						: OUT STD_LOGIC;
	XMATCH_CMD_CD					: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_BS					: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_FS					: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_CMD_UC					: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_C_SIZE					: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_C_STAT					: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_D_SIZE					: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	XMATCH_D_STAT					: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END xmatch_controller;

architecture Behavioral of xmatch_controller is

component level1r is port
(
	CS 								: in  bit;
	RW 								: in  bit;
	ADDRESSC							: in  bit_vector(3 downto 0);
	ADDRESSD							: in  bit_vector(3 downto 0);
	CONTROL_INC						: in  std_logic_vector(31 downto 0);
	CONTROL_IND						: in  std_logic_vector(31 downto 0);
	CONTROL_OUT_C					: out std_logic_vector (31 downto 0);
	CONTROL_OUT_D					: out std_logic_vector (31 downto 0);
	CLK 								: in  bit;
	CLEAR								: in bit;
	BUS_ACKNOWLEDGE_CC 			: in bit;
	BUS_ACKNOWLEDGE_CU 			: in bit;
	BUS_ACKNOWLEDGE_DC 			: in bit;
	BUS_ACKNOWLEDGE_DU 			: in bit;
	WAIT_CU							: in bit;
	WAIT_CC 							: in bit;
	WAIT_DC 							: in bit;
	WAIT_DU 							: in bit;
	U_DATAIN 						: in bit_vector(31 downto 0);
	C_DATAIN 						: in bit_vector(31 downto 0);
	U_DATAOUT						: out std_logic_vector(31 downto 0);
	C_DATAOUT 						: out std_logic_vector(31 downto 0);
	FINISHED_C 						: out bit;
	FINISHED_D 						: out bit;
	COMPRESSING 					: out bit;
	FLUSHING_C 						: out bit;
	FLUSHING_D 						: out bit;
	DECOMPRESSING 					: out bit;
	U_DATA_VALID 					: out bit;
	C_DATA_VALID 					: out bit;
	DECODING_OVERFLOW 			: out bit;
	CODING_OVERFLOW 				: out bit;
	CRC_ERROR 						: out bit;
	INTERRUPT_REQ_C 				: out bit;
	INTERRUPT_REQ_D 				: out bit;
   INTERRUPT_ACK_C 				: in  bit;
	INTERRUPT_ACK_D 				: in  bit;
	BUS_REQUEST_CC 				: out bit;
	BUS_REQUEST_CU 				: out bit;
	BUS_REQUEST_DC 				: out bit;
	BUS_REQUEST_DU 				: out bit
);
end component;

component xmp_ctlr_c is
port (
	S_AXIS_TREADY					: out	std_logic;
	S_AXIS_TDATA					: in  std_logic_vector(31 downto 0);
	S_AXIS_TLAST					: in  std_logic;
	S_AXIS_TVALID					: in  std_logic;
	M_AXIS_TVALID					: out	std_logic;
	M_AXIS_TDATA					: out	std_logic_vector(31 downto 0);
	M_AXIS_TREADY					: in  std_logic;
	M_AXIS_TLAST					: out	std_logic;
	XMATCH_CLK 						: in std_logic;
	XMATCH_RSTN						: in  std_logic;
	XMATCH_CMD_BS 					: in  std_logic_vector(31 downto 0);
	XMATCH_CMD_FS 					: in  std_logic_vector(31 downto 0);
	XMATCH_CMD_UC 					: in std_logic_vector(31 downto 0);
	CS_bit 							: out bit;
	RW_bit 							: out bit;
	ADDRESS_bit 					: out bit_vector(3 downto 0);
	CONTROL_std 					: out std_logic_vector(31 downto 0);
	BUS_ACK_CC_bit 				: out bit;
	BUS_ACK_CU_bit 				: out bit;
	WAIT_CU_bit 					: out bit;
	WAIT_CC_bit 					: out bit;
	U_DATAIN_bit 					: out bit_vector(31 downto 0);
	C_DATAOUT_std 					: in std_logic_vector(31 downto 0);
	FINISHED_C_bit 				: in bit;
	COMPRESSING_bit 				: in bit;
	C_DATA_VALID_bit 				: in bit;
	INTR_REQ_bit 					: in bit;
	INTR_ACK_bit 					: out bit;
	BUS_REQ_CC_bit 				: in bit;
	BUS_REQ_CU_bit 				: in bit;
	XMATCH_C_SIZE					: out std_logic_vector(31 downto 0);
	XMATCH_C_STAT					: out std_logic_vector(31 downto 0)
	);
end component;

component xmp_ctlr_d is
port (
	S_AXIS_TREADY					: out	std_logic;
	S_AXIS_TDATA					: in  std_logic_vector(31 downto 0);
	S_AXIS_TLAST					: in  std_logic;
	S_AXIS_TVALID					: in  std_logic;
	M_AXIS_TVALID					: out	std_logic;
	M_AXIS_TDATA					: out	std_logic_vector(31 downto 0);
	M_AXIS_TREADY					: in  std_logic;
	M_AXIS_TLAST					: out	std_logic;
	XMATCH_CLK 						: in std_logic;
	XMATCH_RSTN						: in  std_logic;
	XMATCH_CMD_CD 					: in std_logic_vector(31 downto 0);
	CLR_XMATCH_D 					: out std_logic;
	CS_bit 							: out bit;
	RW_bit 							: out bit;
	ADDRESS_bit 					: out bit_vector(3 downto 0);
	CONTROL_std 					: out std_logic_vector(31 downto 0);
	BUS_ACK_DC_bit 				: out bit;
	BUS_ACK_DU_bit 				: out bit;
	WAIT_DU_bit 					: out bit;
	WAIT_DC_bit 					: out bit;
	C_DATAIN_bit 					: out bit_vector(31 downto 0);
	U_DATAOUT_std 					: in std_logic_vector(31 downto 0);
	FINISHED_D_bit 				: in bit;
	DECOMPRESSING_bit 			: in bit;
	U_DATA_VALID_bit 				: in bit;
	INTR_REQ_bit 					: in bit;
	INTR_ACK_bit 					: out bit;
	BUS_REQ_DC_bit 				: in bit;
	BUS_REQ_DU_bit 				: in bit;
	XMATCH_D_SIZE					: out std_logic_vector(31 downto 0);
	XMATCH_D_STAT					: out std_logic_vector(31 downto 0)
	);
end component;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Connections
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

signal CS_bit						: bit;
signal RW_bit						: bit;
signal CS_C_bit					: bit;
signal RW_C_bit					: bit;
signal CS_D_bit					: bit;
signal RW_D_bit					: bit;
signal ADDRESSC_bit				: bit_vector (3 downto 0);
signal ADDRESSD_bit				: bit_vector (3 downto 0);
signal CONTROLC_std				: std_logic_vector (31 downto 0);
signal CONTROLD_std				: std_logic_vector (31 downto 0);
signal ADDRESS_D_bit				: bit_vector (3 downto 0);
signal CONTROL_D_std				: std_logic_vector (31 downto 0);
signal ADDRESS_C_bit				: bit_vector (3 downto 0);
signal CONTROL_C_std				: std_logic_vector (31 downto 0);
signal CLK_bit 					: bit;
signal CLEAR_bit					: bit;
signal BUS_ACKNOWLEDGE_CC_bit	: bit := '1';
signal BUS_ACKNOWLEDGE_CU_bit	: bit := '1';
signal BUS_ACKNOWLEDGE_DC_bit	: bit := '1';
signal BUS_ACKNOWLEDGE_DU_bit : bit := '1';
signal WAIT_CU_bit				: bit;
signal WAIT_CC_bit 				: bit;
signal WAIT_DC_bit 				: bit;
signal WAIT_DU_bit 				: bit;
signal U_DATAIN_bit				: bit_vector (31 downto 0);
signal C_DATAIN_bit				: bit_vector (31 downto 0);
signal C_DATAOUT_std				: std_logic_vector (31 downto 0);
signal U_DATAOUT_std				: std_logic_vector (31 downto 0);
signal FINISHED_C_bit 			: bit;
signal FINISHED_D_bit			: bit;
signal U_DATA_VALID_bit 		: bit;
signal C_DATA_VALID_bit 		: bit;
signal BUS_REQUEST_CC_bit 		: bit;
signal BUS_REQUEST_CU_bit		: bit;
signal BUS_REQUEST_DC_bit		: bit;
signal BUS_REQUEST_DU_bit		: bit;
signal COMPRESSING_bit			: bit;
signal FLUSHING_C_bit			: bit;
signal FLUSHING_D_bit			: bit;
signal DECOMPRESSING_bit		: bit;
signal DECODING_OVERFLOW_bit 	: bit;
signal CODING_OVERFLOW_bit 	: bit;
signal CRC_ERROR_bit				: bit;
signal INTERRUPT_REQ_C_bit 	: bit;
signal INTERRUPT_ACK_C_bit 	: bit;
signal INTERRUPT_REQ_D_bit 	: bit;
signal INTERRUPT_ACK_D_bit 	: bit;

signal clr_CODMU					:  std_logic;

--signal CLR_XMATCH_C			:  std_logic := '1';
signal CLR_XMATCH_D_r			:  std_logic;

begin

	HOST_DOUT 						<= x"414D4952";
	HOST_FULL 						<= '0';
	HOST_EMPTY 						<= '0';

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Connections
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CS_bit				<= CS_C_bit and CS_D_bit;
RW_bit				<= RW_C_bit and RW_D_bit;
ADDRESSC_bit		<= ADDRESS_C_bit;
ADDRESSD_bit		<= ADDRESS_D_bit;
CONTROLC_std		<= CONTROL_C_std;
CONTROLD_std		<= CONTROL_D_std;

-- Clock and Reset Declaration,
-- convert from std_logic to bit to be used in Xmatch
CLK_bit		<= to_bit (XMATCH_CLK);
--CLEAR_bit 	<= (to_bit (CLR_XMATCH_C)) xor (to_bit (not CLR_XMATCH_D));
--CLEAR_bit <= to_bit (XMATCH_RSTN) and (to_bit(CLR_XMATCH_D_r));
CLEAR_bit <= to_bit (XMATCH_RSTN);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PORT MAPPING
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

xmatchpro : level1r
port map (
	CS 							=> CS_bit, -- in bit
	RW 							=> RW_bit, -- in bit
	ADDRESSC						=> ADDRESSC_bit, -- in bit_vector(3 downto 0)
	ADDRESSD						=> ADDRESSD_bit, -- in bit_vector(3 downto 0)
	CONTROL_INC					=> CONTROLC_std, -- in std_logic_vector(31 downto 0)
	CONTROL_IND					=> CONTROLD_std, -- in std_logic_vector(31 downto 0)
	CONTROL_OUT_C				=> open, -- out std_logic_vector (31 downto 0)
	CONTROL_OUT_D				=> open, -- out std_logic_vector (31 downto 0)
	CLK							=> CLK_bit, -- in bit
	CLEAR 						=> CLEAR_bit, -- in bit
	BUS_ACKNOWLEDGE_CC 		=> BUS_ACKNOWLEDGE_CC_bit, -- in bit
	BUS_ACKNOWLEDGE_CU 		=> BUS_ACKNOWLEDGE_CU_bit, -- in bit
	BUS_ACKNOWLEDGE_DC 		=> BUS_ACKNOWLEDGE_DC_bit, -- in bit
	BUS_ACKNOWLEDGE_DU 		=> BUS_ACKNOWLEDGE_DU_bit, -- in bit
	WAIT_CU 						=> WAIT_CU_bit, -- in bit
   WAIT_CC 						=> WAIT_CC_bit, -- in bit
   WAIT_DC 						=> WAIT_DC_bit, -- in bit
	WAIT_DU 						=> WAIT_DU_bit, -- in bit
	U_DATAIN 					=> U_DATAIN_bit, -- in bit_vector(31 downto 0)
	C_DATAIN 					=> C_DATAIN_bit, -- in bit_vector(31 downto 0)
	U_DATAOUT 					=> U_DATAOUT_std, -- out std_logic_vector(31 downto 0)
	C_DATAOUT 					=> C_DATAOUT_std, -- out std_logic_vector(31 downto 0)
	FINISHED_C 					=> FINISHED_C_bit, -- out bit
	FINISHED_D 					=> FINISHED_D_bit, -- out bit
	COMPRESSING 				=> COMPRESSING_bit, -- out bit
	FLUSHING_C 					=> FLUSHING_C_bit, -- out bit
	FLUSHING_D 					=> FLUSHING_D_bit, -- out bit
	DECOMPRESSING 				=> DECOMPRESSING_bit, -- out bit
	U_DATA_VALID 				=> U_DATA_VALID_bit, -- out bit
	C_DATA_VALID 				=> C_DATA_VALID_bit, -- out bit
	DECODING_OVERFLOW 		=> DECODING_OVERFLOW_bit, -- out bit
	CODING_OVERFLOW 			=> CODING_OVERFLOW_bit, -- out bit
	CRC_ERROR 					=> CRC_ERROR_bit, -- out bit
	INTERRUPT_REQ_C 			=> INTERRUPT_REQ_C_bit, -- out bit
	INTERRUPT_REQ_D 			=> INTERRUPT_REQ_D_bit, -- out bit
   INTERRUPT_ACK_C 			=> INTERRUPT_ACK_C_bit, -- in bit
	INTERRUPT_ACK_D 			=> INTERRUPT_ACK_D_bit, -- in bit
	BUS_REQUEST_CC 			=> BUS_REQUEST_CC_bit, -- out bit
	BUS_REQUEST_CU 			=> BUS_REQUEST_CU_bit, -- out bit
	BUS_REQUEST_DC 			=> BUS_REQUEST_DC_bit, -- out bit
	BUS_REQUEST_DU 			=> BUS_REQUEST_DU_bit -- out bit

);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PORT MAPPING
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

c_controller : xmp_ctlr_c
port map (
		S_AXIS_TREADY			=> S_AXIS_UC_IN_TREADY,
		S_AXIS_TDATA			=> S_AXIS_UC_IN_TDATA,
		S_AXIS_TLAST			=> S_AXIS_UC_IN_TLAST,
		S_AXIS_TVALID			=> S_AXIS_UC_IN_TVALID,
		M_AXIS_TVALID			=> M_AXIS_UC_OUT_TVALID,
		M_AXIS_TDATA			=> M_AXIS_UC_OUT_TDATA,
		M_AXIS_TREADY			=> M_AXIS_UC_OUT_TREADY,
		M_AXIS_TLAST			=> M_AXIS_UC_OUT_TLAST,
		XMATCH_CLK 				=> XMATCH_CLK,
		XMATCH_RSTN 			=> XMATCH_RSTN,
		XMATCH_CMD_BS 			=> XMATCH_CMD_BS,
		XMATCH_CMD_FS 			=> XMATCH_CMD_FS,
		XMATCH_CMD_UC 			=> XMATCH_CMD_UC,
		CS_bit 					=> CS_C_bit,
		RW_bit 					=> RW_C_bit,
		ADDRESS_bit 			=> ADDRESS_C_bit,
		CONTROL_std 			=> CONTROL_C_std,
		BUS_ACK_CC_bit 		=> BUS_ACKNOWLEDGE_CC_bit,
		BUS_ACK_CU_bit 		=> BUS_ACKNOWLEDGE_CU_bit,
		WAIT_CU_bit 			=> WAIT_CU_bit,
		WAIT_CC_bit 			=> WAIT_CC_bit,
		U_DATAIN_bit 			=> U_DATAIN_bit,
		C_DATAOUT_std 			=> C_DATAOUT_std,
		FINISHED_C_bit 		=> FINISHED_C_bit,
		COMPRESSING_bit 		=> COMPRESSING_bit,
		C_DATA_VALID_bit 		=> C_DATA_VALID_bit,
		INTR_REQ_bit 			=> INTERRUPT_REQ_C_bit,
		INTR_ACK_bit 			=> INTERRUPT_ACK_C_bit,
		BUS_REQ_CC_bit 		=> BUS_REQUEST_CC_bit,
		BUS_REQ_CU_bit 		=> BUS_REQUEST_CU_bit,
		XMATCH_C_SIZE			=> XMATCH_C_SIZE,
		XMATCH_C_STAT			=> XMATCH_C_STAT
);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PORT MAPPING
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d_controller : xmp_ctlr_d
port map (
		S_AXIS_TREADY			=> S_AXIS_CD_IN_TREADY,
		S_AXIS_TDATA			=> S_AXIS_CD_IN_TDATA,
		S_AXIS_TLAST			=> S_AXIS_CD_IN_TLAST,
		S_AXIS_TVALID			=> S_AXIS_CD_IN_TVALID,
		M_AXIS_TVALID			=> M_AXIS_CD_OUT_TVALID,
		M_AXIS_TDATA			=> M_AXIS_CD_OUT_TDATA,
		M_AXIS_TREADY			=> M_AXIS_CD_OUT_TREADY,
		M_AXIS_TLAST			=> M_AXIS_CD_OUT_TLAST,
		XMATCH_CLK 				=> XMATCH_CLK,
		XMATCH_RSTN 			=> XMATCH_RSTN,
		XMATCH_CMD_CD 			=> XMATCH_CMD_CD,
		CLR_XMATCH_D			=> CLR_XMATCH_D_r,
		CS_bit 					=> CS_D_bit,
		RW_bit 					=> RW_D_bit,
		ADDRESS_bit 			=> ADDRESS_D_bit,
		CONTROL_std 			=> CONTROL_D_std,
		BUS_ACK_DC_bit 		=> BUS_ACKNOWLEDGE_DC_bit,
		BUS_ACK_DU_bit 		=> BUS_ACKNOWLEDGE_DU_bit,
		WAIT_DU_bit 			=> WAIT_DU_bit,
		WAIT_DC_bit 			=> WAIT_DC_bit,
		C_DATAIN_bit 			=> C_DATAIN_bit,
		U_DATAOUT_std 			=> U_DATAOUT_std,
		FINISHED_D_bit 		=> FINISHED_D_bit,
		DECOMPRESSING_bit 	=> DECOMPRESSING_bit,
		U_DATA_VALID_bit 		=> U_DATA_VALID_bit,
		INTR_REQ_bit 			=> INTERRUPT_REQ_D_bit,
		INTR_ACK_bit 			=> INTERRUPT_ACK_D_bit,
		BUS_REQ_DC_bit 		=> BUS_REQUEST_DC_bit,
		BUS_REQ_DU_bit 		=> BUS_REQUEST_DU_bit,
		XMATCH_D_SIZE			=> XMATCH_D_SIZE,
		XMATCH_D_STAT			=> XMATCH_D_STAT
);

end Behavioral;
