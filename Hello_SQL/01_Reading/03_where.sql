-- Where es una cláusula que se utiliza para filtrar registros. Solo los registros que cumplan con la condición especificada en la cláusula WHERE se seleccionarán.

-- Seleccionar registros de la tabla donde la columna cumpla con la condición
SELECT * FROM users WHERE age = 14;

-- Seleccionar registros de la columna especifica donde cumpla con la condición
SELECT name FROM users WHERE age = 14;

-- Seleccionar registros de la columna especifica donde cumpla con la condición
SELECT DISTINCT name FROM users WHERE age = 14;

-- Seleccionar registros de la columna especifica donde cumpla con la condición
SELECT DISTINCT age FROM users WHERE age = 14;