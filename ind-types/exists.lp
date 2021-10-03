require open fine-grained-type-theory.fgtt;

// type
constant symbol Exists : Π (A : U Set) (B : El A → U Prop), U Prop;

// constructors
constant symbol ex :  Π (A : U Set) (B : El A → U Prop), 
                      Π a : El A, El (B a) → El (Exists A B);

// destructors
symbol ex_ind :  Π (A : U Set) (B : El A → U Prop) (P : El (Exists A B) → U Prop), 
                 (Π (a : El A) (b : El (B a)), El (P (ex A B a b))) → 
                 Π (x : El (Exists A B)), El (P x);

symbol ex_rec :  Π (A : U Set) (B : El A → U Prop) (P : El (Exists A B) → U Set), 
                 (Π (a : El A) (b : El (B a)), El (P (ex A B a b))) → 
                 Π (x : El (Exists A B)), El (P x);

symbol ex_hind :  Π (A : U Set) (B : El A → U Prop) (P : El (Exists A B) → U TProp), 
                 (Π (a : El A) (b : El (B a)), El (P (ex A B a b))) → 
                 Π (x : El (Exists A B)), El (P x);

symbol ex_hrec :  Π (A : U Set) (B : El A → U Prop) (P : El (Exists A B) → U TSet), 
                 (Π (a : El A) (b : El (B a)), El (P (ex A B a b))) → 
                 Π (x : El (Exists A B)), El (P x);
// computation rules
rule ex_ind $A $B $P $p (ex $A $B $a $b) ↪ $p $a $b;
rule ex_rec $A $B $P $p (ex $A $B $a $b) ↪ $p $a $b;
rule ex_hind $A $B $P $p (ex $A $B $a $b) ↪ $p $a $b;
rule ex_hrec $A $B $P $p (ex $A $B $a $b) ↪ $p $a $b;

