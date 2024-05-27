-- 20. Obtener el nombre y el departamento de los empleados con cargo 'Secretaria' o 'Vendedor', que
-- no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000,
-- ordenados por fecha de incorporación.
-- 21. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres
-- 22. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres
-- 23. Listar los datos de los empleados cuyo nombre inicia por la letra 'M', su salario es mayor a $800.000
-- o reciben comisión y trabajan para el departamento de 'VENTAS'
-- 24. Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la
-- mitad de la comisión la propia comisión


-- 20. Obtener el nombre y el departamento de los empleados con cargo 'Secretaria' o 'Vendedor', que
-- no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000,

SELECT nomemp, nombreDpto FROM empleados
JOIN departamentos
ON empleados.codDepto = departamentos.codDepto
WHERE cargoE = 'Secretaria' OR cargoE = 'Vendedor' AND nombreDpto != 'PRODUCCION' AND salEmp > 1000000;

SELECT nomemp, nombreDpto FROM empleados e, departamentos d
WHERE e.codDepto=d.codDepto 
AND (lower(e.cargoE)='secretaria' OR lower(e.cargoE)='vendedor')
AND lower(d.nombreDpto)!='produccción' 
AND e.salEmp > 1000000;

-- 21. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres
SELECT * FROM empleados WHERE length(nomEmp) = 11;

select * from empleados where char_length(nomemp) = 11;

-- 22. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres
SELECT * FROM empleados WHERE char_length(nomEmp) < 11;

-- 23. Listar los datos de los empleados cuyo nombre inicia por la letra 'M', su salario es mayor a $800.000
-- o reciben comisión y trabajan para el departamento de 'VENTAS'
SELECT nomEmp, salEmp, nombreDpto, comisionE from empleados
JOIN departamentos
WHERE empleados.codDepto = departamentos.codDepto 
AND empleados.nomEmp like "M%"
AND (empleados.salEmp >= 800000 OR empleados.comisionE > 0)
AND departamentos.nombreDpto = "VENTAS";

select e.nomemp, e.salemp, d.nombredpto
from empleados e, departamentos d
where e.coddepto = d.coddepto 
and lower(e.nomemp) like "m%" 
and (e.salemp > 800000 or e.comisione > 0) 
and d.nombredpto = "VENTAS";

select e.nomEmp, d.nombreDpto, e.salEmp
from empleados e, departamentos d
where e.codDepto=d.codDepto and lower(e.nomEmp) like 'm%' and (e.salEmp > 800000  or e.comisionE>0)
and lower(d.nombreDpto)='ventas';

-- 24. Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la
-- mitad de la comisión la propia comisión
SELECT nomEmp, salEmp, comisionE 
FROM empleados
WHERE salEmp >= (comisionE/2) and salEmp <= comisionE;

-- * between sirve para comparar valores entre dos valores, era mas rapido
select nomEmp, salEmp, comisionE
from empleados
where salEmp between (comisionE/2) and comisionE;