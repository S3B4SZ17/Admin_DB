OPTIONS (SKIP=1)
LOAD DATA
INFILE	    '/home/oracle/proyecto_final/sql_data/Cajero.CSV'
BADFILE	    '/home/oracle/proyecto_final/sql_data/Cajero.BAD'
DISCARDFILE '/home/oracle/proyecto_final/sql_data/Cajero.DSC'
APPEND INTO TABLE global.Cajeros
FIELDS TERMINATED BY ';'
(idCajero, Nombre, Banco, Lugar)