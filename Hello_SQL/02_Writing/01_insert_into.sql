-- ! Insert Into sirve para insertar datos en una tabla.
-- la sintaxis es la siguiente: (campos de la tabla) values (valores a insertar)

-- Insertar un nuevo registro en la tabla users
INSERT INTO users (users_id, name, surname) VALUES (8, 'Luis', 'Gonzalez');

-- Insertar un nuevo registro en la tabla users sin especificar el campo users_id (se autoincrementa)
INSERT INTO users (name, surname) VALUES ('Paco', 'Gento');

-- Insertar un nuevo registro en la tabla users saltando el orden de los registros
INSERT INTO users (user_id, name, surname) VALUES (11, 'El', 'Messias');