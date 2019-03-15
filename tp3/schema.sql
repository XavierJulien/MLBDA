--Creation des types--

Create type Matiere AS Object(
       nom Varchar2(20),
       prix_kilo Number(10),
       masse_volumique Number(10)
);
@compile


create type Piece as object(
 nom varchar2(20)
) not final;
@compile

Create type Piece_quantite AS Object(
       pie ref Piece,
       quantite Number(10)
);
@compile

Create type liste_piece AS TABLE OF Piece_quantite;
@compile

Create type Base UNDER Piece(
       mat ref Matiere,
       not instantiable member function volume return Number,
       not instantiable member function masse return Number,
       not instantiable member function prix return Number
)not final not instantiable;
@compile
Create type Composite UNDER Piece(
       cout Number(20),
       l_base liste_piece
);
@compile

Create type Piece_composite_quantite AS Object(
       piece ref Composite,
       quantité Number
);
@compile

Create type Cubes UNDER Base(
       dimensions Number,
       overriding member function volume return Number,
       overriding member function masse return Number,
       overriding member function prix return Number
);
@compile

Create type Sphere UNDER Base(
       rayon Number,
       overriding member function volume return Number,
       overriding member function masse return Number,
       overriding member function prix return Number
);
@compile

Create type Cylindre UNDER Base(
       diametre Number,
       hauteur Number,
       overriding member function volume return Number,
       overriding member function masse return Number,
       overriding member function prix return Number
);
@compile

Create type Parallepipede Under Base(
       hauteur Number,
       longueur Number,
       profondeur Number,
       overriding member function volume return Number,
       overriding member function masse return Number,
       overriding member function prix return Number
       
);
@compile
