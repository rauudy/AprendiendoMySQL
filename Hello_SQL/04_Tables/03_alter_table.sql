-- ! Alter sirver para modificar una tabla.

-- Modificar tabla persons8, agregar campo surname 
-- * ADD = Agregar columna
ALTER TABLE persons8
ADD surname varchar(150);

-- Modificar tabla persons8, renombrar campo surname a descripcion
-- * RENAME COLUMN = Renombrar columna > "RENAME COLUMN" nombre_viejo "TO" nombre_nuevo
ALTER TABLE persons8
RENAME COLUMN surname TO descripcion;

-- Modificar tabla persons8, modificar campo descripcion
-- * MODIFY COLUMN = Modificar columna > "MODIFY COLUMN" nombre_columna tipo_dato
ALTER TABLE persons8
MODIDY COLUMN descripcion varchar(250);

-- Modificar tabla persons8, eliminar campo descripcion
-- * DROP COLUMN = Eliminar columna > "DROP COLUMN" nombre_columna
ALTER TABLE persons8
DROP COLUMN descripcion;