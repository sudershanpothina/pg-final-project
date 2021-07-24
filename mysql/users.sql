CREATE DATABASE  IF NOT EXISTS `userdb`;
USE `userdb`;
CREATE USER 'user001'@'%' identified by 'password12@';
GRANT ALL ON userdb.* TO 'user001'@'%';
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `userinfo` VALUES (1,'Tony Stark','tonystark001@hotmail.com'),(2,'Peter Parker','perterparker@gmail.com');
