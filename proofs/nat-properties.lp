require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.nat;

symbol plus : El (Nat ⇝ (λ _,
                  Nat ⇝ (λ _, Nat))) ≔ λ n m, nat_rec (λ _, Nat) m (λ _ acc, succ acc) n;

compute plus (succ zero) zero;
