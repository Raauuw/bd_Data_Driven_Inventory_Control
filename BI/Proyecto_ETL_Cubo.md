
# Proyecto ETL con SSIS y Cubo OLAP

Este documento muestra el flujo de trabajo realizado para el proyecto de integración de datos, construcción del Data Warehouse y creación del cubo en **SQL Server Analysis Services (SSAS)**.

---

## 1. Flujo de Control en SSIS

![Flujo de Control](Part1.png)

En esta etapa se definen las tareas principales:
- **Clean tables destination**: Limpieza de tablas destino.
- **Poblar información**: Inserción de datos desde las tablas de origen hacia las dimensiones.
- **Probar Fact Table**: Validación de la tabla de hechos.

---

## 2. Flujo de Datos para las Dimensiones

![Flujo de Datos Dimensiones](Part2.png)

Aquí se conectan las tablas de **origen** (transaccional) con sus respectivas **dimensiones** en el Data Warehouse:
- Dimensión Tiempo
- Dimensión Categoría ABC
- Dimensión Cliente
- Dimensión Producto

---

## 3. Flujo de Datos para la Tabla de Hechos

![Flujo de Datos Hechos](Part3.png)

Este flujo extrae los datos de las tablas de detalle de ventas, aplica **Lookups** para obtener las llaves sustitutas de cada dimensión (tiempo, cliente, producto, categoría) y finalmente inserta los datos en la **tabla de hechos** `fact_ventas`.

---

## 4. Modelo Estrella del Data Warehouse

![Modelo Estrella](Cubo.png)

El modelo estrella final se compone de:
- **Tabla de hechos:** `fact_ventas`
- **Dimensiones:**
  - `dim_tiempo`
  - `dim_producto`
  - `dim_cliente`
  - `dim_categoria_abc`

---

## Conclusión

Con este flujo se logró construir un **Data Warehouse funcional** y preparado para la creación de un **Cubo OLAP** en SQL Server Analysis Services (SSAS), permitiendo así la explotación de datos mediante consultas analíticas y herramientas de BI.
