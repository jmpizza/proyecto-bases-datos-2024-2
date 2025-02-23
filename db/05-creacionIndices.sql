use elbuengusto;
-- Filtrar busquedas por nombre de un producto
create index idx_nombre on elbuengusto.PRODUCTO(pro_nombre);
select * from producto where pro_nombre like "Croissants";

-- Filtrar busquedas por categoria de un poroducto
create index idx_categoria on elbuengusto.PRODUCTO(cat_id_categoria);
select * from producto where cat_id_categoria = 4;

-- Mejorar reportes relacionados al poco inventario
create index idx_stock on producto(pro_cantidad_unidades);
select * from producto where pro_cantidad_unidades < 40;

-- Acelerar consulta de ventas por fecha
create index idx_fecha on venta(ven_fecha);
select sum(ven_precio_total) from venta where ven_fecha like '2025-02-14%';

-- Optimizar relaciones entre tablas producto y venta
-- ejemplo de cuantos productos se han vendido de cada producto en un dia particular
create index idx_producto_id on venta(ven_id_venta);
select p.pro_nombre, sum(d.det_cantidad_producto) from venta v join detalle_venta d on v.ven_id_venta=d.ven_id_venta join producto p on p.pro_codigo=d.pro_codigo group by p.pro_codigo;
select p.pro_nombre, v.ven_fecha ,sum(d.det_cantidad_producto) from venta v join detalle_venta d on v.ven_id_venta=d.ven_id_venta join producto p on p.pro_codigo=d.pro_codigo group by p.pro_codigo, v.ven_fecha having v.ven_fecha like '2025-02-14%';

-- Indice compuesto con fecha y documento para hallar ventas por ciertas horas del dia en ciertos fechas
-- hora mas productiva en navidad para saber a que hora hay que aumentar los meseros.
create index idx_fecha_producto on venta(ven_fecha,ven_hora);
select * from venta where ven_fecha like '2025-02-14%' and ven_hora between "10:00:00" and "20:00:00";

-- Optimizar busquedas relacionados a meseros con cierto horario
create index idx_rol_turno on personal(car_tipo,hor_id);
select * from personal where car_tipo = "Mesero" and hor_id = 1;

-- Ooptimizar busquedas entre clientes, telefono y personal
create index idx_telefono on telefono(tel_telefono);
create index idx_per_documento on persona(per_documento);
select * from cliente join persona on cliente.per_documento = persona.per_documento join telefono on persona.per_documento = telefono.per_documento;

-- Optimizar la busqueda del estado de devoluciones
create index idx_estado_devolucion on devolucion(dev_estado);
select dd.dev_id, d.dev_fecha, d.dev_estado from devolucion d join detalle_devolucion dd on d.dev_id = dd.dev_id where d.dev_estado = "pendiente";

select * from venta;

-- Optimizar busqueda de dirreciones para saber el alcance de la poblacion objetivo
create index idx_direccion on venta(ven_direccion);
select ven_direccion,count(ven_direccion) from venta group by ven_direccion;
