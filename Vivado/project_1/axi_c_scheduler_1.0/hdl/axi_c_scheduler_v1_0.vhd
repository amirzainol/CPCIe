library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity axi_c_scheduler_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_AXI_LITE
		C_S_AXI_LITE_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_LITE_ADDR_WIDTH	: integer	:= 4;

		-- Parameters of Axi Slave Bus Interface INPUT_STREAM
		C_INPUT_STREAM_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface AXIS_JOIN_SWITCH
		C_AXIS_JOIN_SWITCH_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface HEADER_IN
		C_HEADER_IN_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface OUTPUT_STREAM
		C_OUTPUT_STREAM_TDATA_WIDTH	: integer	:= 32;
		C_OUTPUT_STREAM_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface AXIS_SPLIT_SWITCH
		C_AXIS_SPLIT_SWITCH_TDATA_WIDTH	: integer	:= 32;
		C_AXIS_SPLIT_SWITCH_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface HEADER_OUT
		C_HEADER_OUT_TDATA_WIDTH	: integer	:= 32;
		C_HEADER_OUT_START_COUNT	: integer	:= 32
	);
	port (

		command                   : out std_logic_vector(31 downto 0);
        join_suppress             : out std_logic_vector(1 downto 0);
        status                    : out std_logic_vector(31 downto 0);
        total_compressed_size     : out std_logic_vector(31 downto 0);

		-- Ports of Axi Slave Bus Interface S_AXI_LITE
		s_axi_lite_aclk	: in std_logic;
		s_axi_lite_aresetn	: in std_logic;
		s_axi_lite_awaddr	: in std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0);
		s_axi_lite_awprot	: in std_logic_vector(2 downto 0);
		s_axi_lite_awvalid	: in std_logic;
		s_axi_lite_awready	: out std_logic;
		s_axi_lite_wdata	: in std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
		s_axi_lite_wstrb	: in std_logic_vector((C_S_AXI_LITE_DATA_WIDTH/8)-1 downto 0);
		s_axi_lite_wvalid	: in std_logic;
		s_axi_lite_wready	: out std_logic;
		s_axi_lite_bresp	: out std_logic_vector(1 downto 0);
		s_axi_lite_bvalid	: out std_logic;
		s_axi_lite_bready	: in std_logic;
		s_axi_lite_araddr	: in std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0);
		s_axi_lite_arprot	: in std_logic_vector(2 downto 0);
		s_axi_lite_arvalid	: in std_logic;
		s_axi_lite_arready	: out std_logic;
		s_axi_lite_rdata	: out std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
		s_axi_lite_rresp	: out std_logic_vector(1 downto 0);
		s_axi_lite_rvalid	: out std_logic;
		s_axi_lite_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface INPUT_STREAM
		input_stream_aclk	: in std_logic;
		input_stream_aresetn	: in std_logic;
		input_stream_tready	: out std_logic;
		input_stream_tdata	: in std_logic_vector(C_INPUT_STREAM_TDATA_WIDTH-1 downto 0);
		input_stream_tlast	: in std_logic;
		input_stream_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface AXIS_JOIN_SWITCH
		axis_join_switch_aclk	: in std_logic;
		axis_join_switch_aresetn	: in std_logic;
		axis_join_switch_tready	: out std_logic;
		axis_join_switch_tdata	: in std_logic_vector(C_AXIS_JOIN_SWITCH_TDATA_WIDTH-1 downto 0);
		axis_join_switch_tlast	: in std_logic;
		axis_join_switch_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface HEADER_IN
		header_in_aclk	: in std_logic;
		header_in_aresetn	: in std_logic;
		header_in_tready	: out std_logic;
		header_in_tdata	: in std_logic_vector(C_HEADER_IN_TDATA_WIDTH-1 downto 0);
		header_in_tlast	: in std_logic;
		header_in_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface OUTPUT_STREAM
		output_stream_aclk	: in std_logic;
		output_stream_aresetn	: in std_logic;
		output_stream_tvalid	: out std_logic;
		output_stream_tdata	: out std_logic_vector(C_OUTPUT_STREAM_TDATA_WIDTH-1 downto 0);
		output_stream_tlast	: out std_logic;
		output_stream_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface AXIS_SPLIT_SWITCH
		axis_split_switch_aclk	: in std_logic;
		axis_split_switch_aresetn	: in std_logic;
		axis_split_switch_tvalid	: out std_logic;
		axis_split_switch_tdata	: out std_logic_vector(C_AXIS_SPLIT_SWITCH_TDATA_WIDTH-1 downto 0);
		axis_split_switch_tdest   : out std_logic_vector(3 downto 0);
		axis_split_switch_tlast	: out std_logic;
		axis_split_switch_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface HEADER_OUT
		header_out_aclk	: in std_logic;
		header_out_aresetn	: in std_logic;
		header_out_tvalid	: out std_logic;
		header_out_tdata	: out std_logic_vector(C_HEADER_OUT_TDATA_WIDTH-1 downto 0);
		header_out_tlast	: out std_logic;
		header_out_tready	: in std_logic
	);
