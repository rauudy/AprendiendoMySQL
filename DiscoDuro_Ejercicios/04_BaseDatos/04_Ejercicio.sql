-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en
-- orden descendente) y en segundo lugar por el nombre (en orden ascendente)
-- 13. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

-- -- Consultas multitabla (Composición externa)

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifica tu respuesta.

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND lower(fabricante.nombre) = "lenovo";

SELECT *
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND lower(fabricante.nombre) = "crucial"
AND producto.precio >= 200;


-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. 
-- Sin utilizar el operador IN.
SELECT * FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND lower(fabricante.nombre) IN ('asus','hewlett-Packard', 'seagate');

SELECT DISTINCT producto.nombre, fabricante.nombre FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND (lower(fabricante.nombre) = 'asus'
OR lower(fabricante.nombre) = 'hewlett-packard'
OR lower(fabricante.nombre) = 'seagate');
;

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. 
-- Utilizando el operador IN.
SELECT DISTINCT producto.nombre, fabricante.nombre FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND (lower(fabricante.nombre) = 'asus'
OR lower(fabricante.nombre) = 'hewlett-packard'
OR lower(fabricante.nombre) = 'seagate');

SELECT * FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND lower(fabricante.nombre) IN ('asus','hewlett-Packard', 'seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes 
-- cuyo nombre termine por la vocal e.
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre like '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo 
-- nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre, precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND lower(fabricante.nombre) like '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, 
-- de todos los productos que tengan un precio mayor o igual a 180€. 
-- Ordene el resultado en primer lugar por el precio (en orden descendente) 
-- y en segundo lugar por el nombre (en orden ascendente)
SELECT p.nombre, p.precio, f.nombre
FROM producto p, fabricante f
WHERE p.codigo_fabricante = f.codigo
AND p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- 13. Devuelve un listado con el código y el nombre de fabricante, 
-- solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT f.codigo, f.nombre 
FROM producto p, fabricante f
WHERE p.codigo_fabricante = f.codigo;

-- -- Consultas multitabla (Composición externa)

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, 
-- junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT  fabricante.nombre, producto.nombre, producto.precio
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre;

select f.nombre, p.nombre, p.precio
from fabricante f 
LEFT JOIN producto p 
on f.codigo = p.codigo_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT *
FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.nombre IS NULL

-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifica tu respuesta.
-- NO, porque se espefifico que no puede ser NULL 