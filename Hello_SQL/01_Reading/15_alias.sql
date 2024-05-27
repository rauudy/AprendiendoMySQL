-- ! Alias sirve para asignar un nombre a una columna o tabla temporalmente.

-- Asignar un alias a la columna init_date
SELECT name, init_date AS "inicio trabajo" FROM users 

-- Concat sirve para unir dos o más cadenas de texto.
SELECT CONCAT(name, " " , surname) AS "nombre completo" FROM users