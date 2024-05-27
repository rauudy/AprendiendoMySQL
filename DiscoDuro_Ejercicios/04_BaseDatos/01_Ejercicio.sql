-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
-- 3. Lista todas las columnas de la tabla producto.
-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.


-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio as euros, precio * 1.05 as dolar FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
-- Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS "Nombre de producto", precio AS "Euros", precio * 1.05 AS "Dolares" FROM producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, 
-- convirtiendo los nombres a mayúscula.
SELECT upper(nombre), precio FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, 
-- convirtiendo los nombres a minúscula.
SELECT lower(nombre), precio FROM producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna 
-- obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, upper(substr(nombre, 1, 2)) AS iniciales FROM fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, 
-- redondeando el valor del precio.
SELECT nombre, round(precio), precio FROM producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, 
-- truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre,round(precio) FROM producto;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT fabricante.codigo FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, 
-- eliminando los códigos que aparecen repetidos.
SELECT DISTINCT fabricante.codigo FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente 
-- y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto
ORDER BY nombre ASC, precio DESC;
