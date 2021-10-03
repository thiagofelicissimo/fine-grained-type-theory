require open fine-grained-type-theory.fgtt;
require open fine-grained-type-theory.ind-types.eq;

symbol eq_lift : El (set             ⇝ (λ A,
                     A               ⇝ (λ x,
                     A               ⇝ (λ y,
                     set             ⇝ (λ B,
                     (A ⇝ (λ _, B)) ⇝ (λ f,
                     (Eq A x y)      ⇝ (λ _, Eq B (f x) (f y))))))))
     ≔ λ A x y B f p, eq_ind A x (λ y _, Eq B (f x) (f y)) (refl B (f x)) y p;

symbol eq_inv : El (set             ⇝ (λ A,
                     A               ⇝ (λ x,
                     A               ⇝ (λ y,
                     (Eq A x y)      ⇝ (λ _, Eq A y x)))))
     ≔ λ A x y p, eq_ind A x (λ y _, Eq A y x) (refl A x) y p;

symbol eq_comp : El (set             ⇝ (λ A,
                     A               ⇝ (λ x,
                     A               ⇝ (λ y,
                     A               ⇝ (λ z,
                     (Eq A x y)      ⇝ (λ _,
                     (Eq A y z)      ⇝ (λ _, Eq A x z)))))))
     ≔ λ A x y z x=y y=z, eq_ind A y (λ y _, Eq A y z) y=z x (eq_inv A x y x=y);




//symbol eq_transport : El ∀Prop (⇝ TSet  ∀Prop I set (λ A, 
//                           ⇝ Set   ∀Prop I A   (λ x,   
//                           ⇝ Set   ∀Prop I A   (λ y,   
//                           ⇝ TSet  Prop I set (λ B, 
//                           ⇝ Set   Prop I (⇝ Set Set I A (λ _, B)) (λ f,
//                           ⇝ Prop  Prop I (eq A x y) (λ _, eq B (f x) (f y))))))))



