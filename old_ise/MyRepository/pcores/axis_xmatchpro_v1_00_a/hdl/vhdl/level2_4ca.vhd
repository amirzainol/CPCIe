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
--  ENTITY       = LEVEL2_4         --
--  version      = 1.0              --
--  last update  = 1/08/99          --
--  author       = Jose Nunez       --
--------------------------------------

-- FUNCTION
-- hierarchy level.

--  PIN LIST
--  COMP_INT     = selects compression mode
--  DECOMP_INT   = selects decompression mode
--  MOVE_ENABLE  = activates the movement in the dictionary
--  CLK          = master clock
--  CLEAR        = asynchronous reset
--  U_DATAIN     = data to be compressed
--  C_DATAIN     = data to be decompressed
--  U_DATAOUT    = decompressed data
--  C_DATAOUT    = compressed data
--  FLUSH_INT     = activate flush cycle
--  FLUSH_END     = internal flush terminated
--  ADDRESS       = memory address signal
--  CE           = memory chip enable
--  OE           = memory output enable
--  RW           = memory read or write enable

library IEEE;
use IEEE.std_logic_1164.all;


--------------------------------------
--  ENTITY       = CG_ASSEMBLY         --
--  version      = 1.0              --
--  last update  = 1/08/98          --
--  author       = Jose Nunez       --
--------------------------------------

-- FUNCTION
-- hierarchy level that includes all the assembly logic for compression.

--  PIN LIST
--  SEARCH_STRING : literals
--  MATCH_TYPE : match type of best match
--  MATCH_LOC : match location of best match (coded)
--  CLEAR : asyncronus clear
--  CLK : master clk
--  MISS : miss detection
--  FLUSH : pipeline activate flush cycle signal from csm 	
--  OVERFLOW : overflow detection data ready to be output
--  DOUT : 64 bits of compressed data
--  FLUSH_END : end of flush cycle
--  COMP : activate compression mode


entity CG_ASSEMBLY is
    port(
		RL_DETECTED : in bit;
		COUNT_IN : in bit_vector(7 downto 0);
		NFL_M_ONE : in bit_vector(3 downto 0);
		TABLE_FULL : in bit;
        SEARCH_STRING : in bit_vector(31 downto 0);
        MASK : in bit_vector(4 downto 0);
		MATCH_TYPE : in bit_vector(3 downto 0);
        MATCH_LOC : in bit_vector(3 downto 0);
		CLEAR : in bit;
		RESET : in bit;
        CLK : in bit;
        FLUSH : in bit;	
        FLUSH_RLI : in bit;
        OVERFLOW : out bit;
        SHORT : out bit;
        DOUT : out bit_vector(97 downto 34);
        FLUSH_END : out bit;
		MOVE_ENABLE : in bit;
        COMP : in bit
    );
end CG_ASSEMBLY;

