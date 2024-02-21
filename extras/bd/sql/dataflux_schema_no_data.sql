-- --------------------------------------------------------
-- Host:                         192.168.0.226
-- Versión del servidor:         10.6.16-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dataflux
CREATE DATABASE IF NOT EXISTS `dataflux` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */;
USE `dataflux`;

-- Volcando estructura para tabla dataflux.ta_organos_resolutores
CREATE TABLE IF NOT EXISTS `ta_organos_resolutores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denominacion` varchar(60) NOT NULL,
  `nombre_corto` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla dataflux.ta_roles
CREATE TABLE IF NOT EXISTS `ta_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denominacion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla dataflux.ta_tipos_firmas
CREATE TABLE IF NOT EXISTS `ta_tipos_firmas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_firma` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='Tabla posiblemente innecesaria.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla dataflux.ta_tipos_usuarios
CREATE TABLE IF NOT EXISTS `ta_tipos_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla dataflux.tt_reso_firmantes
CREATE TABLE IF NOT EXISTS `tt_reso_firmantes` (
  `resolucion_id` int(11) NOT NULL,
  `firmante_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`resolucion_id`,`firmante_id`),
  KEY `reso_fk_idx` (`resolucion_id`),
  KEY `firmante_fk_idx` (`firmante_id`),
  KEY `rol_fk_idx` (`rol_id`),
  CONSTRAINT `firmante_fk` FOREIGN KEY (`firmante_id`) REFERENCES `t_firmantes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reso_fk` FOREIGN KEY (`resolucion_id`) REFERENCES `t_resoluciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_fk` FOREIGN KEY (`rol_id`) REFERENCES `ta_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla dataflux.t_firmantes
CREATE TABLE IF NOT EXISTS `t_firmantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_completo_UNIQUE` (`nombre_completo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla dataflux.t_resoluciones
CREATE TABLE IF NOT EXISTS `t_resoluciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `numero` varchar(4) NOT NULL,
  `anho` varchar(4) NOT NULL,
  `fecha` date DEFAULT NULL,
  `titulo` varchar(300) NOT NULL,
  `visto` varchar(300) DEFAULT NULL,
  `considerando` varchar(300) DEFAULT NULL,
  `resuelve` mediumtext DEFAULT NULL,
  `organo_resolutor` int(11) NOT NULL,
  `tipo_firma` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `vigencia` date DEFAULT NULL,
  `ocr` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resolutor_fk_idx` (`organo_resolutor`),
  KEY `tipo_firma_fk_idx` (`tipo_firma`),
  CONSTRAINT `resolutor_fk` FOREIGN KEY (`organo_resolutor`) REFERENCES `ta_organos_resolutores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_firma_fk` FOREIGN KEY (`tipo_firma`) REFERENCES `ta_tipos_firmas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla dataflux.t_usuarios
CREATE TABLE IF NOT EXISTS `t_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) NOT NULL,
  `rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rol_tipos_usuarios` (`rol`),
  CONSTRAINT `fk_rol_tipos_usuarios` FOREIGN KEY (`rol`) REFERENCES `ta_tipos_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
