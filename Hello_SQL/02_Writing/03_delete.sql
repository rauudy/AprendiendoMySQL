-- ! Delete sirve para eliminar registros de una tabla.
-- * Regla de oro: Siempre que se haga un DELETE, se debe especificar un WHERE para evitar eliminar todos los registros de la tabla.

-- Eliminar el registro con user_id = 11
DELETE FROM users WHERE user_id = 11