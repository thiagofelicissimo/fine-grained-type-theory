require open 
  fine-grained-type-theory.fgtt;

rule ∀Prop ↪ Prop; // impredicativity

rule ∨ TProp Prop  Prop ↪ tt
with ∨ TSet  Prop  Prop ↪ tt

with ∨ TSet  Prop Prop ↪ tt 
with ∨ TProp Prop Prop ↪ tt 

with ∨ Set   Prop Prop ↪ tt 
with ∨ Prop  Prop Prop ↪ tt 

with ∨ Prop  Prop Prop ↪ tt 
with ∨ Prop  Prop  Prop ↪ tt;
