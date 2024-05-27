-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y ROWNUM).
-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y ROWNUM)
-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.


-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
-- La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante WHERE codigo BETWEEN 4 AND 6;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y ROWNUM).
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y ROWNUM)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT * FROM producto WHERE codigo_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre, precio FROM producto WHERE precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre, precio FROM producto WHERE precio >= 400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre, precio FROM producto WHERE precio <= 400;

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre, precio FROM producto WHERE precio BETWEEN 80 AND 300;
SELECT nombre, precio FROM producto WHERE precio >= 80 AND precio <= 300;

-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre, precio FROM producto WHERE precio >= 60 AND precio <= 200;
SELECT nombre, precio FROM producto WHERE precio BETWEEN 60 AND 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto WHERE precio > 200 AND codigo_fabricante = 6;