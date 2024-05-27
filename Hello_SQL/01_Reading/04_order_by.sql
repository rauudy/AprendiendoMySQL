-- Order By sirve para ordenar los resultados de una consulta.

-- Ordenar los registros de la tabla por la columna especificada
SELECT * FROM users ORDER BY age;

-- Ordenar los registros de la tabla por la columna especificada de forma descendente
SELECT * FROM users ORDER BY age DESC;

-- Ordenar los registros de la tabla cuando cumple con la condición especificada
SELECT * FROM users WHERE email = "sara@hotmail.com" ORDER BY age DESC;

-- Ordenar los registros de la tabla por la columna especificada de forma descendente cuando cumple con la condición especificada
SELECT name FROM users WHERE email = "sara@hotmail.com" ORDER BY age DESC;