-- Ejercicios FASE 1:

-- Obtener todas las categorías.
-- Obtener todos los productos.
-- Obtener los productos cuyo precio sea mayor a $50.
-- Obtener el producto más caro.
-- Obtener la cantidad total de ventas.
-- Obtener las ventas realizadas en una fecha específica.
-- Obtener los productos que tienen un stock menor a 10 unidades.
-- Obtener el nombre y descripción de los productos de una categoría en particular.
-- Actualizar el precio de un producto.
-- Eliminar una categoría y todos los productos asociados.

-- TODO FASE 1 --

-- Obtener todas las categorías.
SELECT * FROM categorias;

-- Obtener todos los productos.
SELECT * FROM productos;

-- Obtener los productos cuyo precio sea mayor a $50.
SELECT * FROM productos WHERE precio > 50;

-- Obtener el producto más caro.
SELECT nombre, precio FROM productos
WHERE productos.precio = (
	SELECT MAX(precio) FROM productos
);

SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;

-- Obtener la cantidad total de ventas.
SELECT SUM(cantidad) AS "TOTAL VENTAS" FROM ventas;
SELECT COUNT(*) AS "TOTAL VENTAS" FROM VENTAS;

-- Obtener las ventas realizadas en una fecha específica.
SELECT * FROM ventas WHERE fecha = '2023-05-03';

-- Obtener los productos que tienen un stock menor a 10 unidades.
SELECT * FROM productos WHERE stock <= 10;

-- Obtener el nombre y descripción de los productos de una categoría en particular.
SELECT nombre, descripcion FROM productos WHERE id_categoria = 3;

-- Actualizar el precio de un producto.
UPDATE productos SET precio = 19.99 WHERE id_producto = 1;

-- Eliminar una categoría y todos los productos asociados.
DELETE FROM categorias WHERE id_categoria = 4;
DELETE FROM productos WHERE id_producto = 4;
DELETE FROM ventas WHERE id_venta = 4;

-- ? DELETE FROM categorias WHERE id_categoria = 4;

-- Calificación: 9/10. Esta consulta elimina la categoría, pero no los productos asociados. Es recomendable utilizar la cláusula ON DELETE CASCADE en la definición de la clave foránea al crear la tabla productos.