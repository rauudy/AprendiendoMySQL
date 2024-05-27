-- 7. Mostrar aquellos pokemon que evolucionan por intercambio.

-- 8. Mostrar el nombre del movimiento con mas prioridad.

-- 9. Mostrar el pokemon mas pesado.


-- 7. Mostrar aquellos pokemon que evolucionan por intercambio.
SELECT p.nombre, te.tipo_evolucion
FROM pokemon p, pokemon_forma_evolucion pfe, forma_evolucion fe, tipo_evolucion te
WHERE p.numero_pokedex = pfe.numero_pokedex
AND pfe.id_forma_evolucion = fe.id_forma_evolucion
AND fe.tipo_evolucion = te.id_tipo_evolucion
AND te.tipo_evolucion = "Intercambio";

SELECT pokemon.nombre, tipo_evolucion.tipo_evolucion
FROM pokemon
JOIN pokemon_forma_evolucion ON pokemon.numero_pokedex = pokemon_forma_evolucion.numero_pokedex
JOIN forma_evolucion ON pokemon_forma_evolucion.id_forma_evolucion = forma_evolucion.id_forma_evolucion
JOIN tipo_evolucion ON forma_evolucion.tipo_evolucion = tipo_evolucion.id_tipo_evolucion
WHERE tipo_evolucion.tipo_evolucion = "Intercambio";

-- 8. Mostrar el nombre del movimiento con mas prioridad.
SELECT pokemon.nombre, movimiento.nombre, movimiento.prioridad
FROM pokemon, pokemon_movimiento_forma, movimiento
WHERE pokemon.numero_pokedex = pokemon_movimiento_forma.numero_pokedex
AND pokemon_movimiento_forma.id_movimiento = movimiento.id_movimiento
AND movimiento.prioridad > 0;

SELECT *
FROM movimiento
WHERE prioridad > 0;

select *
from movimiento mov
where prioridad = (select max(prioridad) 
					from movimiento);
                    

-- 9. Mostrar el pokemon mas pesado.
SELECT nombre, peso
FROM pokemon
WHERE peso = (
	SELECT MAX(peso) FROM pokemon
)