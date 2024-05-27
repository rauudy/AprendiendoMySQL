-- Consultas resumen

-- 1. Calcula el número total de productos que hay en la tabla productos.
-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.
-- 3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
-- 4. Calcula la media del precio de todos los productos.
-- 5. Calcula el precio más barato de todos los productos.
-- 6. Calcula el precio más caro de todos los productos.
-- 7. Lista el nombre y el precio del producto más barato.
-- 8. Lista el nombre y el precio del producto más caro.
-- 9. Calcula la suma de los precios de todos los productos.
-- 10. Calcula el número de productos que tiene el fabricante Asus.
-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
-- 14. Calcula la suma de todos los productos del fabricante Asus.
-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes.El listado también debe incluir 
-- los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y 
--otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

-- Consultas resumen

-- 1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) AS numeroProductos FROM producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) AS numeroFabricantes FROM fabricante;

-- 3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(*) AS numeroProductos, codigo_fabricante
FROM producto
GROUP BY codigo_fabricante;

-- 4. Calcula la media del precio de todos los productos.
SELECT AVG(precio) as mediaPrecios FROM producto;

-- 5. Calcula el precio más barato de todos los productos.
SELECT nombre, precio FROM producto
WHERE producto.precio = (
	SELECT MIN(precio) FROM producto
);

-- 6. Calcula el precio más caro de todos los productos.
SELECT nombre, precio FROM producto
WHERE producto.precio = (
	SELECT MAX(precio) FROM producto
);

-- 7. Lista el nombre y el precio del producto más barato.
SELECT nombre, precio
FROM producto
WHERE producto.precio = (
	SELECT MIN(precio) FROM producto
)
OR producto.precio = (
	SELECT MAX(precio) FROM producto
);

-- 8. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto
WHERE precio = (
	SELECT MAX(precio) FROM producto
);

-- 9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS totalPrecios
FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) as productos, fabricante.nombre FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = "ASUS"
GROUP BY fabricante.nombre;

SELECT COUNT(*) as productos, fabricante.nombre FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "ASUS";

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio), fabricante.nombre FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = "ASUS"
GROUP BY fabricante.nombre;

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND producto.precio = (
	SELECT MIN(precio) FROM producto, fabricante 
    WHERE producto.codigo_fabricante = fabricante.codigo
    AND fabricante.nombre = "ASUS"
);

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND producto.precio = (
	SELECT MAX(precio) FROM producto, fabricante 
    WHERE producto.codigo_fabricante = fabricante.codigo
    AND fabricante.nombre = "ASUS"
);

-- 14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) FROM producto, fabricante 
WHERE producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = "ASUS";

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos 
-- que tiene el fabricante Crucial.
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(*)
FROM producto
WHERE codigo_fabricante = (
	SELECT codigo FROM fabricante WHERE nombre = "Crucial"
);

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes.El listado también debe incluir 
-- los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, 
-- una con el nombre del fabricante y otra con el número de productos que tiene. 
-- Ordene el resultado descendentemente por el número de productos.
SELECT fabricante.nombre, COUNT(producto.codigo_fabricante) as total
FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
ORDER BY total;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT MAX(precio), MIN(precio), AVG(precio), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;
