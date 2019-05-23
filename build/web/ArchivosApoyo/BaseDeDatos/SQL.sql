-- -----------------------------------------------------
-- Host: 127.0.0.1    Database: intercco
-- ------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- DROP DATABASE IF EXISTS `intercco`;
-- CREATE DATABASE `intercco`;
-- USE `intercco`;

--
-- Table structure for table `permisos`
--

-- DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
/*CREATE TABLE `permisos` (
  `idPermisos` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(12) NOT NULL,
  `ciudades_insert` varchar(1) DEFAULT NULL,
  `ciudades_select` varchar(1) DEFAULT NULL,
  `ciudades_update` varchar(1) DEFAULT NULL,
  `ciudades_delet` varchar(1) DEFAULT NULL,
  `sedes_insert` varchar(1) DEFAULT NULL,
  `sedes_select` varchar(1) DEFAULT NULL,
  `sedes_update` varchar(1) DEFAULT NULL,
  `sedes_delet` varchar(1) DEFAULT NULL,
  `carruseles_insert` varchar(1) DEFAULT NULL,
  `carruseles_select` varchar(1) DEFAULT NULL,
  `carruseles_update` varchar(1) DEFAULT NULL,
  `carruseles_delet` varchar(1) DEFAULT NULL,
  `categorias_insert` varchar(1) DEFAULT NULL,
  `categorias_select` varchar(1) DEFAULT NULL,
  `categorias_update` varchar(1) DEFAULT NULL,
  `categorias_delet` varchar(1) DEFAULT NULL,
  `usuarios_insert` varchar(1) DEFAULT NULL,
  `usuarios_select` varchar(1) DEFAULT NULL,
  `usuarios_update` varchar(1) DEFAULT NULL,
  `usuarios_delet` varchar(1) DEFAULT NULL,
  `info_usuarios_insert` varchar(1) DEFAULT NULL,
  `info_usuarios_select` varchar(1) DEFAULT NULL,
  `info_usuarios_update` varchar(1) DEFAULT NULL,
  `info_usuarios_delet` varchar(1) DEFAULT NULL,
  `facturas_insert` varchar(1) DEFAULT NULL,
  `facturas_select` varchar(1) DEFAULT NULL,
  `facturas_update` varchar(1) DEFAULT NULL,
  `facturas_delet` varchar(1) DEFAULT NULL,
  `pedidos_insert` varchar(1) DEFAULT NULL,
  `pedidos_select` varchar(1) DEFAULT NULL,
  `pedidos_update` varchar(1) DEFAULT NULL,
  `pedidos_delet` varchar(1) DEFAULT NULL,
  `comandas_insert` varchar(1) DEFAULT NULL,
  `comandas_select` varchar(1) DEFAULT NULL,
  `comandas_update` varchar(1) DEFAULT NULL,
  `comandas_delet` varchar(1) DEFAULT NULL,
  `productos_insert` varchar(1) DEFAULT NULL,
  `productos_select` varchar(1) DEFAULT NULL,
  `productos_update` varchar(1) DEFAULT NULL,
  `productos_delet` varchar(1) DEFAULT NULL,
  `detalles_pedidos_insert` varchar(1) DEFAULT NULL,
  `detalles_pedidos_select` varchar(1) DEFAULT NULL,
  `detalles_pedidos_update` varchar(1) DEFAULT NULL,
  `detalles_pedidos_delet` varchar(1) DEFAULT NULL,
  `proveedores_insert` varchar(1) DEFAULT NULL,
  `proveedores_select` varchar(1) DEFAULT NULL,
  `proveedores_update` varchar(1) DEFAULT NULL,
  `proveedores_delet` varchar(1) DEFAULT NULL,
  `insumos_insert` varchar(1) DEFAULT NULL,
  `insumos_select` varchar(1) DEFAULT NULL,
  `insumos_update` varchar(1) DEFAULT NULL,
  `insumos_delet` varchar(1) DEFAULT NULL,
  `iva_insert` varchar(1) DEFAULT NULL,
  `iva_select` varchar(1) DEFAULT NULL,
  `iva_update` varchar(1) DEFAULT NULL,
  `iva_delet` varchar(1) DEFAULT NULL,
  `logs_insert` varchar(1) DEFAULT NULL,
  `logs_select` varchar(1) DEFAULT NULL,
  `logs_update` varchar(1) DEFAULT NULL,
  `logs_delet` varchar(1) DEFAULT NULL,
  `pqrsf_insert` varchar(1) DEFAULT NULL,
  `pqrsf_select` varchar(1) DEFAULT NULL,
  `pqrsf_update` varchar(1) DEFAULT NULL,
  `pqrsf_delet` varchar(1) DEFAULT NULL,
  `promociones_insert` varchar(1) DEFAULT NULL,
  `promociones_select` varchar(1) DEFAULT NULL,
  `promociones_update` varchar(1) DEFAULT NULL,
  `promociones_delet` varchar(1) DEFAULT NULL,
  `soportes_insert` varchar(1) DEFAULT NULL,
  `soportes_select` varchar(1) DEFAULT NULL,
  `soportes_update` varchar(1) DEFAULT NULL,
  `soportes_delet` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idPermisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;*/
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

-- LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
-- UNLOCK TABLES;


--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `idCiudades` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_postal` varchar(10) NOT NULL,
  `nombre` varchar(90) NOT NULL,
  PRIMARY KEY (`idCiudades`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'050027','Medellín'),(2,'110311','Bogotá'),(3,'540001','Cúcuta'),(4,'080001','Barranquilla');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sedes` (
  `idSedes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `rango` varchar(10) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `num_mesas` int(11) NOT NULL,
  `src_mapa` text NOT NULL,
  `dias_horario` text NOT NULL,
  `horas_horario` text NOT NULL,
  `idCiudad` int(11) NOT NULL,
  PRIMARY KEY (`idSedes`),
  KEY `idCiudad_sedes_idx` (`idCiudad`),
  CONSTRAINT `idCiudad_sedes` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudades`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` VALUES (1,'Itagüí','Principal','Carrera 45 #42A-42',12,'104S116S116S112S115S58S47S47S119S119S119S46S103S111S111S103S108S101S46S99S111S109S47S109S97S112S115S47S101S109S98S101S100S63S112S98S61S33S49S109S49S56S33S49S109S49S50S33S49S109S51S33S49S100S51S49S55S51S51S46S51S51S50S50S56S56S57S48S48S54S52S53S33S50S100S45S55S53S46S54S51S49S52S51S57S54S50S53S49S51S50S56S49S33S51S100S54S46S49S55S53S51S55S55S56S51S48S55S48S52S56S57S50S33S50S109S51S33S49S102S48S33S50S102S48S33S51S102S48S33S51S109S50S33S49S105S49S48S50S52S33S50S105S55S54S56S33S52S102S49S51S46S49S33S51S109S51S33S49S109S50S33S49S115S48S120S56S101S52S54S56S50S50S101S48S55S53S101S57S99S100S53S37S51S65S48S120S54S100S100S50S49S99S99S56S52S52S53S99S51S100S52S50S33S50S115S73S116S97S103S37S67S51S37S66S67S105S37S50S67S43S65S110S116S105S111S113S117S105S97S33S53S101S48S33S51S109S50S33S49S115S101S115S45S52S49S57S33S50S115S99S111S33S52S118S49S53S53S54S49S56S52S54S52S56S52S49S50S33S53S109S50S33S49S115S101S115S45S52S49S57S33S50S115S99S111','76S117S110S101S115S32S97S32S86S105S101S114S110S101S115;83S225S98S97S100S111S115;68S111S109S105S110S103S111S115S32S121S32S70S101S115S116S105S118S111S115','49S48S58S48S48-50S50S58S48S48;49S48S58S48S48-48S48S58S48S48;49S48S58S48S48-50S48S58S48S48',1),(2,'Bello','Secundaria','Calle 51 #57-70',8,'104S116S116S112S115S58S47S47S119S119S119S46S103S111S111S103S108S101S46S99S111S109S47S109S97S112S115S47S101S109S98S101S100S63S112S98S61S33S49S109S49S56S33S49S109S49S50S33S49S109S51S33S49S100S54S51S52S52S55S46S54S54S48S49S56S52S54S48S55S57S56S33S50S100S45S55S53S46S53S56S55S57S54S49S50S56S48S53S56S57S55S52S33S51S100S54S46S51S51S49S57S54S52S49S56S54S48S53S52S52S55S57S33S50S109S51S33S49S102S48S33S50S102S48S33S51S102S48S33S51S109S50S33S49S105S49S48S50S52S33S50S105S55S54S56S33S52S102S49S51S46S49S33S51S109S51S33S49S109S50S33S49S115S48S120S56S101S52S52S50S102S97S54S57S53S56S101S49S55S55S55S37S51S65S48S120S56S51S55S99S48S55S97S54S54S54S99S102S53S48S102S48S33S50S115S66S101S108S108S111S37S50S67S43S65S110S116S105S111S113S117S105S97S33S53S101S48S33S51S109S50S33S49S115S101S115S45S52S49S57S33S50S115S99S111S33S52S118S49S53S53S51S53S55S49S48S49S53S50S52S51','77S97S114S116S101S115S32S97S32S86S105S101S114S110S101S115;70S105S110S101S115S32S100S101S32S83S101S109S97S110S97S32S121S32S70S101S115S116S105S118S111S115;86S97S99S105S111','49S49S58S48S48-50S51S58S51S48;49S50S58S48S48-48S49S58S48S48;86S97S99S105S111',1),(3,'Fontibón','Principal','Carrera 12 #28-50 SUR',10,'104S116S116S112S115S58S47S47S119S119S119S46S103S111S111S103S108S101S46S99S111S109S47S109S97S112S115S47S101S109S98S101S100S63S112S98S61S33S49S109S49S56S33S49S109S49S50S33S49S109S51S33S49S100S54S51S54S50S52S46S52S55S50S56S54S48S52S48S54S55S54S33S50S100S45S55S52S46S49S55S52S55S48S50S55S56S49S52S57S49S56S55S33S51S100S52S46S54S55S55S54S49S48S49S50S55S48S55S55S56S55S48S53S33S50S109S51S33S49S102S48S33S50S102S48S33S51S102S48S33S51S109S50S33S49S105S49S48S50S52S33S50S105S55S54S56S33S52S102S49S51S46S49S33S51S109S51S33S49S109S50S33S49S115S48S120S56S101S51S102S57S99S53S102S97S53S100S50S97S51S49S100S37S51S65S48S120S97S53S102S57S99S55S56S55S51S49S57S50S48S99S52S54S33S50S122S82S109S57S117S100S71S108S105S119S55S78S117S76S67S66S67S98S50S100S118S100S77S79S104S33S53S101S48S33S51S109S50S33S49S115S101S115S45S52S49S57S33S50S115S99S111S33S52S118S49S53S53S51S53S55S49S48S56S53S48S48S54','76S117S110S101S115S32S97S32S74S117S101S118S101S115;86S97S99S105S111;68S111S109S105S110S103S111S115S32S121S32S70S101S115S116S105S118S111S115','49S48S58S48S48-50S51S58S48S48;86S97S99S105S111;49S49S58S48S48-48S49S58S51S48',2);
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `carruseles`
--

DROP TABLE IF EXISTS `carruseles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carruseles` (
  `idCarruseles` int(11) NOT NULL AUTO_INCREMENT,
  `idSede` int(11) NOT NULL,
  `tipo` varchar(11) NOT NULL,
  `dirigido_a` varchar(18) NOT NULL,
  `nombre_img` text NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idCarruseles`),
  KEY `idSede_carruseles_idx` (`idSede`),
  CONSTRAINT `idSede_carruseles` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carruseles`
--

LOCK TABLES `carruseles` WRITE;
/*!40000 ALTER TABLE `carruseles` DISABLE KEYS */;
/*!40000 ALTER TABLE `carruseles` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `idSede` int(11) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idCategorias`),
  KEY `idSede_categorias_idx` (`idSede`),
  CONSTRAINT `idSede_categorias` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Combos',1,'Y'),(2,'Bebidas',1,'Y'),(3,'Hot Dogs',1,'Y'),(4,'Hamburguesas',3,'Y'),(5,'Helados',3,'Y');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `rol` varchar(12) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `idSede` int(11) DEFAULT NULL,
  `verificado` varchar(1) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `idSede_infoU_idx` (`idSede`),
  CONSTRAINT `idSede_infoU` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'99S108S105S101S110S116S101S64S115S117S99S99S111S46S99S111S109','49S50S51','Cliente','Julian',1,'Y','Y'),(2,'100S111S109S105S99S105S108S105S97S114S105S111S64S115S117S99S99S111S46S99S111S109','49S50S51','Domiciliario','Dilan',1,'Y','Y'),(3,'109S101S115S101S114S111S64S115S117S99S99S111S46S99S111S109','49S50S51','Mesero','Carlos',1,'Y','Y'),(4,'99S111S99S105S110S101S114S111S64S115S117S99S99S111S46S99S111S109','49S50S51','Cocinero','Omar',1,'Y','Y'),(5,'99S97S106S101S114S111S64S115S117S99S99S111S46S99S111S109','49S50S51','Cajero','Andres',1,'Y','Y'),(6,'103S101S114S101S110S116S101S64S115S117S99S99S111S46S99S111S109','49S50S51','Gerente','John',1,'Y','Y'),(7,'115S95S111S95S115S95S97S95S49S57S57S57S64S104S111S116S109S97S105S108S46S99S111S109','49S50S51','AdminS','Zayn',NULL,'Y','Y'),(8,'115S97S110S99S105S111S110S97S100S111S64S115S117S99S99S111S46S99S111S109','49S50S51','Cliente','Carmelo',1,'Y','Y'),(9,'103S101S114S101S110S116S101S83S67S64S115S117S99S99S111S46S99S111S109','49S50S51','Gerente','Paulo',3,'Y','Y'),(10,'99S108S105S101S110S116S101S77S69S64S115S117S99S99S111S46S99S111S109','49S50S51','Cliente','Camila',3,'Y','Y');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `info_usuarios`
