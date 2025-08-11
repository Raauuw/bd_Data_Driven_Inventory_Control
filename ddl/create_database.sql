--Creacion de base de datos
CREATE	DATABASE bd_data_driven_inventory_control
USE bd_data_driven_inventory_control
--Creacion de tablas

---Tabla CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);
-- Verificacion de detalles de la tabla creada
EXEC sp_help CLIENTE;

---Tabla PRODUCTO
CREATE TABLE PRODUCTO (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);
EXEC sp_help PRODUCTO;

---Tabla VENTA
CREATE TABLE VENTA (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
EXEC sp_help VENTA;

---Tabla CLASIFICACION_ABC
CREATE TABLE CLASIFICACION_ABC (
    id_producto INT PRIMARY KEY,
    consumo_anual DECIMAL(12,2) NOT NULL,
    porcentaje_acumulado DECIMAL(5,2) NOT NULL,
    categoria_abc CHAR(1) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
EXEC sp_help CLASIFICACION_ABC

---Tabla INVENTARIO
CREATE TABLE INVENTARIO (
    id_movimiento   INT IDENTITY(1,1) PRIMARY KEY,
    tipo_movimiento VARCHAR(20) NOT NULL,    -- 'entrada' / 'salida'
    cantidad        INT NOT NULL,
    fecha           DATE NOT NULL,
    id_producto     INT NOT NULL,
    CONSTRAINT CK_INVENTARIO_tipo
        CHECK (tipo_movimiento IN ('entrada','salida')),
    CONSTRAINT CK_INVENTARIO_cantidad
        CHECK (cantidad > 0),
    CONSTRAINT FK_INVENTARIO_PRODUCTO
        FOREIGN KEY (id_producto)
        REFERENCES PRODUCTO(id_producto)
        ON UPDATE CASCADE --En caso sea necesario la actualizacion del id del producto
        ON DELETE NO ACTION --Evita que el producto sea eliminado en caso tenga movimientos
);
GO --Fin del primer lote

-- Índice de apoyo para consultas por producto
CREATE INDEX IX_INVENTARIO_id_producto ON INVENTARIO(id_producto);
GO--Fin del segundo lote
EXEC sp_help INVENTARIO