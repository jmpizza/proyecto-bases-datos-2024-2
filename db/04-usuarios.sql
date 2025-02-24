USE ElBuenGusto ;
-- CREACION DE USUARIOS --
DROP USER IF EXISTS 'cajero'@'localhost';
DROP USER IF EXISTS 'cliente'@'localhost';
DROP USER IF EXISTS 'gerente'@'localhost';
DROP USER IF EXISTS 'mesero'@'localhost';
DROP USER IF EXISTS 'panadero'@'localhost';
DROP USER IF EXISTS 'pastelero'@'localhost';

-- Crear usuarios
CREATE USER 'gerente'@'%' IDENTIFIED BY 'Gerente123';
CREATE USER 'panadero'@'%' IDENTIFIED BY 'Panadero123';
CREATE USER 'pastelero'@'%' IDENTIFIED BY 'Pastelero123';
CREATE USER 'mesero'@'%' IDENTIFIED BY 'Mesero123';
CREATE USER 'cajero'@'%' IDENTIFIED BY 'Cajero123';
CREATE USER 'cliente'@'%' IDENTIFIED BY 'Cliente123';

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

FLUSH PRIVILEGES;