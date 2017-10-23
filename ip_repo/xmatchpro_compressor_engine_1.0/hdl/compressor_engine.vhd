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

---------------------------------
--  ENTITY       = LEVEL1      --
--  version      = 5.0         --
--  last update  = 1/05/01     --
--  author       = Jose Nunez  --
---------------------------------

--- MODIFIED BY MOHD A ZAINOL ---
-- Revision 1: Add INTERRUPT_REQ_C, *_D
--			   and INTERRUPT_ACK_C, *_D
---------------------------------

-- FUNCTION
--  Top level of the compression decompression hierarchy.

library ieee, std, dzx;
use ieee.std_logic_1164.all;

use dzx.bit_utils.all;
-- use std.textio.all;

entity xpro_c_engine is
	port(
		CS                 : in  std_logic;
		RW                 : in  std_logic;
		ADDRESSC           : in  std_logic_vector(3 downto 0);
		--====================================================================
		--	CONTROL : inout std_logic_vector(31 downto 0);
		CONTROL_IN_C       : in  std_logic_vector(31 downto 0);
		CONTROL_OUT_C      : out std_logic_vector(31 downto 0);
		--====================================================================
		CLK                : in  std_logic;
		CLEAR              : in  std_logic;
		BUS_ACKNOWLEDGE_CC : in  std_logic;
		BUS_ACKNOWLEDGE_CU : in  std_logic;
		WAIT_CU            : in  std_logic;
		WAIT_CC            : in  std_logic;
		U_DATAIN           : in  std_logic_vector(31 downto 0);
		C_DATAOUT          : out std_logic_vector(31 downto 0);
		FINISHED_C         : out std_logic;
		COMPRESSING        : out std_logic;
		FLUSHING_C         : out std_logic;
		C_DATA_VALID       : out std_logic;
		CODING_OVERFLOW    : out std_logic; -- ilegal => error condition
		CRC_ERROR          : out std_logic; -- error condition in the compression or decompression channels
		INTERRUPT_REQ_C    : out std_logic;
		INTERRUPT_ACK_C    : in  std_logic;
		BUS_REQUEST_CC     : out std_logic;
		BUS_REQUEST_CU     : out std_logic;
		CRC_32_C           : out std_logic_vector(31 downto 0)
	);
end xpro_c_engine;

architecture arch of xpro_c_engine is

	-- these are  the components that form level1

	component level1rc
		port(
			OVERFLOW_CONTROL    : in  std_logic;
			CS                  : in  std_logic;
			RW                  : in  std_logic;
			ADDRESS             : in  std_logic_vector(1 downto 0);
			--====================================================================
			--	CONTROL : inout std_logic_vector(31 downto 0);
			CONTROL_IN          : in  std_logic_vector(31 downto 0);
			CONTROL_OUT         : out std_logic_vector(31 downto 0);
			--====================================================================
			CLK                 : in  std_logic;
			CLEAR               : in  std_logic;
			BUS_ACKNOWLEDGE_U   : in  std_logic;
			BUS_ACKNOWLEDGE_C   : in  std_logic;
			WAIT_U              : in  std_logic;
			WAIT_C              : in  std_logic;
			U_DATAIN            : in  std_logic_vector(31 downto 0);
			C_DATAOUT           : out std_logic_vector(31 downto 0);
			C_DATAOUT_TO_DECOMP : out std_logic_vector(31 downto 0);
			FINISHED            : out std_logic;
			COMPRESSING         : out std_logic;
			MODE                : out std_logic;
			FLUSHING            : out std_logic;
			CODING_OVERFLOW     : out std_logic;
			C_DATA_VALID        : out std_logic;
			CRC_OUT             : out std_logic_vector(31 downto 0);
			BUS_REQUEST_U       : out std_logic;
			BUS_REQUEST_C       : out std_logic
		);
	end component;

	signal CS_C                : std_logic;
	signal RW_C                : std_logic;
	signal ADDRESS_C           : std_logic_vector(1 downto 0);
	signal C_DATA_VALID_AUX    : std_logic; -- signals for test mode
	signal FINISHED_C_AUX      : std_logic;
	signal COMPRESSING_AUX     : std_logic;
	signal C_DATAOUT_AUX       : std_logic_vector(31 downto 0);
	signal C_DATAOUT_INT       : std_logic_vector(31 downto 0);
	signal CRC_OUT_C           : std_logic_vector(31 downto 0);
	signal CRC_OUT_D           : std_logic_vector(31 downto 0);
	signal CRC_CHECK           : std_logic;
	signal CRC_ACTIVE          : std_logic;
	signal MODE                : std_logic;
	signal CODING_OVERFLOW_AUX : std_logic; -- ilegal => error condition
	signal CRC_ERROR_AUX       : std_logic; -- error condition in the compression or decompression channels
	signal STATUS_C            : std_logic_vector(31 downto 0);
	signal ENABLE_INTERRUPT_C  : std_logic;
	signal INTERRUPT_C         : std_logic;
	signal TEST_MODE           : std_logic;

	-- pre-wired these signals
	signal OVERFLOW_CONTROL_DECODING_BUFFER : std_logic := '0';
	signal DECODING_OVERFLOW_AUX            : std_logic := '1'; -- 0 is ilegal => error condition
	signal FINISHED_D_AUX                   : std_logic := '1';

