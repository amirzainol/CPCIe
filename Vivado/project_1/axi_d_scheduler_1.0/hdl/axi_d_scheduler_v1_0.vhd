library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity axi_d_scheduler_v1_0 is
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
        join_suppress             : out std_logic_vector(3 downto 0);
        status                    : out std_logic_vector(31 downto 0);
        command_in                : in std_logic_vector(31 downto 0);
        engine_ready_in           : in std_logic_vector(15 downto 0);

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
		axis_split_switch_tlast	: out std_logic;
		axis_split_switch_tready	: in std_logic;
		axis_split_switch_tuser	: out std_logic_vector(20 downto 0);
		axis_split_switch_tdest	: out std_logic_vector(3 downto 0);

		-- Ports of Axi Master Bus Interface HEADER_OUT
		header_out_aclk	: in std_logic;
		header_out_aresetn	: in std_logic;
		header_out_tvalid	: out std_logic;
		header_out_tdata	: out std_logic_vector(C_HEADER_OUT_TDATA_WIDTH-1 downto 0);
		header_out_tlast	: out std_logic;
		header_out_tready	: in std_logic
	);
end axi_d_scheduler_v1_0;

architecture arch_imp of axi_d_scheduler_v1_0 is

	-- component declaration
	component axi_d_scheduler_v1_0_S_AXI_LITE is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component axi_d_scheduler_v1_0_S_AXI_LITE;

		-- Ports of Axi Slave Bus Interface INPUT_STREAM
		signal input_stream_tdata_aux : std_logic_vector(31 downto 0);
		signal input_stream_tvalid_aux : std_logic;
		signal input_stream_tready_aux : std_logic;

		-- Ports of Axi Slave Bus Interface AXIS_JOIN_SWITCH
		signal axis_join_switch_tdata_aux : std_logic_vector(31 downto 0);
		signal axis_join_switch_tlast_aux : std_logic;
		signal axis_join_switch_tvalid_aux : std_logic;
		signal axis_join_switch_tready_aux : std_logic;

		-- Ports of Axi Slave Bus Interface HEADER_IN
		signal header_in_tdata_aux : std_logic_vector(31 downto 0);
		signal header_in_tlast_aux : std_logic;
		signal header_in_tvalid_aux : std_logic;
		signal header_in_tready_aux : std_logic;

		-- Ports of Axi Master Bus Interface OUTPUT_STREAM
		signal output_stream_tready_aux : std_logic;
		signal output_stream_tvalid_aux : std_logic;
		signal output_stream_tdata_aux : std_logic_vector(31 downto 0);
		signal output_stream_tlast_aux : std_logic;
        
		-- Ports of Axi Master Bus Interface AXIS_SPLIT_SWITCH
		signal axis_split_switch_tready_aux : std_logic;
		signal axis_split_switch_tvalid_aux : std_logic := '0';
        signal axis_split_switch_tdata_aux : std_logic_vector(31 downto 0);
        signal axis_split_switch_tlast_aux : std_logic;
        signal axis_split_switch_tuser_aux : std_logic_vector(20 downto 0);
        signal axis_split_switch_tdest_aux : std_logic_vector(3 downto 0);
        
		-- Ports of Axi Master Bus Interface HEADER_OUT
		signal header_out_tready_aux : std_logic;

signal input_stream_tvalid_ff : std_logic;
signal input_stream_tdata_ff : std_logic_vector(31 downto 0);
signal header_in_tdata_ff : std_logic_vector(31 downto 0);

