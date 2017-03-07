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

-- e_mail : j.l.nunez-yanez@byacom.co.uk

---------------------------------------------
--  ENTITY       = DECODING_BUFFER_32_64   --
--  version      = 1.0                     --
--  last update  = 16/06/00                --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- Adapter that changes the 32 bit parallel interface to a 64 bit parallel for uncompressing

--  PIN LIST

--  START = activate the buffer
--  FINISHED = the block has been process. empty buffer
--  OVERFLOW = 64 bit of compressed data available.
--  DATA_IN_64  = input data from the 64 bit out register in X-MatchPRO
--  THRESHOLD_LEVEL = input treshold to start outputting data. Latency control.
--  BUS_ACKNOWLEDGE = The 32 bit wide output bus is available.
--  DATA_OUT_32  = output data to the 32 bit wide output bus
--  OVERFLOW_DETECTED = output to the control unit buffer overflow. Stop inputting data
--  UNDERFLOW_DETECTED = output to the control unit buffer overflow. Stop outputting data. The bus is free.
--  BUS_REQUEST = output requesting bus to output compressed data
--  CLEAR    = asynchronous clear
--  CLK      = master clock


library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library xil_lib;
use xil_lib.xil_comp.all;
use work.tech_package.all;


entity DECODING_BUFFER_32_64_2 is
port
(
  FORCE_STOP : in std_logic;
	START_D : in std_logic;
	START_C : in std_logic;
	FINISHED_D : in std_logic;
	FINISHED_C : in std_logic;
	UNDERFLOW : in std_logic;
	DATA_IN_32 : in std_logic_vector(31 downto 0);
	THRESHOLD_LEVEL : in std_logic_vector(9 downto 0);
	BUS_ACKNOWLEDGE : in std_logic;
	C_DATA_VALID : in std_logic;
   WAITN : in std_logic;
	CLEAR : in std_logic ;
	CLK : in std_logic ;
	DATA_OUT_64: out std_logic_vector(63 downto 0);
	UNDERFLOW_DETECTED : out std_logic;
	START_ENGINE : out std_logic; -- to start the decompression engine
	FINISH : out std_logic;
  OVERFLOW_CONTROL : out std_logic;
	BUS_REQUEST : out std_logic
);


end DECODING_BUFFER_32_64_2;


architecture STRUCTURAL of DECODING_BUFFER_32_64_2 is

-- xilinx memory

component DP_RAM_512_blk_mem_gen_0_0
	port (
	addra: IN std_logic_VECTOR(8 downto 0);
	clka: IN std_logic;
	addrb: IN std_logic_VECTOR(8 downto 0);
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(31 downto 0);
	wea: IN std_logic_vector (0 downto 0);
	enb: IN std_logic;
	doutb: OUT std_logic_VECTOR(31 downto 0));
end component;

-- Synplicity black box declaration
--attribute black_box : boolean;
--attribute black_box of DP_RAM_XILINX: component is true;


-- Actel memory

-- component MY_MEMORY

--   port(DO : out std_logic_vector (31 downto 0);
--      RCLOCK : in std_logic;
--      WCLOCK : in std_logic;
--      DI : in std_logic_vector (31 downto 0);
--      WRB : in std_logic;
--      RDB : in std_logic;
--      WADDR : in std_logic_vector (7 downto 0);
--      RADDR : in std_logic_vector (7 downto 0));

--end component;


--component syn_dpram_256x32_rawr
--port (
--              Data : in std_logic_vector(31 downto 0);
--              RdAddress : in std_logic_vector(7 downto 0);
--              WrAddress : in std_logic_vector(7 downto 0);
--              RdEn : in std_logic;
--              WrEn : in std_logic;
--              Q : out std_logic_vector(31 downto 0);
--              RdClock : in std_logic;
--              RdClken : in std_logic;
--              WrClock : in std_logic;
--              WrClken : in std_logic
--           );
--end component;

  

