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

--  ENTITY       = CODING_BUFFER_64_32     --

--  version      = 1.0                     --

--  last update  = 30/05/00                --

--  author       = Jose Nunez              --

--  modified:      Vassilios A. Chouliaras

---------------------------------------------





-- FUNCTION

-- Apapter that changes the 64 bit parallel interface to a 32 bit parallel

-- 256x64 bit word to handle block sizes up to 64Kbytes without stopping the input due to overflow.



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





library ieee,dzx;

use ieee.std_logic_1164.all;

use IEEE.std_logic_arith.all;

use dzx.bit_arith.all;

library xil_lib;
use xil_lib.xil_comp.all;

use work.tech_package.all;





entity CODING_BUFFER_64_32 is

port

(

  FORCE_STOP : in bit;

	START : in bit;

	FINISHED : in bit;

	OVERFLOW : in bit;

	SHORT : in bit;

   WAITN : in bit;

	DATA_IN_64 : in bit_vector(63 downto 0);

	THRESHOLD_LEVEL : in bit_vector(8 downto 0);

	BUS_ACKNOWLEDGE : in bit;

	CLEAR : in bit ;

	CLK : in bit ;

	DATA_OUT_32: out std_logic_vector(31 downto 0);

	ENABLE_READ : out bit;

	FLUSHING : out bit;

	OVERFLOW_DETECTED : out bit;

	UNDERFLOW_DETECTED : out bit;

	FINISH : out bit;

	DATA_VALID : out bit; -- data in the compressed bus is valid

	BUS_REQUEST : out bit

);





end CODING_BUFFER_64_32;





architecture STRUCTURAL of CODING_BUFFER_64_32 is



-- xilinx memory