signal load_counter_c_size_i : std_logic;
signal count_c_size : std_logic_vector(15 downto 0);

	constant C_NO_ENGINE  : integer := 4; -- no. of engines will be used
	signal count_split    : integer range 0 to 15;
	signal tdest_aux : std_logic_vector(3 downto 0);
	
	signal join_suppress_tmp : std_logic_vector(15 downto 0);
	
   type state_type is ( st1_idle, 
                        st2_wait_filesize, 
                        st2_wait_blocksize, 
                        st2_wait_totalblocks, 
                        st_3_run,
                        st_4_c_size,
                        st_4_crc, 
                        st_5_split,
                        st_5_split_1,
                        st_5_split_wait,
                        st_5_split_last,
                        st_5_split_last_1,
                        wait_here); 
   signal state, next_state : state_type; 
  
   signal totalblocks_reg : std_logic_vector(31 downto 0);
   signal blocksize_reg : std_logic_vector(31 downto 0);
   signal filesize_reg : std_logic_vector(31 downto 0);
   
   signal load_filesize_i : std_logic;
   signal load_blocksize_i : std_logic;
   signal load_totalblocks_i : std_logic;
   
   signal header_out_tvalid_aux : std_logic;
   signal header_out_tdata_aux : std_logic_vector(31 downto 0);
   
   signal next_engine_ready : std_logic;
   
   signal tdest_aux_i, next_tdest_aux_i : std_logic_vector(3 downto 0);
   
   signal counter_tlast : std_logic_vector(31 downto 0);
   
   signal command_i : std_logic_vector(31 downto 0);
   signal next_command_i : std_logic_vector(31 downto 0);
   
   signal count_join_tlast : std_logic_vector(31 downto 0);
   
   signal output_stream_tvalid_i : std_logic;
   signal axis_join_switch_tvalid_ff1_ff2 : std_logic;
   signal axis_join_switch_tvalid_ff1 : std_logic;
   			
begin

-- Instantiation of Axi Bus Interface S_AXI_LITE
axi_d_scheduler_v1_0_S_AXI_LITE_inst : axi_d_scheduler_v1_0_S_AXI_LITE
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S_AXI_LITE_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S_AXI_LITE_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> s_axi_lite_aclk,
		S_AXI_ARESETN	=> s_axi_lite_aresetn,
		S_AXI_AWADDR	=> s_axi_lite_awaddr,
		S_AXI_AWPROT	=> s_axi_lite_awprot,
		S_AXI_AWVALID	=> s_axi_lite_awvalid,
		S_AXI_AWREADY	=> s_axi_lite_awready,
		S_AXI_WDATA	=> s_axi_lite_wdata,
		S_AXI_WSTRB	=> s_axi_lite_wstrb,
		S_AXI_WVALID	=> s_axi_lite_wvalid,
		S_AXI_WREADY	=> s_axi_lite_wready,
		S_AXI_BRESP	=> s_axi_lite_bresp,
		S_AXI_BVALID	=> s_axi_lite_bvalid,
		S_AXI_BREADY	=> s_axi_lite_bready,
		S_AXI_ARADDR	=> s_axi_lite_araddr,
		S_AXI_ARPROT	=> s_axi_lite_arprot,
		S_AXI_ARVALID	=> s_axi_lite_arvalid,
		S_AXI_ARREADY	=> s_axi_lite_arready,
		S_AXI_RDATA	=> s_axi_lite_rdata,
		S_AXI_RRESP	=> s_axi_lite_rresp,
		S_AXI_RVALID	=> s_axi_lite_rvalid,
		S_AXI_RREADY	=> s_axi_lite_rready
	);

		-- Ports of Axi Slave Bus Interface INPUT_STREAM
		input_stream_tready <= input_stream_tready_aux;
		input_stream_tdata_aux <= input_stream_tdata;
		input_stream_tvalid_aux <= input_stream_tvalid;

		-- Ports of Axi Slave Bus Interface AXIS_JOIN_SWITCH
		axis_join_switch_tready	<= axis_join_switch_tready_aux;
		axis_join_switch_tdata_aux <= axis_join_switch_tdata;
		axis_join_switch_tlast_aux <= axis_join_switch_tlast;
		axis_join_switch_tvalid_aux <= axis_join_switch_tvalid;

		-- Ports of Axi Slave Bus Interface HEADER_IN
		header_in_tready	<= header_in_tready_aux;
		header_in_tdata_aux <= header_in_tdata;
		header_in_tlast_aux <= header_in_tlast;
		header_in_tvalid_aux <= header_in_tvalid;

		-- Ports of Axi Master Bus Interface OUTPUT_STREAM
		output_stream_tvalid	<= output_stream_tvalid_aux;
		output_stream_tdata	<= output_stream_tdata_aux;
		output_stream_tlast	<= output_stream_tlast_aux;
		output_stream_tready_aux <= output_stream_tready;

		-- Ports of Axi Master Bus Interface AXIS_SPLIT_SWITCH
		axis_split_switch_tvalid	<= axis_split_switch_tvalid_aux;
		axis_split_switch_tdata	<= axis_split_switch_tdata_aux;
		axis_split_switch_tlast	<= axis_split_switch_tlast_aux;
		axis_split_switch_tready_aux <= axis_split_switch_tready;
		axis_split_switch_tuser	<= axis_split_switch_tuser_aux;
		axis_split_switch_tdest	<= axis_split_switch_tdest_aux;

		-- Ports of Axi Master Bus Interface HEADER_OUT
		header_out_tvalid	<= header_out_tvalid_aux;
		header_out_tdata	<= header_out_tdata_aux;
		header_out_tlast	<= '0';
		header_out_tready_aux <= header_out_tready;

        output_stream_tvalid_aux <= output_stream_tvalid_i;
        output_stream_tdata_aux <= axis_join_switch_tdata_aux;
        output_stream_tlast_aux <= axis_join_switch_tlast_aux;
        axis_join_switch_tready_aux <= output_stream_tready_aux;
		
		axis_join_switch_tvalid_ff1_ff2 <= axis_join_switch_tvalid_aux and axis_join_switch_tvalid_ff1;
		output_stream_tvalid_i <= axis_join_switch_tvalid_ff1_ff2 when count_join_tlast < 16 else '0';

