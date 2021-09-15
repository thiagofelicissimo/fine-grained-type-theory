require open 
  fine-grained-type-theory.fgtt
  fine-grained-type-theory.ind-types.nat;

symbol plus : El Set (⇝ Set Set I Nat (λ _,
                      ⇝ Set Set I Nat (λ _, Nat))) ≔ λ n m, nat_rec (λ _, Nat) m (λ _ acc, succ acc) n;

compute plus (succ zero) zero;
