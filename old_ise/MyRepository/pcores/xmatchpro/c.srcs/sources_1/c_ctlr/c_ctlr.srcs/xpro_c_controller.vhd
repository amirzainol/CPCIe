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
-- Entity: 			xpro_c_controller.vhd
-- Version:			1.0
-- Description: 		X-MatchPRO Compressor Controller
--
-- Additional Comments:
--
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xpro_c_controller is
  Port (
    CLK : in STD_LOGIC;
    CLEAR : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR (31 downto 0);
    BUS_REQ_CC : in STD_LOGIC;
    BUS_REQ_CU : in STD_LOGIC;
    BUS_ACK_CC : out STD_LOGIC;
    BUS_ACK_CU : out STD_LOGIC;
    INTR_ACK_C : out STD_LOGIC;
    INTR_REQ_CTLR : out STD_LOGIC;
    INTR_REQ_C : in STD_LOGIC;
    INTR_REQ_D : in STD_LOGIC;
    WAIT_CC : out STD_LOGIC;
    WAIT_CU : out STD_LOGIC;
    CS_RW : out STD_LOGIC;
    ADDR : out STD_LOGIC_VECTOR (3 downto 0);
    CTRL_IN : out STD_LOGIC_VECTOR (31 downto 0);
    RST_FIFO_CU : out STD_LOGIC;
    RST_FIFO_CC : out STD_LOGIC;
    RST_ENGINE : out STD_LOGIC;
    BUSY : out STD_LOGIC;
    READ_FIFO_CU : out STD_LOGIC;
    COUNTER_ADDRB : in STD_LOGIC_VECTOR (9 downto 0);
    CRC_OUT_C : in STD_LOGIC_VECTOR (31 downto 0);
    CRC_OUT_D : in STD_LOGIC_VECTOR (31 downto 0);
    M_TDATA : in STD_LOGIC_VECTOR (31 downto 0);
    M_TVALID : in STD_LOGIC;
    U_DATA_OUT : out STD_LOGIC_VECTOR (31 downto 0);
    U_WAIT_CU : out STD_LOGIC;
    BRAM_TDATA : in STD_LOGIC_VECTOR (31 downto 0);
    BRAM_TVALID : in STD_LOGIC;
    RESTART_DECOMPRESSOR : out STD_LOGIC;
    FLUSH_FIFO_CC : out STD_LOGIC;
    M_AXIS_TVALID_IN : in STD_LOGIC;
    M_AXIS_TVALID_OUT : out STD_LOGIC
  );
end xpro_c_controller;

