USE ElBuenGusto ;
SET NAMES 'utf8mb4';
-- CREACION DE USUARIOS --
-- Crear usuarios
CREATE USER IF NOT EXISTS 'gerente'@'%' IDENTIFIED BY 'Gerente123';
CREATE USER IF NOT EXISTS 'panadero'@'%' IDENTIFIED BY 'Panadero123';
CREATE USER IF NOT EXISTS 'pastelero'@'%' IDENTIFIED BY 'Pastelero123';
CREATE USER IF NOT EXISTS 'mesero'@'%' IDENTIFIED BY 'Mesero123';
CREATE USER IF NOT EXISTS 'cajero'@'%' IDENTIFIED BY 'Cajero123';
CREATE USER IF NOT EXISTS 'cliente'@'%' IDENTIFIED BY 'Cliente123';

-- Revocar todos los privilegios existentes
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 
'gerente'@'%', 
'panadero'@'%', 
'pastelero'@'%', 
'mesero'@'%', 
'cajero'@'%', 
'cliente'@'%';

-- Permisos para Gerente
GRANT SELECT, INSERT, UPDATE, DELETE ON ElBuenGusto.* TO 'gerente'@'%';
GRANT EXECUTE, CREATE VIEW, DROP, ALTER ON ElBuenGusto.* TO 'gerente'@'%';

-- Permisos para Panadero
GRANT SELECT, UPDATE, DELETE ON ElBuenGusto.MATERIA_PRIMA TO 'panadero'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON ElBuenGusto.SOLICITUDES_MATERIA_PRIMA TO 'panadero'@'%';
GRANT SELECT ON ElBuenGusto.RECETA TO 'panadero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_INVENTARIO_CRITICO TO 'panadero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_DISPONIBILIDAD_PRODUCCION TO 'panadero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_RECETAS TO 'panadero'@'%';

-- Permisos para Pastelero
GRANT SELECT, UPDATE, DELETE ON ElBuenGusto.MATERIA_PRIMA TO 'pastelero'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON ElBuenGusto.SOLICITUDES_MATERIA_PRIMA TO 'pastelero'@'%';
GRANT SELECT ON ElBuenGusto.RECETA TO 'pastelero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_INVENTARIO_CRITICO TO 'pastelero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_DISPONIBILIDAD_PRODUCCION TO 'pastelero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_RECETAS TO 'pastelero'@'%';

-- Permisos para Mesero
GRANT SELECT ON ElBuenGusto.PRODUCTO TO 'mesero'@'%';
GRANT SELECT ON ElBuenGusto.PRODUCTO_EMPRESA_EXTERNA TO 'mesero'@'%';
GRANT SELECT ON ElBuenGusto.PROMOCION TO 'mesero'@'%';
GRANT SELECT ON ElBuenGusto.DETALLE_PROMOCION TO 'mesero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_TOP_PRODUCTOS TO 'mesero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_PROMOCIONES_ACTIVAS TO 'mesero'@'%';

-- Permisos para Cajero
GRANT SELECT, INSERT, UPDATE ON ElBuenGusto.VENTA TO 'cajero'@'%';
GRANT SELECT, INSERT, UPDATE ON ElBuenGusto.DETALLE_VENTA TO 'cajero'@'%';
GRANT SELECT ON ElBuenGusto.PRODUCTO TO 'cajero'@'%';
GRANT SELECT ON ElBuenGusto.PRODUCTO_EMPRESA_EXTERNA TO 'cajero'@'%';
GRANT SELECT ON ElBuenGusto.CATEGORIA TO 'cajero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_VENTAS_DIARIAS TO 'cajero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_TOP_PRODUCTOS TO 'cajero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_PROMOCIONES_ACTIVAS TO 'cajero'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_COMPLETO_VENTAS TO 'cajero'@'%';

-- Permisos para Cliente
GRANT SELECT ON ElBuenGusto.CLIENTE TO 'cliente'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_PROMOCIONES_ACTIVAS TO 'cliente'@'%';
GRANT SELECT ON ElBuenGusto.VISTA_COMPLETO_VENTAS TO 'cliente'@'%';
/*
	Permisos sobre los procedimientos
*/
-- Permisos para Panadero
GRANT EXECUTE ON PROCEDURE ElBuenGusto.SolicitudesPendientesMateriaPrima TO 'panadero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ActualizarStock TO 'panadero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ConsultarRecetas TO 'panadero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ControlCaducidadMateriales TO 'panadero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.DisponibilidadProduccion TO 'panadero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.InventarioCritico TO 'panadero'@'%';

-- Permisos para Pastelero
GRANT EXECUTE ON PROCEDURE ElBuenGusto.SolicitudesPendientesMateriaPrima TO 'pastelero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ActualizarStock TO 'pastelero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ConsultarRecetas TO 'pastelero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ControlCaducidadMateriales TO 'pastelero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.DisponibilidadProduccion TO 'pastelero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.InventarioCritico TO 'pastelero'@'%';

-- Permisos para Mesero
GRANT EXECUTE ON PROCEDURE ElBuenGusto.PromocionesActivasVigentes TO 'mesero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ListadoCompletoProductos TO 'mesero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.VerificarDisponibilidadProducto TO 'mesero'@'%';

-- Permisos para Cajero
GRANT EXECUTE ON PROCEDURE ElBuenGusto.RegistrarVenta TO 'cajero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.RegistrarDetalleVenta TO 'cajero'@'%';
GRANT EXECUTE ON PROCEDURE ElBuenGusto.CierreCajaDiario TO 'cajero'@'%';

-- Permisos para Cliente
GRANT EXECUTE ON PROCEDURE ElBuenGusto.ObtenerVentas TO 'cliente'@'%';