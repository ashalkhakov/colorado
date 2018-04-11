#include
"share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./colorado.sats"

#define BITS_COLOR 4

#define MASK_COLOR 0xf
#define MASK_BIT 0x1

#define OFS_FG 0
#define OFS_BG 4
#define OFS_BOLD 8
#define OFS_FAINT 9
#define OFS_ITALIC 10
#define OFS_UNDERLINE 11
#define OFS_CROSSOUT 12
#define OFS_REVERSE 13

#include "./bits.hats"

assume colorado = uint

implement{}
reset () = 0u
implement{}
foreground (x, y) = bitset_write (x, y+1, OFS_FG, BITS_COLOR)
implement{}
background (x, y) = bitset_write (x, y+1, OFS_BG, BITS_COLOR)
implement{}
bold (x, b) = flag_write (x, OFS_BOLD, b)
implement{}
faint (x, b) = flag_write (x, OFS_FAINT, b)
implement{}
italic (x, b) = flag_write (x, OFS_ITALIC, b)
implement{}
underline (x, b) = flag_write (x, OFS_UNDERLINE, b)
implement{}
crossed_out (x, b) = flag_write (x, OFS_CROSSOUT, b)
implement{}
reverse (x, b) = flag_write (x, OFS_REVERSE, b)

implement{}
fprint_colorado (out, c) =
  if c = 0 then fprint_string (out, "\033[0m")
  else {
    val () = fprint_string (out, "\033[")
    val fg = bitset_read (c, OFS_FG, BITS_COLOR)

    val () =
      if fg > 0 then begin
        fprint! (out, "3");
        fprint_uint (out, fg-1u);
        fprint_string (out, ";")
      end (* end of [val] *)

    val bg = bitset_read (c, OFS_BG, BITS_COLOR)

    val () =
      if bg > 0 then begin
        fprint_string (out, "4");
        fprint_uint (out, bg-1u);
        fprint_string (out, ";")
      end (* end of [val] *)

    val bold : string = if flag_read (c, OFS_BOLD) then "2" else "22"
    val () = fprint_string (out, bold)
    val () = fprint_string (out, ";")
    val italic : string = if flag_read (c, OFS_ITALIC) then "3" else "23"
    val () = fprint_string (out, italic)
    val () = fprint_string (out, ";")
    val underline : string = if flag_read (c, OFS_UNDERLINE) then "4" else "24"
    val () = fprint_string (out, underline)
    val () = fprint_string (out, ";")
    val crossout : string = if flag_read (c, OFS_CROSSOUT) then "9" else "29"
    val () = fprint_string (out, crossout)
    val () = fprint_string (out, ";")

    // last one, don't need any delimiters
    val reverse : string = if flag_read (c, OFS_REVERSE) then "7" else "27"
    val () = fprint_string (out, reverse)

    val () = fprint_string (out, "m")
  } (* end of [fprint_colorado] *)

implement{}
print_colorado (c) = fprint_colorado (stdout_ref, c)
implement{}
prerr_colorado (c) = fprint_colorado (stderr_ref, c)