architecture arch of xpro_c_controller is

  signal BUS_ACK_CC_signal : STD_LOGIC := '1';
  signal BUS_ACK_CU_signal : STD_LOGIC := '1';
  signal INTR_ACK_C_signal : STD_LOGIC := '1';
  signal BUS_ACKNOWLEDGE_CU1signal : STD_LOGIC := '1';
  signal init_cs_ff : STD_LOGIC := '0';
  signal init_cs_ff2 : STD_LOGIC := '0';
  signal init_pulse : STD_LOGIC := '0';
  type state is (IDLE, INIT_CTRL_IN_1_SM, INIT_CTRL_IN_2_SM, DONE, CHECK_CRC);
  signal mst_exec_state : state ; 
  signal init_RST_FIFO_CU_ff : STD_LOGIC := '0';
  signal init_RST_FIFO_CU_ff2 : STD_LOGIC := '0';
  signal init_RST_FIFO_CC_ff : STD_LOGIC := '0';
  signal init_RST_FIFO_CC_ff2 : STD_LOGIC := '0';
  signal init_RST_ENGINE_ff : STD_LOGIC := '0';
  signal init_RST_ENGINE_ff2 : STD_LOGIC := '0';
  signal init_RST_ALL_ff : STD_LOGIC := '0';
  signal init_RST_ALL_ff2 : STD_LOGIC := '0';
  signal RST_ALL : STD_LOGIC := '1';
  signal busy_signal : STD_LOGIC := '0';
  type state_busy is (IDLE, wait_intr_req);
  signal mst_exec_state_busy : state_busy ; 
  type state_fifocu is (IDLE, wait_bus_req_cu_1, wait_bus_req_cu_0, wait_wait_cu);
  signal state_fifo_cu : state_fifocu ; 
  signal WAIT_CU_signal : STD_LOGIC := '0';
  signal WAIT_CU1_signal : STD_LOGIC := '0';
  signal READ_FIFO_CU_signal : STD_LOGIC := '0';
  signal block_size : STD_LOGIC_VECTOR (14 downto 0) := (others => '0');
  signal count_size : STD_LOGIC_VECTOR (14 downto 0) := (others => '0');
  signal complete_block_size : STD_LOGIC := '0';
  signal intr_req_cd : STD_LOGIC := '0';
  signal crc_error_aux : STD_LOGIC := '0';
  signal crc_error_pulse : STD_LOGIC := '0';
  signal COMMAND_BLOCK_SIZE : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
  signal COMMAND_THRESHOLD : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
  signal switch_in : STD_LOGIC := '0';
  signal U_DATA_OUT_signal : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
  signal U_WAIT_CU_signal : STD_LOGIC := '0';
  signal rst_FIFO_CU_aux : STD_LOGIC := '0';
  signal rst_FIFO_CC_aux : STD_LOGIC := '0';
  signal rst_ENGINE_aux : STD_LOGIC := '0';
  signal rst_ALL_aux : STD_LOGIC := '0';
  signal start_busy : STD_LOGIC := '0';
  type state_crc is (IDLE, wait_cu_crc, wait_ack_cu_crc);
  signal mst_exec_crc : state_crc ; 
  signal crc_error_start : STD_LOGIC := '0';
  signal FLUSH_FIFO_CC_aux : STD_LOGIC := '0';

