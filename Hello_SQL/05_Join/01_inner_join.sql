-- ! Inner Join sirve para unir dos tablas y mostrar solo los registros que coincidan en ambas tablas

-- Mostrar todos los registros con los campos de dni de forma secuencial
SELECT * FROM users
INNER JOIN dni;

-- Mostrar solo los registros con los campos de dni que coincidan en ambas tablas
-- * Relacion de 1:1
SELECT * FROM users
INNER JOIN dni
ON users.user_id = dni.user_id;

-- Mostrar solo los registros con los campos de dni que coincidan en ambas tablas y ordenarlos por edad
SELECT name,dni_number From users
INNER JOIN dni
ON users.user_id = dni.user_id
ORDER BY age ASC;

-- Mostrar todos los registros con los campos de users y companies que coincidan en ambas tablas
-- * Relacion de 1:N
SELECT * FROM users
JOIN companies
ON users.company_id = companies.company_id;

-- La primer tabla que se menciona en el JOIN es la que se toma como principal
Select * from companies
JOIN users
ON users.company_id = companies.company_id;

-- Si hay dos tablas con el mismo nombre de columna, se puede especificar de que tabla se quiere obtener el campo
Select companies.name, users.name from companies
JOIN users
ON users.company_id = companies.company_id;

-- Mostrar todos los registros con los campos de users y languages que coincidan en la tabla de union users_languages
-- * Relacion de N:M
SELECT * 
FROM users_languages
JOIN users ON users_languages.user_id = users.user_id
JOIN languages ON users_languages.language_id = languages.language_id;

-- Mostrar solo las columnas de nombre de usuario y nombre de lenguaje
SELECT users.name, languages.name 
FROM users_languages
JOIN users ON users_languages.user_id = users.user_id
JOIN languages ON users_languages.language_id = languages.language_id;