end axi_c_scheduler_v1_0;

architecture arch_imp of axi_c_scheduler_v1_0 is

	-- component declaration
	component axi_c_scheduler_v1_0_S_AXI_LITE is
		generic(
			C_S_AXI_DATA_WIDTH : integer := 32;
			C_S_AXI_ADDR_WIDTH : integer := 4
		);
		port(
			command       : out std_logic_vector(31 downto 0);
			filesize      : out std_logic_vector(31 downto 0);
			S_AXI_ACLK    : in  std_logic;
			S_AXI_ARESETN : in  std_logic;
			S_AXI_AWADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_AWPROT  : in  std_logic_vector(2 downto 0);
			S_AXI_AWVALID : in  std_logic;
			S_AXI_AWREADY : out std_logic;
			S_AXI_WDATA   : in  std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_WSTRB   : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8) - 1 downto 0);
			S_AXI_WVALID  : in  std_logic;
			S_AXI_WREADY  : out std_logic;
			S_AXI_BRESP   : out std_logic_vector(1 downto 0);
			S_AXI_BVALID  : out std_logic;
			S_AXI_BREADY  : in  std_logic;
			S_AXI_ARADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_ARPROT  : in  std_logic_vector(2 downto 0);
			S_AXI_ARVALID : in  std_logic;
			S_AXI_ARREADY : out std_logic;
			S_AXI_RDATA   : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_RRESP   : out std_logic_vector(1 downto 0);
			S_AXI_RVALID  : out std_logic;
			S_AXI_RREADY  : in  std_logic
		);
	end component axi_c_scheduler_v1_0_S_AXI_LITE;

	signal command_aux  : std_logic_vector(31 downto 0);
	signal filesize_aux : std_logic_vector(31 downto 0);

	signal m_axis_tready_aux  : std_logic;
	signal m_axis_tvalid_aux  : std_logic;

	constant C_NO_ENGINE  : integer := 4; -- no. of engines will be used
	constant C_MAX_ENGINE : integer := 4; -- maximum engines will be used
	signal count_data     : std_logic_vector(31 downto 0);
	signal count_split    : integer range 0 to 15;

	signal count_blocks            : std_logic_vector(31 downto 0);
	signal count_header            : std_logic_vector(31 downto 0);
	signal tlast_output            : std_logic;
	signal total_blocks            : std_logic_vector(31 downto 0);

	signal sw_reset       : std_logic;
	signal not_command_31 : std_logic;
	signal sw_reset_ff1   : std_logic;
	signal sw_reset_ff2   : std_logic;
	
	signal input_stream_tdata_aux : std_logic_vector(31 downto 0);
	
	signal output_stream_tready_aux : std_logic;
	signal axis_join_switch_tvalid_aux : std_logic;
	signal axis_join_switch_tdata_aux : std_logic_vector(31 downto 0);
	signal axis_join_switch_tlast_aux : std_logic;
	
	signal m_axis_tdest_aux : std_logic_vector(3 downto 0);
	
	signal join_switch_out_i      : std_logic_vector(1 downto 0);
	
	signal header_tlast_aux : std_logic;
	signal header_tlast_ff0 : std_logic;
	signal header_tlast_ff1 : std_logic;
	signal header_tlast_ff2 : std_logic;
          
    type state_type is (st_check, st_wait); 
    signal state, next_state : state_type; 
	signal count_c_size_aux      : std_logic_vector(31 downto 0);
	signal count_c_size : std_logic;
	signal count_c_size_i : std_logic;

    type state_status_type is (st_status_check, st_status_wait); 
    signal state_status, next_state_status : state_status_type; 
	signal status_aux : std_logic_vector(31 downto 0);
	signal status_i : std_logic_vector(31 downto 0);
	
