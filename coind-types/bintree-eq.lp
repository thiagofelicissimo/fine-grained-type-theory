require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.coind-types.bintree
  fine-grained-type-theory.ind-types.eq;


// type
constant symbol Bintree-eq : Π A : U Set, El (Bintree A) → El (Bintree A) → U Set;

// projectors
symbol val= : Π (A : U Set) (t1 t2 : El (Bintree A)), El (Bintree-eq A t1 t2) → El (Eq A (val A t1) (val A t2));
symbol lb~  : Π (A : U Set) (t1 t2 : El (Bintree A)), El (Bintree-eq A t1 t2) → El (Bintree-eq A (lb A t1) (lb A t2));
symbol rb~  : Π (A : U Set) (t1 t2 : El (Bintree A)), El (Bintree-eq A t1 t2) → El (Bintree-eq A (rb A t1) (rb A t2));

// eliminator

constant symbol corec_btreeeq : Π (A : U Set)
                               (B : El (Bintree A) → El (Bintree A) → U Set),
                             (Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (Eq A (val A t1) (val A t2))) →
                             (Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (B (lb A t1) (lb A t2))) →
                             (Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (B (rb A t1) (rb A t2))) →
                             Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (Bintree-eq A t1 t2);

constant symbol coind_btreeeq : Π (A : U Set)
                               (B : El (Bintree A) → El (Bintree A) → U Prop),
                             (Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (Eq A (val A t1) (val A t2))) →
                             (Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (B (lb A t1) (lb A t2))) →
                             (Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (B (rb A t1) (rb A t2))) →
                             Π (t1 t2 : El (Bintree A)), El (B t1 t2) → El (Bintree-eq A t1 t2);


// reduction
rule val= $A $t1 $t2 (corec_btreeeq $A $B $val $lbranch $rbranch $t1 $t2 $p) ↪ $val $t1 $t2 $p;
rule lb~  $A $t1 $t2 (corec_btreeeq $A $B $val $lbranch $rbranch $t1 $t2 $p) ↪ corec_btreeeq $A $B $val $lbranch $rbranch (lb $A $t1) (lb $A $t2) ($lbranch $t1 $t2 $p);
rule rb~  $A $t1 $t2 (corec_btreeeq $A $B $val $lbranch $rbranch $t1 $t2 $p) ↪ corec_btreeeq $A $B $val $lbranch $rbranch (rb $A $t1) (rb $A $t2) ($rbranch $t1 $t2 $p);

rule val= $A $t1 $t2 (coind_btreeeq $A $B $val $lbranch $rbranch $t1 $t2 $p) ↪ $val $t1 $t2 $p;
rule lb~  $A $t1 $t2 (coind_btreeeq $A $B $val $lbranch $rbranch $t1 $t2 $p) ↪ coind_btreeeq $A $B $val $lbranch $rbranch (lb $A $t1) (lb $A $t2) ($lbranch $t1 $t2 $p);
rule rb~  $A $t1 $t2 (coind_btreeeq $A $B $val $lbranch $rbranch $t1 $t2 $p) ↪ coind_btreeeq $A $B $val $lbranch $rbranch (rb $A $t1) (rb $A $t2) ($rbranch $t1 $t2 $p);
