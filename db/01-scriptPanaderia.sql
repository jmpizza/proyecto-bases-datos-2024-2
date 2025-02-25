DROP SCHEMA IF EXISTS ElBuenGusto;
SET NAMES 'utf8mb4';

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ElBuenGusto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ElBuenGusto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS ElBuenGusto DEFAULT CHARACTER SET utf8 ;
USE ElBuenGusto ;

-- -----------------------------------------------------
-- Table `ElBuenGusto`.`EMPRESA_EXTERNA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`EMPRESA_EXTERNA` (
  `emp_nit` INT NOT NULL,
  `emp_nombre` VARCHAR(75) NOT NULL,
  `emp_correo_electronico` VARCHAR(45) NOT NULL,
  `emp_telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`emp_nit`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`PERSONA` (
  `per_documento` INT NOT NULL,
  `per_nombre` VARCHAR(45) NOT NULL,
  `per_apellido` VARCHAR(45) NOT NULL,
  `per_correo_electronico` VARCHAR(45) NULL,
  PRIMARY KEY (`per_documento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`GERENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`GERENTE` (
  `ger_fecha_ingreso` DATE NOT NULL,
  `ger_fecha_salida` DATE NULL,
  `ger_dias_trabajados` INT NOT NULL,
  `ger_documento` INT NOT NULL,
  INDEX `fk_GERENTE_PERSONA1_idx` (`ger_documento` ASC) VISIBLE,
  PRIMARY KEY (`ger_documento`),
  CONSTRAINT `fk_GERENTE_PERSONA1`
    FOREIGN KEY (`ger_documento`)
    REFERENCES `ElBuenGusto`.`PERSONA` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`PROVEEDOR` (
  `emp_nit` INT NOT NULL,
  `per_documento` INT NOT NULL,
  `ger_documento` INT NOT NULL,
  INDEX `fk_PROVEDOR_EMPRESA_EXTERNA1_idx` (`emp_nit` ASC) VISIBLE,
  INDEX `fk_PROVEDOR_PERSONA1_idx` (`per_documento` ASC) VISIBLE,
  PRIMARY KEY (`per_documento`),
  INDEX `fk_PROVEDOR_GERENTE1_idx` (`ger_documento` ASC) VISIBLE,
  CONSTRAINT `fk_PROVEDOR_EMPRESA_EXTERNA1`
    FOREIGN KEY (`emp_nit`)
    REFERENCES `ElBuenGusto`.`EMPRESA_EXTERNA` (`emp_nit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEDOR_PERSONA1`
    FOREIGN KEY (`per_documento`)
    REFERENCES `ElBuenGusto`.`PERSONA` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEDOR_GERENTE1`
    FOREIGN KEY (`ger_documento`)
    REFERENCES `ElBuenGusto`.`GERENTE` (`ger_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`MATERIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`MATERIA` (
  `mat_codigo` INT NOT NULL,
  `mat_nombre` VARCHAR(45) NOT NULL,
  `mat_precio_unitario` INT NOT NULL,
  `mat_cantidad_unidades` INT NOT NULL,
  `mat_fecha_llegada` DATE NOT NULL,
  `mat_fecha_expiracion` DATE NOT NULL,
  `per_documento` INT NOT NULL,
  INDEX `fk_MATERIA_PROVEDOR1_idx` (`per_documento` ASC) VISIBLE,
  PRIMARY KEY (`mat_codigo`),
  CONSTRAINT `fk_MATERIA_PROVEDOR1`
    FOREIGN KEY (`per_documento`)
    REFERENCES `ElBuenGusto`.`PROVEEDOR` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`MATERIA_PRIMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`MATERIA_PRIMA` (
  `mat_codigo` INT NOT NULL,
  `mat_categoria` VARCHAR(45) NOT NULL,
  INDEX `fk_MATERIA_PRIMA_MATERIA1_idx` (`mat_codigo` ASC) VISIBLE,
  PRIMARY KEY (`mat_codigo`),
  CONSTRAINT `fk_MATERIA_PRIMA_MATERIA1`
    FOREIGN KEY (`mat_codigo`)
    REFERENCES `ElBuenGusto`.`MATERIA` (`mat_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`CATEGORIA` (
  `cat_id_categoria` INT NOT NULL,
  `cat_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`PRODUCTO` (
  `pro_codigo` INT NOT NULL,
  `pro_nombre` VARCHAR(45) NOT NULL,
  `pro_precio_venta` INT NOT NULL,
  `pro_fecha_fabricacion` DATE NOT NULL,
  `pro_fecha_expiracion` DATE NOT NULL,
  `pro_cantidad_unidades` INT NOT NULL,
  `cat_id_categoria` INT NOT NULL,
  PRIMARY KEY (`pro_codigo`),
  INDEX `fk_PRODUCTO_CATEGORIA_idx` (`cat_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUCTO_CATEGORIA`
    FOREIGN KEY (`cat_id_categoria`)
    REFERENCES `ElBuenGusto`.`CATEGORIA` (`cat_id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`CLIENTE` (
  `per_documento` INT NOT NULL,
  INDEX `fk_CLIENTE_PERSONA2_idx` (`per_documento` ASC) VISIBLE,
  PRIMARY KEY (`per_documento`),
  CONSTRAINT `fk_CLIENTE_PERSONA2`
    FOREIGN KEY (`per_documento`)
    REFERENCES `ElBuenGusto`.`PERSONA` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`CARGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`CARGO` (
  `car_tipo` VARCHAR(10) NOT NULL,
  `car_salario` INT NOT NULL,
  PRIMARY KEY (`car_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`HORARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`HORARIO` (
  `hor_id` INT NOT NULL,
  `hor_entrada` TIME NOT NULL,
  `hor_salida` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`PERSONAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`PERSONAL` (
  `pes_fecha_ingreso` DATE NOT NULL,
  `pes_fecha_salida` DATE NULL,
  `pes_dias_trabajados` INT NOT NULL,
  `car_tipo` VARCHAR(10) NOT NULL,
  `pes_documento` INT NOT NULL,
  `hor_id` INT NOT NULL,
  INDEX `fk_EMPLEADO_TIPO_EMPLEADO1_idx` (`car_tipo` ASC) VISIBLE,
  INDEX `fk_PERSONAL_PERSONA1_idx` (`pes_documento` ASC) VISIBLE,
  INDEX `fk_PERSONAL_HORARIO1_idx` (`hor_id` ASC) VISIBLE,
  PRIMARY KEY (`pes_documento`),
  CONSTRAINT `fk_EMPLEADO_TIPO_EMPLEADO1`
    FOREIGN KEY (`car_tipo`)
    REFERENCES `ElBuenGusto`.`CARGO` (`car_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_PERSONA1`
    FOREIGN KEY (`pes_documento`)
    REFERENCES `ElBuenGusto`.`PERSONA` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_HORARIO1`
    FOREIGN KEY (`hor_id`)
    REFERENCES `ElBuenGusto`.`HORARIO` (`hor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`VENTA` (
  `ven_id_venta` INT NOT NULL AUTO_INCREMENT,
  `ven_precio_total` INT NOT NULL,
  `ven_hora` TIME NOT NULL,
  `ven_fecha` DATETIME NOT NULL,
  `ven_tipo_pago` VARCHAR(20) NOT NULL DEFAULT 'efectivo',
  `ven_tipo` VARCHAR(45) NOT NULL,
  `ven_direccion` VARCHAR(45) NOT NULL,
  `per_documento` INT NOT NULL,
  `pes_documento` INT NOT NULL,
  PRIMARY KEY (`ven_id_venta`),
  INDEX `fk_VENTA_CLIENTE1_idx` (`per_documento` ASC) VISIBLE,
  INDEX `fk_VENTA_PERSONAL1_idx` (`pes_documento` ASC) VISIBLE,
  CONSTRAINT `fk_VENTA_CLIENTE1`
    FOREIGN KEY (`per_documento`)
    REFERENCES `ElBuenGusto`.`CLIENTE` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_PERSONAL1`
    FOREIGN KEY (`pes_documento`)
    REFERENCES `ElBuenGusto`.`PERSONAL` (`pes_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`PROMOCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`PROMOCION` (
  `prm_id` INT NOT NULL AUTO_INCREMENT,
  `prm_nombre` VARCHAR(100) NOT NULL,
  `prm_condicion` VARCHAR(45) NULL,
  `prm_tipo` VARCHAR(45) NOT NULL,
  `prm_valor` FLOAT NOT NULL,
  `prm_fecha_inicio` DATE NOT NULL,
  `prm_fecha_fin` DATE NOT NULL,
  PRIMARY KEY (`prm_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`PRODUCTO_EMPRESA_EXTERNA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`PRODUCTO_EMPRESA_EXTERNA` (
  `pre_codigo` INT NOT NULL,
  `pre_tipo` VARCHAR(45) NOT NULL,
  INDEX `fk_PRODUCTO_EMPRESA_EXTERNA_MATERIA1_idx` (`pre_codigo` ASC) VISIBLE,
  PRIMARY KEY (`pre_codigo`),
  CONSTRAINT `fk_PRODUCTO_EMPRESA_EXTERNA_MATERIA1`
    FOREIGN KEY (`pre_codigo`)
    REFERENCES `ElBuenGusto`.`MATERIA` (`mat_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`DETALLE_VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`DETALLE_VENTA` (
  `ven_id_venta` INT NOT NULL,
  `det_cantidad_producto` INT NOT NULL,
  `pro_codigo` INT NULL,
  `prm_id` INT NULL,
  `pre_codigo` INT NULL,
  INDEX `fk_VENTA_has_PRODUCTO_PRODUCTO1_idx` (`pro_codigo` ASC) VISIBLE,
  INDEX `fk_VENTA_has_PRODUCTO_VENTA1_idx` (`ven_id_venta` ASC) VISIBLE,
  INDEX `fk_DETALLE_VENTA_PROMOCIONES1_idx` (`prm_id` ASC) VISIBLE,
  INDEX `fk_DETALLE_VENTA_PRODUCTO_EMPRESA_EXTERNA1_idx` (`pre_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_VENTA_has_PRODUCTO_VENTA1`
    FOREIGN KEY (`ven_id_venta`)
    REFERENCES `ElBuenGusto`.`VENTA` (`ven_id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_has_PRODUCTO_PRODUCTO1`
    FOREIGN KEY (`pro_codigo`)
    REFERENCES `ElBuenGusto`.`PRODUCTO` (`pro_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_VENTA_PROMOCIONES1`
    FOREIGN KEY (`prm_id`)
    REFERENCES `ElBuenGusto`.`PROMOCION` (`prm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_VENTA_PRODUCTO_EMPRESA_EXTERNA1`
    FOREIGN KEY (`pre_codigo`)
    REFERENCES `ElBuenGusto`.`PRODUCTO_EMPRESA_EXTERNA` (`pre_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`TELEFONO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`TELEFONO` (
  `tel_telefono` VARCHAR(15) NOT NULL,
  `tel_tipo` VARCHAR(12) NOT NULL,
  `per_documento` INT NOT NULL,
  PRIMARY KEY (`tel_telefono`),
  INDEX `fk_TELEFONO_PERSONA1_idx` (`per_documento` ASC) VISIBLE,
  CONSTRAINT `fk_TELEFONO_PERSONA1`
    FOREIGN KEY (`per_documento`)
    REFERENCES `ElBuenGusto`.`PERSONA` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`GASTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`GASTO` (
  `gas_nombre` VARCHAR(45) NOT NULL,
  `gas_tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gas_nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`PAGO_GASTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`PAGO_GASTO` (
  `pag_fecha` DATE NOT NULL,
  `pag_costo` INT NOT NULL,
  `gas_nombre` VARCHAR(45) NOT NULL,
  `ger_documento` INT NOT NULL,
  INDEX `fk_GERENTE_has_SERVICIO_SERVICIO1_idx` (`gas_nombre` ASC) VISIBLE,
  INDEX `fk_PAGO_GASTO_GERENTE1_idx` (`ger_documento` ASC) VISIBLE,
  CONSTRAINT `fk_GERENTE_has_SERVICIO_SERVICIO1`
    FOREIGN KEY (`gas_nombre`)
    REFERENCES `ElBuenGusto`.`GASTO` (`gas_nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PAGO_GASTO_GERENTE1`
    FOREIGN KEY (`ger_documento`)
    REFERENCES `ElBuenGusto`.`GERENTE` (`ger_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`DETALLE_PROMOCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`DETALLE_PROMOCION` (
  `prm_id` INT NOT NULL,
  `pro_codigo` INT NOT NULL,
  INDEX `fk_PROMOCIONES_has_PRODUCTO_PRODUCTO1_idx` (`pro_codigo` ASC) VISIBLE,
  INDEX `fk_PROMOCIONES_has_PRODUCTO_PROMOCIONES1_idx` (`prm_id` ASC) VISIBLE,
  PRIMARY KEY (`prm_id`, `pro_codigo`),
  CONSTRAINT `fk_PROMOCIONES_has_PRODUCTO_PROMOCIONES1`
    FOREIGN KEY (`prm_id`)
    REFERENCES `ElBuenGusto`.`PROMOCION` (`prm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROMOCIONES_has_PRODUCTO_PRODUCTO1`
    FOREIGN KEY (`pro_codigo`)
    REFERENCES `ElBuenGusto`.`PRODUCTO` (`pro_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`RECETA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`RECETA` (
  `pro_codigo` INT NOT NULL,
  `mat_codigo` INT NOT NULL,
  PRIMARY KEY (`pro_codigo`, `mat_codigo`),
  INDEX `fk_PRODUCTO_has_MATERIA_PRIMA_MATERIA_PRIMA1_idx` (`mat_codigo` ASC) VISIBLE,
  INDEX `fk_PRODUCTO_has_MATERIA_PRIMA_PRODUCTO1_idx` (`pro_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUCTO_has_MATERIA_PRIMA_PRODUCTO1`
    FOREIGN KEY (`pro_codigo`)
    REFERENCES `ElBuenGusto`.`PRODUCTO` (`pro_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_has_MATERIA_PRIMA_MATERIA_PRIMA1`
    FOREIGN KEY (`mat_codigo`)
    REFERENCES `ElBuenGusto`.`MATERIA_PRIMA` (`mat_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`DEVOLUCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`DEVOLUCION` (
  `dev_id` INT NOT NULL,
  `dev_fecha` DATE NOT NULL,
  `dev_estado` VARCHAR(10) NOT NULL,
  `per_documento` INT NOT NULL,
  `ger_documento` INT NOT NULL,
  PRIMARY KEY (`dev_id`),
  INDEX `fk_DEVOLUCIONES_PROVEDOR1_idx` (`per_documento` ASC) VISIBLE,
  INDEX `fk_DEVOLUCIONES_GERENTE1_idx` (`ger_documento` ASC) VISIBLE,
  CONSTRAINT `fk_DEVOLUCIONES_PROVEDOR1`
    FOREIGN KEY (`per_documento`)
    REFERENCES `ElBuenGusto`.`PROVEEDOR` (`per_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DEVOLUCIONES_GERENTE1`
    FOREIGN KEY (`ger_documento`)
    REFERENCES `ElBuenGusto`.`GERENTE` (`ger_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElBuenGusto`.`DETALLE_DEVOLUCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElBuenGusto`.`DETALLE_DEVOLUCION` (
  `det_cantidad_producto` INT NOT NULL,
  `dev_id` INT NOT NULL,
  `pre_codigo` INT NULL,
  `mat_codigo` INT NULL,
  INDEX `fk_DETALLE_DEVOLUCION_DEVOLUCIONES1_idx` (`dev_id` ASC) VISIBLE,
  INDEX `fk_DETALLE_DEVOLUCION_PRODUCTO_EMPRESA_EXTERNA1_idx` (`pre_codigo` ASC) VISIBLE,
  INDEX `fk_DETALLE_DEVOLUCION_MATERIA_PRIMA1_idx` (`mat_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_DETALLE_DEVOLUCION_DEVOLUCIONES1`
    FOREIGN KEY (`dev_id`)
    REFERENCES `ElBuenGusto`.`DEVOLUCION` (`dev_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_DEVOLUCION_PRODUCTO_EMPRESA_EXTERNA1`
    FOREIGN KEY (`pre_codigo`)
    REFERENCES `ElBuenGusto`.`PRODUCTO_EMPRESA_EXTERNA` (`pre_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_DEVOLUCION_MATERIA_PRIMA1`
    FOREIGN KEY (`mat_codigo`)
    REFERENCES `ElBuenGusto`.`MATERIA_PRIMA` (`mat_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
