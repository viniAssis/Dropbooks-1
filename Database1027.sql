CREATE DATABASE `dropbooks`;

USE `dropbooks`;

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
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(20) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(75) NOT NULL,
  `bairro` varchar(75) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `Nivel_Usuario` char(1) NOT NULL,
  `Ativo` char(1) NOT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `agencia` int(6) DEFAULT NULL,
  `conta` int(6) DEFAULT NULL,
  `digito` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_cnpj_UNIQUE` (`cpf_cnpj`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

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
);

INSERT INTO `usuario` VALUES (1,'22222222222222',2,'2018-02-02','F','vini.metallica@hotmai.com','(32)42342-1414',NULL,NULL,'Vinicius Silva de Assis','05202260','22','11','11','ãPaulo','São Paulo','1001','123','3','1','Itau',1073,12000,01);
INSERT INTO `usuario` VALUES (2,'22222222222222',2,'2018-02-02','F','admin@admin.com.br','(32)42342-1414',NULL,NULL,'Administrador','05202260','22','11','11','são paulo','São Paulo','1001','admin','1','1','Itau',1073,12000,01);
INSERT INTO `usuario` VALUES (3,'22222222222222',2,'2018-02-02','F','teste@teste.com.br','(32)42342-1414',NULL,NULL,'Teste','05202260','22','11','11','são paulo','São Paulo','1001','teste','3','1','Itau',1073,12000,01);

INSERT INTO `produto` VALUES (1,'2018-09-01',0,1,'Não esta','Paulo Botelho','Proxeneta Livros Educativos','2018-09-01','Teste de alteração tutuzinho. ums porra','Português','Comédia',189,0,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `produto` VALUES (2,'2018-09-01',0,1,'Não esta','Paulo Botelho','Proxeneta Livros Educativos','2018-09-01','Teste de alteração tutuzinho. ums porra','Português','Comédia',189,0,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `produto` VALUES (3,'2018-09-01',0,1,'Não esta','Paulo Botelho','Proxeneta Livros Educativos','2018-09-01','Teste de alteração tutuzinho. ums porra','Português','Comédia',189,0,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `produto` VALUES (4,'2018-09-01',0,1,'Não esta','Paulo Botelho','Proxeneta Livros Educativos','2018-09-01','Teste de alteração tutuzinho. ums porra','Português','Comédia',189,0,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `produto` VALUES (5,'2018-09-01',0,1,'Não esta','Paulo Botelho','Proxeneta Livros Educativos','2018-09-01','Teste de alteração tutuzinho. ums porra','Português','Comédia',189,0,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `produto` VALUES (6,'2018-09-01',0,1,'Não esta','Paulo Botelho','Proxeneta Livros Educativos','2018-09-01','Teste de alteração tutuzinho. ums porra','Português','Comédia',189,0,1,NULL,NULL,NULL,NULL,NULL);

