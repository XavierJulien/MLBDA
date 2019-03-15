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
select nom,prix_kilo from lesmatieres;


-- R2.	Quel est le nom des matières dont le prix au kilo est inférieur à 5 EUR ?
prompt 'R2:'
select nom from lesmatieres where prix_kilo <'5';


-- R3.	Quelles sont les pièces de base en bois ?
prompt 'R3:'
select * from Les_pieces_base b where deref(mat).nom = 'bois';


-- R4.	Quel est le nom des matières dont le libellé contient "fer" ?
prompt 'R4:'
select nom from Lesmatieres where nom like '%fer%';

-- R5.	Donner le nom des pièces de base formant la pièce nommée 'billard'
prompt 'R5:'
select deref(value(p).pie).nom from les_pieces_composites c, table(c.l_base) p where c.nom='billard';

-- R6.	Donner le nom de chaque matière avec son nombre de pièces de bases.
prompt 'R6:'
select m.nom, count(*) from lesmatieres m,les_pieces_base b where deref(b.mat).nom = m.nom group by m.nom;

-- R7.	Quelles sont les matières pour lesquelles il existe au moins 3 pièces de base ?
prompt 'R7:'
select m.nom, count(*) from lesmatieres m,les_pieces_base b where deref(b.mat).nom = m.nom having count(*)>=3 group by m.nom;


