require open fine-grained-type-theory.fgtt;

// type
constant symbol And : U Prop → U Prop → U Prop;

// constructor
constant symbol in_and : Π (A B : U Prop), El A → El B → El (And A B);

// eliminators

// into Prop
symbol and_ind : Π (A B : U Prop) 
                  (P : El (And A B) → U Prop)
                  (_ : Π (a : El A) (b : El B), El (P (in_and A B a b)))
                  (x : El (And A B)),
                El (P x);

// into Set
symbol and_rec : Π (A B : U Prop) 
                  (P : El (And A B) → U Set)
                  (_ : Π (a : El A) (b : El B), El (P (in_and A B a b)))
                  (x : El (And A B)),
                El (P x);

// into TProp
symbol and_hind : Π (A B : U Prop) 
                  (P : El (And A B) → U TProp)
                  (_ : Π (a : El A) (b : El B), El (P (in_and A B a b)))
                  (x : El (And A B)),
                El (P x);

// into TSet
symbol and_hrec : Π (A B : U Prop) 
                  (P : El (And A B) → U TSet)
                  (_ : Π (a : El A) (b : El B), El (P (in_and A B a b)))
                  (x : El (And A B)),
                El (P x);

// reduction
rule and_ind $A $B $P $p (in_and $A $B $a $b) ↪ $p $a $b;

rule and_rec $A $B $P $p (in_and $A $B $a $b) ↪ $p $a $b;

rule and_hind $A $B $P $p (in_and $A $B $a $b) ↪ $p $a $b;

rule and_hrec $A $B $P $p (in_and $A $B $a $b) ↪ $p $a $b;
