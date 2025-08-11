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