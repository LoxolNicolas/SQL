/* 1 */

select volnum
from vol
where villedep = '&1' and to_char(heurearr, 'HH24:MM') < '&2';

/* 2 */

select Avnum, Avnom
from Avion
where avnum != 3 and localisation = (select localisation
                     from Avion
                     where avnum = 3);

/* 3 */

select Plnom, Plprenom
from pilote
where salaire > (select avg(salaire)
                from pilote);

/* 4 */

select Plnom, Plprenom
from pilote
where ville = 'NICE' and salaire > (select max(salaire)
                                    from pilote
                                    where ville = 'PARIS');

/* 5 */

select Plnom, Plprenom
from pilote
where ville = 'NICE' and salaire > (select min(salaire)
                                    from pilote
                                    where ville = 'PARIS');

/* 6 */ 

select Plnom, Plprenom
from pilote
where ville = (select ville from pilote where Plnom = 'MIRANDA') 
and salaire = (select salaire from pilote where Plnom = 'MIRANDA');

/* 7 */

select Plnom, Plprenom, salaire
from pilote
order by salaire desc, Plnom asc;

/* 8 */

select Plnum, avnum, count(*)
from vol
group by Plnum, Avnum
order by Plnum;

/* 9a */

select Plnum, count(volnum)
from vol
group by Plnum
having count(volnum) > 5;

/* 9b */

select Plnom, count(volnum)
from vol natural join pilote
group by Plnum, Plnom
having count(volnum) >= 5;

/* 10 */

select Avnom
from Avion
where capacite > 250 or localisation = 'PARIS';