process (input_stream_aclk)
begin
   if input_stream_aclk'event and input_stream_aclk='1' then  
      if input_stream_aclk='0' then   
         input_stream_tvalid_ff <= '0';
         input_stream_tdata_ff <= (others => '0');
         header_in_tdata_ff <= (others => '0');
         axis_join_switch_tvalid_ff1 <= '0';
      else
         input_stream_tvalid_ff <= input_stream_tvalid_aux;
         input_stream_tdata_ff <= input_stream_tdata_aux;
         header_in_tdata_ff <= header_in_tdata_aux;
         axis_join_switch_tvalid_ff1 <= axis_join_switch_tvalid_aux;
      end if;
   end if;
end process;

process (input_stream_aclk)
begin
   if input_stream_aclk'event and input_stream_aclk='1' then  
      if input_stream_aresetn ='0' then 
         for i in 1 to C_NO_ENGINE-1 loop
            join_suppress_tmp(i) <= '1';
         end loop;
         join_suppress_tmp(0) <= '0';
      elsif axis_join_switch_tlast = '1' then 
         for i in 0 to C_NO_ENGINE-2 loop
            join_suppress_tmp(i+1) <= join_suppress_tmp(i);
         end loop;
         join_suppress_tmp(0) <= join_suppress_tmp(C_NO_ENGINE-1);
      end if; 
   end if;
end process;

join_suppress <= join_suppress_tmp(C_NO_ENGINE-1 downto 0);