begin

    RST_FIFO_CU <= ((not init_RST_FIFO_CU_ff2) and init_RST_FIFO_CU_ff) or (not RST_ALL);
    RST_FIFO_CC <= ((not init_RST_FIFO_CC_ff2) and init_RST_FIFO_CC_ff) or (not RST_ALL);
    RST_ENGINE <= (init_RST_ENGINE_ff2 or (not init_RST_ENGINE_ff)) and RST_ALL;
    BUS_ACK_CC <= BUS_ACK_CC_signal;
    BUS_ACK_CU <= BUS_ACK_CU_signal;
    --INTR_ACK_C <= INTR_ACK_C_signal or (not COMMAND(28));
    INTR_ACK_C <= INTR_ACK_C_signal;
    WAIT_CC <= '1';
    --WAIT_CU <= WAIT_CU_signal and WAIT_CU1_signal;
    WAIT_CU <= WAIT_CU_signal;
    WAIT_CU_signal <= (not BUS_ACKNOWLEDGE_CU1signal) and (not BUS_REQ_CU);
    BUSY <= busy_signal;
    --READ_FIFO_CU <= (READ_FIFO_CU_signal and (not BUS_REQ_CU)) and (not complete_block_size);
    READ_FIFO_CU <= crc_error_start;
    count_size <= "00000" & COUNTER_ADDRB;
    complete_block_size <= '1' when count_size > block_size else '0';
    intr_req_cd <= (not INTR_REQ_C) and (not INTR_REQ_D);
    U_DATA_OUT <= U_DATA_OUT_signal;
    U_WAIT_CU <= U_WAIT_CU_signal;
    crc_error_pulse <= '1' when (CRC_OUT_D /= CRC_OUT_C) and (intr_req_cd = '1') else '0';
    INTR_REQ_CTLR <= '1' when (crc_error_pulse = '0') and (intr_req_cd = '1') else '0';
    RESTART_DECOMPRESSOR <= '1' when (rst_ENGINE_aux = '1') or (RST_ALL = '0') else '0';
    FLUSH_FIFO_CC <= FLUSH_FIFO_CC_aux;
    M_AXIS_TVALID_OUT <= M_AXIS_TVALID_IN and FLUSH_FIFO_CC_aux;

    process (CLK,CLEAR, CRC_OUT_D, CRC_OUT_C, intr_req_cd)
    begin
      if (RST_ALL = '0') then
        FLUSH_FIFO_CC_aux <= '0';
      elsif ((CLK'event) and (CLK = '1')) then
         if ((CRC_OUT_D = CRC_OUT_C) and (intr_req_cd = '1')) then
           FLUSH_FIFO_CC_aux <= '1'; -- 1 is active
         else
           FLUSH_FIFO_CC_aux <= FLUSH_FIFO_CC_aux;
         end if;
      end if;
    end process FLIP_FLOPS;

    process (CLK,CLEAR, CRC_OUT_D, CRC_OUT_C, intr_req_cd)
    begin
      if (CLEAR = '0') then
        crc_error_aux <= '0';
      elsif ((CLK'event) and (CLK = '1')) then
         if ((CRC_OUT_D /= CRC_OUT_C) and (intr_req_cd = '1')) then
           crc_error_aux <= '1'; -- 1 is active
         else
           crc_error_aux <= crc_error_aux;
         end if;
      end if;
    end process FLIP_FLOPS;
    
	process (crc_error_aux, M_TDATA, M_TVALID, BRAM_TDATA, BRAM_TVALID, WAIT_CU1_signal)
    begin
        case crc_error_aux is
          when '0' =>
            U_DATA_OUT_signal <= M_TDATA;
            U_WAIT_CU_signal <= M_TVALID;
          when '1' =>
            U_DATA_OUT_signal <= BRAM_TDATA;
            U_WAIT_CU_signal <= BRAM_TVALID and WAIT_CU1_signal;
          when others =>
            U_DATA_OUT_signal <= x"00000000";
            U_WAIT_CU_signal <= '0';
        end case;
    end process; 
    
	--Generate a pulse to initiate AXI transaction.
    process(CLK)                                                          
    begin                                                                             
      if ((CLK'event) and (CLK='1')) then                                      
        if (CLEAR = '0') then                                                
          BUS_ACK_CU_signal <= '1';                                                                                                      
          BUS_ACK_CC_signal <= '1';
          INTR_ACK_C_signal <= '1';
          BUS_ACKNOWLEDGE_CU1signal <= '1';
          WAIT_CU1_signal <= '0';
        else                                                                                       
          BUS_ACK_CU_signal <= BUS_REQ_CU;                                                               
          BUS_ACK_CC_signal <= BUS_REQ_CC;
          INTR_ACK_C_signal <= not intr_req_cd;
          BUS_ACKNOWLEDGE_CU1signal <= BUS_ACK_CU_signal;
          WAIT_CU1_signal <= WAIT_CU_signal;
        end if;                                                                       
      end if;                                                                         
    end process; 

	--Generate a pulse to initiate init_pulse
	process(CLK)                                                          
	begin                                                                             
	  if ((CLK'event) and (CLK='1')) then
	    if (CLEAR = '0' ) then
	      init_cs_ff <= '0';
	      init_cs_ff2 <= '0';
	    else
	      init_cs_ff <= COMMAND(24);
	      init_cs_ff2 <= init_cs_ff;
	    end if;
	  end if;
	end process;
	init_pulse <= (not init_cs_ff2) and init_cs_ff;

	--implement busy signal state machine
    BUSY_SIGNAL_PROC: process(CLK, init_pulse, start_busy, INTR_REQ_C)
    begin
      if ((CLK'event) and (CLK='1')) then
        if (RST_ALL = '0') then
          busy_signal <= '0';
        else
          -- state transition
          case (mst_exec_state_busy) is
            when IDLE =>
            busy_signal <= '0';
	        if ((init_pulse = '1') or (start_busy = '1')) then
              mst_exec_state_busy  <= wait_intr_req;                                                
            end if; 
            
            when wait_intr_req =>
            busy_signal <= '1';
	        if (INTR_REQ_C = '0') then
              mst_exec_state_busy  <= IDLE;                                                   
            end if; 

            when others  =>
                mst_exec_state_busy  <= IDLE;
                
          end case;                                                                                 
        end if;                                                                                       
      end if;                                                                                         
    end process;   

	--implement CRC error state machine
    CRC_ERROR_PROC: process(CLK, crc_error_pulse, WAIT_CU1_signal, BUS_REQ_CU)
    begin
      if ((CLK'event) and (CLK='1')) then
        if (RST_ALL = '0') then
          crc_error_start <= '0';
        else
          -- state transition
          case (mst_exec_crc) is
          
            when IDLE =>
            crc_error_start <= '0';
	        if (crc_error_pulse = '1') then
              mst_exec_crc  <= wait_ack_cu_crc;                                                
            end if;

            when wait_ack_cu_crc =>
	        if (BUS_REQ_CU = '0') then
	          crc_error_start <= '1';
              mst_exec_crc  <= wait_cu_crc;                                                   
            end if;  
            
            when wait_cu_crc =>
            crc_error_start <= '1';
	        if (WAIT_CU1_signal = '1') then
              mst_exec_crc  <= IDLE;                                                   
            end if; 

            when others  =>
                mst_exec_crc  <= IDLE;
                
          end case;                                                                                 
        end if;                                                                                       
      end if;                                                                                         
    end process;  

	--implement read fifo cu state machine
    READ_FIFO_CU_PROC: process(CLK, BUS_REQ_CU, BUS_ACK_CU_signal)
    begin
      if ((CLK'event) and (CLK='1')) then
        if (RST_ALL = '0') then
          READ_FIFO_CU_signal <= '0';
        else
          -- state transition
          case (state_fifo_cu) is
            when IDLE =>
            READ_FIFO_CU_signal <= '0';
	        if (busy_signal = '1') then
              state_fifo_cu  <= wait_bus_req_cu_1;                                                
            end if; 
            
            when wait_bus_req_cu_1 =>
            READ_FIFO_CU_signal <= '1';
	        if (BUS_REQ_CU = '0') then
              state_fifo_cu  <= wait_bus_req_cu_0;                                                
            end if; 
            
            when wait_bus_req_cu_0 =>
            READ_FIFO_CU_signal <= '1';
	        if (BUS_REQ_CU = '1') then
	          READ_FIFO_CU_signal <= '0';
              state_fifo_cu  <= wait_wait_cu;                                           
            end if; 
            
            when wait_wait_cu =>
            READ_FIFO_CU_signal <= '0';
	        if (INTR_REQ_C = '0') then
              state_fifo_cu  <= IDLE; 
            elsif (BUS_ACK_CU_signal = '0') then
                READ_FIFO_CU_signal <= '1';
                state_fifo_cu  <= wait_bus_req_cu_0;                                                                                                 
            end if; 

            when others  =>
                state_fifo_cu  <= IDLE;
                
          end case;                                                                                 
        end if;                                                                                       
      end if;                                                                                         
    end process;
    
	--implement master command interface state machine
    MASTER_EXECUTION_PROC: process(CLK, init_pulse, crc_error_pulse)
    begin
      if ((CLK'event) and (CLK='1')) then
        if (RST_ALL = '0') then
          -- reset condition: using RST_ALL
          -- All the signals are default values under reset condition
          mst_exec_state  <= IDLE;
          CS_RW <= '1';
          ADDR <= (others => '0');
          CTRL_IN <= (others => '0');
          start_busy <= '0';
        else
          -- state transition
          case (mst_exec_state) is

            when IDLE =>
            CS_RW <= '1';
            COMMAND_BLOCK_SIZE <= COMMAND(7 downto 0);
            COMMAND_THRESHOLD <= COMMAND(15 downto 8);
	        if (init_pulse = '1') then
              mst_exec_state  <= INIT_CTRL_IN_1_SM;
            else
              mst_exec_state  <= IDLE;                                                      
            end if; 
            
            when INIT_CTRL_IN_1_SM =>
              CS_RW <= '0';
              ADDR <= "1101";
              CTRL_IN <= "000000000000000" & COMMAND_BLOCK_SIZE & "000000000";
              block_size <= COMMAND_BLOCK_SIZE & "0000000";
              mst_exec_state  <= INIT_CTRL_IN_2_SM;
                                                                                                      
            when INIT_CTRL_IN_2_SM =>
              start_busy <= '1';
              CS_RW <= '0';
              ADDR <= "1100";
              CTRL_IN <= "0000000000000000" & "0100" & COMMAND_THRESHOLD & "1000";
              mst_exec_state  <= DONE;
                                                                                                      
            when DONE =>
              CS_RW <= '1';
              if (crc_error_pulse = '1') then
                rst_FIFO_CU_aux <= '1';
                rst_ENGINE_aux <= '1';
                mst_exec_state  <= CHECK_CRC;
              end if;  
              
            when CHECK_CRC =>
              CS_RW <= '1';
              start_busy <= '0';
              rst_FIFO_CU_aux <= '0';
              rst_ENGINE_aux <= '0';
              mst_exec_state  <= INIT_CTRL_IN_1_SM;

            when others  =>
                mst_exec_state  <= IDLE;
                
          end case;                                                                                 
        end if;                                                                                       
      end if;                                                                                         
    end process;   

-- RESET FUNCTIONS

	--Generate a pulse to initiate RST_FIFO_CU
	process(CLK)                                                          
	begin                                                                             
	  if ((CLK'event) and (CLK='1')) then
	    if (CLEAR = '0') then
	      init_RST_FIFO_CU_ff <= '0';
	      init_RST_FIFO_CU_ff2 <= '0';
	    else
	      init_RST_FIFO_CU_ff <= COMMAND(25) or rst_FIFO_CU_aux;
	      init_RST_FIFO_CU_ff2 <= init_RST_FIFO_CU_ff;
	    end if;
	  end if;
	end process;

	--Generate a pulse to initiate RST_FIFO_CC
    process(CLK)                                                          
    begin                                                                             
      if ((CLK'event) and (CLK='1')) then
        if (CLEAR = '0') then
          init_RST_FIFO_CC_ff <= '0';
          init_RST_FIFO_CC_ff2 <= '0';
        else
          init_RST_FIFO_CC_ff <= COMMAND(26) or rst_FIFO_CC_aux;
          init_RST_FIFO_CC_ff2 <= init_RST_FIFO_CC_ff;
        end if;
      end if;
    end process;

	--Generate a pulse to initiate RST_ENGINE
    process(CLK)                                                          
    begin                                                                             
      if ((CLK'event) and (CLK='1')) then
        if (CLEAR = '0') then
          init_RST_ENGINE_ff <= '0';
          init_RST_ENGINE_ff2 <= '0';
        else
          init_RST_ENGINE_ff <= COMMAND(27) or rst_ENGINE_aux;
          init_RST_ENGINE_ff2 <= init_RST_ENGINE_ff;
        end if;
      end if;
    end process;

	--Generate a pulse to initiate RST_ALL
    process(CLK)                                                          
    begin                                                                             
      if ((CLK'event) and (CLK='1')) then
        if (CLEAR = '0') then
          init_RST_ALL_ff <= '0';
          init_RST_ALL_ff2 <= '0';
        else
          init_RST_ALL_ff <= COMMAND(31) or rst_ALL_aux;
          init_RST_ALL_ff2 <= init_RST_ALL_ff;
        end if;
      end if;
    end process;
    
    RST_ALL <= init_RST_ALL_ff2 or (not init_RST_ALL_ff);
    
end arch;
