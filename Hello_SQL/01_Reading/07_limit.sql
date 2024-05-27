-- ! Limit sirve para limitar la cantidad de registros que se muestran en una consulta.

-- Limitar la cantidad de registros que se muestran en la consulta
SELECT * FROM users LIMIT 3;

-- Limitar la cantidad de registros que se muestran en la consulta cuando cumple con la condición especificada
SELECT * FROM users WHERE NOT email = "sara@hotmail.com" OR age = 14 LIMIT 2;

