require open fine-grained-type-theory.fgtt;

// type
constant symbol ⊤ : U Prop;

// constructor
constant symbol I-⊤ : El ⊤;

// eliminators

// into Prop
symbol ⊤_ind : Π (A : U Prop),
                 El A →
                 El ⊤ →
                 El A;

// into TProp (large)
symbol ⊤_hind : Π (A : U TProp),
                 El A →
                 El ⊤ →
                 El A;

// into Set (large)
symbol ⊤_rec : Π (A : U Set),
                 El A →
                 El ⊤ →
                 El A;

// into TSet (large)
symbol ⊤_hrec : Π (A : U TSet),
                 El A →
                 El ⊤ →
                 El A;

// computation rules                
rule ⊤_ind _ $a I-⊤ ↪ $a;
rule ⊤_hind _ $a I-⊤ ↪ $a;
rule ⊤_rec _ $a I-⊤ ↪ $a;
rule ⊤_hrec _ $a I-⊤ ↪ $a;
