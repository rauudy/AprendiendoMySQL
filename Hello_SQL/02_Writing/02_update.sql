-- ! Update sirve para modificar datos en una tabla.
-- * Regla de oro: Siempre que se haga un UPDATE, se debe especificar un WHERE para evitar modificar todos los registros de la tabla.

-- Modificar el campo age del registro con user_id = 11 (para no cambiar todos los registros de la tabla)
UPDATE users SET age = 21 WHERE user_id = 11;

UPDATE users SET age = 20, init_date = '2020-01-01' WHERE user_id = 11;

