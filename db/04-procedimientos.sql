use ElBuenGusto ;
SET NAMES 'utf8mb4';

DELIMITER //

/* ========== PROCEDIMIENTOS PARA EL GERENTE ========== */
CREATE PROCEDURE PromocionesConMayorImpacto()
BEGIN
    SELECT 
        prm.prm_id AS Promocion,
        prm.prm_nombre AS Nombre_Promocion,
        p.pro_nombre AS Producto,
        COUNT(dv.prm_id) AS Veces_Aplicada,
        SUM(dv.det_cantidad_producto) AS Unidades_Vendidas
    FROM PROMOCION prm
    JOIN DETALLE_PROMOCION dp ON prm.prm_id = dp.prm_id
    JOIN PRODUCTO p ON dp.pro_codigo = p.pro_codigo
    LEFT JOIN DETALLE_VENTA dv ON prm.prm_id = dv.prm_id
    GROUP BY prm.prm_id, p.pro_nombre
    ORDER BY Unidades_Vendidas DESC;
END //

CREATE PROCEDURE GastosMensualesPorCategoria()
BEGIN
    SELECT 
        g.gas_tipo AS Categoria,
        SUM(pag.pag_costo) AS Total_Gasto,
        MONTH(pag.pag_fecha) AS Mes,
        YEAR(pag.pag_fecha) AS Año
    FROM PAGO_GASTO pag
    JOIN GASTO g ON pag.gas_nombre = g.gas_nombre
    GROUP BY g.gas_tipo, MONTH(pag.pag_fecha), YEAR(pag.pag_fecha)
    ORDER BY Año DESC, Mes DESC;
END //

CREATE PROCEDURE ProductividadPorEmpleado()
BEGIN
    SELECT 
        CONCAT(p.per_nombre, ' ', p.per_apellido) AS Empleado,
        COUNT(v.ven_id_venta) AS Ventas_Atendidas,
        SUM(v.ven_precio_total) AS Total_Vendido
    FROM VENTA v
    LEFT JOIN PERSONAL pl ON v.pes_documento = pl.pes_documento
    LEFT JOIN PERSONA p ON pl.pes_documento = p.per_documento
    WHERE v.ven_fecha >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
    GROUP BY pl.pes_documento
    ORDER BY Total_Vendido DESC;
END //

CREATE PROCEDURE AnalisisPuntoEquilibrio()
BEGIN
    SELECT 
        Mes,
        Año,
        Ingresos,
        Costos,
        Utilidad_Neta,
        CASE 
            WHEN Utilidad_Neta > 0 THEN 'Rentable'
            ELSE 'Pérdidas'
        END AS Estado
    FROM VISTA_COSTOS_INGRESOS;
END //

CREATE PROCEDURE CategoriasPocoRentables()
BEGIN
    SELECT * 
    FROM VISTA_RENTABILIDAD_CATEGORIA
    WHERE Margen_Total < (SELECT AVG(Margen_Total) FROM VISTA_RENTABILIDAD_CATEGORIA);
END //

CREATE PROCEDURE RotacionInventario()
BEGIN
    SELECT 
        mat_nombre AS Material,
        mat_cantidad_unidades AS Stock_Actual,
        DATEDIFF(mat_fecha_expiracion, CURDATE()) AS Dias_Para_Vencimiento,
        CASE 
            WHEN mat_cantidad_unidades > 500 THEN 'Sobrestock'
            WHEN mat_cantidad_unidades < 5 THEN 'Reabastecer Urgente'
            ELSE 'Nivel Óptimo'
        END AS Estado_Inventario
    FROM MATERIA;
END //

/* ========== PROCEDIMIENTOS PARA PANADERO/PASTELERO ========== */
CREATE PROCEDURE SolicitudesPendientesMateriaPrima()
BEGIN
    SELECT * 
    FROM SOLICITUDES_MATERIA_PRIMA 
    WHERE estado_solicitud = 'Pendiente';
END //

CREATE PROCEDURE ActualizarStock(IN codigo_material INT, IN cantidad_usada INT)
BEGIN
    UPDATE MATERIA 
    SET mat_cantidad_unidades = mat_cantidad_unidades - cantidad_usada 
    WHERE mat_codigo = codigo_material;
END //