--component LPM_RAM_DP
--      generic (LPM_WIDTH    : positive ;
--               LPM_WIDTHAD  : positive;
--               LPM_NUMWORDS : positive;
--               LPM_INDATA   : string;
--               LPM_RDADDRESS_CONTROL : string;
--               LPM_WRADDRESS_CONTROL : string;
--               LPM_OUTDATA  : string;
--               LPM_TYPE     : string;
--               LPM_FILE     : string;
--	       LPM_HINT	    : string);
--      port (RDCLOCK : in std_logic;
--            RDCLKEN : in std_logic;
--            RDADDRESS : in std_logic_vector(8 downto 0);
--            RDEN : in std_logic;
--            DATA : in std_logic_vector(31 downto 0);
--            WRADDRESS : in std_logic_vector(8 downto 0);
--            WREN : in std_logic;
--            WRCLOCK : in std_logic;
--            WRCLKEN : in std_logic;
--            Q : out std_logic_vector(31 downto 0));
-- end component;


-- TSMC DPRAM

  component ra2sh_512W_32B_16MX_offWRMSK_8WRGRAN 

  port ( 
	CLKA: in std_logic;
	CENA: in std_logic;
	WENA: in std_logic;
	AA: in std_logic_vector(8 downto 0);
	DA: in std_logic_vector(31 downto 0);
	QA: out std_logic_vector(31 downto 0);
	CLKB: in std_logic;
	CENB: in std_logic;
	WENB: in std_logic;
	AB: in std_logic_vector(8 downto 0);
	DB: in std_logic_vector(31 downto 0);
	QB: out std_logic_vector(31 downto 0)
   );

end component;

--attribute noopt: boolean;
--attribute noopt of LPM_RAM_DP: component is true;
  
component DECODING_BUFFER_CU_2

port (
    FORCE_STOP : in std_logic;
	  START_D : in std_logic;
	  START_C : in std_logic;
	  FINISHED_D : in std_logic;
	  FINISHED_C : in std_logic;
	  UNDERFLOW : in std_logic;
	  BUS_ACKNOWLEDGE : in std_logic;
		WAITN : in std_logic;
	  C_DATA_VALID : in std_logic;
	  THRESHOLD_LEVEL : in std_logic_vector(9 downto 0);
	  DECODING_READ_ADDRESS : in std_logic_vector(9 downto 0);
	  DECODING_WRITE_ADDRESS : in std_logic_vector(9 downto 0);
	  CLK : in std_logic;
	  CLEAR : in std_logic;
	  BUS_REQUEST : out std_logic;
	  DECODING_UNDERFLOW : out std_logic;
	  ENABLE_WRITE : out std_logic;
	  FINISH: out std_logic;
      CLEAR_COUNTERS : out std_logic;
    OVERFLOW_CONTROL : out std_logic;
	  ENABLE_READ : out std_logic
	 );
end component;



component BUFFER_COUNTER_READ_9BITS

port (ENABLE : in std_logic;
	  CLEAR : in std_logic;
	  CLEAR_COUNTERS : in std_logic;
	  CLK : in std_logic;
	  COUNT : out std_logic_vector(9 downto 0)
     );

end component;

component BUFFER_COUNTER_WRITE_9BITS

port (ENABLE : in std_logic;
		SHORT : in std_logic; -- only write 32 bits
	  CLEAR : in std_logic;
	  CLEAR_COUNTERS : in std_logic;
	  CLK : in std_logic;
	  COUNT : out std_logic_vector(9 downto 0)
     );
end component;




-- 1 bit for the 64-to-32 multiplexor

