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

--------------------------------------
--  ENTITY       = DECODE_LOGIC     --
--  version      = 1.0              --
--  last update  = 16/10/00          --
--  author       = Jose Nunez       --
--------------------------------------

-- FUNCTION
-- hierarchy level that includes all the disassembly logic and decoding functions for decompression.

--  PIN LIST
--  LITERAL_DATA : literals reconstructed 
--  MATCH_TYPE : match type decoded
--  MATCH_LOC : match location decoded
--  D_FULL_HIT : full hit detection
--  UNDERFLOW : underflow more data required
--  DIN : input of compressed data
--  DECOMP : decompression active
--  CLEAR : asyncronus clear
--  CLK : master clock
--  ENABLE : enable decompression delaying one cycle



library IEEE;
use IEEE.std_logic_1164.all;

entity DECODE_LOGIC_PBC is
    port(
        LITERAL_DATA : out bit_vector(31 downto 0);
        MATCH_TYPE : out bit_vector(3 downto 0);
        MATCH_LOC : out bit_vector(3 downto 0);
		MASK : out bit_vector(4 downto 0);
   		WAIT_DATA : out bit;
        D_FULL_HIT : out bit;
        UNDERFLOW : out bit;
	    RL_DETECTED : out bit;
	    RL_COUNT : out bit_vector(7 downto 0);
	    COUNT_ENABLE : out bit;
	    END_COUNT : in bit;
        DIN : in bit_vector(63 downto 0);
        DECOMP : in bit;
        CLEAR : in bit;
		RESET : in bit;
        CLK : in bit;
	   ENABLE : in bit;
      OVERFLOW_CONTROL : in bit; -- control overflows in the output buffer
	   DECODING_UNDERFLOW : in bit

    );
end DECODE_LOGIC_PBC;

architecture DECODE_LOGIC of DECODE_LOGIC_PBC is
    -- Component declarations
    component LATCH7
        port(
            D_IN : in bit_vector(6 downto 0);
            ENABLE : in bit;
		CLEAR : in bit;
		RESET : in bit;
            CLK : in bit;
            D_OUT : out bit_vector(6 downto 0)
        );
    end component;
    component LATCH133
        port(
            D_IN : in bit_vector(132 downto 0);
            CLEAR : in bit;
          	RESET : in bit;
		    CLK : in bit;
            D_OUT : out bit_vector(132 downto 0)
        );
    end component;
     component DECOMP_ASSEM_9
        port(
            OLD_LENGTH : in bit_vector(6 downto 0);
            OLD_DATA : in bit_vector(132 downto 0);
	    	DECODING_UNDERFLOW : in bit;
			MATCH_LENGTH : in bit_vector(5 downto 0);
            DATA_IN : in bit_vector(63 downto 0);
            NEW_LENGTH : out bit_vector(6 downto 0);
            NEW_DATA : out bit_vector(132 downto 0);
            UNDERFLOW : out bit
        );
    end component;


    component SHIFT_LITERAL
        port(
            CM_LENGTH : in bit_vector(3 downto 0);
            DIN_LIT : in bit_vector(34 downto 0);
            DOUT_LIT : out bit_vector(31 downto 0)
          --  DECOMP : in bit
        );
    end component;

	component NFL_COUNTERS2 -- NFL COUNTER
	port
	(
      INC : in bit ;
      COUNT_ENABLE : in bit ;
      CLK : in bit ;
      RESET : in bit ;
      CLEAR : in bit;
      NFL_MINUS_ONE : out bit_vector(7 downto 0) ;
      TABLE_FULL : out bit
	  );
	 end component;

	component RLI_DR
	port(
            MATCH_LOC_IN: in bit_vector( 3 downto 0);
        	MATCH_TYPE_IN: in bit_vector(3 downto 0);
		FULL_HIT_IN : in bit;
		ENABLE : in bit;
		MASK_IN : in bit_vector(4 downto 0);
            SEARCH_STRING_IN:  in bit_vector(31 downto 0);
--		    INC_IN:in bit;
            CLEAR:in bit;
        	RESET: in bit;
		    CLK:in bit;
			MATCH_LOC_OUT: out bit_vector (3 downto 0);
        	MATCH_TYPE_OUT:out bit_vector(3 downto 0);
		FULL_HIT_OUT : out bit;
		MASK_OUT : out bit_vector(4 downto 0);
            SEARCH_STRING_OUT:  out bit_vector(31 downto 0)
         
--	      INC_OUT:out bit
      );
	  end component;
	 

	component RLI_DCU 
	port
	(
      RL_DETECTED : in bit;
      LOCATION_IN : in bit_vector(3 downto 0);
      MATCH_TYPE_IN : in bit_vector(3 downto 0);
	MASK_IN : in bit_vector(4 downto 0);
	FULL_HIT_IN : in bit;
	  END_COUNT : in bit;
	  CLEAR : in bit;
	  RESET : in bit;
   	  CLK : in bit ;
	  LOCATION_OUT : out bit_vector(3 downto 0);
	  MATCH_TYPE_OUT : out bit_vector(3 downto 0);
	  MASK_OUT : out bit_vector(4 downto 0);
	  FULL_HIT_OUT : out bit;
	  SET_LENGTH_TO_ZERO : out bit
	);
	end component;

