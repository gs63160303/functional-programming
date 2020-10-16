(* Vrne naslednika števila n. *)
fun next (n : int) : int = n + 1;

(* Vrne vsoto števil a in b. *)
fun add (a : int, b : int) : int = a + b

(* Vrne true, če sta vsaj dva argumenta true, drugače vrne false *)
fun majority (a : bool, b : bool, c : bool) : bool = 
    (a andalso b) orelse (a andalso c) orelse (b andalso c)

(* Vrne mediano argumentov - števila tipa real brez (inf : real), (~inf : real), (nan : real) in (~0.0 : real)
   namig: uporabi Real.max in Real.min *)
fun median (a : real, b : real, c : real) : real = 
    Real.max(Real.min(a, b), Real.max(Real.min(a, c), Real.min(b, c)))

(* Preveri ali so argumenti veljavne dolžine stranic nekega trikotnika - trikotnik ni izrojen *)
fun triangle (a : int, b : int, c : int) : bool = 
    let
        val a2 = a*a;
        val b2 = b*b;
        val c2 = c*c;
    in
        (a2 + b2 = c2) orelse (a2 + c2 = b2) orelse (b2 + c2 = a2)
    end;