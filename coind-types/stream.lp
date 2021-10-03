require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.nat;
        

// type
constant symbol Stream : El set → U Set;

// projections
symbol hd : Π A : U Set, El (Stream A) → El A;
symbol tl : Π A : U Set, El (Stream A) → El (Stream A);

// eliminator
constant symbol corec_stream : Π (A : U Set)
                                 (B : U Set),
                               (El A → El B) →
                               (El A → El A) →
                               El A → El (Stream B);

// reduction
rule hd $B (corec_stream $A $B $head $tail $a) ↪ $head $a;
rule tl _  (corec_stream $A $B $head $tail $a) ↪ corec_stream $A $B $head $tail ($tail $a);

symbol n_st : El Nat → El (Stream Nat) ≔ λ n, corec_stream Nat Nat (λ x, x) (λ x, x) n;


