-- 11. Mostrar todos los movimientos que aprende pikachu.

-- 12. Mostrar todos los movimientos que aprende pikachu por MT.

-- 13. Mostrar todos los movimientos de tipo normal que aprende pikachu por nivel.


-- 11. Mostrar todos los movimientos que aprende pikachu.
SELECT DISTINCT pokemon.nombre, movimiento.nombre as "movimiento"
FROM pokemon, pokemon_movimiento_forma, movimiento
WHERE pokemon.numero_pokedex = pokemon_movimiento_forma.numero_pokedex
AND pokemon_movimiento_forma.id_movimiento = movimiento.id_movimiento
AND pokemon.nombre = "Pikachu";

select distinct m.nombre
from movimiento m, pokemon p, pokemon_movimiento_forma pmf
where p.numero_pokedex = pmf.numero_pokedex and pmf.id_movimiento = m.id_movimiento
and lower(p.nombre) = 'pikachu';

-- 12. Mostrar todos los movimientos que aprende pikachu por MT.
SELECT distinct pokemon.nombre, movimiento.nombre, tipo_forma_aprendizaje.tipo_aprendizaje
FROM pokemon, pokemon_movimiento_forma, movimiento, forma_aprendizaje, tipo_forma_aprendizaje
WHERE pokemon.numero_pokedex = pokemon_movimiento_forma.numero_pokedex
AND pokemon_movimiento_forma.id_movimiento = movimiento.id_movimiento
AND pokemon_movimiento_forma.id_forma_aprendizaje = forma_aprendizaje.id_forma_aprendizaje
AND forma_aprendizaje.id_tipo_aprendizaje = tipo_forma_aprendizaje.id_tipo_aprendizaje
AND tipo_forma_aprendizaje.tipo_aprendizaje = "MT"
AND pokemon.nombre = "Pikachu";

-- 13. Mostrar todos los movimientos de tipo normal que aprende pikachu por nivel.
SELECT pokemon.nombre, movimiento.nombre as "movimiento", tipo_forma_aprendizaje.tipo_aprendizaje
FROM pokemon, pokemon_movimiento_forma, movimiento, tipo, forma_aprendizaje, tipo_forma_aprendizaje
WHERE pokemon.numero_pokedex = pokemon_movimiento_forma.numero_pokedex
AND pokemon_movimiento_forma.id_movimiento = movimiento.id_movimiento
AND pokemon_movimiento_forma.id_forma_aprendizaje = forma_aprendizaje.id_forma_aprendizaje
AND forma_aprendizaje.id_tipo_aprendizaje = tipo_forma_aprendizaje.id_tipo_aprendizaje
AND movimiento.id_tipo = tipo.id_tipo
AND tipo.nombre = "Normal"
AND tipo_forma_aprendizaje.tipo_aprendizaje = "Nivel"
AND pokemon.nombre = "Pikachu";

select distinct m.nombre
from movimiento m, pokemon p, 
pokemon_movimiento_forma pmf, 
forma_aprendizaje fa, 
tipo_forma_aprendizaje tfa,
tipo t
where p.numero_pokedex = pmf.numero_pokedex 
and pmf.id_movimiento = m.id_movimiento
and pmf.id_forma_aprendizaje = fa.id_forma_aprendizaje
and fa.id_tipo_aprendizaje = tfa.id_tipo_aprendizaje
and m.id_tipo = t.id_tipo
and lower(t.nombre) = 'normal'
and lower(tfa.tipo_aprendizaje) = 'nivel'
and lower(p.nombre) = 'pikachu';