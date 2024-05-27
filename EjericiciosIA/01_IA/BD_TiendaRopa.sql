CREATE DATABASE tienda_ropa;

USE tienda_ropa;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO categorias (nombre) VALUES
    ('Camisas'),
    ('Pantalones'),
    ('Vestidos'),
    ('Abrigos');

INSERT INTO productos (nombre, descripcion, precio, stock, id_categoria) VALUES
    ('Camisa de algodón', 'Camisa de algodón para hombre', 29.99, 100, 1),
    ('Pantalón de vestir', 'Pantalón de vestir para hombre', 49.99, 75, 2),
    ('Vestido de verano', 'Vestido de verano para mujer', 39.99, 50, 3),
    ('Abrigo de invierno', 'Abrigo de invierno para hombre', 79.99, 25, 4);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES
    (1, 5, '2023-05-01'),
    (2, 3, '2023-05-02'),
    (3, 8, '2023-05-03'),
    (4, 2, '2023-05-04');


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