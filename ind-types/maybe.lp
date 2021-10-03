require open fine-grained-type-theory.fgtt;

// type
constant symbol Maybe : U Set → U Set;

// constructors
constant symbol some : Π (A : U Set), El A → El (Maybe A);
constant symbol none : Π (A : U Set), El (Maybe A);

// eliminators
symbol maybe_rec : Π (A : U Set)
                     (P : El (Maybe A) → U Set),
                   (Π a : El A, El (P (some A a))) →
                   El (P (none A)) →
                   Π (ma : El (Maybe A)), El (P ma);

symbol maybe_hrec : Π (A : U Set)
                     (P : El (Maybe A) → U TSet),
                   (Π a : El A, El (P (some A a))) →
                   El (P (none A)) →
                   Π (ma : El (Maybe A)), El (P ma);

symbol maybe_ind : Π (A : U Set)
                     (P : El (Maybe A) → U Set),
                   (Π a : El A, El (P (some A a))) →
                   El (P (none A)) →
                   Π (ma : El (Maybe A)), El (P ma);

symbol maybe_hind : Π (A : U Set)
                     (P : El (Maybe A) → U TProp),
                   (Π a : El A, El (P (some A a))) →
                   El (P (none A)) →
                   Π (ma : El (Maybe A)), El (P ma);

// reduction
rule maybe_rec $A $P $psome $pnone (some $A $a) ↪ $psome $a;
rule maybe_rec $A $P $psome $pnone (none $A) ↪ $pnone;

rule maybe_hrec $A $P $psome $pnone (some $A $a) ↪ $psome $a;
rule maybe_hrec $A $P $psome $pnone (none $A) ↪ $pnone;


rule maybe_ind $A $P $psome $pnone (some $A $a) ↪ $psome $a;
rule maybe_ind $A $P $psome $pnone (none $A) ↪ $pnone;

rule maybe_hind $A $P $psome $pnone (some $A $a) ↪ $psome $a;
rule maybe_hind $A $P $psome $pnone (none $A) ↪ $pnone;


