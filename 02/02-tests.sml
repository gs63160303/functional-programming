val _ = print("---- simp ----\n");
(* Dano predstavitev pretvori v najbolj ekonomično, se pravi 
   tako, ki ima najmanjše možno število konstruktorjev *)
val _ : number -> number = simp;
val testX = simp (Pred (Succ (Succ (Pred (Pred (Succ (Pred Zero))))))) = Pred Zero;

val _ = print("---- neg ----\n");
(* Negira število a. Pretvorba v int ni dovoljena! *)
val _ : number -> number = neg;
val testX = neg(Zero) = Zero;
val testX = neg(Pred(Pred(Zero))) = Succ(Succ(Zero));
val testX = neg(Succ(Succ(Zero))) = Pred(Pred(Zero));
val testX = neg(Succ(Succ(Pred(Zero)))) = Pred(Pred(Succ(Zero)));

val _ = print("---- add ----\n");
(* Vrne vsoto števil a in b. Pretvorba v int ni dovoljena! *)
val _ : number * number -> number = add;
val testX = add(Zero, Zero) = Zero;
val testX = add(Zero, Succ Zero) = Succ Zero;
val testX = add(Pred Zero, Zero) = Pred Zero;
val testX = add(Pred Zero, Succ Zero) = Pred (Succ Zero);
val testX = add(Pred Zero, Succ(Succ Zero)) = Pred (Succ (Succ Zero));

val _ = print("---- comp ----\n");
(* Vrne rezultat primerjave števil a in b. Pretvorba v int ni dovoljena!
    namig: uporabi funkcijo simp *)
val _ : number * number -> order = comp;
val testX = comp(Zero, Zero) = EQUAL;
val testX = comp(Succ Zero, Zero) = GREATER;
val testX = comp(Pred (Succ Zero), Zero) = EQUAL;
val testX = comp(Pred (Succ (Pred Zero)), Pred (Succ Zero)) = LESS;