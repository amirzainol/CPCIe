---------------------------------------------

--  ENTITY       = OUTPUT_BUFFER_32_32     --

--  version      = 1.0                     --

--  last update  = 30/05/01                --

--  author       = Jose Nunez              --

--  Modified:    Vassilios A. Chouliaras 270204

--               Added TSMC013 DPRAM with

--               minor mods to strobe generation

---------------------------------------------





-- FUNCTION

-- This output buffer loads 32 bits of data from the decompression engine and writes 32 bit of data to the output bus

-- 256x32 bit word to handle a block of 1 Kbyte. Then the buffer waits for the all data processed signal before requesting more data.



--  PIN LIST



--  START = activate the buffer

--  WRITE = write data from the engine to the buffer

--  FINISHED = all the data has accessed the buffer. Engine has finished

--  DATA_IN_32  = input data from the 32 bit decompression engine

--  THRESHOLD = data that must be present in the buffer when data starts being output

--  BUS_ACKNOWLEDGE = starting outputting data to the output bus

--  DATA_OUT_32  = output data to the 32 bit wide output bus

--  READY = data ready in the buffer

--  BUS_REQUEST = output requesting bus to start outputting databe processed

--  CLEAR    = asynchronous clear

--  CLK      = master clock





library ieee,dzx;

use ieee.std_logic_1164.all;

use IEEE.std_logic_arith.all;

use dzx.bit_arith.all;

library xil_lib;
use xil_lib.xil_comp.all;
use work.tech_package.all;





entity OUTPUT_BUFFER_32_32 is

port

(

	FORCE_STOP : in bit;

	START_D : in bit;

	START_C : in bit;

	WRITE : in bit;

	FINISHED : in bit;

  WAITN : in bit; -- introduce wait cycles

	DATA_IN_32 : in bit_vector(31 downto 0);

	THRESHOLD : in bit_vector(7 downto 0);

	BUS_ACKNOWLEDGE : in bit;

	CLEAR : in bit ;

	CLK : in bit ;

	FLUSHING : out bit;

	FINISHED_FLUSHING : out bit;

	OVERFLOW_DETECTED : out bit;

	DATA_OUT_32: out bit_vector(31 downto 0);

	READY : out bit;

  OVERFLOW_CONTROL : out bit;

	BUS_REQUEST : out bit

);



end OUTPUT_BUFFER_32_32;





architecture STRUCTURAL of OUTPUT_BUFFER_32_32 is



-- xilinx memory



component DP_RAM_XILINX_512

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

--      WADDR :   in std_logic_vector (7 downto 0);

--      RADDR : in std_logic_vector (7 downto 0)

--	  );



-- end component;







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
--
--      generic (LPM_WIDTH    : positive ;
--
--               LPM_WIDTHAD  : positive;
--
--               LPM_NUMWORDS : positive;
--
--               LPM_INDATA   : string;
--
--               LPM_RDADDRESS_CONTROL : string;
--
--               LPM_WRADDRESS_CONTROL : string;
--
--               LPM_OUTDATA  : string;
--
--              LPM_TYPE     : string;
--
--               LPM_FILE     : string;
--
---------------------------------------------------------------------------------
--
--               LPM_HINT	    : string);
--
--      port (RDCLOCK : in std_logic;
--
--            RDCLKEN : in std_logic;
--
--            RDADDRESS : in std_logic_vector(8 downto 0);
--
--           RDEN : in std_logic;
--
--            DATA : in std_logic_vector(31 downto 0);
--
--           WRADDRESS : in std_logic_vector(8 downto 0);
--
--            WREN : in std_logic;
--
--            WRCLOCK : in std_logic;
--
--            WRCLKEN : in std_logic;
--
--            Q : out std_logic_vector(31 downto 0));
--
--end component;



--attribute noopt: boolean;

--attribute noopt of LPM_RAM_DP: component is true;

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

    

component OUTPUT_BUFFER_CU



port (

		WAITN : in bit;

		FORCE_STOP : in bit;

	  START_D : in bit;

	  START_C : in bit;

	  FINISHED  : in bit;

	  BUS_ACKNOWLEDGE : in bit;

	  CODING_READ_ADDRESS : in bit_vector(8 downto 0);

	  CODING_WRITE_ADDRESS : in bit_vector(8 downto 0);

	  FLUSHING : out bit;

	  FINISHED_FLUSHING : out bit;

	  OVERFLOW_DETECTED : out bit;

	  THRESHOLD : in bit_vector(8 downto 0);

	  CLK : in bit;

	  CLEAR : in bit;

	  ENABLE_WRITE : out bit;

	  ENABLE_READ : out bit;

	  READY : out bit;

      CLEAR_COUNTERS : out bit;

    OVERFLOW_CONTROL : out bit;

	  BUS_REQUEST : out bit

	 );

