OPTIONS (SKIP=1)
LOAD DATA
INFILE	    '/home/oracle/proyecto_final/sql_data/Cliente.CSV'
BADFILE	    '/home/oracle/proyecto_final/sql_data/Cliente.BAD'
DISCARDFILE '/home/oracle/proyecto_final/sql_data/Cliente.DSC'
APPEND INTO TABLE global.Clientes
FIELDS TERMINATED BY ';'
(idCliente,	Nombre, Apellido, Correo)