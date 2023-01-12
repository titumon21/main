/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.5.8-log : Database - auton
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`auton` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `auton`;

/*Table structure for table `accessory_shop` */

DROP TABLE IF EXISTS `accessory_shop`;

CREATE TABLE `accessory_shop` (
  `as_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateofjoin` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'PENDING',
  `a_lat` varchar(100) DEFAULT NULL,
  `a_long` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`as_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `b_id` int(100) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(100) DEFAULT NULL,
  `card_no` varchar(100) DEFAULT NULL,
  `cvv_no` varchar(100) DEFAULT NULL,
  `pin` varchar(100) DEFAULT NULL,
  `balance` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) DEFAULT NULL,
  `pro_id` varchar(100) DEFAULT NULL,
  `pay_id` varchar(100) DEFAULT NULL,
  `quantity` int(100) DEFAULT '0',
  `posted_date` varchar(100) DEFAULT NULL,
  `amount` int(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'not paid',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Table structure for table `customer_reg` */

DROP TABLE IF EXISTS `customer_reg`;

CREATE TABLE `customer_reg` (
  `c_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateofjoin` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'APPROVED',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `fuel_request` */

DROP TABLE IF EXISTS `fuel_request`;

CREATE TABLE `fuel_request` (
  `c_rqst_id` int(20) NOT NULL AUTO_INCREMENT,
  `c_id` int(20) DEFAULT NULL COMMENT 'foriegn key customer',
  `fs_id` varchar(100) DEFAULT NULL,
  `fuel` varchar(100) DEFAULT NULL,
  `rqst_time` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'NO RQST',
  `station_rate` varchar(100) DEFAULT 'NOT_UPDATED',
  `rqst_lat` varchar(100) DEFAULT NULL,
  `rqst_long` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_rqst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

/*Table structure for table `fuel_station` */

DROP TABLE IF EXISTS `fuel_station`;

CREATE TABLE `fuel_station` (
  `fid` int(55) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `manager_name` varchar(55) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `lat` varchar(55) DEFAULT NULL,
  `long` varchar(55) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `fuel_station_reg` */

DROP TABLE IF EXISTS `fuel_station_reg`;

CREATE TABLE `fuel_station_reg` (
  `fs_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateofjoin` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'PENDING',
  `f_lat` varchar(100) DEFAULT NULL,
  `f_long` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `lat` varchar(55) DEFAULT NULL,
  `long` varchar(55) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `l_id` int(20) NOT NULL AUTO_INCREMENT,
  `reg_id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT '0',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

/*Table structure for table `mechanic` */

DROP TABLE IF EXISTS `mechanic`;

CREATE TABLE `mechanic` (
  `mid` int(55) NOT NULL AUTO_INCREMENT,
  `service_center` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  `status` varchar(55) DEFAULT 'FREE',
  `workstatus` varchar(55) DEFAULT 'FREE',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `p_id` int(100) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(100) DEFAULT NULL,
  `total_amount` int(100) DEFAULT '0',
  `posted_date` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'not paid',
  `delivery_status` varchar(100) DEFAULT 'not delivered',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `p_id` int(100) NOT NULL AUTO_INCREMENT,
  `s_id` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT 'NONE',
  `p_name` varchar(100) DEFAULT NULL,
  `p_description` varchar(100) DEFAULT NULL,
  `p_price` varchar(100) DEFAULT NULL,
  `product_image` longblob,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `service_center_request` */

DROP TABLE IF EXISTS `service_center_request`;

CREATE TABLE `service_center_request` (
  `c_rqst_id` int(20) NOT NULL AUTO_INCREMENT,
  `c_id` int(20) DEFAULT NULL COMMENT 'foriegn key customer',
  `sc_id` varchar(100) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `rqst_time` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'NO RQST',
  `rqst_lat` varchar(100) DEFAULT NULL,
  `rqst_long` varchar(100) DEFAULT NULL,
  `mechanic_id` varchar(100) DEFAULT 'NO VAL',
  PRIMARY KEY (`c_rqst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

/*Table structure for table `service_reg` */

DROP TABLE IF EXISTS `service_reg`;

CREATE TABLE `service_reg` (
  `sc_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateofjoin` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'PENDING',
  `f_lat` varchar(100) DEFAULT NULL,
  `f_long` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Table structure for table `user_reg` */

DROP TABLE IF EXISTS `user_reg`;

CREATE TABLE `user_reg` (
  `u_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateofjoin` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT '1',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `workshop` */

DROP TABLE IF EXISTS `workshop`;

CREATE TABLE `workshop` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `owner` varchar(55) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `lat` varchar(55) DEFAULT NULL,
  `long` varchar(55) DEFAULT NULL,
  `pass` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
