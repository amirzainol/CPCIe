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
--  ENTITY          : xpro_d_controller 
--      version     : 1.0            
--      last update : 20/10/2017     
--      author      : Mohd A. Zainol
-- 
--  FUNCTION                       
--      Decompressor Controller for X-MatchPRO.
-- 
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xpro_d_controller is
	Port(
		CLK             : in  STD_LOGIC;
		CLEAR           : in  STD_LOGIC;
		COMMAND         : in  STD_LOGIC_VECTOR(31 downto 0);
		COMPRESSED_SIZE : in  STD_LOGIC_VECTOR(15 downto 0);
		RESTART         : in  STD_LOGIC;
		BUS_REQ_DC      : in  STD_LOGIC;
		BUS_REQ_DU      : in  STD_LOGIC;
		BUS_ACK_DC      : out STD_LOGIC;
		BUS_ACK_DU      : out STD_LOGIC;
		INTR_ACK_D      : out STD_LOGIC;
		INTR_REQ_D      : in  STD_LOGIC;
		CS_RW           : out STD_LOGIC;
		ADDR            : out STD_LOGIC_VECTOR(3 downto 0);
		CTRL_IN         : out STD_LOGIC_VECTOR(31 downto 0);
		RST_FIFO_DU     : out STD_LOGIC;
		RST_FIFO_DC     : out STD_LOGIC;
		RST_ENGINE      : out STD_LOGIC;
		FIFO_DC_EMPTY   : in  STD_LOGIC;
		ENGINE_C_DATAIN : out STD_LOGIC_VECTOR(31 downto 0);
		ENGINE_C_TVALID : in STD_LOGIC;
		ENGINE_C_TREADY : out STD_LOGIC;
		ENGINE_U_TDATA  : in  STD_LOGIC_VECTOR(31 downto 0);
		ENGINE_U_TVALID : in  STD_LOGIC;
		ENGINE_U_TREADY : out STD_LOGIC;
		FIFO_DC_TDATA   : in  STD_LOGIC_VECTOR(31 downto 0);
		FIFO_DC_TREADY  : out STD_LOGIC;
		FIFO_DC_TVALID  : in  STD_LOGIC;
		FIFO_DU_TDATA   : out STD_LOGIC_VECTOR(31 downto 0);
		FIFO_DU_TREADY  : in  STD_LOGIC;
		FIFO_DU_TVALID  : out STD_LOGIC
	);
end xpro_d_controller;

architecture arch of xpro_d_controller is

	signal BUS_ACK_DC_signal         : STD_LOGIC := '1';
	signal BUS_ACK_DU_signal         : STD_LOGIC := '1';
	signal INTR_ACK_D_signal         : STD_LOGIC := '1';
	signal BUS_ACKNOWLEDGE_DC1signal : STD_LOGIC := '1';
	signal init_cs_ff                : STD_LOGIC := '0';
	signal init_cs_ff2               : STD_LOGIC := '0';
	signal init_pulse                : STD_LOGIC := '0';
	type state is (IDLE, INIT_CTRL_IN_1_SM, INIT_CTRL_IN_2_SM, START, INIT_COMPRESSED_SIZE, COUNT_COMPRESSED_SIZE, WAIT_INTR_REQ);
	signal mst_exec_state            : state;
	signal init_RST_FIFO_DU_ff       : STD_LOGIC := '0';
	signal init_RST_FIFO_DU_ff2      : STD_LOGIC := '0';
	signal init_RST_FIFO_DC_ff       : STD_LOGIC := '0';
	signal init_RST_FIFO_DC_ff2      : STD_LOGIC := '0';
	signal init_RST_ENGINE_ff        : STD_LOGIC := '0';
	signal init_RST_ENGINE_ff2       : STD_LOGIC := '0';
	signal init_RST_ALL_ff           : STD_LOGIC := '0';
	signal init_RST_ALL_ff2          : STD_LOGIC := '0';
	signal RST_ALL                   : STD_LOGIC := '1';

--	signal c_size_counter : STD_LOGIC_VECTOR(15 downto 0);

	signal FIFO_DC_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0);
	signal FIFO_DC_TVALID_aux : STD_LOGIC;
	signal FIFO_DC_TREADY_aux : STD_LOGIC := '0';

	signal FIFO_DU_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal FIFO_DU_TVALID_aux : STD_LOGIC                     := '0';
	signal FIFO_DU_TREADY_aux : STD_LOGIC;

	-- new
	signal M_AXIS_tdata_dly_aux    : std_logic_vector(31 downto 0);
	signal M_AXIS_tdata_dly_X      : std_logic_vector(31 downto 0);
	signal WAIT_DC_aux             : std_logic;
	signal M_AXIS_tvalid_dly_1_aux : std_logic;
	signal M_AXIS_tvalid_dly_2_aux : std_logic;
	signal WAIT_DC_TVALID_dly_aux  : std_logic;
	signal WAIT_DC_TVALID_aux      : std_logic;
