val _ = print("---- factorial ----\n");
(*  Vrne fakulteto števila n, n >= 0. *)
val _ : int -> int = factorial;
val test1 = factorial 0 = 1;
val test2= factorial 1 = 1;
val test3 = factorial 2 = 2;
val test4 = factorial 3 = 6;
val test5 = factorial 12 = 479001600;

val _ = print("---- power ----\n");
(*  Vrne n-to potenco števila x, n >= 0. *)
(* fun power (x : int, n : int) : int *)
val _ : int * int -> int = power;
val test1 = power(0, 0) = 1; (* although 0^0 is undefined *)
val test2 = power(0, 2) = 0;
val test3 = power(3, 3) = 27;
val test4 = power(2, 29) = 536870912;
val test5 = power(5, 10) = 9765625;
val test6 = power(23122131, 0) = 1;

val _ = print("---- gcd ----\n");
(*  Vrne največjega skupnega delitelja pozitivnih števil a in b, a >= b. *)
(* fun gcd (a : int, b : int) : int *)
val _ : int * int -> int = gcd;
val test1 = gcd(0, 0) = 0;
val test2 = gcd(0, 1) = 1;
val test3 = gcd(1, 0) = 1;
val test4 = gcd(89, 55) = 1;
val test5 = gcd(264, 210) = 6;
val test5 = gcd(39088169, 63245986) = 1;

val _ = print("---- len ----\n");
(*  Vrne dolžino seznama. *)
(* fun len (xs : int list) : int *)
val _ : int list -> int = len;
val test1 = len(nil) = 0;
val test2 = len([]) = 0;
val test3 = len([1]) = 1;
val test4 = len([1,2,3,4,5]) = 5;

val _ = print("---- last ----\n");
(*  Vrne SOME zadnji element seznama. Če je seznam prazen vrne NONE. *)
(* fun last (xs : int list) : int option *)
val _ : int list -> int option = last;
val test1 = last(nil) = NONE;
val test2 = last([]) = NONE;
val test3 = valOf(last([1])) = 1;
val test4 = valOf(last([1, 2])) = 2;
val test5 = valOf(last([1, 2, 3, 4, 5])) = 5;

val _ = print("---- nth ----\n");
(*  Vrne SOME n-ti element seznama. Prvi element ima indeks 0. Če indeks ni veljaven, vrne NONE. *)
(* fun nth (xs : int list, n : int) : int option *)
val _ : int list * int -> int option = nth;
val test1 = nth(nil, 0) = NONE;
val test2 = nth([], 1) = NONE;
val test3 = nth([1, 2, 3], ~1) = NONE;
val test4 = nth([1, 2, 3], 0) = SOME 1;
val test5 = nth([1, 2, 3], 3) = NONE;
val test6 = nth([1, 2, 3, 4, 5], 10) = NONE;
val test7 = nth([1, 2, 3, 4, 5], 4) = SOME 5;
val test8 = nth([1, 2, 3, 4, 5], 2) = SOME 3;

val _ = print("---- insert ----\n");
(*  Vrne nov seznam, ki je tak kot vhodni, le da je na n-to mesto vrinjen element x. 
    Prvo mesto v seznamu ima indeks 0. Indeks n je veljaven (0 <= n <= length xs). *)
(* fun insert (xs : int list, n : int, x : int) : int list *)
val _ : int list * int * int -> int list = insert;
val test1 = insert([], 0, 0) = [0];
val test2 = insert([1], 0, 0) = [0, 1];
val test3 = insert([1, 2], 1, 0) = [1, 0, 2];
val test4 = insert([1, 2, 3], 3, 0) = [1, 2, 3, 0];

val _ = print("---- delete ----\n");
(*  Vrne nov seznam, ki je tak kot vhodni, le da so vse pojavitve elementa x odstranjene. *)
(* fun delete (xs : int list, x : int) : int list *)
val _ : int list * int -> int list = delete;
val test1 = delete([], 0) = [];
val test2 = delete([0], 0) = [];
val test3 = delete([1,2,0,3], 0) = [1,2,3];
val test4 = delete([0,1,0,2,0,3,0,0], 0) = [1,2,3];

val _ = print("---- reverse ----\n");
(*  Vrne obrnjen seznam. V pomoč si lahko spišete še funkcijo append, ki doda na konec seznama. *)
(* fun reverse (xs : int list) : int list *)
val _ : int list -> int list = reverse;
val test1 = reverse([]) = [];
val test2 = reverse([1]) = [1];
val test3 = reverse([1,2]) = [2,1];
val test4 = reverse([1,2,3]) = [3,2,1];

(*  Vrne true, če je podani seznam palindrom. Tudi prazen seznam je palindrom. *)
(* fun palindrome (xs : int list) : bool *)
val _ = print("---- palindrome ----\n");
val _ : int list -> bool = palindrome;
val test1 = palindrome([]) = true;
val test2 = palindrome([0]) = true;
val test3 = palindrome([1,0]) = false;
val test4 = palindrome([1,0,1]) = true;
val test5 = palindrome([1,0,1,1]) = false;
val test6 = palindrome([1,0,1,0]) = false;
val test7 = palindrome([1,0,0,1]) = true;
val test8 = palindrome([1,0,3,0,1]) = true;