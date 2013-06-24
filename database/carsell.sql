/*
SQLyog Trial v10.51 
MySQL - 5.5.29 : Database - carsell
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`carsell` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `carsell`;

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `carid` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `carpic` varchar(100) DEFAULT '../upload/bmw.jpg',
  `carname` varchar(80) NOT NULL,
  `price` float unsigned NOT NULL,
  `color` char(15) NOT NULL,
  `engine` varchar(20) NOT NULL,
  `stock` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`carid`),
  UNIQUE KEY `carname` (`carname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `car` */

insert  into `car`(`carid`,`carpic`,`carname`,`price`,`color`,`engine`,`stock`) values (1,'../upload/001.jpg','BMW宝马3系(进口) 2013款 320i时尚型',32.5,'雪山白','2.0T 184马力 L4',2),(2,'../upload/002.jpg','BMW宝马3系 2013款 328Li 豪华设计套装',44.9,'雪山白','2.0T 245马力 L4',1),(7,'../upload/004.jpg','BMW宝马3系 2013款 335Li 风尚设计套装',59.96,'黑色','3.0T 306马力 L6',2),(8,'../upload/005.jpg','BMW宝马5系(进口) 2013款 528i xDrive豪华型',77.3,'宝石青','2.0T 245马力 L4',2),(9,'../upload/006.jpg','BMW宝马6系 2012款 640i Gran Coupe',120.5,'磨砂棕','4.0T 408马力 V8',3),(10,'../upload/007.jpg','BMW宝马X6 2012款 xDrive50i',202.6,'雪山白','4.4T 408马力 V8',1);

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `clientid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clientname` char(8) NOT NULL,
  `clientsex` char(4) NOT NULL,
  `clientage` int(2) unsigned NOT NULL,
  `clientphone` char(11) NOT NULL,
  `clientmail` varchar(40) NOT NULL,
  `engineid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`clientid`),
  UNIQUE KEY `engineid` (`engineid`),
  CONSTRAINT `engineid` FOREIGN KEY (`engineid`) REFERENCES `sell` (`engineid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `client` */

insert  into `client`(`clientid`,`clientname`,`clientsex`,`clientage`,`clientphone`,`clientmail`,`engineid`) values (15,'杨某','男',22,'13111111111','nicejava@163.com',5312715),(22,'李开复','男',22,'18940847550','2cccc@asd.com',1234533);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `userid` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(8) NOT NULL,
  `password` varchar(16) NOT NULL,
  `sex` char(8) NOT NULL,
  `age` tinyint(2) NOT NULL,
  `loginname` varchar(16) NOT NULL,
  `department` char(8) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`userid`,`username`,`password`,`sex`,`age`,`loginname`,`department`) values (1,'管理员','admin','男',22,'admin','经理'),(21,'维修人员','wx','男',30,'wx','维修'),(22,'销售人员','2222','女',20,'xs','销售'),(23,'李雷','44444','男',34,'lilei','维修'),(24,'韩梅梅','1234567','女',34,'hanmeimei','销售'),(25,'苍井空','123456','女',38,'cangjk','销售'),(26,'小明','1223444','男',25,'xiaom','维修'),(27,'小刘','123','男',34,'xiaoliu','维修'),(28,'小李','123444','男',45,'xiaoli','维修'),(29,'小杨','12333','男',45,'xiaoyang','维修'),(30,'小陈','12312312','男',33,'xiaochen','销售'),(31,'阿金','1123','男',33,'ajin','经理'),(33,'陈一舟','123','男',33,'chenyi','维修'),(35,'冯书记','4444','男',33,'feng','维修'),(38,'李小璐','123123','男',33,'lixiaolu','经理');

/*Table structure for table `sell` */

DROP TABLE IF EXISTS `sell`;

CREATE TABLE `sell` (
  `engineid` int(10) unsigned NOT NULL,
  `selldate` date NOT NULL,
  `carid` int(10) unsigned DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`engineid`),
  KEY `carid` (`carid`),
  KEY `userid` (`userid`),
  CONSTRAINT `carid` FOREIGN KEY (`carid`) REFERENCES `car` (`carid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `employee` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sell` */

insert  into `sell`(`engineid`,`selldate`,`carid`,`userid`) values (1234533,'2013-08-07',2,24),(1234563,'2013-06-22',2,22),(1234567,'2013-06-22',2,22),(3333333,'2013-08-07',2,24),(3445533,'2013-01-01',2,22),(5312715,'2013-01-01',1,22);

/*Table structure for table `service` */

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `serid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serdate` date NOT NULL,
  `serstate` char(5) NOT NULL DEFAULT '预约',
  `clientid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`serid`),
  KEY `clientid` (`clientid`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `client` (`clientid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `service` */

insert  into `service`(`serid`,`serdate`,`serstate`,`clientid`) values (4,'2013-06-17','完成',15),(6,'2013-06-20','完成',15),(7,'2013-06-25','预约',22);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