--	signal COUNT_FINISH_aux        : std_logic;
	signal ENGINE_C_TVALID_aux     : std_logic;
	signal FIFO_DC_TREADY_dly_aux  : std_logic;

	signal init_ENGINE_C_TVALID_ff : std_logic;
	signal ENGINE_C_TVALID_i : std_logic;
	signal input_count_down : STD_LOGIC_VECTOR(15 downto 0);
	signal input_count_finish : std_logic;
	signal ENGINE_C_TVALID_start : std_logic;
					
begin

	FIFO_DU_TVALID_aux <= not ENGINE_U_TVALID;
	FIFO_DU_TDATA_aux  <= ENGINE_U_TDATA;
	ENGINE_U_TREADY    <= FIFO_DU_TREADY_aux;

    ENGINE_C_TVALID_aux <= ENGINE_C_TVALID;
    
--    ENGINE_C_TVALID    <= ENGINE_C_TVALID_aux; -- not used?
--	ENGINE_C_TVALID_aux <= (M_AXIS_tvalid_dly_1_aux and M_AXIS_tvalid_dly_2_aux); -- not used?
	
--	ENGINE_C_TREADY     <= COUNT_FINISH_aux or FIFO_DC_TREADY_dly_aux;
	--    ENGINE_C_TREADY <= FIFO_DC_TREADY_dly_aux;
	ENGINE_C_TREADY     <= input_count_finish or FIFO_DC_TREADY_dly_aux;
	
	WAIT_DC_aux        <= (not BUS_ACKNOWLEDGE_DC1signal) and (not BUS_REQ_DC);
	ENGINE_C_DATAIN    <= M_AXIS_tdata_dly_aux when WAIT_DC_aux = '1' else M_AXIS_tdata_dly_X;
	WAIT_DC_TVALID_aux <= WAIT_DC_aux and FIFO_DC_TVALID_aux;
