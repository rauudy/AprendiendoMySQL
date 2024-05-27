-- 31. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa.
-- Ordenarlo por departamento.
-- 32. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de
-- esos departamentos.
-- 33. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan mas de dos empleados (2 incluido)
-- 34. Hallar los departamentos que no tienen empleados
-- 35. Mostrar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la
-- suma.

-- 31. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa.
-- Ordenarlo por departamento.
select nDIEmp, salEmp 
from empleados 
where salemp >= (select avg(salemp) from empleados);

-- 32. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de
-- esos departamentos.
SELECT COUNT(nomEmp), codDepto  FROM empleados
GROUP BY codDepto
HAVING COUNT(nomEmp) >= 3 ;

select d.codDepto, d.nombreDpto, count(*) as 'Num empleados' 
from departamentos d, empleados e 
where d.codDepto=e.codDepto 
group by d.codDepto 
having count(*) >= 3;

-- 33. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. 
-- Solo los que tengan mas de dos empleados (2 incluido)
SELECT nomEmp, jefeID, count(jefeID)
FROM empleados 
WHERE jefeID is not null
GROUP BY jefeID;

SELECT count(*) as "No. Empleados", b.nDIEmp, B.nomEmp
FROM empleados a, empleados b
WHERE a.jefeID = b.nDIEmp
GROUP BY b.nDIEmp
HAVING count(*)>=2
order by count(*) desc;
;

select j.nDIEmp, j.nomEmp, count(*) as 'Num Empleados' 
from empleados e, empleados j 
where e.jefeID=j.nDIEmp 
group by j.nDIEmp 
having count(*)>=2 
order by count(*) desc;

-- 34. Hallar los departamentos que no tienen empleados
SELECT  nombreDpto
FROM empleados, departamentos
WHERE empleados.codDepto = departamentos.codDepto
GROUP BY nombreDpto
having count(*) = 0;
;

select d.codDepto, d.nombreDpto 
from departamentos d, empleados e 
where d.codDepto=e.codDepto 
group by d.codDepto 
having count(*) != 0;


-- 35. Mostrar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la
-- suma.

SELECT SUM(salEmp) as "Salarios Total", nombreDpto
FROM empleados, departamentos
WHERE empleados.codDepto = departamentos.codDepto
GROUP BY nombreDpto
ORDER BY SUM(salEmp) DESC
LIMIT 1
;

select d.nombreDpto, sum(e.salEmp) 
from departamentos d, empleados e 
where d.codDepto=e.codDepto 
group by d.nombreDpto 
order by  sum(e.salEmp) desc 
limit 10;