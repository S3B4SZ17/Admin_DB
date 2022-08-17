OPTIONS (SKIP=1)
LOAD DATA
INFILE	    'CAMBIAR_RUTA\Productos.CSV'
BADFILE	    'CAMBIAR_RUTA\Productos.BAD'
DISCARDFILE 'CAMBIAR_RUTA\Productos.DSC'
APPEND INTO TABLE global.Productos
FIELDS TERMINATED BY ';'
(idProducto, Nombre, Descripcion)


