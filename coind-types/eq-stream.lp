require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.exists
  fine-grained-type-theory.ind-types.eq
  fine-grained-type-theory.proofs.eq-properties
  fine-grained-type-theory.ind-types.and
  fine-grained-type-theory.coind-types.stream
  fine-grained-type-theory.ind-types.nat;

// type
constant symbol Eq-stream : Π A : U Set, El (Stream A) → El (Stream A) → U Set;

// projectors
symbol hd= : Π (A : U Set) (l1 l2 : El (Stream A)), El (Eq-stream A l1 l2) → El (Eq A (hd A l1) (hd A l2));
symbol tl~ : Π (A : U Set) (l1 l2 : El (Stream A)), El (Eq-stream A l1 l2) → El (Eq-stream A (tl A l1) (tl A l2));

// eliminator

constant symbol corec_eqstream : Π (A : U Set)
                               (B : El (Stream A) → El (Stream A) → U Set)
                               (l1 l2 : El (Stream A)),
                             (Π (l1 l2 : El (Stream A)), El (B l1 l2) → El (Eq A (hd A l1) (hd A l2))) →
                             (Π (l1 l2 : El (Stream A)), El (B l1 l2) → El (B (tl A l1) (tl A l2))) →
                             El (B l1 l2) → El (Eq-stream A l1 l2);

constant symbol coind_eqstream : Π (A : U Set)
                               (B : El (Stream A) → El (Stream A) → U Prop)
                               (l1 l2 : El (Stream A)),
                             (Π (l1 l2 : El (Stream A)), El (B l1 l2) → El (Eq A (hd A l1) (hd A l2))) →
                             (Π (l1 l2 : El (Stream A)), El (B l1 l2) → El (B (tl A l1) (tl A l2))) →
                             El (B l1 l2) → El (Eq-stream A l1 l2);


// reduction
rule hd= $A $l1 $l2 (corec_eqstream $A $B $l1 $l2 $head $tail $p) ↪ $head $l1 $l2 $p;
rule tl~ $A $l1 $l2 (corec_eqstream $A $B $l1 $l2 $head $tail $p) ↪ corec_eqstream $A $B (tl $A $l1) (tl $A $l2) $head $tail ($tail $l1 $l2 $p);

rule hd= $A $l1 $l2 (coind_eqstream $A $B $l1 $l2 $head $tail $p) ↪ $head $l1 $l2 $p;
rule tl~ $A $l1 $l2 (coind_eqstream $A $B $l1 $l2 $head $tail $p) ↪ coind_eqstream $A $B (tl $A $l1) (tl $A $l2) $head $tail ($tail $l1 $l2 $p);

symbol eqstream-sym : El (set             ⇝ (λ A,
                          Stream A        ⇝ (λ l,
                          Stream A        ⇝ (λ l',
                          Eq-stream A l l'     ⇝ (λ _, Eq-stream A l' l)))))
     ≔ λ A l l' p, corec_eqstream A (λ l1 l2, Eq-stream A l2 l1) l' l (λ l1 l2 p, eq_inv A (hd A l2) (hd A l1) (hd= A l2 l1 p)) (λ l1 l2 p, tl~ A l2 l1 p) p;
                    
symbol eqstream-refl : El (set             ⇝ (λ A,
                           Stream A        ⇝ (λ l, Eq-stream A l l)))
     ≔ λ A l, coind_eqstream A (λ l1 l2, Eq (Stream A) l1 l2) l l (λ l1 l2 p, eq_lift (Stream A) l1 l2 A (hd A) p) (λ l1 l2 p, eq_lift (Stream A) l1 l2 (Stream A) (tl A) p) (refl (Stream A) l);

symbol eqstream-trans : El (set             ⇝ (λ A,
                            Stream A        ⇝ (λ l,
                            Stream A        ⇝ (λ l',
                            Stream A        ⇝ (λ l'',
                            Eq-stream A l l'     ⇝ (λ _,
                            Eq-stream A l' l''   ⇝ (λ _, Eq-stream A l l'')))))));
