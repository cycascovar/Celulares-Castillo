/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : chdesarrollo

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-05-28 13:21:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrador_movimiento
-- ----------------------------
DROP TABLE IF EXISTS `administrador_movimiento`;
CREATE TABLE `administrador_movimiento` (
  `id_movimiento` int(10) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(40) DEFAULT NULL,
  `movimiento` varchar(220) NOT NULL,
  `fecha` date DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `sucursal` varchar(30) DEFAULT NULL,
  `hostname` varchar(30) DEFAULT NULL,
  `userpc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version` (
  `idversion` int(10) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  `menor` float DEFAULT NULL,
  `aplicacion` varchar(30) DEFAULT NULL,
  `mayor` float DEFAULT NULL,
  PRIMARY KEY (`idversion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `domicilio` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sucursal` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idventa` int(10) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `FK_idVenta_cliente_idx` (`idventa`) USING BTREE,
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `venta_detalle` (`idventa_detalle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for cliente_garantia
-- ----------------------------
DROP TABLE IF EXISTS `cliente_garantia`;
CREATE TABLE `cliente_garantia` (
  `idCliente_garantia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono_contacto` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idequipo_garantia` int(11) DEFAULT NULL,
  `tipo` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idCliente_garantia`),
  KEY `idequipo_garantia_idx` (`idequipo_garantia`) USING BTREE,
  CONSTRAINT `cliente_garantia_ibfk_1` FOREIGN KEY (`idequipo_garantia`) REFERENCES `equipo_garantia` (`idequipo_garantia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Datos con clientes que metieron sus celulares a garantia';

-- ----------------------------
-- Table structure for cliente_reparacion
-- ----------------------------
DROP TABLE IF EXISTS `cliente_reparacion`;
CREATE TABLE `cliente_reparacion` (
  `idCliente_reparacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono_contacto` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idequipo_reparacion` int(11) DEFAULT NULL,
  `tipo` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idCliente_reparacion`),
  KEY `idequipo_reparacion_idx` (`idequipo_reparacion`) USING BTREE,
  CONSTRAINT `cliente_reparacion_ibfk_1` FOREIGN KEY (`idequipo_reparacion`) REFERENCES `equipo_reparacion` (`idequipo_reparacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='clientes con equipos en reparacion';

-- ----------------------------
-- Table structure for codigo_recarga
-- ----------------------------
DROP TABLE IF EXISTS `codigo_recarga`;
CREATE TABLE `codigo_recarga` (
  `idcodigo_recarga` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_recarga` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `celular` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sucursal` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idcodigo_recarga`)
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for c_clientes_gr
-- ----------------------------
DROP TABLE IF EXISTS `c_clientes_gr`;
CREATE TABLE `c_clientes_gr` (
  `sucursal` varchar(100) DEFAULT NULL,
  `titular` varchar(50) DEFAULT NULL,
  `imei` varchar(30) DEFAULT NULL,
  `iccid` varchar(40) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `accesorios` varchar(180) DEFAULT NULL,
  `tipo` varchar(60) DEFAULT NULL,
  `id_gr` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_gr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `empleado` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `password` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idsucursal` int(11) DEFAULT NULL,
  `idnivel` int(10) DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `FK_U_SUC_idx` (`idsucursal`) USING BTREE,
  KEY `idnivel_ibfk_2` (`idnivel`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idnivel_ibfk_2` FOREIGN KEY (`idnivel`) REFERENCES `nivel_usuario` (`idnivel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for empleado_movimiento
-- ----------------------------
DROP TABLE IF EXISTS `empleado_movimiento`;
CREATE TABLE `empleado_movimiento` (
  `idempleado_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `movimiento` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `movimiento_detalles` varchar(220) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sucursal` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `empleado` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `host` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `userpc` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ip` varchar(35) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idempleado_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=2100 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for equipo_almacen
-- ----------------------------
DROP TABLE IF EXISTS `equipo_almacen`;
CREATE TABLE `equipo_almacen` (
  `idequipo_almacen` int(11) NOT NULL AUTO_INCREMENT,
  `modelo_celular` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `imei_celular` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_equipo` int(10) unsigned zerofill DEFAULT '0000000000',
  `iccid_celular` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idsucursal` int(11) DEFAULT NULL,
  `precioCelular` decimal(10,0) NOT NULL,
  `marca_celular` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `numero_celular` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idequipo_almacen`),
  KEY `idsucursal_idx` (`idsucursal`) USING BTREE,
  CONSTRAINT `equipo_almacen_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for equipo_entregado
-- ----------------------------
DROP TABLE IF EXISTS `equipo_entregado`;
CREATE TABLE `equipo_entregado` (
  `idequipo_entregado` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_entrega` date DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `empleado` varchar(45) DEFAULT NULL,
  `imei_equipo` varchar(45) DEFAULT NULL,
  `iccid_equipo` varchar(45) DEFAULT NULL,
  `sucursal` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idequipo_entregado`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for equipo_garantia
-- ----------------------------
DROP TABLE IF EXISTS `equipo_garantia`;
CREATE TABLE `equipo_garantia` (
  `idequipo_garantia` int(11) NOT NULL AUTO_INCREMENT,
  `idequipo` int(10) unsigned zerofill DEFAULT '0000000000',
  `marca_equipo` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `imei_equipo` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `accesorios` varchar(150) COLLATE latin1_spanish_ci DEFAULT 'ninguno',
  `fecha` date DEFAULT NULL,
  `iccid_equipo` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `observaciones` varchar(100) COLLATE latin1_spanish_ci DEFAULT 'ninguna',
  `modelo_equipo` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idsucursal` int(11) DEFAULT NULL,
  `mes` int(3) DEFAULT NULL,
  PRIMARY KEY (`idequipo_garantia`),
  KEY `idempleado_idx` (`idempleado`) USING BTREE,
  KEY `id_empleado_idx` (`idempleado`) USING BTREE,
  KEY `id_sucursal_idx` (`idsucursal`) USING BTREE,
  KEY `id__sucursal_idx` (`idsucursal`) USING BTREE,
  CONSTRAINT `equipo_garantia_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equipo_garantia_ibfk_2` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for equipo_reparacion
-- ----------------------------
DROP TABLE IF EXISTS `equipo_reparacion`;
CREATE TABLE `equipo_reparacion` (
  `idequipo_reparacion` int(11) NOT NULL AUTO_INCREMENT,
  `idequipo` int(11) unsigned DEFAULT '0',
  `marca_equipo` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `imei_equipo` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `modelo_equipo` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` varchar(145) COLLATE latin1_spanish_ci DEFAULT 'ninguna',
  `fecha_entrega` date DEFAULT NULL,
  `idsucursal` int(11) DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `mes` int(10) DEFAULT NULL,
  PRIMARY KEY (`idequipo_reparacion`),
  KEY `FK_SUC_REP_idx` (`idsucursal`) USING BTREE,
  KEY `fk_idempleado_idx` (`idempleado`) USING BTREE,
  CONSTRAINT `equipo_reparacion_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equipo_reparacion_ibfk_2` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for municipio
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for nivel_usuario
-- ----------------------------
DROP TABLE IF EXISTS `nivel_usuario`;
CREATE TABLE `nivel_usuario` (
  `idnivel` int(10) NOT NULL AUTO_INCREMENT,
  `nivel` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idnivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for permiso_usuario
-- ----------------------------
DROP TABLE IF EXISTS `permiso_usuario`;
CREATE TABLE `permiso_usuario` (
  `idpermiso_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `permiso_usuariocol` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idpermiso_usuario`),
  KEY `FK_Permiso_empleado_idx` (`idempleado`) USING BTREE,
  CONSTRAINT `permiso_usuario_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Ésta tabla contiene los permisos que tiene cada usuario\n{tambien se debe de agregar los permisos a la tabla de usuarios}';

-- ----------------------------
-- Table structure for recarga
-- ----------------------------
DROP TABLE IF EXISTS `recarga`;
CREATE TABLE `recarga` (
  `idrecarga` int(11) NOT NULL AUTO_INCREMENT,
  `idcodigo_recarga` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrecarga`),
  KEY `id_idx` (`idcodigo_recarga`) USING BTREE,
  CONSTRAINT `recarga_ibfk_1` FOREIGN KEY (`idcodigo_recarga`) REFERENCES `codigo_recarga` (`idcodigo_recarga`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for sucursal
-- ----------------------------
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `sucursal` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idmunicipio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsucursal`),
  KEY `idmunicipio_idx` (`idmunicipio`) USING BTREE,
  CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`idmunicipio`) REFERENCES `municipio` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for t_test_triggers
-- ----------------------------
DROP TABLE IF EXISTS `t_test_triggers`;
CREATE TABLE `t_test_triggers` (
  `campo1` varchar(200) DEFAULT NULL,
  `idtrigger` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idtrigger`)
) ENGINE=InnoDB AUTO_INCREMENT=3536 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for t_test_triggers_2
-- ----------------------------
DROP TABLE IF EXISTS `t_test_triggers_2`;
CREATE TABLE `t_test_triggers_2` (
  `campo1` varchar(200) DEFAULT NULL,
  `idtrigger` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idtrigger`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for venta_detalle
-- ----------------------------
DROP TABLE IF EXISTS `venta_detalle`;
CREATE TABLE `venta_detalle` (
  `idventa_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `idequipo_almacen` int(11) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `modelo_celular` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `marca_celular` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `imei_celular` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `empleado` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `sucursal` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `iccid_celular` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `mes` int(10) DEFAULT NULL,
  PRIMARY KEY (`idventa_detalle`),
  KEY `FK_EAlmacen_idx` (`idequipo_almacen`) USING BTREE,
  CONSTRAINT `venta_detalle_ibfk_1` FOREIGN KEY (`idequipo_almacen`) REFERENCES `equipo_almacen` (`idequipo_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='/*Falta agregar los idempleado y idequipo_almacen*/';

-- ----------------------------
-- View structure for c_clientes_garantia
-- ----------------------------
DROP VIEW IF EXISTS `c_clientes_garantia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `c_clientes_garantia` AS (
	SELECT nombre_cliente, telefono_contacto, marca_equipo, modelo_equipo, imei_equipo, accesorios, observaciones, fecha, sucursal
	FROM cliente_garantia
	JOIN equipo_garantia ON equipo_garantia.idequipo_garantia = cliente_garantia.idequipo_Garantia
	JOIN sucursal ON equipo_garantia.idsucursal = sucursal.idsucursal
	JOIN empleado ON equipo_garantia.idempleado = empleado.idempleado
) ;

-- ----------------------------
-- View structure for c_clientes_reparacion
-- ----------------------------
DROP VIEW IF EXISTS `c_clientes_reparacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `c_clientes_reparacion` AS (
	SELECT nombre_cliente, telefono_contacto, marca_equipo, modelo_equipo, imei_equipo, observaciones, fecha, sucursal
	FROM cliente_reparacion
	JOIN equipo_reparacion ON equipo_reparacion.idequipo_reparacion = cliente_reparacion.idequipo_reparacion
	JOIN sucursal ON equipo_reparacion.idsucursal = sucursal.idsucursal
	JOIN empleado ON equipo_reparacion.idempleado = empleado.idempleado
) ;

-- ----------------------------
-- View structure for c_clientes_ventas
-- ----------------------------
DROP VIEW IF EXISTS `c_clientes_ventas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `c_clientes_ventas` AS (
	SELECT idcliente as cliente, nombre, domicilio, telefono, modelo_celular, imei_celular, marca_celular, iccid_celular, venta_detalle.sucursal as sucursal
	FROM cliente
	JOIN venta_detalle ON venta_detalle.idventa_detalle = cliente.idventa
) ;

-- ----------------------------
-- View structure for c_empleados
-- ----------------------------
DROP VIEW IF EXISTS `c_empleados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `c_empleados` AS (
	SELECT empleado AS Usuario, Sucursal,idNivel as id
	FROM empleado 
	JOIN sucursal ON sucursal.idsucursal = empleado.idsucursal
) ;

-- ----------------------------
-- View structure for c_equipos_almacen
-- ----------------------------
DROP VIEW IF EXISTS `c_equipos_almacen`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `c_equipos_almacen` AS (
SELECT marca_celular, modelo_celular, imei_celular, iccid_celular, precioCelular, equipo_almacen.idsucursal AS ids
FROM equipo_almacen
JOIN sucursal ON equipo_almacen.idsucursal = sucursal.idsucursal
) ;

-- ----------------------------
-- View structure for c_garantia
-- ----------------------------
DROP VIEW IF EXISTS `c_garantia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `c_garantia` AS (
SELECT sucursal, nombre_cliente AS titular, imei_equipo,iccid_equipo,accesorios,equipo_garantia.idequipo_garantia, equipo_garantia.idsucursal,observaciones
FROM equipo_garantia
JOIN cliente_garantia ON cliente_garantia.idequipo_garantia = equipo_garantia.idequipo_garantia
JOIN sucursal ON sucursal.idsucursal = equipo_garantia.idsucursal
) ;

-- ----------------------------
-- View structure for v_equipos_garantia
-- ----------------------------
DROP VIEW IF EXISTS `v_equipos_garantia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_equipos_garantia` AS (
SELECT marca_equipo Marca, modelo_equipo Modelo, imei_equipo IMEI, iccid_equipo ICCID, Accesorios, observaciones, nombre_cliente Titular, telefono_contacto, fecha,equipo_garantia.idequipo_garantia, empleado, sucursal.idsucursal, sucursal
FROM equipo_garantia
JOIN cliente_garantia ON equipo_garantia.idequipo_garantia = cliente_garantia.idequipo_garantia
JOIN sucursal ON sucursal.idsucursal = equipo_garantia.idsucursal
JOIN empleado on empleado.idempleado = equipo_garantia.idempleado
) ;

-- ----------------------------
-- View structure for v_equipos_reparacion
-- ----------------------------
DROP VIEW IF EXISTS `v_equipos_reparacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_equipos_reparacion` AS (
SELECT marca_equipo AS Marca, modelo_equipo AS Modelo, imei_equipo AS IMEI, nombre_cliente as Titular, telefono_contacto, fecha, equipo_reparacion.idsucursal as idsucursal
FROM equipo_reparacion
JOIN cliente_reparacion ON equipo_reparacion.idequipo_reparacion = cliente_reparacion.idequipo_reparacion
JOIN sucursal ON sucursal.idsucursal = equipo_reparacion.idsucursal
ORDER BY fecha DESC
) ;

-- ----------------------------
-- Procedure structure for insercion_catalogo_clientes
-- ----------------------------
DROP PROCEDURE IF EXISTS `insercion_catalogo_clientes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insercion_catalogo_clientes`()
BEGIN
	#Routine body goes here...
	#variables
	DECLARE fecha DATE;
	DECLARE nombre VARCHAR(40);
	DECLARE done INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;

	DECLARE cur1 cursor FOR SELECT fecha_venta FROM venta_detalle;

	 UPDATE venta_detalle SET fecha_venta = DATE_FORMAT(fecha_venta,'%d/%m/%Y');
	-- UPDATE venta_detalle SET fecha_venta = fecha_venta+1;

	/*OPEN cur1;
		FETCH cur1 INTO fecha;
		REPEAT
			UPDATE venta_detalle SET fecha_venta = DATE_FORMAT(fecha_venta,'%d/%m/%Y') WHERE idventa_detalle = i+1;
		UNTIL done
		END REPEAT;
	CLOSE cur1;*/
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for prueba_fecha
-- ----------------------------
DROP PROCEDURE IF EXISTS `prueba_fecha`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prueba_fecha`()
BEGIN
	#Routine body goes here...
	#variables
	DECLARE fecha,fecha_vendido,fecha_2 DATE;
	DECLARE done INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;

	DECLARE cur1 cursor FOR SELECT fecha_venta FROM venta_detalle;

	 UPDATE venta_detalle SET fecha_venta = DATE_FORMAT(fecha_venta,'%d/%m/%Y');
	-- UPDATE venta_detalle SET fecha_venta = fecha_venta+1;

	/*OPEN cur1;
		FETCH cur1 INTO fecha;
		REPEAT
			UPDATE venta_detalle SET fecha_venta = DATE_FORMAT(fecha_venta,'%d/%m/%Y') WHERE idventa_detalle = i+1;
		UNTIL done
		END REPEAT;
	CLOSE cur1;*/


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TEST_TRIGGER`;
DELIMITER ;;
CREATE TRIGGER `TEST_TRIGGER` AFTER INSERT ON `t_test_triggers` FOR EACH ROW BEGIN
INSERT INTO t_test_triggers_2
SET 
    t_test_triggers_2.campo1 = "trigger de prueba22";
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TEST_TRIGGER_copy`;
DELIMITER ;;
CREATE TRIGGER `TEST_TRIGGER_copy` BEFORE INSERT ON `t_test_triggers_2` FOR EACH ROW BEGIN
SET NEW.campo1 = "trigger de prueba";
END
;;
DELIMITER ;
