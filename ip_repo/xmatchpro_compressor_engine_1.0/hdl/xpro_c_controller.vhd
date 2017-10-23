--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.

--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--Lesser General Public License for more details.

--You should have received a copy of the GNU Lesser General Public
--License along with this library; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

-- e_mail : mohd.a.zainol@gmail.com

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
--  ENTITY          : xpro_c_controller 
--      version     : 1.0            
--      last update : 20/10/2017     
--      author      : Mohd A. Zainol
-- 
--  FUNCTION                       
--      Compressor Controller for X-MatchPRO.
-- 
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xpro_c_controller is
	Port(
		CLK           : in  STD_LOGIC;
		CLEAR         : in  STD_LOGIC;
		COMMAND       : in  STD_LOGIC_VECTOR(31 downto 0);
		RESTART       : in  STD_LOGIC;
		BUS_REQ_CU    : in  STD_LOGIC;
		BUS_REQ_CC    : in  STD_LOGIC;
		BUS_ACK_CU    : out STD_LOGIC;
		BUS_ACK_CC    : out STD_LOGIC;
		INTR_ACK_C    : out STD_LOGIC;
		INTR_REQ_C    : in  STD_LOGIC;
		WAIT_CU       : out STD_LOGIC;
		WAIT_CC       : out STD_LOGIC;
		CS_RW         : out STD_LOGIC;
		ADDR          : out STD_LOGIC_VECTOR(3 downto 0);
		CTRL_IN       : out STD_LOGIC_VECTOR(31 downto 0);
		RST_FIFO_CC   : out STD_LOGIC;
		RST_FIFO_CU   : out STD_LOGIC;
		RST_ENGINE    : out STD_LOGIC;
		WAIT_CU_START : out STD_LOGIC;
		WAIT_CU_DONE  : out STD_LOGIC;
		FIFO_CU_EMPTY : in  STD_LOGIC
	);
end xpro_c_controller;

architecture arch of xpro_c_controller is

	signal BUS_ACK_CU_signal                   : STD_LOGIC := '1';
	signal BUS_ACK_CC_signal                   : STD_LOGIC := '1';
	signal INTR_ACK_C_signal                   : STD_LOGIC := '1';
	signal BUS_ACKNOWLEDGE_CU1signal           : STD_LOGIC := '1';
	signal init_cs_ff                          : STD_LOGIC := '0';
	signal init_cs_ff2                         : STD_LOGIC := '0';
	signal init_pulse                          : STD_LOGIC := '0';
	type state is (IDLE, INIT_CTRL_IN_1_SM, INIT_CTRL_IN_2_SM, DONE, DONE_NEXT);
	signal mst_exec_state, mst_exec_state_next : state;
	signal init_RST_FIFO_CC_ff                 : STD_LOGIC := '0';
	signal init_RST_FIFO_CC_ff2                : STD_LOGIC := '0';
	signal init_RST_FIFO_CU_ff                 : STD_LOGIC := '0';
	signal init_RST_FIFO_CU_ff2                : STD_LOGIC := '0';
	signal init_RST_ENGINE_ff                  : STD_LOGIC := '0';
	signal init_RST_ENGINE_ff2                 : STD_LOGIC := '0';
	signal init_RST_ALL_ff                     : STD_LOGIC := '0';
	signal init_RST_ALL_ff2                    : STD_LOGIC := '0';
	signal RST_ALL                             : STD_LOGIC := '1';
	signal c_size_counter                      : STD_LOGIC_VECTOR(15 downto 0);

	signal CS_RW_i             : STD_LOGIC;
	signal ADDR_i              : STD_LOGIC_VECTOR(3 downto 0);
	signal CTRL_IN_i           : STD_LOGIC_VECTOR(31 downto 0);
	signal WAIT_CU_START_ff    : std_logic := '0';
	signal WAIT_CU_START_aux   : std_logic := '0';
	signal WAIT_CU_START_aux_i : std_logic := '0';
	signal WAIT_CU_DONE_aux    : std_logic := '0';
	signal WAIT_CU_DONE_aux_i  : std_logic := '0';

	signal INTR_ACK_C_i   : std_logic := '1';
	signal RST_ENGINE_aux : std_logic := '1';

