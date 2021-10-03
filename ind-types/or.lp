require open fine-grained-type-theory.fgtt;

// type
constant symbol Or : U Prop → U Prop → U Prop;

// constructors
constant symbol inl : Π (A B : U Prop), 
                      El A → El (Or A B);
constant symbol inr : Π (A B : U Prop), 
                      El B → El (Or A B);

// eliminators
symbol or_ind : Π (A B : U Prop) (P : El (Or A B) → U Prop), 
                (Π a : El A, El (P (inl A B a))) →
                (Π b : El B, El (P (inr A B b))) →
                Π x : El (Or A B), El (P x);

symbol or_rec : Π (A B : U Prop) (P : El (Or A B) → U Set), 
                (Π a : El A, El (P (inl A B a))) →
                (Π b : El B, El (P (inr A B b))) →
                Π x : El (Or A B), El (P x);

symbol or_hind : Π (A B : U Prop) (P : El (Or A B) → U TProp), 
                (Π a : El A, El (P (inl A B a))) →
                (Π b : El B, El (P (inr A B b))) →
                Π x : El (Or A B), El (P x);

symbol or_hrec : Π (A B : U Prop) (P : El (Or A B) → U TSet), 
                (Π a : El A, El (P (inl A B a))) →
                (Π b : El B, El (P (inr A B b))) →
                Π x : El (Or A B), El (P x);

// computation rules
rule or_ind $A $B _ $pl _ (inl $A $B $a) ↪ $pl $a; // NON-LINEAR ! 
rule or_ind $A $B _ _ $pr (inr $A $B $a) ↪ $pr $a;

rule or_rec $A $B _ $pl _ (inl $A $B $a) ↪ $pl $a;
rule or_rec $A $B _ _ $pr (inr $A $B $a) ↪ $pr $a;

rule or_hind $A $B _ $pl _ (inl $A $B $a) ↪ $pl $a;
rule or_hind $A $B _ _ $pr (inr $A $B $a) ↪ $pr $a;

rule or_hrec $A $B _ $pl _ (inl $A $B $a) ↪ $pl $a;
rule or_hrec $A $B _ _ $pr (inr $A $B $a) ↪ $pr $a;




