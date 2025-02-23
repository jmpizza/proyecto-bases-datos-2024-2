USE ElBuenGusto;

-- VISTAS ESTRATÉGICAS --
-- 1. Vista de Inventario Crítico
CREATE VIEW VISTA_INVENTARIO_CRITICO AS
SELECT 
    m.mat_codigo AS codigo,
    m.mat_nombre AS nombre,
    m.mat_cantidad_unidades AS stock,
    m.mat_fecha_expiracion AS expiracion,
    'Materia Prima' AS tipo
FROM MATERIA m
WHERE m.mat_cantidad_unidades <= 10 OR DATEDIFF(m.mat_fecha_expiracion, CURDATE()) <= 5
UNION
SELECT 
    p.pro_codigo,
    p.pro_nombre,
    p.pro_cantidad_unidades,
    p.pro_fecha_expiracion,
    'Producto Final'
FROM PRODUCTO p
WHERE p.pro_cantidad_unidades <= 5 OR DATEDIFF(p.pro_fecha_expiracion, CURDATE()) <= 3;

-- 2. Vista Disponibilidad Producción
CREATE VIEW VISTA_DISPONIBILIDAD_PRODUCCION AS
SELECT 
    r.pro_codigo,
    p.pro_nombre,
    m.mat_nombre,
    m.mat_cantidad_unidades AS stock_disponible,
    (SELECT COUNT(*) FROM RECETA WHERE pro_codigo = r.pro_codigo) AS ingredientes_requeridos,
    CASE WHEN m.mat_cantidad_unidades >= 10 THEN 'Suficiente' ELSE 'Insuficiente' END AS estado
FROM RECETA r
JOIN MATERIA m ON r.mat_codigo = m.mat_codigo
JOIN PRODUCTO p ON r.pro_codigo = p.pro_codigo;

-- 3. Vista Ventas Diarias
CREATE VIEW VISTA_VENTAS_DIARIAS AS
SELECT 
    DATE(v.ven_fecha) AS fecha,
    v.ven_tipo_pago,
    p.pro_nombre,
    dv.det_cantidad_producto,
    v.ven_precio_total,
    CONCAT(cl.per_nombre, ' ', cl.per_apellido) AS cliente,
    CONCAT(pe.per_nombre, ' ', pe.per_apellido) AS vendedor
FROM VENTA v
JOIN DETALLE_VENTA dv ON v.ven_id_venta = dv.ven_id_venta
LEFT JOIN PRODUCTO p ON dv.pro_codigo = p.pro_codigo
JOIN CLIENTE c ON v.per_documento = c.per_documento
JOIN PERSONA cl ON c.per_documento = cl.per_documento
JOIN PERSONAL pl ON v.pes_documento = pl.pes_documento
JOIN PERSONA pe ON pl.pes_documento = pe.per_documento;

-- 4. Vista Top Productos
CREATE VIEW VISTA_TOP_PRODUCTOS AS
SELECT 
    p.pro_nombre,
    c.cat_nombre AS categoria,
    SUM(dv.det_cantidad_producto) AS total_vendido,
    SUM(dv.det_cantidad_producto * p.pro_precio_venta) AS ingresos_totales
FROM DETALLE_VENTA dv
JOIN PRODUCTO p ON dv.pro_codigo = p.pro_codigo
JOIN CATEGORIA c ON p.cat_id_categoria = c.cat_id_categoria
GROUP BY p.pro_nombre, c.cat_nombre
ORDER BY total_vendido DESC
LIMIT 10;

-- 5. Vista Margen de Beneficio
CREATE VIEW VISTA_MARGEN_BENEFICIO AS
SELECT 
    p.pro_nombre,
    p.pro_precio_venta,
    SUM(m.mat_precio_unitario * 2) AS costo_produccion,
    (p.pro_precio_venta - SUM(m.mat_precio_unitario * 2)) AS margen
FROM PRODUCTO p
JOIN RECETA r ON p.pro_codigo = r.pro_codigo
JOIN MATERIA m ON r.mat_codigo = m.mat_codigo
GROUP BY p.pro_nombre, p.pro_precio_venta;

-- 6. Vista Promociones Activas
CREATE VIEW VISTA_PROMOCIONES_ACTIVAS AS
SELECT 
    prm.prm_nombre,
    prm.prm_tipo,
    prm.prm_valor,
    GROUP_CONCAT(p.pro_nombre SEPARATOR ', ') AS productos,
    prm.prm_fecha_inicio,
    prm.prm_fecha_fin
