library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xmatchpro_decompressor_engine_v1_0 is
	generic (
		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M00_AXIS_START_COUNT	: integer	:= 32
	);
	port (

		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk	: in std_logic;
		s00_axis_aresetn	: in std_logic;
		s00_axis_tready	: out std_logic;
		s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tvalid	: in std_logic;
		s00_axis_tuser : in std_logic_vector(20 downto 0);
		s00_axis_tlast	: in std_logic;
		s00_axis_tdest : in std_logic_vector(3 downto 0);

		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk	: in std_logic;
		m00_axis_aresetn	: in std_logic;
		m00_axis_tvalid	: out std_logic;
		m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tready	: in std_logic;
		m00_axis_tlast	: out std_logic;

		command : in std_logic_vector(31 downto 0);
		crc_32_d : out std_logic_vector(31 downto 0);
		status : out std_logic_vector(31 downto 0);
		engine_ready : out std_logic;
				
		xpro_aclk : in std_logic;
		xpro_aresetn : in std_logic
	);
end xmatchpro_decompressor_engine_v1_0;

architecture arch_imp of xmatchpro_decompressor_engine_v1_0 is

    component decompressor_engine is
    port
    (
        CS : in std_logic;
        RW : in std_logic;
        ADDRESSD: in std_logic_vector(3 downto 0);
        CONTROL_IND : in std_logic_vector (31 downto 0);
        CONTROL_OUT_D: out std_logic_vector (31 downto 0);
        CLK : in std_logic;
        CLEAR: in std_logic;
         BUS_ACKNOWLEDGE_DC : in std_logic;
        BUS_ACKNOWLEDGE_DU : in std_logic;
        WAIT_DC : in std_logic;
        WAIT_DU : in std_logic;
        C_DATAIN : in std_logic_vector(31 downto 0);
        U_DATAOUT : out std_logic_vector(31 downto 0);
        FINISHED_D : out std_logic;
        FLUSHING_D : out std_logic;
        DECOMPRESSING : out std_logic;
        U_DATA_VALID : out std_logic;
        DECODING_OVERFLOW : out std_logic;
        CRC_ERROR : out std_logic; -- error condition in the compression or decompression channels
        INTERRUPT_REQ_D : out std_logic;
        INTERRUPT_ACK_D : in std_logic;
        BUS_REQUEST_DC : out std_logic;
        BUS_REQUEST_DU : out std_logic;
        CRC_OUT_D_32 : out std_logic_vector(31 downto 0)
    );
    end component decompressor_engine;