begin

	RST_FIFO_CC <= ((not init_RST_FIFO_CC_ff2) and init_RST_FIFO_CC_ff) or (not RST_ALL);
	RST_FIFO_CU <= ((not init_RST_FIFO_CU_ff2) and init_RST_FIFO_CU_ff) or (not RST_ALL);
	RST_ENGINE  <= (init_RST_ENGINE_ff2 or (not init_RST_ENGINE_ff)) and RST_ALL;
	BUS_ACK_CU  <= BUS_ACK_CU_signal;
	BUS_ACK_CC  <= BUS_ACK_CC_signal;
	--    INTR_ACK_C <= INTR_ACK_C_signal or (not COMMAND(28));
	WAIT_CC     <= '1';
	WAIT_CU     <= (not BUS_ACKNOWLEDGE_CU1signal) and (not BUS_REQ_CU);
	--    WAIT_CU_START <= WAIT_CU_START_aux;

	--Generate a pulse to initiate AXI transaction.
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				BUS_ACK_CC_signal         <= '1';
				BUS_ACK_CU_signal         <= '1';
				INTR_ACK_C_signal         <= '1';
				BUS_ACKNOWLEDGE_CU1signal <= '1';
			else
				BUS_ACK_CC_signal         <= BUS_REQ_CC;
				BUS_ACK_CU_signal         <= BUS_REQ_CU;
				INTR_ACK_C_signal         <= INTR_REQ_C;
				BUS_ACKNOWLEDGE_CU1signal <= BUS_ACK_CU_signal;
			end if;
		end if;
	end process;

	--Generate a pulse to initiate init_pulse
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				init_cs_ff  <= '0';
				init_cs_ff2 <= '0';
			else
				init_cs_ff  <= COMMAND(24);
				init_cs_ff2 <= init_cs_ff;
			end if;
		end if;
	end process;
	init_pulse <= (not init_cs_ff2) and init_cs_ff;

	SYNC_PROC : process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (RST_ALL = '0' or CLEAR = '0') then
				mst_exec_state   <= IDLE;
				CS_RW            <= '1';
				ADDR             <= (others => '0');
				CTRL_IN          <= (others => '0');
				INTR_ACK_C       <= '1';
				WAIT_CU_START    <= '0';
				WAIT_CU_START_ff <= '0';
				WAIT_CU_DONE     <= '0';
			else
				mst_exec_state   <= mst_exec_state_next;
				CS_RW            <= CS_RW_i;
				ADDR             <= ADDR_i;
				CTRL_IN          <= CTRL_IN_i;
				INTR_ACK_C       <= INTR_ACK_C_i;
				WAIT_CU_START    <= WAIT_CU_START_aux_i;
				WAIT_CU_START_ff <= WAIT_CU_START_aux_i;
				WAIT_CU_DONE     <= WAIT_CU_DONE_aux_i;
			end if;
		end if;
	end process;

	NEXT_STATE_DECODE : process(mst_exec_state, init_pulse, RESTART, FIFO_CU_EMPTY, BUS_REQ_CU, INTR_REQ_C)
	begin
		mst_exec_state_next <= mst_exec_state;
		CS_RW_i             <= '1';
		INTR_ACK_C_i        <= '1';
		ADDR_i              <= (others => '0');
		CTRL_IN_i           <= (others => '0');
		WAIT_CU_START_aux_i <= WAIT_CU_START_ff;
		WAIT_CU_DONE_aux_i  <= '0';

		case (mst_exec_state) is

			when IDLE =>
				if (init_pulse = '1') then
					WAIT_CU_START_aux_i <= '0';
					WAIT_CU_DONE_aux_i  <= '0';
					mst_exec_state_next <= INIT_CTRL_IN_1_SM;
				else
					mst_exec_state_next <= IDLE;
				end if;

			when INIT_CTRL_IN_1_SM =>
				CS_RW_i             <= '0';
				ADDR_i              <= "1101";
				CTRL_IN_i           <= "000000000000000" & COMMAND(7 downto 0) & "000000000";
				mst_exec_state_next <= INIT_CTRL_IN_2_SM;

			when INIT_CTRL_IN_2_SM =>
				CS_RW_i             <= '0';
				ADDR_i              <= "1100";
				CTRL_IN_i           <= "0000000000000000" & "0100" & COMMAND(15 downto 8) & "1000";
				mst_exec_state_next <= DONE;

			when DONE =>
				if (FIFO_CU_EMPTY = '0') then
					WAIT_CU_START_aux_i <= '1';
					mst_exec_state_next <= DONE_NEXT;
				end if;

			when DONE_NEXT =>
				WAIT_CU_START_aux_i <= '1';
				if (RESTART = '0') then
					WAIT_CU_START_aux_i <= '0';
					WAIT_CU_DONE_aux_i  <= '0';
					mst_exec_state_next <= INIT_CTRL_IN_1_SM;
				end if;

			when others =>
				mst_exec_state_next <= IDLE;

		end case;
	end process;

	-- RESET FUNCTIONS

	--Generate a pulse to initiate RST_FIFO_CC
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				init_RST_FIFO_CC_ff  <= '0';
				init_RST_FIFO_CC_ff2 <= '0';
			else
				init_RST_FIFO_CC_ff  <= COMMAND(25);
				init_RST_FIFO_CC_ff2 <= init_RST_FIFO_CC_ff;
			end if;
		end if;
	end process;

	--Generate a pulse to initiate RST_FIFO_CU
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				init_RST_FIFO_CU_ff  <= '0';
				init_RST_FIFO_CU_ff2 <= '0';
			else
				init_RST_FIFO_CU_ff  <= COMMAND(26);
				init_RST_FIFO_CU_ff2 <= init_RST_FIFO_CU_ff;
			end if;
		end if;
	end process;

	--Generate a pulse to initiate RST_ENGINE
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				init_RST_ENGINE_ff  <= '0';
				init_RST_ENGINE_ff2 <= '0';
			else
				init_RST_ENGINE_ff  <= COMMAND(27);
				init_RST_ENGINE_ff2 <= init_RST_ENGINE_ff;
			end if;
		end if;
	end process;

	--Generate a pulse to initiate RST_ALL
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				init_RST_ALL_ff  <= '0';
				init_RST_ALL_ff2 <= '0';
			else
				init_RST_ALL_ff  <= COMMAND(31);
				init_RST_ALL_ff2 <= init_RST_ALL_ff;
			end if;
		end if;
	end process;

	RST_ALL <= init_RST_ALL_ff2 or (not init_RST_ALL_ff);

end arch;