FROM PROMOCION prm
JOIN DETALLE_PROMOCION dp ON prm.prm_id = dp.prm_id
JOIN PRODUCTO p ON dp.pro_codigo = p.pro_codigo
WHERE CURDATE() BETWEEN prm.prm_fecha_inicio AND prm.prm_fecha_fin
GROUP BY prm.prm_id;

-- 7. Vista de Costos vs. Ingresos
CREATE VIEW VISTA_COSTOS_INGRESOS AS
SELECT 
    MONTH(ven_fecha) AS Mes,
    YEAR(ven_fecha) AS Año,
    SUM(ven_precio_total) AS Ingresos,
    (SELECT SUM(pag_costo) FROM PAGO_GASTO WHERE MONTH(pag_fecha) = Mes AND YEAR(pag_fecha) = Año) AS Costos,
    (SUM(ven_precio_total) - (SELECT SUM(pag_costo) FROM PAGO_GASTO WHERE MONTH(pag_fecha) = Mes AND YEAR(pag_fecha) = Año)) AS Utilidad_Neta
FROM VENTA
GROUP BY Mes, Año;

-- 8. Vista de Rentabilidad por Categoría
CREATE VIEW VISTA_RENTABILIDAD_CATEGORIA AS
SELECT 
    c.cat_nombre AS Categoria,
    SUM(v.ven_precio_total) AS Ventas_Totales,
    SUM(vmb.costo_produccion) AS Costos_Totales,
    SUM(vmb.margen) AS Margen_Total
FROM VENTA v
JOIN DETALLE_VENTA dv ON v.ven_id_venta = dv.ven_id_venta
JOIN PRODUCTO p ON dv.pro_codigo = p.pro_codigo
JOIN VISTA_MARGEN_BENEFICIO vmb ON p.pro_nombre = vmb.pro_nombre
JOIN CATEGORIA c ON p.cat_id_categoria = c.cat_id_categoria
GROUP BY c.cat_nombre;

-- 9. Vista de Solicitudes de Materia Prima
CREATE VIEW SOLICITUDES_MATERIA_PRIMA AS
SELECT 
    m.mat_codigo AS id_solicitud,
    m.mat_nombre AS material,
    m.mat_cantidad_unidades AS stock_actual,
    m.mat_fecha_expiracion AS fecha_expiracion,
    'Pendiente' AS estado_solicitud
FROM MATERIA m
WHERE m.mat_cantidad_unidades < 15;

-- 10. Vista de Recetas Detalladas
CREATE VIEW VISTA_RECETAS AS
SELECT 
    p.pro_nombre AS producto,
    m.mat_nombre AS materia_prima,
    r.mat_codigo AS codigo_materia,
    m.mat_cantidad_unidades AS stock_disponible
FROM RECETA r
JOIN PRODUCTO p ON r.pro_codigo = p.pro_codigo
JOIN MATERIA m ON r.mat_codigo = m.mat_codigo;

-- 11. Vista Historial de Ventas
CREATE VIEW VISTA_COMPLETO_VENTAS AS
SELECT 
    v.ven_id_venta AS ID_Venta,
    v.ven_fecha AS Fecha_Hora,
    v.ven_tipo_pago AS Metodo_Pago,
    v.ven_precio_total AS Total,
    CONCAT(c.per_nombre, ' ', c.per_apellido) AS Cliente,
    CONCAT(e.per_nombre, ' ', e.per_apellido) AS Cajero,
    p.pro_nombre AS Producto,
    dv.det_cantidad_producto AS Cantidad,
    p.pro_precio_venta AS Precio_Unitario,
    prm.prm_nombre AS Promocion_Aplicada
FROM VENTA v
JOIN DETALLE_VENTA dv ON v.ven_id_venta = dv.ven_id_venta
LEFT JOIN PRODUCTO p ON dv.pro_codigo = p.pro_codigo
LEFT JOIN PROMOCION prm ON dv.prm_id = prm.prm_id
JOIN CLIENTE cl ON v.per_documento = cl.per_documento
JOIN PERSONA c ON cl.per_documento = c.per_documento
JOIN PERSONAL pl ON v.pes_documento = pl.pes_documento
JOIN PERSONA e ON pl.pes_documento = e.per_documento;