CREATE DATABASE empresacl;
USE empresacl;

CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

CREATE TABLE proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    presupuesto DECIMAL(10, 2) NOT NULL
);

CREATE TABLE asignaciones (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_proyecto INT NOT NULL,
    horas INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id_proyecto)
);

INSERT INTO departamentos (nombre, presupuesto) VALUES
    ('Ventas', 100000),
    ('Marketing', 80000),
    ('Desarrollo', 150000),
    ('Recursos Humanos', 70000);

INSERT INTO empleados (nombre, apellido, salario, id_departamento) VALUES
    ('Juan', 'Pérez', 5000, 1),
    ('María', 'González', 6500, 2),
    ('Pedro', 'Rodríguez', 7000, 3),
    ('Ana', 'Martínez', 5500, 1),
    ('Luis', 'Hernández', 6000, 3),
    ('Laura', 'Torres', 4800, 4);

INSERT INTO proyectos (nombre, fecha_inicio, fecha_fin, presupuesto) VALUES
    ('Proyecto A', '2023-01-01', '2023-06-30', 50000),
    ('Proyecto B', '2023-03-15', '2023-09-30', 75000),
    ('Proyecto C', '2023-05-01', NULL, 90000);

INSERT INTO asignaciones (id_empleado, id_proyecto, horas) VALUES
    (1, 1, 100),
    (2, 1, 80),
    (3, 2, 120),
    (4, 2, 90),
    (5, 3, 150),
    (6, 3, 80);