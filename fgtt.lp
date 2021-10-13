constant symbol Sort : TYPE;    // Apred    Pred     Impred
constant symbol Set : Sort;     // Set   ↪ Set0 and Type0
constant symbol Prop : Sort;    // Prop  ↪ Set0 and Prop
constant symbol TSet : Sort;    // TSet  ↪ Set1 and Type1
constant symbol TProp : Sort;   // TProp ↪ Set1 and Type0
constant symbol HProp : Sort;   // ∀Prop ↪ Set1 and Prop
constant symbol U : Sort → TYPE;

symbol El : Π {s : Sort}, U s → TYPE;

constant symbol set : U TSet;    // Set  : TSet  ↪ Set0 : Set1 and Type0 : Type1 
rule El set ↪ U Set;
constant symbol prop : U TProp;  // Prop : TProp ↪ Set0 : Set1 and Prop  : Type0
rule El prop ↪ U Prop;

symbol ∨ : Sort → Sort → Sort;
notation ∨ infix left 6;

// sort ∨ sort,
rule Set   ∨ Set   ↪ Set
with Prop  ∨ Prop  ↪ Prop
with Set   ∨ Prop  ↪ Prop
with Prop  ∨ Set   ↪ Set

// tsort ∨ tsort 
with TSet  ∨ TSet  ↪ TSet
with TProp ∨ TProp ↪ TProp
with TSet  ∨ TProp ↪ TSet
with TProp ∨ TSet  ↪ TSet

// hsort ∨ hsort
with HProp ∨ HProp ↪ HProp

// sort ∨ tsort, tsort ∨ sort
with Set   ∨ TSet  ↪ TSet
with Prop  ∨ TProp ↪ TProp
with TSet  ∨ Set   ↪ TSet
with TProp ∨ Prop  ↪ HProp
with Set   ∨ TProp ↪ TProp
with Prop  ∨ TSet  ↪ TSet
with TProp ∨ Set   ↪ TProp
with TSet  ∨ Prop  ↪ HProp

// hsort ∨ sort, sort ∨ hsort
with HProp ∨ Prop  ↪ HProp
with Prop  ∨ HProp ↪ HProp
with HProp ∨ Set   ↪ TProp
with Set   ∨ HProp ↪ HProp

// hsort ∨ tsort, tsort ∨ hsort
with HProp ∨ TProp ↪ TProp
with TProp ∨ HProp ↪ HProp
with HProp ∨ TSet  ↪ TSet
with TSet  ∨ HProp ↪ HProp;

constant symbol ⇝ : Π {s1 s2: Sort} (A : U s1), (El A → U s2) → U (s1 ∨ s2);
notation ⇝ infix left 6;
rule El ($A ⇝ $B) ↪ Π (x : El $A), El ($B x);
