CREATE DATABASE  IF NOT EXISTS `sqlbuscador` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sqlbuscador`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sqlbuscador
-- ------------------------------------------------------
-- Server version	5.7.22-log

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

--
-- Dumping routines for database 'sqlbuscador'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all`()
BEGIN
DELETE FROM item_posteo where frecuencia < 100000000000;
DELETE FROM termino WHERE id_termino < 10000000000;
DELETE FROM documento WHERE id_documento < 10000000000;
ALTER TABLE sqlbuscador.termino AUTO_INCREMENT = 1;
ALTER TABLE sqlbuscador.documento AUTO_INCREMENT = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testInsertarTermino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testInsertarTermino`(
	IN p_n_termino VARCHAR(45),
    IN p_frecuencia INT,
    IN p_documento VARCHAR(200))
BEGIN
	-- DECLARACION DE VARIABLES
	DECLARE v_id_termino INT(11) DEFAULT -1;
    DECLARE v_max_frec int(11);
    
    -- en MySQL no hay try/catch, usamos un handler
    DECLARE exit handler for sqlexception
		BEGIN
		-- ERROR
		ROLLBACK;
	END;
    
    START TRANSACTION;
    
    -- INSERCION EN TABLA TERMINO
	
    -- Buscamos si ya esta la palabra en la tabla termino
    SELECT t.id_termino INTO v_id_termino
		FROM sqlbuscador.termino t
        WHERE t.n_termino = LOWER(p_n_termino);
	IF (v_id_termino = -1) THEN
		-- Si la palabra no esta la insertamos,
		-- pero primero guardamos el proximo id_termino autogenerado
        SELECT AUTO_INCREMENT INTO v_id_termino
			FROM information_schema.TABLES
			WHERE TABLE_SCHEMA = "sqlbuscador"
			AND TABLE_NAME = "termino";
		-- Ahora hacemos la insercion (no hace falta pasarle el id_termino, se genera solo)
		INSERT INTO sqlbuscador.termino 
			(n_termino, max_frecuencia)
            values (p_n_termino, p_frecuencia);
	ELSE
		-- Si la palabra esta entonces la actualizamos, guardando la nueva frecuencia si es mayor
        -- Guardamos frecuencia maxima actual del termino en bd para comparar si la nueva es mayor
		SELECT t.max_frecuencia INTO v_max_frec
			FROM sqlbuscador.termino t 
            WHERE t.id_termino = v_id_termino;
		-- Ahora hacemos la comparacion
		IF (p_frecuencia > v_max_frec) THEN
			-- Si la nueva es mayor la guardamos ademas de incrementar la cant de documentos
			UPDATE sqlbuscador.termino t 
				SET t.cant_documentos = t.cant_documentos + 1,
					t.max_frecuencia = p_frecuencia
                WHERE t.id_termino = v_id_termino;
		ELSE
			-- Si la nueva no es mayor entonces solo incrementamos la cantidad de documentos
			UPDATE sqlbuscador.termino t 
				SET t.cant_documentos = t.cant_documentos + 1
                WHERE t.id_termino = v_id_termino;
		END IF;
	END IF;
        
	-- INSERCION EN TABLA ITEM_POSTEO
	INSERT INTO sqlbuscador.item_posteo
		(id_termino, n_documento, frecuencia)
        VALUES (v_id_termino, p_documento, p_frecuencia);
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testProcedures` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testProcedures`(IN palabra VARCHAR(45))
BEGIN
  SELECT * FROM termino t
  WHERE t.n_termino = palabra;
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

-- Dump completed on 2018-05-05 17:55:04