architecture CG_ASSEMBLY of CG_ASSEMBLY is
    -- Component declarations
       component MT_CODER
        port(
            MATCH_TYPE : in bit_vector(3 downto 0);
            CODE : out bit_vector(5 downto 0);
            LENGTH : out bit_vector(2 downto 0)
        );
    end component;

	--change
   
    component CM_ASSEMBLER
        port(
		 CODE_A : in bit_vector(4 downto 0);
		 LENGTH_A : in bit_vector(2 downto 0);		 
		 MISS : in bit;
		 CODE_B : in bit_vector(5 downto 0);
		 LENGTH_B : in bit_vector(2 downto 0);
         CODE_OUT : out bit_vector(10 downto 0);
		 LENGTH_OUT : out bit_vector(3 downto 0)
   );
    end component;


    component LC_ASSEMBLER
        port(
	  	    MASK : in bit_vector(4 downto 0);
            MATCH_TYPE : in bit_vector(3 downto 0);
            LITERAL_DATA : in bit_vector(31 downto 0);
		    MISS : out bit;
            CODE : out bit_vector(33 downto 0);
            LENGTH : out bit_vector(5 downto 0)
        );
    end component;

    component CML_ASSEMBLER
        port(
            CODE_A : in bit_vector(10 downto 0);
            LENGTH_A : in bit_vector(3 downto 0);
            CODE_B : in bit_vector(33 downto 0);
            LENGTH_B : in bit_vector(5 downto 0);
            CODE_OUT : out bit_vector(34 downto 0);
            LENGTH_OUT : out bit_vector(5 downto 0)
        );
    end component;
    component LATCH98
        port(
            D_IN : in bit_vector(97 downto 0);
            CLEAR : in bit;
            RESET : in bit;
			CLK : in bit;
            D_OUT : out bit_vector(97 downto 0)
        );
    end component;
    component LATCH6
        port(
            D_IN : in bit_vector(5 downto 0);
            CLEAR : in bit;
            RESET : in bit;
			CLK : in bit;
            D_OUT : out bit_vector(5 downto 0)
        );
    end component;

	component RLI_coding_logic 
	port
	(
	  RL_DETECTED : in bit;
	  COUNT_IN : in bit_vector(7 downto 0);
	  MOVE_ENABLE_IN : in bit;
	  COMP_IN : in bit;
	  FLUSH_IN: in bit;
    FLUSH_RLI : in bit;
	  CODE_IN : in bit_vector(34 downto 0);
	  LENGTH_IN : in bit_vector(5 downto 0);
	  CODE_RLI : in bit_vector(4 downto 0);
      CODE_RLI_LENGTH : in bit_vector(2 downto 0);
	  CLEAR : in bit;
	  RESET : in bit;
	  CLK : in bit;
	  FLUSH_OUT: out bit;
	  COMP_OUT: out bit;
	  CODE_OUT : out bit_vector(34 downto 0);
	  LENGTH_OUT : out bit_vector(5 downto 0)
	);
	end component;

	component PIPELINE_R4
	   port (
			FLUSH_IN : in bit;
			CODE_IN : in bit_vector (34 downto 0);
			LENGTH_IN : in bit_vector (5 downto 0);
			COMP_IN :in bit;
			CLEAR:in bit;
			CLK :in bit;
			FLUSH_OUT:out bit;
			CODE_OUT:out bit_vector(34 downto 0);
			LENGTH_OUT:out bit_vector( 5 downto 0);
			COMP_OUT: out bit
		);
	end component;



    component OB_ASSEMBLER
        port(
            CODE_OLD : in bit_vector(97 downto 0);
            LENGTH_OLD : in bit_vector(5 downto 0);
            COMP : in bit;
            FLUSH_IN : in bit;
            CODE_IN : in bit_vector(34 downto 0);
            LENGTH_IN : in bit_vector(5 downto 0);
            CODE_NEW : out bit_vector(97 downto 0);
            LENGTH_NEW : out bit_vector(5 downto 0);
            OVERFLOW_LENGTH : out bit;
            FLUSH_END : out bit;
            OVERFLOW_OLD : in bit;
            CLEAR : in bit;
            RESET : in bit;
		CLK : in bit;
					 SHORT : out bit;
            OVERFLOW_FLUSH : out bit
        );
    end component;
    component OV_LATCH
        port(
            CLEAR : in bit;
		RESET : in bit;
            CLK : in bit;
            OVERFLOW_LENGTH : in bit;
            OVERFLOW_FLUSH : in bit;
            OVERFLOW_MEM : out bit;
            OVERFLOW_OLD : out bit
        );
    end component;

	component PC_GENERATE
	port
	(
    	NFL_M_ONE : in bit_vector(3 downto 0);
		MATCH_LOC : in bit_vector(3 downto 0);
		MISS : in bit;
		TABLE_FULL : in bit;
		CODE : out bit_vector(4 downto 0);
		LENGTH : out bit_vector(2 downto 0)
	);
	end component;
    
    -- Signal declarations
    signal FLUSH_INT_2:bit;
	signal FLUSH_RL:bit;
	signal MISS : bit;
	signal COMP_RL:bit;
	signal COMP_INT_2 : bit;
	signal CODE_IN_INT: bit_vector(34 downto 0);  
    signal CODE_IN : bit_vector(34 downto 0);
	signal CODE_IN_RL : bit_vector(34 downto 0);
    signal LENGTH_IN : bit_vector(5 downto 0);
	signal LENGTH_IN_RL : bit_vector(5 downto 0);
    signal LENGTH_IN_INT : bit_vector(5 downto 0);
    signal LIT_CODE : bit_vector(33 downto 0);
    signal LIT_LENGTH : bit_vector(5 downto 0);
    signal M_T_CODE : bit_vector(10 downto 0);
    signal M_T_LENGTH : bit_vector(3 downto 0);
    signal MATCH_CODE : bit_vector(4 downto 0);
    signal MATCH_LENGTH : bit_vector(2 downto 0);
    signal NEW_CODE : bit_vector(97 downto 0);
    signal NEW_LENGTH : bit_vector(5 downto 0);
    signal OLD_CODE : bit_vector(97 downto 0);
    signal OLD_LENGTH : bit_vector(5 downto 0);
    signal OVERFLOW_FLUSH : bit;
    signal OVERFLOW_LENGTH : bit;
    signal OVERFLOW_OLD : bit;
    signal SEARCH : bit_vector(31 downto 0);
    signal TYPE_CODE : bit_vector(5 downto 0);
    signal TYPE_LENGTH : bit_vector(2 downto 0);
  
 
