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
--  ENTITY       = INPUT_BUFFER_32_32     --
--  version      = 1.0                     --
--  last update  = 30/05/00                --
--  author       = Jose Nunez              --
---------------------------------------------


-- FUNCTION
-- This input buffer loads 32 bits of data from the input bus and writes 32 bit of data to the parsing unit
-- 256x32 bit word to handle a block of 1 Kbyte. Then the buffer waits for the all data processed signal before requesting more data.

--  PIN LIST

--  START = activate the buffer
--  FINISHED = the buffer block has been process in the engine. load more data if required
--  READY = data ready to be processed in the buffer.
--  DATA_IN_32  = input data from the 32 bit input bus
--  BUS_ACKNOWLEDGE = Data is available in the input bus.
--  DATA_OUT_32  = output data to the 32 bit wide output bus
--  EMPTY = all the data present in the buffer has been processed
--  BUS_REQUEST = output requesting data to be processed
--  CLEAR    = asynchronous clear
--  CLK      = master clock


library ieee,dzx;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use dzx.bit_arith.all;
library xil_lib;
use xil_lib.xil_comp.all;
use work.tech_package.all;


entity INPUT_BUFFER_32_32 is
port
( 
  OVERFLOW_CONTROL : in bit;
  FORCE_STOP : in bit;
	START : in bit;
	COMP : in bit;
	STOP : in bit;
	READ : in bit;
	WAITN : in bit;
	DATA_IN_32 : in bit_vector(31 downto 0);
	BUS_ACKNOWLEDGE : in bit;
	CLEAR : in bit ;
	CLK : in bit ;
	DATA_OUT_32: out bit_vector(31 downto 0);
	READY : out bit; -- data ready for the parser
	INC_TC : out bit;
	RESET_TOTAL_COUNTER : out bit;
	BUS_REQUEST : out bit
);

end INPUT_BUFFER_32_32;


architecture STRUCTURAL of INPUT_BUFFER_32_32 is

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

-- component LPM_RAM_DP
--      generic (LPM_WIDTH    : positive ;
--               LPM_WIDTHAD  : positive;
--               LPM_NUMWORDS : positive;
--               LPM_INDATA   : string ;
--               LPM_RDADDRESS_CONTROL : string ;
--               LPM_WRADDRESS_CONTROL : string ;
--               LPM_OUTDATA  : string ;
--               LPM_TYPE     : string ;
--               LPM_FILE     : string ;
--	       LPM_HINT	    : string );
--      port (RDCLOCK : in std_logic;
--            RDCLKEN : in std_logic;
--            RDADDRESS : in std_logic_vector(7 downto 0);
--            RDEN : in std_logic;
--            DATA : in std_logic_vector(31 downto 0);
--           WRADDRESS : in std_logic_vector(7 downto 0);
--            WREN : in std_logic;
--            WRCLOCK : in std_logic;
--            WRCLKEN : in std_logic;
--            Q : out std_logic_vector(31 downto 0));
--end component;

--attribute noopt: boolean;
--attribute noopt of LPM_RAM_DP: component is true;

    
component INPUT_BUFFER_CU

port (
    OVERFLOW_CONTROL : in bit;
    FORCE_STOP : in bit;
	  START : in bit;
	  STOP : in bit;
	  BUS_ACKNOWLEDGE : in bit;
	  WAITN : in bit;
	  CODING_READ_ADDRESS : in bit_vector(7 downto 0);
	  CODING_WRITE_ADDRESS : in bit_vector(7 downto 0);
	  CLK : in bit;
	  CLEAR : in bit;
	  BUS_REQUEST : out bit;
      CLEAR_COUNTERS : out bit;
	  RESET_TOTAL_COUNTER : out bit; -- only once per whole block
	  ENABLE_PARSER : out bit;
	  ENABLE_WRITE : out bit;
	  ENABLE_READ : out bit
	 );
end component;


component INPUT_COUNTER

