-- And sirve para combinar dos o más condiciones.
-- Or sirve para combinar dos o más condiciones.
-- Not sirve para negar una condición.

-- Seleccionar registros de la tabla donde la columna no cumpla con la condición
SELECT * FROM users WHERE NOT email = "sara@hotmail.com";

-- Seleccionar registros de la tabla donde la columna no cumpla con la condición 'Y' la columna cumpla con la condición
SELECT * FROM users WHERE NOT email = "sara@hotmail.com" AND age = 24;

-- Seleccionar registros de la tabla donde la columna no cumpla con la condición 'O' la columna cumpla con la condición
SELECT * FROM users WHERE NOT email = "sara@hotmail.com" OR age = 14 

