require open fine-grained-type-theory.fgtt;

// type
constant symbol ⊥ : U Prop;

// constructor 
// empty

// eliminators

// into Prop
symbol ⊥_ind : Π (A : U Prop),
                 El ⊥ →
                 El A;

// into TProp (large)
symbol ⊥_hind : Π (A : U TProp),
                 El ⊥ →
                 El A;

// into Set (large)
symbol ⊥_rec : Π (A : U Set),
                 El ⊥ →
                 El A;

// into TSet (large)
symbol ⊥_hrec : Π (A : U TSet),
                 El ⊥ →
                 El A;

// computation rules
// empty
