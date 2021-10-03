require open fine-grained-type-theory.fgtt;

// type
constant symbol Exists-prop : Π (A : U Prop) (B : El A → U Prop), U Prop;

// constructors
constant symbol exp :  Π (A : U Prop) (B : El A → U Prop), 
                      Π a : El A, El (B a) → El (Exists-prop A B);

// destructors
symbol exp_ind :  Π (A : U Prop) (B : El A → U Prop) (P : El (Exists-prop A B) → U Prop), 
                 (Π (a : El A) (b : El (B a)), El (P (exp A B a b))) → 
                 Π (x : El (Exists-prop A B)), El (P x);

symbol exp_rec :  Π (A : U Prop) (B : El A → U Prop) (P : El (Exists-prop A B) → U Set), 
                 (Π (a : El A) (b : El (B a)), El (P (exp A B a b))) → 
                 Π (x : El (Exists-prop A B)), El (P x);

symbol exp_hind :  Π (A : U Prop) (B : El A → U Prop) (P : El (Exists-prop A B) → U TProp), 
                 (Π (a : El A) (b : El (B a)), El (P (exp A B a b))) → 
                 Π (x : El (Exists-prop A B)), El (P x);

symbol exp_hrec :  Π (A : U Prop) (B : El A → U Prop) (P : El (Exists-prop A B) → U TSet), 
                 (Π (a : El A) (b : El (B a)), El (P (exp A B a b))) → 
                 Π (x : El (Exists-prop A B)), El (P x);

// computation rules
rule exp_ind $A $B $P $p (exp $A $B $a $b) ↪ $p $a $b;
rule exp_rec $A $B $P $p (exp $A $B $a $b) ↪ $p $a $b;
rule exp_hind $A $B $P $p (exp $A $B $a $b) ↪ $p $a $b;
rule exp_hrec $A $B $P $p (exp $A $B $a $b) ↪ $p $a $b;




                          


     
