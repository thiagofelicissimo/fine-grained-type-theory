require open fine-grained-type-theory.fgtt;

// type
constant symbol Unit : U Set;

// constructor
constant symbol I-Unit : El Unit;

// eliminators

// into Prop
symbol Unit_ind : Π (A : U Prop),
                 El A →
                 El Unit →
                 El A;

// into TProp (large)
symbol Unit_hind : Π (A : U TProp),
                 El A →
                 El Unit →
                 El A;

// into Set (large)
symbol Unit_rec : Π (A : U Set),
                 El A →
                 El Unit →
                 El A;

// into TSet (large)
symbol Unit_hrec : Π (A : U TSet),
                 El A →
                 El Unit →
                 El A;

// computation rules                
rule Unit_ind _ $a I-Unit ↪ $a;
rule Unit_hind _ $a I-Unit ↪ $a;
rule Unit_rec _ $a I-Unit ↪ $a;
rule Unit_hrec _ $a I-Unit ↪ $a;
