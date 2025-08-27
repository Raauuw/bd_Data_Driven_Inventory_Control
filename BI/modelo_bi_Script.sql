CREATE DATABASE dw_data_driven_inventory_control;
GO
USE dw_data_driven_inventory_control;

CREATE TABLE dim_producto (
    producto_key     INT IDENTITY(1,1) PRIMARY KEY, 
    id_producto      INT,        
    nombre_producto  VARCHAR(100),
    categoria_prod   VARCHAR(50),
    precio_unitario  DECIMAL(10,2),
    costo_unitario   DECIMAL(10,2),
    stock_actual     INT,
    categoria_abc    CHAR(1)   
);

CREATE TABLE dim_cliente (
    cliente_key    INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente     INT,
    nombre_cliente VARCHAR(100),
    correo         VARCHAR(100)
);

CREATE TABLE dim_tiempo (
    tiempo_key INT IDENTITY(1,1) PRIMARY KEY,
    fecha      DATE,
    anio       AS YEAR(fecha),
    mes        AS MONTH(fecha),
    trimestre  AS CASE
                    WHEN MONTH(fecha) BETWEEN 1 AND 3 THEN 1
                    WHEN MONTH(fecha) BETWEEN 4 AND 6 THEN 2
                    WHEN MONTH(fecha) BETWEEN 7 AND 9 THEN 3
                    ELSE 4
                  END
);

CREATE TABLE dim_categoria_abc (
    categoria_key INT IDENTITY(1,1) PRIMARY KEY,
    categoria_abc CHAR(1),
    descripcion   VARCHAR(100)
);

--Creacion de tablas de hechos o fact_table
CREATE TABLE fact_ventas (
    fact_key      INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_key    INT,
    producto_key  INT,
    cliente_key   INT,
    categoria_key INT,        
    cantidad      INT,
    subtotal      DECIMAL(12,2),
    total         DECIMAL(12,2),
    FOREIGN KEY (tiempo_key)   REFERENCES dim_tiempo(tiempo_key),
    FOREIGN KEY (producto_key) REFERENCES dim_producto(producto_key),
    FOREIGN KEY (cliente_key)  REFERENCES dim_cliente(cliente_key)
);
