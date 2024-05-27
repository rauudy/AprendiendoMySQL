-- Like sirve para buscar registros que cumplan con una condición específica.

-- Buscar registros que contengan la cadena especificada
SELECT * FROM users WHERE email LIKE "%gmail.com";

-- Buscar registros que contengan la cadena especificada al principio
SELECT * FROM users WHERE email LIKE "sara%";

-- Buscar registros que contengan la cadena especificada en el centro
SELECT * FROM users WHERE email LIKE "%@%";

-- Buscar registros que contengan la cadena especificada al final
SELECT * FROM users WHERE email LIKE "%.com";