signal DECODING_READ_ADDRESS : std_logic_vector(9 downto 0);
signal DECODING_WRITE_ADDRESS : std_logic_vector(9 downto 0);
signal DECODING_UNDERFLOW : std_logic;
signal ENABLE_READ : std_logic;
signal DATA_OUT_AUX : std_logic_vector(63 downto 0);
signal READ_CLK : std_logic;
signal WRITE_CLK : std_logic;
signal WRITE_CLK_ENABLE : std_logic;
signal READ_CLK_ENABLE : std_logic;
signal ENABLE_READ_INT : std_logic;
signal ENABLE_WRITE_INT : std_logic;
signal ENABLE_WRITE_MSB : std_logic;
signal ENABLE_WRITE_LSB : std_logic;
signal ENABLE_WRITE : std_logic;
signal CLEAR_COUNTERS : std_logic;

signal DATA_MSB : std_logic_vector(31 downto 0);
signal RDADDRESS_MSB : std_logic_vector(8 downto 0);
signal WRADDRESS_MSB : std_logic_vector(8 downto 0);
signal RDEN_MSB : std_logic;
signal WREN_MSB : std_logic;
signal RDCLOCK_MSB : std_logic;
signal RDCLKEN_MSB : std_logic;
signal WRCLOCK_MSB : std_logic;
signal WRCLKEN_MSB : std_logic;

signal DATA_LSB : std_logic_vector(31 downto 0);
signal RDADDRESS_LSB : std_logic_vector(8 downto 0);
signal WRADDRESS_LSB : std_logic_vector(8 downto 0);
signal RDEN_LSB : std_logic;
signal WREN_LSB : std_logic;
signal RDCLOCK_LSB : std_logic;
signal RDCLKEN_LSB : std_logic;
signal WRCLOCK_LSB : std_logic;
signal WRCLKEN_LSB : std_logic;

signal SHORT : std_logic;



signal tsmc_lsb_cena_n , tsmc_lsb_cenb_n : std_logic;
signal tsmc_lsb_wena_n , tsmc_lsb_wenb_n : std_logic;
signal tsmc_msb_cena_n , tsmc_msb_cenb_n : std_logic;
signal tsmc_msb_wena_n , tsmc_msb_wenb_n : std_logic;





begin




CONTROL_UNIT : DECODING_BUFFER_CU_2
port map(
    FORCE_STOP => FORCE_STOP,
	  START_D => START_D,
	  START_C => START_C,
	  FINISHED_D => FINISHED_D,
	  FINISHED_C => FINISHED_C,
	  UNDERFLOW => UNDERFLOW, -- the engine is requesting data
	  BUS_ACKNOWLEDGE => BUS_ACKNOWLEDGE,
		WAITN => WAITN,
	  C_DATA_VALID => C_DATA_VALID,
	  THRESHOLD_LEVEL => THRESHOLD_LEVEL,
	  DECODING_READ_ADDRESS => DECODING_READ_ADDRESS,
	  DECODING_WRITE_ADDRESS => DECODING_WRITE_ADDRESS,
	  CLK => CLK,
	  CLEAR => CLEAR,
	  DECODING_UNDERFLOW=> DECODING_UNDERFLOW,
	  ENABLE_WRITE => ENABLE_WRITE_INT,
	  FINISH => FINISH,
	  ENABLE_READ => ENABLE_READ_INT,
	  CLEAR_COUNTERS => CLEAR_COUNTERS,
    OVERFLOW_CONTROL => OVERFLOW_CONTROL,
	  BUS_REQUEST => BUS_REQUEST
	 );

UNDERFLOW_DETECTED <= DECODING_UNDERFLOW;

READ_COUNTER : BUFFER_COUNTER_WRITE_9BITS
port map(ENABLE => ENABLE_READ,
		SHORT => SHORT,
		CLEAR => CLEAR,
	  CLEAR_COUNTERS => CLEAR_COUNTERS,
	  CLK => CLK,
	  COUNT => DECODING_READ_ADDRESS
     );

SHORT <= '1';


