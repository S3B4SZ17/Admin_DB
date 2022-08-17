OPTIONS (SKIP=1)
LOAD DATA
INFILE	    'CAMBIAR_RUTA\Comprobantes.CSV'
BADFILE	    'CAMBIAR_RUTA\Comprobantes.BAD'
DISCARDFILE 'CAMBIAR_RUTA\Comprobantes.DSC'
APPEND INTO TABLE global.Comprobantes
FIELDS TERMINATED BY ';'
(idComprobante, Monto, Cajero,  Cliente, Fecha date 'dd/mm/yyyy', Producto)

