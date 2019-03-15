-- MABD TP1 SQL avec la base MONDIAL


-- -------------------- binome -------------------------
-- NOM XAVIER
-- Prenom Julien

-- NOM RAIMBAULT
-- Prenom Titouan
-- -----------------------------------------------------

-- pour se connecter à oracle:
-- sqlplus E1234567/E1234567@oracle
-- remplacer E12345657 par la lettre E suivie de votre numéro de login

set sqlbl on
set linesize 150

prompt schema de la table Country
desc Country

prompt schema de la table City
desc City

prompt schema de la table IsMember
desc IsMember

prompt schema de la table City
desc City

-- pour afficher un nuplet entier sur une seule ligne
column name format A15
column capital format A15
column province format A20

-- Requete 0

select name, Code from Country where name = 'France';

-- Requete 1
prompt
--10
SELECT o.name, COUNT(*) AS NbPays, SUM(c.population)
FROM Country c, Organization o, IsMember i
WHERE i.country = c.code AND i.organization = o.abbreviation
GROUP BY o.name, o.abbreviation
Order by NbPays desc;

--11
SELECT o.name, COUNT(*), SUM(c.population)
FROM Country c, Organization o, IsMember i
WHERE i.country = c.code AND i.organization = o.abbreviation
GROUP BY o.name, o.abbreviation
HAVING Count(*) > 100;

--12
SELECT c.name, m.name
FROM Country c, encompasses e, Mountain m, geo_mountain g
Where e.country = c.code AND g.country = c.code AND g.mountain = m.name
AND e.continent = 'America'
AND m.height >= All(
	SELECT  m1.height
	FROM   Mountain m1, geo_mountain g1
	WHERE g1.country = c.code AND g1.mountain = m1.name);

--14
(SELECT r.name 
 FROM River r
 WHERE r.river = 'Nile')
UNION 
(SELECT r2.name
 FROM River r1, River r2
 WHERE r1.river = 'Nile' AND r1.name = r2.river)
UNION
(SELECT r1.name
 FROM River r1, River r2, River r3
 WHERE r3.river = 'Nile' AND r3.name = r2.river and r2.name = r1.river);
-- Requete 2
prompt 
--15 
(SELECT r.length
 FROM River r
 WHERE r.river = 'Nile')
UNION 
(SELECT r2.length
 FROM River r1, River r2
 WHERE r1.river = 'Nile' AND r1.name = r2.river)
UNION
(SELECT r1.length
 FROM River r1, River r2, River r3
 WHERE r3.river = 'Nile' AND r3.name = r2.river and r2.name = r1.river);

SELECT SUM(r.length)
FROM River r, River r2
WHERE (r2.river = 'Nile' or r2.name = r.river) or r.river = 'Nile' or r.name = 'Nile';

--16a

SELECT o.name, Count(*)
FROM Country c, Organization o, IsMember i
WHERE i.country = c.code AND i.organization = o.abbreviation
HAVING Count(*) = (SELECT MAX(COUNT(*))
       	   FROM Country c, Organization o, IsMember i
	   WHERE i.country = c.code AND i.organization = o.abbreviation
	   Group by o.name, o.abbreviation)
Group by o.name, o.abbreviation;

--16b
SELECT * FROM
(SELECT o.name, COUNT(*) AS nbpays
FROM Country c, Organization o, IsMember i
WHERE i.country = c.code AND i.organization = o.abbreviation
GROUP BY o.name, o.abbreviation
ORDER BY nbpays desc)
Where rownum <= 3;

--17/

Select area/population from
(SELECT SUM(area) as area FROM(
(SELECT c1.area
FROM Country c1, Country c2, Borders b
WHERE c2.name = 'Algeria' 
AND (c1.code = b.country1 and c2.code = b.country2
OR   c1.code = b.country2 and c2.code = b.country1))
Union
(SELECT c1.area
FROM Country c1, Country c2, Borders b
WHERE c2.name = 'Libya' 
AND (c1.code = b.country1 and c2.code = b.country2
OR   c1.code = b.country2 and c2.code = b.country1)))),
(SELECT SUM(population) as population FROM(
(SELECT c1.population
FROM Country c1, Country c2, Borders b
WHERE c2.name = 'Algeria' 
AND (c1.code = b.country1 and c2.code = b.country2
OR   c1.code = b.country2 and c2.code = b.country1))
Union
(SELECT c1.population
FROM Country c1, Country c2, Borders b
WHERE c2.name = 'Libya' 
AND (c1.code = b.country1 and c2.code = b.country2
OR   c1.code = b.country2 and c2.code = b.country1))));

--18

SELECT area-desert/population
FROM
	(Select SUM(d.area) as desert
from geo_desert g, country c, desert d
where c.code = g.country AND d.name = g.desert
and c.name in ((SELECT c1.name
    	        FROM Country c1, Country c2, Borders b
	        WHERE c2.name = 'Algeria'
	        AND (c1.code = b.country1 and c2.code = b.country2 OR c1.code = b.country2 and c2.code = b.country1))
    	       Union
	       (SELECT c1.name
	        FROM Country c1, Country c2, Borders b
		WHERE c2.name = 'Libya'
		AND (c1.code = b.country1 and c2.code = b.country2 OR c1.code = b.country2 and c2.code = b.country1)))),
	(SELECT SUM(area) as area FROM(
		(SELECT c1.area
		FROM Country c1, Country c2, Borders b
		WHERE c2.name = 'Algeria' 
		AND (c1.code = b.country1 and c2.code = b.country2
		OR   c1.code = b.country2 and c2.code = b.country1))
     	    Union
		(SELECT c1.area
		FROM Country c1, Country c2, Borders b
		WHERE c2.name = 'Libya' 
		AND (c1.code = b.country1 and c2.code = b.country2
		OR   c1.code = b.country2 and c2.code = b.country1)))),
	(SELECT SUM(population) as population FROM(
		(SELECT c1.population
		FROM Country c1, Country c2, Borders b
		WHERE c2.name = 'Algeria' 
		AND (c1.code = b.country1 and c2.code = b.country2
		OR   c1.code = b.country2 and c2.code = b.country1))
            Union
		(SELECT c1.population
		FROM Country c1, Country c2, Borders b
		WHERE c2.name = 'Libya' 
		AND (c1.code = b.country1 and c2.code = b.country2
		OR   c1.code = b.country2 and c2.code = b.country1))));