begin
    -- Signal assignments
    SEARCH <= SEARCH_STRING;
	DOUT(97 downto 34) <= OLD_CODE(97 downto 34);

 --  Component instances
     MT_CODER_1 : MT_CODER
        port map(
            MATCH_TYPE => MATCH_TYPE,
            CODE => TYPE_CODE,
            LENGTH => TYPE_LENGTH
        );
    CM_ASSEMBLER_1 : CM_ASSEMBLER
        port map(
            CODE_A => MATCH_CODE,
		LENGTH_A => MATCH_LENGTH,
    		MISS => MISS,
            CODE_B => TYPE_CODE,
            LENGTH_B => TYPE_LENGTH,
            CODE_OUT => M_T_CODE,
            LENGTH_OUT => M_T_LENGTH
        );

    LC_ASSEMBLER_1 : LC_ASSEMBLER
        port map(
            MATCH_TYPE => MATCH_TYPE,
            MASK => MASK,
		LITERAL_DATA => SEARCH,
		MISS => MISS,
            CODE => LIT_CODE,
            LENGTH => LIT_LENGTH
        );
    

    CML_ASSEMBLER_1 : CML_ASSEMBLER
        port map(
            CODE_A => M_T_CODE,
            LENGTH_A => M_T_LENGTH,
            CODE_B => LIT_CODE,
            LENGTH_B => LIT_LENGTH,
            CODE_OUT => CODE_IN,
            LENGTH_OUT => LENGTH_IN
        );
    LATCH98_1 : LATCH98
        port map(
            D_IN => NEW_CODE,
		RESET => RESET,
            CLEAR => CLEAR,
            CLK => CLK,
            D_OUT => OLD_CODE
        );
    LATCH6_1 : LATCH6
        port map(
            D_IN => NEW_LENGTH,
            CLEAR => CLEAR,
            RESET =>  RESET,
			CLK => CLK,
            D_OUT => OLD_LENGTH
        );

	 RLI_CL : RLI_coding_logic 
	 port map
	 (
      RL_DETECTED => RL_DETECTED,
	  COUNT_IN => COUNT_IN,
	  COMP_IN => COMP,
	  MOVE_ENABLE_IN => MOVE_ENABLE,
	  FLUSH_IN => FLUSH,
    FLUSH_RLI => FLUSH_RLI,
	  CODE_IN => CODE_IN,
	  LENGTH_IN => LENGTH_IN,
	  CODE_RLI => MATCH_CODE,
      CODE_RLI_LENGTH => MATCH_LENGTH,
	  CLEAR => CLEAR,
	  RESET=>RESET,
	  CLK => CLK,
	  FLUSH_OUT => FLUSH_RL,
	  COMP_OUT => COMP_RL,
	  CODE_OUT => CODE_IN_RL,
	  LENGTH_OUT => LENGTH_IN_RL
	 );


	PIPELINE_R4_4 : PIPELINE_R4
	   port map(
			FLUSH_IN => FLUSH_RL,
			CODE_IN => CODE_IN_RL,
			LENGTH_IN => LENGTH_IN_RL,
			COMP_IN => COMP_RL,
			CLEAR => CLEAR,
			CLK => CLK,
			FLUSH_OUT => FLUSH_INT_2,
			CODE_OUT => CODE_IN_INT,
			LENGTH_OUT => LENGTH_IN_INT,
			COMP_OUT => COMP_INT_2
		);

    OB_ASSEMBLER_1 : OB_ASSEMBLER
        port map(
            CODE_OLD => OLD_CODE,
            LENGTH_OLD => OLD_LENGTH,
            COMP => COMP_INT_2,
            FLUSH_IN => FLUSH_INT_2,
            CODE_IN => CODE_IN_INT,
            LENGTH_IN => LENGTH_IN_INT,
            CODE_NEW => NEW_CODE,
            LENGTH_NEW => NEW_LENGTH,
            OVERFLOW_LENGTH => OVERFLOW_LENGTH,
            FLUSH_END => FLUSH_END,
            OVERFLOW_OLD => OVERFLOW_OLD,
            CLEAR => CLEAR,
            RESET => RESET,
			CLK => CLK,
	          SHORT => SHORT,
            OVERFLOW_FLUSH => OVERFLOW_FLUSH
        );
    OV_LATCH_1 : OV_LATCH
        port map(
            RESET => RESET,
		    CLEAR => CLEAR,
            CLK => CLK,
            OVERFLOW_LENGTH => OVERFLOW_LENGTH,
            OVERFLOW_FLUSH => OVERFLOW_FLUSH,
            OVERFLOW_MEM => OVERFLOW,
            OVERFLOW_OLD => OVERFLOW_OLD
        );

		PC_GENERATE_1 : PC_GENERATE
        port map(
			NFL_M_ONE => NFL_M_ONE,
			MATCH_LOC => MATCH_LOC,
			MISS =>MISS,
			TABLE_FULL => TABLE_FULL,
			CODE =>MATCH_CODE,
			LENGTH => MATCH_LENGTH
           );

   
end CG_ASSEMBLY;


library IEEE;
use IEEE.std_logic_1164.all;

entity level2_4ca is
    port(
      CLK : in bit;
      RESET : in bit;
	  CLEAR : in bit;   	 
      COMP : in bit;
      MOVE_ENABLE : in bit;
	  FLUSH : in bit;
	  U_DATAIN : in bit_vector(31 downto 0); 
	  MASK : in bit_vector(4 downto 0);
	  FLUSH_END : out bit ;
      C_DATAOUT : out bit_vector(63 downto 0);
	  SHORT : out bit;
	  OVERFLOW : out bit
    );
end level2_4ca;
								 
