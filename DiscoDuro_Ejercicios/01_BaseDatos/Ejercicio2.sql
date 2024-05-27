-- 8. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión
-- 9. Listar todas las comisiones
-- 10. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una
-- bonificación de 500.000, en orden alfabético del empleado
-- 11. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
-- 12. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.


-- 8. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión
select distinct salEmp, comisionE from empleados where codDepto = 2000 order by comisionE asc;

-- 9. Listar todas las comisiones
select distinct comisionE from empleados;

-- 10. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una
-- bonificación de 500.000, en orden alfabético del empleado
select nomEmp, salEmp, (salEmp + 500000) as 'pagoEstimado' from empleados where codDepto = 3000 order by nomEmp;

-- 11. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
select nomEmp, comisionE from empleados where comisionE > salEmp;
select nomEmp, salEmp, comisionE from empleados where comisionE > salEmp;

-- 12. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
select nomEmp, salEmp, comisionE from empleados where comisionE <= (salEmp * 0.3);