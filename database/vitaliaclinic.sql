CREATE DATABASE  IF NOT EXISTS `vitaliaclinic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `vitaliaclinic`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vitaliaclinic
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `historial_solicitudes`
--

DROP TABLE IF EXISTS `historial_solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_solicitudes` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `fecha_evento` datetime NOT NULL DEFAULT current_timestamp(),
  `accion` varchar(100) NOT NULL,
  `comentario` text DEFAULT NULL,
  `id_usuario_solicitante` int(11) NOT NULL,
  `id_usuario_gestor` int(11) NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `fk_historial_solicitud` (`id_solicitud`),
  CONSTRAINT `fk_historial_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_solicitudes`
--

LOCK TABLES `historial_solicitudes` WRITE;
/*!40000 ALTER TABLE `historial_solicitudes` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'PACIENTE','Rol basico de paciente','ACTIVO');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_solicitud` varchar(20) NOT NULL,
  `fecha_solicitud` datetime NOT NULL DEFAULT current_timestamp(),
  `id_usuario_solicitante` int(11) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `tipo_solicitud` varchar(100) NOT NULL,
  `prioridad` enum('ALTA','MEDIA','BAJA') NOT NULL DEFAULT 'MEDIA',
  `comentarios` text DEFAULT NULL,
  `estado` enum('PENDIENTE','EN_REVISION_LEGAL','EN_REVISION_FINANCIERA','EN_REVISION_RRHH','APROBADA','RECHAZADA') NOT NULL DEFAULT 'PENDIENTE',
  `fecha_decision` datetime DEFAULT NULL,
  `id_usuario_decisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  UNIQUE KEY `codigo_solicitud` (`codigo_solicitud`),
  KEY `fk_solicitud_usuario_solicitante` (`id_usuario_solicitante`),
  KEY `fk_solicitud_usuario_decisor` (`id_usuario_decisor`),
  CONSTRAINT `fk_solicitud_usuario_decisor` FOREIGN KEY (`id_usuario_decisor`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_solicitud_usuario_solicitante` FOREIGN KEY (`id_usuario_solicitante`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (21,'SOL-2026-001','2026-10-17 12:06:44',1,'Farmacia','Compra de Medicamentos','ALTA','Compra urgente de medicamentos para abastecimiento institucional.','PENDIENTE',NULL,NULL),(22,'SOL-2026-002','2026-10-17 12:06:44',2,'IT','Actualización de Infraestructura','MEDIA','Renovación de equipos de cómputo para personal administrativo.','PENDIENTE',NULL,NULL),(23,'SOL-2026-003','2026-10-17 12:06:44',3,'Legal','Revisión Contractual','ALTA','Validación jurídica de convenio empresarial.','PENDIENTE',NULL,NULL),(24,'SOL-2026-004','2026-10-17 12:06:44',1,'Contabilidad','Pago Proveedor','MEDIA','Autorización de pago de factura pendiente.','PENDIENTE',NULL,NULL),(25,'SOL-2026-005','2026-10-17 12:06:44',2,'RRHH','Capacitación','BAJA','Capacitación sobre protección de datos personales.','PENDIENTE',NULL,NULL),(26,'SOL-2026-006','2026-10-17 12:06:44',3,'Gerencia','Aprobación Presupuestal','ALTA','Asignación presupuestal para nuevo proyecto institucional.','PENDIENTE',NULL,NULL),(27,'SOL-2026-007','2026-10-17 12:06:44',1,'Compras','Adquisición Equipos','MEDIA','Compra de impresoras multifuncionales.','PENDIENTE',NULL,NULL),(28,'SOL-2026-008','2026-10-17 12:06:44',2,'Mantenimiento','Adecuación Física','MEDIA','Reparación de sistema de iluminación.','PENDIENTE',NULL,NULL),(29,'SOL-2026-009','2026-10-17 12:06:44',3,'Seguridad','Control de Accesos','ALTA','Actualización de permisos y accesos institucionales.','PENDIENTE',NULL,NULL),(30,'SOL-2026-010','2026-10-17 12:06:44',1,'Farmacia','Inventario','BAJA','Regularización de diferencias detectadas en inventario.','PENDIENTE',NULL,NULL),(31,'SOL-2026-011','2026-10-17 12:06:44',2,'IT','Licenciamiento','MEDIA','Adquisición de nuevas licencias de software.','PENDIENTE',NULL,NULL),(32,'SOL-2026-012','2026-10-17 12:06:44',3,'Jurídica','Concepto Legal','ALTA','Concepto sobre contratación de proveedor estratégico.','PENDIENTE',NULL,NULL),(33,'SOL-2026-013','2026-10-17 12:06:44',1,'RRHH','Vacaciones','BAJA','Aprobación de vacaciones programadas del personal.','PENDIENTE',NULL,NULL),(34,'SOL-2026-014','2026-10-17 12:06:44',2,'Contabilidad','Conciliación Financiera','MEDIA','Ajustes derivados de conciliación bancaria mensual.','PENDIENTE',NULL,NULL),(35,'SOL-2026-015','2026-10-17 12:06:44',3,'Gerencia','Inversión Institucional','ALTA','Evaluación para expansión de infraestructura clínica.','PENDIENTE',NULL,NULL);
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_identificacion`
--

DROP TABLE IF EXISTS `tipos_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_identificacion` (
  `id_tipo_identificacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_tipo_identificacion`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_identificacion`
--

LOCK TABLES `tipos_identificacion` WRITE;
/*!40000 ALTER TABLE `tipos_identificacion` DISABLE KEYS */;
INSERT INTO `tipos_identificacion` VALUES (1,'CC','Cédula de Ciudadanía',1),(2,'TI','Tarjeta de Identidad',1),(3,'TE','Tarjeta de Extranjería',1),(4,'NIT','Número de Identificación Tributaria',1);
/*!40000 ALTER TABLE `tipos_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `nombre_completo` varchar(150) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'ACTIVO',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_tipo_identificacion` int(11) DEFAULT NULL,
  `numero_identificacion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_usuario_rol` (`id_rol`),
  KEY `fk_usuario_tipo_identificacion` (`id_tipo_identificacion`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `fk_usuario_tipo_identificacion` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipos_identificacion` (`id_tipo_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'Ruben Montoya','rubenmontoya1904@outlook.com','adso123','ACTIVO','2026-10-14 20:47:17',1,'987654321'),(2,1,'Frak Lopez','frank@vitalia.com','adso123','ACTIVO','2026-10-14 23:49:13',1,'123456789'),(3,1,'Jairo España','jairoespana@sena.com','adso123','ACTIVO','2026-10-17 16:56:41',1,'1234598765');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-17 12:15:04