end component;





component INPUT_COUNTER_9BITS



port (ENABLE : in bit;

	  CLEAR : in bit;

	  CLEAR_COUNTERS : in bit;

	  CLK : in bit;

	  COUNT : out bit_vector(8 downto 0)

     );



end component;





-- 1 bit for the 64-to-32 multiplexor



signal CODING_READ_ADDRESS : bit_vector(8 downto 0);

signal CODING_WRITE_ADDRESS : bit_vector(8 downto 0);

signal ENABLE_WRITE : bit;

signal DATA_OUT_AUX : std_logic_vector(31 downto 0);

signal READ_CLK : bit;

signal WRITE_CLK : bit;

signal WRITE_CLK_ENABLE : bit;

signal READ_CLK_ENABLE : bit;

signal ENABLE_READ_INT : bit;

signal ENABLE_WRITE_INT : bit;

signal BUS_REQUEST_INT : bit;

signal CLEAR_COUNTERS : bit;



signal DATA_SB :std_logic_vector(31 downto 0);

signal RDADDRESS_SB :std_logic_vector(8 downto 0);

signal WRADDRESS_SB :std_logic_vector(8 downto 0);

signal RDEN_SB :std_logic;

signal WREN_SB :std_logic;

signal RDCLOCK_SB :std_logic;

signal RDCLKEN_SB :std_logic;

signal WRCLOCK_SB :std_logic;

signal WRCLKEN_SB :std_logic; 

signal READY_AUX : bit;

signal THRESHOLD_AUX : bit_vector(8 downto 0);



signal LOGIC_0 : std_logic := '0';

signal tsmc_cena_n , tsmc_cenb_n : std_logic;

signal tsmc_wena_n , tsmc_wenb_n : std_logic;

begin



 

CONTROL_UNIT : OUTPUT_BUFFER_CU

port map(

		WAITN => WAITN,

		FORCE_STOP => FORCE_STOP,

	  START_D=> START_D,

	  START_C=> START_C,

	  FINISHED => FINISHED,

	  BUS_ACKNOWLEDGE => BUS_ACKNOWLEDGE,

	  CODING_READ_ADDRESS => CODING_READ_ADDRESS,

	  CODING_WRITE_ADDRESS => CODING_WRITE_ADDRESS,

	  FLUSHING => FLUSHING,

	  FINISHED_FLUSHING =>FINISHED_FLUSHING,

	  OVERFLOW_DETECTED => OVERFLOW_DETECTED,

	  THRESHOLD => THRESHOLD_AUX,

	  CLK => CLK,

	  CLEAR => CLEAR,

	  ENABLE_WRITE => ENABLE_WRITE_INT,

	  ENABLE_READ => ENABLE_READ_INT,

	  READY => READY_AUX,

      CLEAR_COUNTERS => CLEAR_COUNTERS,

    OVERFLOW_CONTROL => OVERFLOW_CONTROL,

	  BUS_REQUEST => BUS_REQUEST_INT

	 );







READ_COUNTER : INPUT_COUNTER_9BITS

port map(ENABLE => READ_CLK_ENABLE,

	  CLEAR => CLEAR,

  	  CLEAR_COUNTERS => CLEAR_COUNTERS,

	  CLK => CLK,

	  COUNT => CODING_READ_ADDRESS

     );





WRITE_COUNTER : INPUT_COUNTER_9BITS

port map(ENABLE => ENABLE_WRITE,

	  CLEAR =>CLEAR,

  	 CLEAR_COUNTERS => CLEAR_COUNTERS,

	  CLK => CLK,

	  COUNT => CODING_WRITE_ADDRESS

     );





-- xilinx memory



RAM_SB: DP_RAM_XILINX_512

port map(

			addra => WRADDRESS_SB,

			clka =>  WRCLOCK_SB,

			addrb => RDADDRESS_SB,

			clkb => RDCLOCK_SB,

			dina => DATA_SB,

			wea(0) => WREN_SB,

			enb =>  RDEN_SB,

			doutb =>  DATA_OUT_AUX);





-- Actel memory



--RAM_SB : MY_MEMORY

