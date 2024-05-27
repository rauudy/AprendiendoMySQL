-- Obtener los nombres de los empleados que están asignados a todos los proyectos (subconsultas anidadas y EXISTS/NOT EXISTS).
-- Obtener los departamentos que tienen al menos un empleado con un salario superior a $6000 (subconsultas y EXISTS/NOT EXISTS).
-- Obtener el nombre del empleado con más horas asignadas en cada proyecto (funciones de ventana).
-- Obtener los proyectos que tienen un presupuesto superior al presupuesto promedio de todos los proyectos (subconsultas y optimización).
-- Obtener los empleados que no han sido asignados a ningún proyecto (subconsultas y optimización).
-- Obtener los departamentos que tienen al menos un empleado asignado a todos los proyectos (subconsultas anidadas y EXISTS/NOT EXISTS).
-- Obtener el nombre del empleado con el salario más alto en cada departamento (funciones de ventana).
-- Obtener los proyectos que tienen un presupuesto superior al presupuesto total de todos los departamentos (subconsultas y optimización).
-- Obtener los empleados que tienen un salario superior al salario promedio de su departamento (subconsultas y optimización).
-- Obtener los departamentos que no tienen empleados asignados a ningún proyecto (subconsultas anidadas y EXISTS/NOT EXISTS).


-- TODO 

-- Obtener los nombres de los empleados que están asignados a todos los proyectos 
-- (subconsultas anidadas y EXISTS/NOT EXISTS).
SELECT empleados.nombre FROM empleados
JOIN asignaciones ON empleados.id_empleado = asignaciones.id_empleado
JOIN proyectos ON asignaciones.id_proyecto = proyectos.id_proyecto;

SELECT * FROM empleados
RIGHT JOIN asignaciones ON empleados.id_empleado = asignaciones.id_empleado;

-- 

SELECT e.nombre, e.apellido
FROM empleados e
WHERE NOT EXISTS (
    SELECT 1
    FROM proyectos p
    WHERE NOT EXISTS (
        SELECT 1
        FROM asignaciones a
        WHERE a.id_empleado = e.id_empleado
        AND a.id_proyecto = p.id_proyecto
    )
);


-- Obtener los departamentos que tienen al menos un empleado con un salario superior a $6000 
-- (subconsultas y EXISTS/NOT EXISTS).


SELECT distinct departamentos.nombre 
FROM empleados
JOIN departamentos on empleados.id_departamento = departamentos.id_departamento 
WHERE salario > 6000;

SELECT d.nombre
FROM departamentos d
WHERE EXISTS (
    SELECT 1
    FROM empleados e
    WHERE e.id_departamento = d.id_departamento
    AND e.salario > 6000
);

-- Obtener el nombre del empleado con más horas asignadas en cada proyecto (funciones de ventana).
SELECT empleados.nombre, asignaciones.id_proyecto FROM asignaciones
JOIN (
	SELECT MAX(horas) as 'horas', id_proyecto FROM asignaciones GROUP BY id_proyecto
) as tabla1
ON asignaciones.id_proyecto = tabla1.id_proyecto
JOIN empleados ON asignaciones.id_empleado = empleados.id_empleado
WHERE asignaciones.horas = tabla1.horas;

-- Obtener los proyectos que tienen un presupuesto superior al presupuesto promedio de todos los proyectos 
-- (subconsultas y optimización).
SELECT nombre, presupuesto FROM proyectos 
WHERE  presupuesto > (
	SELECT AVG(presupuesto) FROM proyectos
);

-- Obtener los empleados que no han sido asignados a ningún proyecto (subconsultas y optimización).
SELECT nombre FROM empleados
LEFT JOIN asignaciones ON asignaciones.id_empleado = empleados.id_empleado
WHERE id_asignacion IS NULL;

-- Obtener el nombre del empleado con el salario más alto en cada departamento (funciones de ventana).
-- Sin nombre
SELECT MAX(salario), id_departamento FROM empleados GROUP BY id_departamento;
-- Con nombre
SELECT NOMBRE, macimo FROM departamentos
JOIN (
	SELECT MAX(salario) as 'macimo', id_departamento 
    FROM empleados 
    GROUP BY id_departamento
) As nose
ON departamentos.id_departamento = nose.id_departamento;

-- Obtener los proyectos que tienen un presupuesto superior al presupuesto total de todos los departamentos
SELECT nombre, presupuesto FROM proyectos
WHERE presupuesto > ( SELECT AVG(presupuesto) FROM proyectos );

-- Obtener los empleados que tienen un salario superior al salario promedio de su departamento 
SELECT nombre, salario FROM empleados
JOIN ( SELECT distinct AVG(salario) as 'promedio', id_departamento FROM empleados GROUP BY id_departamento ) as tabla1
ON empleados.id_departamento = tabla1.id_departamento
WHERE salario > promedio;

-- Obtener los departamentos que no tienen empleados asignados a ningún proyecto
SELECT departamentos.nombre FROM empleados
JOIN asignaciones ON empleados.id_empleado = asignaciones.id_empleado
RIGHT JOIN departamentos ON empleados.id_departamento = departamentos.id_departamento
WHERE id_asignacion IS NULL;