-- ! Right Join sirve para unir dos tablas y mostrar todos los registros de la tabla de la derecha y solo los registros que coincidan en la tabla de la izquierda

-- Mostrar todos los registros de la tabla secundaria y solo los registros que coincidan en la tabla principal
SELECT *
FROM users
RIGHT JOIN dni ON users.user_id = dni.user_id;

-- Solo con campos espeficicos
SELECT name, dni_number 
FROM users
RIGHT JOIN dni ON users.user_id = dni.user_id;

-- Ahora muestra todos los registros del dni y los que coinciden con users
SELECT *
FROM dni
RIGHT JOIN users ON users.user_id = dni.user_id;

-- Solo con campos espeficicos de la tabla secundaria
SELECT users.name, languages.name 
FROM users
RIGHT JOIN users_languages ON users_languages.user_id = users.user_id
RIGHT JOIN languages ON users_languages.language_id = languages.language_id;