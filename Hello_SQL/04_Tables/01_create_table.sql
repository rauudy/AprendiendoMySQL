-- ! Create table sirve para crear una tabla.

-- Crear tabla persons simple
CREATE TABLE persons(
	id int,
    name varchar(100),
    age int,
    email varchar(50),
    created date
);

-- Crear tabla persons con restricciones de campos NOT NULL (no admite valores nulos)
CREATE TABLE persons2(
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created date
);

-- Crear tabla persons con restricciones de campos NOT NULL y UNIQUE (no admite valores nulos y no admite valores duplicados)
-- ? Unique sirve para que no se puedan repetir valores en un campo, es decir, que no se puedan duplicar valores.

CREATE TABLE persons3(
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id)
);

-- Crear tabla persons con restricciones de campos NOT NULL, UNIQUE y PRIMARY KEY (no admite valores nulos, no admite valores duplicados y es clave primaria)
-- ? Primary Key sirve para que un campo sea clave primaria, es decir, que sea unico y no se pueda repetir.

CREATE TABLE persons4(
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id)
);


-- Crear tabla persons con restricciones de campos NOT NULL, UNIQUE, PRIMARY KEY y CHECK (no admite valores nulos, no admite valores duplicados, es clave primaria y tiene una condicion)
-- ? CHECK sirve para que un campo tenga una condicion, es decir, que tenga una restriccion.

CREATE TABLE persons5(
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created date,,
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK (age >= 18)
);


-- Crear tabla persons con restricciones de campos NOT NULL, UNIQUE, PRIMARY KEY, CHECK y created datetime DEFAULT CURRENT_TIMESTAMP() (no admite valores nulos, no admite valores duplicados, es clave primaria, tiene una condicion y la fecha de creacion es la fecha actual)
-- ? DEFAULT sirve para que un campo tenga un valor por defecto, es decir, que si no se le asigna un valor, tomara el valor por defecto.

CREATE TABLE persons6(
	id int NOT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK (age >= 18)
);

-- Crear tabla persons con restricciones de campos NOT NULL, UNIQUE, PRIMARY KEY y CHECK (no admite valores nulos, no admite valores duplicados, es clave primaria y tiene una condicion)
-- ? auto_increment sirve para que el campo sea autoincrementable, es decir, que se incremente automaticamente.

CREATE TABLE persons7(
	id int NOT NULL auto_increment,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK (age >= 18)
);