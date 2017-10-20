
 --D  sccsid @(#)bit_utils-body.vhdl	1.2 daisy(C) 2/13/95 /files1/SCCS.model/bvhdl/vhdl_packages/dzx/src/s.bit_utils-body.vhdl
-------------------------------------------------------------------------------
--    File: Bit_Utils
--
-------------------------------------------------------------------------------

package body Bit_Utils is
  -- contains the subprogram definitions for subprograms declared above.

    ---------------------------------------------------------------------
    -- rising, falling clock edge and clock level detection functions: --
    ---------------------------------------------------------------------

    function Rising_Edge (signal clock_name: Bit) return Boolean is
    begin
      return (clock_name = '1') and (clock_name'event);
    end Rising_Edge;

    function Falling_Edge (signal clock_name: Bit) return Boolean is
    begin
      return (clock_name = '0') and (clock_name'event);
    end Falling_Edge;

    function High_Level (signal clock_name: Bit) return Boolean is
    begin
      return (clock_name = '1');
    end High_Level;

    function Low_Level (signal clock_name: Bit) return Boolean is
    begin
      return (clock_name = '0');
    end Low_Level;

    -------------------------
    -- Conversion routines --
    -------------------------

    function To_Bit (b: Boolean) return Bit is
    begin
      case b is
        when FALSE => return '0';
        when TRUE  => return '1';
      end case;
    end To_Bit;
 
    function To_Char (l: Bit) return Character is
    begin
      case l is
        when '0' => return '0';
        when '1' => return '1';
      end case;
    end To_Char;
 
    function To_String (v: Bit_Vector) return String is
      variable ret: String (v'range);
    begin
      for j in ret'range loop
        ret(j) := To_Char(v(j));
      end loop;
 
      return ret;
    end To_String;


  -----------------------------------
  -- Boolean reduction functions:  --
  -----------------------------------
  function And_Bits (v: Bit_Vector) return Bit is
    variable ret: Bit :='1';
  begin
    for j in  v'range loop
      ret := ret and v(j);
    end loop;

    return ret;
  end And_Bits;

  function Nand_Bits (v: Bit_Vector) return Bit is
  begin
    return (not And_Bits(v));
  end Nand_Bits;

  function Or_Bits (v: Bit_Vector) return Bit is
    variable ret: Bit := '0';
  begin
    for j in v'range loop
      ret := ret or v(j);
    end loop;

    return ret;
  end Or_Bits;

  function Nor_Bits (v: Bit_Vector) return Bit is
  begin
    return (not Or_Bits(v));
  end Nor_Bits;

  function Xor_Bits (v: Bit_Vector) return Bit is
    variable ret: Bit := '0';
  begin
    for j in v'range loop
      ret := ret xor v(j);
    end loop;

    return ret;
  end Xor_Bits;

  function Xnor_Bits (v: Bit_Vector) return Bit is
  begin
    return (not Xor_Bits (v));
  end Xnor_Bits;

  -- preset / clear procedure:
  procedure PRESET_CLEAR (signal FF: out BIT_VECTOR; PC_VALUE: BIT_VECTOR) is
  begin
    FF <= PC_VALUE;
  end;

  procedure PRESET_CLEAR (signal FF: out BIT; PC_VALUE: BIT) is
  begin
    FF <= PC_VALUE;
  end;

end Bit_Utils;


