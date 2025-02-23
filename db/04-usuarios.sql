USE ElBuenGusto ;
-- CREACION DE USUARIOS --
-- Crear usuarios
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'Gerente123';
CREATE USER 'panadero'@'localhost' IDENTIFIED BY 'Panadero123';
CREATE USER 'pastelero'@'localhost' IDENTIFIED BY 'Pastelero123';
CREATE USER 'mesero'@'localhost' IDENTIFIED BY 'Mesero123';
CREATE USER 'cajero'@'localhost' IDENTIFIED BY 'Cajero123';
CREATE USER 'cliente'@'localhost' IDENTIFIED BY 'Cliente123';

-- Revocar todos los privilegios existentes
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 
'gerente'@'localhost', 
'panadero'@'localhost', 
'pastelero'@'localhost', 
'mesero'@'localhost', 
'cajero'@'localhost', 
'cliente'@'localhost';

-- Permisos para Gerente
GRANT SELECT, INSERT, UPDATE, DELETE ON ElBuenGusto.* TO 'gerente'@'localhost';
GRANT EXECUTE, CREATE VIEW, DROP, ALTER ON ElBuenGusto.* TO 'gerente'@'localhost';

-- Permisos para Panadero
GRANT SELECT, UPDATE, DELETE ON ElBuenGusto.MATERIA_PRIMA TO 'panadero'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON ElBuenGusto.SOLICITUDES_MATERIA_PRIMA TO 'panadero'@'localhost';
GRANT SELECT ON ElBuenGusto.RECETA TO 'panadero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_INVENTARIO_CRITICO TO 'panadero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_DISPONIBILIDAD_PRODUCCION TO 'panadero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_RECETAS TO 'panadero'@'localhost';

-- Permisos para Pastelero
GRANT SELECT, UPDATE, DELETE ON ElBuenGusto.MATERIA_PRIMA TO 'pastelero'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON ElBuenGusto.SOLICITUDES_MATERIA_PRIMA TO 'pastelero'@'localhost';
GRANT SELECT ON ElBuenGusto.RECETA TO 'pastelero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_INVENTARIO_CRITICO TO 'pastelero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_DISPONIBILIDAD_PRODUCCION TO 'pastelero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_RECETAS TO 'pastelero'@'localhost';

-- Permisos para Mesero
GRANT SELECT ON ElBuenGusto.PRODUCTO TO 'mesero'@'localhost';
GRANT SELECT ON ElBuenGusto.PRODUCTO_EMPRESA_EXTERNA TO 'mesero'@'localhost';
GRANT SELECT ON ElBuenGusto.PROMOCION TO 'mesero'@'localhost';
GRANT SELECT ON ElBuenGusto.DETALLE_PROMOCION TO 'mesero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_TOP_PRODUCTOS TO 'mesero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_PROMOCIONES_ACTIVAS TO 'mesero'@'localhost';

-- Permisos para Cajero
GRANT SELECT, INSERT, UPDATE ON ElBuenGusto.VENTA TO 'cajero'@'localhost';
GRANT SELECT, INSERT, UPDATE ON ElBuenGusto.DETALLE_VENTA TO 'cajero'@'localhost';
GRANT SELECT ON ElBuenGusto.PRODUCTO TO 'cajero'@'localhost';
GRANT SELECT ON ElBuenGusto.PRODUCTO_EMPRESA_EXTERNA TO 'cajero'@'localhost';
GRANT SELECT ON ElBuenGusto.CATEGORIA TO 'cajero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_VENTAS_DIARIAS TO 'cajero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_TOP_PRODUCTOS TO 'cajero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_PROMOCIONES_ACTIVAS TO 'cajero'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_COMPLETO_VENTAS TO 'cajero'@'localhost';

-- Permisos para Cliente
GRANT SELECT ON ElBuenGusto.CLIENTE TO 'cliente'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_PROMOCIONES_ACTIVAS TO 'cliente'@'localhost';
GRANT SELECT ON ElBuenGusto.VISTA_COMPLETO_VENTAS TO 'cliente'@'localhost';

FLUSH PRIVILEGES;