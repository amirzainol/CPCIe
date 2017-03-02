library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity scheduler_cpcie is
	generic(
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Parameters of Axi Slave Bus Interface S_AXIS
		C_S_AXIS_TDATA_WIDTH : integer := 32;

		-- Parameters of Axi Master Bus Interface FORK
		C_FORK_TDATA_WIDTH   : integer := 32;
		C_FORK_START_COUNT   : integer := 32
	);
	port(
		clk                      : in  std_logic;
		rstn                     : in  std_logic;
		s_axis_tready            : out std_logic;
		s_axis_tdata             : in  std_logic_vector(31 downto 0);
		s_axis_tvalid            : in  std_logic;
		s_axis_header_tvalid     : in  std_logic;
		s_axis_header_tready     : out std_logic;
		s_axis_header_tdata      : in  std_logic_vector(31 downto 0);
		m_axis_fork_tvalid       : out std_logic_vector(0 downto 0);
		m_axis_fork_tready       : in  std_logic_vector(0 downto 0);
		m_axis_fork_tdata        : out std_logic_vector(31 downto 0);
		m_axis_fork_tdest        : out std_logic_vector(3 downto 0);
		m_axis_header_tvalid     : out std_logic;
		m_axis_header_tready     : in  std_logic;
		m_axis_header_tdata      : out std_logic_vector(31 downto 0);
		join_suppress            : out std_logic_vector(4 downto 0);
		status_engine_0          : in  std_logic_vector(31 downto 0);
		status_engine_1          : in  std_logic_vector(31 downto 0);
		status_engine_2          : in  std_logic_vector(31 downto 0);
		status_engine_3          : in  std_logic_vector(31 downto 0);
		crc_engine_0             : in  std_logic_vector(31 downto 0);
		crc_engine_1             : in  std_logic_vector(31 downto 0);
		crc_engine_2             : in  std_logic_vector(31 downto 0);
		crc_engine_3             : in  std_logic_vector(31 downto 0);
		command_in               : in  std_logic_vector(31 downto 0);
		filesize_u               : in  std_logic_vector(31 downto 0);
		command_engine_0         : out std_logic_vector(31 downto 0);
		command_engine_1         : out std_logic_vector(31 downto 0);
		command_engine_2         : out std_logic_vector(31 downto 0);
		command_engine_3         : out std_logic_vector(31 downto 0);
		compressed_size_engine_0 : out std_logic_vector(15 downto 0);
		compressed_size_engine_1 : out std_logic_vector(15 downto 0);
		compressed_size_engine_2 : out std_logic_vector(15 downto 0);
		compressed_size_engine_3 : out std_logic_vector(15 downto 0);
		status                   : out std_logic_vector(31 downto 0)
	);
end scheduler_cpcie;

