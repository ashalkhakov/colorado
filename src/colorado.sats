
#define BLACK 0
#define RED 1
#define GREEN 2
#define YELLOW 3
#define BLUE 4
#define MAGENTA 5
#define CYAN 6
#define WHITE 7

abst@ype colorado = uint
fun{} reset (): colorado

fun{} foreground (colorado, x: intBtw(0,7)): colorado
fun{} background (colorado, x: intBtw(0,7)): colorado
fun{} bold (colorado, bool): colorado
fun{} faint (colorado, bool): colorado
fun{} italic (colorado, bool): colorado
fun{} underline (colorado, bool): colorado
fun{} crossed_out (colorado, bool): colorado
fun{} reverse (colorado, bool): colorado

overload fg with foreground
overload bg with background

fun{} print_colorado (x: colorado): void
fun{} prerr_colorado (x: colorado): void
fun{} fprint_colorado : fprint_type (colorado)

overload print with print_colorado
overload prerr with prerr_colorado
overload fprint with fprint_colorado

fun{}
tostrptr_colorado(colorado):<!wrt> Strptr1
