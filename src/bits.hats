// bitfields
// unpack(x, o, s) unpacks [s] bits starting at [o] from [x]
// fun unpack(x:uint, start: Nat, bits: intGt(0)): uint =
macdef bitset_read (x, start, bits) = let
  val mask = g0uint_lsl (0x1u, ,(bits)) - 1u
in
  g0uint_land (g0uint_lsr(,(x), ,(start)), mask)
end
// pack (x, y, o, s) packs [s] first bits of [y] into [x] starting at [o]
// fun pack(x:uint, y:int, start:Nat, bits: intGt(0)): uint =
macdef bitset_write (x, y, start, bits) = let
  val mask = g0uint_lsl (0x1u, ,(bits)) - 1u
  val x = g0uint_land (,(x), g0uint_lnot (g0uint_lsl (mask, ,(start))))
in
  g0uint_lor (x, g0uint_lsl (g0uint_land(g0int2uint ,(y), mask), ,(start)))
end

// for bit flags
// flag_read (x:uint, ofs: intGt(0)): bool <-- is flag at [ofs] iset
// flag_write (x:uint, ofs: intGt(0), b:bool): uint <-- set flag at [ofs] to [b]
macdef flag_read (x, ofs) = (bitset_read (,(x), ,(ofs), 1)) > 0
macdef flag_write (x, ofs, b) = bitset_write (,(x), bool2int(,(b)), ,(ofs), 1)
