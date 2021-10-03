require open fine-grained-type-theory.fgtt;

// type
constant symbol Eq : Π (A : U Set), El A → El A → U Prop;

// constructor
constant symbol refl : Π (A : U Set) (a : El A), El (Eq A a a);

// eliminators

// into Prop
symbol eq_ind : Π (A : U Set)
                  (x : El A)
                  (P : Π y : El A, El (Eq A x y) → U Prop)
                  (_ : El (P x (refl A x)))
                  (y : El A)
                  (e : El (Eq A x y)),
                  El (P y e);

// into TProp (large)
symbol eq_hind : Π (A : U Set)
                  (x : El A)
                  (P : Π y : El A, El (Eq A x y) → U TProp)
                  (_ : El (P x (refl A x)))
                  (y : El A)
                  (e : El (Eq A x y)),
                  El (P y e);

// into Set (large)
symbol eq_rec : Π (A : U Set)
                  (x : El A)
                  (P : Π y : El A, El (Eq A x y) → U Set)
                  (_ : El (P x (refl A x)))
                  (y : El A)
                  (e : El (Eq A x y)),
                  El (P y e);

// into TSet (large)
symbol eq_hrec : Π (A : U Set)
                  (x : El A)
                  (P : Π y : El A, El (Eq A x y) → U TSet)
                  (_ : El (P x (refl A x)))
                  (y : El A)
                  (e : El (Eq A x y)),
                  El (P y e);

// computation rules                
rule eq_ind $A $x _ $px $x (refl $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
rule eq_hind $A $x _ $px $x (refl $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
rule eq_rec $A $x _ $px $x (refl $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
rule eq_hrec $A $x _ $px $x (refl $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
