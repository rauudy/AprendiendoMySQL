-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y 
-- el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
-- 22. Lista el precio medio de los productos de cada fabricante, mostrando solamente el código del fabricante.
-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o 
-- igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes 
-- que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, 
-- con el código del fabricante es suficiente.
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(*), codigo_fabricante
FROM producto
GROUP BY codigo_fabricante
HAVING AVG(precio) > 200;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y 
-- el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- Es necesario mostrar el nombre del fabricante.
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(*), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING AVG(precio) > 200;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(*) FROM producto WHERE precio>=180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT COUNT(codigo_fabricante), codigo_fabricante
FROM producto
WHERE precio>=180
GROUP BY codigo_fabricante;

-- 22. Lista el precio medio de los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT AVG(precio), codigo_fabricante
FROM producto
GROUP BY codigo_fabricante;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT AVG(precio), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT fabricante.nombre, AVG(precio) as mediaPrecio
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING mediaPrecio >= 150;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre, COUNT(*) as prod
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING prod >= 2;

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene
-- cada uno con un precio superior o igual a 220 €. 
SELECT fabricante.nombre, COUNT(*) AS prod
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING AVG(precio) >= 220;

SELECT fabricante.nombre, COUNT(*) AS prod
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND precio >= 220
GROUP BY fabricante.nombre;

-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene 
-- cada uno con un precio superior o igual a 220 €. 
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante 
-- que no tiene productos con un precio superior o 
-- igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT fabricante.nombre, COUNT(*) AS prod
FROM fabricante
LEFT JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >= 220
GROUP BY fabricante.nombre;

select distinct f.nombre, 
(select count(*) from producto where codigo_fabricante = p.codigo_fabricante and precio >= 220) as total
from fabricante f 
LEFT JOIN producto p 
on p.codigo_fabricante = f.codigo
order by total desc;