architecture level2_4ca of level2_4ca is
    -- Component declarations
    component SREG
        port(
            DIN : in bit_vector(31 downto 0);
	    	MASK_IN : in bit_vector(4 downto 0);
            CLEAR : in bit;
            CLK : in bit;
	  	    MASK_OUT : out bit_vector(4 downto 0);
            QOUT : out  bit_vector(31 downto 0)
        );
    end component;

 	component PIPELINE_R0
	port(
		DOWN_PRIORITY_6_IN : in bit_vector(15 downto 0);
	   	DOWN_PRIORITY_5_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_4_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_3_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_2_IN : in bit_vector(15 downto 0);
	  	DOWN_PRIORITY_1_IN : in bit_vector(15 downto 0);
		SAME_LENGTH_IN_2 : in bit_vector(15 downto 0);
		SAME_LENGTH_IN_3 : in bit_vector(15 downto 0);
		SAME_LENGTH_IN_4 : in bit_vector(15 downto 0);
		MATCH_TYPE_A_IN : in bit_vector(15 downto 0);
		MATCH_TYPE_B_IN : in bit_vector(15 downto 0);
		MATCH_TYPE_C_IN : in bit_vector(15 downto 0);
		MATCH_TYPE_D_IN : in bit_vector(15 downto 0);
		SEARCH_STRING_IN : in bit_vector(31 downto 0);	
		MASK_IN : in bit_vector(4 downto 0);
	  	COLUMN_OR_IN : in bit_vector(6 downto 1); 
		FLUSH_IN :  in bit;
		COMP_IN :  in bit; 
		MOVE_ENABLE_IN : in bit;
		INC_CAM_IN : in bit;
    	CLK : in bit;
		CLEAR : in bit;
		RESET : in bit;
		DOWN_PRIORITY_6_OUT : out bit_vector(15 downto 0);
		DOWN_PRIORITY_5_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_4_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_3_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_2_OUT : out bit_vector(15 downto 0);
	  	DOWN_PRIORITY_1_OUT : out bit_vector(15 downto 0);
		SAME_LENGTH_OUT_2 : out bit_vector(15 downto 0);
		SAME_LENGTH_OUT_3 : out bit_vector(15 downto 0);
		SAME_LENGTH_OUT_4 : out bit_vector(15 downto 0);	
		MATCH_TYPE_A_OUT : out bit_vector(15 downto 0);
		MATCH_TYPE_B_OUT : out bit_vector(15 downto 0);
		MATCH_TYPE_C_OUT : out bit_vector(15 downto 0);
		MATCH_TYPE_D_OUT : out bit_vector(15 downto 0);
		SEARCH_STRING_OUT : out bit_vector(31 downto 0);
		MASK_OUT : out bit_vector(4 downto 0);	  	
		COLUMN_OR_OUT : out bit_vector(6 downto 1);
		FLUSH_OUT : out bit;
		COMP_OUT : out bit;
		MOVE_ENABLE_OUT : out bit;
		INC_CAM_OUT : out bit
         );
	end component; 

	component MLD_LOGIC_3_1_2
	port(
	     TYPE_A : in bit_vector(15 downto 0) ;
     	     TYPE_B : in bit_vector(15 downto 0) ;
           TYPE_C : in bit_vector(15 downto 0) ;
           TYPE_D : in bit_vector(15 downto 0) ;
	     DOWN_PRIORITY_6 : out bit_vector(15 downto 0);		
           DOWN_PRIORITY_5 : out bit_vector(15 downto 0);
	     DOWN_PRIORITY_4 : out bit_vector(15 downto 0);
	     DOWN_PRIORITY_3 : out bit_vector(15 downto 0);
	     DOWN_PRIORITY_2 : out bit_vector(15 downto 0);
	     DOWN_PRIORITY_1 : out bit_vector(15 downto 0);
	     COLUMN_OR : out bit_vector(6 downto 1)
		);
    end component;
    component MLD_LOGIC_3_2_2
        port(
           MASK : in bit_vector(4 downto 0);
		     DOWN_PRIORITY_6 : in bit_vector(15 downto 0) ;
             DOWN_PRIORITY_5 : in bit_vector(15 downto 0) ;
     		 DOWN_PRIORITY_4 : in bit_vector(15 downto 0) ;
     		 DOWN_PRIORITY_3 : in bit_vector(15 downto 0) ;
    		 DOWN_PRIORITY_2 : in bit_vector(15 downto 0) ;		
        	 DOWN_PRIORITY_1 : in bit_vector(15 downto 0) ;
	 	     SAME_LENGTH_2 : in bit_vector(15 downto 0);
	 	     SAME_LENGTH_3 : in bit_vector(15 downto 0);
	 	     SAME_LENGTH_4 : in bit_vector(15 downto 0);
		     MATCH_TYPE_A : in bit_vector(15 downto 0);
	         MATCH_TYPE_B : in bit_vector(15 downto 0);
	         MATCH_TYPE_C : in bit_vector(15 downto 0);
	         MATCH_TYPE_D : in bit_vector(15 downto 0);
 	         COLUMN_OR : in bit_vector(6 downto 1);
             MATCH_LOC : out bit_vector(15 downto 0) ;
             MATCH_TYPE : out bit_vector(3 downto 0)      
	       );
    end component;

  
    component MC_MUX_3C
        port(
            A : in bit_vector(15 downto 0);        
			ENABLEC: in bit;
            Y : out bit_vector(15 downto 0)
                                                   );
    end component;
    
    component CAM_ARRAY_ZERO
        port(
            SEARCH_DATA : in bit_vector(31 downto 0);
		SEARCH_MASK : in bit_vector(3 downto 0);
		PREVIOUS_DATA : in bit_vector(31 downto 0);
		PREVIOUS_MASK : in bit_vector(3 downto 0);
  		ENABLE : in bit; -- do not load tuple 0 when waiting for data from the buffer
		MOVE : in bit_vector(15 downto 1);
            CLEAR : in bit;
		RESET : in bit;
            CLK : in bit;
		SAME_LENGTH_2 : out bit_vector(15 downto 0);
		SAME_LENGTH_3 : out bit_vector(15 downto 0);
		SAME_LENGTH_4 : out bit_vector(15 downto 0);
            MTYPE_A : out bit_vector(15 downto 0);
            MTYPE_B : out bit_vector(15 downto 0);
            MTYPE_C : out bit_vector(15 downto 0);
            MTYPE_D : out bit_vector(15 downto 0)
            );
    end component;
 
	component PIPELINE_R1

	    port(
    
            MATCH_LOC_IN: in bit_vector( 15 downto 0);
        	MATCH_TYPE_IN: in bit_vector(3 downto 0);
            SEARCH_STRING_IN:  in bit_vector(31 downto 0);
		MASK_IN : in bit_vector(4 downto 0);
            FLUSH_IN:in bit;
	       COMP_IN:in bit;
			MOVE_ENABLE_IN : in bit;
		    INC_IN: in bit;
            CLEAR:in bit;
			RESET: in bit;
            CLK:in bit;
            MATCH_LOC_OUT: out bit_vector (15 downto 0);
        	MATCH_TYPE_OUT:out bit_vector(3 downto 0);
            SEARCH_STRING_OUT:  out bit_vector(31 downto 0);
		MASK_OUT : out bit_vector(4 downto 0);
            FLUSH_OUT:out bit;
	      COMP_OUT:out bit;
		  MOVE_ENABLE_OUT : out bit;
		  INC_OUT:out bit
            );
     end component;

    component ENCODE16_4
        port(
            MATCH_LOC_IN : in bit_vector(15 downto 0);
            MATCH_LOC_OUT : out bit_vector(3 downto 0)

        );
    end component;

	component NFL_COUNTERS2
		port(
     		 INC : in bit ;
     		 COUNT_ENABLE : in bit ;
     		 CLK : in bit ;
     		 RESET : in bit ;
	    	 CLEAR : in bit;
     		 NFL_MINUS_ONE : out bit_vector(7 downto 0) ;
     		 TABLE_FULL : out bit
		);
	end component;
 


	component RLI_COUNTER_C 
	port (
	  MOVE_ENABLE : in bit;
	  ENABLE_C : in bit;
 	  LOCATION_ZERO : in bit;
	  SAME_POSITION : in bit;
	  CLEAR : in bit;
	  RESET : in bit;
	  CLK : in bit;
	  COUNT : out bit_vector(7 downto 0);
	  RL_DETECTED : out bit
	  );
	end component;

	component COUNT_DELAY 
	port(
			COUNT_IN : in bit_vector(7 downto 0);
			CLEAR: in bit;
			RESET : in bit;
			CLK : in bit;
			COUNT_OUT :out bit_vector(7 downto 0)
		
		);
	end component;

	component FULL_MATCH_D

	port (   
				NFL_M_ONE : in bit_vector(7 downto 0);
            MOVE_ENABLE : in bit;
					PRIORITY_6: in bit_vector(15 downto 0);
			  PRIORITY_5: in bit_vector(15 downto 0);
			  PRIORITY_2: in bit_vector(15 downto 0);
			  SAME_LENGTH_2: in bit_vector(15 downto 0);
			  SAME_LENGTH_3: in bit_vector(15 downto 0);
			  SAME_LENGTH_4: in bit_vector(15 downto 0);
			  CLK : in bit;
			  CLEAR : in bit;
			  RESET :  in bit;
			  FULL_MATCH : out bit;
			  FULL_MATCH_AT_ZERO : out bit;
			  SAME_POSITION : out bit;
			  FULL_MATCH_VECTOR : out bit_vector(15 downto 0)
			  );
	 end component;

   component CG_ASSEMBLY
        port(
		RL_DETECTED : in bit;
		COUNT_IN : in bit_vector(7 downto 0);
		NFL_M_ONE : in bit_vector(3 downto 0);
		TABLE_FULL : in bit;
        SEARCH_STRING : in bit_vector(31 downto 0);
		MASK : in bit_vector(4 downto 0);
            MATCH_TYPE : in bit_vector(3 downto 0);
            MATCH_LOC : in bit_vector(3 downto 0);
            CLEAR : in bit;
			RESET : in bit;
            CLK : in bit;
            FLUSH : in bit;
            FLUSH_RLI : in bit;
	    	OVERFLOW : out bit;
	          SHORT : out bit;
            DOUT : out bit_vector(95 downto 32);
            FLUSH_END : out bit;
			MOVE_ENABLE : in bit;
            COMP : in bit
        );
    end component;

	component MLD_DPROP_5
	port
	 (
	        DIN : in bit_vector(0 to 15);
	        DOUT : out bit_vector(14 downto 0);
	        FULL_OR : out bit
	);
    end component;

	component ODA_REGISTER
		port(
			MOVE_IN : in bit_vector(15 downto 0);
			MASK_IN : in bit;
			CONTROL : in bit_vector(14 downto 0);
			ENABLE : in bit;
			CLK : in bit;
			CLEAR : in bit;
			RESET : in bit;
			MASK_OUT : out bit;
			MOVE_OUT : out bit_vector(15 downto 0)
		);
	 end component;


    -- Signal declarations
    signal C_DOUT : bit_vector(63 downto 0);	
    signal C_MLOC : bit_vector(3 downto 0);
    signal C_MLOC_INT_2: bit_vector(15 downto 0);
    signal C_MLOC_INT_3: bit_vector(15 downto 0);
    signal C_MTYPE : bit_vector(3 downto 0);
    signal C_MTYPE_INT_2 : bit_vector (3 downto 0);

 
    signal FULL_MATCH_VECTOR : bit_vector(15 downto 0);
    signal MOVE : bit_vector(15 downto 1);
	signal MOVE_ENABLE_INT : bit;
	signal MOVE_ENABLE_INT_2 : bit;
   signal MOVE_ENABLE_RLI : bit;
    signal MTYPE_A : bit_vector(15 downto 0);
    signal MTYPE_B : bit_vector(15 downto 0);
    signal MTYPE_C : bit_vector(15 downto 0);
    signal MTYPE_D : bit_vector(15 downto 0);
    -- signal OVERFLOW : bit;
    signal S_STRING : bit_vector(31 downto 0);
    signal S_STRING_P0 : bit_vector(31 downto 0);
    signal S_STRING_INT_2: bit_vector(31 downto 0);

 

    signal U_DIN : bit_vector(31 downto 0);
  
    signal FLUSH_INT_2: bit;
	signal FLUSH_P0: bit;
    signal COMP_INT_2: bit;
    signal COMP_P0 : bit;
    signal CAM_MASK :bit_vector(3 downto 0);
    signal MASK_P0 : bit_vector(4 downto 0);
    signal M_STRING : bit_vector(4 downto 0);
	signal M_STRING_INT_2 : bit_vector(4 downto 0);
    signal SAME_LENGTH_2 : bit_vector(15 downto 0);
    signal SAME_LENGTH_2_P0 : bit_vector(15 downto 0);
    signal SAME_LENGTH_3 : bit_vector(15 downto 0);
    signal SAME_LENGTH_3_P0 : bit_vector(15 downto 0);
    signal SAME_LENGTH_4 : bit_vector(15 downto 0);
    signal SAME_LENGTH_4_P0 : bit_vector(15 downto 0);
    signal SAME_POSITION : bit;

   

   signal MTYPE_A_P0 : bit_vector(15 downto 0);
   signal MTYPE_B_P0 : bit_vector(15 downto 0);
   signal MTYPE_C_P0 : bit_vector(15 downto 0);
   signal MTYPE_D_P0 : bit_vector(15 downto 0);

   signal DOWN_PRIORITY_6 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_5 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_4 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_3 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_2 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_1 : bit_vector(15 downto 0);
   signal COLUMN_OR : bit_vector(6 downto 1);

   signal DOWN_PRIORITY_6_P0 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_5_P0 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_4_P0 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_3_P0 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_2_P0 : bit_vector(15 downto 0);
   signal DOWN_PRIORITY_1_P0 : bit_vector(15 downto 0);
   signal COLUMN_OR_P0 : bit_vector(6 downto 1);

   signal MOVE_AUX : bit_vector(15 downto 1); -- delete a loaded single byte a single byte
   signal MOVE_INT : bit_vector(15 downto 0); -- Out of order adaptation
   signal MOVE_DROP : bit_vector(15 downto 0);

   signal INC_CAM,INC_INT,INC_INT_2,TABLE_FULL: bit;

   signal NFL_M_ONE : bit_vector(7 downto 0);

   signal M_STRING_ODA : bit; -- special case when waiting for buffer and single space search

   --RLI signals

   signal FULL_MATCH  : bit;
   signal FULL_MATCH_AT_ZERO : bit;
   signal RL_DETECTED : bit;
   signal RL_COUNT : bit_vector(7 downto 0);
   signal RL_COUNT_DELAY : bit_vector(7 downto 0);
  


  

   begin
    -- Signal assignments
    U_DIN <= U_DATAIN;
    C_DATAOUT <= C_DOUT;
   
    -- Component instances
    SREG_1 : SREG
        port map(
            DIN => U_DIN,
		MASK_IN => MASK,
            CLEAR => CLEAR,
            CLK => CLK,
		MASK_OUT => MASK_P0,
            QOUT => S_STRING_P0
        );

       MLD_LOGIC_1_1 : MLD_LOGIC_3_1_2
        port map(
            TYPE_A => MTYPE_A_P0,
            TYPE_B => MTYPE_B_P0,
            TYPE_C => MTYPE_C_P0,
            TYPE_D => MTYPE_D_P0,
		  DOWN_PRIORITY_6 => DOWN_PRIORITY_6_P0,
		  DOWN_PRIORITY_5 => DOWN_PRIORITY_5_P0, 
	        DOWN_PRIORITY_4 => DOWN_PRIORITY_4_P0,
	        DOWN_PRIORITY_3 => DOWN_PRIORITY_3_P0,
	        DOWN_PRIORITY_2 => DOWN_PRIORITY_2_P0,
	        DOWN_PRIORITY_1 => DOWN_PRIORITY_1_P0,
	        COLUMN_OR => COLUMN_OR_P0
			);

    PIPELINE_R0_0 : PIPELINE_R0
		port map(
		DOWN_PRIORITY_6_IN => DOWN_PRIORITY_6_P0,
	   	DOWN_PRIORITY_5_IN => DOWN_PRIORITY_5_P0,
	  	DOWN_PRIORITY_4_IN => DOWN_PRIORITY_4_P0, 
	  	DOWN_PRIORITY_3_IN => DOWN_PRIORITY_3_P0, 
	  	DOWN_PRIORITY_2_IN => DOWN_PRIORITY_2_P0, 
	  	DOWN_PRIORITY_1_IN => DOWN_PRIORITY_1_P0, 	
		MATCH_TYPE_A_IN => MTYPE_A_P0,
		MATCH_TYPE_B_IN => MTYPE_B_P0,
		MATCH_TYPE_C_IN => MTYPE_C_P0,
		MATCH_TYPE_D_IN => MTYPE_D_P0,
		SAME_LENGTH_IN_2 => SAME_LENGTH_2_P0,
		SAME_LENGTH_IN_3 => SAME_LENGTH_3_P0,
		SAME_LENGTH_IN_4 => SAME_LENGTH_4_P0,
		SEARCH_STRING_IN => S_STRING_P0,
		MASK_IN => MASK_P0,
    	COLUMN_OR_IN => COLUMN_OR_P0, 
 	    FLUSH_IN => FLUSH,
		COMP_IN => COMP,
		MOVE_ENABLE_IN => MOVE_ENABLE,
		INC_CAM_IN => MOVE(15), -- if move active then increment NFL
      	CLK => CLK,
		CLEAR => CLEAR,
		RESET => RESET,
		DOWN_PRIORITY_6_OUT => DOWN_PRIORITY_6,
		DOWN_PRIORITY_5_OUT => DOWN_PRIORITY_5, 
 	      DOWN_PRIORITY_4_OUT => DOWN_PRIORITY_4, 
	  	DOWN_PRIORITY_3_OUT => DOWN_PRIORITY_3, 
	  	DOWN_PRIORITY_2_OUT => DOWN_PRIORITY_2, 
	  	DOWN_PRIORITY_1_OUT => DOWN_PRIORITY_1,
		MATCH_TYPE_A_OUT => MTYPE_A,
		MATCH_TYPE_B_OUT => MTYPE_B,
		MATCH_TYPE_C_OUT => MTYPE_C,
		MATCH_TYPE_D_OUT => MTYPE_D,
		SAME_LENGTH_OUT_2 => SAME_LENGTH_2,
		SAME_LENGTH_OUT_3 => SAME_LENGTH_3,
		SAME_LENGTH_OUT_4 => SAME_LENGTH_4,
		SEARCH_STRING_OUT => S_STRING,
		MASK_OUT => M_STRING,
	  	COLUMN_OR_OUT => COLUMN_OR,
 	      FLUSH_OUT => FLUSH_P0,
		COMP_OUT => COMP_P0,
		MOVE_ENABLE_OUT => MOVE_ENABLE_INT,
		INC_CAM_OUT => INC_INT
    );

