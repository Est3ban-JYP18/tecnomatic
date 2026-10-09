-- Migración MySQL para crear Facturas y Detalle_Facturas si no existen
CREATE TABLE IF NOT EXISTS Facturas (
  idFacturas INT AUTO_INCREMENT PRIMARY KEY,
  Fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  Estado VARCHAR(50) DEFAULT 'Pagado',
  Total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  Usuarios_idUsuarios INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Detalle_Facturas (
  idDetalles INT AUTO_INCREMENT PRIMARY KEY,
  Factura_idFactura INT NOT NULL,
  Productos_idProductos INT NOT NULL,
  Cantidad INT NOT NULL DEFAULT 1,
  Precio_Unitario DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

-- Asegurar columnas en Usuarios
ALTER TABLE Usuarios ADD COLUMN IF NOT EXISTS Cedula VARCHAR(50) NULL;
ALTER TABLE Usuarios ADD COLUMN IF NOT EXISTS Telefono VARCHAR(50) NULL;
