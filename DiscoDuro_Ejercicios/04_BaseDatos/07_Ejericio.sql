-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

-- --- Subconsultas (En la cláusula WHERE) 
-- -- Con operadores básicos de comparación:
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.




-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de 
-- todos sus productos es superior a 1000 €.
SELECT SUM(precio), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING SUM(precio) > 1000;

-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. 
-- El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. 
-- El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT p.nombre, precio, fabricante.nombre, fabricante.codigo
FROM producto p, fabricante
WHERE p.codigo_fabricante = fabricante.codigo
AND p.precio = (
	SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = p.codigo_fabricante
);

SELECT p.nombre, precio, fabricante.nombre, fabricante.codigo
FROM producto p, fabricante
WHERE p.codigo_fabricante = fabricante.codigo;

select f.nombre, p.precio, p.nombre
from producto p, fabricante f
where p.codigo_fabricante = f.codigo
and p.precio = (select max(precio) from producto where codigo_fabricante = p.codigo_fabricante)
order by f.nombre;

-- --- Subconsultas (En la cláusula WHERE) 
-- -- Con operadores básicos de comparación:
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto 
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Lenovo";

SELECT * FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = "Lenovo";

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto 
-- más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto
WHERE precio > (
	SELECT MAX(precio) FROM producto p
    JOIN fabricante
    ON p.codigo_fabricante = fabricante.codigo
    WHERE fabricante.nombre = "Lenovo"
);

select * from producto 
where precio = (select max(precio) 
                from producto 
                where codigo_fabricante = (select codigo from fabricante where upper(nombre) = 'LENOVO'))

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.