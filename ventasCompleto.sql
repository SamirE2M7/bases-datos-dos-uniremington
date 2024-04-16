-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ventas
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Cliente 1','Calle 123','cliente1@example.com'),(2,'Cliente 2','Avenida 456','cliente2@example.com'),(3,'Cliente 3','Calle Principal','cliente3@example.com'),(4,'Cliente 4','Avenida Central','cliente4@example.com'),(5,'Cliente 5','Calle Secundaria','cliente5@example.com'),(6,'Cliente 6','Avenida Norte','cliente6@example.com'),(7,'Cliente 7','Calle Sur','cliente7@example.com'),(8,'Cliente 8','Avenida Este','cliente8@example.com'),(9,'Cliente 9','Calle Oeste','cliente9@example.com'),(10,'Cliente 10','Avenida Central','cliente10@example.com'),(11,'NombreCliente','DireccionCliente','correo@ejemplo.com'),(12,'SamirEaloM','sincelejo, Sucre','IngSamir@ejemplo.com'),(13,'SamirEM','Colombia','samy@ejemplo.com'),(14,'keren','Colombia','kere@gmail');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_pedido` (
  `ID_Detalle` int NOT NULL AUTO_INCREMENT,
  `ID_Pedido` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle`),
  KEY `ID_Pedido` (`ID_Pedido`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedido`
--

LOCK TABLES `detalles_pedido` WRITE;
/*!40000 ALTER TABLE `detalles_pedido` DISABLE KEYS */;
INSERT INTO `detalles_pedido` VALUES (1,1,1,2,10.50,21.00),(2,2,2,1,20.75,20.75),(3,3,3,3,15.00,45.00),(4,4,4,2,8.99,17.98),(5,5,5,1,12.25,12.25),(6,6,6,4,30.00,120.00),(7,7,7,2,25.50,51.00),(8,8,8,3,18.75,56.25),(9,9,9,1,22.99,22.99),(10,10,10,2,9.50,19.00);
/*!40000 ALTER TABLE `detalles_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID_Pedido` int NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2024-04-01',0.00),(2,2,'2024-04-02',0.00),(3,3,'2024-04-03',0.00),(4,4,'2024-04-04',0.00),(5,5,'2024-04-05',0.00),(6,6,'2024-04-06',0.00),(7,7,'2024-04-07',0.00),(8,8,'2024-04-08',0.00),(9,9,'2024-04-09',0.00),(10,10,'2024-04-10',0.00);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Producto 1',10.50,85),(2,'Producto 2',20.75,50),(3,'Producto 3',15.00,75),(4,'Producto 4',8.99,120),(5,'Producto 5',12.25,80),(6,'Producto 6',30.00,40),(7,'Producto 7',25.50,60),(8,'Producto 8',18.75,90),(9,'Producto 9',22.99,110),(10,'Producto 10',9.50,70),(11,'NuevoProducto',25.99,50),(12,'PlayStations 5',150.99,14);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ventas'
--

--
-- Dumping routines for database 'ventas'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarStockProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockProducto`(
    IN producto_id INT,
    IN cantidad INT
)
BEGIN
    UPDATE Productos
    SET Stock = Stock - cantidad
    WHERE ID_Producto = producto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AgregarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarCliente`(
    IN nombre VARCHAR(100),
    IN direccion VARCHAR(255),
    IN correoElectronico VARCHAR(100)
)
BEGIN
    INSERT INTO Clientes (Nombre, Direccion, CorreoElectronico)
    VALUES (nombre, direccion, correoElectronico);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AgregarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarProducto`(
    IN nombre_producto VARCHAR(100),
    IN precio DECIMAL(10, 2),
    IN stock INT
)
BEGIN
    INSERT INTO Productos (Nombre, Precio, Stock) VALUES (nombre_producto, precio, stock);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalcularTotalVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalcularTotalVentas`(
    IN cliente_id INT,
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT SUM(dp.Subtotal) AS Total_Ventas
    FROM Pedidos p
    JOIN Detalles_Pedido dp ON p.ID_Pedido = dp.ID_Pedido
    WHERE p.ID_Cliente = cliente_id
    AND p.Fecha BETWEEN fecha_inicio AND fecha_fin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDetallesPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDetallesPedido`(
    IN pedido_id INT
)
BEGIN
    SELECT *
    FROM Detalles_Pedido
    WHERE ID_Pedido = pedido_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-16 17:35:53
