use ElBuenGusto;

DELIMITER //
CREATE TRIGGER trg_actualizar_stock_venta
AFTER INSERT ON DETALLE_VENTA
FOR EACH ROW
BEGIN	
  UPDATE PRODUCTO
    SET pro_cantidad_unidades = pro_cantidad_unidades - NEW.det_cantidad_producto
  WHERE pro_codigo = NEW.pro_codigo; 
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_validar_stock
BEFORE INSERT ON DETALLE_VENTA
FOR EACH ROW
BEGIN
  DECLARE stock INT;
  
  SELECT pro_cantidad_unidades 
    INTO stock
  FROM PRODUCTO
  WHERE pro_codigo = NEW.pro_codigo;
  
  IF NEW.det_cantidad_producto > stock THEN
    SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Stock insuficiente para la venta';
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER VerificarStockMinimoProducto
AFTER UPDATE ON PRODUCTO
FOR EACH ROW
BEGIN
    IF NEW.pro_cantidad_unidades < 5 THEN
        INSERT INTO ALERTAS (mensaje, fecha)
        VALUES (CONCAT('Stock bajo para el producto: ', NEW.pro_nombre), NOW());
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER ActualizarStockProducto
AFTER INSERT ON DETALLE_VENTA
FOR EACH ROW
BEGIN
    UPDATE PRODUCTO
    SET pro_cantidad_unidades = pro_cantidad_unidades - NEW.det_cantidad_producto
    WHERE pro_codigo = NEW.pro_codigo;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER VerificarStockMinimoMateria
AFTER UPDATE ON MATERIA
FOR EACH ROW
BEGIN
    IF NEW.mat_cantidad_unidades < 10 THEN
        INSERT INTO ALERTAS (mensaje, fecha)
        VALUES (CONCAT('Stock bajo para la materia prima: ', NEW.mat_nombre), NOW());
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER RegistrarDevolucionInventario
AFTER INSERT ON DETALLE_DEVOLUCION
FOR EACH ROW
BEGIN
    IF NEW.pre_codigo IS NOT NULL THEN
        UPDATE PRODUCTO_EMPRESA_EXTERNA
        SET stock = stock + NEW.det_cantidad_producto
        WHERE pre_codigo = NEW.pre_codigo;
    ELSE
        UPDATE MATERIA
        SET mat_cantidad_unidades = mat_cantidad_unidades + NEW.det_cantidad_producto
        WHERE mat_codigo = NEW.mat_codigo;
    END IF;
END //
DELIMITER ;*/








