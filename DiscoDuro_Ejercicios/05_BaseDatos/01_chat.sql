-- Seleccionar todos los cliente
SELECT * FROM clientes;

-- Seleccionar todos los productos que tienen más de 20 unidades en stock
SELECT * FROM productos WHERE stock >= 20;

-- Obtener todos los pedidos realizados después del 1 de mayo de 2023:
SELECT * FROM pedidos WHERE fecha_pedido > '2023-05-01';

-- Seleccionar los detalles de pedido junto con la información del producto correspondiente
SELECT dp.detalle_id, dp.cantidad, dp.precio_unitario, p.nombre
FROM detalles_pedido dp
JOIN productos p
ON dp.producto_id = p.producto_id;

-- Obtener el total de ventas de cada producto
SELECT COUNT(*), p.nombre FROM detalles_pedido dp
JOIN productos p
ON dp.producto_id = p.producto_id
GROUP BY p.nombre;

-- Obtener la información de los pedidos, incluyendo el nombre del cliente
SELECT * FROM pedidos JOIN clientes ON pedidos.cliente_id = clientes.cliente_id;

-- Obtener la cantidad total de productos vendidos por cada cliente:
SELECT SUM(cantidad) as total, clientes.nombre FROM detalles_pedido
JOIN pedidos ON detalles_pedido.pedido_id = pedidos.pedido_id
JOIN clientes ON pedidos.cliente_id = clientes.cliente_id
GROUP BY clientes.nombre;

SELECT c.nombre, SUM(dp.cantidad) AS total_productos
FROM pedidos pe
JOIN clientes c ON pe.cliente_id = c.cliente_id
JOIN detalles_pedido dp ON pe.pedido_id = dp.pedido_id
GROUP BY c.nombre;

-- Encontrar el producto con el mayor número de ventas (cantidad):
SELECT SUM(cantidad) as total, productos.nombre FROM detalles_pedido
JOIN productos ON detalles_pedido.producto_id = productos.producto_id
GROUP BY productos.nombre
ORDER BY total DESC
LIMIT 1
;

-- Obtener el cliente con el mayor gasto total
SELECT * FROM pedidos
JOIN clientes ON clientes.cliente_id = pedidos.cliente_id
WHERE pedidos.total = (
	SELECT MAX(total) FROM pedidos);

SELECT * FROM pedidos
JOIN clientes ON clientes.cliente_id = pedidos.cliente_id
ORDER BY pedidos.total DESC
LIMIT 1;

-- Listar todos los productos que no se han vendido (es decir, que no están en ningún detalle de pedido)
SELECT * FROM productos
LEFT JOIN detalles_pedido ON detalles_pedido.producto_id = productos.producto_id
WHERE cantidad IS NULL;

-- Obtener el promedio de gasto por pedido para cada cliente
SELECT c.nombre, AVG(pe.total) AS promedio_gasto
FROM pedidos pe
JOIN clientes c ON pe.cliente_id = c.cliente_id
GROUP BY c.nombre;

-- Obtener la fecha con la mayor cantidad de ventas totales
SELECT fecha_pedido, total FROM pedidos ORDER BY total DESC LIMIT 1;

-- Obtener la lista de clientes que han realizado pedidos, junto con el número de pedidos que han hecho
SELECT clientes.nombre as cliente, COUNT(cantidad) AS totalPedidos FROM detalles_pedido
JOIN pedidos ON pedidos.pedido_id = detalles_pedido.pedido_id
RIGHT JOIN clientes ON clientes.cliente_id = pedidos.cliente_id
GROUP BY clientes.nombre;

-- Calcular el valor total de todos los productos en stock
SELECT SUM(precio * stock) as 'Valor total' FROM productos;

-- Listar los clientes que realizaron pedidos en los últimos 30 días:
SELECT c.nombre
FROM clientes c
JOIN pedidos pe ON c.cliente_id = pe.cliente_id
WHERE pe.fecha_pedido >= CURDATE() - INTERVAL 30 DAY;

-- Obtener el pedido con el mayor número de productos diferentes
SELECT pe.pedido_id, COUNT(dp.producto_id) AS num_productos
FROM pedidos pe
JOIN detalles_pedido dp ON pe.pedido_id = dp.pedido_id
GROUP BY pe.pedido_id
ORDER BY num_productos DESC;

-- Calcular el promedio de productos por pedido para cada cliente
Select clientes.nombre, AVG(cantidad) From clientes
Join pedidos On pedidos.cliente_id = clientes.cliente_id
Join detalles_pedido On detalles_pedido.pedido_id = pedidos.pedido_id
Group By clientes.nombre;

-- Listar los productos con un precio mayor al promedio de precios de todos los productos
Select p.nombre, p.precio From productos p Where p.precio > (
	Select AVG(precio) From productos
);

-- Encontrar el cliente que ha comprado la mayor cantidad de productos (considerando todas sus compras)
SELECT * FROM clientes
JOIN pedidos ON pedidos.cliente_id = clientes.cliente_id
JOIN detalles_pedido ON detalles_pedido.pedido_id = pedidos.pedido_id;


