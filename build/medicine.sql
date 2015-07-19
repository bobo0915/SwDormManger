/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.28 : Database - medicine
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`medicine` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `medicine`;

/*Table structure for table `tb_category` */

DROP TABLE IF EXISTS `tb_category`;

CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_category` */

insert  into `tb_category`(`id`,`name`,`description`,`createTime`) values (1,'感冒用药','主治感冒、发烧、头痛。','2015-06-20 09:51:10'),(2,'胃肠用药','胃炎、肠炎专用药。','2015-06-20 09:51:10'),(3,'儿童用药','慎用，儿童用药。','2015-06-20 09:51:10');

/*Table structure for table `tb_medicine` */

DROP TABLE IF EXISTS `tb_medicine`;

CREATE TABLE `tb_medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medNo` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `factoryAdd` varchar(200) DEFAULT NULL,
  `description` text,
  `price` double NOT NULL,
  `medCount` int(11) DEFAULT NULL,
  `reqCount` int(11) DEFAULT NULL,
  `photoPath` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medNo` (`medNo`),
  KEY `FKCB73D4EB5CE1611D` (`categoryId`),
  CONSTRAINT `FKCB73D4EB5CE1611D` FOREIGN KEY (`categoryId`) REFERENCES `tb_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_medicine` */

insert  into `tb_medicine`(`id`,`medNo`,`name`,`factoryAdd`,`description`,`price`,`medCount`,`reqCount`,`photoPath`,`categoryId`) values (1,'abc001','感冒胶囊A','制药一厂','效果很好',2.5,3,0,NULL,1),(2,'abc002','感冒胶囊B','制药一厂','治疗伤风、头痛效果很好',10.05,10,0,NULL,1),(3,'abc003','xx肠炎灵','制药二厂','主治拉肚子',5.8,100,0,NULL,2),(4,'abc004','小儿感冒冲剂','制药三厂','效果很好',5.8,100,0,NULL,3);

/*Table structure for table `tb_menus` */

DROP TABLE IF EXISTS `tb_menus`;

CREATE TABLE `tb_menus` (
  `CODE` varchar(96) DEFAULT NULL,
  `PCODE` varchar(96) DEFAULT NULL,
  `MNAME` varchar(300) DEFAULT NULL,
  `URL` varchar(600) DEFAULT NULL,
  `TOUSE` char(3) DEFAULT NULL,
  `display_order` int(4) DEFAULT NULL,
  `icon_path` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_menus` */

/*Table structure for table `tb_selldetail` */

DROP TABLE IF EXISTS `tb_selldetail`;

CREATE TABLE `tb_selldetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellName` varchar(200) NOT NULL,
  `sellPrice` double NOT NULL,
  `sellCount` int(11) NOT NULL,
  `sellTime` datetime NOT NULL,
  `medid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK56C63894822F277` (`userid`),
  KEY `FK56C63894DD16E7A7` (`medid`),
  CONSTRAINT `FK56C63894DD16E7A7` FOREIGN KEY (`medid`) REFERENCES `tb_medicine` (`id`),
  CONSTRAINT `FK56C63894822F277` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_selldetail` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`username`,`password`,`createTime`) values (1,'admin','admin','2015-06-20 09:51:10'),(2,'刘波','123','2015-06-20 16:03:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
