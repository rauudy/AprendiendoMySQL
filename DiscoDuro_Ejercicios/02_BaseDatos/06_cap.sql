-- 14. Mostrar todos los pokemon que evolucionan por piedra. Hacer una vista de ello.

-- 15. Mostrar todos los pokemon que no pueden evolucionar. Hacer una vista de ello.

-- 16. Mostrar la cantidad de los pokemon de cada tipo. Hacer una vista de ello.


-- 14. Mostrar todos los pokemon que evolucionan por piedra. Hacer una vista de ello.
-- create or replace view pokemon_evolucion_piedra as
select distinct p.numero_pokedex, p.nombre
from pokemon p, pokemon_forma_evolucion pfe, 
forma_evolucion fe, tipo_evolucion te
where p.numero_pokedex = pfe.numero_pokedex 
and pfe.id_forma_evolucion = fe.id_forma_evolucion
and fe.tipo_evolucion = te.id_tipo_evolucion
and lower(te.tipo_evolucion) = 'piedra';

CREATE OR REPLACE VIEW pokemon_evolucion_piedra AS
SELECT DISTINCT pokemon.numero_pokedex, pokemon.nombre, tipo_evolucion.tipo_evolucion
FROM pokemon, pokemon_forma_evolucion, forma_evolucion, tipo_evolucion
WHERE pokemon.numero_pokedex = pokemon_forma_evolucion.numero_pokedex
AND pokemon_forma_evolucion.id_forma_evolucion = forma_evolucion.id_forma_evolucion
AND forma_evolucion.tipo_evolucion = tipo_evolucion.id_tipo_evolucion
AND tipo_evolucion.tipo_evolucion = "Piedra"
ORDER BY pokemon.numero_pokedex;


-- 15. Mostrar todos los pokemon que no pueden evolucionar. Hacer una vista de ello.
CREATE OR REPLACE VIEW pokemon_no_evolucionan AS
SELECT numero_pokedex, nombre
FROM pokemon
WHERE pokemon.numero_pokedex NOT IN (
	SELECT pokemon.numero_pokedex FROM pokemon, pokemon_forma_evolucion
    WHERE pokemon.numero_pokedex = pokemon_forma_evolucion.numero_pokedex
)
ORDER BY pokemon.numero_pokedex;
SELECT * FROM pokemon_no_evolucionan;

select p.numero_pokedex, p.nombre
from pokemon p, evoluciona_de ev
where p.numero_pokedex = ev.pokemon_evolucionado
and not exists (select pokemon_origen from evoluciona_de where pokemon_origen = p.numero_pokedex)
union
select p.numero_pokedex, p.nombre
from pokemon p
where not exists (select * 
					from evoluciona_de 
					where pokemon_origen = p.numero_pokedex or pokemon_evolucionado = p.numero_pokedex);


-- 16. Mostrar la cantidad de los pokemon de cada tipo. Hacer una vista de ello.
CREATE OR REPLACE VIEW cantidad_tipo_pokemon AS
SELECT tipo.nombre AS "Tipo", COUNT(*) AS "Cnt. Pokemon"
FROM pokemon, pokemon_tipo, tipo
WHERE pokemon.numero_pokedex = pokemon_tipo.numero_pokedex
AND pokemon_tipo.id_tipo = tipo.id_tipo
GROUP BY tipo.nombre
ORDER BY tipo.nombre;
SELECT * FROM cantidad_tipo_pokemon;

create or replace view cantidad_tipo_pokemon as
select t.nombre as tipo, count(*) as cantidad
from pokemon p, pokemon_tipo pt, tipo t
where p.numero_pokedex = pt.numero_pokedex
and pt.id_tipo = t.id_tipo
group by t.nombre;

select * from cantidad_tipo_pokemon;