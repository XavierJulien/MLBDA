-- compl�ter l'ent�te 
-- ==================

-- NOM    :
-- Pr�nom :

-- NOM    :
-- Pr�nom :

-- Groupe :
-- binome :

-- ================================================
-- R1.	Quel est le nom et le prix au kilo des mati�res ?
prompt 'R1:'
select m.nom, m.prix from LesMatieres m;
@compile


-- R2.	Quel est le nom des mati�res dont le prix au kilo est inf�rieur � 5 EUR ?
prompt 'R2:'
select m.nom from LesMatieres m where m.prix < 5;


-- R3.	Quelles sont les pi�ces de base en bois ?
prompt 'R3:'
select p.nom from PiecesBase p where deref(p.est_en).nom='bois';


-- R4.	Quel est le nom des mati�res dont le libell� contient "fer" ?
prompt 'R4:'
select m.nom from LesMatieres m where m.nom like '%fer%';

-- R5.	Donner le nom des pi�ces de base formant la pi�ce nomm�e 'billard'
prompt 'R5:'
select p.nom from PiecesBase p, PiecesComposite pc where pc.nom='billard' and ref(p) in(select q.nom_piece from table(pc.compo) q);

-- R6.	Donner le nom de chaque mati�re avec son nombre de pi�ces de bases.
prompt 'R6:'


-- R7.	Quelles sont les mati�res pour lesquelles il existe au moins 3 pi�ces de base ?
prompt 'R7:'



