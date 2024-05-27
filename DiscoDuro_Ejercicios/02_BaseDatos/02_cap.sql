-- 4. Mostrar los pokemon que son de tipo fuego y volador.

-- 5. mostrar los pokemon con una estadistica base de ps mayor que 200

-- 6. mostrar los datos(nombre, peso, altura) de la prevolucion de Arbok.



-- 4. Mostrar los pokemon que son de tipo fuego y volador.
SELECT *
FROM pokemon p
JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
JOIN tipo t ON pt.id_tipo = t.id_tipo
WHERE t.nombre = "Fuego" or t.id_tipo = 15;

select nombre
from pokemon
where numero_pokedex in (select numero_pokedex
						from pokemon_tipo pt, tipo t
                        where pt.id_tipo=t.id_tipo and lower(t.nombre)='fuego')
and numero_pokedex in (select numero_pokedex
						from pokemon_tipo pt, tipo t
                        where pt.id_tipo=t.id_tipo and lower(t.nombre)='volador');

SELECT *
FROM pokemon
WHERE numero_pokedex IN (
	SELECT numero_pokedex FROM pokemon_tipo, tipo
	WHERE pokemon_tipo.id_tipo = tipo.id_tipo
	AND tipo.nombre = "Fuego"
)
AND numero_pokedex IN (
	SELECT numero_pokedex FROM pokemon_tipo, tipo
	WHERE pokemon_tipo.id_tipo = tipo.id_tipo
    AND tipo.nombre = "Volador"
);

                      
-- 5. mostrar los pokemon con una estadistica base de ps mayor que 200
SELECT nombre, ps
FROM pokemon p, estadisticas_base eb
WHERE p.numero_pokedex = eb.numero_pokedex
AND eb.ps >= 200;

-- 6. mostrar los datos(nombre, peso, altura) de la prevolucion de Arbok.
SELECT nombre, peso, altura 
FROM pokemon
WHERE numero_pokedex IN (
	SELECT (numero_pokedex - 1)
	FROM pokemon
	WHERE nombre = "Arbok"
)
;

Select *
From pokemon p, evoluciona_de ed
Where p.numero_pokedex = ed.pokemon_origen
And ed.pokemon_evolucionado = (
	Select numero_pokedex From pokemon
    Where nombre = "Arbok"
);