--

DROP TABLE IF EXISTS `info_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_usuarios` (
  `idInfo_Usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `fch_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `nombre_img` text NOT NULL,
  `apellidos` varchar(90) NOT NULL,
  `tipo_i` varchar(2) NOT NULL,
  `num_i` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `movil` varchar(28) NOT NULL,
  `genero` varchar(9) NOT NULL,
  `fch_naci` date NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idInfo_Usuarios`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_usuarios`
--

LOCK TABLES `info_usuarios` WRITE;
/*!40000 ALTER TABLE `info_usuarios` DISABLE KEYS */;
INSERT INTO `info_usuarios` VALUES (1,1,'2019-03-06','18:42:47','86S97S99S105S111','Henao','CC','1123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(2,2,'2019-03-06','18:42:47','86S97S99S105S111','Garcia','CC','2123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(3,3,'2019-03-06','18:42:47','86S97S99S105S111','Gallego','CC','3123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(4,4,'2019-03-06','18:42:47','86S97S99S105S111','Castillo','CC','4123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(5,5,'2019-03-06','18:42:47','86S97S99S105S111','Leon','CC','5123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(6,6,'2019-03-06','18:42:47','86S97S99S105S111','Cano','CC','6123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(7,7,'2019-03-06','18:42:47','86S97S99S105S111','Direcshions','CC','7123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(8,8,'2019-03-06','18:42:47','86S97S99S105S111','Perez','CC','8123456789','5986900','3537188155','Masculino','1998-08-16','Laureles','Y'),(9,9,'2019-03-06','18:42:47','86S97S99S105S111','Andreo','CC','9123456789','5986900','3537188155','Femenino','1998-08-16','Laureles','Y'),(10,10,'2019-03-06','18:42:47','86S97S99S105S111','Cifuentes','TI','10123456789','5986900','3537188155','Femenino','1998-08-16','Laureles','Y');
/*!40000 ALTER TABLE `info_usuarios` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `sanciones`
--

DROP TABLE IF EXISTS `sanciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanciones` (
  `idSanciones` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `justificacion` text NOT NULL,
  `fch_limite` date NOT NULL,
  `idModerador` int(11) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idSanciones`),
  KEY `idUsuario_sanciones_idx` (`idUsuario`),
  KEY `idModerador_sanciones_idx` (`idModerador`),
  CONSTRAINT `idModerador_sanciones` FOREIGN KEY (`idModerador`) REFERENCES `usuarios` (`idusuarios`),
  CONSTRAINT `idUsuario_sanciones` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanciones`
--

LOCK TABLES `sanciones` WRITE;
/*!40000 ALTER TABLE `sanciones` DISABLE KEYS */;
INSERT INTO `sanciones` VALUES (1,8,'70S97S108S116S97S32S100S101S32S114S101S115S112S101S116S111S32S97S32S108S111S115S32S101S109S112S108S101S97S100S111S115S32S100S101S32S110S117S101S115S116S114S97S32S115S101S100S101S32S83S85S67S67S79S33','2290-01-01',6,'Y');
/*!40000 ALTER TABLE `sanciones` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL AUTO_INCREMENT,
  `fch_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `importe` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `idCajero` int(11) NOT NULL,
  `idSede` int(11) NOT NULL,
  PRIMARY KEY (`idFacturas`),
  KEY `idSede_facturas_idx` (`idSede`),
  KEY `idCajero_facturas_idx` (`idCajero`),
  KEY `idCliente_facturas_idx` (`idCliente`),
  CONSTRAINT `idCliente_facturas` FOREIGN KEY (`idCliente`) REFERENCES `info_usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCajero_facturas` FOREIGN KEY (`idCajero`) REFERENCES `info_usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idSede_facturas` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(16) NOT NULL,
  `fch_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `tipo_pedido` varchar(11) NOT NULL,
  `num_mesa` int(11) DEFAULT NULL,
  `direccion_ent` varchar(150) DEFAULT NULL,
  `sub_total` int(11) NOT NULL,
  `idMeseroODomiciliario` int(11) NOT NULL,
  `idFactura` int(11) DEFAULT NULL,
  `idSede` int(11) NOT NULL,
  `estado` varchar(13) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `idFactura_pedidos_idx` (`idFactura`),
  KEY `idSede_pedidos_idx` (`idSede`),
  KEY `idCliente_pedidos_idx` (`idCliente`),
  KEY `idMesero_pedidos_idx` (`idMeseroODomiciliario`),
  CONSTRAINT `idCliente_pedidos` FOREIGN KEY (`idCliente`) REFERENCES `info_usuarios` (`idusuario`),
  CONSTRAINT `idFactura_pedidos` FOREIGN KEY (`idFactura`) REFERENCES `facturas` (`idfacturas`),
  CONSTRAINT `idMeseroODomiciliario_pedidos` FOREIGN KEY (`idMeseroODomiciliario`) REFERENCES `info_usuarios` (`idusuario`),
  CONSTRAINT `idSede_pedidos` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idsedes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'f06052019h071142','2019-05-06','07:11:42',NULL,'Restaurante',4,NULL,18000,3,NULL,1,'Entregado','Y'),(2,'f06052019h071235','2019-05-06','07:12:35',NULL,'Restaurante',5,NULL,34400,3,NULL,1,'En espera','Y'),(3,'f06052019h071331','2019-05-06','07:13:31',NULL,'Restaurante',2,NULL,130200,3,NULL,1,'En produccion','Y'),(4,'f06052019h071612','2019-05-06','07:16:12',NULL,'Restaurante',11,NULL,5900,3,NULL,1,'Cancelado','N'),(5,'f06052019h071710','2019-05-06','07:17:10',NULL,'Restaurante',8,NULL,39800,3,NULL,1,'Devuelto','N');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `comandas`
--

DROP TABLE IF EXISTS `comandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comandas` (
  `idComandas` int(11) NOT NULL AUTO_INCREMENT,
  `fch_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idComandas`),
  KEY `idPedido_comandas_idx` (`idPedido`),
  CONSTRAINT `idPedido_comandas` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandas`
--

LOCK TABLES `comandas` WRITE;
/*!40000 ALTER TABLE `comandas` DISABLE KEYS */;
/*!40000 ALTER TABLE `comandas` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) NOT NULL,
  `codigo` varchar(16) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` int(11) NOT NULL,
  `idSede` int(11) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `idSede_productos_idx` (`idSede`),
  KEY `idCategoria_productos_idx` (`idCategoria`),
  CONSTRAINT `idCategoria_productos` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idSede_productos` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `detalles_pedidos`
--

DROP TABLE IF EXISTS `detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_pedidos` (
  `idDetalles_Pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `observacion` text NOT NULL,
  `sub_total` int(11) NOT NULL,
  PRIMARY KEY (`idDetalles_Pedidos`),
  KEY `idPedido_detalles_idx` (`idPedido`),
  KEY `idProducto_detalles_idx` (`idProducto`),
  CONSTRAINT `idPedido_detalles` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idpedidos`),
  CONSTRAINT `idProducto_detalles` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idproductos`)
) ENGINE=InnoDB /*AUTO_INCREMENT=12*/ DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedidos`
--

LOCK TABLES `detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `detalles_pedidos` DISABLE KEYS */;
--INSERT INTO `detalles_pedidos` VALUES (1,1,13,3,'68S111S115S32S112S105S108S115S101S110S32S121S32S117S110S97S32S97S103S117S105S108S97S46',18000),(2,2,9,1,'86S97S99S105S111',5900),(3,2,13,1,'86S97S99S105S111',6000),(4,2,1,1,'76S97S32S104S97S109S98S117S114S103S117S101S115S97S32S115S105S110S32S116S111S109S97S116S101S32S118S101S114S100S101S46',22500),(5,3,11,1,'86S97S99S105S111',67100),(6,3,16,3,'84S111S100S97S115S32S108S97S115S32S115S97S108S115S97S115S32S112S97S114S97S32S117S110S111S44S32S101S108S32S114S101S115S116S111S32S115S111S108S111S32S116S111S109S97S116S101S32S121S32S114S111S115S97S100S97S46',47100),(7,3,2,1,'86S97S99S105S111',16000),(8,4,6,1,'86S97S99S105S111',5900),(9,5,15,2,'85S110S111S32S115S105S110S32S112S101S112S105S110S105S108S108S111S46',28000),(10,5,10,1,'86S97S99S105S111',5900),(11,5,7,1,'86S97S99S105S111',5900);
/*!40000 ALTER TABLE `detalles_pedidos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `idProveedores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_coe` varchar(90) NOT NULL,
  `tipo_if` varchar(1) NOT NULL,
  `num_it` varchar(20) NOT NULL,
  `telefono_coe` varchar(20) NOT NULL,
  `extension_tel_coe` varchar(15) NOT NULL,
  `movil_coe` varchar(18) NOT NULL,
  `fax_coe` varchar(15) NOT NULL,
  `extension_fax_coe` varchar(15) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `nombre_pc` varchar(110) NOT NULL,
  `cargo_pc` varchar(60) NOT NULL,
  `tipo_i` varchar(2) NOT NULL,
  `num_i` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `fax_pc` varchar(15) NOT NULL,
  `extension_fax_pc` varchar(15) NOT NULL,
  `telefono_pc` varchar(15) NOT NULL,
  `movil_pc` varchar(28) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idProveedores`),
  KEY `idCiudad_proveedores` (`idCiudad`),
  CONSTRAINT `idCiudad_proveedores` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudades`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Coca Cola S.A.S','A','1-123456789','','','3007459023','','',2,'Carretera Circunvalar Km. 13  Colombia','Camilo de Nazare','Gerente','CC','1234387459','','3459823','1984','','','Y'),(2,'Industria de Alimentos Zenu S.A.S','N','0-45612356','4705222','574','3015193684','9561212','',1,'Carrera 64C # 104 - 03','Alejandra Perez','RR.HH.','TP','4561986274','alejitagome@zenu.com','','','2394567','300456872','Y'),(3,'Catalogos Especializados de Axioma Marketing B2B','R','3-765473829','','','','4457692','09342',4,'Calle 90 #34 B NORTE','Sebastian Perez','Administrador','CC','98450245128','sebastian-perez@cataespecia.ce','','','','','Y');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumos` (
  `idInsumos` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(90) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `fch_ingreso` date NOT NULL,
  `fch_caducidad` date NOT NULL,
  `unidad_medida` varchar(9) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL,
  `idSede` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idInsumos`),
  KEY `idProveedor_insumos_idx` (`idProveedor`),
  KEY `idSede_idx` (`idSede`),
  CONSTRAINT `idProveedor_insumos` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idSede_insumos` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (1,'3429963411-1','Coca Cola Mega','2018-12-11','2018-12-12','Litro',50,5500,1,1,'Y'),(2,'1122363511-9','Salchichas Rancheras','2018-12-11','2019-03-12','Unidades',8,3800,1,2,'D'),(3,'11228753-6','Jamon Ranchero','2019-04-02','2090-12-31','Unidades',14,5000,1,2,'Y'),(4,'435454656-1','Sprite Extra Grande','2019-04-01','2090-12-31','Litro',85,6000,1,1,'Y'),(5,'146562435-4','Laminas papel antigraso y parafinado','2018-12-11','2090-12-31','Unidades',0,9000,1,3,'Y');
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `detalles_productos`
--

DROP TABLE IF EXISTS `detalles_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_productos` (
  `idDetalles_Productos` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `idInsumoNecesario` int(11) NOT NULL,
  `cantidad_insumo` int(11) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idDetalles_Productos`),
  KEY `idProducto_detallesP_idx` (`idProducto`),
  KEY `idInsumoNecesario_detallesP_idx` (`idInsumoNecesario`),
  CONSTRAINT `idInsumoNecesario_detallesP` FOREIGN KEY (`idInsumoNecesario`) REFERENCES `insumos` (`idinsumos`),
  CONSTRAINT `idProducto_detallesP` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idproductos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_productos`
--

LOCK TABLES `detalles_productos` WRITE;
/*!40000 ALTER TABLE `detalles_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_productos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `iva`
--

DROP TABLE IF EXISTS `iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iva` (
  `idIva` int(11) NOT NULL AUTO_INCREMENT,
  `porcentaje` float NOT NULL,
  `actualizacion` varchar(1) NOT NULL,
  PRIMARY KEY (`idIva`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iva`
--

LOCK TABLES `iva` WRITE;
/*!40000 ALTER TABLE `iva` DISABLE KEYS */;
INSERT INTO `iva` VALUES (1,19.1,'N');
/*!40000 ALTER TABLE `iva` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `idLogs` int(11) NOT NULL AUTO_INCREMENT,
  `fch_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `rolUsuario` varchar(12) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `accion` text NOT NULL,
  `idSede` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLogs`),
  KEY `idSede_logs_idx` (`idSede`),
  KEY `idUsuario_logs_idx` (`idUsuario`),
  CONSTRAINT `idSede_logs` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_logs` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `pqrsf`
--

DROP TABLE IF EXISTS `pqrsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pqrsf` (
  `idPqrsf` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idSedeCliente` int(11) NOT NULL,
  `fch_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `tipo_solicitud` varchar(14) NOT NULL,
  `dirigido_a` varchar(12) NOT NULL,
  `consulta` text NOT NULL,
  `respuesta` text NOT NULL,
  `estado` varchar(10) NOT NULL,
  `idSedeDirigido` int(11) NOT NULL,
  `idInterlocutor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPqrsf`),
  KEY `idInterlocutor_pqrsf_idx` (`idInterlocutor`),
  KEY `idCliente_pqrsf_idx` (`idCliente`),
  KEY `idSedeCliente_pqrsf_idx` (`idSedeCliente`),
  KEY `idSedeDirigido_pqrsf_idx` (`idSedeDirigido`),
  CONSTRAINT `idCliente_pqrsf` FOREIGN KEY (`idCliente`) REFERENCES `info_usuarios` (`idinfo_usuarios`),
  CONSTRAINT `idInterlocutor_pqrsf` FOREIGN KEY (`idInterlocutor`) REFERENCES `info_usuarios` (`idinfo_usuarios`),
  CONSTRAINT `idSedeCliente_pqrsf` FOREIGN KEY (`idSedeCliente`) REFERENCES `sedes` (`idsedes`),
  CONSTRAINT `idSedeDirigido_pqrsf` FOREIGN KEY (`idSedeDirigido`) REFERENCES `sedes` (`idsedes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pqrsf`
--

LOCK TABLES `pqrsf` WRITE;
/*!40000 ALTER TABLE `pqrsf` DISABLE KEYS */;
INSERT INTO `pqrsf` VALUES (1,1,1,'2019-03-08','03:09:23','Sugerencia','Cocinero','76S111S115S32S99S111S99S105S110S101S114S111S115S32S100S101S98S101S114S237S97S110S32S116S101S110S101S114S32S117S110S32S115S105S115S116S101S109S97S32S112S97S114S97S32S108S108S97S109S97S114S32S97S32S108S111S115S32S109S101S115S101S114S111S115S32S121S32S110S111S32S116S101S110S101S114S32S110S101S99S101S115S105S100S97S100S32S100S101S32S115S97S108S105S114S32S121S32S101S110S116S114S101S103S97S114S32S108S111S115S32S112S108S97S116S111S115S46S13S83S105S101S110S100S111S32S104S111S110S101S115S116S111S44S32S115S101S32S118S101S32S104S111S114S114S105S98S108S101S32S113S117S101S32S100S101S98S97S110S32S104S97S99S101S114S32S101S115S111S46','83S105S110S32S114S101S115S112S117S101S115S116S97','Vacio',1,NULL),(2,4,1,'2019-03-14','01:25:00','Queja','Mesero','69S110S116S105S101S110S100S111S32S113S117S101S32S108S111S115S32S109S101S115S101S114S111S115S32S100S101S98S97S110S32S116S111S109S97S114S32S115S117S32S111S114S100S101S110S32S112S97S114S97S32S103S97S110S97S114S32S112S117S110S116S111S115S32S121S32S112S111S100S101S114S32S101S115S116S97S114S32S101S115S116S97S98S108S101S32S99S111S110S32S115S117S32S116S114S97S98S97S106S111S44S32S112S101S114S111S32S101S108S32S104S101S99S104S111S32S100S101S32S113S117S101S32S110S111S115S32S116S111S109S101S109S111S115S32S110S117S101S115S116S114S111S32S116S105S101S109S112S111S32S112S97S114S97S32S112S101S110S115S97S114S32S108S111S32S113S117S101S32S118S97S109S111S115S32S97S32S112S101S100S105S114S32S121S32S101S108S108S111S115S32S110S111S32S108S111S32S97S99S101S112S116S101S110S44S32S109S101S32S112S97S114S101S99S101S32S109S225S115S32S113S117S101S32S115S111S108S111S32S109S97S108S32S72S69S67S72S79S33','80S117S101S100S111S32S101S110S116S101S110S100S101S114S32S108S111S32S101S110S111S106S97S100S111S32S121S32S102S114S117S115S116S114S97S100S111S32S113S117S101S32S115S101S32S101S110S99S117S101S110S116S114S97S44S32S105S110S118S101S115S116S105S103S97S114S101S109S111S115S32S101S108S32S99S97S115S111S32S112S97S114S97S32S101S118S97S108S117S97S114S108S111S32S121S32S116S111S109S97S114S32S109S101S100S105S100S97S115S44S32S110S111S32S118S111S108S118S101S114S225S32S97S32S112S97S115S97S114S44S32S115S101S32S108S111S32S97S115S101S103S117S114S111S46','Atendido',1,6),(3,3,1,'2019-03-18','05:05:03','Felicitaciones','Gerente','85S110S97S32S102S101S108S105S99S105S116S97S99S105S243S110S32S101S110S111S114S109S101S32S97S32S108S111S115S32S71S101S114S101S110S116S101S115S32S100S101S32S83S85S67S67S79S32S113S117S101S32S115S105S32S115S105S114S118S101S110S32S112S97S114S97S32S97S108S103S111S44S32S109S101S32S101S110S111S114S103S117S108S108S101S115S101S32S113S117S101S32S115S101S112S97S110S32S118S97S108S111S114S97S114S32S97S32S115S117S115S32S99S108S105S101S110S116S101S115S44S32S112S111S114S102S97S118S111S114S44S32S112S97S115S97S108S101S32S109S105S32S116S111S116S97S108S32S103S114S97S116S105S116S117S100S32S97S32S116S111S100S111S115S32S108S111S115S32S103S101S114S101S110S116S101S115S32S100S101S108S32S114S101S115S116S97S117S114S97S110S116S101S33','83S105S110S32S114S101S115S112S117S101S115S116S97','Descartado',1,NULL),(4,1,1,'2019-04-27','02:37:01','Felicitaciones','Cocinero','69S120S99S101S108S101S110S116S101S32S99S111S109S105S100S97S44S32S114S101S97S108S109S101S110S116S101S32S113S117S101S100S233S32S97S115S111S109S98S114S97S100S111S44S32S111S115S32S106S117S114S111S32S113S117S101S32S118S111S108S118S101S114S233S32S112S111S114S32S97S108S108S225S44S32S102S101S108S105S122S32S100S237S97S33','83S105S110S32S114S101S115S112S117S101S115S116S97','Cancelado',1,NULL);
/*!40000 ALTER TABLE `pqrsf` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promociones` (
  `idPromociones` int(11) NOT NULL AUTO_INCREMENT,
  `fch_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `idProducto` int(11) NOT NULL,
  `porcentaje_promo` int(11) NOT NULL,
  `fch_caducidad` date NOT NULL,
  `idSede` int(11) NOT NULL,
  `existencia` varchar(1) NOT NULL,
  PRIMARY KEY (`idPromociones`),
  KEY `idProducto_promociones_idx` (`idProducto`),
  KEY `idSede_promociones_idx` (`idSede`),
  CONSTRAINT `idProducto_promociones` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idSede_promociones` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `soportes`
--

DROP TABLE IF EXISTS `soportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soportes` (
  `idSoportes` int(11) NOT NULL AUTO_INCREMENT,
  `fch_solicitud` date NOT NULL,
  `fch_resuelto` date DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `idSede` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `ruta` text NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`idSoportes`),
  KEY `idSedes_soportes_idx` (`idSede`),
  KEY `idUsuario_soportes_idx` (`idUsuario`),
  CONSTRAINT `idSedes_soportes` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_soportes` FOREIGN KEY (`idUsuario`) REFERENCES `info_usuarios` (`idInfo_Usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soportes`
--

LOCK TABLES `soportes` WRITE;
/*!40000 ALTER TABLE `soportes` DISABLE KEYS */;
INSERT INTO `soportes` VALUES (1,'2018-12-16','2019-03-19',6,1,'69S110S32S99S105S101S114S116S111S32S114S101S103S105S115S116S114S111S32S115S101S32S97S114S114S117S105S110S97S32S108S97S32S109S111S100S97S108S32S100S101S32S86S69S82S32S121S32S110S111S32S109S101S32S109S117S101S115S116S114S97S32S108S97S32S115S97S110S99S105S243S110S32S100S101S108S32S117S115S117S97S114S105S111S46','104S116S116S112S58S47S47S108S111S99S97S108S104S111S115S116S58S56S48S56S54S47S83S85S67S67S79S47S85S115S117S97S114S105S111S115','C'),(2,'2018-12-20',NULL,6,1,'69S108S32S99S117S97S100S114S111S32S113S117S101S32S100S101S115S112S108S105S101S103S97S32S116S111S100S97S115S32S108S97S115S32S109S101S115S97S115S32S112S97S114S97S32S116S111S109S97S114S32S108S97S32S111S114S100S101S110S44S32S109S117S101S115S116S114S97S32S110S117S109S101S114S111S115S32S114S97S114S111S115S32S121S32S110S111S32S115S101S32S115S105S32S114S101S97S108S109S101S110S116S101S32S115S101S108S101S99S99S105S111S110S101S32S108S97S32S113S117S101S32S101S115','104S116S116S112S58S47S47S108S111S99S97S108S104S111S115S116S58S56S48S56S54S47S83S85S67S67S79S47S112S101S100S105S100S111S115S76S105S115S116S97S114S46S106S115S112','P'),(3,'2018-12-24',NULL,1,1,'78S111S32S112S117S101S100S111S32S97S103S114S101S103S97S114S32S108S97S32S99S233S100S117S108S97S32S97S32S108S97S32S102S97S99S116S117S114S97S32S112S111S114S32S117S110S32S101S114S114S111S114S32S101S110S32S108S97S32S98S97S115S101S32S100S101S32S100S97S116S111S115','104S116S116S112S58S47S47S108S111S99S97S108S104S111S115S116S58S56S48S56S54S47S83S85S67S67S79S47S114S101S99S105S98S111S115S76S105S115S116S97S114S46S106S115S112','P');
/*!40000 ALTER TABLE `soportes` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-05 16:05:54