--   process (input_stream_aclk)
--   begin
--      if (input_stream_aclk'event and input_stream_aclk = '1') then
--         if (input_stream_aresetn = '0') then
--            command <= x"00000000";
--         else
--            command <= command_in;
--         end if;        
--      end if;
--   end process;
  
   command <= command_i;
   
--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (input_stream_aclk)
   begin
      if (input_stream_aclk'event and input_stream_aclk = '1') then
         if (input_stream_aresetn = '0') then
            state <= st1_idle;
            tdest_aux_i <= (others => '0');
            command_i <= (others => '0');
         else
            state <= next_state;
            tdest_aux_i <= next_tdest_aux_i;
            command_i <= next_command_i;  
         end if;        
      end if;
   end process;
   
   NEXT_STATE_DECODE: process ( state,
                                command_in,
                                tdest_aux,
                                input_stream_tvalid_ff, 
                                totalblocks_reg, 
                                axis_split_switch_tready_aux,
                                count_c_size,
                                next_engine_ready,
                                counter_tlast,
                                count_join_tlast)
   begin
      next_state <= state;
      next_tdest_aux_i <= tdest_aux;
      next_command_i <= command_in;
      load_counter_c_size_i <= '0';
      load_filesize_i <= '0';
      load_blocksize_i <= '0';
      load_totalblocks_i <= '0';
      header_out_tvalid_aux <= '0';
      header_in_tready_aux <= '0';
      input_stream_tready_aux <= '1';
      axis_split_switch_tvalid_aux <= '0';
      axis_split_switch_tdata_aux <= (others => '0');
      axis_split_switch_tlast_aux <= '0';
      axis_split_switch_tuser_aux <= (others => '0');
      axis_split_switch_tdest_aux <= tdest_aux_i;
      
      case (state) is
         when st1_idle =>
            if input_stream_tvalid_ff = '1' then
                load_filesize_i <= '1';
               next_state <= st2_wait_filesize;
            end if;
         when st2_wait_filesize =>
            load_blocksize_i <= '1';
            next_state <= st2_wait_blocksize;
            
         when st2_wait_blocksize =>
            load_totalblocks_i <= '1';
            next_state <= st2_wait_totalblocks;
            
         when st2_wait_totalblocks =>
            if input_stream_tvalid_ff = '1' then
         header_out_tvalid_aux <= '1';
         header_out_tdata_aux <= input_stream_tdata_ff;
         end if;
            next_state <= st_3_run;
            
        when st_3_run =>
            if input_stream_tvalid_ff = '1' then
            header_out_tvalid_aux <= '1';
            header_out_tdata_aux <= input_stream_tdata_ff;
            end if;
            if totalblocks_reg = x"00000001" then
            input_stream_tready_aux <= '0';
            next_state <= st_4_c_size;
            end if;
        
        when st_4_c_size =>
            input_stream_tready_aux <= '0';
            header_in_tready_aux <= '1';
            next_state <= st_4_crc; 
        
        when st_4_crc =>
            load_counter_c_size_i <= '1'; 
            header_in_tready_aux <= '1';
            next_state <= st_5_split;
        
        when st_5_split =>
        axis_split_switch_tvalid_aux <= '1';
        axis_split_switch_tdata_aux <= input_stream_tdata_ff;
        axis_split_switch_tuser_aux(20 downto 5) <= count_c_size;
--        axis_split_switch_tdest_aux <= tdest_aux_i;
        if count_c_size < x"0003" then
        header_in_tready_aux <= '1';
        next_state <= st_5_split_1;
        end if;
        
        when st_5_split_1 =>
        load_counter_c_size_i <= '1';
        header_in_tready_aux <= '1';
        axis_split_switch_tvalid_aux <= '1';
        axis_split_switch_tdata_aux <= input_stream_tdata_ff;
        axis_split_switch_tuser_aux(4) <= '1'; -- tlast
        axis_split_switch_tuser_aux(3 downto 0) <= tdest_aux_i;
        axis_split_switch_tuser_aux(20 downto 5) <= count_c_size;
        --axis_split_switch_tdest_aux <= tdest_aux;
        if next_engine_ready = '1' then
        next_state <= st_5_split;
        else
        input_stream_tready_aux <= '0';
        next_state <= st_5_split_wait;
        end if;
        
        when st_5_split_wait =>
--        input_stream_tready_aux <= '0';
--        if next_engine_ready = '1' then
--        next_state <= st_5_split;
--        end if;
        if next_engine_ready = '1' and counter_tlast < 32 then
         input_stream_tready_aux <= '1';
        next_state <= st_5_split;
        elsif next_engine_ready = '1' and counter_tlast = 32 then
        next_state <= st_5_split_last;
        else
        input_stream_tready_aux <= '0';
        next_state <= st_5_split_wait;
        end if;
        
        when st_5_split_last =>
        axis_split_switch_tvalid_aux <= '1';
        axis_split_switch_tdata_aux <= input_stream_tdata_ff;
        axis_split_switch_tuser_aux(20 downto 5) <= count_c_size;
        if count_c_size < x"0003" then
        --header_in_tready_aux <= '1';
        next_state <= st_5_split_last_1;
        end if;
        
        when st_5_split_last_1 =>
        axis_split_switch_tvalid_aux <= '1';
        axis_split_switch_tdata_aux <= input_stream_tdata_ff;
        axis_split_switch_tuser_aux(4) <= '1'; -- tlast
        next_state <= wait_here;
        
        when wait_here =>
        input_stream_tready_aux <= '0';
        if count_join_tlast > 15 then
        next_command_i <= x"80000000";
        end if;
        
         when others =>
            next_state <= st1_idle;
            
      end case;      
   end process;

process (axis_split_switch_aclk) 
begin
   if axis_split_switch_aclk='1' and axis_split_switch_aclk'event then
      if axis_split_switch_aresetn='0' then 
         counter_tlast <= (others => '0');
      elsif header_in_tready_aux='1' then
         counter_tlast <= counter_tlast + 1;
      end if;
   end if;
end process; 

--axis_split_switch_tuser_aux
-- 19 downto 4 is the compressed size
-- 3 downto 0 is the tlast

    next_engine_ready <= engine_ready_in(count_split);

    tdest_aux <= conv_std_logic_vector(count_split, 4);

	PROCESS_COUNT_SPLIT_TDEST : process(axis_split_switch_aclk, axis_split_switch_aresetn)
	begin
		if (axis_split_switch_aresetn = '0') then
			count_split <= 0;
		elsif (axis_split_switch_aclk'event and axis_split_switch_aclk = '1') then
			if (count_c_size = x"00000002") and (counter_tlast < 32) then
				if (count_split = C_NO_ENGINE - 1) then
					count_split <= 0;
				else
					count_split <= count_split + 1;
				end if;
			end if;
		end if;
	end process PROCESS_COUNT_SPLIT_TDEST;
	
process (input_stream_aclk) 
begin
   if input_stream_aclk='1' and input_stream_aclk'event then
      if load_counter_c_size_i='1' then 
         count_c_size <= header_in_tdata_ff(15 downto 0);
      elsif axis_split_switch_tvalid_aux='1' and axis_split_switch_tready_aux='1' then
            count_c_size <= count_c_size - 1;
      end if;
   end if;
end process; 

-- load_filesize_i
process (input_stream_aclk)
begin
   if input_stream_aclk'event and input_stream_aclk='1' then  
      if input_stream_aresetn='0' then   
         filesize_reg <= (others => '0');
      elsif load_filesize_i ='1' then
         filesize_reg <= input_stream_tdata_ff;
      end if;
   end if;
end process;

-- load_blocksize_i
process (input_stream_aclk)
begin
   if input_stream_aclk'event and input_stream_aclk='1' then  
      if input_stream_aresetn='0' then   
         blocksize_reg <= (others => '0');
      elsif load_blocksize_i ='1' then
         blocksize_reg <= input_stream_tdata_ff;
      end if;
   end if;
end process;

-- load_totalblocks_i
process (input_stream_aclk)
begin
   if input_stream_aclk'event and input_stream_aclk='1' then  
      if load_totalblocks_i='1' then   
         totalblocks_reg <= input_stream_tdata_ff(30 downto 0) & '0';
      elsif header_out_tvalid_aux ='1' and header_out_tready_aux = '1' then
         totalblocks_reg <= totalblocks_reg - 1;
      end if;
   end if;
end process;

process (input_stream_aclk) 
begin
   if input_stream_aclk='1' and input_stream_aclk'event then
      if input_stream_aresetn='0' then 
         count_join_tlast <= (others => '0');
      elsif axis_join_switch_tlast='1' then
         count_join_tlast <= count_join_tlast + 1;
      end if;
   end if;
end process; 

end arch_imp;