--    component DECOMP_DECODE_4
--        port(
--            D_IN : in bit_vector(15 downto 0);
--            DECOMP : in bit;
--            ENABLE : in bit;
--            DECODING_UNDERFLOW : in bit;
--			UNDERFLOW : in bit;
--			NFL_MINUS_ONE : in bit_vector(3 downto 0);
--			CLK : in bit;
--			CLEAR : in bit;
--			RESET : in bit;
--			FULL_MLENGTH : out bit_vector(5 downto 0);
--			FULL_HIT : out bit;
--          MATCH_TYPE : out bit_vector(3 downto 0);
--            MATCH_LOC : out bit_vector(3 downto 0);
--			WAIT_DATA : out bit;
--			RL_DETECTED : out bit;
--			RL_COUNT : out bit_vector(7 downto 0);
--			MASK : out bit_vector(4 downto 0);
--          PART_MLENGTH : out bit_vector(3 downto 0)
--        );
--    end component;

    component DECOMP_DECODE_4
        port(
            D_IN : in bit_vector(15 downto 0);
            OVERFLOW_CONTROL : in bit;
            DECOMP : in bit;
            ENABLE : in bit;
            DECODING_UNDERFLOW : in bit;
			UNDERFLOW : in bit;
			INC : in bit; -- the NFL counter is incremented . once cycle late ODA effect
       SET_LENGTH_TO_ZERO : in bit;
			TABLE_FULL : in bit;
			NFL_MINUS_ONE : in bit_vector(3 downto 0);
			CLK : in bit;
			CLEAR : in bit;
			RESET : in bit;
			FULL_MLENGTH : out bit_vector(5 downto 0);
			FULL_HIT : out bit;
            MATCH_TYPE : out bit_vector(3 downto 0);
            MATCH_LOC : out bit_vector(3 downto 0);
			WAIT_DATA : out bit;
			RL_DETECTED : out bit;
			RL_COUNT : out bit_vector(7 downto 0);
			MASK : out bit_vector(4 downto 0);
            PART_MLENGTH : out bit_vector(3 downto 0)
        );
    end component;

    -- Signal declarations
    signal CM_LENGTH : bit_vector(3 downto 0);
    signal FULL_MLENGTH : bit_vector(5 downto 0);
    signal FULL_MLENGTH_RLI : bit_vector(5 downto 0);
    signal LIT_DATA : bit_vector(31 downto 0);
	signal MASK_AUX : bit_vector(4 downto 0);
	signal MASK_CU : bit_vector(4 downto 0);
	signal LOCATION : bit_vector(3 downto 0);
	signal LOCATION_RLI : bit_vector(3 downto 0);
	signal MATCH_TYPE_RLI : bit_vector(3 downto 0);
	signal RL_DETECTED_INT : bit;
	signal RL_DETECTED_AUX : bit;
    signal NEW_DATA : bit_vector(132 downto 0);
    signal NEW_LENGTH : bit_vector(6 downto 0);
    signal OLD_DATA : bit_vector(132 downto 0);
    signal OLD_LENGTH : bit_vector(6 downto 0); 
    signal SET_LENGTH_TO_ZERO : bit; -- when RL active the length is zero
	signal LOCATION_RLI_P : bit_vector(3 downto 0);
    signal MATCH_TYPE_RLI_P : bit_vector(3 downto 0);
    signal LIT_DATA_RLI_P : bit_vector(31 downto 0);
    signal FULL_HIT_RLI : bit;
    signal FULL_HIT_RLI_P:bit;
    signal PROV : bit_vector(15 downto 0);
    signal UNDERFLOW_INT : bit ; -- to hold the underflow from decomp assem
	 signal UNDERFLOW_AUX : bit; 
	signal NFL_MINUS_ONE : bit_vector(7 downto 0);
	signal TABLE_FULL :bit;
  signal WAIT_DATA_AUX : bit;
  signal INC_NFL_COUNTER : bit; 
  signal ENABLE_DR : bit; 

