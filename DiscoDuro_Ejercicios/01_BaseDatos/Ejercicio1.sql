-- 1. Obtener los datos completos de los empleados.
-- 2. Obtener los datos completos de los departamentos
-- 3. Obtener los datos de los empleados con cargo 'Secretaria'.
-- 4. Obtener el nombre y salario de los empleados.
-- 5. Obtener los datos de los empleados vendedores, ordenado por nombre.
-- 6. Listar el nombre de los departamentos
-- 7. Obtener el nombre y cargo de todos los empleados, ordenado por salario

-- 1. Obtener los datos completos de los empleados.
select * from empleados;

-- 2. Obtener los datos completos de los departamentos
select * from departamentos;

-- 3. Obtener los datos de los empleados con cargo 'Secretaria'.
-- * lower para que no importe si es mayuscula o minuscula
select * from empleados where cargoE = 'Secretaria';
select * from empleados where lower(cargoE) = 'secretaria';

-- 4. Obtener el nombre y salario de los empleados.
select nomEmp, salEmp from empleados;

-- 5. Obtener los datos de los empleados vendedores, ordenado por nombre.
-- * lower para que no importe si es mayuscula o minuscula
select * from empleados where cargoE = "Vendedor" ORDER BY nomEmp ASC;
select * from empleados where lower(cargoE) = "vendedor" ORDER BY nomEmp ASC;

-- 6. Listar el nombre de los departamentos
select nombreDpto from departamentos;
select distinct nombreDpto from departamentos;

-- 7. Obtener el nombre y cargo de todos los empleados, ordenado por salario
select nomEmp, cargoE from empleados ORDER BY salEmp;
select nomEmp, cargoE, salEmp from empleados ORDER BY salEmp;