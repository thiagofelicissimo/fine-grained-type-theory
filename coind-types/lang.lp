require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.bool;


// type
constant symbol Lang : U Set → U Set;

// projectors
symbol ν : Π (A : U Set), El (Lang A) → El Bool;
symbol μ : Π (A : U Set), El (Lang A) → El A → El (Lang A);

// eliminator
constant symbol lang_ind : Π (A : U Set) 
                             (B : U Set),
                           (El B → El Bool) →
                           (El B → El A → El B) →
                           El B → El (Lang A);

// reduction
rule ν $A (lang_ind $A $B $f $g $b) ↪ $f $b;
rule μ $A (lang_ind $A $B $f $g $b) ↪ λ a, lang_ind $A $B $f $g ($g $b a);
                            