begin

	----------------
	-- S_AXI_LITE --
	----------------
	
	-- Instantiation of Axi Bus Interface S00_AXI
	axi_c_scheduler_v1_0_S_AXI_LITE_inst : axi_c_scheduler_v1_0_S_AXI_LITE
		generic map(
			C_S_AXI_DATA_WIDTH => C_S_AXI_LITE_DATA_WIDTH,
			C_S_AXI_ADDR_WIDTH => C_S_AXI_LITE_ADDR_WIDTH
		)
		port map(
			command       => command_aux,
			filesize      => filesize_aux,
			S_AXI_ACLK    => s_axi_lite_aclk,
			S_AXI_ARESETN => s_axi_lite_aresetn,
			S_AXI_AWADDR  => s_axi_lite_awaddr,
			S_AXI_AWPROT  => s_axi_lite_awprot,
			S_AXI_AWVALID => s_axi_lite_awvalid,
			S_AXI_AWREADY => s_axi_lite_awready,
			S_AXI_WDATA   => s_axi_lite_wdata,
			S_AXI_WSTRB   => s_axi_lite_wstrb,
			S_AXI_WVALID  => s_axi_lite_wvalid,
			S_AXI_WREADY  => s_axi_lite_wready,
			S_AXI_BRESP   => s_axi_lite_bresp,
			S_AXI_BVALID  => s_axi_lite_bvalid,
			S_AXI_BREADY  => s_axi_lite_bready,
			S_AXI_ARADDR  => s_axi_lite_araddr,
			S_AXI_ARPROT  => s_axi_lite_arprot,
			S_AXI_ARVALID => s_axi_lite_arvalid,
			S_AXI_ARREADY => s_axi_lite_arready,
			S_AXI_RDATA   => s_axi_lite_rdata,
			S_AXI_RRESP   => s_axi_lite_rresp,
			S_AXI_RVALID  => s_axi_lite_rvalid,
			S_AXI_RREADY  => s_axi_lite_rready
		);
	
	------------------
	-- INPUT_STREAM --
	------------------
	
	input_stream_tready    <= m_axis_tready_aux;
	m_axis_tvalid_aux      <= input_stream_tvalid;
	input_stream_tdata_aux <= input_stream_tdata;
	
	-------------------
	-- OUTPUT_STREAM --
	-------------------

	output_stream_tready_aux <= output_stream_tready;
	output_stream_tvalid     <= axis_join_switch_tvalid;
	output_stream_tdata      <= axis_join_switch_tdata;
	output_stream_tlast      <= '0';
	
	-----------------------
	-- AXIS_SPLIT_SWITCH --
	-----------------------
	
	m_axis_tready_aux        <= axis_split_switch_tready;
	axis_split_switch_tvalid <= m_axis_tvalid_aux;
	axis_split_switch_tdata  <= input_stream_tdata;
	axis_split_switch_tlast  <= '0';
	axis_split_switch_tdest  <= m_axis_tdest_aux;
	
	----------------------
	-- AXIS_JOIN_SWITCH --
	----------------------
	
	axis_join_switch_tready     <= output_stream_tready;
	axis_join_switch_tvalid_aux <= axis_join_switch_tvalid;
	axis_join_switch_tdata_aux  <= axis_join_switch_tdata;
	axis_join_switch_tlast_aux  <= axis_join_switch_tlast;

    ------------------------------
    -- HEADER_IN and HEADER_OUT --
    ------------------------------
    
    header_in_tready <= header_out_tready;
    header_out_tvalid <= header_in_tvalid;
    header_out_tdata <= header_in_tdata;
    header_out_tlast <= header_tlast_aux;

	command        <= command_aux;
	not_command_31 <= not command_aux(31);
	
	status                <= status_aux;
	total_compressed_size <= count_c_size_aux;
			
	-----------------------------
	-- PROCESS OF M_AXIS_TDEST --
	-----------------------------

	m_axis_tdest_aux <= conv_std_logic_vector(count_split, 4);
	
	PROCESS_COUNTER_DATA_IN : process(axis_split_switch_aclk)
	begin
		if (axis_split_switch_aclk'event and axis_split_switch_aclk = '1') then
			if (axis_split_switch_aresetn = '0' or sw_reset = '0') then
				count_data <= (others => '0');
			elsif (m_axis_tready_aux = '1' and m_axis_tvalid_aux = '1') then
				if (count_data = x"00000000") then
					count_data <= x"00000100" - 1; -- this is 1KB of blocksize, change this if required
				else
					count_data <= count_data - 1;
				end if;
			end if;
		end if;
	end process PROCESS_COUNTER_DATA_IN;

	PROCESS_COUNT_SPLIT_TDEST : process(axis_split_switch_aclk, axis_split_switch_aresetn)
	begin
		if (axis_split_switch_aresetn = '0' or sw_reset = '0') then
			count_split <= 0;
		elsif (axis_split_switch_aclk'event and axis_split_switch_aclk = '1') then
			if (count_data = x"00000001") then
				if (count_split = C_NO_ENGINE - 1) then
					count_split <= 0;
				else
					count_split <= count_split + 1;
				end if;
			end if;
		end if;
	end process PROCESS_COUNT_SPLIT_TDEST;

	----------------------------------------
    -- PROCESS OF JOIN_SUPPRESS --
    ----------------------------------------
    
	join_suppress     <= join_switch_out_i;
    join_switch_out_i <= "10" when (count_blocks < total_blocks) else "01";

	------------------------------------
	-- PROCESS OF TLAST --
	------------------------------------

	total_blocks <= ("000000000000000000000000000" & filesize_aux(14 downto 10)) when (command_aux(7 downto 0) = "00000010") else x"00000000";
	tlast_output <= '0' when (count_blocks < total_blocks) else '1';

	PROCESS_COUNTER_FILESIZE : process(output_stream_aclk)
	begin
		if (output_stream_aclk'event and output_stream_aclk = '1') then
			if (output_stream_aresetn = '0' or sw_reset = '0') then
				count_blocks <= (others => '0');
			elsif (axis_join_switch_tlast = '1') then
				count_blocks <= count_blocks + 1;
			end if;
		end if;
	end process PROCESS_COUNTER_FILESIZE;

    header_tlast_ff0 <= '0' when (count_header < total_blocks) else '1';
    
	PROCESS_COUNTER_TLAST : process(header_out_aclk)
	begin
		if (header_out_aclk'event and header_out_aclk = '1') then
			if (header_out_aresetn = '0' or sw_reset = '0') then
				count_header <= x"00000001";
			elsif (header_in_tlast = '1') then
				count_header <= count_header + 1;
			end if;
		end if;
	end process PROCESS_COUNTER_TLAST;

	header_tlast_aux <= (header_tlast_ff1) and (not header_tlast_ff2);
	
	process(s_axi_lite_aclk)
	begin
		if ((s_axi_lite_aclk'event) and (s_axi_lite_aclk = '1')) then
			if (s_axi_lite_aresetn = '0' or sw_reset = '0') then
				header_tlast_ff1 <= '0';
				header_tlast_ff2 <= '0';
			else
				header_tlast_ff1 <= header_tlast_ff0;
				header_tlast_ff2 <= header_tlast_ff1;
			end if;
		end if;
	end process;
		
	----------------------------------------
	-- PROCESS OF RESET --
	----------------------------------------

	sw_reset <= (sw_reset_ff1) or (not sw_reset_ff2);
	
	process(s_axi_lite_aclk) -- Generate a pulse to initiate SW_RESET
	begin
		if ((s_axi_lite_aclk'event) and (s_axi_lite_aclk = '1')) then
			if (s_axi_lite_aresetn = '0') then
				sw_reset_ff1 <= '1';
				sw_reset_ff2 <= '1';
			else
				sw_reset_ff1 <= not_command_31;
				sw_reset_ff2 <= sw_reset_ff1;
			end if;
		end if;
	end process;

	PROCESS_COUNTER_COMPRESSED_SIZE : process(header_in_aclk)
	begin
		if (header_in_aclk'event and header_in_aclk = '1') then
			if (header_in_aresetn = '0' or sw_reset = '0') then
				count_c_size_aux <= (others => '0');
			elsif (count_c_size_i = '1') then
				count_c_size_aux <= count_c_size_aux + header_in_tdata;
			end if;
		end if;
	end process PROCESS_COUNTER_COMPRESSED_SIZE;
	
   SYNC_PROC: process (header_in_aclk)
   begin
      if (header_in_aclk'event and header_in_aclk = '1') then
         if (header_in_aresetn = '1' or sw_reset = '0') then
            state <= st_check;
            count_c_size <= '0';
         else
            state <= next_state;
            count_c_size <= count_c_size_i;
         end if;        
      end if;
   end process;
 
   NEXT_STATE_DECODE: process (state, header_in_tvalid, header_out_tready)
   begin
      next_state <= state;
      count_c_size_i <= '0';
      case (state) is
         when st_check =>
            if header_in_tvalid = '1' and header_out_tready = '1' then
               count_c_size_i <= '1';
               next_state <= st_wait;
            end if;
         when st_wait =>
            next_state <= st_check;
         when others =>
            next_state <= st_check;
      end case;      
   end process;

   SYNC_PROC_2: process (header_in_aclk)
   begin
      if (header_in_aclk'event and header_in_aclk = '1') then
         if (header_in_aresetn = '1' or sw_reset = '0') then
            state_status <= st_status_check;
            status_aux <= (others => '0');
         else
            state_status <= next_state_status;
            status_aux <= status_i;
         end if;        
      end if;
   end process;
 
   NEXT_STATE_DECODE_2: process (state_status, command_aux, header_tlast_aux)
   begin
      next_state_status <= state_status;
      status_i <= x"00000000"; -- IDLE
      case (state_status) is
         when st_status_check =>
            if command_aux(31 downto 24) = x"21" and header_tlast_aux = '0' then
               status_i <= x"00000001"; -- BUSY
               next_state_status <= st_status_check;
            elsif command_aux(31 downto 24) = x"21" and header_tlast_aux = '1' then
               next_state_status <= st_status_wait;
            end if;
         when st_status_wait =>
            if command_aux(31 downto 24) = x"00" then -- ACKNOWLEDGE FROM HOST
               next_state_status <= st_status_check;
            end if;
         when others =>
            next_state_status <= st_status_check;
      end case;      
   end process;
   
end arch_imp;