CREATE PROCEDURE ConsultarRecetas(IN nombre_producto VARCHAR(100))
BEGIN
    SELECT producto, materia_prima, stock_disponible 
    FROM VISTA_RECETAS
    WHERE producto = nombre_producto;
END //

CREATE PROCEDURE ControlCaducidadMateriales()
BEGIN
    SELECT mat_nombre, mat_fecha_expiracion 
    FROM MATERIA 
    WHERE DATEDIFF(mat_fecha_expiracion, CURDATE()) <= 7;
END //

CREATE PROCEDURE DisponibilidadProduccion(IN nombre_producto VARCHAR(100))
BEGIN
    SELECT * FROM VISTA_DISPONIBILIDAD_PRODUCCION 
    WHERE pro_nombre = nombre_producto;
END //

CREATE PROCEDURE InventarioCritico()
BEGIN
    SELECT * FROM VISTA_INVENTARIO_CRITICO 
    WHERE tipo = 'Materia Prima';
END //

/* ========== PROCEDIMIENTOS PARA MESERO ========== */
CREATE PROCEDURE PromocionesActivasVigentes()
BEGIN
    SELECT 
        prm_nombre AS Promoción,
        prm_tipo AS Tipo,
        prm_valor AS Descuento,
        productos AS Productos_Incluidos
    FROM VISTA_PROMOCIONES_ACTIVAS;
END //

CREATE PROCEDURE ListadoCompletoProductos()
BEGIN
    SELECT 
        pro_nombre AS Producto,
        pro_precio_venta AS Precio,
        pro_cantidad_unidades AS Stock
    FROM PRODUCTO
    WHERE pro_cantidad_unidades > 0

    UNION

    SELECT 
        pre_tipo AS Producto,
        'Consultar precio' AS Precio,
        'Disponible' AS Stock
    FROM PRODUCTO_EMPRESA_EXTERNA;
END //

CREATE PROCEDURE VerificarDisponibilidadProducto(IN nombre_producto VARCHAR(100))
BEGIN
    SELECT 
        pro_nombre AS Producto,
        pro_cantidad_unidades AS Stock,
        CASE 
            WHEN pro_cantidad_unidades > 0 THEN 'Disponible'
            ELSE 'Agotado'
        END AS Estado
    FROM PRODUCTO
    WHERE pro_nombre = nombre_producto;
END //

/* ========== PROCEDIMIENTOS PARA CAJERO ========== */
CREATE PROCEDURE RegistrarVenta(
    IN precio_total INT,
    IN tipo_pago VARCHAR(50),
    IN tipo_venta VARCHAR(50),
    IN direccion VARCHAR(100),
    IN documento_cliente INT,
    IN documento_empleado INT
)
BEGIN
    INSERT INTO VENTA (
        ven_precio_total,
        ven_hora,
        ven_fecha,
        ven_tipo_pago,
        ven_tipo,
        ven_direccion,
        per_documento,
        pes_documento
    ) VALUES (
        precio_total,
        CURTIME(),
        NOW(),
        tipo_pago,
        tipo_venta,
        direccion,
        documento_cliente,
        documento_empleado
    );
END //

CREATE PROCEDURE RegistrarDetalleVenta(
    IN id_venta INT,
    IN cantidad_producto INT,
    IN codigo_producto INT,
    IN id_promocion INT
)
BEGIN
    INSERT INTO DETALLE_VENTA (
        ven_id_venta,
        det_cantidad_producto,
        pro_codigo,
        prm_id
    ) VALUES (
        id_venta,
        cantidad_producto,
        codigo_producto,
        id_promocion
    );
END //

CREATE PROCEDURE CierreCajaDiario()
BEGIN
    SELECT 
        fecha,
        ven_tipo_pago,
        SUM(ven_precio_total) AS total_dia,
        COUNT(*) AS transacciones
    FROM VISTA_VENTAS_DIARIAS
    WHERE fecha = CURDATE()
    GROUP BY ven_tipo_pago, fecha;
END //

/* ========== PROCEDIMIENTOS PARA CLIENTES ========== */
CREATE PROCEDURE ObtenerVentas(IN documento INT)
BEGIN
    SELECT 
        ven_fecha,
        ven_tipo_pago,
        productos_vendidos,
        ven_precio_total
    FROM VISTA_COMPLETO_VENTAS WHERE cliente_documento = documento;
END //

DELIMITER ;