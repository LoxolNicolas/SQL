/* 1 */

select distinct categorie 
from clients;

/* 2 */

select Nomclt
from clients
where categorie = 'A';

/* 3 */

select count(*)
from produits;

/* 4 */

select count(*)
from livraisons
where Numclt = 1;

/* 5 */

select Numclt
from livraisons
where Numproduit = 6 and quantite > 2;

/* 6 */

select max(prixbrut)
from produits;

/* 7 */

select Numproduit, libelle
from produits
where prixbrut = (select max(prixbrut)
                 from produits);

/* 8 */

select Nomclt
from clients
where Nomclt like 'Du%';

/* 9 */

select Numclt
from livraisons
where Numproduit=5 OR Numproduit=6;

/* 10 */

select Numclt
from livraisons
where Numproduit=1
INTERSECT
select Numclt
from livraisons
where Numproduit=6;

/* 11 */

select distinct Nomclt, categorie
from livraisons natural join clients;

/* 12 */

select Numproduit, libelle
from clients natural join produits natural join livraisons
where categorie = 'A' and prixbrut < 55;

/* 13 */

select libelle
from produits natural join clients natural join livraisons
MINUS
select libelle
from produits natural join clients natural join livraisons
where Nomclt !='Haddock';

/* 14 */

select libelle
from produits natural join livraisons
where Numclt = 3
INTERSECT
select libelle
from produits natural join livraisons
where Numclt = 5;

/* 15 */

select distinct L1.Numclt
from livraisons L1 join livraisons L2 ON L1.Numclt = L2.Numclt
where L1.Numproduit != L2.Numproduit;

/* 16 */

select distinct L1.Numclt
from livraisons L1 join livraisons L2 ON L1.Numclt = L2.Numclt
where L1.Numproduit != L2.Numproduit and L1.quantite = L2.quantite;

/* 17 */

select libelle
from produits
where exists (select libelle
            from livraisons natural join produits);

/* 18 */

select libelle
from produits
where not exists (select libelle
            from livraisons natural join produits);

/* 19 */

select sum(quantite) "Nbre livraisons"
from livraisons 
group by Numproduit;

/* 19 v2 */

select Numproduit, count(*) "Nbre livraisons"
from livraisons
group by Numproduit;

/* 20 */

select Numclt
from livraisons
group by Numclt
having count(Numproduit) = (select distinct count(Numproduit)
                            from livraisons);
                           select Numclt

/* 21 */

select Numclt
from livraisons natural join produits
where prixbrut < 50
group by Numclt
having count(Numproduit) = (select distinct count(Numproduit)
                            from livraisons natural join produits
                            where prixbrut < 50);

/* 22 */

select avg(quantite)
from livraisons
group by Numproduit
having count(*) > 2
order by Numproduit desc;

/* 23 */

select libelle, count(*)
from livraisons L, produits P
where L.Numproduit = P.Numproduit
group by libelle
having count(P.Numproduit) = (select max(count(*))
                             from livraisons L2
                             group by L2.Numproduit);

/* 24 */

select libelle, sum(quantite*prixbrut) "Chiffre d'affaire"
from produits natural join livraisons
group by Numproduit, libelle;

/* 25 */

select C.Numclt, Nomclt, Numproduit, quantite
from clients C left join livraisons L on C.Numclt = L.Numclt;    

/* 26 */

select Numprocompose, Numprocomposant, quantite
from composition
connect by prior Numprocompose = Numprocomposant
start with Numprocompose = 40;


