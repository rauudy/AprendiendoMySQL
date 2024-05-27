-- 1. Actores que tienen de primer nombre 'Scarlett'.
-- 2. Actores que tienen de apellido 'Johansson'.
-- 3. Actores que contengan una 'O' en su nombre.
-- 4. Actores que contengan una 'O' en su nombre y en una 'A' en su apellido.
-- 5. Actores que contengan dos 'O' en su nombre y en una 'A' en su apellido.
-- 6. Actores donde su tercera letra sea 'B'.


-- 1. Actores que tienen de primer nombre 'Scarlett'.
SELECT * FROM actor WHERE first_name = "SCARLETT";

-- 2. Actores que tienen de apellido 'Johansson'.
SELECT * FROM actor WHERE last_name = "JOHANSSON";

-- 3. Actores que contengan una 'O' en su nombre.
SELECT * FROM actor WHERE first_name LIKE "%O%";

-- 4. Actores que contengan una 'O' en su nombre y en una 'A' en su apellido.
SELECT * FROM actor
WHERE first_name LIKE "%O%" AND last_name LIKE "%A%";

-- 5. Actores que contengan dos 'O' en su nombre y en una 'A' en su apellido.
SELECT * FROM actor
WHERE first_name LIKE "%O%O%" AND last_name LIKE "%A%";

-- 6. Actores donde su tercera letra sea 'B'.
SELECT * FROM actor
WHERE first_name LIKE "__B%"
