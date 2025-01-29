-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hr
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Human Resources','Head Office'),(2,'Finance','Head Office'),(3,'IT','Head Office'),(4,'Marketing','Branch Office'),(5,'Operations','Branch Office');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employeeoverview`
--

DROP TABLE IF EXISTS `employeeoverview`;
/*!50001 DROP VIEW IF EXISTS `employeeoverview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeeoverview` AS SELECT 
 1 AS `EmployeeID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Email`,
 1 AS `Phone`,
 1 AS `Address`,
 1 AS `DateOfBirth`,
 1 AS `HireDate`,
 1 AS `DepartmentName`,
 1 AS `PositionTitle`,
 1 AS `SalaryGrade`,
 1 AS `SalaryAmount`,
 1 AS `EffectiveDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `PositionID` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `PositionID` (`PositionID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`PositionID`) REFERENCES `positions` (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'John','Doe','john.doe@example.com','0793475689','123 Main St, Anytown, London','1985-07-15','2020-01-15',1,1),(2,'Jane','Smith','jane.smith@example.com','07911207564','456 Elm St, Othertown, London','1990-03-20','2018-05-10',1,2),(3,'Michael','Johnson','michael.johnson@example.com','07723587654','789 Oak Ave, Anycity, London','1988-11-02','2019-08-20',3,4),(4,'Emily','Brown','emily.brown@example.com','07456018843','321 Pine Rd, Anothercity, London','1995-09-10','2021-03-05',4,5),(5,'David','Lee','david.lee@example.com','07966274550','555 Cedar Lane, Somewhereville, Birmingham','1982-04-25','2017-02-12',5,6),(6,'Amy','Pryce','amy.price@example.com','07746091772','77 Wilton Rd, London','1990-04-16','2019-01-03',2,3),(7,'Robert','Williams','robert.williams@example.com','07984561234','100 Abbey Rd, Manchester','1975-05-12','2015-06-01',3,7),(8,'Jessica','Taylor','jessica.taylor@example.com','07845612309','222 Cherry Ln, Liverpool','1989-08-08','2017-09-10',4,8),(9,'Steven','Wilson','steven.wilson@example.com','07756123489','88 King St, Bristol','1993-12-05','2020-11-22',5,9),(10,'Rachel','Adams','rachel.adams@example.com','07656231890','50 Queen St, Leeds','1985-11-15','2016-07-07',2,10);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaverequests`
--

DROP TABLE IF EXISTS `leaverequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaverequests` (
  `LeaveRequestID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `LeaveType` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LeaveRequestID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `leaverequests_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaverequests`
--

LOCK TABLES `leaverequests` WRITE;
/*!40000 ALTER TABLE `leaverequests` DISABLE KEYS */;
INSERT INTO `leaverequests` VALUES (1,1,'2024-02-01','2024-02-15','Annual Leave','Approved'),(2,2,'2024-03-10','2024-03-15','Sick Leave','Pending'),(3,3,'2024-04-20','2024-04-25','Annual Leave','Approved'),(4,4,'2024-05-01','2024-05-10','Maternity Leave','Approved'),(5,5,'2024-06-15','2024-06-20','Annual Leave','Pending'),(6,6,'2024-07-01','2024-07-05','Sick Leave','Approved'),(7,7,'2024-08-10','2024-08-15','Annual Leave','Approved'),(8,8,'2024-09-05','2024-09-10','Sick Leave','Rejected'),(9,9,'2024-10-15','2024-10-20','Annual Leave','Pending'),(10,10,'2024-11-01','2024-11-10','Paternity Leave','Approved');
/*!40000 ALTER TABLE `leaverequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `PositionID` int NOT NULL AUTO_INCREMENT,
  `PositionTitle` varchar(100) DEFAULT NULL,
  `SalaryGrade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PositionID`),
  UNIQUE KEY `PositionTitle` (`PositionTitle`,`SalaryGrade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (3,'Finance Director','Grade 12'),(1,'HR Manager','Grade 10'),(2,'HR Specialist','Grade 8'),(7,'IT Manager','Grade 10'),(10,'Management Accountant','Grade 8'),(8,'Marketing Assistant','Grade 4'),(5,'Marketing Coordinator','Grade 7'),(9,'Operations Administrator','Grade 4'),(6,'Operations Manager','Grade 10'),(4,'Senior Developer','Grade 9');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salaries` (
  `SalaryID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int DEFAULT NULL,
  `SalaryAmount` decimal(10,2) DEFAULT NULL,
  `EffectiveDate` date DEFAULT NULL,
  PRIMARY KEY (`SalaryID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` VALUES (1,1,71250.00,'2023-01-01'),(2,2,48750.00,'2023-01-01'),(3,3,60000.00,'2023-01-01'),(4,4,43000.00,'2023-01-01'),(5,5,71250.00,'2023-01-01'),(6,6,90000.00,'2023-01-01'),(7,7,75000.00,'2023-01-01'),(8,8,37125.00,'2023-01-01'),(9,9,26250.00,'2023-01-01'),(10,10,52500.00,'2023-01-01');
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `employeeoverview`
--

/*!50001 DROP VIEW IF EXISTS `employeeoverview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeeoverview` AS select `e`.`EmployeeID` AS `EmployeeID`,`e`.`FirstName` AS `FirstName`,`e`.`LastName` AS `LastName`,`e`.`Email` AS `Email`,`e`.`Phone` AS `Phone`,`e`.`Address` AS `Address`,`e`.`DateOfBirth` AS `DateOfBirth`,`e`.`HireDate` AS `HireDate`,`d`.`DepartmentName` AS `DepartmentName`,`p`.`PositionTitle` AS `PositionTitle`,`p`.`SalaryGrade` AS `SalaryGrade`,`s`.`SalaryAmount` AS `SalaryAmount`,`s`.`EffectiveDate` AS `EffectiveDate` from (((`employees` `e` join `departments` `d` on((`e`.`DepartmentID` = `d`.`DepartmentID`))) join `positions` `p` on((`e`.`PositionID` = `p`.`PositionID`))) left join `salaries` `s` on((`e`.`EmployeeID` = `s`.`EmployeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-29 21:37:30
