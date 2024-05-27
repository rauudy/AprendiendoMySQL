-- ! Relacion entre tablas

-- TODO > UNO A UNO
-- Crear tabla de dni, con clave foranea de users 
-- * FOREIGN KEY = Clave foranea > "FOREIGN KEY" (nombre_campo_tabla_creada) "REFERENCES" nombre_tabla_principal(nombre_campo_tabla_principal)
create table dni (
	dni_id int auto_increment primary key,
    dni_number int not null,
    user_id int,
    unique(dni_id),
    foreign key(user_id) references users(user_id)
);

-- TODO > UNO A MUCHOS
-- Crear tabla de companias, una compania puede tener muchos usuarios
CREATE TABLE companies(
	company_id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(150) NOT NULL
);

-- Agregar campo company_id a tabla users para hacer la referencia
ALTER TABLE users ADD company_id varchar(100);

-- Modificar la tabla users para agregar la clave foranea de company_id
ALTER TABLE users 
MODIFY COLUMN company_id int;

-- Agregar la clave foranea de company_id de la tabla companies a la tabla users
ALTER TABLE users
ADD CONSTRAINT foreign key(company_id) references companies(company_id);

-- TODO > MUCHOS A MUCHOS
-- Crear tabla de lenguajes de programacion, que muchos usuarios pueden tener muchos lenguajes de programacion
CREATE TABLE languages(
	language_id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(150) NOT NULL
);

-- Crear tabla de usuarios_lenguajes, que relaciona a los usuarios con los lenguajes de programacion, para hacer la relacion
-- se crea una tabla intermedia que relaciona a las dos tablas con las claves foraneas
CREATE TABLE users_languages(
	users_language_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    language_id INT,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(language_id) REFERENCES languages(language_id),
    UNIQUE(user_id, language_id)
);




-- TODO > INSERTAR DATOS EN LAS TABLAS

-- * USERS y DNI
-- ! Insertar datos en la tabla DNI para la relacion 1:1 
INSERT INTO dni (dni_id,dni_number, user_id) VALUES (2,22222222, 2);
INSERT INTO dni (dni_id,dni_number, user_id) VALUES (3,33333333, 3);
INSERT INTO dni (dni_id,dni_number) VALUES (4,44444444);


-- * USERS y COMPANIES
-- ! Insertar datos en la tabla companies para la relacion 1:N
INSERT INTO companies (name) VALUES ('Mouredev');
INSERT INTO companies (name) VALUES ('Apple');
INSERT INTO companies (name) VALUES ('Google');

-- ! Insertar datos en la tabla users para la relacion 1:N
UPDATE users SET company_id = 1 WHERE user_id = 1;
UPDATE users SET company_id = 2 WHERE user_id = 3;
UPDATE users SET company_id = 3 WHERE user_id = 4;
UPDATE users SET company_id = 1 WHERE user_id = 7;

-- * USERS y LANGUAGES
-- ! Insertar datos en la tabla languages para la relacion N:M
INSERT INTO languages (name) VALUES ('Swift');
INSERT INTO languages (name) VALUES ('Kotlin');
INSERT INTO languages (name) VALUES ('JavaScript');
INSERT INTO languages (name) VALUES ('Java');
INSERT INTO languages (name) VALUES ('Python');
INSERT INTO languages (name) VALUES ('C#');
INSERT INTO languages (name) VALUES ('COBOL');

-- ! Insertar datos en la tabla users_languages para la relacion N:M
INSERT INTO users_languages (user_id, language_id) VALUE (1,1);
INSERT INTO users_languages (user_id, language_id) VALUE (1,2);
INSERT INTO users_languages (user_id, language_id) VALUE (1,5);

INSERT INTO users_languages (user_id, language_id) VALUE (2,3);
INSERT INTO users_languages (user_id, language_id) VALUE (2,5);
