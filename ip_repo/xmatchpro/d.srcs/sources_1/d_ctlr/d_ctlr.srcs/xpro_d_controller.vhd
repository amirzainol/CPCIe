library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xpro_d_controller is
  Port (
    CLK : in STD_LOGIC;
    CLEAR : in STD_LOGIC;
    COMMAND : in STD_LOGIC_VECTOR (31 downto 0);
    COMPRESSED_SIZE : in STD_LOGIC_VECTOR (15 downto 0);
    RESTART : in STD_LOGIC;
    BUS_REQ_DC : in STD_LOGIC;
    BUS_REQ_DU : in STD_LOGIC;
    BUS_ACK_DC : out STD_LOGIC;
    BUS_ACK_DU : out STD_LOGIC;
    INTR_ACK_D : out STD_LOGIC;
    INTR_REQ_D : in STD_LOGIC;
    WAIT_DC : out STD_LOGIC;
    WAIT_DU : out STD_LOGIC;
    CS_RW : out STD_LOGIC;
    ADDR : out STD_LOGIC_VECTOR (3 downto 0);
    CTRL_IN : out STD_LOGIC_VECTOR (31 downto 0);
    RST_FIFO_DU : out STD_LOGIC;
    RST_FIFO_DC : out STD_LOGIC;
    RST_ENGINE : out STD_LOGIC;
    COUNT_FINISH : out STD_LOGIC;
    FIFO_DC_EMPTY : in STD_LOGIC
  );
end xpro_d_controller;

architecture arch of xpro_d_controller is

  signal BUS_ACK_DC_signal : STD_LOGIC := '1';
  signal BUS_ACK_DU_signal : STD_LOGIC := '1';
  signal INTR_ACK_D_signal : STD_LOGIC := '1';
  signal BUS_ACKNOWLEDGE_DC1signal : STD_LOGIC := '1';
  signal init_cs_ff : STD_LOGIC := '0';
  signal init_cs_ff2 : STD_LOGIC := '0';
  signal init_pulse : STD_LOGIC := '0';
  type state is (IDLE, INIT_CTRL_IN_1_SM, INIT_CTRL_IN_2_SM, DONE);
  signal mst_exec_state : state ; 
  signal init_RST_FIFO_DU_ff : STD_LOGIC := '0';
  signal init_RST_FIFO_DU_ff2 : STD_LOGIC := '0';
  signal init_RST_FIFO_DC_ff : STD_LOGIC := '0';
  signal init_RST_FIFO_DC_ff2 : STD_LOGIC := '0';
  signal init_RST_ENGINE_ff : STD_LOGIC := '0';
  signal init_RST_ENGINE_ff2 : STD_LOGIC := '0';
  signal init_RST_ALL_ff : STD_LOGIC := '0';
  signal init_RST_ALL_ff2 : STD_LOGIC := '0';
  signal RST_ALL : STD_LOGIC := '1';
  
  signal c_size_counter : STD_LOGIC_VECTOR (15 downto 0);
  
