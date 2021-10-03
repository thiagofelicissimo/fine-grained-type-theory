require open 
  fine-grained-type-theory.fgtt;

// type
constant symbol ASet : U TSet;

// projectors
symbol node : El ASet → El set;
symbol edges : Π s : El ASet, El (node s) → El ASet;

// eliminators
constant symbol corec_aset : Π (B : U Set)
                               (f : El B → U Set),
                             (Π b : El B, El (f b) → El B) →
                             El B → El ASet;

constant symbol coind_aset : Π (B : U Prop)
                               (f : El B → U Set),
                             (Π b : El B, El (f b) → El B) →
                             El B → El ASet;
                               
// reduction
rule node (corec_aset $B $f $g $b) ↪ $f $b;
rule edges (corec_aset $B $f $g $b) ↪ λ n, corec_aset $B $f $g ($g $b n);

rule node (coind_aset $B $f $g $b) ↪ $f $b;
rule edges (coind_aset $B $f $g $b) ↪ λ n, coind_aset $B $f $g ($g $b n);