port (ENABLE : in bit;
	  CLEAR : in bit;
	  CLEAR_COUNTERS : in bit;
	  CLK : in bit;
	  COUNT : out bit_vector(7 downto 0)
     );

end component;


-- 1 bit for the 64-to-32 multiplexor

signal CODING_READ_ADDRESS : bit_vector(7 downto 0);
signal CODING_WRITE_ADDRESS : bit_vector(7 downto 0);
signal ENABLE_WRITE : bit;
signal ENABLE_READ  : bit;
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
signal RDADDRESS_SB :std_logic_vector(7 downto 0);
signal WRADDRESS_SB :std_logic_vector(7 downto 0);
signal RDEN_SB :std_logic;
signal WREN_SB :std_logic;
signal RDCLOCK_SB :std_logic;
signal RDCLKEN_SB :std_logic;
signal WRCLOCK_SB :std_logic;
signal WRCLKEN_SB :std_logic; 
signal READY_AUX : bit;
signal ENABLE_WRITE_WITH_WAIT : bit;


signal LOGIC_0 : std_logic := '0';
signal tsmc_cena_n , tsmc_cenb_n : std_logic;
signal tsmc_wena_n , tsmc_wenb_n : std_logic;

begin

 
CONTROL_UNIT : INPUT_BUFFER_CU
port map(
    OVERFLOW_CONTROL => OVERFLOW_CONTROL,
    FORCE_STOP => FORCE_STOP,
	  START => START,
	  STOP => STOP,
	  BUS_ACKNOWLEDGE => BUS_ACKNOWLEDGE,
	  WAITN => WAITN,
	  CODING_READ_ADDRESS => CODING_READ_ADDRESS,
	  CODING_WRITE_ADDRESS => CODING_WRITE_ADDRESS,
	  CLK => CLK,
	  CLEAR => CLEAR,
	  ENABLE_WRITE => ENABLE_WRITE_INT,
	  ENABLE_READ => ENABLE_READ_INT,
	  ENABLE_PARSER => READY_AUX, -- data for the parser ready 
      CLEAR_COUNTERS => CLEAR_COUNTERS,
	  RESET_TOTAL_COUNTER => RESET_TOTAL_COUNTER,
	  BUS_REQUEST => BUS_REQUEST_INT
	 );



READ_COUNTER : INPUT_COUNTER 
port map(ENABLE => ENABLE_READ,
	  CLEAR => CLEAR,
  	  CLEAR_COUNTERS => CLEAR_COUNTERS,
	  CLK => CLK,
	  COUNT => CODING_READ_ADDRESS
     );


WRITE_COUNTER : INPUT_COUNTER 
port map(ENABLE => ENABLE_WRITE_WITH_WAIT,
	  CLEAR =>CLEAR,
  	 CLEAR_COUNTERS => CLEAR_COUNTERS,
	  CLK => CLK,
	  COUNT => CODING_WRITE_ADDRESS
     );

ENABLE_WRITE_WITH_WAIT <= ENABLE_WRITE and WAITN;

-- xilinx memory

RAM_SB: DP_RAM_XILINX_256
	port map(
			addra => WRADDRESS_SB,
			clka =>  WRCLOCK_SB,
			addrb => RDADDRESS_SB,
			clkb => RDCLOCK_SB,
			dina => DATA_SB,
			wea(0) => WREN_SB,
			enb =>  RDEN_SB,
			doutb =>  DATA_OUT_AUX(31 downto 0));

-- Actel memory

--RAM_SB : MY_MEMORY
--port map(DO => DATA_OUT_AUX(31 downto 0),
--      RCLOCK =>RDCLOCK_SB,
--      WCLOCK =>WRCLOCK_SB,
--      DI => DATA_SB,
--      WRB => WREN_SB,
--      RDB =>RDEN_SB,
--      WADDR => WRADDRESS_SB,
--      RADDR => RDADDRESS_SB
--);

-- Altera memory

-- Altera memory

-- pragma translate off