WRITE_COUNTER : BUFFER_COUNTER_READ_9BITS
port map(ENABLE => ENABLE_WRITE,
	  CLEAR =>CLEAR,
      CLEAR_COUNTERS => CLEAR_COUNTERS,
	  CLK => CLK,
	  COUNT => DECODING_WRITE_ADDRESS
     );

-- xilinx memory

RAM_MSB : DP_RAM_512_blk_mem_gen_0_0
		port map (
			addra => WRADDRESS_MSB,
			clka =>  WRCLOCK_MSB,
			addrb => RDADDRESS_MSB,
			clkb => RDCLOCK_MSB,
			dina => DATA_MSB,
			wea (0) => WREN_MSB,
			enb =>  RDEN_MSB,
			doutb =>  DATA_OUT_AUX(63 downto 32));


-- Actel memory

--RAM_MSB : MY_MEMORY
--port map(DO => DATA_OUT_AUX(63 downto 32),
--      RCLOCK =>RDCLOCK_MSB,
--      WCLOCK =>WRCLOCK_MSB,
--      DI => DATA_MSB,
--      WRB => WREN_MSB,
--      RDB =>RDEN_MSB,
--      WADDR => WRADDRESS_MSB,
--      RADDR => RDADDRESS_MSB
--);


-- Altera memory

-- Altera memory


--ALT_RAM_MSB :
--
--if (not TSMC013) generate
--
--
--RAM_MSB : LPM_RAM_DP
--generic map(LPM_WIDTH => 32,
--         LPM_WIDTHAD  => 9,
--         LPM_NUMWORDS => 512,
--		 LPM_INDATA => "REGISTERED",
--         LPM_OUTDATA  =>  "UNREGISTERED",
--		 LPM_RDADDRESS_CONTROL => "REGISTERED",
--		 LPM_WRADDRESS_CONTROL => "REGISTERED",
--		 LPM_FILE  => "UNUSED",
--		 LPM_TYPE  => "LPM_RAM_DP",
--		 LPM_HINT => "UNUSED")         
--port map(
--             DATA=>DATA_MSB,
--             RDADDRESS=>RDADDRESS_MSB ,
--             WRADDRESS=>WRADDRESS_MSB ,
--             RDEN=>RDEN_MSB ,
--             WREN=>WREN_MSB ,
--             Q=> DATA_OUT_AUX(63 downto 32),
--             RDCLOCK=> RDCLOCK_MSB,
--             RDCLKEN=> RDCLKEN_MSB ,
--             WRCLOCK=> WRCLOCK_MSB,
--             WRCLKEN=> WRCLKEN_MSB
--);
--end generate;

--TSMC013_RAM_MSB :
--
--  if (TSMC013) generate
--    TMSC_RAM : ra2sh_512W_32B_16MX_offWRMSK_8WRGRAN port map
--      (
--        clka        =>      RDCLOCK_MSB,
--        cena        =>      tsmc_msb_cena_n ,
--        wena        =>      tsmc_msb_wena_n,
--        aa          =>      RDADDRESS_MSB,
--        da          =>      DATA_MSB,
--        qa          =>      DATA_OUT_AUX(63 downto 32),
--        clkb        =>      WRCLOCK_MSB,
--        cenb        =>      tsmc_msb_cenb_n,
--        wenb        =>      tsmc_msb_wenb_n,
--        ab          =>      WRADDRESS_MSB,
--        db          =>      DATA_MSB,
--        qb          =>      OPEN
--      ) ;      
--
--  end generate;


tsmc_msb_cenb_n <= not (WRCLKEN_MSB);
tsmc_msb_cena_n <= not (RDCLKEN_MSB);
tsmc_msb_wena_n <='1';

--    not (RDEN_SB); Always in read-mode; read-enable used to

--    power-up ram

tsmc_msb_wenb_n <= not (WREN_MSB);


