OPTIONS (SKIP=1)
LOAD DATA
INFILE	    '/home/oracle/proyecto_final/sql_data/Comprobantes.CSV'
BADFILE	    '/home/oracle/proyecto_final/sql_data/Comprobantes.BAD'
DISCARDFILE '/home/oracle/proyecto_final/sql_data/Comprobantes.DSC'
APPEND INTO TABLE global.Comprobantes
FIELDS TERMINATED BY ';'
(idComprobante, Monto, Cajero,  Cliente, Fecha date 'dd/mm/yyyy', Producto)