--	C_FULL_HIT <= COLUMN_OR(5);
	

    MLD_LOGIC_1_2 : MLD_LOGIC_3_2_2
		 port map(
       MASK => M_STRING,
		  DOWN_PRIORITY_6 => DOWN_PRIORITY_6,
    		  DOWN_PRIORITY_5 => DOWN_PRIORITY_5, 
	        DOWN_PRIORITY_4 => DOWN_PRIORITY_4,
	        DOWN_PRIORITY_3 => DOWN_PRIORITY_3,
	        DOWN_PRIORITY_2 => DOWN_PRIORITY_2,
	        DOWN_PRIORITY_1 => DOWN_PRIORITY_1,
		  SAME_LENGTH_2 => SAME_LENGTH_2,
		  SAME_LENGTH_3 => SAME_LENGTH_3,
		  SAME_LENGTH_4 => SAME_LENGTH_4,
		  MATCH_TYPE_A => MTYPE_A,
	        MATCH_TYPE_B => MTYPE_B,
	        MATCH_TYPE_C => MTYPE_C,
	        MATCH_TYPE_D => MTYPE_D,
	        COLUMN_OR => COLUMN_OR,
              MATCH_TYPE => C_MTYPE_INT_2,
              MATCH_LOC => C_MLOC_INT_2
	                );
 

	  MC_MUX_1 : MC_MUX_3C
        port map(
            A => MOVE_DROP,
           	ENABLEC => MOVE_ENABLE,
            Y => MOVE_INT
        );

    
	ODA_REGISTER_1 : ODA_REGISTER
		port map(
			MASK_IN => MASK_P0(3),
			MOVE_IN => FULL_MATCH_VECTOR,
			CONTROL => MOVE,
			ENABLE => MOVE_ENABLE,
			CLK => CLK,
			CLEAR => CLEAR,
			RESET => RESET,
			MASK_OUT => M_STRING_ODA,
			MOVE_OUT => MOVE_DROP
			);


	NFL_COUNTERS_1: NFL_COUNTERS2
	port map(
    	 INC => INC_INT_2,
    	 COUNT_ENABLE => MOVE_ENABLE_INT_2,
    	 CLK => CLK,
    	 RESET => RESET,
		 CLEAR => CLEAR,
    	 NFL_MINUS_ONE => NFL_M_ONE,
    	 TABLE_FULL => TABLE_FULL
	);


	
	MOVE_GENERATION : MLD_DPROP_5 port map ( DIN => MOVE_INT,
								DOUT => MOVE_AUX,
								FULL_OR => open
								);	


	FULL_MATCH_D_1 : FULL_MATCH_D
	port map( 
          NFL_M_ONE => NFL_M_ONE,
			 MOVE_ENABLE => MOVE_ENABLE,
          PRIORITY_6 => DOWN_PRIORITY_6_P0,
			  PRIORITY_5 => DOWN_PRIORITY_5_P0,
			  PRIORITY_2 => DOWN_PRIORITY_2_P0,
			  SAME_LENGTH_2 => SAME_LENGTH_2_P0,
			  SAME_LENGTH_3 => SAME_LENGTH_3_P0,
			  SAME_LENGTH_4 => SAME_LENGTH_4_P0,
			  CLK => CLK,
                    CLEAR => CLEAR,
                    RESET => RESET,
			  FULL_MATCH => FULL_MATCH, -- full match at any position
			  FULL_MATCH_AT_ZERO => FULL_MATCH_AT_ZERO, -- full match at zero location
			  SAME_POSITION => SAME_POSITION,
			  FULL_MATCH_VECTOR => FULL_MATCH_VECTOR
			  );

 

    MOVE <= MOVE_AUX when M_STRING_ODA = '1' else "000000000000000"; --if single space manipulate move vector


    CAM_MASK <= MASK_P0(4 downto 1);    

    CAM_ARRAY_1 : CAM_ARRAY_ZERO
        port map(
            SEARCH_DATA => S_STRING_P0,
		SEARCH_MASK => CAM_MASK,
	    	PREVIOUS_DATA => S_STRING_P0,
		PREVIOUS_MASK => CAM_MASK, 
       	ENABLE => MOVE_ENABLE, -- do not load tuple 0 when waiting for data from the buffer 
 		 MOVE => MOVE,
            CLEAR => CLEAR,
		RESET => RESET,
            CLK => CLK,
		SAME_LENGTH_2 => SAME_LENGTH_2_P0,
		SAME_LENGTH_3 => SAME_LENGTH_3_P0,
		SAME_LENGTH_4 => SAME_LENGTH_4_P0,
            MTYPE_A => MTYPE_A_P0,
            MTYPE_B => MTYPE_B_P0,
            MTYPE_C => MTYPE_C_P0,
            MTYPE_D => MTYPE_D_P0
       );

  
