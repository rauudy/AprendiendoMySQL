-- Ejercicios FASE 2:

-- Obtener el nombre del producto más vendido (producto con mayor cantidad de ventas).
-- Obtener la categoría con el producto más caro.
-- Obtener el total de ventas (cantidad y monto) por cada categoría.
-- Obtener los productos que no han sido vendidos.
-- Obtener los nombres de los productos y la cantidad total vendida de cada uno.
-- Obtener los nombres de los productos que hayan sido vendidos al menos una vez en el mes de mayo de 2023.
-- Obtener la cantidad de productos diferentes que han sido vendidos.
-- Obtener el nombre del producto con el precio más alto en cada categoría.
-- Obtener el nombre del producto, la cantidad vendida y el total de ventas (cantidad * precio) para todos los productos vendidos.
-- Obtener el nombre de la categoría con el mayor stock total de productos.

-- TODO FASE 2 --

-- Obtener el nombre del producto más vendido (producto con mayor cantidad de ventas).
SELECT ventas.cantidad, productos.nombre FROM ventas
JOIN productos ON productos.id_producto = ventas.id_producto
WHERE ventas.cantidad = (
	SELECT MAX(cantidad) FROM ventas);

-- Obtener la categoría con el producto más caro.
SELECT precio, productos.nombre FROM categorias
JOIN productos ON productos.id_categoria = categorias.id_categoria
WHERE productos.precio = (
	SELECT MAX(precio) FROM productos);

-- Obtener el total de ventas (cantidad y monto) por cada categoría.
SELECT SUM(cantidad), SUM(precio*cantidad), categorias.nombre FROM ventas
JOIN productos ON productos.id_producto = ventas.id_producto
JOIN categorias ON categorias.id_categoria = productos.id_categoria
GROUP BY categorias.nombre;

-- Obtener los productos que no han sido vendidos.
SELECT * FROM productos
LEFT JOIN ventas ON productos.id_producto = ventas.id_producto
WHERE ventas.id_venta IS NULL;

-- Obtener los nombres de los productos y la cantidad total vendida de cada uno.
SELECT productos.nombre, ventas.cantidad as "Cantidad Vendida" FROM productos
JOIN ventas ON ventas.id_producto = productos.id_producto;


-- Obtener los nombres de los productos que hayan sido vendidos al menos una vez en el mes de mayo de 2023.
SELECT * FROM productos JOIN ventas ON productos.id_producto = ventas.id_producto
WHERE fecha >= '20230501';

-- Obtener la cantidad de productos diferentes que han sido vendidos.
SELECT DISTINCT COUNT(*) FROM productos
JOIN ventas ON productos.id_producto = ventas.id_producto;

-- Obtener el nombre del producto con el precio más alto en cada categoría.
SELECT MAX(precio), categorias.nombre FROM productos
JOIN categorias ON productos.id_categoria = categorias.id_categoria
GROUP BY categorias.nombre;

-- Obtener el nombre del producto, la cantidad vendida y el total de ventas (cantidad * precio) 
-- para todos los productos vendidos.
SELECT nombre, cantidad, (cantidad*precio) AS 'TOTAL' FROM ventas
JOIN productos ON productos.id_producto = ventas.id_producto;

-- Obtener el nombre de la categoría con el mayor stock total de productos.
SELECT MAX(stock),categorias.nombre FROM productos 
JOIN categorias ON categorias.id_categoria = productos.id_categoria
GROUP BY categorias.nombre
LIMIT 1;

SELECT stock,categorias.nombre FROM productos 
JOIN categorias ON categorias.id_categoria = productos.id_categoria
WHERE stock = (	SELECT MAX(stock) FROM productos );