begin
    -- Signal assignments
    LITERAL_DATA <= LIT_DATA;
    MATCH_LOC <= LOCATION;
   
    -- Component instances
    LATCH7_1 : LATCH7
        port map(
            D_IN => NEW_LENGTH,
		ENABLE => DECOMP,
            CLEAR => CLEAR,
			RESET => RESET,
            CLK => CLK,
            D_OUT => OLD_LENGTH
        );
    LATCH133_1 : LATCH133
        port map(
            D_IN => NEW_DATA,
            CLEAR => CLEAR,
          	RESET => RESET,
		    CLK => CLK,
            D_OUT => OLD_DATA
        );


       DECOMP_ASSEM_1 : DECOMP_ASSEM_9
        port map(
            OLD_LENGTH => OLD_LENGTH,
            OLD_DATA => OLD_DATA,
		    DECODING_UNDERFLOW => DECODING_UNDERFLOW,
            MATCH_LENGTH => FULL_MLENGTH_RLI,
            DATA_IN => DIN,
           -- DECOMP => DECOMP,
            NEW_LENGTH => NEW_LENGTH,
            NEW_DATA => NEW_DATA,
            UNDERFLOW => UNDERFLOW_INT
        );
	
	FULL_MLENGTH_RLI <= FULL_MLENGTH when (SET_LENGTH_TO_ZERO = '0' and OVERFLOW_CONTROL = '0') else "000000"; -- do not move
 	RL_DETECTED_AUX <= RL_DETECTED_INT when DECOMP='0' and SET_LENGTH_TO_ZERO ='0' else '0'; -- do not do two RL detections together

	COUNT_ENABLE <= SET_LENGTH_TO_ZERO;
	 
    SHIFT_LITERAL_1 : SHIFT_LITERAL
        port map(
            CM_LENGTH => CM_LENGTH,
            DIN_LIT => OLD_DATA(132 downto 98),
            DOUT_LIT => LIT_DATA_RLI_P
   --         DECOMP => DECOMP
        );

  ENABLE_DR <= OVERFLOW_CONTROL or SET_LENGTH_TO_ZERO or DECODING_UNDERFLOW;

	RLI_DR_1 : RLI_DR
    port map(
            MATCH_LOC_IN => LOCATION_RLI_P,
        	MATCH_TYPE_IN => MATCH_TYPE_RLI_P,
		FULL_HIT_IN => FULL_HIT_RLI_P,
		ENABLE => ENABLE_DR,
		MASK_IN => MASK_AUX,
            SEARCH_STRING_IN => LIT_DATA_RLI_P,
	            CLEAR => CLEAR,
			RESET => RESET,
            CLK => CLK,
		MATCH_LOC_OUT => LOCATION_RLI,
        	MATCH_TYPE_OUT => MATCH_TYPE_RLI,
		FULL_HIT_OUT => FULL_HIT_RLI,
		MASK_OUT => MASK_CU,
            SEARCH_STRING_OUT => LIT_DATA
            );

	RLI_DCU_1 : RLI_DCU 
	port map
	(
      RL_DETECTED => RL_DETECTED_AUX,
      LOCATION_IN => LOCATION_RLI,
      MATCH_TYPE_IN => MATCH_TYPE_RLI,
	MASK_IN => MASK_CU,
	FULL_HIT_IN => FULL_HIT_RLI,
	  END_COUNT => END_COUNT,
	  CLEAR => CLEAR,
	  RESET => RESET,
  	  CLK => CLK,
	  LOCATION_OUT => LOCATION,
	  MATCH_TYPE_OUT => MATCH_TYPE,
        MASK_OUT => MASK,
	  FULL_HIT_OUT => D_FULL_HIT,
	  SET_LENGTH_TO_ZERO => SET_LENGTH_TO_ZERO
	);

    
    RL_DETECTED <= RL_DETECTED_AUX;

    PROV <= OLD_DATA(132 downto 117);	
	  UNDERFLOW_AUX <= UNDERFLOW_INT;
    WAIT_DATA <= WAIT_DATA_AUX;

     -- or SET_LENGTH_TO_ZERO; -- do not undeflow when RLI is active

    UNDERFLOW <= UNDERFLOW_AUX;
    INC_NFL_COUNTER <= FULL_HIT_RLI and not(WAIT_DATA_AUX); -- one cycle delay to replicate ODA use FULL_HIT_RLI
   -- do not increment if wait data
    
	NFL_COUNTER : NFL_COUNTERS2 --NFL counter

	port map(INC => INC_NFL_COUNTER, 
      		COUNT_ENABLE =>ENABLE,
      		CLK => CLK,
      		RESET => RESET,
      		CLEAR => CLEAR,
     	    NFL_MINUS_ONE => NFL_MINUS_ONE,
      		TABLE_FULL => TABLE_FULL
	  );

	DECOMP_DECODE_1 : DECOMP_DECODE_4
        port map(
            D_IN =>PROV ,
            OVERFLOW_CONTROL => OVERFLOW_CONTROL,
            DECOMP => DECOMP,
	        ENABLE => ENABLE,
            DECODING_UNDERFLOW => DECODING_UNDERFLOW,
     		UNDERFLOW => UNDERFLOW_AUX,
			INC => FULL_HIT_RLI,
       SET_LENGTH_TO_ZERO => SET_LENGTH_TO_ZERO,
			TABLE_FULL => TABLE_FULL,
		    NFL_MINUS_ONE => NFL_MINUS_ONE(3 downto 0),
			CLK => CLK,
			CLEAR => CLEAR,
			RESET => RESET,
			FULL_MLENGTH => FULL_MLENGTH,
   			FULL_HIT => FULL_HIT_RLI_P,
            MATCH_TYPE => MATCH_TYPE_RLI_P,
            MATCH_LOC => LOCATION_RLI_P,
			WAIT_DATA => WAIT_DATA_AUX,
		RL_DETECTED => RL_DETECTED_INT,
		RL_COUNT => RL_COUNT,
		MASK => MASK_AUX,
            PART_MLENGTH => CM_LENGTH
	);
end DECODE_LOGIC;