-- port map(DO => DATA_OUT_AUX,

--      RCLOCK =>RDCLOCK_SB,

--      WCLOCK =>WRCLOCK_SB,

--      DI => DATA_SB,

--      WRB => WREN_SB,

--      RDB =>RDEN_SB,

--      WADDR => WRADDRESS_SB,

--      RADDR => RDADDRESS_SB

--);



-- Altera memory

-- pragma translate off

--ALT_RAM :
--
--if (not TSMC013) generate
--
--RAM_SB : LPM_RAM_DP
--
-- generic map(LPM_WIDTH => 32,
--
--          LPM_WIDTHAD  => 9,
--
--          LPM_NUMWORDS => 512,
--
--		 LPM_INDATA => "REGISTERED",
--
--	      LPM_OUTDATA  =>  "UNREGISTERED",
--
--		 LPM_RDADDRESS_CONTROL => "REGISTERED",
--
--		 LPM_WRADDRESS_CONTROL => "REGISTERED",
--
--		 LPM_FILE  => "UNUSED",
--
--		 LPM_TYPE  => "LPM_RAM_DP",
--
--		 LPM_HINT => "UNUSED")         
--
--port map(
--
--              DATA=> DATA_SB,
--
--              RDADDRESS=> RDADDRESS_SB,
--
--              WRADDRESS=> WRADDRESS_SB,
--
--              RDEN=> RDEN_SB,
--
--              WREN=> WREN_SB,
--
--              Q=> DATA_OUT_AUX,
--
--              RDCLOCK=> RDCLOCK_SB,
--
--              RDCLKEN=> RDCLKEN_SB,
--
--              WRCLOCK=> WRCLOCK_SB,
--
--              WRCLKEN=> WRCLKEN_SB
--
--);
--
--end generate;

--pragma translate on

-- Port 1 = R

-- Port 2 = R/W

--TSMC013_RAM :
--
--  if (TSMC013) generate
--
--    TMSC_RAM : ra2sh_512W_32B_16MX_offWRMSK_8WRGRAN port map
--
--      (
--
--        clka        =>      RDCLOCK_SB,
--
--        cena        =>      tsmc_cena_n ,
--
--        wena        =>      tsmc_wena_n,
--
--        aa          =>      RDADDRESS_SB,
--
--        da          =>      DATA_SB,
--
--        qa          =>      DATA_OUT_AUX,
--
--        clkb        =>      WRCLOCK_SB,
--
--        cenb        =>      tsmc_cenb_n,
--
--        wenb        =>      tsmc_wenb_n,
--
--        ab          =>      WRADDRESS_SB,
--
--        db          =>      DATA_SB,
--
--        qb          =>      OPEN
--
--      ) ;      
--
--  end generate;



DATA_SB<=To_X01Z(DATA_IN_32)  after 5 ns ;

RDADDRESS_SB<= To_X01Z(CODING_READ_ADDRESS)  after 5 ns ;

WRADDRESS_SB<= To_X01Z(CODING_WRITE_ADDRESS)  after 5 ns ;

RDEN_SB<= To_X01Z(ENABLE_READ_INT)  after 5 ns ;

WREN_SB<= To_X01Z(ENABLE_WRITE)  after 5 ns ;

RDCLOCK_SB<= To_X01Z(READ_CLK);

RDCLKEN_SB<= To_X01Z(READ_CLK_ENABLE)  after 5 ns ;

WRCLOCK_SB<= To_X01Z(WRITE_CLK);

WRCLKEN_SB<= To_X01Z(WRITE_CLK_ENABLE)  after 5 ns ;



tsmc_cenb_n <= not (WRCLKEN_SB);

tsmc_cena_n <= not (RDCLKEN_SB);

tsmc_wena_n <='1';

--    not (RDEN_SB); Always in read-mode; read-enable used to

--    power-up ram

tsmc_wenb_n <= not (WREN_SB);



DATA_OUT_32 <= To_bitvector(DATA_OUT_AUX);

WRITE_CLK <= CLK;

READ_CLK <= CLK;

ENABLE_WRITE <= WRITE and ENABLE_WRITE_INT and FINISHED;

WRITE_CLK_ENABLE <= ENABLE_WRITE_INT;

READ_CLK_ENABLE <= ENABLE_READ_INT and WAITN;

BUS_REQUEST <= BUS_REQUEST_INT;

READY <= READY_AUX or not(WAITN); -- no ready if wait asserted at zero







THRESHOLD_AUX <= '0' & THRESHOLD;











end STRUCTURAL;

