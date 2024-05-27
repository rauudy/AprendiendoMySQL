-- ! Null sirve para buscar registros que contengan un valor nulo.

-- Buscar registros que contengan un valor nulo en una columna específica
SELECT * FROM users WHERE email IS NULL;

-- Buscar registros que NO contengan un valor nulo en una columna específica
SELECT * FROM users WHERE email IS NOT NULL;

-- Buscar registros que contengan un valor nulo en una columna específica y cumplan con la condición especificada
SELECT * FROM users WHERE email IS NULL AND age = 14;