begin

	CRC_32_C <= CRC_OUT_C;

	level1_c : level1rc
		port map(
			OVERFLOW_CONTROL    => OVERFLOW_CONTROL_DECODING_BUFFER,
			CS                  => CS_C,
			RW                  => RW_C,
			ADDRESS             => ADDRESS_C,
			--=============================================================
			--	CONTROL => CONTROL,
			CONTROL_IN          => CONTROL_IN_C,
			CONTROL_OUT         => CONTROL_OUT_C,
			--=============================================================
			CLK                 => CLK,
			CLEAR               => CLEAR,
			BUS_ACKNOWLEDGE_C   => BUS_ACKNOWLEDGE_CC,
			BUS_ACKNOWLEDGE_U   => BUS_ACKNOWLEDGE_CU,
			WAIT_U              => WAIT_CU,
			WAIT_C              => WAIT_CC,
			U_DATAIN            => U_DATAIN,
			C_DATAOUT           => C_DATAOUT,
			C_DATAOUT_TO_DECOMP => C_DATAOUT_AUX,
			FINISHED            => FINISHED_C_AUX,
			COMPRESSING         => COMPRESSING_AUX,
			MODE                => MODE,
			FLUSHING            => FLUSHING_C,
			CODING_OVERFLOW     => CODING_OVERFLOW_AUX,
			C_DATA_VALID        => C_DATA_VALID_AUX,
			CRC_OUT             => CRC_OUT_C,
			BUS_REQUEST_C       => BUS_REQUEST_CC,
			BUS_REQUEST_U       => BUS_REQUEST_CU
		);

	COMPRESSING  <= COMPRESSING_AUX;
	FINISHED_C   <= FINISHED_C_AUX;
	C_DATA_VALID <= C_DATA_VALID_AUX;

	DELAY_C_DATAIN : process(CLK, CLEAR) -- test mode delay c data
	begin
		if (CLEAR = '0') then
			C_DATAOUT_INT <= x"00000000";
		elsif ((CLK'event) and (CLK = '1')) then
			C_DATAOUT_INT <= (C_DATAOUT_AUX);
		end if;

	end process;

	CRC_CONTROL : process(CLK, CLEAR)   -- test mode delay c data
	begin
		if (CLEAR = '0') then
			CRC_ACTIVE <= '0';
		elsif ((CLK'event) and (CLK = '1')) then
			if (CS = '0' and RW = '0') then --delete
				CRC_ACTIVE <= '0';
			elsif (CRC_CHECK = '0' and TEST_MODE = '1') then -- no activity in the engines
				CRC_ACTIVE <= '1';      -- active
			else
				CRC_ACTIVE <= CRC_ACTIVE;
			end if;
		end if;

	end process;

	MODE_CONTROL : process(CLK, CLEAR)  -- test mode delay c data
	begin
		if (CLEAR = '0') then
			TEST_MODE <= '0';
		elsif ((CLK'event) and (CLK = '1')) then
			if (CS = '0' and RW = '0') then --delete
				TEST_MODE <= '0';
			elsif (MODE = '0') then
				TEST_MODE <= '1';       --test mode active
			else
				TEST_MODE <= TEST_MODE;
			end if;
		end if;

	end process;

	STATUS_REGISTER_COMPRESSION : process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			STATUS_C <= x"FFFFFFFF";
		elsif ((CLK'event) and (CLK = '1')) then
			if (CS_C = '0' and RW = '0') then
				STATUS_C <= x"FFFFFFFF";
			elsif (CRC_ERROR_AUX = '0' and TEST_MODE = '1') then
				STATUS_C(15) <= '0';
			elsif CODING_OVERFLOW_AUX = '0' then
				STATUS_C(14) <= '0';
			elsif (DECODING_OVERFLOW_AUX = '0' and TEST_MODE = '1') then
				STATUS_C(13) <= '0';
			elsif (FINISHED_D_AUX = '0' and TEST_MODE = '1') then -- the decompression channel only affects this register in test mode
				STATUS_C(1) <= '0';
			elsif FINISHED_C_AUX = '0' then
				STATUS_C(0) <= '0';
			end if;
		end if;

	end process;

	ENABLE_INTERRUPT_PROCESS : process(CLK, CLEAR)
	begin
		if (CLEAR = '0') then
			ENABLE_INTERRUPT_C <= '0';

		elsif ((CLK'event) and (CLK = '1')) then
			if (CS_C = '0' and RW = '0') then
				ENABLE_INTERRUPT_C <= '1';
			elsif (INTERRUPT_ACK_C = '0' and INTERRUPT_C = '0') then
				ENABLE_INTERRUPT_C <= '0';
			else
				ENABLE_INTERRUPT_C <= ENABLE_INTERRUPT_C;
			end if;
		end if;

	end process;

	INTERRUPT_C     <= '0' when ((STATUS_C(15) = '0' or STATUS_C(14) = '0' or STATUS_C(13) = '0' or STATUS_C(1) = '0' or (STATUS_C(0) = '0' and TEST_MODE = '0')) and ENABLE_INTERRUPT_C = '1') else '1';
	INTERRUPT_REQ_C <= '0' when (INTERRUPT_C = '0') else '1';
	CRC_ERROR       <= CRC_ERROR_AUX;
	CODING_OVERFLOW <= CODING_OVERFLOW_AUX;
	CRC_ERROR_AUX   <= '0' when CRC_OUT_D /= CRC_OUT_C and CRC_ACTIVE = '1' else '1'; -- 0 active 
	ADDRESS_C       <= ADDRESSC(1 downto 0);
	RW_C            <= RW;
	CS_C            <= '0' when (CS = '0' and ADDRESSC(3 downto 2) = "11") else '1';

	--=======================================================================================================================
	--CONTROL_OUT <= To_X01Z(STATUS_C) when ADDRESS = "0000" and CS = '0' and RW = '1' else X"00000000"; 

	--CONTROL_OUT <= To_X01Z(STATUS_D) when ADDRESS = "0001" and CS = '0' and RW = '1' else X"00000000"; 
	--=======================================================================================================================

end arch;
