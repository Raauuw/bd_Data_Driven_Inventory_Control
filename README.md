# bdData_Driven_Inventory_Control
🎯 Título del proyecto:
“Mejora de la gestión de inventarios en la tienda minorista ‘EcoFerre’ mediante análisis ABC y visualización con herramientas BI”

🧩 1. Contexto del problema
La tienda EcoFerre, dedicada a la venta de productos ferreteros, cuenta con más de 100 ítems en su inventario. Sin embargo, el gerente ha notado lo siguiente:

Algunos productos se agotan rápidamente sin reposición inmediata.

Otros productos permanecen almacenados por meses, ocupando espacio y capital.

No se cuenta con una estrategia clara para priorizar el control y la reposición de stock.

Necesidad: aplicar un modelo de inteligencia de negocios sencillo que permita priorizar los productos según su impacto económico, tomar decisiones estratégicas y mejorar la rotación del inventario.

📌 2. Objetivo general
Desarrollar un sistema de clasificación ABC utilizando técnicas de modelamiento de datos para optimizar la gestión de inventarios de EcoFerre y visualizar los hallazgos mediante una herramienta de inteligencia de negocios (Power BI, Tableau o Excel).

📈 3. Datos utilizados
Simulación de 20 productos con las siguientes columnas:

ID	Producto	Precio Unitario (S/.)	Cantidad Vendida Anual	Consumo Anual (S/.)
P01	Taladro	250	120	30,000
P02	Martillo	45	500	22,500
...	...	...	...	...

Fórmula: Consumo anual = Precio × Cantidad vendida

🔍 4. Modelamiento de datos
Pasos:

Calcular el consumo anual de cada producto.

Ordenar de mayor a menor consumo.

Calcular el porcentaje acumulado del consumo total.

Clasificar según el modelo ABC:

A: 70-80% del valor, representa el 10-20% de los productos.

B: 15-25% del valor, 30% de los productos.

C: 5% restante, 50% de los productos.

📊 5. Visualización en BI (Power BI o Excel)
Visualizaciones sugeridas:

Gráfico de Pareto del consumo acumulado.

Dashboard con filtros por categoría A/B/C.

Tabla dinámica de productos por categoría.

Semáforo o heatmap para identificar productos críticos (A) y sobrantes (C).

🧠 6. Toma de decisiones
A partir del análisis:

Categoría A: implementar control diario/semanal, compras más frecuentes, stock mínimo ajustado.

Categoría B: control mensual, reposición estándar.

Categoría C: considerar liquidación o reducir pedidos.

📌 7. Resultados esperados
Reducción del 20% en costos de almacenamiento.

Mejora del 30% en la disponibilidad de productos clave.

Disminución de pérdidas por sobrestock o quiebre de stock.

Bases para aplicar modelos más avanzados (EOQ, Min-Max, pronósticos).

⚙️ 8. Herramientas a utilizar
Excel: para el modelamiento inicial, gráficos y dashboards básicos.

Power BI (opcional): para visualizaciones más dinámicas e interactivas.

Python (opcional): si deseas automatizar cálculos o crear dashboards con Streamlit.

...............................................................................................

📊 CASO DE INTELIGENCIA DE NEGOCIOS
“Implementación de una Solución de Business Intelligence para la Optimización del Inventario en la Ferretería EcoFerre”
🧩 1. Planteamiento del problema
La ferretería EcoFerre no cuenta con herramientas analíticas para tomar decisiones basadas en datos. Su sistema de gestión de inventarios es manual y reactivo, lo que ha generado:

Rotura de stock en productos de alta demanda.

Sobreinventario en productos de bajo movimiento.

Falta de visibilidad en la rentabilidad por producto.

Decisiones empíricas sin respaldo de datos históricos ni proyecciones.

🎯 2. Objetivo del proyecto de BI
Desarrollar una solución de inteligencia de negocios (BI) que permita visualizar, analizar y optimizar el comportamiento del inventario en función del valor económico aportado por cada producto, utilizando el Modelo ABC, y complementarlo con tableros dinámicos para la toma de decisiones estratégicas.

📌 3. Objetivos específicos
Construir un modelo de clasificación ABC con base en el valor anual de consumo de los productos.

Diseñar un dashboard interactivo en Power BI o Excel con indicadores clave de inventario.

Proponer políticas de control de stock diferenciadas para cada categoría (A, B, C).

Evaluar la rotación y proponer acciones de mejora basadas en data histórica.

🔄 4. Solución de BI propuesta
🔧 Herramienta:
Power BI Desktop (o Excel con Power Query + segmentadores)

🛠️ Componentes del sistema:
Modelo de datos:

Productos (ID, nombre, categoría)

Precios unitarios

Cantidades vendidas por mes o año

Consumo anual

Clasificación ABC

Visualizaciones:

Gráfico de Pareto

KPI’s: stock disponible, productos en riesgo, % de categoría A

Mapa de calor por rotación

Tablas con filtros (por categoría, fecha, línea de productos)

Alertas visuales (productos críticos)

📁 Fuentes de datos:
Archivo Excel con 20 a 30 productos simulados (puedes crecerlo).

Registro mensual de ventas.

Stock actual por producto.

📈 5. Indicadores clave (KPI’s)
% del valor total representado por productos A.

N.º de productos sin rotación en 3 meses.

Tiempo promedio de reposición.

Margen estimado por categoría.

% de reducción de sobrestock proyectado.

🧠 6. Valor que aporta la solución
Mejora la toma de decisiones sobre compras y reposición.

Ahorra costos en almacenamiento de productos de bajo valor.

Permite priorizar el seguimiento y control de productos clave.

Sienta las bases para una futura automatización (reabastecimiento, predicción de demanda).

🔚 7. Conclusión esperada
La solución de inteligencia de negocios basada en el modelo ABC permitirá a EcoFerre transformar sus datos en decisiones inteligentes, reduciendo pérdidas y mejorando su eficiencia operativa mediante el uso de visualizaciones interactivas y análisis de inventario en tiempo real.

