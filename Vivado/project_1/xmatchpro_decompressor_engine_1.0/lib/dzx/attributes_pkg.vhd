-------------------------------------------------------------------------------
--
-- Copyright (c) 1994 by AT&T. All rights reserved.
--
-- This source file may be used and distributed without restriction
-- provided that this copyright statement is not removed from the file
-- and that any derivative work contains this copyright notice.
--
-- Package name: ATTRIBUTES
-- File name   : attributes.vhdl
--
-- Updates:

--D  sccsid @(#)attributes.vhdl	1.5 daisy(C) 2/13/95 /files1/SCCS.model/bvhdl/vhdl_packages/dzx/src/s.attributes.vhdl
-------------------------------------------------------------------------------

package ATTRIBUTES is
 constant dic_size : integer := 15;
  -- Clock attributes:
  -- No need for a attribute indicating what is a clock, since any
  -- signal can be a clock.
  attribute INITIAL_VALUE: CHARACTER; -- only 'L' or 'H'.
  attribute DELAY_TIME: REAL;
  attribute PULSE_WIDTH: REAL;
  attribute TIME_PERIOD: REAL;
  attribute MAX_SKEW: REAL;
  attribute MAX_SKEW_RISING: REAL;
  attribute MAX_SKEW_FALLING: REAL;
  attribute MIN_SKEW: REAL;
  attribute MIN_SKEW_RISING: REAL;
  attribute MIN_SKEW_FALLING: REAL;

  -- Input port attributes:
  attribute ARR_TIME: REAL;
  attribute ARR_TIME_RISING: REAL;
  attribute ARR_TIME_FALLING: REAL;
  attribute ARR_TIME_CLK: STRING;
  attribute ARR_TIME_CLK_RISING: STRING;
  attribute ARR_TIME_CLK_FALLING: STRING;
  attribute DRIVE_STR: REAL;
  attribute DRIVE_STR_RISING: REAL;
  attribute DRIVE_STR_FALLING: REAL;
  attribute SLOPE: REAL;
  attribute SLOPE_RISING: REAL;
  attribute SLOPE_FALLING: REAL;

  -- Output port attributes:
  attribute CAP_LOAD: REAL;
  attribute MAX_REQD_TIME: REAL;
  attribute MIN_REQD_TIME: REAL;
  attribute MAX_REQD_TIME_RISING: REAL;
  attribute MIN_REQD_TIME_RISING: REAL;
  attribute MAX_REQD_TIME_FALLING: REAL;
  attribute MIN_REQD_TIME_FALLING: REAL;
  attribute MAX_REQD_TIME_CLK: STRING;
  attribute MIN_REQD_TIME_CLK: STRING;

  attribute MAX_REQD_TIME_CLK_RISING: STRING;
  attribute MIN_REQD_TIME_CLK_RISING: STRING;
  attribute MAX_REQD_TIME_CLK_FALLING: STRING;
  attribute MIN_REQD_TIME_CLK_FALLING: STRING;

  -- Entity attributes:
  attribute MAX_AREA: REAL;

  -- Merge attribute to collapse hierarchy:
  attribute MERGE: BOOLEAN;

  -- External name attribute:
  attribute EXTNAME: STRING;

  -- Built_in operators attribute:
  attribute BUILT_IN_OPERATORS: BOOLEAN;

  -- Attributes and type for specifying RTL binding and structure info:
  type RTL_LABEL is range 0 to 0;
  attribute RTL_BINDING: STRING;
  attribute RTL_STRUCTURE: STRING;
end ATTRIBUTES;

