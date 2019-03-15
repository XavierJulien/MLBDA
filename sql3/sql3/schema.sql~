-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================

set sqlbl on


-- nettoyer le compte
@vider

-- Définition des types de données

prompt essai

@compile

create type piece as object (
 nom varchar2(20)
) not final;
/



create type matiere as object (
 nom varchar2(20),
 prix number(10),
 massev number(10)
);
/

create type qt_piece as object(
 quantite number(10),
 nom_piece ref piece
);
/

create type ens_piece as table of qt_piece;
/

create type piece_base under piece (
 est_en ref matiere
)not final;
/

create type piece_composite under piece (
 cout number(20),
 compo ens_piece
);
/

create type cubee under piece_base (
 arete number(10)
);
/
create type sphere under piece_base (
 rayon number(10)
);
/
create type cylindre under piece_base (
 rayon number(10),
 hauteur number(10)
);
/
create type parall under piece_base (
 hauteur number(10),
 largeur number(10),
 longueur number(10)
);
/














-- liste de tous les types créés
@liste
