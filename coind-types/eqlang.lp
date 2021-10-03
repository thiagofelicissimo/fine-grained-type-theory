require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.bool
  fine-grained-type-theory.ind-types.eq
  fine-grained-type-theory.coind-types.lang;

// types
constant symbol Eq-lang : Π (A : U Set), El (Lang A) → El (Lang A) → U Set;

// projectors
symbol ν= : Π (A : U Set)
              (l l' : El (Lang A)),
            El (Eq-lang A l l') →
            El (Eq Bool (ν A l) (ν A l'));

symbol μ~ : Π (A : U Set)
              (l l' : El (Lang A))
              (a : El A),
            El (Eq-lang A l l') →
            El (Eq-lang A (μ A l a) (μ A l' a));

// eliminators
constant symbol eqlang_ind : Π (A : U Set)
                               (B : El (Lang A) → El (Lang A) → U Set),
                             (Π (l l' : El (Lang A)), El (B l l') → El (Eq Bool (ν A l) (ν A l'))) →
                             (Π (l l' : El (Lang A)) (a : El A), El (B l l') → El (B (μ A l a) (μ A l' a))) →
                             Π (l l' : El (Lang A)), El (B l l') → El (Eq-lang A l l');

// reduction
rule ν= $A $l $l' (eqlang_ind $A $B $f $g $l $l' $b) ↪ $f $l $l' $b; 
rule μ~ $A $l $l' $a (eqlang_ind $A $B $f $g $l $l' $b) ↪ eqlang_ind $A $B $f $g (μ $A $l $a) (μ $A $l' $a) ($g $l $l' $a $b);
                               
            
