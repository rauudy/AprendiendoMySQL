-- 13.Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado.
-- 14. Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identidad es
-- superior al '19.709.802'
-- 15. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango).
-- Liste estos empleados y su cargo por orden alfabético.
-- 16. Listar el salario, la comisión, el salario total (salario + comisión), documento de identidad del
-- empleado y nombre, de aquellos empleados que tienen comisión superior a 1.000.000, ordenar el
-- informe por el número del documento de identidad
-- 17. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión
-- 18. Hallar los empleados cuyo nombre no contiene la cadena "MA"
-- 19. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI
-- 'MANTENIMIENTO', ordenados por ciudad.

-- 13.Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado.
select * from empleados;
select nomEmp as "Nombre", cargoE as "Cargo" from empleados;

-- 14. Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identidad es
-- superior al '19.709.802'
select * from empleados;
select nDIEmp, nomEmp, salEmp, comisionE from empleados where nDIEmp > '19.709.802';

-- 15. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango).
select 	nomemp, cargoe from empleados where lower(nomemp) > 'j' and lower(nomemp) < 'z' order by nomemp;

-- 16. Listar el salario, la comisión, el salario total (salario + comisión), documento de identidad del
-- empleado y nombre, de aquellos empleados que tienen comisión superior a 1.000.000, ordenar el
-- informe por el número del documento de identidad
select salEmp, comisionE, (salEmp + comisionE) as "salarioTotal", ndiemp, nomemp 
from empleados 
where comisionE > 1000000 
order by ndiemp;

-- 17. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión
select salEmp, comisionE, (salEmp + comisionE) as "salarioTotal", ndiemp, nomemp 
from empleados 
where comisionE = 0
order by ndiemp;

-- 18. Hallar los empleados cuyo nombre no contiene la cadena "MA"
select nomEmp from empleados where nomEmp not like "%Ma%";
select nomEmp from empleados where lower(nomEmp) not like "%ma%";

-- 19. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI
-- 'MANTENIMIENTO', ordenados por ciudad.
select * from departamentos;
select nombreDpto from departamentos where nombreDpto != "VENTAS" and nombreDpto != "INVESTIGACIÓN" and nombreDpto != "MANTENIMIENTO" order by ciudad;
select nombreDpto from departamentos where lower(nombreDpto) not in ('ventas', 'investigación', 'mantenimiento') order by ciudad;




