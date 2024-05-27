-- Ejercicios FASE 3:

-- Obtener el nombre de los productos que se han vendido más de 10 unidades en total, junto con la cantidad total vendida de cada uno.
-- Obtener el nombre de las categorías que tienen al menos un producto con un stock inferior a 20 unidades.
-- Obtener el nombre del producto más caro vendido en el mes de mayo de 2023, junto con su precio y la cantidad vendida.
-- Obtener el nombre de los productos que tienen un precio superior al precio promedio de su categoría.
-- Obtener el nombre de los productos que se han vendido en al menos 3 fechas diferentes.
-- Obtener el nombre de las categorías que no tienen productos vendidos.
-- Obtener el nombre de los productos que tienen el stock más alto y el stock más bajo en cada categoría.
-- Obtener el nombre de los productos que han sido vendidos en todas las fechas en las que se realizaron ventas.
-- Obtener el nombre de los productos que no se han vendido en el mes de mayo de 2023.
-- Obtener el nombre de los productos que tienen un precio superior al precio promedio de todos los productos en la tienda.

-- TODO FASE 3 --

-- Obtener el nombre de los productos que se han vendido más de 10 unidades en total, 
-- junto con la cantidad total vendida de cada uno.
SELECT nombre, cantidad FROM productos
JOIN ventas ON productos.id_producto = ventas.id_producto
WHERE cantidad >= 10;

SELECT p.nombre, SUM(v.cantidad) AS total_vendido 
FROM productos p 
JOIN ventas v ON p.id_producto = v.id_producto 
GROUP BY p.id_producto 
HAVING SUM(v.cantidad) > 10;

-- Obtener el nombre de las categorías que tienen al menos un producto con un stock inferior a 20 unidades.
SELECT * FROM productos
JOIN categorias ON productos.id_categoria = categorias.id_categoria
WHERE stock <= 20;

-- Obtener el nombre del producto más caro vendido en el mes de mayo de 2023, 
-- junto con su precio y la cantidad vendida.
SELECT  nombre, precio, cantidad FROM productos
JOIN ventas ON productos.id_producto = ventas.id_producto
WHERE precio = (
	SELECT MAX(precio) FROM productos 
    JOIN ventas ON productos.id_producto = ventas.id_producto
    WHERE fecha BETWEEN '20230501' AND '20230531'
)
AND fecha BETWEEN '20230501' AND '20230531';

-- Obtener el nombre de los productos que tienen un precio superior al precio promedio de su categoría.
SELECT *  FROM productos
JOIN (
	SELECT AVG(precio) as 'promedio', id_categoria 
	FROM productos 
	GROUP BY id_categoria
) AS promedio_cat
ON productos.id_categoria = promedio_cat.id_categoria
WHERE productos.precio > promedio_cat.promedio;

SELECT AVG(precio), id_categoria FROM productos GROUP BY id_categoria;

SELECT p.nombre
FROM productos p
INNER JOIN (
    SELECT id_categoria, AVG(precio) AS precio_promedio
    FROM productos
    GROUP BY id_categoria
) AS categoria_promedio
ON p.id_categoria = categoria_promedio.id_categoria
WHERE p.precio > categoria_promedio.precio_promedio;

-- Obtener el nombre de los productos que se han vendido en al menos 3 fechas diferentes.
SELECT * FROM productos
JOIN (
	SELECT COUNT(*) as 'no_ventas', id_producto FROM ventas GROUP BY id_producto
) AS vendidos ON productos.id_producto = vendidos.id_producto
WHERE no_ventas >= 3;

-- Obtener el nombre de las categorías que no tienen productos vendidos.
SELECT categorias.nombre FROM ventas
JOIN productos ON productos.id_producto = ventas.id_producto
RIGHT JOIN categorias ON categorias.id_categoria = productos.id_categoria
WHERE id_venta IS NULL;

-- Obtener el nombre de los productos que tienen el stock más alto y el stock más bajo en cada categoría.
SELECT nombre, no_min, no_max FROM categorias
JOIN (
	SELECT MIN(stock) as 'no_min', id_categoria FROM productos GROUP BY id_categoria
) as minimos
ON categorias.id_categoria = minimos.id_categoria
JOIN (
	SELECT MAX(stock) as 'no_max', id_categoria FROM productos GROUP BY id_categoria
) as maximos
ON categorias.id_categoria = maximos.id_categoria;

-- Obtener el nombre de los productos que han sido vendidos en todas las fechas en las que se realizaron ventas.
SELECT nombre, fecha, cantidad FROM ventas
JOIN productos ON productos.id_producto = ventas.id_producto;

-- Obtener el nombre de los productos que no se han vendido en el mes de mayo de 2023.
SELECT * FROM ventas
WHERE fecha NOT BETWEEN '20230501' AND '20230531';

-- Obtener el nombre de los productos que tienen un precio superior al precio promedio de 
-- todos los productos en la tienda.
SELECT * FROM productos
WHERE precio >= (
	SELECT AVG(precio) FROM productos
);