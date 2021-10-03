require open fine-grained-type-theory.fgtt;

// type
constant symbol Empty : U Set;

// constructor


// eliminators

// into Prop
symbol Empty_ind : Π (A : U Prop),
                 El Empty →
                 El A;

// into TProp (large)
symbol Empty_hind : Π (A : U TProp),
                 El Empty →
                 El A;

// into Set (large)
symbol Empty_rec : Π (A : U Set),
                 El Empty →
                 El A;

// into TSet (large)
symbol Empty_hrec : Π (A : U TSet),
                 El Empty →
                 El A;

// computation rules                