--	FIFO_DC_TREADY_aux <= (WAIT_DC_TVALID_aux and WAIT_DC_TVALID_dly_aux) when COUNT_FINISH_aux = '0' else '0';
    FIFO_DC_TREADY_aux <= (WAIT_DC_TVALID_aux and WAIT_DC_TVALID_dly_aux);
	

	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if CLEAR = '0' then
				M_AXIS_tdata_dly_aux <= (others => '0');
			elsif FIFO_DC_TREADY_aux = '1' then
				M_AXIS_tdata_dly_aux <= FIFO_DC_TDATA_aux;
			end if;
		end if;
	end process;

	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if CLEAR = '0' then
				M_AXIS_tdata_dly_X <= (others => '0');
			elsif WAIT_DC_aux = '1' then
				M_AXIS_tdata_dly_X <= M_AXIS_tdata_dly_aux;
			end if;
		end if;
	end process;

	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if CLEAR = '0' then
				WAIT_DC_TVALID_dly_aux <= '0';
				FIFO_DC_TREADY_dly_aux <= '0';
			else
				WAIT_DC_TVALID_dly_aux <= WAIT_DC_TVALID_aux;
				FIFO_DC_TREADY_dly_aux <= FIFO_DC_TREADY_aux;
			end if;
		end if;
	end process;

	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if CLEAR = '0' then
				M_AXIS_tvalid_dly_1_aux <= '0';
				M_AXIS_tvalid_dly_2_aux <= '0';
			else
				M_AXIS_tvalid_dly_1_aux <= FIFO_DC_TVALID_aux;
				M_AXIS_tvalid_dly_2_aux <= M_AXIS_tvalid_dly_1_aux;
			end if;
		end if;
	end process;

	FIFO_DC_TDATA_aux  <= FIFO_DC_TDATA;
	FIFO_DC_TREADY     <= FIFO_DC_TREADY_aux;
	FIFO_DC_TVALID_aux <= FIFO_DC_TVALID;
	FIFO_DU_TDATA      <= FIFO_DU_TDATA_aux;
	FIFO_DU_TREADY_aux <= FIFO_DU_TREADY;
	FIFO_DU_TVALID     <= FIFO_DU_TVALID_aux;

	RST_FIFO_DU <= ((not init_RST_FIFO_DU_ff2) and init_RST_FIFO_DU_ff) or (not RST_ALL);
	RST_FIFO_DC <= ((not init_RST_FIFO_DC_ff2) and init_RST_FIFO_DC_ff) or (not RST_ALL);
	RST_ENGINE  <= (init_RST_ENGINE_ff2 or (not init_RST_ENGINE_ff)) and RST_ALL;
	BUS_ACK_DC  <= BUS_ACK_DC_signal;
	BUS_ACK_DU  <= BUS_ACK_DU_signal;
	INTR_ACK_D  <= INTR_ACK_D_signal or (not COMMAND(28));

	--Generate a pulse to initiate AXI transaction.
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				BUS_ACK_DU_signal         <= '1';
				BUS_ACK_DC_signal         <= '1';
				INTR_ACK_D_signal         <= '1';
				BUS_ACKNOWLEDGE_DC1signal <= '1';
			else
				BUS_ACK_DU_signal         <= BUS_REQ_DU;
				BUS_ACK_DC_signal         <= BUS_REQ_DC;
				INTR_ACK_D_signal         <= INTR_REQ_D;
				BUS_ACKNOWLEDGE_DC1signal <= BUS_ACK_DC_signal;
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

	--implement master command interface state machine
	MASTER_EXECUTION_PROC : process(CLK, init_pulse, RESTART, ENGINE_C_TVALID_aux, FIFO_DC_TREADY_dly_aux, input_count_down, INTR_REQ_D)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (RST_ALL = '0') then
				-- reset condition: using RST_ALL
				-- All the signals are default values under reset condition
				mst_exec_state <= IDLE;
				CS_RW          <= '1';
				ADDR           <= (others => '0');
				CTRL_IN        <= (others => '0');
				input_count_finish <= '0';
				ENGINE_C_TVALID_start <= '0';
			else
				-- state transition
				case (mst_exec_state) is

					when IDLE =>
					   input_count_finish <= '0';
						if ((init_pulse = '1') or (RESTART = '1')) then
							mst_exec_state <= INIT_CTRL_IN_1_SM;
						else
							mst_exec_state <= IDLE;
						end if;

					when INIT_CTRL_IN_1_SM =>
						CS_RW          <= '0';
						ADDR           <= "1001";
						CTRL_IN        <= "000000000000000" & COMMAND(7 downto 0) & "000000000";
						mst_exec_state <= INIT_CTRL_IN_2_SM;

					when INIT_CTRL_IN_2_SM =>
						CS_RW          <= '0';
						ADDR           <= "1000";
						CTRL_IN        <= "0000000000000000" & "0100" & COMMAND(15 downto 8) & "0000";
						mst_exec_state <= START;

					when START =>
						CS_RW          <= '1';
						ADDR           <= (others => '0');
						CTRL_IN        <= (others => '0');
						mst_exec_state <= INIT_COMPRESSED_SIZE;

				    when INIT_COMPRESSED_SIZE =>
				        if ENGINE_C_TVALID_aux = '1' then
				            input_count_down <= COMPRESSED_SIZE + 2;
				            ENGINE_C_TVALID_start <= '1';
				            mst_exec_state <= COUNT_COMPRESSED_SIZE;
				        end if;
				        
				    when COUNT_COMPRESSED_SIZE =>
				        ENGINE_C_TVALID_start <= '0';
				        if FIFO_DC_TREADY_dly_aux = '1' then
				            input_count_down <= input_count_down - 1;
				        end if;
				        if input_count_down < x"0004" then
				            input_count_finish <= '1';
				            mst_exec_state <= WAIT_INTR_REQ;
				        end if;
				    
				    when WAIT_INTR_REQ =>
				        if INTR_REQ_D = '0' then
				        mst_exec_state <= IDLE;
				        end if;
				    
					when others =>
						mst_exec_state <= IDLE;

				end case;
			end if;
		end if;
	end process;

--process (CLK) 
--begin
--   if CLK = '1' and CLK'event then
--      if ENGINE_C_TVALID_i = '1' or INTR_REQ_D = '0' then 
--         input_count_down <= COMPRESSED_SIZE + 2;
--      elsif FIFO_DC_TREADY_dly_aux = '1' then
--         input_count_down <= input_count_down - 1;
--      end if;
--   end if;
--end process; 

