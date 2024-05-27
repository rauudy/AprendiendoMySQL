-- 1. Mostrar el nombre de todos los pokemon

-- 2. mostrar los pokemon que pesen menos de 10k

-- 3. mostrar los pokemon de tipo agua.

-- ? ------------------------------------------------------------------------------

-- 1. Mostrar el nombre de todos los pokemon
SELECT * FROM pokemon;

-- 2. mostrar los pokemon que pesen menos de 10k
SELECT * FROM pokemon WHERE peso <= 10;

-- 3. mostrar los pokemon de tipo agua.
SELECT *
FROM pokemon
JOIN pokemon_tipo ON pokemon.numero_pokedex = pokemon_tipo.numero_pokedex
JOIN tipo ON tipo.id_tipo = pokemon_tipo.id_tipo
WHERE LOWER(tipo.nombre) = "agua";

Select *
From pokemon p, pokemon_tipo pt, tipo t
Where p.numero_pokedex = pt.numero_pokedex and pt.id_tipo = t.id_tipo
And Lower(t.nombre) = "agua";

select p.nombre
from pokemon p, pokemon_tipo pt, tipo t
where p.numero_pokedex = pt.numero_pokedex and pt.id_tipo=t.id_tipo
and lower(t.nombre) = 'agua';

select *
from pokemon p, pokemon_tipo pt
where p.numero_pokedex = pt.numero_pokedex
and pt.id_tipo = (select id_tipo from tipo t where lower(t.nombre) = 'agua');