architecture arch_imp of scheduler_cpcie is

	--------------------------------------------------------------------------------

	signal filesize_count        : std_logic_vector(31 downto 0);
	signal filesize_count_finish : std_logic := '0';

	signal chunk_to_comp : std_logic_vector(31 downto 0);

	signal fork_dest_logic_or : std_logic := '0';

	signal s_sched_tdest : std_logic_vector(3 downto 0) := "0001"; --by default
	
	signal sup_dest, sup_dest_next : std_logic_vector(3 downto 0) := "0001"; --by default

	signal sched_tready_c : std_logic := '0';

	signal sched_tvalid      : std_logic                    := '0';
	signal sched_tick        : std_logic                    := '0';
	signal count_tick        : std_logic_vector(31 downto 0);
	signal internal_tick     : std_logic_vector(31 downto 0); --internal tick (to count) for the Blocksize
	signal sched_tick_in     : std_logic                    := '0';
	signal sched_tick_engine : std_logic_vector(1 downto 0) := "01";

	type state_type is (st0_idle,
		                st2_header_filesize,
		                st2_header_blocksize,
		                st2_header_totalchunk,
		                st2_header_compsize_crc,
		                st1_start,
		                st2_tready,
		                st3_tvalid
	);
	signal state_c, next_state_c : state_type;

	--Declare internal signals for all outputs of the state-machine

	signal count_tick_i    : std_logic_vector(31 downto 0);
	signal count_tick_next : std_logic_vector(31 downto 0);

	type state_type_d is (st_d_idle,
		                  st_d_0,
		                  st_d_1,
		                  st_d_2,
		                  st_d_3,
		                  st_d_4,
		                  st_d_4_CRC,
		                  st_d_5
	);
	signal state_d, next_state_d : state_type_d;

	signal s_axis_tvalid_d      : std_logic := '0';
	signal s_axis_tvalid_d_next : std_logic := '0';
	signal s_axis_tdata_d       : std_logic_vector(31 downto 0);
	signal s_axis_tdata_d_next  : std_logic_vector(31 downto 0);
	signal s_sched_tdest_d      : std_logic_vector(3 downto 0) := "0001"; --by default
	signal s_sched_tdest_d_next : std_logic_vector(3 downto 0);
	signal sched_tready_d       : std_logic := '0';
	signal sched_tready_d_next  : std_logic := '0';
	signal count_chunk          : std_logic_vector(15 downto 0);
	signal count_chunk_next     : std_logic_vector(15 downto 0);
	signal s_axis_tvalid_h      : std_logic := '0';

	type state_type_h is (st_count_idle, st_count_1, st_count_2, st_count_3, st_count_4);
	signal state_count, next_state_count : state_type_h;

	signal count_h_size      : std_logic_vector(15 downto 0);
	signal count_h_size_next : std_logic_vector(15 downto 0);

	type state_type_suppress is (st_s_0000,
		                         st_s_chunk_i,
		                         st_s_0001,
		                         st_s_0001_ack,
		                         st_s_0001_ack1,
		                         st_s_0001_rst,
		                         st_s_0010,
		                         st_s_0010_ack,
		                         st_s_0010_ack1,
		                         st_s_0010_rst,
		                         st_s_0100,
		                         st_s_0100_ack,
		                         st_s_0100_ack1,
		                         st_s_0100_rst,
		                         st_s_1000,
		                         st_s_1000_ack,
		                         st_s_1000_ack1,
		                         st_s_1000_rst,
		                         idle
	);
	signal state_suppress, next_state_suppress : state_type_suppress;

	signal chunk_i, chunk_i_next, chunk_temp_cnt, chunk_temp_cnt_next : std_logic_vector(31 downto 0);

	type state_c_size_proc is (st_s_0000,
		                       st_s_0001,
		                       st_s_0001_1,
		                       st_s_0002,
		                       st_s_0002_1,
		                       st_s_0003,
		                       st_s_0003_1,
		                       st_s_0004,
		                       st_s_0004_1
	);
	signal state_comp_size, next_state_comp_size : state_c_size_proc;

	signal c_size_engine_0 : std_logic_vector(15 downto 0);
	signal c_size_engine_1 : std_logic_vector(15 downto 0);
	signal c_size_engine_2 : std_logic_vector(15 downto 0);
	signal c_size_engine_3 : std_logic_vector(15 downto 0);

	signal c_size_engine_0_next : std_logic_vector(15 downto 0);
	signal c_size_engine_1_next : std_logic_vector(15 downto 0);
	signal c_size_engine_2_next : std_logic_vector(15 downto 0);
	signal c_size_engine_3_next : std_logic_vector(15 downto 0);

	signal header_ready : std_logic := '0';
	--other outputs

	signal ff0_eng_0 : std_logic := '0';
	signal ff0_eng_1 : std_logic := '0';
	signal ff0_eng_2 : std_logic := '0';
	signal ff0_eng_3 : std_logic := '0';
	signal ff1_eng_0 : std_logic := '0';
	signal ff1_eng_1 : std_logic := '0';
	signal ff1_eng_2 : std_logic := '0';
	signal ff1_eng_3 : std_logic := '0';
	signal ff2_eng_0 : std_logic := '0';
	signal ff2_eng_1 : std_logic := '0';
	signal ff2_eng_2 : std_logic := '0';
	signal ff2_eng_3 : std_logic := '0';

	signal ff3_eng_0_pulse : std_logic := '0';
	signal ff3_eng_1_pulse : std_logic := '0';
	signal ff3_eng_2_pulse : std_logic := '0';
	signal ff3_eng_3_pulse : std_logic := '0';
	signal ff3_eng_pulse   : std_logic := '0';
	signal ff4_eng_pulse   : std_logic := '0';
	signal ff5_eng_0_pulse : std_logic := '0';
	signal ff5_eng_1_pulse : std_logic := '0';
	signal ff5_eng_2_pulse : std_logic := '0';
	signal ff5_eng_3_pulse : std_logic := '0';

	signal sel_cd : std_logic_vector(1 downto 0); -- 10 = compress, 01 = decompress

	signal crc_engine_0_reg : std_logic_vector(31 downto 0);
	signal crc_engine_1_reg : std_logic_vector(31 downto 0);
	signal crc_engine_2_reg : std_logic_vector(31 downto 0);
	signal crc_engine_3_reg : std_logic_vector(31 downto 0);

	signal comp_size_0_reg : std_logic_vector(31 downto 0);
	signal comp_size_1_reg : std_logic_vector(31 downto 0);
	signal comp_size_2_reg : std_logic_vector(31 downto 0);
	signal comp_size_3_reg : std_logic_vector(31 downto 0);

	signal ff_header : std_logic := '0';

	signal s_axis_tdata_reg        : std_logic_vector(31 downto 0);
	signal s_axis_tvalid_reg       : std_logic := '0';
	signal s_axis_header_tdata_reg : std_logic_vector(31 downto 0);

    signal intr_done : std_logic := '0';
    
    signal i : integer;
    
    signal engine_lock : std_logic_vector(3 downto 0); -- total engines are 4
    
