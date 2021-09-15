require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.eq-prop
  fine-grained-type-theory.ind-types.or
  fine-grained-type-theory.ind-types.true
  fine-grained-type-theory.ind-types.false;

symbol proof_irel : U ∀Prop ≔ ⇝ TProp Prop I prop (λ A,
                              ⇝ Prop  Prop I A (λ a,
                              ⇝ Prop  Prop I A (λ b, eqp A a b)));


// needs or_hind, the large elimination for Or
symbol proof_rel_proof : El ∀Prop (⇝ ∀Prop Prop I proof_irel (λ _, ⊥))
     ≔ λ p, eqp_ind (Or ⊤ ⊤) (inl ⊤ ⊤ I-⊤) 
                    (λ y p, or_hind ⊤ ⊤ (λ _, prop) (λ _, ⊤) (λ _, ⊥) y)
                    I-⊤ (inr ⊤ ⊤ I-⊤) 
                    (p (Or ⊤ ⊤) (inl ⊤ ⊤ I-⊤) (inr ⊤ ⊤ I-⊤));
                    













