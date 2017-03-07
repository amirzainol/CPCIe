-------------------------------------------------------------------------------
--
-- Copyright (c) 1994 by AT&T. All rights reserved.
--
-- This source file may be used and distributed without restriction
-- provided that this copyright statement is not removed from the file
-- and that any derivative work contains this copyright notice.
--
-- Package name: BIT_UTILS
-- File name   : bit_utils.vhdl
--
-- Updates:

--D  sccsid @(#)bit_utils.vhdl	1.2 daisy(C) 2/13/95 /files1/SCCS.model/bvhdl/vhdl_packages/dzx/src/s.bit_utils.vhdl
-------------------------------------------------------------------------------

package Bit_Utils is

    ---------------------------------------------------------------------
    -- rising, falling clock edge and clock level detection functions: --
    ---------------------------------------------------------------------
    function  Rising_Edge  (signal clock_name : Bit)  return Boolean;
    function  Falling_Edge (signal clock_name : Bit)  return Boolean;
    function  High_Level    (signal clock_name : Bit)  return Boolean;
    function  Low_Level     (signal clock_name : Bit)  return Boolean;

    --------------------------
    -- conversions routines --
    --------------------------

    function To_Bit    (b: Boolean) return Bit;
    function To_Char   (l : Bit)  return Character;
    function To_String (v : Bit_Vector) return String;

    ----------------------------------
    -- Boolean reduction functions: --
    ----------------------------------
    function And_Bits  (v: Bit_Vector) return Bit;
    function Nand_Bits  (v: Bit_Vector) return Bit;
    function Or_Bits   (v: Bit_Vector) return Bit;
    function Nor_Bits   (v: Bit_Vector) return Bit;
    function Xor_Bits  (v: Bit_Vector) return Bit;
    function Xnor_Bits (v: Bit_Vector) return Bit;

    -- preset / clear procedure:
    procedure Preset_Clear (signal FF: out Bit_Vector; Pc_Value: Bit_Vector);
    procedure Preset_Clear (signal FF: out Bit; Pc_Value: Bit);


    attribute BUILT_IN: BOOLEAN;                                  --D
    attribute BUILT_IN of Rising_Edge: function is TRUE;          --D
    attribute BUILT_IN of Falling_Edge: function is TRUE;         --D
    attribute BUILT_IN of High_Level: function is TRUE;           --D
    attribute BUILT_IN of LOw_Level: function is TRUE;            --D
    attribute BUILT_IN of To_Bit            : function is TRUE;   --D
    attribute BUILT_IN of To_Char           : function is TRUE;   --D
    attribute BUILT_IN of To_String         : function is TRUE;   --D
    attribute BUILT_IN of And_Bits: function is TRUE;             --D
    attribute BUILT_IN of Nand_Bits: function is TRUE;            --D
    attribute BUILT_IN of Or_Bits: function is TRUE;              --D
    attribute BUILT_IN of Nor_Bits: function is TRUE;             --D
    attribute BUILT_IN of Xor_Bits: function is TRUE;             --D
    attribute BUILT_IN of Xnor_Bits: function is TRUE;            --D
   attribute BUILT_IN of Preset_Clear: procedure is TRUE;         --D

end Bit_Utils;

