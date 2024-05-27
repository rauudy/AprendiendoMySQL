-- ! Left Join sirve para unir dos tablas y mostrar todos los registros de la tabla de la izquierda y solo los registros que coincidan en la tabla de la derecha

-- Mostrar todos los registros de la tabla principal y solo los registros que coincidan en la tabla secundaria
SELECT *
FROM users
LEFT JOIN dni ON users.user_id = dni.user_id

-- Solo con campos espeficicos
SELECT name, dni_number 
FROM users
LEFT JOIN dni ON users.user_id = dni.user_id

-- Ahora muestra todos los registros del dni y los que coinciden con users
SELECT *
FROM dni
LEFT JOIN users ON users.user_id = dni.user_id

-- Solo con campos espeficicos de la tabla principal
SELECT users.name, languages.name 
FROM users
LEFT JOIN users_languages ON users_languages.user_id = users.user_id
left JOIN languages ON users_languages.language_id = languages.language_id;