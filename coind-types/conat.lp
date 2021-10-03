require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.coind-types.aset
  fine-grained-type-theory.ind-types.unit
  fine-grained-type-theory.ind-types.empty
  fine-grained-type-theory.ind-types.maybe;

// type
constant symbol Conat : U Set;

// projectors
symbol conatv : El Conat → El (Maybe Conat);

// eliminator
symbol corec_conat : Π B : U Set,
                     (El B → El (Maybe B)) →
                     El B → El Conat;

// reduction
rule conatv (corec_conat $B $f $b) ↪ 
     maybe_rec $B (λ _, Maybe Conat) (λ b, some Conat (corec_conat $B $f b)) 
                  (none Conat) ($f $b);

symbol conat_unit_empty : El (Maybe Conat) → El set ≔
  λ b, maybe_hrec Conat (λ _, set) (λ _, Unit) Empty b;

// converts conatural to its set representation
symbol conat_set : El Conat → El ASet ≔
  λ n, corec_aset Conat (λ x, conat_unit_empty (conatv x))
                  (λ b, maybe_rec Conat (λ x, (conat_unit_empty x) ⇝ (λ _, Conat)) (λ y _, y) (λ p, Empty_rec Conat p) (conatv b)) n;


symbol infinite_set : El ASet ≔ conat_set (corec_conat Unit (λ x, some Unit x) I-Unit);
compute infinite_set;
compute edges (infinite_set) I-Unit;

// infinite_set = { I-Unit → infinite_set }

