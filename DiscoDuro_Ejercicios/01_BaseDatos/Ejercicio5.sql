-- 25. Mostrar el salario más alto de la empresa.
-- 26. Mostrar cada una de las comisiones y el número de empleados que las reciben. Solo si tiene comision.
-- 27. Mostrar el nombre del último empleado de la lista por orden alfabético.
-- 28. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
-- 29. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento.
-- 30. Hallar el salario promedio por departamento.

-- 25. Mostrar el salario más alto de la empresa.
SELECT MAX(salEmp) as "Mejor Salario" FROM empleados;

SELECT nomEmp, salEmp FROM empleados
ORDER BY salEmp DESC
LIMIT 1;

-- 26. Mostrar cada una de las comisiones y el número de empleados que las reciben. Solo si tiene comision.
SELECT COUNT(comisionE) as "No. Empleados", comisionE FROM empleados
GROUP BY comisionE
HAVING comisionE > 0;

select count(nomEmp) as 'Num empleados' , comisionE
from empleados 
group by comisionE 
having comisionE > 0;


-- 27. Mostrar el nombre del último empleado de la lista por orden alfabético.
SELECT nomEmp FROM empleados
ORDER BY nomEmp DESC
LIMIT 1;

select max(nomemp) as 'Mayor alfabeticamente' 
from empleados;


-- 28. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
SELECT 
MIN(salEmp) as "SalarioBajo", 
MAX(salEmp) as "SalarioAlto", 
MAX(salEmp) - MIN(salEmp) as "Diferencia"
FROM empleados;

select 	max(salemp) as 'Salario mayor', 
		min(salemp) as 'Salario menor', 
		max(salemp) - min(salemp) as 'Diferencia' 
from empleados;

-- 29. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento.
SELECT COUNT(*) as "No. Empleados", sexEmp, nombreDpto  from empleados
JOIN departamentos 
WHERE empleados.codDepto = departamentos.codDepto
GROUP BY sexEMP, nombreDpto;

select  codDepto, sexemp, count(*) as "No. empleados"
from empleados
group by codDepto, sexemp;

-- 30. Hallar el salario promedio por departamento.
SELECT AVG(salEmp) as "Promedio", codDepto FROM empleados
group by codDepto;