component xpro_d_controller is
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
end component xpro_d_controller;

  component axis_fifo_axis_data_fifo_0_0 is
  port (
    S_AXIS_tvalid : in STD_LOGIC;
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component axis_fifo_axis_data_fifo_0_0;

    signal CONTROL_OUT_D_aux : std_logic_vector (31 downto 0);
    signal FINISHED_D_aux : std_logic;
    signal FLUSHING_D_aux : std_logic;
    signal DECOMPRESSING_aux : std_logic;
    signal DECODING_OVERFLOW_aux : std_logic;
    signal CRC_ERROR_aux : std_logic;
signal BUS_ACKNOWLEDGE_DU_aux : std_logic;
signal INTERRUPT_ACK_D_aux : std_logic;
signal CS_RW_aux : std_logic;
signal ADDRESSD_aux: std_logic_vector(3 downto 0);
signal CONTROL_IND_aux : std_logic_vector (31 downto 0);
signal RST_ENGINE_aux : std_logic;
signal COUNT_FINISH_aux : std_logic;
signal U_DATAOUT_aux : std_logic_vector(31 downto 0);
signal U_DATA_VALID_aux : std_logic;
signal U_DATA_VALID_N_aux : std_logic;
signal WAIT_DU_aux : std_logic;
signal WAIT_DU_CTLR_aux : std_logic;
signal S_AXIS_TREADY_DU_aux : std_logic;
signal RST_FIFO_DU_aux : std_logic;
signal RST_FIFO_DU_N_aux : std_logic;
signal RST_FIFO_DC_aux : std_logic;
signal RST_FIFO_DC_N_aux : std_logic;
signal BUS_REQUEST_DC_aux : std_logic;
signal BUS_REQUEST_DU_aux : std_logic;
signal INTERRUPT_REQ_D_aux : std_logic;
signal FIFO_DC_EMPTY_aux : std_logic;
signal M_AXIS_tvalid_aux : std_logic;
signal WAIT_DC_aux : std_logic;
signal WAIT_DC_TREADY_aux : std_logic;
signal M_AXIS_tready_aux : std_logic;
signal BUS_ACKNOWLEDGE_DC_aux : std_logic;
signal M_AXIS_tdata_aux : std_logic_vector (31 downto 0);

-- registers
signal BUS_ACKNOWLEDGE_DC_dly_aux : std_logic;
signal M_AXIS_tdata_dly_aux : std_logic_vector (31 downto 0);
signal M_AXIS_tdata_dly_CE_aux : std_logic_vector (31 downto 0);
signal WAIT_DC_TVALID_aux : std_logic;
signal M_AXIS_tvalid_dly_1_aux : std_logic;
signal M_AXIS_tvalid_dly_2_aux : std_logic;
signal WAIT_DC_TVALID_dly_aux : std_logic;
signal M_AXIS_tdata_dly_X : std_logic_vector (31 downto 0);

signal compressed_size_reg : std_logic_vector (15 downto 0);
signal tuser_compressed_size : std_logic_vector (15 downto 0);

type state_type is (st1_wait_tvalid, st2_wait_intr, st3_delay); 
signal state, next_state : state_type;

signal m00_axis_tready_i : std_logic;
signal m00_axis_tvalid_i : std_logic;
signal m00_axis_tvalid_ff : std_logic;
signal m00_axis_tdata_i : std_logic_vector (31 downto 0);
signal m00_axis_tlast_aux : std_logic;
signal m00_axis_tlast_ff1 : std_logic;
signal m00_axis_tlast_ff2 : std_logic;
signal m00_axis_tlast_i : std_logic;
signal totalwords_reg : std_logic_vector (15 downto 0);

   type state_type1 is (st1_idle, st_wait_s_tlast, st_wait_m_tlast, st_wait_delay); 
   signal state1, next_state1 : state_type1; 
   signal engine_ready_i : std_logic;
   
   signal s00_axis_tlast_i : std_logic_vector (3 downto 0);
   signal s00_axis_tvalid_i : std_logic;
   
   signal assigned_tdest : std_logic_vector (3 downto 0);
   signal next_assigned_tdest : std_logic_vector (3 downto 0);
   
   signal s00_axis_tlast_bit4 : std_logic;
   
   signal self_reset_ff1 : std_logic;
   signal self_reset_ff2 : std_logic;
   signal self_reset_ff3 : std_logic;
   signal self_reset_ff4 : std_logic;
   signal self_reset_ff5 : std_logic;
   signal self_reset_ff6 : std_logic;
   signal self_resetn : std_logic;
   
   signal xpro_clear : std_logic;
   
   signal restart_engine : std_logic;
   signal restart_engine_n : std_logic;
   
   signal RST_ENGINE_i : std_logic;
   
begin

U_DATA_VALID_N_aux <= not U_DATA_VALID_aux;
WAIT_DU_aux <= WAIT_DU_CTLR_aux and S_AXIS_TREADY_DU_aux;
RST_FIFO_DU_N_aux <= not RST_FIFO_DU_aux;
RST_FIFO_DC_N_aux <= not RST_FIFO_DC_aux;
FIFO_DC_EMPTY_aux <= not M_AXIS_tvalid_aux;
WAIT_DC_aux <= COUNT_FINISH_aux or (M_AXIS_tvalid_dly_1_aux and M_AXIS_tvalid_dly_2_aux);
M_AXIS_tready_aux <= (WAIT_DC_TVALID_aux and WAIT_DC_TVALID_dly_aux);
M_AXIS_tdata_dly_CE_aux <= M_AXIS_tdata_dly_aux when WAIT_DC_TREADY_aux = '1' else M_AXIS_tdata_dly_X;
WAIT_DC_TVALID_aux <= WAIT_DC_TREADY_aux and M_AXIS_tvalid_aux;

status <= x"00000000";

process (xpro_aclk)
begin
   if xpro_aclk'event and xpro_aclk='1' then  
      if xpro_aresetn='0' then   
         M_AXIS_tdata_dly_X <= (others => '0');
      elsif WAIT_DC_TREADY_aux ='1' then
         M_AXIS_tdata_dly_X <= M_AXIS_tdata_dly_aux;
      end if;
   end if;
end process;

process (xpro_aclk)
begin
   if xpro_aclk'event and xpro_aclk='1' then  
      if xpro_aresetn='0' then   
         M_AXIS_tdata_dly_aux <= (others => '0');
      elsif M_AXIS_tready_aux ='1' then
         M_AXIS_tdata_dly_aux <= M_AXIS_tdata_aux;
      end if;
   end if;
end process;

    FLIP_FLOP_REGISTERS: process (xpro_aclk)
    begin
        if (xpro_aclk'event and xpro_aclk = '1') then  
            if xpro_aresetn = '0' then   
                BUS_ACKNOWLEDGE_DC_dly_aux <= '0';
                M_AXIS_tvalid_dly_1_aux <= '0';
                M_AXIS_tvalid_dly_2_aux <= '0';
                WAIT_DC_TVALID_dly_aux <= '0';
            else
                BUS_ACKNOWLEDGE_DC_dly_aux <= BUS_ACKNOWLEDGE_DC_aux;
                M_AXIS_tvalid_dly_1_aux <= M_AXIS_tvalid_aux;
                M_AXIS_tvalid_dly_2_aux <= M_AXIS_tvalid_dly_1_aux;
                WAIT_DC_TVALID_dly_aux <= WAIT_DC_TVALID_aux;
            end if;
        end if;
    end process FLIP_FLOP_REGISTERS;

inst_DECOMPRESSOR_ENGINE: decompressor_engine
	port map (
        CS => CS_RW_aux,
        RW => CS_RW_aux,
        ADDRESSD => ADDRESSD_aux,
        CONTROL_IND => CONTROL_IND_aux,
        CONTROL_OUT_D => CONTROL_OUT_D_aux,
        CLK => xpro_aclk,
        CLEAR => RST_ENGINE_i,
        BUS_ACKNOWLEDGE_DC => BUS_ACKNOWLEDGE_DC_dly_aux,
        BUS_ACKNOWLEDGE_DU => BUS_ACKNOWLEDGE_DU_aux,
        WAIT_DC => WAIT_DC_aux,
        WAIT_DU => WAIT_DU_aux,
        C_DATAIN => M_AXIS_tdata_dly_CE_aux,
        U_DATAOUT => U_DATAOUT_aux,
        FINISHED_D => FINISHED_D_aux,
        FLUSHING_D => FLUSHING_D_aux,
        DECOMPRESSING => DECOMPRESSING_aux,
        U_DATA_VALID => U_DATA_VALID_aux,
        DECODING_OVERFLOW => DECODING_OVERFLOW_aux,
        CRC_ERROR => CRC_ERROR_aux,
        INTERRUPT_REQ_D => INTERRUPT_REQ_D_aux,
        INTERRUPT_ACK_D => INTERRUPT_ACK_D_aux,
        BUS_REQUEST_DC => BUS_REQUEST_DC_aux,
        BUS_REQUEST_DU => BUS_REQUEST_DU_aux,
        CRC_OUT_D_32 => crc_32_d
	);
    
xpro_clear <= xpro_aresetn and self_resetn;
RST_ENGINE_i <= RST_ENGINE_aux and restart_engine_n;

inst_DECOMPRESSOR_CONTROLLER: xpro_d_controller
	port map (
    CLK => xpro_aclk,
    CLEAR => xpro_clear,
    COMMAND => command,
    COMPRESSED_SIZE => compressed_size_reg,
    RESTART => restart_engine,
    BUS_REQ_DC => BUS_REQUEST_DC_aux,
    BUS_REQ_DU => BUS_REQUEST_DU_aux,
    BUS_ACK_DC => BUS_ACKNOWLEDGE_DC_aux,
    BUS_ACK_DU => BUS_ACKNOWLEDGE_DU_aux,
    INTR_ACK_D => INTERRUPT_ACK_D_aux,
    INTR_REQ_D => INTERRUPT_REQ_D_aux,
    WAIT_DC => WAIT_DC_TREADY_aux,
    WAIT_DU => WAIT_DU_CTLR_aux,
    CS_RW => CS_RW_aux,
    ADDR => ADDRESSD_aux,
    CTRL_IN => CONTROL_IND_aux,
    RST_FIFO_DU => RST_FIFO_DU_aux,
    RST_FIFO_DC => RST_FIFO_DC_aux,
    RST_ENGINE => RST_ENGINE_aux,
    COUNT_FINISH => COUNT_FINISH_aux,
    FIFO_DC_EMPTY => FIFO_DC_EMPTY_aux
	);

inst_FIFO_DC: component axis_fifo_axis_data_fifo_0_0
    port map (
      M_AXIS_tdata => M_AXIS_tdata_aux,
      M_AXIS_tready => M_AXIS_tready_aux,
      M_AXIS_tvalid => M_AXIS_tvalid_aux,
      S_AXIS_tdata => s00_axis_tdata,
      S_AXIS_tready => s00_axis_tready,
      S_AXIS_tvalid => s00_axis_tvalid,
      m_axis_aclk => xpro_aclk,
      m_axis_aresetn => xpro_aresetn,
      s_axis_aclk => s00_axis_aclk,
      s_axis_aresetn => RST_FIFO_DC_N_aux
    );

inst_FIFO_DU: component axis_fifo_axis_data_fifo_0_0
    port map (
      M_AXIS_tdata => m00_axis_tdata_i,
      M_AXIS_tready => m00_axis_tready_i,
      M_AXIS_tvalid => m00_axis_tvalid_i,
      S_AXIS_tdata => U_DATAOUT_aux,
      S_AXIS_tready => S_AXIS_TREADY_DU_aux,
      S_AXIS_tvalid => U_DATA_VALID_N_aux,
      m_axis_aclk => m00_axis_aclk,
      m_axis_aresetn => m00_axis_aresetn,
      s_axis_aclk => xpro_aclk,
      s_axis_aresetn => RST_FIFO_DU_N_aux
    );

--m00_axis_tready_i <= m00_axis_tready or m00_axis_tvalid_ff;
m00_axis_tready_i <= m00_axis_tready;

process (m00_axis_aclk)
begin
   if m00_axis_aclk'event and m00_axis_aclk='1' then  
      if m00_axis_aresetn='0' then
      m00_axis_tvalid_ff <= '0';
      m00_axis_tvalid <= '0';
      m00_axis_tdata <= (others => '0');
      m00_axis_tlast_ff1 <= '0';
      m00_axis_tlast_ff2 <= '0';
      else
      m00_axis_tvalid_ff <= m00_axis_tvalid_i;
      m00_axis_tvalid <= m00_axis_tvalid_i;
      m00_axis_tdata <= m00_axis_tdata_i;
      m00_axis_tlast_ff1 <= m00_axis_tlast_aux;
      m00_axis_tlast_ff2 <= m00_axis_tlast_ff1;
      end if;
   end if;
end process;

m00_axis_tlast <= m00_axis_tlast_i;
m00_axis_tlast_aux <= '1' when totalwords_reg = x"0001" else '0';
m00_axis_tlast_i <= m00_axis_tlast_ff1 and (not m00_axis_tlast_ff2);

process (m00_axis_aclk)
begin
   if m00_axis_aclk'event and m00_axis_aclk='1' then  
      if m00_axis_aresetn='0' then   
         self_reset_ff1 <= '0';
         self_reset_ff2 <= '0';
         self_reset_ff3 <= '0';
         self_reset_ff4 <= '0';
         self_reset_ff5 <= '0';
         self_reset_ff6 <= '0';
      else
         self_reset_ff1 <= m00_axis_tlast_i;
         self_reset_ff2 <= self_reset_ff1;
         self_reset_ff3 <= self_reset_ff2;
         self_reset_ff4 <= self_reset_ff3;
         self_reset_ff5 <= self_reset_ff4;
         self_reset_ff6 <= self_reset_ff5;
      end if;
   end if;
end process;

self_resetn <= not self_reset_ff6;
restart_engine <= self_reset_ff6;
restart_engine_n <= not self_reset_ff6;

process (m00_axis_aclk)
begin
   if m00_axis_aclk'event and m00_axis_aclk='1' then  
      if CS_RW_aux='0' and ADDRESSD_aux = "1001" then   
         totalwords_reg <= "00" & CONTROL_IND_aux(15 downto 2);
      elsif m00_axis_tvalid_i ='1' and m00_axis_tready_i = '1' then
         totalwords_reg <= totalwords_reg - 1;
      end if;
   end if;
end process;

   process (s00_axis_aclk)
   begin
      if (s00_axis_aclk'event and s00_axis_aclk = '1') then
         if (s00_axis_aresetn = '0') then --------------------------------------<<<<
            compressed_size_reg <= (others => '0');
         else
            compressed_size_reg <= tuser_compressed_size;
         end if;        
      end if;
   end process;
   
   SYNC_PROC: process (s00_axis_aclk)
   begin
      if (s00_axis_aclk'event and s00_axis_aclk = '1') then
         if (s00_axis_aresetn = '0') then
            state <= st1_wait_tvalid;
         else
            state <= next_state;
         end if;        
      end if;
   end process;
   
   tuser_compressed_size <= s00_axis_tuser(20 downto 5);

   SYNC_PROC1: process (s00_axis_aclk)
   begin
      if (s00_axis_aclk'event and s00_axis_aclk = '1') then
         if (s00_axis_aresetn = '0') then
            state1 <= st1_idle;
            assigned_tdest <= "0000";
            engine_ready <= '0';
         else
            state1 <= next_state1;
            assigned_tdest <= next_assigned_tdest;
            engine_ready <= engine_ready_i;
         end if;        
      end if;
   end process;

   NEXT_STATE_DECODE1: process (state1, 
   assigned_tdest, 
   s00_axis_tlast_bit4, 
   s00_axis_tvalid_i, 
   s00_axis_tlast_i, 
   m00_axis_tlast_i)
   begin
   
      next_state1 <= state1;
      next_assigned_tdest <= assigned_tdest;
      engine_ready_i <= '1';
      
      case (state1) is
      
         when st1_idle =>
         if s00_axis_tvalid_i = '1' then
         next_assigned_tdest <= s00_axis_tdest;
         next_state1 <= st_wait_s_tlast;
         end if;
         
         when st_wait_s_tlast =>
         if s00_axis_tlast_bit4 = '1' and s00_axis_tlast_i = assigned_tdest then
         next_state1 <= st_wait_m_tlast;
         end if;
                  
         when st_wait_m_tlast =>
         engine_ready_i <= '0';
         if m00_axis_tlast_i = '1' then
         next_state1 <= st_wait_delay;
         end if;
         
         when st_wait_delay =>
         next_state1 <= st1_idle;
         
         when others =>
            next_state1 <= st1_idle;
      end case;
   end process;

s00_axis_tlast_bit4 <= s00_axis_tuser(4); -- tlast
s00_axis_tlast_i <= s00_axis_tuser(3 downto 0); -- tdest of tlast
s00_axis_tvalid_i <= s00_axis_tvalid;

end arch_imp;