--input_count_finish <= '1' when (input_count_down < x"0003" and INTR_REQ_D = '1') else '0';

	-- RESET FUNCTIONS

	--Generate a pulse to initiate RST_FIFO_DU
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				init_RST_FIFO_DU_ff  <= '0';
				init_RST_FIFO_DU_ff2 <= '0';
			else
				init_RST_FIFO_DU_ff  <= COMMAND(25);
				init_RST_FIFO_DU_ff2 <= init_RST_FIFO_DU_ff;
			end if;
		end if;
	end process;

	--Generate a pulse to initiate RST_FIFO_DC
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (CLEAR = '0') then
				init_RST_FIFO_DC_ff  <= '0';
				init_RST_FIFO_DC_ff2 <= '0';
			else
				init_RST_FIFO_DC_ff  <= COMMAND(26);
				init_RST_FIFO_DC_ff2 <= init_RST_FIFO_DC_ff;
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

	--    COUNTING: process (CLK, CLEAR, FIFO_DC_EMPTY, init_pulse)
	--    begin
	--    if (CLEAR = '0') then
	--        c_size_counter <= x"0000";
	--    elsif ((CLK'event) and (CLK = '1')) then
	--        if (init_pulse = '1') then
	--            c_size_counter <= x"0000";
	--        elsif(FIFO_DC_EMPTY = '0' and BUS_REQ_DC = '0') then
	--        --elsif(FIFO_DC_EMPTY = '0') then
	--            c_size_counter <= c_size_counter + 1;
	--        else
	--            c_size_counter <= c_size_counter;
	--        end if;
	--    end if;
	--    end process COUNTING;

--	process(CLK)
--	begin
--		if CLK = '1' and CLK'event then
--			if CLEAR = '0' then
--				c_size_counter <= x"0000";
--				--elsif (FIFO_DC_EMPTY = '0' and BUS_REQ_DC = '0') then
--			elsif FIFO_DC_TREADY_dly_aux = '1' then
--				c_size_counter <= c_size_counter + 1;
--			end if;
--		end if;
--	end process;

	--Generate a pulse to initiate ENGINE_C_TVALID
process(CLK)
begin
    if ((CLK'event) and (CLK = '1')) then
        if (CLEAR = '0') then
            init_ENGINE_C_TVALID_ff  <= '0';
        else
            init_ENGINE_C_TVALID_ff  <= ENGINE_C_TVALID_aux;
        end if;
    end if;
end process;

--ENGINE_C_TVALID_i <= (not init_ENGINE_C_TVALID_ff) and ENGINE_C_TVALID_aux;
ENGINE_C_TVALID_i <= ENGINE_C_TVALID_start;



--	COUNT_FINISH_aux <= '1' when (c_size_counter >= COMPRESSED_SIZE) and (c_size_counter > 0) else '0';

end arch;


----This library is free software; you can redistribute it and/or
----modify it under the terms of the GNU Lesser General Public
----License as published by the Free Software Foundation; either
----version 2.1 of the License, or (at your option) any later version.

----This library is distributed in the hope that it will be useful,
----but WITHOUT ANY WARRANTY; without even the implied warranty of
----MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
----Lesser General Public License for more details.

----You should have received a copy of the GNU Lesser General Public
----License along with this library; if not, write to the Free Software
----Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

---- e_mail : mohd.a.zainol@gmail.com

----------------------------------------------------------
----  ENTITY       = xpro_d_controller                  --
----  version      = 1.0                                --
----  last update  = 14/10/2017                         --
----  author       = Mohd A. Zainol                     --
----------------------------------------------------------

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

--entity xpro_d_controller is
--	Port(
--		CLK             : in  STD_LOGIC;
--		CLEAR           : in  STD_LOGIC;
--		COMMAND         : in  STD_LOGIC_VECTOR(31 downto 0);
--		COMPRESSED_SIZE : in  STD_LOGIC_VECTOR(15 downto 0);
--		RESTART         : in  STD_LOGIC;
--		BUS_REQ_DC      : in  STD_LOGIC;
--		BUS_REQ_DU      : in  STD_LOGIC;
--		BUS_ACK_DC      : out STD_LOGIC;
--		BUS_ACK_DU      : out STD_LOGIC;
--		INTR_ACK_D      : out STD_LOGIC;
--		INTR_REQ_D      : in  STD_LOGIC;
--		CS_RW           : out STD_LOGIC;
--		ADDR            : out STD_LOGIC_VECTOR(3 downto 0);
--		CTRL_IN         : out STD_LOGIC_VECTOR(31 downto 0);
--		RST_FIFO_DU     : out STD_LOGIC;
--		RST_FIFO_DC     : out STD_LOGIC;
--		RST_ENGINE      : out STD_LOGIC;
--		FIFO_DC_EMPTY   : in  STD_LOGIC;
--		ENGINE_C_TDATA  : out STD_LOGIC_VECTOR(31 downto 0);
--		ENGINE_C_TVALID : out STD_LOGIC;
--		ENGINE_C_TREADY : in STD_LOGIC;
--		ENGINE_U_TDATA  : in  STD_LOGIC_VECTOR(31 downto 0);
--		ENGINE_U_TVALID : in  STD_LOGIC;
--		ENGINE_U_TREADY : out STD_LOGIC;
--		FIFO_DC_TDATA   : in  STD_LOGIC_VECTOR(31 downto 0);
--		FIFO_DC_TREADY  : out STD_LOGIC;
--		FIFO_DC_TVALID  : in  STD_LOGIC;
--		FIFO_DU_TDATA   : out STD_LOGIC_VECTOR(31 downto 0);
--		FIFO_DU_TREADY  : in  STD_LOGIC;
--		FIFO_DU_TVALID  : out STD_LOGIC
--	);
--end xpro_d_controller;

--architecture arch of xpro_d_controller is

--	signal BUS_ACK_DC_signal         : STD_LOGIC := '1';
--	signal BUS_ACK_DU_signal         : STD_LOGIC := '1';
--	signal INTR_ACK_D_signal         : STD_LOGIC := '1';
--	signal BUS_ACKNOWLEDGE_DC1signal : STD_LOGIC := '1';
--	signal init_cs_ff                : STD_LOGIC := '0';
--	signal init_cs_ff2               : STD_LOGIC := '0';
--	signal init_pulse                : STD_LOGIC := '0';
--	type state is (IDLE, INIT_CTRL_IN_1_SM, INIT_CTRL_IN_2_SM, DONE);
--	signal mst_exec_state            : state;
--	signal init_RST_FIFO_DU_ff       : STD_LOGIC := '0';
--	signal init_RST_FIFO_DU_ff2      : STD_LOGIC := '0';
--	signal init_RST_FIFO_DC_ff       : STD_LOGIC := '0';
--	signal init_RST_FIFO_DC_ff2      : STD_LOGIC := '0';
--	signal init_RST_ENGINE_ff        : STD_LOGIC := '0';
--	signal init_RST_ENGINE_ff2       : STD_LOGIC := '0';
--	signal init_RST_ALL_ff           : STD_LOGIC := '0';
--	signal init_RST_ALL_ff2          : STD_LOGIC := '0';
--	signal RST_ALL                   : STD_LOGIC := '1';

----	signal c_size_counter : STD_LOGIC_VECTOR(15 downto 0);

--	signal FIFO_DC_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0);
--	signal FIFO_DC_TVALID_aux : STD_LOGIC;
--	signal FIFO_DC_TREADY_aux : STD_LOGIC := '0';

--	signal FIFO_DU_TDATA_aux  : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
--	signal FIFO_DU_TVALID_aux : STD_LOGIC                     := '0';
--	signal FIFO_DU_TREADY_aux : STD_LOGIC;

--	-- new
--	signal M_AXIS_tdata_dly_aux    : std_logic_vector(31 downto 0);
--	signal M_AXIS_tdata_dly_X      : std_logic_vector(31 downto 0);
--	signal WAIT_DC_aux             : std_logic;
--	signal M_AXIS_tvalid_dly_1_aux : std_logic;
--	signal M_AXIS_tvalid_dly_2_aux : std_logic;
--	signal WAIT_DC_TVALID_dly_aux  : std_logic;
--	signal WAIT_DC_TVALID_aux      : std_logic;
----	signal COUNT_FINISH_aux        : std_logic;
--	signal ENGINE_C_TVALID_aux     : std_logic;
--	signal FIFO_DC_TREADY_dly_aux  : std_logic;

--	signal init_ENGINE_C_TVALID_ff : std_logic;
	
--	signal input_count_down : STD_LOGIC_VECTOR(15 downto 0);
--	signal input_count_finish : std_logic;

--	signal FIFO_DC_TDATA_o  : STD_LOGIC_VECTOR(31 downto 0);
--	signal FIFO_DC_TVALID_o : STD_LOGIC;
--	signal FIFO_DC_TDATA_o_dly  : STD_LOGIC_VECTOR(31 downto 0);
--    signal FIFO_DC_TVALID_o_dly : STD_LOGIC;
--	signal FIFO_DC_TREADY_o : STD_LOGIC;
--	signal BUS_REQ_DC_aux : STD_LOGIC;
--	signal ENGINE_C_TVALID_o : STD_LOGIC;
--	signal ENGINE_C_TDATA_o  : STD_LOGIC_VECTOR(31 downto 0);
--	signal ENGINE_C_TREADY_aux : STD_LOGIC;
--	signal ENGINE_C_TREADY_i : std_logic;
	
--begin

---- new design

--FIFO_DC_TDATA_o <= FIFO_DC_TDATA;
--FIFO_DC_TVALID_o <= FIFO_DC_TVALID;
--FIFO_DC_TREADY <= (not BUS_REQ_DC) and (not input_count_finish);

----ENGINE_C_TVALID <= (FIFO_DC_TVALID_o_dly and FIFO_DC_TVALID_o_dly_2) or input_count_finish;
--ENGINE_C_TVALID <= FIFO_DC_TVALID_o_dly or input_count_finish;
--ENGINE_C_TDATA <= FIFO_DC_TDATA_o_dly;
--ENGINE_C_TREADY_aux <= ENGINE_C_TREADY;

--	process(CLK)
--	begin
--		if CLK'event and CLK = '1' then
--			if CLEAR = '0' then
--				FIFO_DC_TVALID_o_dly <= '0';
--				FIFO_DC_TDATA_o_dly <= (others => '0');
--			else
--				FIFO_DC_TVALID_o_dly <= FIFO_DC_TVALID_o;
--				FIFO_DC_TDATA_o_dly <= FIFO_DC_TDATA_o;
--			end if;
--		end if;
--	end process;

--process (CLK) 
--begin
--   if CLK = '1' and CLK'event then
--      if ENGINE_C_TREADY_i = '1' and input_count_finish = '0' then 
--         input_count_down <= COMPRESSED_SIZE + 2;
--      elsif FIFO_DC_TVALID_o_dly = '1' then
--         input_count_down <= input_count_down - 1;
--      end if;
--   end if;
--end process; 

--input_count_finish <= '1' when (input_count_down < x"0003" and INTR_REQ_D = '1') else '0';

--	--Generate a pulse to initiate ENGINE_C_TVALID
--process(CLK)
--begin
--    if ((CLK'event) and (CLK = '1')) then
--        if (CLEAR = '0') then
--            init_ENGINE_C_TVALID_ff  <= '0';
--        else
--            init_ENGINE_C_TVALID_ff  <= ENGINE_C_TREADY_aux;
--        end if;
--    end if;
--end process;

--ENGINE_C_TREADY_i <= (not init_ENGINE_C_TVALID_ff) and ENGINE_C_TREADY_aux;







--	FIFO_DU_TVALID_aux <= not ENGINE_U_TVALID;
--	FIFO_DU_TDATA_aux  <= ENGINE_U_TDATA;
--	ENGINE_U_TREADY    <= FIFO_DU_TREADY_aux;
        
--        FIFO_DU_TDATA      <= FIFO_DU_TDATA_aux;
--        FIFO_DU_TVALID     <= FIFO_DU_TVALID_aux;
--        FIFO_DU_TREADY_aux <= FIFO_DU_TREADY;










    
------    ENGINE_C_TVALID    <= ENGINE_C_TVALID_aux; -- not used?
------	ENGINE_C_TVALID_aux <= (M_AXIS_tvalid_dly_1_aux and M_AXIS_tvalid_dly_2_aux); -- not used?
	
------	ENGINE_C_TREADY     <= COUNT_FINISH_aux or FIFO_DC_TREADY_dly_aux;
----	--    ENGINE_C_TREADY <= FIFO_DC_TREADY_dly_aux;
	
------	ENGINE_C_TREADY     <= input_count_finish or FIFO_DC_TREADY_dly_aux;
------	ENGINE_C_TDATA    <= M_AXIS_tdata_dly_aux when WAIT_DC_aux = '1' else M_AXIS_tdata_dly_X;
	
----	WAIT_DC_aux        <= (not BUS_ACKNOWLEDGE_DC1signal) and (not BUS_REQ_DC);
----	WAIT_DC_TVALID_aux <= WAIT_DC_aux and FIFO_DC_TVALID_aux;
------	FIFO_DC_TREADY_aux <= (WAIT_DC_TVALID_aux and WAIT_DC_TVALID_dly_aux) when COUNT_FINISH_aux = '0' else '0';
----    FIFO_DC_TREADY_aux <= (WAIT_DC_TVALID_aux and WAIT_DC_TVALID_dly_aux);
	

----	process(CLK)
----	begin
----		if CLK'event and CLK = '1' then
----			if CLEAR = '0' then
----				M_AXIS_tdata_dly_aux <= (others => '0');
----			elsif FIFO_DC_TREADY_aux = '1' then
----				M_AXIS_tdata_dly_aux <= FIFO_DC_TDATA_aux;
----			end if;
----		end if;
----	end process;

----	process(CLK)
----	begin
----		if CLK'event and CLK = '1' then
----			if CLEAR = '0' then
----				M_AXIS_tdata_dly_X <= (others => '0');
----			elsif WAIT_DC_aux = '1' then
----				M_AXIS_tdata_dly_X <= M_AXIS_tdata_dly_aux;
----			end if;
----		end if;
----	end process;

----	process(CLK)
----	begin
----		if CLK'event and CLK = '1' then
----			if CLEAR = '0' then
----				WAIT_DC_TVALID_dly_aux <= '0';
----				FIFO_DC_TREADY_dly_aux <= '0';
----			else
----				WAIT_DC_TVALID_dly_aux <= WAIT_DC_TVALID_aux;
----				FIFO_DC_TREADY_dly_aux <= FIFO_DC_TREADY_aux;
----			end if;
----		end if;
----	end process;

----	process(CLK)
----	begin
----		if CLK'event and CLK = '1' then
----			if CLEAR = '0' then
----				M_AXIS_tvalid_dly_1_aux <= '0';
----				M_AXIS_tvalid_dly_2_aux <= '0';
----			else
----				M_AXIS_tvalid_dly_1_aux <= FIFO_DC_TVALID_aux;
----				M_AXIS_tvalid_dly_2_aux <= M_AXIS_tvalid_dly_1_aux;
----			end if;
----		end if;
----	end process;

----	FIFO_DC_TDATA_aux  <= FIFO_DC_TDATA;
----	FIFO_DC_TREADY     <= FIFO_DC_TREADY_aux;
----	FIFO_DC_TVALID_aux <= FIFO_DC_TVALID;
----	FIFO_DU_TDATA      <= FIFO_DU_TDATA_aux;
----	FIFO_DU_TREADY_aux <= FIFO_DU_TREADY;
----	FIFO_DU_TVALID     <= FIFO_DU_TVALID_aux;

--	RST_FIFO_DU <= ((not init_RST_FIFO_DU_ff2) and init_RST_FIFO_DU_ff) or (not RST_ALL);
--	RST_FIFO_DC <= ((not init_RST_FIFO_DC_ff2) and init_RST_FIFO_DC_ff) or (not RST_ALL);
--	RST_ENGINE  <= (init_RST_ENGINE_ff2 or (not init_RST_ENGINE_ff)) and RST_ALL;
--	BUS_ACK_DC  <= BUS_ACK_DC_signal;
--	BUS_ACK_DU  <= BUS_ACK_DU_signal;
--	INTR_ACK_D  <= INTR_ACK_D_signal or (not COMMAND(28));

--	--Generate a pulse to initiate AXI transaction.
--	process(CLK)
--	begin
--		if ((CLK'event) and (CLK = '1')) then
--			if (CLEAR = '0') then
--				BUS_ACK_DU_signal         <= '1';
--				BUS_ACK_DC_signal         <= '1';
--				INTR_ACK_D_signal         <= '1';
--				BUS_ACKNOWLEDGE_DC1signal <= '1';
--			else
--				BUS_ACK_DU_signal         <= BUS_REQ_DU;
--				BUS_ACK_DC_signal         <= BUS_REQ_DC;
--				INTR_ACK_D_signal         <= INTR_REQ_D;
--				BUS_ACKNOWLEDGE_DC1signal <= BUS_ACK_DC_signal;
--			end if;
--		end if;
--	end process;

--	--Generate a pulse to initiate init_pulse
--	process(CLK)
--	begin
--		if ((CLK'event) and (CLK = '1')) then
--			if (CLEAR = '0') then
--				init_cs_ff  <= '0';
--				init_cs_ff2 <= '0';
--			else
--				init_cs_ff  <= COMMAND(24);
--				init_cs_ff2 <= init_cs_ff;
--			end if;
--		end if;
--	end process;
--	init_pulse <= (not init_cs_ff2) and init_cs_ff;

--	--implement master command interface state machine
--	MASTER_EXECUTION_PROC : process(CLK, init_pulse, RESTART)
--	begin
--		if ((CLK'event) and (CLK = '1')) then
--			if (RST_ALL = '0') then
--				-- reset condition: using RST_ALL
--				-- All the signals are default values under reset condition
--				mst_exec_state <= IDLE;
--				CS_RW          <= '1';
--				ADDR           <= (others => '0');
--				CTRL_IN        <= (others => '0');
--			else
--				-- state transition
--				case (mst_exec_state) is

--					when IDLE =>
--						if ((init_pulse = '1') or (RESTART = '1')) then
--							mst_exec_state <= INIT_CTRL_IN_1_SM;
--						else
--							mst_exec_state <= IDLE;
--						end if;

--					when INIT_CTRL_IN_1_SM =>
--						CS_RW          <= '0';
--						ADDR           <= "1001";
--						CTRL_IN        <= "000000000000000" & COMMAND(7 downto 0) & "000000000";
--						mst_exec_state <= INIT_CTRL_IN_2_SM;

--					when INIT_CTRL_IN_2_SM =>
--						CS_RW          <= '0';
--						ADDR           <= "1000";
--						CTRL_IN        <= "0000000000000000" & "0100" & COMMAND(15 downto 8) & "0000";
--						mst_exec_state <= DONE;

--					when DONE =>
--						CS_RW          <= '1';
--						ADDR           <= (others => '0');
--						CTRL_IN        <= (others => '0');
--						mst_exec_state <= IDLE;

--					when others =>
--						mst_exec_state <= IDLE;

--				end case;
--			end if;
--		end if;
--	end process;

--	-- RESET FUNCTIONS

--	--Generate a pulse to initiate RST_FIFO_DU
--	process(CLK)
--	begin
--		if ((CLK'event) and (CLK = '1')) then
--			if (CLEAR = '0') then
--				init_RST_FIFO_DU_ff  <= '0';
--				init_RST_FIFO_DU_ff2 <= '0';
--			else
--				init_RST_FIFO_DU_ff  <= COMMAND(25);
--				init_RST_FIFO_DU_ff2 <= init_RST_FIFO_DU_ff;
--			end if;
--		end if;
--	end process;

--	--Generate a pulse to initiate RST_FIFO_DC
--	process(CLK)
--	begin
--		if ((CLK'event) and (CLK = '1')) then
--			if (CLEAR = '0') then
--				init_RST_FIFO_DC_ff  <= '0';
--				init_RST_FIFO_DC_ff2 <= '0';
--			else
--				init_RST_FIFO_DC_ff  <= COMMAND(26);
--				init_RST_FIFO_DC_ff2 <= init_RST_FIFO_DC_ff;
--			end if;
--		end if;
--	end process;

--	--Generate a pulse to initiate RST_ENGINE
--	process(CLK)
--	begin
--		if ((CLK'event) and (CLK = '1')) then
--			if (CLEAR = '0') then
--				init_RST_ENGINE_ff  <= '0';
--				init_RST_ENGINE_ff2 <= '0';
--			else
--				init_RST_ENGINE_ff  <= COMMAND(27);
--				init_RST_ENGINE_ff2 <= init_RST_ENGINE_ff;
--			end if;
--		end if;
--	end process;

--	--Generate a pulse to initiate RST_ALL
--	process(CLK)
--	begin
--		if ((CLK'event) and (CLK = '1')) then
--			if (CLEAR = '0') then
--				init_RST_ALL_ff  <= '0';
--				init_RST_ALL_ff2 <= '0';
--			else
--				init_RST_ALL_ff  <= COMMAND(31);
--				init_RST_ALL_ff2 <= init_RST_ALL_ff;
--			end if;
--		end if;
--	end process;

--	RST_ALL <= init_RST_ALL_ff2 or (not init_RST_ALL_ff);

--	--    COUNTING: process (CLK, CLEAR, FIFO_DC_EMPTY, init_pulse)
--	--    begin
--	--    if (CLEAR = '0') then
--	--        c_size_counter <= x"0000";
--	--    elsif ((CLK'event) and (CLK = '1')) then
--	--        if (init_pulse = '1') then
--	--            c_size_counter <= x"0000";
--	--        elsif(FIFO_DC_EMPTY = '0' and BUS_REQ_DC = '0') then
--	--        --elsif(FIFO_DC_EMPTY = '0') then
--	--            c_size_counter <= c_size_counter + 1;
--	--        else
--	--            c_size_counter <= c_size_counter;
--	--        end if;
--	--    end if;
--	--    end process COUNTING;

----	process(CLK)
----	begin
----		if CLK = '1' and CLK'event then
----			if CLEAR = '0' then
----				c_size_counter <= x"0000";
----				--elsif (FIFO_DC_EMPTY = '0' and BUS_REQ_DC = '0') then
----			elsif FIFO_DC_TREADY_dly_aux = '1' then
----				c_size_counter <= c_size_counter + 1;
----			end if;
----		end if;
----	end process;

----	COUNT_FINISH_aux <= '1' when (c_size_counter >= COMPRESSED_SIZE) and (c_size_counter > 0) else '0';

--end arch;
