--Creation des tables--
Create table LesMatieres of Matiere;
@compile

Create table Les_Pieces_Base of Base;
@compile

Create table Les_Pieces_Composites of Composite
       Nested Table l_base store as t2 ;
@compile


--Insertions--
insert into LesMatieres values(Matiere('bois',10,2));

insert into LesMatieres values(Matiere('fer',5,3));

insert into LesMatieres values(Matiere('ferrite',6,10));

--Procédures--
create or replace procedure insere_pieces_de_base as
m2 ref Matiere;
begin
select ref(m) into m2 from LesMatieres m where m.nom='bois'; 
insert into Les_Pieces_Base values( Cylindre('canne',m2,2,30));	
insert into Les_Pieces_Base values(Parallepipede('plateau',m2,1,100,80));	
insert into Les_Pieces_Base values(Sphere('pied',m2,30));	

select ref(m) into m2 from LesMatieres m where m.nom='fer';
insert into Les_Pieces_Base values(Sphere('boule',m2,30));
insert into Les_Pieces_Base values(Cylindre('clou',m2,1,20));

select ref(m) into m2 from LesMatieres m where m.nom='ferrite';
insert into Les_Pieces_Base values(Cylindre('aimant',m2,2,5));
end;
@compile

begin insere_pieces_de_base; end;
@compile

Select * from Les_Pieces_Base;


create or replace procedure insere_pieces_composite as
p1 ref Piece;
p2 ref Piece;
p3 ref Piece;
begin
select ref(p) into p1 from Les_Pieces_Base p where p.nom='plateau';
select ref(p) into p2 from Les_Pieces_Base p where p.nom='pied';
select ref(p) into p3 from Les_Pieces_Base p where p.nom='clou';
insert into Les_Pieces_Composites  values(
Composite('tables',100,
liste_piece(
Piece_quantite(p1,1),
Piece_quantite(p2,4),
Piece_quantite(p3,12))));

select ref(p) into p1 from Les_Pieces_Composites p where p.nom='tables';
select ref(p) into p2 from Les_Pieces_Base p where p.nom='boule';
select ref(p) into p3 from Les_Pieces_Base p where p.nom='canne';
insert into Les_Pieces_Composites values(
Composite('billard',10,liste_piece(Piece_quantite(p1,1),
				   Piece_quantite(p2,3),
	    			   Piece_quantite(p3,2))));
end;
@compile

begin insere_pieces_composite;
end;
@compile

Select * from Les_Pieces_Composites;
       
