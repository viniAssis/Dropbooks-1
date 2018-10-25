CREATE DATABASE  IF NOT EXISTS `dropbooks` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dropbooks`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dropbooks
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
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(75) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `perfil` tinyint(1) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `sexo` char(1) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `cep` varchar(10) NOT NULL,
  `numero` int(6) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(75) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(75) NOT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `agencia` int(6) DEFAULT NULL,
  `conta` int(6) DEFAULT NULL,
  `digito` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataRegistro` date NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `quantidade` int(11) unsigned NOT NULL,
  `titulo` varchar(300) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `editora` varchar(100) NOT NULL,
  `dataPublicacao` date NOT NULL,
  `descricao` varchar(2000) NOT NULL,
  `idioma` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `preco` float NOT NULL,
  `visualizacoes` int(11) DEFAULT '0',
  `id_usuario` int(11) NOT NULL,
  `imagem_1` mediumblob,
  `imagem_2` mediumblob,
  `imagem_3` mediumblob,
  `imagem_4` mediumblob,
  `imagem_5` mediumblob,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` varchar(30) NOT NULL,
  `tipoPessoa` tinyint(1) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  `nomeRazao` varchar(45) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(20) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(75) NOT NULL,
  `bairro` varchar(75) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `Nivel_Usuario` char(1) NOT NULL,
  `Ativo` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_cnpj_UNIQUE` (`cpf_cnpj`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'dropbooks'
--

--
-- Dumping routines for database 'dropbooks'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-25 12:04:54
