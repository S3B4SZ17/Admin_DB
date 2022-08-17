OPTIONS (SKIP=1)
LOAD DATA
INFILE	    '/home/oracle/proyecto_final/sql_data/Lugar.CSV'
BADFILE	    '/home/oracle/proyecto_final/sql_data/Lugar.BAD'
DISCARDFILE '/home/oracle/proyecto_final/sql_data/Lugar.DSC'
APPEND INTO TABLE global.Lugares
FIELDS TERMINATED BY ';'
(idLugar , Nombre, Direccion)


