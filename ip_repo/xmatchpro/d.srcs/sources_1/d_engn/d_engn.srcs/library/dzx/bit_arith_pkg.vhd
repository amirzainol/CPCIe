--D  sccsid @(#)bit_arith.vhdl	1.3 daisy(C) 2/13/95 /files1/SCCS.model/bvhdl/vhdl_packages/dzx/src/s.bit_arith.vhdl
-------------------------------------------------------------------------------
--    File: Bit_Arith
-------------------------------------------------------------------------------

package Bit_Arith is
    
    --=============================
    -- Bit_Vector arithemetics   --
    --=============================

    ----------------------------
    -- Bit_Vector Basic Types --
    ----------------------------
    
    subtype nibble is Bit_Vector ( 3 downto 0 ) ;
    subtype byte   is Bit_Vector ( 7 downto 0 ) ;
    subtype word   is Bit_Vector (15 downto 0 ) ;
    subtype long   is Bit_Vector (31 downto 0 ) ;

    -------------------------
    -- Conversion routines --
    -------------------------

    function To_Integer    (v : Bit_Vector) return Integer;
    function To_BitVector (i : Integer) return Long;
    function To_BitVector (i, size : Integer) return Bit_Vector;

    ------------------------------
    -- Bit_Vector OP Bit_Vector --
    ------------------------------
    
    function "+" ( left , right : Bit_Vector ) return Bit_Vector ;
    function "-" ( left , right : Bit_Vector ) return Bit_Vector ;
    function "*" ( left , right : Bit_Vector ) return Bit_Vector ;
    function "/" ( left , right : Bit_Vector ) return Bit_Vector ;
    
    function "mod" ( left , right : Bit_Vector ) return Bit_Vector ;
    function "rem" ( left , right : Bit_Vector ) return Bit_Vector ;
    	
    
    ---------------------------
    -- Bit_Vector OP Integer --
    ---------------------------
	
    function "+" ( left : Bit_Vector ; right : Integer ) return Bit_Vector ;
    function "-" ( left : Bit_Vector ; right : Integer ) return Bit_Vector ;
    function "*" ( left : Bit_Vector ; right : Integer ) return Bit_Vector ;
    function "/" ( left : Bit_Vector ; right : Integer ) return Bit_Vector ;
    
    function "mod" ( left : Bit_Vector ; right : Integer ) return Bit_Vector ;
    function "rem" ( left : Bit_Vector ; right : Integer ) return Bit_Vector ;

    
    ----------------------------
    -- Integer OP Bit_Vector  --
    ----------------------------
    
    function "+" ( left : Integer ; right : Bit_Vector ) return Bit_Vector ;
    function "-" ( left : Integer ; right : Bit_Vector ) return Bit_Vector ;
    function "*" ( left : Integer ; right : Bit_Vector ) return Bit_Vector ;
    function "/" ( left : Integer ; right : Bit_Vector ) return Bit_Vector ;
    
    function "mod" ( left : Integer ; right : Bit_Vector ) return Bit_Vector ;
    function "rem" ( left : Integer ; right : Bit_Vector ) return Bit_Vector ;

    -------------------------------------------------
    -- Bit_Vector Extension & Truncation functions --
    -------------------------------------------------
    function ext      ( b : Bit_Vector ; size : Integer ) return Bit_Vector ;
    function trunc    ( b : Bit_Vector ; size : Integer ) return Bit_Vector ;
    
    --==================================
    -- SIGNED & UNSIGNED arithemetics --
    --==================================

    ------------------
    -- Basic types: --
    ------------------
    type Unsigned is array (Natural range <>) of Bit;
    type Signed is array (Natural range <>) of Bit;

    subtype UNnibble is Unsigned ( 3 downto 0 ) ;
    subtype UNbyte   is Unsigned ( 7 downto 0 ) ;
    subtype UNword   is Unsigned (15 downto 0 ) ;
    subtype UNlong   is Unsigned (31 downto 0 ) ;

    subtype SInibble is Signed ( 3 downto 0 ) ;
    subtype SIbyte   is Signed ( 7 downto 0 ) ;
    subtype SIword   is Signed (15 downto 0 ) ;
    subtype SIlong   is Signed (31 downto 0 ) ;

    ---------------------------
    -- Conversion functions: --
    ---------------------------

    function To_Integer (u : Unsigned) return Integer;
    function To_Integer (s: Signed) return Integer;

    function To_BitVector (u: Unsigned; size : Integer) return Bit_Vector;

    function To_Unsigned (i, size : Integer) return Unsigned;
    function To_Unsigned (s: Signed; size: Integer)  return Unsigned;
    function To_Unsigned (u: Unsigned; size: Integer)  return Unsigned;

    function To_Signed (i, size : Integer)  return Signed;
    function To_Signed (u : Unsigned; size : Integer) return Signed;
    function To_Signed (s: Signed; size: Integer) return Signed;

    ----------------------------------
    -- Binary arithmetic functions: --
    ----------------------------------

    function "+" (L: Unsigned; R: Unsigned) return Unsigned;
    function "+" (L: Signed;   R: Signed)   return Signed;
-- ADDED following 4 lines: BHASKER:
    function "+" (L: Signed;   R: INTEGER)   return Signed;
    function "+" (L: INTEGER;   R: Signed)   return Signed;
    function "+" (L: Unsigned;   R: INTEGER)   return Unsigned;
    function "+" (L: INTEGER;   R: Unsigned)   return Unsigned;

    function "-" (L: Unsigned; R: Unsigned) return Unsigned;
    function "-" (L: Signed;   R: Signed)   return Signed;
-- ADDED following 4 lines: BHASKER:
    function "-" (L: Signed;   R: INTEGER)   return Signed;
    function "-" (L: INTEGER;   R: Signed)   return Signed;
    function "-" (L: Unsigned;   R: INTEGER)   return Unsigned;
    function "-" (L: INTEGER;   R: Unsigned)   return Unsigned;

    function "*" (L: Unsigned; R: Unsigned) return Unsigned;
    function "*" (L: Signed; R: Signed) return Signed;

    function "/" (L: Unsigned; R: Unsigned) return Unsigned;
    function "/" (L: Signed; R: Signed) return Signed;

    function "mod" (L: Unsigned; R: Unsigned) return Unsigned;
    function "mod" (L: Signed; R: Signed) return Signed;

    function "rem" (L: Unsigned; R: Unsigned) return Unsigned;
    function "rem" (L: Signed; R: Signed) return Signed;

    ---------------------------------
    -- Unary arithmetic functions: --
    ---------------------------------

    function "-" (L: Signed) return Signed;
    function "abs" (L: Signed) return Signed;

    ---------------------------
    -- Comparison functions: --
    ---------------------------
    function "<" (L: Unsigned; R: Unsigned) return Boolean;
    function "<" (L: Signed;   R: Signed)   return Boolean;

    function "<=" (L: Unsigned; R: Unsigned) return Boolean;
    function "<=" (L: Signed;   R: Signed)   return Boolean;

    function ">=" (L: Unsigned; R: Unsigned) return Boolean;
    function ">=" (L: Signed;   R: Signed)   return Boolean;

    function ">" (L: Unsigned; R: Unsigned) return Boolean;
    function ">" (L: Signed;   R: Signed)   return Boolean;

    function "=" (L: Unsigned; R: Integer)  return Boolean;
    function "=" (L: Unsigned; R: Unsigned) return Boolean;
    function "=" (L: Signed;   R: Signed)   return Boolean;

    function "/=" (L: Unsigned; R: Unsigned) return Boolean;
    function "/=" (L: Signed;   R: Signed)   return Boolean;

    ------------------------
    -- Shift   functions: --
    ------------------------

    function Shift_Left  (u : Unsigned; size : Natural) return Unsigned;
    function Shift_Left  (s: Signed;    size : Natural) return Signed;
    function Shift_Right (u: Unsigned;  size : Natural)  return Unsigned;
    function Shift_Right (s: Signed;    size : Natural)  return Signed;

    -------------------------------
    -- preset / clear procedure: --
    -------------------------------
    procedure Preset_Clear (signal FF: out Unsigned; Pc_Value: Unsigned);
    procedure Preset_Clear (signal FF: out Signed; Pc_Value: Signed);

  -------------------------
  -- types for MacroSyn: --
  -------------------------

  type Bcd_Bit_Vector is array (Natural range <>) of Bit;
  type Johnson_Bit_Vector is array (Natural range <>) of Bit;
  type Xs_3_Bit_Vector is array (Natural range <>) of Bit;
  type Xs_3_Gray_Bit_Vector is array (Natural range <>) of Bit;

  ----------------------------------------
  -- conversion functions for MacroSyn: --
  ----------------------------------------
  function To_Integer (opd: Bcd_Bit_Vector) return Integer;
  function To_Integer (opd: Xs_3_Bit_Vector) return Integer;
  function To_Integer (opd: Xs_3_Gray_Bit_Vector) return Integer;
  function To_Integer (opd: Johnson_Bit_Vector) return Integer;


    attribute BUILT_IN: Boolean;                           --D
    attribute BUILT_IN of EXT: function is TRUE;           --D
    attribute BUILT_IN of TRUNC: function is TRUE;         --D
    attribute BUILT_IN of Shift_Left: function is TRUE;    --D
    attribute BUILT_IN of Shift_Right: function is TRUE;   --D
    attribute BUILT_IN of Preset_Clear: procedure is TRUE; --D

   attribute Built_In of To_Integer   : function is TRUE;   --D
   attribute Built_In of To_BitVector : function is TRUE;   --D
   attribute Built_In of To_Unsigned  : function is TRUE;   --D
   attribute Built_In of To_Signed    : function is TRUE;   --D

--****** 4 NEW LINES Added: BHASKER:
  function MAX (L, R: INTEGER) return INTEGER;
  function MIN (L, R: INTEGER) return INTEGER;
  
  attribute BUILT_IN of MAX: function is TRUE;
  attribute BUILT_IN of MIN: function is TRUE;

end Bit_Arith;

