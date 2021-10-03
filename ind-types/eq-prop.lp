require open fine-grained-type-theory.fgtt;


// type
constant symbol Eq-prop : Π A : U Prop, El A → El A → U Prop;

// constructor
constant symbol reflp : Π (A : U Prop) (a : El A), El (Eq-prop A a a);

// eliminators

// into Prop
symbol eqp_ind : Π (A : U Prop)
                  (x : El A)
                  (P : Π y : El A, El (Eq-prop A x y) → U Prop)
                  (_ : El (P x (reflp A x)))
                  (y : El A)
                  (e : El (Eq-prop A x y)),
                  El (P y e);

// into TProp (large)
symbol eqp_hind : Π (A : U Prop)
                  (x : El A)
                  (P : Π y : El A, El (Eq-prop A x y) → U TProp)
                  (_ : El (P x (reflp A x)))
                  (y : El A)
                  (e : El (Eq-prop A x y)),
                  El (P y e);

// into Set (large)
symbol eqp_rec : Π (A : U Prop)
                  (x : El A)
                  (P : Π y : El A, El (Eq-prop A x y) → U Set)
                  (_ : El (P x (reflp A x)))
                  (y : El A)
                  (e : El (Eq-prop A x y)),
                  El (P y e);

// into TSet (large)
symbol eqp_hrec : Π (A : U Prop)
                  (x : El A)
                  (P : Π y : El A, El (Eq-prop A x y) → U TSet)
                  (_ : El (P x (reflp A x)))
                  (y : El A)
                  (e : El (Eq-prop A x y)),
                  El (P y e);

// computation rules                
rule eqp_ind $A $x _ $px $x (reflp $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
rule eqp_hind $A $x _ $px $x (reflp $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
rule eqp_rec $A $x _ $px $x (reflp $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
rule eqp_hrec $A $x _ $px $x (reflp $A $x) ↪ $px; // QUESTION : why is the non-linearity really necessary ?
