require open fine-grained-type-theory.fgtt;

// type
constant symbol Nat : U Set;

// constructors
constant symbol zero : El Nat;
constant symbol succ : El Nat → El Nat;

// eliminators
symbol nat_ind : Π P : El Nat → U Prop,
                   El (P zero) →
                   (Π n : El Nat, El (P n) → El (P (succ n))) →
                   Π n : El Nat, 
                   El (P n);

symbol nat_rec : Π P : El Nat → U Set,
                   El (P zero) →
                   (Π n : El Nat, El (P n) → El (P (succ n))) →
                   Π n : El Nat, 
                   El (P n);

symbol nat_hind : Π P : El Nat → U TProp,
                    El (P zero) →
                    (Π n : El Nat, El (P n) → El (P (succ n))) →
                    Π n : El Nat, 
                    El (P n);

symbol nat_hrec : Π P : El Nat → U TSet,
                    El (P zero) →
                    (Π n : El Nat, El (P n) → El (P (succ n))) →
                    Π n : El Nat, 
                    El (P n);

// computation rules                
rule nat_ind _ $p0 _ zero ↪ $p0
with nat_ind $P $p0 $ps (succ $n) ↪ $ps $n (nat_ind $P $p0 $ps $n);

rule nat_rec _ $p0 _ zero ↪ $p0
with nat_rec $P $p0 $ps (succ $n) ↪ $ps $n (nat_rec $P $p0 $ps $n);

rule nat_hind _ $p0 _ zero ↪ $p0
with nat_hind $P $p0 $ps (succ $n) ↪ $ps $n (nat_hind $P $p0 $ps $n);

rule nat_hrec _ $p0 _ zero ↪ $p0
with nat_hrec $P $p0 $ps (succ $n) ↪ $ps $n (nat_hrec $P $p0 $ps $n);