component DP_RAM_XILINX_256

	port (

	addra: IN std_logic_VECTOR(7 downto 0);

	clka: IN std_logic;

	addrb: IN std_logic_VECTOR(7 downto 0);

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
--
--      generic (LPM_WIDTH    : positive;
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
--               LPM_TYPE     : string;
--
--               LPM_FILE     : string;
--
--	       LPM_HINT	    : string);
--
--      port (RDCLOCK : in std_logic;
--
--            RDCLKEN : in std_logic;
--
--            RDADDRESS : in std_logic_vector(7 downto 0);
--
--            RDEN : in std_logic;
--
--            DATA : in std_logic_vector(31 downto 0);
--
--            WRADDRESS : in std_logic_vector(7 downto 0);
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

  component ra2sh_256W_32B_8MX_offWRMSK_8WRGRAN 

 

  port ( 

	CLKA: in std_logic;

	CENA: in std_logic;

	WENA: in std_logic;

	AA: in std_logic_vector(7 downto 0);

	DA: in std_logic_vector(31 downto 0);

	QA: out std_logic_vector(31 downto 0);

	CLKB: in std_logic;

	CENB: in std_logic;

	WENB: in std_logic;

	AB: in std_logic_vector(7 downto 0);

	DB: in std_logic_vector(31 downto 0);

	QB: out std_logic_vector(31 downto 0)

    );

    end component;

    

component CODING_BUFFER_CU



port (

    WAITN   : in bit;

    FORCE_STOP: in bit;

	  START : in bit;

	  FINISHED : in bit;

	  BUS_ACKNOWLEDGE : in bit;

	  THRESHOLD_LEVEL : in bit_vector(8 downto 0);

	  CODING_READ_ADDRESS : in bit_vector(8 downto 0);

	  CODING_WRITE_ADDRESS : in bit_vector(8 downto 0);

	  CLK : in bit;

	  CLEAR : in bit;

	  BUS_REQUEST : out bit;

	  FLUSHING : out bit;

	  FINISH : out bit;

        CLEAR_COUNTERS : out bit;

	  CODING_OVERFLOW : out bit;

	  CODING_UNDERFLOW : out bit;

	  ENABLE_WRITE : out bit;

	  ENABLE_READ : out bit

	 );

end component;





component BUFFER_COUNTER_READ 



port (

     ENABLE : in bit;

	  CLEAR : in bit;

	  CLEAR_COUNTERS : in bit;

	  CLK : in bit;

	  COUNT : out bit_vector(8 downto 0)

     );



end component;



component BUFFER_COUNTER_WRITE



port (ENABLE : in bit;

    	SHORT : in bit; -- only write 32 bits

	  CLEAR : in bit;

	  CLEAR_COUNTERS : in bit;

	  CLK : in bit;

	  COUNT : out bit_vector(8 downto 0)

     );



end component;





-- 1 bit for the 64-to-32 multiplexor



signal CODING_READ_ADDRESS : bit_vector(8 downto 0);

signal CODING_WRITE_ADDRESS : bit_vector(8 downto 0);

signal CODING_OVERFLOW : bit;

signal CODING_UNDERFLOW : bit;

signal ENABLE_WRITE : bit;

signal DATA_OUT_AUX : std_logic_vector(63 downto 0);

signal READ_CLK : bit;

signal WRITE_CLK : bit;

signal WRITE_CLK_ENABLE : bit;

signal READ_CLK_ENABLE : bit;

signal ENABLE_READ_INT : bit;

signal ENABLE_WRITE_INT : bit;

signal BUS_REQUEST_INT : bit;

signal CLEAR_COUNTERS : bit;



signal DATA_MSB :std_logic_vector(31 downto 0);

signal RDADDRESS_MSB :std_logic_vector(7 downto 0);

signal WRADDRESS_MSB :std_logic_vector(7 downto 0);

signal RDEN_MSB :std_logic;

signal WREN_MSB :std_logic;

signal RDCLOCK_MSB :std_logic;

signal RDCLKEN_MSB :std_logic;

signal WRCLOCK_MSB :std_logic;

signal WRCLKEN_MSB :std_logic; 



signal DATA_LSB :std_logic_vector(31 downto 0);

signal RDADDRESS_LSB :std_logic_vector(7 downto 0);

signal WRADDRESS_LSB :std_logic_vector(7 downto 0);

signal RDEN_LSB :std_logic;

signal WREN_LSB :std_logic;

signal RDCLOCK_LSB :std_logic;

signal RDCLKEN_LSB :std_logic;

signal WRCLOCK_LSB :std_logic;

signal WRCLKEN_LSB :std_logic; 



signal tsmc_lsb_cena_n , tsmc_lsb_cenb_n : std_logic;

signal tsmc_lsb_wena_n , tsmc_lsb_wenb_n : std_logic;

signal tsmc_msb_cena_n , tsmc_msb_cenb_n : std_logic;

signal tsmc_msb_wena_n , tsmc_msb_wenb_n : std_logic;





begin









CONTROL_UNIT : CODING_BUFFER_CU

port map(

    WAITN => WAITN,

    FORCE_STOP => FORCE_STOP,

	  START => START,

	  FINISHED => FINISHED,

	  BUS_ACKNOWLEDGE => BUS_ACKNOWLEDGE,

	  THRESHOLD_LEVEL => THRESHOLD_LEVEL,

	  CODING_READ_ADDRESS => CODING_READ_ADDRESS,

	  CODING_WRITE_ADDRESS => CODING_WRITE_ADDRESS,

	  CLK => CLK,

	  CLEAR => CLEAR,

	  CODING_OVERFLOW => CODING_OVERFLOW,

	  CODING_UNDERFLOW=> CODING_UNDERFLOW,

	  ENABLE_WRITE => ENABLE_WRITE_INT,

	  ENABLE_READ => ENABLE_READ_INT,

	  FLUSHING => FLUSHING,

	  FINISH => FINISH,

        CLEAR_COUNTERS => CLEAR_COUNTERS,

	  BUS_REQUEST => BUS_REQUEST_INT

	 );





OVERFLOW_DETECTED <= CODING_OVERFLOW;

UNDERFLOW_DETECTED <= CODING_UNDERFLOW;



READ_COUNTER : BUFFER_COUNTER_READ 

port map(

     ENABLE => READ_CLK_ENABLE,

	  CLEAR => CLEAR,

  	  CLEAR_COUNTERS => CLEAR_COUNTERS,

	  CLK => CLK,

	  COUNT => CODING_READ_ADDRESS

     );





WRITE_COUNTER : BUFFER_COUNTER_WRITE 

port map(ENABLE => ENABLE_WRITE,

		SHORT => SHORT,

	  CLEAR =>CLEAR,

  	 CLEAR_COUNTERS => CLEAR_COUNTERS,

	  CLK => CLK,

	  COUNT => CODING_WRITE_ADDRESS

     );





RAM_MSB : DP_RAM_XILINX_256

		port map (

			addra => WRADDRESS_MSB,

			clka =>  WRCLOCK_MSB,

			addrb => RDADDRESS_MSB,

			clkb => RDCLOCK_MSB,

			dina => DATA_MSB,

			wea(0) => WREN_MSB,

			enb =>  RDEN_MSB,

			doutb =>  DATA_OUT_AUX(63 downto 32));



-- Actel memory



-- RAM_MSB : MY_MEMORY

-- port map(DO => DATA_OUT_AUX(63 downto 32),

--      RCLOCK =>RDCLOCK_MSB,

--      WCLOCK =>WRCLOCK_MSB,

--      DI => DATA_MSB,

--      WRB => WREN_MSB,

--      RDB =>RDEN_MSB,

--      WADDR => WRADDRESS_MSB,

--     RADDR => RDADDRESS_MSB

--);



-- Altera memory



--ALT_RAM_MSB :
--
--if (not TSMC013) generate
--
--RAM_MSB : LPM_RAM_DP
--
--generic map(LPM_WIDTH => 32,
--
--         LPM_WIDTHAD  => 8,
--
--         LPM_NUMWORDS => 256,
--
--          LPM_INDATA => "REGISTERED",
--
--         LPM_OUTDATA  =>  "UNREGISTERED",
--
--          LPM_RDADDRESS_CONTROL => "REGISTERED",
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
--              DATA=> DATA_MSB,
--
--              RDADDRESS=> RDADDRESS_MSB,
--
--              WRADDRESS=> WRADDRESS_MSB,
--
--              RDEN=> RDEN_MSB,
--
--              WREN=> WREN_MSB,
--
--              Q=> DATA_OUT_AUX(63 downto 32),
--
--              RDCLOCK=> RDCLOCK_MSB,
--
--              RDCLKEN=> RDCLKEN_MSB,
--
--              WRCLOCK=> WRCLOCK_MSB,
--
--              WRCLKEN=> WRCLKEN_MSB
--
--);
--
--end generate;
--




-- Port 1 = R

-- Port 2 = R/W

--TSMC013_RAM_MSB :
--
--  if (TSMC013) generate
--
--    TMSC_RAM : ra2sh_256W_32B_8MX_offWRMSK_8WRGRAN port map
--
--      (
--
--        clka        =>      RDCLOCK_MSB,
--
--        cena        =>      tsmc_msb_cena_n ,
--
--        wena        =>      tsmc_msb_wena_n,
--
--        aa          =>      RDADDRESS_MSB,
--
--        da          =>      DATA_MSB,
--
--        qa          =>      DATA_OUT_AUX(63 downto 32),
--
--        clkb        =>      WRCLOCK_MSB,
--
--        cenb        =>      tsmc_msb_cenb_n,
--
--        wenb        =>      tsmc_msb_wenb_n,
--
--        ab          =>      WRADDRESS_MSB,
--
--        db          =>      DATA_MSB,
--
--        qb          =>      OPEN
--
--      ) ;      
--
--end generate;







tsmc_msb_cenb_n <= not (WRCLKEN_MSB);

tsmc_msb_cena_n <= not (RDCLKEN_MSB);

tsmc_msb_wena_n <='1';

--    not (RDEN_SB); Always in read-mode; read-enable used to

--    power-up ram

tsmc_msb_wenb_n <= not (WRCLKEN_MSB);





DATA_MSB<=To_X01Z(DATA_IN_64(63 downto 32))  after 5 ns ;

RDADDRESS_MSB<= To_X01Z(CODING_READ_ADDRESS(8 downto 1))  after 5 ns ;

WRADDRESS_MSB<= To_X01Z(CODING_WRITE_ADDRESS(8 downto 1))  after 5 ns ;

RDEN_MSB<= To_X01Z(ENABLE_READ_INT)  after 5 ns ;

WREN_MSB<= To_X01Z(ENABLE_WRITE)  after 5 ns;

RDCLOCK_MSB<= To_X01Z(READ_CLK);

RDCLKEN_MSB<= To_X01Z(READ_CLK_ENABLE) after 5 ns ;

WRCLOCK_MSB<= To_X01Z(WRITE_CLK);

WRCLKEN_MSB<= To_X01Z(WRITE_CLK_ENABLE) after 5 ns ;



--RAM_MSB : syn_dpram_256x32_rawr

--port map(

--              DATA=>To_X01Z(DATA_IN_64(63 downto 32)),

--              RDADDRESS=> To_X01Z(CODING_READ_ADDRESS),

--              WRADDRESS=> To_X01Z(CODING_WRITE_ADDRESS),

--              RDEN=> To_X01Z(ENABLE_READ_INT),

--              WREN=> To_X01Z(ENABLE_WRITE),

--              Q=> DATA_OUT_AUX(63 downto 32),

--              RDCLOCK=> To_X01Z(READ_CLK),

--              RDCLKEN=> To_X01Z(READ_CLK_ENABLE),

--              WRCLOCK=> To_X01Z(WRITE_CLK),

--              WRCLKEN=> To_X01Z(WRITE_CLK_ENABLE)

--);



RAM_LSB : DP_RAM_XILINX_256

		port map (

			addra => WRADDRESS_LSB,

			clka =>  WRCLOCK_LSB,

			addrb => RDADDRESS_LSB,

			clkb => RDCLOCK_LSB,

			dina => DATA_LSB,

			wea (0) => WREN_LSB,

			enb =>  RDEN_LSB,

			doutb =>  DATA_OUT_AUX(31 downto 0));





-- Actel memory



--RAM_LSB : MY_MEMORY
--
--port map(DO => DATA_OUT_AUX(31 downto 0),
--
--      RCLOCK =>RDCLOCK_LSB,
--
--      WCLOCK =>WRCLOCK_LSB,
--
--      DI => DATA_LSB,
--
--      WRB => WREN_LSB,
--
--      RDB =>RDEN_LSB,
--
--      WADDR => WRADDRESS_LSB,
--
--      RADDR => RDADDRESS_LSB
--
--);



-- Altera memory

--ALT_RAM_LSB :
--
--if (not TSMC013) generate
--
--RAM_LSB : LPM_RAM_DP
--
--generic map(LPM_WIDTH => 32,
--
--         LPM_WIDTHAD  => 8,
--
--         LPM_NUMWORDS => 256,
--
--         LPM_INDATA => "REGISTERED",
--
--         LPM_OUTDATA  =>  "UNREGISTERED",
--
--    	   LPM_RDADDRESS_CONTROL => "REGISTERED",
--
--         LPM_WRADDRESS_CONTROL => "REGISTERED",
--
--   	     LPM_FILE  => "UNUSED",
--
--		 LPM_TYPE  => "LPM_RAM_DP",
--
--		 LPM_HINT => "UNUSED")         
--
--port map(
--
--              DATA=> DATA_LSB,
--
--              RDADDRESS=> RDADDRESS_LSB,
--
--              WRADDRESS=> WRADDRESS_LSB,
--
--              RDEN=> RDEN_LSB,
--
--             WREN=> WREN_LSB,
--
--              Q=> DATA_OUT_AUX(31 downto 0),
--
--              RDCLOCK=> RDCLOCK_LSB,
--
--              RDCLKEN=> RDCLKEN_LSB,
--
--              WRCLOCK=> WRCLOCK_LSB,
--
--              WRCLKEN=> WRCLKEN_LSB
--
--);
--
--end generate;





-- Port 1 = R

-- Port 2 = R/W

--TSMC013_RAM_LSB :
--
--  if (TSMC013) generate
--
--    TMSC_RAM : ra2sh_256W_32B_8MX_offWRMSK_8WRGRAN port map
--
--      (
--
--        clka        =>      RDCLOCK_LSB,
--
--        cena        =>      tsmc_lsb_cena_n ,
--
--        wena        =>      tsmc_lsb_wena_n,
--
--        aa          =>      RDADDRESS_LSB,
--
--        da          =>      DATA_LSB,
--
--        qa          =>      DATA_OUT_AUX(31 downto 0),
--
--        clkb        =>      WRCLOCK_LSB,
--
--        cenb        =>      tsmc_lsb_cenb_n,
--
--        wenb        =>      tsmc_lsb_wenb_n,
--
--        ab          =>      WRADDRESS_LSB,
--
--        db          =>      DATA_LSB,
--
--        qb          =>      OPEN
--
--      ) ;      
--
--end generate;







tsmc_lsb_cenb_n <= not (WRCLKEN_LSB);

tsmc_lsb_cena_n <= not (RDCLKEN_LSB);

tsmc_lsb_wena_n <='1';

--    not (RDEN_SB); Always in read-mode; read-enable used to

--    power-up ram

tsmc_lsb_wenb_n <= not (WRCLKEN_LSB);









DATA_LSB<=To_X01Z(DATA_IN_64(31 downto 0)) after 5 ns;

RDADDRESS_LSB<= To_X01Z(CODING_READ_ADDRESS(8 downto 1)) after 5 ns;

WRADDRESS_LSB<= To_X01Z(CODING_WRITE_ADDRESS(8 downto 1)) after 5 ns;

RDEN_LSB<= To_X01Z(ENABLE_READ_INT) after 5 ns;

WREN_LSB<= To_X01Z(ENABLE_WRITE) after 5 ns;

RDCLOCK_LSB<= To_X01Z(READ_CLK);

RDCLKEN_LSB<= To_X01Z(READ_CLK_ENABLE) after 5 ns; 

WRCLOCK_LSB<= To_X01Z(WRITE_CLK);

WRCLKEN_LSB<= To_X01Z(WRITE_CLK_ENABLE) after 5 ns;





--RAM_LSB : syn_dpram_256x32_rawr

--port map(

--              DATA=>To_X01Z(DATA_IN_64(31 downto 0)),

--              RDADDRESS=> To_X01Z(CODING_READ_ADDRESS),

--              WRADDRESS=> To_X01Z(CODING_WRITE_ADDRESS),

--              RDEN=> To_X01Z(ENABLE_READ_INT),

--              WREN=> To_X01Z(ENABLE_WRITE),

--              Q=> DATA_OUT_AUX(31 downto 0),

--              RDCLOCK=> To_X01Z(READ_CLK),

--              RDCLKEN=> To_X01Z(READ_CLK_ENABLE),

--              WRCLOCK=> To_X01Z(WRITE_CLK),

--              WRCLKEN=> To_X01Z(WRITE_CLK_ENABLE)

--);





DATA_VALID_PROCESS : process (CLK,CLEAR,WAITN)

variable DATA_VALID_AUX : bit;

begin

   

     if (CLEAR = '0') then

	    DATA_VALID_AUX := '1';

	 elsif ((CLK'event) and (CLK = '1')) then

     if(WAITN = '0') then

      	DATA_VALID_AUX := DATA_VALID_AUX; -- keep state

		elsif(CODING_UNDERFLOW = '1') then

	--	if(READ_ADDRESS + "00000001" = CODING_WRITE_ADDRESS) then

	  		DATA_VALID_AUX := '1';

		elsif (READ_CLK_ENABLE = '1') then

	      	DATA_VALID_AUX := '0';

		else

	      	DATA_VALID_AUX := DATA_VALID_AUX;

		end if;

	end if;

DATA_VALID <= DATA_VALID_AUX or not(WAITN);

end process DATA_VALID_PROCESS;





DATA_OUT_32 <= DATA_OUT_AUX(63 downto 32) when CODING_READ_ADDRESS(0) = '1' else DATA_OUT_AUX(31 downto 0);

WRITE_CLK <= CLK;

READ_CLK <= CLK;

ENABLE_WRITE <= ENABLE_WRITE_INT and not(OVERFLOW);

ENABLE_READ <= ENABLE_READ_INT  and not(CODING_UNDERFLOW) and WAITN; -- do not increase read address when coding_underflow equals 1

-- or wait equals 0

WRITE_CLK_ENABLE <= ENABLE_WRITE;

READ_CLK_ENABLE <= ENABLE_READ_INT and not(CODING_UNDERFLOW) and WAITN; -- if wait zero do not read more

BUS_REQUEST <= BUS_REQUEST_INT;





end STRUCTURAL;





