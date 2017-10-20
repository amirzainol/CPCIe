
package body Bit_Arith is

    ----------------
    -- Utilities: --
    ----------------
  function Max (L, R: Integer) return Integer is
  begin
    if (L > R) then
      return L;
    else
      return R;
    end if;
  end Max;

  function Min (L, R: Integer) return Integer is
  begin
    if (L < R) then
      return L;
    else
      return R;
    end if;
  end Min;

    ----------------------------------
    -- Error Messages and Procedure --
    ----------------------------------
    
    constant LongVec   : string := "Vector is longer then 32" ;
    constant TruncSize : string := "Truncate to a bigger size" ;
    constant TruncErr  : string := "Overflow" ;
    constant ExtSize   : string := "Extension to a smaller size" ;
    constant I2bSize   : string := "Size is bigger then 32" ;
    constant OpLen     : string := "Operands are not in the same length" ;
    constant Undef     : string := "Undef bit in Dbit vector arithmetic" ;
    constant OvrflPlus : string := "Overflow occurred during a + operation; Carry ignored.";
    constant OvrflMinus: string := "Overflow occurred during a - operation; Borrow ignored.";
    constant ToBVSize  : string := "Number of bits specified is less than that of input operand: extra bits truncated.";
    constant ToUNeg    : string := "Input operand cannot be negative.";
    constant ToUBitNo  : string := "Number of bits specified is less than that of input operand: extra bits truncated.";
    constant ToUPos    : string := "Input operand must be non-negative.";
    constant ToSBitNo  : string := "Number of bits specified is less than that of input operand: extra bits truncated.";
    constant LongSize  : string := "Size of operand cannot be more than 32.";
    constant ShiftBitNo: string := "Shift: No of bits greater than or equal to operand bit width";
    constant size_9    : string := "A BCD digit cannot be more than 9.";
    constant Axcess_3_Gray : string := "An invalid Excess-3 GRAY digit.";

    procedure Message ( s : String ; v : Severity_Level) is
    begin
	    assert false report s severity v;
    end Message;
    
    

    ----------------------------------------
    -- Bit_Vector <=> Integer Conversions --
    ----------------------------------------
    
    function To_Integer ( v : Bit_Vector ) return Integer is
    begin
        return To_integer (Unsigned(v));
    end To_Integer ;
    
    function To_BitVector ( i : Integer ) return long is
    begin
        return Long(To_Unsigned(i, 32));
    end To_BitVector;
    
    
    -------------------------------------------------
    -- Bit_Vector Extension & Truncation functions --
    -------------------------------------------------
    
    function ext ( b : Bit_Vector ; size : Integer ) return Bit_Vector is
    variable ret : Bit_Vector ( size - 1 downto 0 ) ;
    begin
	if b'length > size then
	    Message (ExtSize, Error) ;
	    return (b) ;
	end if ;
    	
	ret(b'length-1 downto 0) := b ;
    	
	return(ret) ;
    end ext ;
    
    
    function trunc ( b : Bit_Vector ; size : Integer ) return Bit_Vector is
    variable ret : Bit_Vector ( size - 1 downto 0 ) ;
    variable inx: natural := 0;
    begin
	if b'length < size then
	    Message (TruncSize, Error) ;
	    return (b) ;
	end if ;
    
    	-- ret := b(size-1 downto 0) ;
	
        for I in b'reverse_range loop
           ret(inx) := b(I);
           inx := inx + 1;
           exit when inx >= size;
        end loop;

        return ret; 
    end trunc ;
    
    
    function To_BitVector ( i , size : Integer ) return Bit_Vector is
    begin
        return Bit_Vector(To_Unsigned(i, size));
    end  To_BitVector;
    
    
    ------------------------------
    -- Bit_Vector OP Bit_Vector --
    ------------------------------
    
    function "+" ( left , right : Bit_Vector ) return Bit_Vector is
    begin
      return Bit_Vector((Unsigned(left) + Unsigned(right)));
    end "+" ;
    
    function "-" ( left , right : Bit_Vector ) return Bit_Vector is
    begin
      return Bit_Vector((Unsigned(left) - Unsigned(right)));
    end "-" ;

    function "*" ( left , right : Bit_Vector ) return Bit_Vector is 
    begin
      return Bit_Vector((Unsigned(left) * Unsigned(right)));
    end "*" ;

    function "/" ( left , right : Bit_Vector ) return Bit_Vector is 
    begin
      return Bit_Vector((Unsigned(left) / Unsigned(right)));
    end "/" ;

    function "mod" ( left , right : Bit_Vector ) return Bit_Vector is
    begin
      return Bit_Vector((Unsigned(left) mod Unsigned(right)));
    end "mod" ;

    function "rem" ( left , right : Bit_Vector ) return Bit_Vector is
    begin
      return Bit_Vector((Unsigned(left) rem Unsigned(right)));
    end "rem" ;

    ---------------------------
    -- Integer OP Bit_Vector --
    ---------------------------
    
    function "+" ( left : Integer ; right : Bit_Vector ) return Bit_Vector is
    begin
    	return Bit_Vector(To_Unsigned (left, right'length) + Unsigned(right));
    end "+" ;

    function "-" ( left : Integer ; right : Bit_Vector ) return Bit_Vector is
    begin
    	return Bit_Vector(To_Unsigned(left, right'length) - Unsigned(right));
    end "-" ;

    function "*" ( left : Integer ; right : Bit_Vector ) return Bit_Vector is
    begin
    	return Bit_Vector(To_Unsigned(left, right'length) * Unsigned(right));
    end "*" ;

    function "/" ( left : Integer ; right : Bit_Vector ) return Bit_Vector is
    begin
    	return Bit_Vector(To_Unsigned (left, right'length) / Unsigned(right));
    end "/" ;

    function "mod" ( left : Integer ; right : Bit_Vector ) return Bit_Vector is
    begin
    	return Bit_Vector(To_Unsigned (left, right'length) mod Unsigned(right));
    end "mod" ;

    function "rem" ( left : Integer ; right : Bit_Vector ) return Bit_Vector is
    begin
    	return Bit_Vector(To_Unsigned (left, right'length) rem Unsigned(right));
    end "rem" ;


    ---------------------------
    -- Bit_Vector OP Integer --
    ---------------------------
    
    function "+"  ( left : Bit_Vector ; right : Integer ) return Bit_Vector is
    begin
    	return Bit_Vector(Unsigned(left) + To_Unsigned(right, left'length));
    end "+" ;

    function "-" ( left : Bit_Vector ; right : Integer ) return Bit_Vector is
    begin
    	return Bit_Vector(Unsigned(left) - To_Unsigned(right, left'length));
    end "-" ;

    function "*" ( left : Bit_Vector ; right : Integer ) return Bit_Vector is
    begin
    	return Bit_Vector(Unsigned(left) * To_Unsigned(right, left'length));
    end "*" ;

    function "/" ( left : Bit_Vector ; right : Integer ) return Bit_Vector is
    begin
    	return Bit_Vector(Unsigned(left) / To_Unsigned(right, left'length));
    end "/" ;

    function "mod" ( left : Bit_Vector ; right : Integer ) return Bit_Vector is
    begin
    	return Bit_Vector(Unsigned(left) mod To_Unsigned(right, left'length));
    end "mod" ;

    function "rem" ( left : Bit_Vector ; right : Integer ) return Bit_Vector is
    begin
    	return Bit_Vector(Unsigned(left) rem To_Unsigned(right, left'length));
    end "rem" ;

    --============================
    -- Signed/Unsigned routines --
    --============================

  function Downto_Dir (OPD: Unsigned) return Unsigned is
    variable ret: Unsigned (OPD'length-1 downto 0);
  begin
    if (OPD'left > OPD'right) then -- if already downto 
      ret := OPD;
    else
      for J in OPD'RANGE loop
        ret(OPD'right-J) := OPD(J);
      end loop;
    end if;

    return ret;
  end;

  function Downto_Dir (OPD: Signed) return Signed is
    variable ret: Signed (OPD'length-1 downto 0); 
  begin 
    if (OPD'left > OPD'right) then -- if already downto  
      ret := OPD; 
    else 
      for J in OPD'RANGE loop 
        ret(OPD'right-J) := OPD(J); 
      end loop;
    end if;
 
    return ret;
  end;

  function Get_Magnitude (OPD: Signed) return Unsigned is
    -- returns the magnitude of the input Signed operand.
    -- Input is a negative number.
    variable RET: Unsigned (OPD'length-1 downto 0);
    variable FOUND_1: BOOLEAN := FALSE;
  begin
    RET := UNSIGNED(OPD);
 
    -- Search for first 1 from right, after that complement every bit:
    for J in RET'REVERSE_RANGE loop
      if FOUND_1 then
        RET(J) := not RET(J);
      elsif RET(J) = '1' then
          FOUND_1 := TRUE;
      end if;
    end loop;
 
    return RET;
  end Get_Magnitude;
 
  function Unsigned_Plus (L: Unsigned; R: Unsigned) return Unsigned is
    -- Special Plus function: input sizes must be same and also must be
    -- downto dir, with 'right = 0, i.e. 15 downto 0 for example.
    variable CARRY: BIT := '0';
    variable SUM: Unsigned (L'left downto 0);
  begin
    for K in L'REVERSE_RANGE loop -- from 0th bit which is LSB.
      SUM(K) := L(K) xor R(K) xor CARRY;
      CARRY := (L(K) or R(K)) and (L(K) or CARRY) and (CARRY or R(K));
    end loop;
 
    if (CARRY = '1') then
        Message (OvrflPlus, Note);
    end if;

    return SUM; 
  end;

  function Signed_Plus (L: Signed; R: Signed) return Signed is
    -- Identical functionality to Unsigned_Plus function.
    -- Special Plus function: input sizes must be same and also must be
    -- downto dir, with 'right = 0, i.e. 15 downto 0 for example.
    variable CARRY: BIT := '0';
    variable LAST_CARRY: BIT := '0';
    variable SUM: Signed (L'left downto 0);
  begin
    for K in L'REVERSE_RANGE loop -- from 0th bit which is LSB.
      SUM(K) := L(K) xor R(K) xor CARRY;
      LAST_CARRY := CARRY;
      CARRY := (L(K) or R(K)) and (L(K) or CARRY) and (CARRY or R(K));
    end loop;
 
    if (CARRY /= LAST_CARRY) then
        Message (OvrflPlus, Note);
    end if;

    return SUM;
  end;

  function Unsigned_Minus (L: Unsigned; R: Unsigned) return Unsigned is
    -- Special Minus function: input sizes must be same and also must be
    -- downto dir, with 'right = 0, i.e. 15 downto 0 for example.
    variable BORROW: BIT := '0';
    variable DIFF: Unsigned (L'left downto 0);
  begin
    for K in L'REVERSE_RANGE loop -- from 0th bit which is LSB.
      DIFF(K) := L(K) xor R(K) xor BORROW;
      BORROW := (not L(K) and (BORROW or (R(K) and not BORROW))) or
                  (L(K) and R(K) and BORROW);
    end loop;

    if (BORROW  = '1') then
        Message (OvrflMinus, Note);
    end if;

    return DIFF;
  end;
 
 
  function Signed_Minus (L: Signed; R: Signed) return Signed is
    -- Identical functionality to Unsigned_Minus.
    -- Special Minus function: input sizes must be same and also must be
    -- downto dir, with 'right = 0, i.e. 15 downto 0 for example. 
    variable BORROW: BIT := '0'; 
    variable LAST_BORROW: BIT := '0'; 
    variable DIFF: Signed (L'left downto 0); 
  begin 
    for K in L'REVERSE_RANGE loop -- from 0th bit which is LSB.
      DIFF(K) := L(K) xor R(K) xor BORROW; 
      LAST_BORROW := BORROW;
      BORROW := (not L(K) and (BORROW or (R(K) and not BORROW))) or
                  (L(K) and R(K) and BORROW); 
    end loop; 
  
    if (BORROW  /= LAST_BORROW) then
        Message (OvrflMinus, Note);
    end if;

    return DIFF;
  end;

  function Less_Than (L: Signed; R: Signed) return Boolean is
    -- Special function: inputs of same size and decr range and 'right is 0.
  begin
    if (L(L'left) /= R(R'left)) then -- compare signs.
      return (L(L'left) = '1');
    end if;

    for J in L'left-1 downto 0 loop -- compae from MSB.
      if L(J) /= R(J) then
        return (R(J) = '1');
      end if;
    end loop;

    return FALSE;
  end Less_Than;

  function Less_Than_Or_Equal_To (L: Signed; R: Signed) return Boolean is
    -- Special function: inputs of same size and decr range and 'right is 0.
  begin
    if (L(L'left) /= R(R'left)) then -- compare signs. 
      return (L(L'left) = '1');
    end if; 
 
    for J in L'left-1 downto 0 loop -- compae from MSB. 
      if L(J) /= R(J) then
        return (R(J) = '1'); 
      end if; 
    end loop; 
 
    return TRUE;
  end Less_Than_Or_Equal_To;

  function EQUAL_TO (L: Signed; R: Signed) return Boolean is
    -- Special function: inputs of same size and decr range and 'right is 0.
  begin
    for J in L'RANGE loop -- start from MSB.
      if L(J) /= R(J) then
        return FALSE;
      end if;
    end loop;
  
    return TRUE;
  end EQUAL_TO;

    ---------------------------
    -- Conversion functions: --
    ---------------------------

    function To_Integer (u: Unsigned) return Integer is
      variable ret: Integer;
    begin
      -- First check if size of input is less than 32 bits, the Max int value.
        if (u'length >= 32) then
            Message (LongVec, Error);
        end if;

      ret := 0;
      -- Remember: leftmost is MSB; DO NOT go by index value of u, i.e u(0)
      -- may also be the MSB.
 
      for M3 in u'RANGE loop -- Start from MSB first.
        ret := ret * 2;

        if u(M3) = '1' then
          ret := ret + 1;
        end if;
      end loop;

      return ret;
    end To_Integer;

    
    function To_Integer (s: Signed) return Integer is
      variable ret: Integer;
    begin
      -- First check if size of input is less than 32 bits, the Max int value.
      if (s'length >= 32) then
          Message (LongVec , Error);
      end if;

      ret := 0; 
 
      for M3 in s'RANGE loop
        ret := ret * 2;

        if s(M3) = '1' then
          ret := ret + 1;
        end if;
      end loop;

      -- now check if it was a Positive or a negative number.
      if (s(s'left) = '1') then -- Negative number: take 2's complement.
        ret := ret - 2 ** s'length;
      end if; -- If Positive, ret already contains the correct result.

      return ret; 
    end;

    function To_BitVector (u: Unsigned; size: Integer) 
        return Bit_Vector is
    variable ret: Bit_Vector (size-1 downto 0) := (others => '0');
    constant Min_BITS: Integer := Min (u'length, size) - 1;
    variable TEMP: Unsigned (u'length-1 downto 0);
  begin
      if (u'length > size) then
          Message (ToBVSize, Note);
      end if;

    TEMP := Unsigned (Downto_Dir (u));

    for I in 0 to Min_BITS loop
      ret(I) := TEMP(I);
    end loop;

    return ret;
  end;

  function To_Unsigned (i, size : Integer) 
      return Unsigned is

    variable M1: Integer;
    variable ret : Unsigned(size-1 downto 0) := (others => '0');
  begin
    -- Input must be Positive.
      if (i < 0) then
          Message (ToUNeg, Error);
      end if;

    M1 := i;

    for J in ret'REVERSE_RANGE loop -- LSB first.
      if (M1 mod 2) = 1 then
        ret(J) := '1';
      else
        ret(J) := '0';
      end if;

      -- exit when (J = ret'left);
      M1 := M1 / 2;
    end loop;

    if (M1 /= 0) then
        Message (ToUBitNo, Note);
    end if;

    return ret;
  end;

  function To_Unsigned (s: Signed; size : Integer)  
      return Unsigned is
    variable ret : Unsigned(size-1 downto 0) := (others => '0');
    constant Min_BITS: Integer := Min (s'length, size) - 1;
    variable TEMP: Unsigned (s'length-1 downto 0);
  begin
    -- Input cannot be a negative value.
    if (s(s'left) = '1') then
      Message (ToUPos, Error);
    end if;

    -- Truncated if no of bits are less.
    if (s'length > size) then
       Message (ToUBitNo, Note);
    end if;

    TEMP := Unsigned (Downto_Dir (s));
    ret (Min_BITS downto 0) := TEMP (Min_BITS downto 0);

    return ret;
  end;

  function To_Unsigned (u: Unsigned; size: Integer)  
      return Unsigned is
    variable ret : Unsigned(size-1 downto 0) := (others => '0');
    constant Min_BITS: Integer := Min (u'length, size) - 1;
    variable TEMP: Unsigned (u'length-1 downto 0);
  begin
      if (u'length > size) then
         Message (ToUBitNo, Note);
      end if;

    TEMP := Unsigned (Downto_Dir (u));
    ret (Min_BITS downto 0) := TEMP (Min_BITS downto 0);

    return ret;
  end;

  function To_Signed (i, size: Integer)  return Signed is
    variable M1: Integer;
    variable ret : Signed(size-1 downto 0) := (others => '0');
   
  begin
    -- If input is negative, get its 2's complement int value which
    -- is 2 ** size - ABS(i).

    M1 := abs (i);

    for J in ret'REVERSE_RANGE loop -- from LSB.
      if (M1 mod 2) = 1 then
        ret(J) := '1';
      else
        ret(J) := '0';
      end if;

      -- exit when (J = ret'left);
      M1 := M1 / 2;
    end loop;

    if (M1 /= 0) then
      Message (ToSBitNo, Note);
    end if;

    -- if -ve value, complement and add 1.
    if (i < 0) then
--      ret := Get_Twos_Complement (ret);
      ret := -ret;
    else -- make sure the leftmost bit is a zero; since +ve number; number
         -- that is same size as no-of-bits will therefore get truncated.
      if (ret(ret'left) = '1') then
        Message (ToSBitNo, Note);
      end if;

      ret(ret'left) := '0';
    end if;

    return ret;
  end;

  function To_Signed (u: Unsigned; size: Integer) return Signed is
    variable ret : Signed(size-1 downto 0) := (others => '0');
    constant Min_BITS: Integer := Min (u'length, size) - 1;
    variable TEMP: Signed(u'length-1 downto 0);
  begin
    if (u'length > size) then
      Message(ToSBitNo, Note);
    end if;


    TEMP := Signed (Downto_Dir(u));
    ret(Min_BITS downto 0) := TEMP (Min_BITS downto 0);
    -- Make sure left most bit is zero, since orig was an Unsigned number.
    ret(ret'left) := '0';
 
    return ret;
  end;

  function To_Signed (s: Signed; size: Integer) return Signed is
    variable ret : Signed(size-1 downto 0) := (others => s(s'left));
    constant Min_BITS: Integer := Min (s'length, size) - 1;
    variable TEMP: Signed(s'length-1 downto 0);
  begin
    if (s'length > size) then
      Message (ToSBitNo, Note);
    end if;

    TEMP := Downto_Dir(s);
    ret(Min_BITS downto 0) := TEMP (Min_BITS downto 0);

    return ret;
  end;

    ----------------------------------
    -- Binary arithmetic functions: --
    ----------------------------------

  function "+" (L: Unsigned; R: Integer)  return Unsigned is
    constant size: Integer := L'length;
    variable new_r: Unsigned (size-1 downto 0);
    variable new_l: Unsigned (size-1 downto 0);
  begin
    new_l := To_Unsigned (L, size);
    new_r := To_Unsigned (R, size);

    return (Unsigned_Plus (new_l, new_r));
  end;

  function "+" (L: Unsigned; R: Unsigned) return Unsigned is
    constant size: Integer := Max(L'length, R'length);
    variable new_r: Unsigned (size-1 downto 0);
    variable new_l: Unsigned (size-1 downto 0);
  begin
    new_l := To_Unsigned (L, size);
    new_r := To_Unsigned (R, size);

    return (Unsigned_Plus (new_l, new_r));
  end;

  function "+" (L: Signed;   R: Signed)   return Signed is
    constant size: Integer := Max(L'length, R'length);
    variable new_r: Signed (size-1 downto 0);
    variable new_l: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);

    return (Signed_Plus (new_l, new_r));
  end;

-- Next 3 functions added: BHASKER:
  function "+" (L: Integer; R: Unsigned)  return Unsigned is
  begin
    return ("+"(R, L));
  end;

  function "+" (L: Signed;   R: Integer)   return Signed is
    constant size: Integer := L'length;
    variable new_r: Signed (size-1 downto 0);
    variable new_l: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);

    return (Signed_Plus (new_l, new_r));
  end;

  function "+" (L: Integer; R: Signed)  return Signed is
  begin
    return ("+"(R, L));
  end;

  function "-" (L: Unsigned; R: Unsigned) return Unsigned is
    constant size: Integer := Max (L'length, R'length);
    variable new_r: Unsigned (size-1 downto 0);
    variable new_l: Unsigned (size-1 downto 0);
  begin
    new_l := To_Unsigned (L, size);
    new_r := To_Unsigned (R, size);

    return (Unsigned_Minus(new_l, new_r));
  end;

  function "-" (L: Signed;   R: Signed)   return Signed is
    constant size: Integer := Max (L'length, R'length);
    variable new_r: Signed (size-1 downto 0);
    variable new_l: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);

    return (Signed_Minus(new_l, new_r));
  end;

-- Next 4 functions added: BHASKER:
  function "-" (L: Unsigned; R: Integer) return Unsigned is
    constant size: Integer := L'length;
    variable new_r: Unsigned (size-1 downto 0);
    variable new_l: Unsigned (size-1 downto 0);
  begin
    new_l := To_Unsigned (L, size);
    new_r := To_Unsigned (R, size);

    return (Unsigned_Minus(new_l, new_r));
  end;

  function "-" (L: Integer; R: Unsigned) return Unsigned is
    constant size: Integer := R'length;
    variable new_r: Unsigned (size-1 downto 0);
    variable new_l: Unsigned (size-1 downto 0);
  begin
    new_l := To_Unsigned (L, size);
    new_r := To_Unsigned (R, size);

    return (Unsigned_Minus(new_l, new_r));
  end;

  function "-" (L: Signed;   R: Integer)   return Signed is
    constant size: Integer := L'length;
    variable new_r: Signed (size-1 downto 0);
    variable new_l: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);

    return (Signed_Minus(new_l, new_r));
  end;

  function "-" (L: Integer; R: Signed) return Signed is
    constant size: Integer := R'length;
    variable new_r: Signed (size-1 downto 0);
    variable new_l: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);

    return (Signed_Minus(new_l, new_r));
  end;

  function "*" (L: Unsigned; R: Unsigned) return Unsigned is
    variable res, tmp_L: Unsigned (L'length+R'length-1 downto 0) 
                         := (others => '0');
  begin
    tmp_L(L'length-1 downto 0) := L;

    for J in R'REVERSE_RANGE loop -- Start from LSB.
      if R(J) = '1' then -- add tmp_L to res.
        res := res + tmp_L;
      end if;

    -- tmp_L := tmp_L(tmp_L'length-2 downto 0) & '0'; -- left shift tmp_L.
      tmp_L(tmp_L'length-1 downto 1) := tmp_L(tmp_L'length-2 downto 0);
      tmp_L(0) := '0'; -- left shift tmp_L.
    end loop;

    return res;
  end;

  function "*" (L: Signed;   R: Signed)   return Signed is
    variable ret: Signed (L'length+R'length-1 downto 0) := (others => '0');
    variable TR: Unsigned (R'length-1 downto 0) := (others => '0');
    variable TL: Unsigned (L'length-1 downto 0) := (others => '0');
    variable UL: Unsigned (L'length-1 downto 0);
    variable UR: Unsigned (R'length-1 downto 0);
   
  begin
    if (L(L'left) = '1') then
      TL := Get_Magnitude (L);
    else
--      if (L'left > L'right) then
 --       TL := L (L`left-1 downto L'right);
  --    else
   --     TL := L (L'left+1 to L'right);
    --  end if;
      UL := To_Unsigned(L, L'length);
      TL := UL (TL'RANGE);
    end if;

    if (R(R'left) = '1') then
      TR := Get_Magnitude (R);
    else
      UR := To_Unsigned (R, R'length);
      TR := UR (TR'RANGE);
    end if;

    ret := To_Signed (TL * TR, ret'length);

    -- add sign now.
    if ((L(L'left) = '0') and (R(R'left) = '1')) or
       ((L(L'left) = '1') and (R(R'left) = '0')) then
--      ret := Get_Twos_Complement (ret);
      ret := -ret;
    end if;
    
    return ret;
  end;

  function "/" (L: Unsigned; R: Unsigned) return Unsigned is 
    variable res: Unsigned (L'length-1 downto 0) := (others => '0');
    variable TL, TR: Integer;
  begin
    if (not (L'length < 32 and R'length < 32)) then
      Message (LongSize, Error);
    end if;

  -- assert L'length < 32 and R'length < 32
      --report "Unsigned / Unsigned: Number of bits in operand cannot be more than 32."
      --severity ERROR;

    TL := To_Integer (L);
    TR := To_Integer (R);
    res := To_Unsigned ((TL / TR), res'length);

    return res;
  end; 
  
  function "/" (L: Signed;   R: Signed)   return Signed is 
    variable res: Signed (L'length-1 downto 0) := (others => '0');
    variable TL, TR: Integer;
  begin
    if (not (L'length < 32 and R'length < 32)) then
      Message (LongSize, Error);
    end if;

    TL := To_Integer (L);
    TR := To_Integer (R);
    res := To_Signed ((TL / TR), res'length);
 
    return res;
  end; 
 
  function "mod" (L: Unsigned; R: Unsigned) return Unsigned is 
    variable res: Unsigned (R'length-1 downto 0) := (others => '0');
    variable TL, TR: Integer;
  begin
    if (not (L'length < 32 and R'length < 32)) then
      Message (LongSize, Error);
    end if;

    TL := To_Integer (L);
    TR := To_Integer (R);
    res := To_Unsigned ((TL mod TR), res'length);
 
    return res;
  end; 
  
  function "mod" (L: Signed;   R: Signed)   return Signed is 
    variable res: Signed (R'length-1 downto 0) := (others => '0');
    variable TL, TR: Integer;
  begin
    if (not (L'length < 32 and R'length < 32)) then
      Message (LongSize, Error);
    end if;

    TL := To_Integer (L);
    TR := To_Integer (R);
    res := To_Signed ((TL mod TR), res'length);

    return res; 
  end; 
 
  function "rem" (L: Unsigned; R: Unsigned) return Unsigned is 
    variable res: Unsigned (R'length-1 downto 0) := (others => '0');
    variable TL, TR: Integer;
  begin
    if (not (L'length < 32 and R'length < 32)) then
      Message (LongSize, Error);
    end if;

    TL := To_Integer (L);
    TR := To_Integer (R);
    res := To_Unsigned ((TL rem TR), res'length);

    return res;
  end; 
  
  function "rem" (L: Signed;   R: Signed)   return Signed is 
    variable res: Signed (R'length-1 downto 0) := (others => '0'); 
    variable TL, TR: Integer; 
  begin
    if (not (L'length < 32 and R'length < 32)) then
      Message (LongSize, Error);
    end if;

    TL := To_Integer (L);
    TR := To_Integer (R); 
    res := To_Signed ((TL rem TR), res'length); 
 
    return res; 
  end; 
 
  function "-" (L: Signed) return Signed is
    variable ret, ZERO: Signed (L'length-1 downto 0) := (others => '0');
  begin
    ret := ZERO - L;
    return ret;
  end;


  function "abs" (L: Signed) return Signed is
    variable ret: Signed (L'length-1 downto 0) := (others => '0');
  begin
    if (L(L'left) = '1') then -- if negative number.
      ret := To_Signed(Get_Magnitude(L), ret'length);
    else -- Positive number;
      ret := L;
    end if;

    return ret;
  end;


  function "<" (L: Unsigned; R: Unsigned) return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size downto 0);
    variable new_r: Signed (size downto 0);
  begin
    new_l := To_Signed (L, size+1); -- pad 1 zero.
    new_r := To_Signed (R, size+1); 
    
    return (Less_Than (new_l, new_r));
  end;


  function "<" (L: Signed;   R: Signed)   return Boolean is
    constant size: Integer := Max (L'length, R'length); 
    variable new_l: Signed (size-1 downto 0); 
    variable new_r: Signed (size-1 downto 0); 
  begin
    new_l := To_Signed (L, size); 
    new_r := To_Signed (R, size); 
     
    return (Less_Than (new_l, new_r));
  end;
 
  function "<=" (L: Unsigned; R: Unsigned) return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size downto 0);
    variable new_r: Signed (size downto 0);
  begin
    new_l := To_Signed (L, size+1); -- pad 1 zero.
    new_r := To_Signed (R, size+1);

    return (Less_Than_Or_Equal_To (new_l, new_r));
  end;

  function "<=" (L: Signed;   R: Signed)   return Boolean is
    constant size: Integer := Max (L'length, R'length); 
    variable new_l: Signed (size-1 downto 0); 
    variable new_r: Signed (size-1 downto 0); 
  begin
    new_l := To_Signed (L, size); 
    new_r := To_Signed (R, size); 
 
    return (Less_Than_Or_Equal_To (new_l, new_r)); 
  end; 

  function ">=" (L: Unsigned; R: Unsigned) return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size downto 0);
    variable new_r: Signed (size downto 0);
  begin
    new_l := To_Signed (L, size+1); -- pad 1 zero.
    new_r := To_Signed (R, size+1);

    return (Less_Than_Or_Equal_To (new_r, new_l));
  end;

  function ">=" (L: Signed;   R: Signed)   return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size-1 downto 0);
    variable new_r: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);
 
    return (Less_Than_Or_Equal_To (new_r, new_l));
  end;
   
  function ">" (L: Unsigned; R: Unsigned) return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size downto 0);
    variable new_r: Signed (size downto 0);
  begin
    new_l := To_Signed (L, size+1); -- pad 1 zero.
    new_r := To_Signed (R, size+1);

    return (Less_Than (new_r, new_l));
  end;

  function ">" (L: Signed;   R: Signed)   return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size-1 downto 0);
    variable new_r: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);
 
    return (Less_Than (new_r, new_l));
  end;
   
  function "=" (L: Unsigned; R: Integer)  return Boolean is
    constant size: Integer := L'length;
    variable new_l: Signed (size downto 0);
    variable new_r: Signed (size downto 0);
  begin
    new_l := To_Signed (L, size+1); -- pad 1 zero.
    new_r := To_Signed (R, size+1);

    return (EQUAL_TO (new_l, new_r));
  end;

  function "=" (L: Unsigned; R: Unsigned) return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size downto 0);
    variable new_r: Signed (size downto 0);
  begin
    new_l := To_Signed (L, size+1); -- pad 1 zero.
    new_r := To_Signed (R, size+1);

    return (EQUAL_TO (new_l, new_r));
  end;

  function "=" (L: Signed;   R: Signed)   return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size-1 downto 0);
    variable new_r: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);

    return (EQUAL_TO (new_l, new_r));
  end;

  function "/=" (L: Unsigned; R: Unsigned) return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size downto 0);
    variable new_r: Signed (size downto 0);
  begin
    new_l := To_Signed (L, size+1); -- pad 1 zero.
    new_r := To_Signed (R, size+1);

    return (not EQUAL_TO (new_l, new_r));
  end;

  function "/=" (L: Signed;   R: Signed)   return Boolean is
    constant size: Integer := Max (L'length, R'length);
    variable new_l: Signed (size-1 downto 0);
    variable new_r: Signed (size-1 downto 0);
  begin
    new_l := To_Signed (L, size);
    new_r := To_Signed (R, size);

    return (not EQUAL_TO (new_l, new_r));
  end;

  ----------------------
  -- Shift functions: --
  ----------------------

  function Shift_Left  (u: Unsigned; size: Natural)  return Unsigned is
    variable tmp, ret: Unsigned (u'length-1 downto 0) := (others => '0');
  begin
    if (size >= u'length) then
      Message (ShiftBitNo, Error);
    end if;

    tmp := Downto_Dir (u);
    ret(tmp'left downto size) := tmp ((tmp'left-size) downto 0);
    return ret;
  end;

  function Shift_Left  (s: Signed;   size: Natural)  return Signed is
    variable tmp, ret: Signed (s'length-1 downto 0) := (others => '0');
  begin
    if (size >= s'length-1) then
      Message (ShiftBitNo, Error);
    end if;

    tmp := Downto_Dir (s);
    ret((tmp'left-1) downto size) := tmp ((tmp'left-1-size) downto 0);
    --Jb Sign bit no longer being retained: Aug 18 '93:
    -- ret(tmp'left) := s(s'left); -- copy sign bit.
    return ret;
  end;

  function Shift_Right (u: Unsigned; size: Natural)  return Unsigned is
    variable tmp, ret: Unsigned (u'length-1 downto 0) := (others => '0');
  begin
    if (size >= u'length) then
      Message (ShiftBitNo, Error);
    end if;

    tmp := Downto_Dir (u);
    ret((tmp'left-size) downto 0) := tmp (tmp'left downto size);
    return ret;
  end;

  function Shift_Right (s: Signed; size : Natural)  return Signed is
    variable tmp, ret: Signed (s'length-1 downto 0) := (others => s(s'left));
  begin
    if (size >= s'length-1) then
      Message (ShiftBitNo, Error);
    end if;

    tmp := Downto_Dir (s);
    ret((tmp'left-1-size) downto 0) := tmp ((tmp'left-1) downto size);
    ret(tmp'left) := s(s'left); -- copy sign bit.
    return ret;
  end;

   -------------------------------
   -- preset / clear procedure: --
   -------------------------------
    procedure Preset_Clear (signal FF: out Unsigned; Pc_Value: Unsigned) is
    begin
      FF <= Pc_Value;
    end;

    procedure Preset_Clear (signal FF: out Signed; Pc_Value: Signed) is
    begin
      FF <= Pc_Value;
    end;

  --------------------------------------------------
  -- Conversion functions for FDS2 (provided by IG):
  --------------------------------------------------
  function To_Integer (OPD: BCD_BIT_VECTOR) return INTEGER is
    variable TEMP: INTEGER;               -- returning integer
    variable BCD_INDEX_COUNTER: INTEGER;  -- for BCD 4-bit counting(0 - 3)
    variable BCD_DIGIT: INTEGER;          -- BCD digit (0 - 9)
    variable BCD_WEIGHT: INTEGER;         -- weight for decimal digit(1, 10, ..)
  begin
    -- First check if size of input is less than 32 bits, the max int value.
    if (OPD'LENGTH >= 32) then
      Message(LongSize, Error);
    end if;
 
    TEMP := 0;                               
    BCD_INDEX_COUNTER := 0;
    BCD_DIGIT := 0;
    BCD_WEIGHT := 1;                          -- weight initial value 
     
    -- Remember: leftmost is MSB; DO NOT go by index value of OPD, i.e OPD(0)
    -- may also be the MSB.
    for M3 in OPD'REVERSE_RANGE loop          -- scanning from the index 0 to n
      if OPD(M3) = '1' then
        -- BCD digit calculation
        BCD_DIGIT := BCD_DIGIT + (2 ** BCD_INDEX_COUNTER);
      end if;
      
      BCD_INDEX_COUNTER := BCD_INDEX_COUNTER + 1;

      if BCD_INDEX_COUNTER = 4   then             -- four bits are scanned?
        if (BCD_DIGIT >= 10) then                  -- invalid BCD digit?
          Message (Size_9, Error);
        end if;

        TEMP := TEMP + (BCD_DIGIT * BCD_WEIGHT);  -- add integer to TEMP
        BCD_INDEX_COUNTER := 0;           -- reinitialize the BCD 4-bit counter
        BCD_DIGIT := 0;                   -- reinitialize the BCD digit
        BCD_WEIGHT := BCD_WEIGHT * 10;    -- weight is adjusted for next digit
      end if;
    end loop;
 
    return TEMP;
  end To_Integer;

  function To_Integer (OPD: XS_3_BIT_VECTOR) return INTEGER is
    variable TEMP: INTEGER;               -- returning integer
    variable XS_3_INDEX_COUNTER: INTEGER; -- for XS_3 4-bit counting(0 - 3)
    variable XS_3_DIGIT: INTEGER;         -- XS_3 digit (0 - 9)
    variable XS_3_WEIGHT: INTEGER;        -- weight for decimal digit(1, 10, ..)
  begin
    -- First check if size of input is less than 32 bits, the max int value.
    if (OPD'LENGTH > 32) then
      Message (LongSize, Error);
    end if;
 
    TEMP := 0;                               
    XS_3_INDEX_COUNTER := 0;
    XS_3_DIGIT := 0;
    XS_3_WEIGHT := 1;                          -- weight initial value 
     
    -- Remember: leftmost is MSB; DO NOT go by index value of OPD, i.e OPD(0)
    -- may also be the MSB.
    for M3 in OPD'REVERSE_RANGE loop          -- scanning from the index 0 to n
      -- XS_3 digit (3 - 12, due to the excesse 3) calculation
      if OPD(M3) = '1' then
        XS_3_DIGIT := XS_3_DIGIT + (2 ** XS_3_INDEX_COUNTER);   
      end if;
      
      XS_3_INDEX_COUNTER := XS_3_INDEX_COUNTER + 1;

      if XS_3_INDEX_COUNTER = 4   then             -- four bits are scanned?
        XS_3_DIGIT := XS_3_DIGIT -3;               -- correction the excess-3

        if (XS_3_DIGIT >= 10) then                  -- invalid XS_3 digit?
          Message (Size_9, Error);
        end if;
        
        TEMP := TEMP + (XS_3_DIGIT * XS_3_WEIGHT); -- add integer to TEMP
        XS_3_INDEX_COUNTER := 0;        -- reinitialize the XS_3 4-bit counter
        XS_3_DIGIT := 0;                -- reinitialize the XS_3 digit
        XS_3_WEIGHT := XS_3_WEIGHT * 10; -- weight is adjusted for next digit
      end if;
    end loop;
 
    return TEMP;
  end To_Integer;

  function To_Integer (OPD: XS_3_GRAY_BIT_VECTOR) return INTEGER is
    variable TEMP: INTEGER;               -- returning integer
    variable XS_3_GRAY_INDEX_COUNTER: INTEGER; -- for XS_3_GRAY 4-bit counting(0 - 3)
    variable XS_3_GRAY_DIGIT: INTEGER;    -- XS_3_GRAY digit (0 - 9)
    variable XS_3_GRAY_WEIGHT: INTEGER;   -- weight for decimal digit(1, 10, ..)
 --   variable XS_3_GRAY_INPUTS: BIT_VECTOR(3 downto 0);  -- 4-bit input segment
  begin
    -- First check if size of input is less than 32 bits, the max int value.
    if (OPD'LENGTH > 32) then
      Message (LongSize, Error);
    end if;
 
    TEMP := 0;                               
    XS_3_GRAY_INDEX_COUNTER := 0;
    XS_3_GRAY_DIGIT := 0;
    XS_3_GRAY_WEIGHT := 1;                          -- weight initial value 
     
    -- Remember: leftmost is MSB; DO NOT go by index value of OPD, i.e OPD(0)
     -- may also be the MSB.
    for M3 in OPD'REVERSE_RANGE loop          -- scanning from the index 0 to n
      XS_3_GRAY_INDEX_COUNTER := XS_3_GRAY_INDEX_COUNTER + 1;
      
      if XS_3_GRAY_INDEX_COUNTER = 4   then        -- four bits are scanned?

----------------------------------------------------------------------------
       if OPD(M3)='0' and OPD(M3-1)='0' and OPD(M3-2)='1' and OPD(M3-3)='0' then
          XS_3_GRAY_DIGIT := 0;
       elsif OPD(M3)='0' and OPD(M3-1)='1' and OPD(M3-2)='1' and OPD(M3-3)='0' then
          XS_3_GRAY_DIGIT := 1;
       elsif OPD(M3)='0' and OPD(M3-1)='1' and OPD(M3-2)='1' and OPD(M3-3)='1' then
          XS_3_GRAY_DIGIT := 2;
       elsif OPD(M3)='0' and OPD(M3-1)='1' and OPD(M3-2)='0' and OPD(M3-3)='1' then
          XS_3_GRAY_DIGIT := 3;
       elsif OPD(M3)='0' and OPD(M3-1)='1' and OPD(M3-2)='0' and OPD(M3-3)='0' then
          XS_3_GRAY_DIGIT := 4;
       elsif OPD(M3)='1' and OPD(M3-1)='1' and OPD(M3-2)='0' and OPD(M3-3)='0' then
          XS_3_GRAY_DIGIT := 5;
       elsif OPD(M3)='1' and OPD(M3-1)='1' and OPD(M3-2)='0' and OPD(M3-3)='1' then
          XS_3_GRAY_DIGIT := 6;
       elsif OPD(M3)='1' and OPD(M3-1)='1' and OPD(M3-2)='1' and OPD(M3-3)='1' then
          XS_3_GRAY_DIGIT := 7;
       elsif OPD(M3)='1' and OPD(M3-1)='1' and OPD(M3-2)='1' and OPD(M3-3)='0' then
          XS_3_GRAY_DIGIT := 8;
       elsif OPD(M3)='1' and OPD(M3-1)='0' and OPD(M3-2)='1' and OPD(M3-3)='0' then
          XS_3_GRAY_DIGIT := 9;
       else               -- invalid XS_3_GRAY digit!
            Message (Axcess_3_Gray, Error);
       end if;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--   This routine was replaced with above code because
--    DAZIX dvhdl does not support '&' operator
--
--        XS_3_GRAY_INPUTS := OPD(M3)&OPD(M3-1)&OPD(M3-2)&OPD(M3-3);
--
--        case XS_3_GRAY_INPUTS is
--          when "0010" => XS_3_GRAY_DIGIT := 0;
--          when "0110" => XS_3_GRAY_DIGIT := 1;
--          when "0111" => XS_3_GRAY_DIGIT := 2;
--          when "0101" => XS_3_GRAY_DIGIT := 3;
--          when "0100" => XS_3_GRAY_DIGIT := 4;
--          when "1100" => XS_3_GRAY_DIGIT := 5;
--          when "1101" => XS_3_GRAY_DIGIT := 6;
--          when "1111" => XS_3_GRAY_DIGIT := 7;
--          when "1110" => XS_3_GRAY_DIGIT := 8;
--          when "1010" => XS_3_GRAY_DIGIT := 9;
--          when others => assert FALSE     -- invalid XS_3_GRAY digit!
--                           report "CONV_TO_INT: An invalid Excess-3 GRAY digit."
--                           severity ERROR;
--        end case;
----------------------------------------------------------------------------


        TEMP := TEMP + (XS_3_GRAY_DIGIT * XS_3_GRAY_WEIGHT); -- add integer to TEMP
        XS_3_GRAY_INDEX_COUNTER := 0; -- reinitialize the XS_3_GRAY 4-bit counter
        XS_3_GRAY_DIGIT := 0;             -- reinitialize the XS_3_GRAY digit
        XS_3_GRAY_WEIGHT := XS_3_GRAY_WEIGHT * 10;  -- weight is adjusted for next digit
      end if;
    end loop;
 
    return TEMP;
  end To_Integer;

  function To_Integer (OPD: JOHNSON_BIT_VECTOR) return INTEGER is
    variable TEMP: INTEGER;                      -- returning integer
    variable JOHNSON_ONE_COUNTER: INTEGER;       -- for counting ones
    variable JOHNSON_ZERO_COUNTER: INTEGER;      -- for counting zeros
  begin
    -- First check if size of input is less than 32 bits, the max int value.
    assert (OPD'LENGTH < 32)
      report "CONV_TO_INT: Number of bits in input operand cannot be more than 32."
      severity ERROR;
 
    TEMP := 0;                               
    JOHNSON_ONE_COUNTER := 0;
    JOHNSON_ZERO_COUNTER := 0;
     
    -- Remember: leftmost is MSB; DO NOT go by index value of OPD, i.e OPD(0)
    -- may also be the MSB.
    for M3 in OPD'REVERSE_RANGE loop          -- scanning from the index 0 to n
      if OPD(M3) = '1' then
        JOHNSON_ONE_COUNTER := JOHNSON_ONE_COUNTER +1;
      else
        JOHNSON_ZERO_COUNTER := JOHNSON_ZERO_COUNTER +1;
      end if;
    end loop;

    if JOHNSON_ONE_COUNTER = 0  then 
      TEMP := 0;
    elsif OPD(OPD'LOW) = '1'    then 
      TEMP := JOHNSON_ONE_COUNTER;
    else  
      TEMP := OPD'LENGTH + JOHNSON_ZERO_COUNTER;
    end if;
 
    return TEMP;
  end To_Integer;

end Bit_Arith;
 


