val _ = print("---- next ----\n");
val _ : int -> int = next;
val test1 = next 1 = 2;
val test2 = next ~1 = 0;
val test3 = next ~10 = ~9;

val _ = print("---- add ----\n");
val _ : int * int -> int = add;
val test1 = add(1, 2) = 3;
val test2 = add(3, 0) = 3;
val test3 = add(10, ~1) = 9;
val test4 = add(~5, ~1) = ~6;
val test5 = add(0, ~0) = ~0;

val _ = print("---- majority ----\n");
val _ : bool * bool * bool -> bool = majority;
val test1 = majority(false, false, false) = false;
val test2 = majority(false, false, true)  = false;
val test3 = majority(false, true,  false) = false;
val test4 = majority(false, true,  true)  = true;
val test5 = majority(true,  false, false) = false;
val test6 = majority(true,  false, true)  = true;
val test7 = majority(true,  true,  false) = true;
val test8 = majority(true,  true,  true)  = true;

val _ = print("---- median ----\n");
val _ : real * real * real -> real = median;
val test1 = Real.==(0.0, median(0.0, 0.1, 0.0));

val _ = print("---- triangle ----\n");
val _ : int *  int * int -> bool = triangle;
val test1 = triangle(4, 5, 3) = true;
val test1 = triangle(3, 4, 2) = false;
val test2 = triangle(3, 4, 0) = false;
