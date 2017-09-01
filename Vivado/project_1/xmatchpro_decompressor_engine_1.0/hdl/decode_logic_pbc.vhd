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
        LITERAL_DATA : out std_logic_vector(31 downto 0);
        MATCH_TYPE : out std_logic_vector(3 downto 0);
        MATCH_LOC : out std_logic_vector(3 downto 0);
		MASK : out std_logic_vector(4 downto 0);
   		WAIT_DATA : out std_logic;
        D_FULL_HIT : out std_logic;
        UNDERFLOW : out std_logic;
	    RL_DETECTED : out std_logic;
	    RL_COUNT : out std_logic_vector(7 downto 0);
	    COUNT_ENABLE : out std_logic;
	    END_COUNT : in std_logic;
        DIN : in std_logic_vector(63 downto 0);
        DECOMP : in std_logic;
        CLEAR : in std_logic;
		RESET : in std_logic;
        CLK : in std_logic;
	   ENABLE : in std_logic;
      OVERFLOW_CONTROL : in std_logic; -- control overflows in the output buffer
	   DECODING_UNDERFLOW : in std_logic

    );
end DECODE_LOGIC_PBC;

architecture DECODE_LOGIC of DECODE_LOGIC_PBC is
    -- Component declarations
    component LATCH7
        port(
            D_IN : in std_logic_vector(6 downto 0);
            ENABLE : in std_logic;
		CLEAR : in std_logic;
		RESET : in std_logic;
            CLK : in std_logic;
            D_OUT : out std_logic_vector(6 downto 0)
        );
    end component;
    component LATCH133
        port(
            D_IN : in std_logic_vector(132 downto 0);
            CLEAR : in std_logic;
          	RESET : in std_logic;
		    CLK : in std_logic;
            D_OUT : out std_logic_vector(132 downto 0)
        );
    end component;
     component DECOMP_ASSEM_9
        port(
            OLD_LENGTH : in std_logic_vector(6 downto 0);
            OLD_DATA : in std_logic_vector(132 downto 0);
	    	DECODING_UNDERFLOW : in std_logic;
			MATCH_LENGTH : in std_logic_vector(5 downto 0);
            DATA_IN : in std_logic_vector(63 downto 0);
            NEW_LENGTH : out std_logic_vector(6 downto 0);
            NEW_DATA : out std_logic_vector(132 downto 0);
            UNDERFLOW : out std_logic
        );
    end component;


    component SHIFT_LITERAL
        port(
            CM_LENGTH : in std_logic_vector(3 downto 0);
            DIN_LIT : in std_logic_vector(34 downto 0);
            DOUT_LIT : out std_logic_vector(31 downto 0)
          --  DECOMP : in std_logic
        );
    end component;

	component NFL_COUNTERS2 -- NFL COUNTER
	port
	(
      INC : in std_logic ;
      COUNT_ENABLE : in std_logic ;
      CLK : in std_logic ;
      RESET : in std_logic ;
      CLEAR : in std_logic;
      NFL_MINUS_ONE : out std_logic_vector(7 downto 0) ;
      TABLE_FULL : out std_logic
	  );
	 end component;

	component RLI_DR
	port(
            MATCH_LOC_IN: in std_logic_vector( 3 downto 0);
        	MATCH_TYPE_IN: in std_logic_vector(3 downto 0);
		FULL_HIT_IN : in std_logic;
		ENABLE : in std_logic;
		MASK_IN : in std_logic_vector(4 downto 0);
            SEARCH_STRING_IN:  in std_logic_vector(31 downto 0);
--		    INC_IN:in std_logic;
            CLEAR:in std_logic;
        	RESET: in std_logic;
		    CLK:in std_logic;
			MATCH_LOC_OUT: out std_logic_vector (3 downto 0);
        	MATCH_TYPE_OUT:out std_logic_vector(3 downto 0);
		FULL_HIT_OUT : out std_logic;
		MASK_OUT : out std_logic_vector(4 downto 0);
            SEARCH_STRING_OUT:  out std_logic_vector(31 downto 0)
         
--	      INC_OUT:out std_logic
      );
	  end component;
	 

	component RLI_DCU 
	port
	(
      RL_DETECTED : in std_logic;
      LOCATION_IN : in std_logic_vector(3 downto 0);
      MATCH_TYPE_IN : in std_logic_vector(3 downto 0);
	MASK_IN : in std_logic_vector(4 downto 0);
	FULL_HIT_IN : in std_logic;
	  END_COUNT : in std_logic;
	  CLEAR : in std_logic;
	  RESET : in std_logic;
   	  CLK : in std_logic ;
	  LOCATION_OUT : out std_logic_vector(3 downto 0);
	  MATCH_TYPE_OUT : out std_logic_vector(3 downto 0);
	  MASK_OUT : out std_logic_vector(4 downto 0);
	  FULL_HIT_OUT : out std_logic;
	  SET_LENGTH_TO_ZERO : out std_logic
	);
	end component;

