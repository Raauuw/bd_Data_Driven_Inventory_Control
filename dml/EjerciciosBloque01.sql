--EJERCICIOS BASICOS
USE bd_data_driven_inventory_control;
--Obtener un listado de los clientes ordenado alfabeticamente
SELECT id_cliente, nombre_cliente, correo
FROM CLIENTE
ORDER BY nombre_cliente;
--Mostrar metricas de CLASIFICACION_ABC
SELECT id_producto, consumo_anual, porcentaje_acumulado, categoria_abc
FROM CLASIFICACION_ABC
ORDER BY consumo_anual DESC;
--Mostrar metricas de CLASIFICACION_ABC incluyendo producto
SELECT p.id_producto, p.nombre_producto,
       a.consumo_anual, a.porcentaje_acumulado, a.categoria_abc
FROM PRODUCTO p
JOIN CLASIFICACION_ABC a ON p.id_producto = a.id_producto
ORDER BY a.consumo_anual DESC;
--Buscar por Atrubuto,filtrar productos por categoría ABC
SELECT p.id_producto, p.nombre_producto, a.categoria_abc
FROM PRODUCTO p
JOIN CLASIFICACION_ABC a ON p.id_producto = a.id_producto
WHERE a.categoria_abc = 'A';
--Agrupar por criterio, las ventas totales por categoría ABC
SELECT a.categoria_abc,
       SUM(dv.subtotal) AS total_ventas
FROM DETALLE_VENTA dv
JOIN PRODUCTO p        ON p.id_producto = dv.id_producto
JOIN CLASIFICACION_ABC a ON a.id_producto = p.id_producto
GROUP BY a.categoria_abc
ORDER BY total_ventas DESC;
--¿Cuantos productos hay por categoria?
SELECT categoria_abc, COUNT(*) AS num_productos
FROM CLASIFICACION_ABC
GROUP BY categoria_abc
ORDER BY num_productos DESC;

--EJERCICIOS INTERMEDIOS
--Productos por CATEGORIA ABC
SELECT  p.id_producto,
        p.nombre_producto,
        p.precio,
        p.stock,
        a.categoria_abc
FROM    PRODUCTO p
JOIN    CLASIFICACION_ABC a
  ON    p.id_producto = a.id_producto
ORDER BY p.nombre_producto;
--Clientes con sus compras, Listar el codigo y el nombre del cliente, junto al numero de ventas realizadas
SELECT  c.id_cliente,
        c.nombre_cliente,
        COUNT(v.id_venta) AS num_ventas
FROM    CLIENTE c
LEFT JOIN VENTA v
  ON    v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
ORDER BY num_ventas DESC;
--Ventas diarias con diferencia de objetivos, Suponiendo que para cada venta hay un objetivo de S/200, mostrar la fecha, el total de la venta y la diferencia con esa meta.
SELECT  fecha,
        total,
        (total - 200.00) AS diferencia_meta
FROM    VENTA
ORDER BY fecha;
--Cantidad de productos por categoria ABC, Contar cuantos productos estan en cada categoria A/B/C
SELECT  categoria_abc,
        COUNT(*) AS num_productos
FROM    CLASIFICACION_ABC
GROUP BY categoria_abc
ORDER BY num_productos DESC;

--EJERCICIOS AVANZADOS
--Top 5 productos con mayor rotacion, Calcular el porcentaje de rotacion de inventario (consumo_anual / stock) × 100 para cada producto y mostrar los 5 con mejor porcentaje
SELECT TOP 5
        p.id_producto,
        p.nombre_producto,
        p.stock,
        a.consumo_anual,
        (a.consumo_anual / NULLIF(p.stock, 0) * 100.0) AS porcentaje_rotacion
FROM    PRODUCTO p
JOIN    CLASIFICACION_ABC a
  ON    p.id_producto = a.id_producto
WHERE   p.stock > 0
ORDER BY porcentaje_rotacion DESC;
--Deteccion de desviaciones criticas,Calcular la desviacion porcentual de la rotacion frente al promedio de rotacion de todos los productos y listar los que superen el 20% de desvio.
-- primero calculamos el promedio de rotación
WITH Promedio AS (
    SELECT AVG(a.consumo_anual / NULLIF(p.stock, 0)) AS rotacion_media
    FROM   PRODUCTO p
    JOIN   CLASIFICACION_ABC a ON p.id_producto = a.id_producto
    WHERE  p.stock > 0
),
Rotacion AS (
    SELECT p.id_producto,
           p.nombre_producto,
           (a.consumo_anual / NULLIF(p.stock,0)) AS rotacion_individual
    FROM   PRODUCTO p
    JOIN   CLASIFICACION_ABC a ON p.id_producto = a.id_producto
    WHERE  p.stock > 0
)
SELECT  r.id_producto,
        r.nombre_producto,
        r.rotacion_individual,
        (r.rotacion_individual - pr.rotacion_media) / pr.rotacion_media * 100 AS desviacion_porcentual
FROM    Rotacion r CROSS JOIN Promedio pr
WHERE   ABS((r.rotacion_individual - pr.rotacion_media) / pr.rotacion_media * 100) > 20
ORDER BY desviacion_porcentual DESC;
--Historico de ventas por cliente, Contar cuantos detalles de ventas (DETALLE_VENTA) ha generado cada cliente
SELECT  c.id_cliente,
        c.nombre_cliente,
        COUNT(dv.id_detalle) AS registros
FROM    CLIENTE c
LEFT JOIN VENTA v      ON v.id_cliente = c.id_cliente
LEFT JOIN DETALLE_VENTA dv
         ON dv.id_venta = v.id_venta
GROUP BY c.id_cliente, c.nombre_cliente
ORDER BY registros DESC;
-- Numero de productos por categoría ABC (incluye los que no tienen clasificación)
SELECT  
    COALESCE(a.categoria_abc, 'Sin categoria') AS categoria,
    COUNT(*) AS num_productos
FROM    PRODUCTO p
LEFT JOIN CLASIFICACION_ABC a 
       ON p.id_producto = a.id_producto
GROUP BY COALESCE(a.categoria_abc, 'Sin categoria')
ORDER BY num_productos DESC;





