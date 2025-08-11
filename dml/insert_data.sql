USE bd_data_driven_inventory_control
GO
--ANOTACIONES IMPORTANTES
-- EN CASO DE INGRESAR UN NOMBRE MAL UPDATE NOMBRETABLA SET DATOAMODIFICAR=MODIFICACION
-- WHERE ID=!6 (PARA QUE SOLO AFECTE A ESTE REGISTRO)

-- Clientes
select*from CLIENTE;

INSERT INTO CLIENTE (nombre_cliente, correo) VALUES
('Ferretería Los Pinos', 'contacto@lospinos.com'),
('Construmax Perú', 'ventas@construmax.pe'),
('Hogar & Obra', 'info@hogaryobra.com'),
('Materiales del Sur', 'contacto@materialessur.pe'),
('AceroFácil SAC', 'ventas@acerofacil.com');

select*from PRODUCTO;

INSERT INTO PRODUCTO (nombre_producto, precio, stock) VALUES
('Taladro Eléctrico 500W', 250.50, 15),
('Caja de Tornillos 100u', 15.75, 100),
('Pintura Blanca 1Gal', 45.90, 50),
('Cemento Portland 42.5Kg', 28.00, 200),
('Escalera Aluminio 6 peldaños', 320.00, 8);

select*from CLASIFICACION_ABC;

INSERT INTO CLASIFICACION_ABC (id_producto, consumo_anual, porcentaje_acumulado, categoria_abc) VALUES
(1, 5000.00, 40.00, 'A'),
(2, 1500.00, 52.00, 'A'),
(3, 800.00, 58.00, 'B'),
(4, 1200.00, 65.00, 'B'),
(5, 300.00, 68.00, 'C');

select*from INVENTARIO;

INSERT INTO INVENTARIO (tipo_movimiento, cantidad, fecha, id_producto) VALUES
('entrada', 10, '2025-01-05', 1),
('entrada', 50, '2025-01-06', 2),
('entrada', 20, '2025-01-07', 3),
('entrada', 100, '2025-01-08', 4),
('entrada', 5, '2025-01-09', 5),
('salida', 2, '2025-01-10', 1),
('salida', 5, '2025-01-11', 2),
('salida', 3, '2025-01-12', 3),
('salida', 10, '2025-01-13', 4),
('salida', 1, '2025-01-14', 5),
('entrada', 8, '2025-01-15', 1),
('entrada', 40, '2025-01-16', 2),
('entrada', 15, '2025-01-17', 3),
('salida', 4, '2025-01-18', 1),
('salida', 6, '2025-01-19', 2),
('entrada', 12, '2025-01-20', 4),
('salida', 2, '2025-01-21', 5),
('salida', 7, '2025-01-22', 3),
('entrada', 9, '2025-01-23', 1),
('entrada', 20, '2025-01-24', 5);

select*from VENTA;

INSERT INTO VENTA (fecha, total, id_cliente) VALUES
('2025-01-10', 500.00, 1),
('2025-01-11', 78.75, 2),
('2025-01-12', 137.70, 3),
('2025-01-13', 280.00, 4),
('2025-01-14', 320.00, 5),
('2025-01-15', 250.50, 1),
('2025-01-16', 45.90, 2),
('2025-01-17', 560.00, 3),
('2025-01-18', 95.00, 4),
('2025-01-19', 30.00, 5),
('2025-01-20', 150.00, 1),
('2025-01-21', 250.50, 2),
('2025-01-22', 560.00, 3),
('2025-01-23', 45.90, 4),
('2025-01-24', 75.00, 5),
('2025-01-25', 320.00, 1),
('2025-01-26', 28.00, 2),
('2025-01-27', 50.00, 3),
('2025-01-28', 90.00, 4),
('2025-01-29', 100.00, 5);

select*from DETALLE_VENTA;

INSERT INTO DETALLE_VENTA (cantidad, subtotal, id_venta, id_producto) VALUES
(2, 501.00, 1, 1),
(5, 78.75, 2, 2),
(3, 137.70, 3, 3),
(10, 280.00, 4, 4),
(1, 320.00, 5, 5),
(1, 250.50, 6, 1),
(1, 45.90, 7, 3),
(2, 560.00, 8, 5),
(5, 95.00, 9, 2),
(2, 30.00, 10, 2),
(3, 150.00, 11, 3),
(1, 250.50, 12, 1),
(2, 560.00, 13, 5),
(1, 45.90, 14, 3),
(5, 75.00, 15, 2),
(1, 320.00, 16, 5),
(1, 28.00, 17, 4),
(2, 50.00, 18, 2),
(3, 90.00, 19, 3),
(4, 100.00, 20, 4);

--Recalculando totales de venta--
UPDATE v
SET v.total = x.suma
FROM VENTA v
JOIN (
  SELECT id_venta, SUM(subtotal) AS suma
  FROM DETALLE_VENTA
  GROUP BY id_venta
) x ON x.id_venta = v.id_venta;
GO

--Numero de ventas por cliente--
SELECT c.nombre_cliente,
       COUNT(v.id_venta) AS num_ventas
FROM   VENTA v
JOIN   CLIENTE c ON c.id_cliente = v.id_cliente
GROUP BY c.nombre_cliente
ORDER BY num_ventas DESC;

--Numero de productos por categoria ABC
SELECT a.categoria_abc AS categoria,
       COUNT(*)        AS num_productos
FROM   CLASIFICACION_ABC a
GROUP BY a.categoria_abc
ORDER BY a.categoria_abc;

--Numero de items por venta
SELECT a.categoria_abc AS categoria,
       COUNT(*)        AS num_productos
FROM   CLASIFICACION_ABC a
GROUP BY a.categoria_abc
ORDER BY a.categoria_abc;

-- Numero de ventas por cliente (mayor a menor)
SELECT
    c.nombre_cliente,
    COUNT(v.id_venta) AS num_ventas
FROM VENTA v
JOIN CLIENTE c ON c.id_cliente = v.id_cliente
GROUP BY c.nombre_cliente
ORDER BY num_ventas DESC;  -- o ORDER BY 2 DESC

-- Numero de productos por categoría ABC (A/B/C)
SELECT
    a.categoria_abc,
    COUNT(*) AS num_productos
FROM CLASIFICACION_ABC a
GROUP BY a.categoria_abc
ORDER BY num_productos DESC;