begin

-- Notes on status_engine_* --
-- 0: Finished D
-- 1: Decompressing
-- 2: Flushing D
-- 3: U Data Valid
-- 4: Decoding Overflow
-- 5: CRC Error
-- 6: Bus Req DC
-- 7: Bus Req DU
-- 8: Interrupt Req D
-- 9: FIFO DC Empty
--10: FIFO DC Full
--11: FIFO DU not Empty (M_tvalid)
--12: FIFO DU not Full (S_tready)

    status <= "0000000000000000000000000000000" & intr_done;
    
	sel_cd <= command_in(30 downto 29);

	s_axis_header_tready <= header_ready;
	s_axis_tready        <= sched_tready_c when sel_cd = "10" else sched_tready_d when sel_cd = "01" else '0';
	sched_tvalid         <= s_axis_tvalid;

	sched_tready_c        <= m_axis_fork_tready(0) and fork_dest_logic_or;
	m_axis_fork_tvalid(0) <= s_axis_tvalid when sel_cd = "10" else s_axis_tvalid_d when sel_cd = "01" else '0';
	m_axis_fork_tdata     <= s_axis_tdata when sel_cd = "10" else s_axis_tdata_d when sel_cd = "01" else x"00000000";
	m_axis_fork_tdest     <= s_sched_tdest when sel_cd = "10" else s_sched_tdest_d when sel_cd = "01" else x"0";
	--m_axis_fork_tdest     <= s_sched_tdest_d;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	Create a pulse
	-- Purpose:	Create a pulse
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	ff3_eng_0_pulse <= (not ff2_eng_0) and ff1_eng_0;
	ff3_eng_1_pulse <= (not ff2_eng_1) and ff1_eng_1;
	ff3_eng_2_pulse <= (not ff2_eng_2) and ff1_eng_2;
	ff3_eng_3_pulse <= (not ff2_eng_3) and ff1_eng_3;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	Flip-flop register
	-- Purpose:	Flip-flop register
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	ff0_eng_0 <= not (status_engine_0(8) or status_engine_0(11));
	ff0_eng_1 <= not (status_engine_1(8) or status_engine_1(11));
	ff0_eng_2 <= not (status_engine_2(8) or status_engine_2(11));
	ff0_eng_3 <= not (status_engine_3(8) or status_engine_3(11));

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				ff1_eng_0               <= '0';
				ff2_eng_0               <= '0';
				ff1_eng_1               <= '0';
				ff2_eng_1               <= '0';
				ff1_eng_2               <= '0';
				ff2_eng_2               <= '0';
				ff1_eng_3               <= '0';
				ff2_eng_3               <= '0';
				ff4_eng_pulse           <= '0';
				s_axis_tdata_reg        <= (others => '0');
				s_axis_tvalid_reg       <= '0';
				s_axis_header_tdata_reg <= (others => '0');
			else
				ff1_eng_0               <= ff0_eng_0; -- if status(8) has finished
				ff2_eng_0               <= ff1_eng_0;
				ff1_eng_1               <= ff0_eng_1; -- if status(8) has finished
				ff2_eng_1               <= ff1_eng_1;
				ff1_eng_2               <= ff0_eng_2; -- if status(8) has finished
				ff2_eng_2               <= ff1_eng_2;
				ff1_eng_3               <= ff0_eng_3; -- if status(8) has finished
				ff2_eng_3               <= ff1_eng_3;
				ff4_eng_pulse           <= ff3_eng_pulse;
				s_axis_tdata_reg        <= s_axis_tdata;
				s_axis_tvalid_reg       <= s_axis_tvalid;
				s_axis_header_tdata_reg <= s_axis_header_tdata;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	H_PACKER_PROC
	-- Purpose:	Controller for header packer
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	H_PACKER_PROC : process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				m_axis_header_tvalid <= '0';
			else
				if (sel_cd = "10") then
					m_axis_header_tvalid <= (ff3_eng_pulse or ff4_eng_pulse) or (ff_header);
				elsif (sel_cd = "01") then
					m_axis_header_tvalid <= s_axis_tvalid_h;
				else
					m_axis_header_tvalid <= '0';
				end if;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	Count filesize
	-- Purpose:	Count filesize
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	filesize_count_finish <= '1' when filesize_count < 9 else '0';

	process(clk)
	begin
		if (clk = '1' and clk'event) then
			if (rstn = '0') then
				filesize_count <= (others => '0');
			else
				if (state_c = st0_idle) then
					filesize_count <= filesize_u;
				elsif (m_axis_fork_tready(0) = '1' and s_axis_tvalid = '1') then
					filesize_count <= filesize_count - 4;
				else
					filesize_count <= filesize_count;
				end if;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	FLIP-FLOP Engine
	-- Purpose:	FLIP-FLOP Engine
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	ff3_eng_pulse <= ff3_eng_0_pulse or ff3_eng_1_pulse or ff3_eng_2_pulse or ff3_eng_3_pulse;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				m_axis_header_tdata <= (others => '0');
			else
				if (sel_cd = "10") then
					if (ff3_eng_0_pulse = '1') then
						m_axis_header_tdata <= comp_size_0_reg;
					elsif (ff3_eng_1_pulse = '1') then
						m_axis_header_tdata <= comp_size_1_reg;
					elsif (ff3_eng_2_pulse = '1') then
						m_axis_header_tdata <= comp_size_2_reg;
					elsif (ff3_eng_3_pulse = '1') then
						m_axis_header_tdata <= comp_size_3_reg;
					elsif (ff5_eng_0_pulse = '1') then
						m_axis_header_tdata <= crc_engine_0_reg;
					elsif (ff5_eng_1_pulse = '1') then
						m_axis_header_tdata <= crc_engine_1_reg;
					elsif (ff5_eng_2_pulse = '1') then
						m_axis_header_tdata <= crc_engine_2_reg;
					elsif (ff5_eng_3_pulse = '1') then
						m_axis_header_tdata <= crc_engine_3_reg;
					else
						m_axis_header_tdata <= (others => '0');
					end if;
				elsif (sel_cd = "01") then
					m_axis_header_tdata <= s_axis_tdata_reg;
				elsif (state_c = st2_header_filesize) then
					m_axis_header_tdata <= filesize_count;
				elsif (state_c = st2_header_blocksize) then
					m_axis_header_tdata <= internal_tick;
				elsif (state_c = st2_header_totalchunk) then
					m_axis_header_tdata <= chunk_i;
				else
					m_axis_header_tdata <= (others => '0');
				end if;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				ff5_eng_0_pulse <= '0';
				ff5_eng_1_pulse <= '0';
				ff5_eng_2_pulse <= '0';
				ff5_eng_3_pulse <= '0';
			else
				ff5_eng_0_pulse <= ff3_eng_0_pulse;
				ff5_eng_1_pulse <= ff3_eng_1_pulse;
				ff5_eng_2_pulse <= ff3_eng_2_pulse;
				ff5_eng_3_pulse <= ff3_eng_3_pulse;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	CRC output of each engine
	-- Purpose:	CRC output of each engine
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	process(clk)
	begin
		if (clk'event and clk = '1') then
			comp_size_0_reg  <= x"0000" & status_engine_0(31 downto 16);
			comp_size_1_reg  <= x"0000" & status_engine_1(31 downto 16);
			comp_size_2_reg  <= x"0000" & status_engine_2(31 downto 16);
			comp_size_3_reg  <= x"0000" & status_engine_3(31 downto 16);
			crc_engine_0_reg <= crc_engine_0;
			crc_engine_1_reg <= crc_engine_1;
			crc_engine_2_reg <= crc_engine_2;
			crc_engine_3_reg <= crc_engine_3;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	Creating blocksize for 'internal tick'
	-- Purpose:	Creating blocksize for 'internal tick'
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	process(clk, command_in)
	begin
		if (clk'event and clk = '1') then
			if rstn = '0' then
				internal_tick <= (others => '0');
			elsif command_in(24) = '1' then -- if start engine
				case (command_in(7 downto 0)) is -- blocksize from command
					when "00000001" => internal_tick <= x"00000200"; --   512
						chunk_to_comp                <= "00000000000" & filesize_u(31 downto 11);
					when "00000010" => internal_tick <= x"00000400"; --  1024
						chunk_to_comp                <= "0000000000" & filesize_u(31 downto 10);
					when "00000100" => internal_tick <= x"00000800"; --  2048
						chunk_to_comp                <= "000000000" & filesize_u(31 downto 9);
					when "00001000" => internal_tick <= x"00001000"; --  4096
						chunk_to_comp                <= "00000000" & filesize_u(31 downto 8);
					when "00010000" => internal_tick <= x"00002000"; --  8192
						chunk_to_comp                <= "0000000" & filesize_u(31 downto 7);
					when "00100000" => internal_tick <= x"00004000"; -- 16384
						chunk_to_comp                <= "000000" & filesize_u(31 downto 6);
					when "01000000" => internal_tick <= x"00008000"; -- 32768
						chunk_to_comp                <= "00000" & filesize_u(31 downto 5);
					when "10000000" => internal_tick <= x"00010000"; -- 65536
						chunk_to_comp                <= "0000" & filesize_u(31 downto 4);
					when others => internal_tick     <= x"00000400"; -- by default it is 1 KB of blocksize
						chunk_to_comp                <= filesize_u(31 downto 0);
				end case;
			end if;
		end if;
	end process;

	fork_dest_logic_or <= s_sched_tdest(3) or s_sched_tdest(2) or s_sched_tdest(1) or s_sched_tdest(0);
	--fork_dest_logic_or <= s_sched_tdest_d(3) or s_sched_tdest_d(2) or s_sched_tdest_d(1) or s_sched_tdest_d(0);
	--fork_dest_logic_or <= sup_dest(3) or sup_dest(2) or sup_dest(1) or sup_dest(0);
	
	process(clk, sched_tvalid, sched_tready_c, count_tick, rstn)
	begin
		if (clk = '1' and clk'event) then
			if rstn = '0' then
				count_tick <= "00" & internal_tick(31 downto 2);
			elsif (sched_tready_c = '1') and (sched_tvalid = '1') then
				if (count_tick = 0) then
					count_tick <= "00" & internal_tick(31 downto 2);
				else
					count_tick <= count_tick - 1;
				end if;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if (clk = '1' and clk'event) then
			if rstn = '0' then
				sched_tick_engine <= "01";
			elsif (sched_tick = '1') then
				sched_tick_engine <= sched_tick_engine + 1;
			end if;
		end if;
	end process;

	sched_tick_in <= not (sched_tick_engine(1) or sched_tick_engine(0));

	-- shift register
	process(clk)
	begin
        if (clk = '1' and clk'event) then
            if rstn = '0' then
                s_sched_tdest <= "0001";
            elsif (sched_tick = '1') then
			    s_sched_tdest(0) <= sched_tick_in;
                s_sched_tdest(1) <= s_sched_tdest(0);
                s_sched_tdest(2) <= s_sched_tdest(1);
                s_sched_tdest(3) <= s_sched_tdest(2);
            end if;
        end if;
	end process;
	
--	-- shift register
--	process(sched_tick)
--	begin
--		if (sched_tick = '1') then
--			s_sched_tdest(0) <= sched_tick_in;
--			s_sched_tdest(1) <= s_sched_tdest(0);
--			s_sched_tdest(2) <= s_sched_tdest(1);
--			s_sched_tdest(3) <= s_sched_tdest(2);
--		else
--			s_sched_tdest <= s_sched_tdest;
--		end if;
--	end process;

	COUNT_TICK_PROCESS : process(clk, count_tick_next, count_h_size, sel_cd)
	begin
		if (clk'event and clk = '1') then
			if (count_tick_next = 3 and sel_cd = "10") then
				sched_tick <= '1';
		    elsif (count_h_size = 2 and sel_cd = "01") then
		        sched_tick <= '1';
			else
				sched_tick <= '0';
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	MAIN_FSM_STATE_PROC
	-- Purpose:	Synchronous FSM for main controller
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	--Insert the following in the architecture after the begin keyword
	MAIN_FSM_STATE_PROC : process(clk, next_state_c, count_tick_next, chunk_temp_cnt_next)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				state_c          <= st0_idle;
				count_tick_i   <= "00" & internal_tick(31 downto 2);
				chunk_temp_cnt <= (others => '0');
			else
				state_c          <= next_state_c;
				count_tick_i   <= count_tick_next;
				chunk_temp_cnt <= chunk_temp_cnt_next;
			-- assign other outputs to internal signals
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	MAIN_FSM_LOGIC_PROC
	-- Purpose:	Combinational process that contains all state machine logic and
	--			state transitions for main controller
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	MAIN_FSM_LOGIC_PROC : process(state_c, sel_cd, count_tick_i, sched_tready_c, sched_tvalid, chunk_temp_cnt)
	begin
		--declare default state for next_state_c to avoid latches
		next_state_c          <= state_c;   --default is to stay in current state
		count_tick_next     <= count_tick_i;
		ff_header           <= '0';
		chunk_temp_cnt_next <= chunk_temp_cnt;

		--insert statements to decode next_state_c
		--below is a simple example
		case (state_c) is
			when st0_idle =>
				if (sel_cd = "10") then
					next_state_c <= st2_header_filesize;
				end if;

			when st2_header_filesize =>
				ff_header  <= '1';
				next_state_c <= st2_header_blocksize;

			when st2_header_blocksize =>
				ff_header  <= '1';
				next_state_c <= st2_header_totalchunk;

			when st2_header_totalchunk =>
				ff_header           <= '1';
				chunk_temp_cnt_next <= chunk_i;
				next_state_c          <= st2_header_compsize_crc;

			when st2_header_compsize_crc =>
				ff_header <= '1';
				if (chunk_temp_cnt = 1) then
					next_state_c <= st1_start;
				else
					chunk_temp_cnt_next <= chunk_temp_cnt - 1;
				end if;

			when st1_start =>
				count_tick_next <= "00" & internal_tick(31 downto 2);
				if (sched_tvalid = '1') and (sched_tready_c = '1') then
					next_state_c <= st2_tready;
				end if;

			when st2_tready =>
				if (sched_tvalid = '1') then
					next_state_c <= st3_tvalid;
				end if;

			when st3_tvalid =>
				count_tick_next <= count_tick_i - 1;
				if sched_tvalid = '0' then
					next_state_c <= st1_start;
				end if;
				if count_tick_i = 1 then
					count_tick_next <= "00" & internal_tick(31 downto 2);
				end if;

			when others =>
				next_state_c <= st0_idle;
		end case;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	DECOMP_FSM_STATE_PROC
	-- Purpose:	Synchronous FSM controller for decompression
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	DECOMP_FSM_STATE_PROC : process(clk, next_state_d, s_axis_tvalid_d_next, s_axis_tdata_d_next, s_sched_tdest_d_next, sched_tready_d_next, count_chunk_next)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				state_d         <= st_d_idle;
				s_axis_tvalid_d <= '0';
				s_axis_tdata_d  <= (others => '0');
				s_sched_tdest_d <= (others => '0');
				sched_tready_d  <= '0';
				count_chunk     <= (others => '0');
			else
				state_d         <= next_state_d;
				s_axis_tvalid_d <= s_axis_tvalid_d_next;
				s_axis_tdata_d  <= s_axis_tdata_d_next;
				s_sched_tdest_d <= s_sched_tdest_d_next;
				sched_tready_d  <= sched_tready_d_next;
				count_chunk     <= count_chunk_next;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	DECOMP_FSM_LOGIC_PROC
	-- Purpose:	Combinational process that contains all state machine logic and
	--			state transitions for decompression
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	DECOMP_FSM_LOGIC_PROC : process(state_d, sel_cd, sched_tvalid, count_chunk, s_axis_tdata_reg, s_axis_tvalid_reg, sup_dest)
	begin
		--declare default state for next_state to avoid latches
		next_state_d         <= state_d; --default is to stay in current state
		s_axis_tvalid_d_next <= '0';
		s_axis_tdata_d_next  <= x"00000000";
		s_sched_tdest_d_next <= x"0";
		sched_tready_d_next  <= '0';
		count_chunk_next     <= (others => '0');
		s_axis_tvalid_h      <= '0';

		case (state_d) is
			when st_d_idle =>
				if (sel_cd = "01" and sched_tvalid = '1') then
					sched_tready_d_next <= '1';
					next_state_d        <= st_d_0;
				end if;

			when st_d_0 =>              -- read 1 clock cycle
				sched_tready_d_next <= '1';
				next_state_d        <= st_d_1;

			when st_d_1 =>              -- read filesize
				sched_tready_d_next <= '1';
				next_state_d        <= st_d_2;

			when st_d_2 =>              -- read blocksize
				sched_tready_d_next <= '1';
				next_state_d        <= st_d_3;

			when st_d_3 =>              -- read total chunks
				sched_tready_d_next <= '1';
				count_chunk_next    <= s_axis_tdata_reg(14 downto 0) & '0'; -- multiply by 2 (including CRC)
				next_state_d        <= st_d_4;

			when st_d_4 =>
				sched_tready_d_next <= '1';
				s_axis_tvalid_h     <= '1';
				count_chunk_next    <= count_chunk - 1;
				next_state_d        <= st_d_4_CRC;

			when st_d_4_CRC =>
				sched_tready_d_next <= '1';
				s_axis_tvalid_h     <= '1';
				count_chunk_next    <= count_chunk - 1;
				if (count_chunk = 1) then
					next_state_d <= st_d_5;
				else
					next_state_d <= st_d_4;
				end if;

			when st_d_5 =>
				sched_tready_d_next  <= '1';
				s_axis_tdata_d_next  <= s_axis_tdata_reg;
				s_axis_tvalid_d_next <= s_axis_tvalid_reg;
				--s_sched_tdest_d_next <= s_sched_tdest;
				s_sched_tdest_d_next <= sup_dest;

			when others =>
				next_state_d <= st_d_idle;

		end case;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	H_UNPACKER_FSM_STATE_PROC
	-- Purpose:	Synchronous FSM controller for header unpacker
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	H_UNPACKER_FSM_STATE_PROC : process(clk, next_state_count, count_h_size_next, sup_dest_next)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				state_count  <= st_count_idle;
				count_h_size <= (others => '0');
				sup_dest     <= "0001";
			else
				state_count  <= next_state_count;
				count_h_size <= count_h_size_next;
				sup_dest     <= sup_dest_next;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	H_UNPACKER_FSM_LOGIC_PROC
	-- Purpose:	Combinational process that contains all state machine logic and
	--			state transitions for header unpacker
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	H_UNPACKER_FSM_LOGIC_PROC : process(state_count, s_axis_header_tvalid, sup_dest, count_h_size, s_axis_tvalid_d, m_axis_fork_tready, s_axis_header_tdata_reg)
	begin
		--declare default state for next_state to avoid latches
		next_state_count  <= state_count; --default is to stay in current state
		count_h_size_next <= count_h_size;
		header_ready      <= '0';
		sup_dest_next     <= sup_dest;

		case (state_count) is
			when st_count_idle =>
				if (s_axis_header_tvalid = '1') then
					header_ready     <= '1';
					next_state_count <= st_count_1;
				end if;

			when st_count_1 =>
				count_h_size_next <= s_axis_header_tdata_reg(15 downto 0);
				header_ready      <= '1';
				next_state_count  <= st_count_2;

			when st_count_2 =>
				if (m_axis_fork_tready(0) = '1' and s_axis_tvalid_d = '1') then
					count_h_size_next <= count_h_size - 1;
				end if;
				if (count_h_size = 2) then
			        sup_dest_next(0) <= sched_tick_in;
                    sup_dest_next(1) <= sup_dest(0);
                    sup_dest_next(2) <= sup_dest(1);
                    sup_dest_next(3) <= sup_dest(2);
					count_h_size_next <= count_h_size - 1;
					header_ready      <= '1';
					next_state_count  <= st_count_3;
				end if;

			when st_count_3 =>
				count_h_size_next <= s_axis_header_tdata_reg(15 downto 0);
				header_ready      <= '1';
				next_state_count  <= st_count_4;

			when st_count_4 =>
				count_h_size_next <= count_h_size - 1;
				next_state_count  <= st_count_2;

			when others =>
				next_state_count <= st_count_idle;

		end case;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	JOIN_FSM_STATE_PROC
	-- Purpose:	Synchronous FSM controller for join
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	JOIN_FSM_STATE_PROC : process(clk, next_state_suppress, chunk_i_next)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				state_suppress <= st_s_0000;
				chunk_i        <= x"FFFFFFFF";
			else
				state_suppress <= next_state_suppress;
				chunk_i        <= chunk_i_next;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	JOIN_FSM_LOGIC_PROC
	-- Purpose:	Combinational process that contains all state machine logic and
	--			state transitions for join
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	JOIN_FSM_LOGIC_PROC : process(state_suppress, state_d, command_in, sel_cd, chunk_i, filesize_count_finish, status_engine_0, status_engine_1, status_engine_2, status_engine_3)
	begin
		--declare default state for next_state to avoid latches
		next_state_suppress <= state_suppress; --default is to stay in current state
		join_suppress       <= "11111";
		command_engine_0    <= command_in;
		command_engine_1    <= command_in;
		command_engine_2    <= command_in;
		command_engine_3    <= command_in;
		chunk_i_next        <= chunk_i;
		intr_done           <= '0';

		case (state_suppress) is
			when st_s_0000 =>
				if (sel_cd = "01") then
					next_state_suppress <= st_s_chunk_i;
				elsif (sel_cd = "10") then
					chunk_i_next        <= chunk_to_comp;
					next_state_suppress <= st_s_0001;
				end if;

			when st_s_chunk_i =>
				if (state_d = st_d_3) then
					chunk_i_next        <= s_axis_tdata_reg;
					next_state_suppress <= st_s_0001;
				end if;

			when st_s_0001 =>
				join_suppress <= "11110";
				if (status_engine_0(8) = '0') then -- intr req
					if (chunk_i = 1) then
						next_state_suppress <= idle;
					else
						chunk_i_next        <= chunk_i - 1;
						next_state_suppress <= st_s_0001_ack;
					end if;
				end if;

			when st_s_0001_ack =>
				join_suppress <= "11110";
				command_engine_0    <= x"10000000";
				next_state_suppress <= st_s_0001_ack1;
				
			when st_s_0001_ack1 =>
                join_suppress <= "11110";
				if (status_engine_0(11) = '0') then -- fifo has finished
				    next_state_suppress <= st_s_0001_rst;
                end if;
				
			when st_s_0001_rst =>
			    join_suppress <= "11110";
				command_engine_0    <= x"80000000";
				next_state_suppress <= st_s_0010;

			when st_s_0010 =>
				join_suppress <= "11101";
				if (status_engine_1(8) = '0') then -- intr req
					if (chunk_i = 1) then
						next_state_suppress <= idle;
					else
						chunk_i_next        <= chunk_i - 1;
						next_state_suppress <= st_s_0010_ack;
					end if;
				end if;

			when st_s_0010_ack =>
				join_suppress <= "11101";
				command_engine_1    <= x"10000000";
				next_state_suppress <= st_s_0010_ack1;
				
			when st_s_0010_ack1 =>
                join_suppress <= "11101";
				if (status_engine_1(11) = '0') then -- fifo has finished
				    next_state_suppress <= st_s_0010_rst;
                end if;

			when st_s_0010_rst =>
			    join_suppress <= "11101";
				command_engine_1    <= x"80000000";
				next_state_suppress <= st_s_0100;

			when st_s_0100 =>
				join_suppress <= "11011";
				if (status_engine_2(8) = '0') then -- intr req
					if (chunk_i = 1) then
						next_state_suppress <= idle;
					else
						chunk_i_next        <= chunk_i - 1;
						next_state_suppress <= st_s_0100_ack;
					end if;
				end if;

			when st_s_0100_ack =>
				join_suppress <= "11011";
				command_engine_2    <= x"10000000";
				next_state_suppress <= st_s_0100_ack1;
				
			when st_s_0100_ack1 =>
                join_suppress <= "11011";
				if (status_engine_2(11) = '0') then -- fifo has finished
				    next_state_suppress <= st_s_0100_rst;
                end if;

			when st_s_0100_rst =>
			    join_suppress <= "11011";
				command_engine_2    <= x"80000000";
				next_state_suppress <= st_s_1000;

			when st_s_1000 =>
				join_suppress <= "10111";
				if (status_engine_3(8) = '0') then -- intr req
					if (chunk_i = 1) then
						next_state_suppress <= idle;
					else
						chunk_i_next        <= chunk_i - 1;
						next_state_suppress <= st_s_1000_ack;
					end if;
				end if;

			when st_s_1000_ack =>
				join_suppress <= "10111";
				command_engine_3    <= x"10000000";
				next_state_suppress <= st_s_1000_ack1;
				
			when st_s_1000_ack1 =>
                join_suppress <= "10111";
				if (status_engine_3(11) = '0') then -- fifo has finished
				    next_state_suppress <= st_s_1000_rst;
                end if;

			when st_s_1000_rst =>
			    join_suppress <= "10111";
				command_engine_3    <= x"80000000";
				next_state_suppress <= st_s_0001;

			when idle =>
				if (filesize_count_finish = '1') then
					command_engine_0 <= x"80000000";
					command_engine_1 <= x"80000000";
					command_engine_2 <= x"80000000";
					command_engine_3 <= x"80000000";
					join_suppress    <= "01111";
					intr_done <= '1';
				else
					join_suppress <= "11111";
					intr_done <= '0';
				end if;

			when others =>
				next_state_suppress <= st_s_0000;

		end case;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	CSIZE_FSM_STATE_PROC
	-- Purpose:	Synchronous FSM controller for outputting compressed size
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	compressed_size_engine_0 <= c_size_engine_0;
	compressed_size_engine_1 <= c_size_engine_1;
	compressed_size_engine_2 <= c_size_engine_2;
	compressed_size_engine_3 <= c_size_engine_3;

	CSIZE_FSM_STATE_PROC : process(clk, next_state_comp_size, c_size_engine_0_next, c_size_engine_1_next, c_size_engine_2_next, c_size_engine_3_next)
	begin
		if (clk'event and clk = '1') then
			if (rstn = '0') then
				state_comp_size <= st_s_0000;
				c_size_engine_0 <= x"0000";
				c_size_engine_1 <= x"0000";
				c_size_engine_2 <= x"0000";
				c_size_engine_3 <= x"0000";
			else
				state_comp_size <= next_state_comp_size;
				c_size_engine_0 <= c_size_engine_0_next;
				c_size_engine_1 <= c_size_engine_1_next;
				c_size_engine_2 <= c_size_engine_2_next;
				c_size_engine_3 <= c_size_engine_3_next;
			end if;
		end if;
	end process;

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Process:	CSIZE_FSM_LOGIC_PROC
	-- Purpose:	Combinational process that contains all state machine logic and
	--			state transitions for outputting compressed size
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	CSIZE_FSM_LOGIC_PROC : process(state_comp_size, sel_cd, header_ready, s_axis_header_tdata_reg)
	begin
		--declare default state for next_state to avoid latches
		next_state_comp_size <= state_comp_size; --default is to stay in current state
		c_size_engine_0_next <= c_size_engine_0;
		c_size_engine_1_next <= c_size_engine_1;
		c_size_engine_2_next <= c_size_engine_2;
		c_size_engine_3_next <= c_size_engine_3;

		case (state_comp_size) is
			when st_s_0000 =>
				if (sel_cd = "01") then
					next_state_comp_size <= st_s_0001;
				end if;

			when st_s_0001 =>
				if (header_ready = '1') then
					next_state_comp_size <= st_s_0001_1;
				end if;

			when st_s_0001_1 =>
				c_size_engine_0_next <= s_axis_header_tdata_reg(15 downto 0);
				next_state_comp_size <= st_s_0002;

			when st_s_0002 =>
				if (header_ready = '1') then
					next_state_comp_size <= st_s_0002_1;
				end if;

			when st_s_0002_1 =>
				c_size_engine_1_next <= s_axis_header_tdata_reg(15 downto 0);
				next_state_comp_size <= st_s_0003;

			when st_s_0003 =>
				if (header_ready = '1') then
					next_state_comp_size <= st_s_0003_1;
				end if;

			when st_s_0003_1 =>
				c_size_engine_2_next <= s_axis_header_tdata_reg(15 downto 0);
				next_state_comp_size <= st_s_0004;

			when st_s_0004 =>
				if (header_ready = '1') then
					next_state_comp_size <= st_s_0004_1;
				end if;

			when st_s_0004_1 =>
				c_size_engine_3_next <= s_axis_header_tdata_reg(15 downto 0);
				next_state_comp_size <= st_s_0001;

			when others =>
				next_state_comp_size <= st_s_0000;

		end case;
	end process;

end arch_imp;