--    component DECOMP_DECODE_4
--        port(
--            D_IN : in std_logic_vector(15 downto 0);
--            DECOMP : in std_logic;
--            ENABLE : in std_logic;
--            DECODING_UNDERFLOW : in std_logic;
--			UNDERFLOW : in std_logic;
--			NFL_MINUS_ONE : in std_logic_vector(3 downto 0);
--			CLK : in std_logic;
--			CLEAR : in std_logic;
--			RESET : in std_logic;
--			FULL_MLENGTH : out std_logic_vector(5 downto 0);
--			FULL_HIT : out std_logic;
--          MATCH_TYPE : out std_logic_vector(3 downto 0);
--            MATCH_LOC : out std_logic_vector(3 downto 0);
--			WAIT_DATA : out std_logic;
--			RL_DETECTED : out std_logic;
--			RL_COUNT : out std_logic_vector(7 downto 0);
--			MASK : out std_logic_vector(4 downto 0);
--          PART_MLENGTH : out std_logic_vector(3 downto 0)
--        );
--    end component;

    component DECOMP_DECODE_4
        port(
            D_IN : in std_logic_vector(15 downto 0);
            OVERFLOW_CONTROL : in std_logic;
            DECOMP : in std_logic;
            ENABLE : in std_logic;
            DECODING_UNDERFLOW : in std_logic;
			UNDERFLOW : in std_logic;
			INC : in std_logic; -- the NFL counter is incremented . once cycle late ODA effect
       SET_LENGTH_TO_ZERO : in std_logic;
			TABLE_FULL : in std_logic;
			NFL_MINUS_ONE : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			CLEAR : in std_logic;
			RESET : in std_logic;
			FULL_MLENGTH : out std_logic_vector(5 downto 0);
			FULL_HIT : out std_logic;
            MATCH_TYPE : out std_logic_vector(3 downto 0);
            MATCH_LOC : out std_logic_vector(3 downto 0);
			WAIT_DATA : out std_logic;
			RL_DETECTED : out std_logic;
			RL_COUNT : out std_logic_vector(7 downto 0);
			MASK : out std_logic_vector(4 downto 0);
            PART_MLENGTH : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Signal declarations
    signal CM_LENGTH : std_logic_vector(3 downto 0);
    signal FULL_MLENGTH : std_logic_vector(5 downto 0);
    signal FULL_MLENGTH_RLI : std_logic_vector(5 downto 0);
    signal LIT_DATA : std_logic_vector(31 downto 0);
	signal MASK_AUX : std_logic_vector(4 downto 0);
	signal MASK_CU : std_logic_vector(4 downto 0);
	signal LOCATION : std_logic_vector(3 downto 0);
	signal LOCATION_RLI : std_logic_vector(3 downto 0);
	signal MATCH_TYPE_RLI : std_logic_vector(3 downto 0);
	signal RL_DETECTED_INT : std_logic;
	signal RL_DETECTED_AUX : std_logic;
    signal NEW_DATA : std_logic_vector(132 downto 0);
    signal NEW_LENGTH : std_logic_vector(6 downto 0);
    signal OLD_DATA : std_logic_vector(132 downto 0);
    signal OLD_LENGTH : std_logic_vector(6 downto 0); 
    signal SET_LENGTH_TO_ZERO : std_logic; -- when RL active the length is zero
	signal LOCATION_RLI_P : std_logic_vector(3 downto 0);
    signal MATCH_TYPE_RLI_P : std_logic_vector(3 downto 0);
    signal LIT_DATA_RLI_P : std_logic_vector(31 downto 0);
    signal FULL_HIT_RLI : std_logic;
    signal FULL_HIT_RLI_P:std_logic;
    signal PROV : std_logic_vector(15 downto 0);
    signal UNDERFLOW_INT : std_logic ; -- to hold the underflow from decomp assem
	 signal UNDERFLOW_AUX : std_logic; 
	signal NFL_MINUS_ONE : std_logic_vector(7 downto 0);
	signal TABLE_FULL :std_logic;
  signal WAIT_DATA_AUX : std_logic;
  signal INC_NFL_COUNTER : std_logic; 
  signal ENABLE_DR : std_logic; 

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