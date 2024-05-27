-- 27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
-- 28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

-- -- Consultas multitabla (Composición interna)

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
-- 3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

-- TODO PROBLEMAS CON EL ORDEN DE LOS RESULTADOS --

-- 27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto WHERE codigo_fabricante IN (1,3,5);
SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- 28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante= 3 OR codigo_fabricante=5;
SELECT * FROM producto WHERE codigo_fabricante IN (1,3,5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). 
-- Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 as centimos FROM producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante WHERE nombre like "S%";

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante WHERE nombre like "%e";

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre like "%w%";

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE nombre like "____";

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto WHERE lower(nombre) like "%portatil%";

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre 
-- y tienen un precio inferior a 215 €.
SELECT nombre, precio FROM producto WHERE lower(nombre) like "%monitor%" and precio < 215;

-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
-- Ordene el resultado en primer lugar por el precio (en orden descendente) 
-- y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

-- -- Consultas multitabla (Composición interna)

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de 
-- todos los productos de la base de datos.
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de 
-- todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, 
-- por orden alfabético.
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre;

-- 3. Devuelve una lista con el código del producto, nombre del producto, 
-- código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
ORDER BY precio ASC LIMIT 1;

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND producto.precio = (
	SELECT MIN(precio) FROM producto
);

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
ORDER BY precio DESC LIMIT 1;

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND producto.precio = (
	SELECT MAX(precio) FROM producto
);