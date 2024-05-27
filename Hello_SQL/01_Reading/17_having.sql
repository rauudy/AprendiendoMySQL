-- ! Having sirve para filtrar los resultados de una consulta que contenga funciones de agregación.

-- TODO La cláusula HAVING es similar a la cláusula WHERE, pero WHERE se utiliza para filtrar los registros individuales antes de la agrupación, mientras que HAVING se utiliza para filtrar los grupos resultantes después de la agrupación.

-- Filtrar los resultados de la columna edad de la tabla users por los valores indicados
SELECT COUNT(age) FROM users HAVING COUNT(age) > 3

-- Filtrar los resultados de la columna edad de la tabla users por los valores indicados
SELECT COUNT(age) FROM users HAVING COUNT(age) > 3 AND age > 18

