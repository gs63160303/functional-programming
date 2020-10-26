datatype number = Zero | Succ of number | Pred of number;

(* Dano predstavitev pretvori v najbolj ekonomično, se pravi 
   tako, ki ima najmanjše možno število konstruktorjev *)
fun simp (a : number) : number = 
    case a of 
        Zero => Zero
      | Succ(Pred a') => simp(a')
      | Pred(Succ a') => simp(a')
      | Succ a' => Succ (simp(a'))
      | Pred a' => Pred (simp(a'))


(* Negira število a. Pretvorba v int ni dovoljena! *)
fun neg (a : number) : number =
    case a of
        Zero => Zero
      | Succ a' => Pred (neg(a'))
      | Pred a' => Succ (neg(a'))

(* Vrne vsoto števil a in b. Pretvorba v int ni dovoljena! *)
fun add (a : number, b : number) : number =
    case a of
        Zero => b
      | Succ a' => add(a', Succ b)
      | Pred a' => add(a', Pred b)

(* Vrne rezultat primerjave števil a in b. Pretvorba v int ni dovoljena!
    namig: uporabi funkcijo simp *)
fun comp (a : number, b : number) : order = 
    case simp(add(a, neg(b))) of
        Zero => EQUAL
      | Succ _ => GREATER
      | Pred _ => LESS



datatype tree = Node of int * tree * tree | Leaf of int;

(* Vrne true, če drevo vsebuje element x. *)
fun contains (tree : tree, x : int) : bool =
    case tree of
        Leaf v => v = x
      | Node (v, l, r) => v = x orelse contains(l, x) orelse contains(r, x)

(* Vrne število listov v drevesu. *)
fun countLeaves (tree : tree) : int =
    case tree of
        Leaf _ => 1
      | Node (_, l, r) => countLeaves(l) + countLeaves(r)

(* Vrne število število vej v drevesu. *)
fun countBranches (tree : tree) : int = 
    case tree of
        Leaf _ => 0
      | Node (_, l, r) => 2 + countBranches(l) + countBranches(r)

(* Vrne višino drevesa. Višina lista je 1. *)
fun height (tree : tree) : int = 
    case tree of
        Leaf _ => 1
      | Node (_, l, r) => let 
            fun max (a: int, b: int) : int = if a > b then a else b 
            in 1 + max(height l, height r) end

(* Pretvori drevo v seznam z vmesnim prehodom (in-order traversal). *)
fun toList (tree : tree) : int list = 
    case tree of
        Leaf v => [v]
      | Node (v, l, r) => toList(l) @ (v::(toList r))

(* Vrne true, če je drevo uravnoteženo:
 * - Obe poddrevesi sta uravnoteženi.
 * - Višini poddreves se razlikujeta kvečjemu za 1.
 * - Listi so uravnoteženi po definiciji.
 *)
fun isBalanced (tree : tree) : bool =
    case tree of 
        Leaf _ => true
      | Node (_, l, r) => let
            fun abs(a: int) : int = if a < 0 then ~a else a
        in
            abs((height l) - (height r)) <= 1
        end

(* Vrne true, če je drevo binarno iskalno drevo:
 * - Vrednosti levega poddrevesa so strogo manjši od vrednosti vozlišča.
 * - Vrednosti desnega poddrevesa so strogo večji od vrednosti vozlišča.
 * - Obe poddrevesi sta binarni iskalni drevesi.
 * - Listi so binarna iskalna drevesa po definiciji.
 *)
fun isBST (tree : tree) : bool =
    let
        fun root(tree: tree) : int =
            case tree of 
                Leaf v => v
              | Node (v, _, _) => v
    in 
        case tree of
            Leaf _ => true
          | Node (v, l, r) => root(l) < v andalso v < root(r) andalso isBST(l) andalso isBST(r)
    end