DATA_MSB<=To_X01Z(DATA_IN_32) after 5 ns;
RDADDRESS_MSB<= To_X01Z(DECODING_READ_ADDRESS(9 downto 1)) after 5 ns;
WRADDRESS_MSB<= To_X01Z(DECODING_WRITE_ADDRESS(9 downto 1)) after 5 ns;
RDEN_MSB<= To_X01Z(ENABLE_READ) after 5 ns;
WREN_MSB<= To_X01Z(ENABLE_WRITE_MSB) after 5 ns;
RDCLOCK_MSB<= To_X01Z(READ_CLK);
RDCLKEN_MSB<= To_X01Z(READ_CLK_ENABLE) after 5 ns;
WRCLOCK_MSB<= To_X01Z(WRITE_CLK);
WRCLKEN_MSB<= To_X01Z(WRITE_CLK_ENABLE) after 5 ns;


--RAM_MSB : syn_dpram_256x32_rawr
--port map(
--              DATA=>To_X01Z(DATA_IN_32),
--              RDADDRESS=> To_X01Z(DECODING_READ_ADDRESS),
--              WRADDRESS=> To_X01Z(DECODING_WRITE_ADDRESS),
--              RDEN=> To_X01Z(ENABLE_READ),
--              WREN=> To_X01Z(ENABLE_WRITE_MSB),
--              Q=> DATA_OUT_AUX(63 downto 32),
--              RDCLOCK=> To_X01Z(READ_CLK),
--              RDCLKEN=> To_X01Z(READ_CLK_ENABLE),
--              WRCLOCK=> To_X01Z(WRITE_CLK),
--              WRCLKEN=> To_X01Z(WRITE_CLK_ENABLE)
--);


RAM_LSB : DP_RAM_512_blk_mem_gen_0_0
		port map (
			addra => WRADDRESS_LSB,
			clka =>  WRCLOCK_LSB,
			addrb => RDADDRESS_LSB,
			clkb => RDCLOCK_LSB,
			dina => DATA_LSB,
			wea (0)=> WREN_LSB,
			enb =>  RDEN_LSB,
			doutb =>  DATA_OUT_AUX(31 downto 0));



-- Actel memory

--RAM_LSB : MY_MEMORY
--port map(DO => DATA_OUT_AUX(31 downto 0),
--      RCLOCK =>RDCLOCK_LSB,
--      WCLOCK =>WRCLOCK_LSB,
--      DI => DATA_LSB,
--      WRB => WREN_LSB,
--      RDB =>RDEN_LSB,
--      WADDR => WRADDRESS_LSB,
--      RADDR => RDADDRESS_LSB
--);

-- Altera memory

--ALT_RAM_LSB :
--
--if (not TSMC013) generate
--
--RAM_LSB : LPM_RAM_DP
--generic map(LPM_WIDTH => 32,
--         LPM_WIDTHAD  => 9,
--         LPM_NUMWORDS => 512,
--		 LPM_INDATA => "REGISTERED",
--         LPM_OUTDATA  =>  "UNREGISTERED",
--		 LPM_RDADDRESS_CONTROL => "REGISTERED",
--		 LPM_WRADDRESS_CONTROL => "REGISTERED",
--		 LPM_FILE  => "UNUSED",
--		 LPM_TYPE  => "LPM_RAM_DP",
--		 LPM_HINT => "UNUSED")    
-- port map(
--             DATA=> DATA_LSB,
--             RDADDRESS=> RDADDRESS_LSB,
--             WRADDRESS=> WRADDRESS_LSB,
--             RDEN=> RDEN_LSB,
--             WREN=> WREN_LSB,
--             Q=> DATA_OUT_AUX(31 downto 0),
--             RDCLOCK=> RDCLOCK_LSB,
--             RDCLKEN=> RDCLKEN_LSB,
--             WRCLOCK=> WRCLOCK_LSB,
--             WRCLKEN=> WRCLKEN_LSB
--);
--
--end generate;

-- Port 1 = R

