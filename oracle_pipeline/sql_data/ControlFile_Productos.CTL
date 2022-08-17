OPTIONS (SKIP=1)
LOAD DATA
INFILE	    '/home/oracle/proyecto_final/sql_data/Productos.CSV'
BADFILE	    '/home/oracle/proyecto_final/sql_data/Productos.BAD'
DISCARDFILE '/home/oracle/proyecto_final/sql_data/Productos.DSC'
APPEND INTO TABLE global.Productos
FIELDS TERMINATED BY ';'
(idProducto, Nombre, Descripcion)


