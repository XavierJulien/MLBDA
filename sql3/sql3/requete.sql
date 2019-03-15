-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================
-- R1.	Quel est le nom et le prix au kilo des matières ?
prompt 'R1:'
select m.nom, m.prix from LesMatieres m;
@compile


-- R2.	Quel est le nom des matières dont le prix au kilo est inférieur à 5 EUR ?
prompt 'R2:'
select m.nom from LesMatieres m where m.prix < 5;


-- R3.	Quelles sont les pièces de base en bois ?
prompt 'R3:'
select p.nom from PiecesBase p where deref(p.est_en).nom='bois';


-- R4.	Quel est le nom des matières dont le libellé contient "fer" ?
prompt 'R4:'
select m.nom from LesMatieres m where m.nom like '%fer%';

-- R5.	Donner le nom des pièces de base formant la pièce nommée 'billard'
prompt 'R5:'
select p.nom from PiecesBase p, PiecesComposite pc where pc.nom='billard' and ref(p) in(select q.nom_piece from table(pc.compo) q);

-- R6.	Donner le nom de chaque matière avec son nombre de pièces de bases.
prompt 'R6:'


-- R7.	Quelles sont les matières pour lesquelles il existe au moins 3 pièces de base ?
prompt 'R7:'



