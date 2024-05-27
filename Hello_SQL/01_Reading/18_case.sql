-- ! Case sirve para realizar una comparación de una columna con una serie de valores y devolver un resultado en función de la coincidencia.

-- Filtrar los resultados de la columna edad de la tabla users por los valores indicados
SELECT
  CASE
    WHEN age < 18 THEN 'Menor de edad'
    WHEN age >= 18 AND age < 60 THEN 'Adulto'
    ELSE 'Adulto mayor'
  END as age_group, name, surname
  from users

-- Filtrar los resultados de la columna edad de la tabla users por los valores indicados
SELECT *,
	CASE
		WHEN age > 17 THEN "Es mayor de edad"
        ELSE "Es menor de edad"
	END as "Mayor"
FROM users;

-- Filtrar los resultados de la columna edad de la tabla users por los valores indicados
Select *,
	Case
		When age > 17 then True
        else false
	end as "mayor o no"
FROM users



-- ISNULL sirve para reemplazar los valores nulos de una columna por un valor específico.
SELECT name, IFNULL(surname, "") as "apellido", IFNULL(age, 0) as "edad" FROM users