require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.nat;
        

// type
constant symbol Bintree : El set → U Set;

// projections
symbol val : Π A : U Set, El (Bintree A) → El A;
symbol lb : Π A : U Set, El (Bintree A) → El (Bintree A);
symbol rb : Π A : U Set, El (Bintree A) → El (Bintree A);

// eliminator
constant symbol corec_bintree : Π (B : U Set)
                                (A : U Set),
                               (El B → El A) →
                               (El B → El B) →
                               (El B → El B) →
                               El B → El (Bintree A);

// reduction
rule val $B (corec_bintree $A $B $head $lbranch $rbranch $a) ↪ $head $a;
rule lb  $B (corec_bintree $A $B $head $lbranch $rbranch $a) ↪ corec_bintree $A $B $head $lbranch $rbranch ($lbranch $a);
rule rb  $B (corec_bintree $A $B $head $lbranch $rbranch $a) ↪ corec_bintree $A $B $head $lbranch $rbranch ($rbranch $a);
