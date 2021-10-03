require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.nat
  fine-grained-type-theory.ind-types.eq
  fine-grained-type-theory.ind-types.true
  fine-grained-type-theory.ind-types.false;
  
symbol PA1 : El (Nat ⇝ (λ x, Eq Nat x x)) ≔ refl Nat;

symbol PA2 : El (Nat ⇝ (λ x,
                 Nat ⇝ (λ y,
                 (Eq Nat x y) ⇝ (λ _, Eq Nat y x))))
     ≔ λ a b p, eq_ind Nat a (λ x _, Eq Nat x a) (refl Nat a) b p;

symbol PA3 : El (Nat ⇝ (λ x,
                 Nat ⇝ (λ y,
                 Nat ⇝ (λ z,
                 (Eq Nat x y) ⇝ (λ _,
                 (Eq Nat y z) ⇝ (λ _, Eq Nat x z)))))) 
     ≔ λ a b c p q, eq_ind Nat b (λ x _, Eq Nat a x) p c q;

symbol PA4 : El (Nat ⇝ (λ x,
                 Nat ⇝ (λ y,
                 (Eq Nat x y) ⇝ (λ _, Eq Nat (succ x) (succ y)))))
     ≔ λ a b p, eq_ind Nat a (λ x _, Eq Nat (succ a) (succ x)) (refl Nat (succ a)) b p;

symbol eq_lift : El (set ⇝ (λ A, 
                     A ⇝ (λ x,   
                     A ⇝ (λ y,   
                     set ⇝ (λ B, 
                     (A ⇝ (λ _, B)) ⇝ (λ f,
                     (Eq A x y) ⇝ (λ _, Eq B (f x) (f y))))))))
     ≔ λ A x y B f p, eq_ind A x (λ y _, Eq B (f x) (f y)) (refl B (f x)) y p;

symbol pred ≔ nat_rec (λ _, Nat) zero (λ m _, m);


symbol PA5 : El (Nat ⇝ (λ x,
                 Nat ⇝(λ y,
                 (Eq Nat (succ x) (succ y)) ⇝ (λ _, Eq Nat x y))))
     ≔ λ a b p, eq_lift Nat (succ a) (succ b) Nat pred p;

symbol PA6 : El (Nat ⇝ (λ x,
                 (Eq Nat (succ x) zero) ⇝ (λ _, ⊥)))
     ≔ λ a p, eq_ind Nat (succ a) (λ x _, nat_hind (λ _, prop) ⊥ (λ _ _, ⊤ ) x) I-⊤ zero p;

symbol plus : El (Nat ⇝ (λ _,
                  Nat ⇝ (λ _, Nat)))
     ≔ λ a b, nat_rec (λ _, Nat) b (λ _ n, succ n) a;


symbol times : El (Nat ⇝ (λ _,
                   Nat ⇝ (λ _, Nat)))
     ≔ λ a b, nat_rec (λ _, Nat) zero (λ _ n, plus b n) a;

symbol PA7 : El (Nat ⇝ (λ x, Eq Nat (plus zero x) x))
     ≔ λ a, refl Nat a;

symbol PA8 : El (Nat ⇝ (λ x, 
                 Nat ⇝ (λ y, Eq Nat (plus (succ x) y) (succ (plus x y)))))
     ≔ λ x y, refl Nat (plus (succ x) y);

symbol PA9 : El (Nat ⇝ (λ x, Eq Nat (times zero x) zero))
     ≔ λ a, refl Nat zero;

symbol PA10 : El (Nat ⇝ (λ x, 
                  Nat ⇝ (λ y, Eq Nat (times (succ x) y) (plus y (times x y)))))
     ≔ λ x y, refl Nat (times (succ x) y);

symbol PA11 : El ((Nat ⇝ (λ _, prop)) ⇝ (λ P,
                  (P zero) ⇝ (λ _,
                  (Nat ⇝ (λ n, (P n) ⇝ (λ _, P (succ n)))) ⇝ (λ _,
                  Nat ⇝ (λ n, P n)))))
     ≔ nat_ind;
  
                                                



  

