-- 10. Mostrar el nombre y tipo del ataque con mas potencia.

-- 11. Mostrar el numero de movimientos de cada tipo.

-- 12. Mostrar todos los movimientos que puedan envenenar.



-- 10. Mostrar el nombre y tipo del ataque con mas potencia.
SELECT movimiento.nombre, movimiento.potencia, tipo.nombre as "tipo"
FROM movimiento, tipo
WHERE movimiento.id_tipo = tipo.id_tipo
AND movimiento.potencia = (
	SELECT MAX(potencia) FROM movimiento);


-- 11. Mostrar el numero de movimientos de cada tipo.
SELECT Count(*) as "No. movimiento", tipo.nombre as tipo
FROM movimiento, tipo
WHERE movimiento.id_tipo = tipo.id_tipo
GROUP BY tipo.nombre;

select t.nombre as tipo, count(*) as num_mov
from tipo t, movimiento m
where m.id_tipo = t.id_tipo
group by t.nombre;

-- 12. Mostrar todos los movimientos que puedan envenenar.
SELECT movimiento.nombre, movimiento.descripcion, movimiento_efecto_secundario.probabilidad, efecto_secundario.efecto_secundario
FROM movimiento, movimiento_efecto_secundario, efecto_secundario
WHERE movimiento.id_movimiento = movimiento_efecto_secundario.id_movimiento
AND movimiento_efecto_secundario.id_efecto_secundario = efecto_secundario.id_efecto_secundario
AND efecto_secundario.efecto_secundario = "Envenenamiento leve";

select m.nombre, mes.probabilidad
from movimiento m, movimiento_efecto_secundario mes, efecto_secundario es
where m.id_movimiento = mes.id_movimiento and mes.id_efecto_secundario = es.id_efecto_secundario
and lower(es.efecto_secundario) like '%envenena%'

