-- ! Group By sirve para agrupar los resultados de una consulta por una o más columnas.

-- Agrupar los resultados de la columna edad de la tabla users
SELECT MAX(age) FROM users GROUP BY age

-- Agrupar los resultados contador de la columna edad de la tabla users
SELECT COUNT(age), age FROM users GROUP BY age

-- Agrupar los resultados contador de la columna edad de la tabla users y ordenarlos de forma ascendente
SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age ASC

-- Agrupar los resultados contador restringiendo la edad mayor a 18 de la columna edad de la tabla users y ordenarlos de forma descendente
SELECT COUNT(age), age FROM users WHERE age > 18 GROUP BY age ORDER BY age ASC