-- Port 2 = R/W

--TSMC013_RAM_LSB :
--
--  if (TSMC013) generate
--  TMSC_RAM : ra2sh_512W_32B_16MX_offWRMSK_8WRGRAN port map
--      (
--        clka        =>      RDCLOCK_LSB,
--        cena        =>      tsmc_lsb_cena_n ,
--        wena        =>      tsmc_lsb_wena_n,
--        aa          =>      RDADDRESS_LSB,
--        da          =>      DATA_LSB,
--        qa          =>      DATA_OUT_AUX(31 downto 0),
--        clkb        =>      WRCLOCK_LSB,
--        cenb        =>      tsmc_lsb_cenb_n,
--        wenb        =>      tsmc_lsb_wenb_n,
--        ab          =>      WRADDRESS_LSB,
--        db          =>      DATA_LSB,
--        qb          =>      OPEN
--      ) ;      
--end generate;


tsmc_lsb_cenb_n <= not (WRCLKEN_LSB);
tsmc_lsb_cena_n <= not (RDCLKEN_LSB);
tsmc_lsb_wena_n <='1';

--    not (RDEN_SB); Always in read-mode; read-enable used to

--    power-up ram

tsmc_lsb_wenb_n <= not (WREN_LSB);


DATA_LSB<=To_X01Z(DATA_IN_32) after 5 ns;
RDADDRESS_LSB<= To_X01Z(DECODING_READ_ADDRESS(9 downto 1)) after 5 ns;
WRADDRESS_LSB<= To_X01Z(DECODING_WRITE_ADDRESS(9 downto 1)) after 5 ns;
RDEN_LSB<= To_X01Z(ENABLE_READ) after 5 ns;
WREN_LSB<= To_X01Z(ENABLE_WRITE_LSB) after 5 ns;
RDCLOCK_LSB<= To_X01Z(READ_CLK);
RDCLKEN_LSB<= To_X01Z(READ_CLK_ENABLE) after 5 ns;
WRCLOCK_LSB<= To_X01Z(WRITE_CLK);
WRCLKEN_LSB<= To_X01Z(WRITE_CLK_ENABLE) after 5 ns;

--RAM_LSB : syn_dpram_256x32_rawr
--port map(
--              DATA=>To_X01Z(DATA_IN_32),
--              RDADDRESS=> To_X01Z(DECODING_READ_ADDRESS),
--              WRADDRESS=> To_X01Z(DECODING_WRITE_ADDRESS),
--              RDEN=> To_X01Z(ENABLE_READ),
--              WREN=> To_X01Z(ENABLE_WRITE_LSB),
--              Q=> DATA_OUT_AUX(31 downto 0),
--              RDCLOCK=> To_X01Z(READ_CLK),
--              RDCLKEN=> To_X01Z(READ_CLK_ENABLE),
--              WRCLOCK=> To_X01Z(WRITE_CLK),
--             WRCLKEN=> To_X01Z(WRITE_CLK_ENABLE)
--);


DATA_OUT_64 <= DATA_OUT_AUX(63 downto 32) & DATA_OUT_AUX(31 downto 0);
WRITE_CLK <= CLK;
READ_CLK <= CLK;
ENABLE_WRITE_MSB <= ENABLE_WRITE_INT and not(DECODING_WRITE_ADDRESS(0)) and WAITN; -- if wait active do not write
ENABLE_WRITE_LSB <= ENABLE_WRITE_INT and DECODING_WRITE_ADDRESS(0) and WAITN;
ENABLE_WRITE<= ENABLE_WRITE_INT and WAITN;
ENABLE_READ <= ENABLE_READ_INT and not(UNDERFLOW);
WRITE_CLK_ENABLE <= ENABLE_WRITE_INT;
READ_CLK_ENABLE <= ENABLE_READ;
START_ENGINE <= not(ENABLE_READ_INT);


end STRUCTURAL;
