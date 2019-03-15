-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================

-- stockage des données : définition des relations
-- ====================

create table LesMatieres of matiere;
create table PiecesBase of piece_base; 
create table PiecesComposite of piece_composite
nested table compo store as tab1;

-- instanciation des objets
-- ========================

insert into LesMatieres values (
       matiere('bois',10,2)
       );

insert into LesMatieres values (
       matiere('fer',5,3)
       );
      
insert into LesMatieres values (
       matiere('ferrite',6,10)
       );



create or replace procedure insere_pieces_de_base as
m2 ref Matiere;
begin
select ref(m) into m2 from LesMatieres m where m.nom='bois';
insert into PiecesBase values(cylindre('canne',m2,2,30));
insert into PiecesBase values(sphere('pied',m2,30));
insert into PiecesBase values(parall('plateau',m2,1,100,80));
select ref(m) into m2 from LesMatieres m where m.nom='fer';
insert into PiecesBase values(cylindre('clou',m2,1,20));
insert into PiecesBase values(sphere('boule',m2,30));
select ref(m) into m2 from LesMatieres m where m.nom='ferrite';
insert into PiecesBase values(cylindre('aimant',m2,2,5));
end;
@compile

begin insere_pieces_de_base; end;
@compile

create or replace procedure insere_pieces_composites as
p1 ref piece;
p2 ref piece;
p3 ref piece;
begin
select ref(p) into p1 from PiecesBase p where p.nom='pied';
select ref(p) into p2 from PiecesBase p where p.nom='clou';
select ref(p) into p3 from PiecesBase p where p.nom='plateau';
insert into PiecesComposite values(
piece_composite('table',100,ens_piece(qt_piece(4,p1),qt_piece(12,p2),qt_piece(1,p3))));
select ref(p) into p1 from PiecesComposite p where p.nom='table';
select ref(p) into p2 from PiecesBase p where p.nom='boule';
select ref(p) into p3 from PiecesBase p where p.nom='canne';
insert into PiecesComposite values(
piece_composite('billard',10,ens_piece(qt_piece(1,p1),qt_piece(3,p2),qt_piece(2,p3))));
end;
@compile

begin insere_pieces_composites; end;
@compile