PIPELINE_R1_1 : PIPELINE_R1
        port map(
			MATCH_LOC_IN => C_MLOC_INT_2,
        	MATCH_TYPE_IN   => C_MTYPE_INT_2,
            SEARCH_STRING_IN=>S_STRING,
			MASK_IN=> M_STRING,
            FLUSH_IN=>FLUSH_P0,
	        COMP_IN=>COMP_P0,
			MOVE_ENABLE_IN => MOVE_ENABLE_INT,
			INC_IN => INC_INT,
            CLEAR=>CLEAR,
			RESET=>RESET,
            CLK=>CLK,
			MATCH_LOC_OUT => C_MLOC_INT_3,
        	MATCH_TYPE_OUT => C_MTYPE,
            SEARCH_STRING_OUT=>S_STRING_INT_2,
			MASK_OUT => M_STRING_INT_2,
            FLUSH_OUT=>FLUSH_INT_2,
	        COMP_OUT=>COMP_INT_2,
			MOVE_ENABLE_OUT => MOVE_ENABLE_INT_2,
			INC_OUT => INC_INT_2
            );

   ENCODE16_5 : ENCODE16_4
        port map(
            MATCH_LOC_IN => C_MLOC_INT_3,
            MATCH_LOC_OUT => C_MLOC
        );


	DELAY : COUNT_DELAY 
			port map(
			COUNT_IN => RL_COUNT,
			CLEAR => CLEAR,
			RESET => RESET,
			CLK => CLK,
			COUNT_OUT => RL_COUNT_DELAY
			);
	
	 MOVE_ENABLE_RLI <= MOVE_ENABLE;

  	RLI_C : RLI_COUNTER_C 
		port map(
		  MOVE_ENABLE => MOVE_ENABLE_RLI,
	      ENABLE_C => FULL_MATCH, -- full match at any position
		LOCATION_ZERO => FULL_MATCH_AT_ZERO,    -- full match at location zero
		SAME_POSITION => SAME_POSITION, -- second match at the same position
		CLEAR => CLEAR,
	      RESET => RESET,
		CLK => CLK,
	      COUNT => RL_COUNT,
	      RL_DETECTED => RL_DETECTED
	    );

        CG_ASSEMBLY_1 : CG_ASSEMBLY
        port map(
			RL_DETECTED => RL_DETECTED,
			COUNT_IN => RL_COUNT_DELAY,
			TABLE_FULL => TABLE_FULL,
			NFL_M_ONE => NFL_M_ONE(3 downto 0),
            SEARCH_STRING => S_STRING_INT_2,
			MASK => M_STRING_INT_2,
            MATCH_TYPE => C_MTYPE,
            MATCH_LOC => C_MLOC,
		    CLEAR => CLEAR,
			RESET => RESET,
            CLK => CLK,
            FLUSH => FLUSH_INT_2,
            FLUSH_RLI => FLUSH_P0,
            OVERFLOW => OVERFLOW,	
	          SHORT => SHORT,
            DOUT => C_DOUT,
            FLUSH_END => FLUSH_END,
			MOVE_ENABLE => MOVE_ENABLE_INT_2,
            COMP => COMP_INT_2
        );


end level2_4ca;