--ALT_RAM :
--
--if (not TSMC013) generate
--
--RAM_SB: LPM_RAM_DP
--generic map(LPM_WIDTH => 32,
--         LPM_WIDTHAD  => 8,
--         LPM_NUMWORDS => 256,
--		    LPM_INDATA => "REGISTERED",
--         LPM_OUTDATA  =>  "UNREGISTERED",
--		    LPM_RDADDRESS_CONTROL => "REGISTERED",
--		    LPM_WRADDRESS_CONTROL => "REGISTERED",
--		    LPM_FILE  => "UNUSED",
--		    LPM_TYPE  => "LPM_RAM_DP",
--		    LPM_HINT => "UNUSED")         
--port map(
--              DATA=> DATA_SB,
--              RDADDRESS=> RDADDRESS_SB,
--              WRADDRESS=> WRADDRESS_SB,
--              RDEN=> RDEN_SB,
--              WREN=> WREN_SB,
--              Q=> DATA_OUT_AUX(31 downto 0),
--              RDCLOCK=> RDCLOCK_SB,
--             RDCLKEN=> RDCLKEN_SB,
--              WRCLOCK=> WRCLOCK_SB,
--              WRCLKEN=> WRCLKEN_SB
--);
--
--end generate;

--pragma translate on

-- Port 1 = R

-- Port 2 = R/W

--TSMC013_RAM :
--
--  if (TSMC013) generate
--    TMSC_RAM : ra2sh_256W_32B_8MX_offWRMSK_8WRGRAN port map
--      (
--        clka        =>      RDCLOCK_SB,
--        cena        =>      tsmc_cena_n ,
--        wena        =>      tsmc_wena_n,
--        aa          =>      RDADDRESS_SB,
--        da          =>      DATA_SB,
--        qa          =>      DATA_OUT_AUX,
--        clkb        =>      WRCLOCK_SB,
--        cenb        =>      tsmc_cenb_n,
--        wenb        =>      tsmc_wenb_n,
--        ab          =>      WRADDRESS_SB,
--        db          =>      DATA_SB,
--        qb          =>      OPEN
--      ) ;      
--
--  end generate;

tsmc_cenb_n <= not (WRCLKEN_SB);

tsmc_cena_n <= not (RDCLKEN_SB);

tsmc_wena_n <='1';

--    not (RDEN_SB); Always in read-mode; read-enable used to

--    power-up ram

tsmc_wenb_n <= not (WREN_SB);


DATA_SB<=To_X01Z(DATA_IN_32) after 5 ns;
RDADDRESS_SB<= To_X01Z(CODING_READ_ADDRESS) after 5 ns;
WRADDRESS_SB<= To_X01Z(CODING_WRITE_ADDRESS)  after 5 ns;
RDEN_SB<= To_X01Z(ENABLE_READ)  after 5 ns;
WREN_SB<= To_X01Z(ENABLE_WRITE)  after 5 ns;
RDCLOCK_SB<= To_X01Z(READ_CLK);
RDCLKEN_SB<= To_X01Z(READ_CLK_ENABLE)  after 5 ns;
WRCLOCK_SB<= To_X01Z(WRITE_CLK);
WRCLKEN_SB<= To_X01Z(WRITE_CLK_ENABLE)  after 5 ns;


DATA_OUT_32 <= To_bitvector(DATA_OUT_AUX);-- when ENABLE_READ_INT = '1' else x"00000000";
WRITE_CLK <= CLK;
READ_CLK <= CLK;
ENABLE_READ <= (ENABLE_READ_INT and READ);
ENABLE_WRITE <= ENABLE_WRITE_INT;
WRITE_CLK_ENABLE <= ENABLE_WRITE_INT;
READ_CLK_ENABLE <= ENABLE_READ_INT;
BUS_REQUEST <= BUS_REQUEST_INT;
READY <=READY_AUX;

INC_TC <= ENABLE_WRITE_WITH_WAIT;

end STRUCTURAL;
