require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.eq-prop
  fine-grained-type-theory.ind-types.or
  fine-grained-type-theory.ind-types.true
  fine-grained-type-theory.ind-types.false;

symbol proof_irel : U HProp ≔ prop ⇝ (λ A,
                              A    ⇝ (λ a,
                              A    ⇝ (λ b, Eq-prop A a b)));


// needs or_hind, the large elimination for Or
symbol proof_rel_proof : El (proof_irel ⇝ (λ _, ⊥))
     ≔ λ p, eqp_ind (Or ⊤ ⊤) (inl ⊤ ⊤ I-⊤) 
                    (λ y p, or_hind ⊤ ⊤ (λ _, prop) (λ _, ⊤) (λ _, ⊥) y)
                    I-⊤ (inr ⊤ ⊤ I-⊤) 
                    (p (Or ⊤ ⊤) (inl ⊤ ⊤ I-⊤) (inr ⊤ ⊤ I-⊤));
                    













