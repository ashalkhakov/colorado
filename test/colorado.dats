#include
"share/atspre_staload.hats"

#include "./../src/mylibies.hats"

fun
test_bits (): void = {
  #include "./../src/bits.hats"

  val () = assertloc(bitset_read (1u, 0, 1) = 1u)
  val () = assertloc(bitset_read (3u, 1, 1) = 1u)
  val () = assertloc(bitset_read (3u, 0, 1) = 1u)
  val () = assertloc(bitset_read (2u, 0, 1) = 0u)
  val () = assertloc(bitset_read (2u, 1, 1) = 1u)
  val () = assertloc(bitset_read (0xffu, 0, 4) = 0xfu)
  val () = assertloc(bitset_read (0xf0u, 4, 4) = 0xfu) 
 
  val () = assertloc(bitset_write (0x01u, 0, 0, 1) = 0x0u)
  val () = assertloc(bitset_write (0x0Fu, 0xF, 4, 4) = 0xFFu)
  val () = assertloc(bitset_write (0x0Fu, 0x3, 4, 4) = 0x3Fu)
  val () = assertloc(bitset_write (0x0Fu, 0x3, 4, 4) = 0x3Fu)
 
  val () = assertloc(bitset_read(bitset_write(0x0u, 0x1, 4, 1), 4, 1) = 0x1u)
  val () = assertloc(bitset_read(bitset_write(0x1Fu, 0xF, 4, 4), 4, 4) = 0xFu)
 
  val () = assertloc(flag_read (flag_write(0u, 2, true), 2) = true)
  val () = assertloc(flag_read (flag_write(0xFFu, 0, false), 0) = false)
}

fun
test_output (): void = {
  val e = reset()
  val () = println!("hello, ",
    fg(e,RED), "red", e, " world!")
  val () = println!("Hello, ",
    bg(e,CYAN), "cyan", e, " background!")
  val c = underline(fg(bg(e,RED),YELLOW),true)
  val () = println!(c, "Status: it's all broken", e)
  val c = reverse(c,true)
  val () = println!(c, "Status: reversed!", e)
  val () = println!(background(foreground(e,YELLOW),GREEN), "Succeeded!", e)
}

implement main0 () = {
  val () = test_bits ()
  val () = test_output ()
}