begin

    RST_FIFO_DU <= ((not init_RST_FIFO_DU_ff2) and init_RST_FIFO_DU_ff) or (not RST_ALL);
    RST_FIFO_DC <= ((not init_RST_FIFO_DC_ff2) and init_RST_FIFO_DC_ff) or (not RST_ALL);
    RST_ENGINE <= (init_RST_ENGINE_ff2 or (not init_RST_ENGINE_ff)) and RST_ALL;
    BUS_ACK_DC <= BUS_ACK_DC_signal;
    BUS_ACK_DU <= BUS_ACK_DU_signal;
    INTR_ACK_D <= INTR_ACK_D_signal or (not COMMAND(28));
    WAIT_DU <= '1';
    WAIT_DC <= (not BUS_ACKNOWLEDGE_DC1signal) and (not BUS_REQ_DC);
    
	--Generate a pulse to initiate AXI transaction.
    process(CLK)                                                          
    begin                                                                             
      if ((CLK'event) and (CLK='1')) then                                      
        if (CLEAR = '0') then                                                
          BUS_ACK_DU_signal <= '1';                                                                                                      
          BUS_ACK_DC_signal <= '1';
          INTR_ACK_D_signal <= '1';
          BUS_ACKNOWLEDGE_DC1signal <= '1';
        else                                                                                       
          BUS_ACK_DU_signal <= BUS_REQ_DU;                                                               
          BUS_ACK_DC_signal <= BUS_REQ_DC;
          INTR_ACK_D_signal <= INTR_REQ_D;
          BUS_ACKNOWLEDGE_DC1signal <= BUS_ACK_DC_signal;
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
    
	--implement master command interface state machine
    MASTER_EXECUTION_PROC: process(CLK, init_pulse, RESTART)
    begin
      if ((CLK'event) and (CLK='1')) then
        if (RST_ALL = '0') then
          -- reset condition: using RST_ALL
          -- All the signals are default values under reset condition
          mst_exec_state  <= IDLE;
          CS_RW <= '1';
          ADDR <= (others => '0');
          CTRL_IN <= (others => '0');
        else
          -- state transition
          case (mst_exec_state) is

            when IDLE =>
	        if ((init_pulse = '1') or (RESTART = '1')) then
              mst_exec_state  <= INIT_CTRL_IN_1_SM;
            else
              mst_exec_state  <= IDLE;                                                      
            end if; 
            
            when INIT_CTRL_IN_1_SM =>
              CS_RW <= '0';
              ADDR <= "1001";
              CTRL_IN <= "000000000000000" & COMMAND(7 downto 0) & "000000000";
              mst_exec_state  <= INIT_CTRL_IN_2_SM;
                                                                                                      
            when INIT_CTRL_IN_2_SM =>
              CS_RW <= '0';
              ADDR <= "1000";
              CTRL_IN <= "0000000000000000" & "0100" & COMMAND(15 downto 8) & "0000";
              mst_exec_state  <= DONE;
                                                                                                      
            when DONE =>
              CS_RW <= '1';
              ADDR <= (others => '0');
              CTRL_IN <= (others => '0');
              mst_exec_state  <= IDLE;

            when others  =>
                mst_exec_state  <= IDLE;
                
          end case;                                                                                 
        end if;                                                                                       
      end if;                                                                                         
    end process;   

-- RESET FUNCTIONS

	--Generate a pulse to initiate RST_FIFO_DU
	process(CLK)                                                          
	begin                                                                             
	  if ((CLK'event) and (CLK='1')) then
	    if (CLEAR = '0') then
	      init_RST_FIFO_DU_ff <= '0';
	      init_RST_FIFO_DU_ff2 <= '0';
	    else
	      init_RST_FIFO_DU_ff <= COMMAND(25);
	      init_RST_FIFO_DU_ff2 <= init_RST_FIFO_DU_ff;
	    end if;
	  end if;
	end process;

	--Generate a pulse to initiate RST_FIFO_DC
    process(CLK)                                                          
    begin                                                                             
      if ((CLK'event) and (CLK='1')) then
        if (CLEAR = '0') then
          init_RST_FIFO_DC_ff <= '0';
          init_RST_FIFO_DC_ff2 <= '0';
        else
          init_RST_FIFO_DC_ff <= COMMAND(26);
          init_RST_FIFO_DC_ff2 <= init_RST_FIFO_DC_ff;
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
          init_RST_ENGINE_ff <= COMMAND(27);
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
          init_RST_ALL_ff <= COMMAND(31);
          init_RST_ALL_ff2 <= init_RST_ALL_ff;
        end if;
      end if;
    end process;
    
    RST_ALL <= init_RST_ALL_ff2 or (not init_RST_ALL_ff);
    
    COUNTING: process (CLK, CLEAR, FIFO_DC_EMPTY, init_pulse)
    begin
    if (CLEAR = '0') then
        c_size_counter <= x"0000";
    elsif ((CLK'event) and (CLK = '1')) then
        if (init_pulse = '1') then
            c_size_counter <= x"0000";
        elsif(FIFO_DC_EMPTY = '0') then
            c_size_counter <= c_size_counter + 1;
        else
            c_size_counter <= c_size_counter;
        end if;
    end if;
    end process COUNTING;
    
    COUNT_FINISH <= '1' when c_size_counter > COMPRESSED_SIZE else '0';
    
end arch;
