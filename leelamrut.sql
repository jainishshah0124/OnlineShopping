/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.28 : Database - leelamrut
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`leelamrut` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `leelamrut`;

/*Table structure for table `adresses` */

DROP TABLE IF EXISTS `adresses`;

CREATE TABLE `adresses` (
  `address_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pin` int(10) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `adresses` */

insert  into `adresses`(`address_id`,`user_id`,`address`,`pin`) values (1,14,'shitanshu appts',380013),(3,14,'Vasupujya',380013),(9,18,'7,shitanshu appartment\r\nNear,Darpan Six Road,Naranpura380013',380013),(10,19,'jaymagal society,  naranpura, ahmedabad380013',380013),(11,20,'tower380013',380013);

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `city` */

insert  into `city`(`city_id`,`city_name`,`state_id`) values (1,'Ahmedabad',1),(2,'Surat',1),(3,'Mumbai',3),(4,'Udaipur',4),(5,'Mehsana',1),(10,'Vadodara',1),(11,'Jamnagar',1),(12,'Rajkot',1),(13,'Nadiad',1),(14,'Anand',1),(15,'Bhavnagar',1),(16,'Porbandar',1),(17,'Surendranagar',1),(18,'Vapi',1),(19,'Mandvi',1),(20,'Dakor',1),(21,'Talod',1),(22,'Bardoli',1),(23,'Utter Sanda',1),(24,'Ratlam',32),(25,'Bhuj-Kutch',1),(26,'Hyderabad',11),(27,'Indor',32),(28,'Vadhwan',1),(29,'Bhadran',1),(30,'Khambhat',1);

/*Table structure for table `delivery_type` */

DROP TABLE IF EXISTS `delivery_type`;

CREATE TABLE `delivery_type` (
  `deliverytype_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `amount` float(5,2) NOT NULL,
  PRIMARY KEY (`deliverytype_id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `delivery_type` */

insert  into `delivery_type`(`deliverytype_id`,`type`,`amount`) values (1,'Cash On Delivery',0.00),(2,'In A Day Delivery',100.00);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_ibfk_1` (`username`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`username`) REFERENCES `register` (`username`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

/*Table structure for table `feedback_product` */

DROP TABLE IF EXISTS `feedback_product`;

CREATE TABLE `feedback_product` (
  `feedback_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`feedback_product_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feedback_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `feedback_product_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `feedback_product` */

insert  into `feedback_product`(`feedback_product_id`,`product_id`,`user_id`,`description`,`date`) values (1,4,14,'best','2015-05-16 13:05:51'),(2,4,14,'worst','2015-05-16 13:08:31');

/*Table structure for table `inquiry` */

DROP TABLE IF EXISTS `inquiry`;

CREATE TABLE `inquiry` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `message` varchar(50) NOT NULL,
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `inquiry` */

insert  into `inquiry`(`inquiry_id`,`name`,`email`,`phone`,`address`,`message`) values (1,'Jainish','jainish@gmail.com',191891189,'jainsih','jainsih'),(2,'Krupal Joshi','it.krupal@gmail.com',1982918291,'naranpura','hiahsidhai');

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `address` varchar(40) NOT NULL,
  `mobile_no` bigint(12) NOT NULL,
  `deliverytype_id` int(11) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoice_ibfk_3` (`product_id`),
  KEY `invoice_ibfk_1` (`user_id`),
  KEY `invoice_ibfk_2` (`order_id`),
  KEY `deliverytype_id` (`deliverytype_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`deliverytype_id`) REFERENCES `delivery_type` (`deliverytype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `invoice` */

insert  into `invoice`(`invoice_id`,`user_id`,`order_id`,`product_id`,`time`,`amount`,`address`,`mobile_no`,`deliverytype_id`) values (10,14,11,2,'2015-05-14 18:27:17','100.00','Vasupujya 380013',9828102918,1),(11,14,12,4,'2015-05-14 18:27:18','130.00','sarjan tower',2918291822,1),(12,14,13,5,'2015-05-14 18:27:19','65.00','shitanshu appts 380013',1829182918,1),(13,14,14,6,'2015-05-14 18:27:20','60.00','shitanshu appts 380013',1821928121,1),(14,14,15,10,'2015-05-14 18:27:21','55.00','Vasupujya 380013',1828282738,1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(80) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `mobile_no` bigint(12) NOT NULL,
  `e_mail` varchar(40) NOT NULL,
  `deliverytype_id` int(11) NOT NULL,
  `order_time` datetime NOT NULL,
  `order_confirmed` int(11) NOT NULL DEFAULT '0',
  `approval` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `orders_ibfk_2` (`deliverytype_id`),
  KEY `orders_ibfk_1` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `city_id` (`city_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`deliverytype_id`) REFERENCES `delivery_type` (`deliverytype_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`user_id`,`product_id`,`product_quantity`,`name`,`address`,`state_id`,`city_id`,`mobile_no`,`e_mail`,`deliverytype_id`,`order_time`,`order_confirmed`,`approval`,`amount`) values (11,14,2,1,'Jainish Shah','Vasupujya 380013',1,1,9828102918,'jainishshah0124@gmail.com',1,'2015-05-14 17:42:02',1,1,100),(12,14,4,2,'Krupal Shah','sarjan tower',1,1,2918291822,'kruapl@gmail.com',1,'2015-05-14 18:10:28',1,1,200),(13,14,5,1,'ankit','shitanshu appts 380013',1,1,1829182918,'aji@gmail.com',1,'2015-05-14 18:11:39',1,1,65),(14,14,6,1,'Jainish 0013 Shah','shitanshu appts 380013',1,1,1821928121,'jainishshah0124@gmail.com',1,'2015-05-14 18:12:06',1,1,60),(15,14,10,1,'mitul','Vasupujya 380013',1,1,1828282738,'jainishshah0124@gmail.com',1,'2015-05-14 18:13:43',1,1,55),(16,14,5,1,'anoop','Vasupujya 380013',1,1,1921829128,'jainishshah0124@gmail.com',1,'2015-05-14 18:14:04',0,1,65),(17,14,19,1,'Jainish Shah','shitanshu appts 380013',1,1,1281821728,'jainishshah0124@gmail.com',1,'2015-05-14 18:15:45',0,1,80),(18,14,25,1,'anoop','shitanshu appts 380013',1,1,1921828912,'isjiaj@gmail.com',1,'2015-05-14 18:16:10',0,1,45),(19,14,25,1,'Jainish Shah','shitanshu appts 380013',1,1,1281921829,'jainishshah0124@gmail.com',1,'2015-05-14 18:16:33',0,1,45),(20,14,28,1,'anoop','Vasupujya 380013',1,1,1828128182,'jainishshah0124@gmail.com',1,'2015-05-14 18:18:32',0,1,70),(21,14,3,1,'Jainish Shah','Vasupujya 380013',1,1,1828121281,'jainishshah0124@gmail.com',1,'2015-05-14 18:19:02',0,0,65),(22,14,2,1,'Jainish Shah','Vasupujya 380013',1,1,8281821281,'jainishshah0124@gmail.com',1,'2015-05-14 18:22:26',0,0,100),(23,14,5,1,'krupal','Vasupujya 380013',1,1,1128182182,'jainishshah0124@gmail.com',1,'2015-05-14 18:23:03',0,0,65),(24,14,10,1,'Jainish Shah','Vasupujya 380013',1,1,1291821928,'jainishshah0124@gmail.com',2,'2015-05-14 18:23:30',0,0,55),(25,14,4,1,'Jainish Shah','shitanshu appts 380013',1,1,1921821928,'jainishshah0124@gmail.com',2,'2015-05-14 18:24:33',0,0,65),(27,14,2,1,'Jainish','Vasupujya 380013',1,1,1928129182,'jainishshah0124@gmail.com',2,'2015-05-14 19:38:08',0,0,100);

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `productimage_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(50) NOT NULL,
  PRIMARY KEY (`productimage_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=latin1;

/*Data for the table `product_image` */

insert  into `product_image`(`productimage_id`,`product_id`,`image_url`) values (392,1,'Upload/product_image/1.JPG'),(393,2,'Upload/product_image/2.JPG'),(394,3,'Upload/product_image/3.JPG'),(395,4,'Upload/product_image/4.JPG'),(396,5,'Upload/product_image/5.JPG'),(397,6,'Upload/product_image/6.JPG'),(398,7,'Upload/product_image/7.JPG'),(399,8,'Upload/product_image/8.JPG'),(400,9,'Upload/product_image/9.JPG'),(401,10,'Upload/product_image/10.JPG'),(402,11,'Upload/product_image/11.JPG'),(403,13,'Upload/product_image/13.JPG'),(404,14,'Upload/product_image/14.JPG'),(405,15,'Upload/product_image/15.JPG'),(406,16,'Upload/product_image/16.JPG'),(407,17,'Upload/product_image/17.JPG'),(408,18,'Upload/product_image/18.JPG'),(409,19,'Upload/product_image/19.JPG'),(410,20,'Upload/product_image/20.JPG'),(411,21,'Upload/product_image/21.JPG'),(412,22,'Upload/product_image/22.JPG'),(413,23,'Upload/product_image/23.JPG'),(414,24,'Upload/product_image/24.JPG'),(415,25,'Upload/product_image/25.JPG'),(416,26,'Upload/product_image/26.JPG'),(417,27,'Upload/product_image/27.JPG'),(418,28,'Upload/product_image/28.JPG'),(419,29,'Upload/product_image/29.JPG'),(420,30,'Upload/product_image/30.JPG'),(421,31,'Upload/product_image/31.JPG'),(422,32,'Upload/product_image/32.JPG'),(423,33,'Upload/product_image/33.JPG'),(424,34,'Upload/product_image/34.JPG'),(425,35,'Upload/product_image/35.JPG'),(426,36,'Upload/product_image/36.JPG'),(427,37,'Upload/product_image/37.JPG'),(428,38,'Upload/product_image/38.JPG'),(429,39,'Upload/product_image/39.JPG'),(430,40,'Upload/product_image/40.JPG'),(431,41,'Upload/product_image/41.JPG'),(432,42,'Upload/product_image/42.JPG'),(433,43,'Upload/product_image/43.JPG'),(434,44,'Upload/product_image/44.JPG'),(435,45,'Upload/product_image/45.JPG'),(436,46,'Upload/product_image/46.JPG'),(437,47,'Upload/product_image/47.JPG'),(438,48,'Upload/product_image/48.JPG'),(439,49,'Upload/product_image/49.JPG'),(440,50,'Upload/product_image/50.JPG'),(441,51,'Upload/product_image/51.JPG'),(442,52,'Upload/product_image/52.JPG'),(443,53,'Upload/product_image/53.JPG'),(444,54,'Upload/product_image/54.JPG'),(445,55,'Upload/product_image/55.JPG'),(446,56,'Upload/product_image/56.JPG'),(447,57,'Upload/product_image/57.JPG'),(448,58,'Upload/product_image/58.JPG'),(449,59,'Upload/product_image/59.JPG'),(450,60,'Upload/product_image/60.JPG'),(451,61,'Upload/product_image/61.JPG'),(452,62,'Upload/product_image/62.JPG'),(453,63,'Upload/product_image/63.JPG'),(454,64,'Upload/product_image/64.JPG'),(455,65,'Upload/product_image/65.JPG'),(456,66,'Upload/product_image/66.JPG'),(457,67,'Upload/product_image/67.JPG'),(458,68,'Upload/product_image/68.JPG'),(459,69,'Upload/product_image/69.JPG'),(460,70,'Upload/product_image/70.JPG'),(461,71,'Upload/product_image/71.JPG'),(462,72,'Upload/product_image/72.JPG'),(463,73,'Upload/product_image/73.JPG'),(464,74,'Upload/product_image/74.JPG'),(465,75,'Upload/product_image/75.JPG'),(466,76,'Upload/product_image/76.JPG'),(467,77,'Upload/product_image/77.JPG'),(468,78,'Upload/product_image/78.JPG'),(469,79,'Upload/product_image/79.JPG'),(470,80,'Upload/product_image/80.JPG'),(471,81,'Upload/product_image/81.JPG'),(472,82,'Upload/product_image/82.JPG'),(473,83,'Upload/product_image/83.JPG'),(474,84,'Upload/product_image/84.JPG'),(475,85,'Upload/product_image/85.JPG'),(476,86,'Upload/product_image/86.JPG'),(477,87,'Upload/product_image/87.JPG'),(478,88,'Upload/product_image/88.JPG'),(479,89,'Upload/product_image/89.JPG'),(480,90,'Upload/product_image/90.JPG'),(481,91,'Upload/product_image/91.JPG'),(482,92,'Upload/product_image/92.JPG'),(483,93,'Upload/product_image/93.JPG'),(484,94,'Upload/product_image/94.JPG'),(485,95,'Upload/product_image/95.JPG'),(486,96,'Upload/product_image/96.JPG'),(487,97,'Upload/product_image/97.JPG'),(488,98,'Upload/product_image/98.JPG'),(489,99,'Upload/product_image/99.JPG'),(490,100,'Upload/product_image/100.JPG'),(491,101,'Upload/product_image/101.JPG'),(492,102,'Upload/product_image/102.JPG'),(493,103,'Upload/product_image/103.JPG'),(494,104,'Upload/product_image/104.JPG'),(495,105,'Upload/product_image/105.JPG'),(496,106,'Upload/product_image/106.JPG'),(497,107,'Upload/product_image/107.JPG'),(498,108,'Upload/product_image/108.JPG'),(499,109,'Upload/product_image/109.JPG'),(500,110,'Upload/product_image/110.JPG'),(501,111,'Upload/product_image/111.JPG'),(502,112,'Upload/product_image/112.JPG'),(503,113,'Upload/product_image/113.JPG'),(504,114,'Upload/product_image/114.JPG'),(505,115,'Upload/product_image/115.JPG'),(506,116,'Upload/product_image/116.JPG'),(507,117,'Upload/product_image/117.JPG'),(508,118,'Upload/product_image/118.JPG'),(509,119,'Upload/product_image/119.JPG'),(510,120,'Upload/product_image/120.JPG'),(511,121,'Upload/product_image/121.JPG'),(512,122,'Upload/product_image/122.JPG'),(513,123,'Upload/product_image/123.JPG'),(514,124,'Upload/product_image/124.JPG'),(515,125,'Upload/product_image/125.JPG'),(516,126,'Upload/product_image/126.JPG'),(517,127,'Upload/product_image/127.JPG'),(518,128,'Upload/product_image/128.JPG'),(519,129,'Upload/product_image/129.JPG'),(520,130,'Upload/product_image/130.JPG'),(521,131,'Upload/product_image/131.JPG'),(522,132,'Upload/product_image/132.JPG'),(523,133,'Upload/product_image/133.JPG'),(524,134,'Upload/product_image/134.JPG'),(525,135,'Upload/product_image/135.JPG'),(526,136,'Upload/product_image/136.JPG'),(527,137,'Upload/product_image/137.JPG');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) NOT NULL,
  `product_price` decimal(11,2) NOT NULL,
  `city_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `weight` int(4) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `city_id` (`city_id`),
  KEY `product_name` (`product_name`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`product_id`,`product_name`,`product_price`,`city_id`,`product_quantity`,`weight`) values (1,'Lilo Chavdo','55.00',10,120,200),(2,'Lilo Chavdo','100.00',10,100,400),(3,'Jain Bhakharwadi','65.00',10,100,250),(4,'Biscuit Bhakharwadi','65.00',10,100,250),(5,'Phoolvadi','65.00',10,100,250),(6,'Mathia Sev','60.00',10,100,250),(7,'Methi Puri','60.00',10,100,250),(8,'Masala Papdi','50.00',10,100,200),(9,'Fudina Sev','40.00',10,100,200),(10,'Roasted Bhakharwadi','55.00',10,100,200),(11,'Roasted Wheat Methi Puri','55.00',10,100,200),(13,'Roasted Kothmir Mirch Puri','55.00',10,100,200),(14,'Roasted Bajri Methi Puri','55.00',10,100,200),(15,'Wheat Methi Puri','30.00',10,100,200),(16,'Kothmir Mirchi Puri','30.00',10,100,200),(17,'Dry Kachori','60.00',11,100,250),(18,'Dry Kachori','120.00',11,100,250),(19,'Kachori Dryfruit Tin','80.00',11,100,200),(20,'Kachori Dryfruit Tin','160.00',11,100,400),(21,'Potato Masala Wafer','45.00',12,100,250),(22,'Potato Mori Wafer','45.00',12,100,250),(23,'Pauha Chivda','40.00',12,100,250),(24,'Lili Chatni','15.00',12,100,100),(25,'Nadiadi Mix Chavana','45.00',13,100,200),(26,'Nadiadi Mix Chavana','65.00',13,100,300),(27,'Nadiadi Mix Chavana','95.00',13,100,400),(28,'Soan Papdi','70.00',14,100,200),(29,'Afghan Laddu','150.00',14,100,200),(30,'Anjir Meva','150.00',14,100,200),(31,'Honey Bite','200.00',14,100,200),(32,'Thor','110.00',14,100,200),(33,'Gulabjamun Tin','200.00',14,100,1000),(34,'Rasgulla Tin','200.00',14,100,1000),(35,'Rich Almond Nankhatai','110.00',14,100,275),(36,'Kaju Puri','110.00',14,100,100),(37,'Badam Puri','140.00',14,100,100),(38,'Roasted Premium Mix','55.00',14,100,200),(39,'Roasted Navratna Mix','55.00',14,100,200),(40,'Roasted Chana Chor','55.00',14,100,200),(41,'Roasted Moong Dal','55.00',14,100,200),(42,'Roasted Moong Jor','55.00',14,100,200),(43,'Roasted Khatta Mitha','55.00',14,100,200),(44,'Roasted Wheat White','55.00',14,100,200),(45,'Roasted Moong','55.00',14,100,200),(46,'Roasted Chana Dal','55.00',14,100,200),(47,'Jalebi Sev','60.00',14,100,200),(48,'Miltigrain Chakri','60.00',14,100,200),(49,'Rajwadi DalMuth','130.00',14,100,400),(50,'Banana Yellow Wafer','55.00',14,100,200),(51,'Farali Tikha Chivda','60.00',14,100,200),(52,'Farali Mora Chivda','60.00',14,100,200),(53,'Farali Biscuit','50.00',14,100,200),(54,'Mari Masala Ganthiya','60.00',15,100,250),(55,'Tamtam Gathiya','60.00',15,100,200),(56,'Jina Gathiya','60.00',15,100,250),(57,'Tikha Jada Gathiya','60.00',15,100,250),(58,'A-1 Chat Masala','45.00',15,100,150),(59,'Pickle Kerda','50.00',15,100,200),(60,'Pickle Gunda','50.00',15,100,200),(61,'Pickle Mix Khatu','50.00',15,100,200),(62,'Pickle Mango Khatu','50.00',15,100,200),(63,'Pickle Rajwadi Gorkeri','60.00',15,100,250),(64,'Pickle Chundo','60.00',15,100,250),(65,'Masala Khajli','90.00',16,100,500),(66,'Mori Khajli','80.00',16,100,500),(67,'Sev Mamra','35.00',17,100,200),(68,'Sing','30.00',17,100,200),(69,'Sing','75.00',17,100,500),(70,'Sing Vaccum Pack','32.00',17,100,200),(71,'Sing Vaccum Pack','80.00',17,100,500),(72,'Butter Khari','60.00',18,100,200),(73,'Irani Butter Khari','60.00',18,100,200),(74,'Makhania Biscuits','60.00',18,100,200),(75,'Mix Nankhatai','95.00',18,100,400),(76,'Butter Biscuits','60.00',18,100,200),(77,'Methi Khari','60.00',18,100,200),(78,'Cake Toast','60.00',18,100,200),(79,'Dabeli Masala','65.00',19,100,250),(80,'Gota Instant Mix','60.00',20,100,500),(81,'Khaman Instant Mix','60.00',20,100,500),(82,'Handwa Instant Mix','49.00',21,100,500),(83,'Khaman Instant Mix','60.00',21,100,500),(84,'Khaman Instant Mix','31.00',21,100,200),(85,'Dahiwada Instant Mix','65.00',21,100,500),(86,'Idli Instant Mix','49.00',21,100,500),(87,'Gota Instant Mix','60.00',21,100,500),(88,'Dalwada Instant Mix','70.00',21,100,500),(89,'Dhosa Instant Mix','60.00',21,100,500),(90,'Upma Instant Mix','18.00',21,100,200),(91,'Khichu Instant Mix','18.00',21,100,200),(92,'Dholka Instant Mix','49.00',21,100,500),(93,'Dry Patra','65.00',22,100,250),(94,'Ice Halwa','160.00',3,100,250),(95,'Golden Halwa','170.00',3,100,250),(96,'Banana Mari Wafer','55.00',3,100,200),(97,'Banana Wafer Without Salt','55.00',3,100,200),(98,'Banana Chilli Wafer','55.00',3,100,200),(99,'Wheat Flakes Chivda','50.00',3,100,250),(100,'Mukhwas Dhanadal','55.00',1,100,200),(101,'Mukhwas Calcutti Pan','65.00',1,100,200),(102,'Mukhwas Gujarati Namkin','55.00',1,100,200),(103,'Mukhwas Special Roasted','55.00',1,100,200),(104,'Mukhwas Drashadi Vati','45.00',1,100,200),(105,'Mukhwas Roasted Alsi','40.00',1,100,200),(106,'Mukhwas Sweet Avala','50.00',1,100,200),(107,'Mukhwas Gotli','55.00',1,100,200),(108,'Methi Khakhra','40.00',1,100,200),(109,'Masala Khakhra','40.00',1,100,200),(110,'Kashmir Kothmir Chilly Khakhra','40.00',1,100,200),(111,'Plain Khakhra','40.00',1,100,200),(112,'Jeera Khakhra','40.00',1,100,200),(113,'Pani Puri Khakhra','40.00',1,100,200),(114,'Pav Bhaji Khakhra','40.00',1,100,200),(115,'Biscuit Khakhra','40.00',1,100,200),(116,'Diet Khakhra','40.00',1,100,200),(117,'Chat Chatpat Khakhra','40.00',1,100,200),(118,'Ratalami Sev','60.00',24,100,250),(119,'Khavda-Pakvan','115.00',25,100,500),(120,'Fruit Biscuit','150.00',26,100,400),(121,'Cashew Biscuit','160.00',26,100,400),(122,'Pista Biscuit','170.00',26,100,400),(123,'Chocolate Cashw Biscuit','160.00',26,100,400),(124,'Indori Mix Chavana','40.00',27,100,250),(125,'Vadhwani Athela Marcha','30.00',28,100,200),(126,'Opera\'s Mung','45.00',29,100,200),(127,'Sutterfeni','130.00',30,100,250),(128,'Halwason','130.00',30,100,250),(129,'Papad Chavana','60.00',30,100,250),(130,'Kirtiraj Mathiya','80.00',23,100,500),(131,'Kirtiraj Chorafali','70.00',23,100,500),(132,'Single Mari Papad','40.00',23,100,250),(133,'Double Mari Papad','40.00',23,100,250),(134,'Jeera Papad','35.00',23,100,250),(135,'Rajwadi Papad','40.00',23,100,250),(136,'Nilon Sev','40.00',23,100,250),(137,'Chapta Mung ','40.00',23,100,200);

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `country_name` varchar(6) NOT NULL DEFAULT 'India',
  `state_id` int(11) NOT NULL,
  `mobile_no` bigint(12) NOT NULL,
  `birth_date` date NOT NULL,
  `e_mail` varchar(40) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `username` varchar(30) NOT NULL,
  `role_id` int(1) NOT NULL DEFAULT '2',
  `password` blob NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_ibfk_1` (`role_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`),
  CONSTRAINT `register_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`user_id`,`first_name`,`last_name`,`address`,`country_name`,`state_id`,`mobile_no`,`birth_date`,`e_mail`,`gender`,`username`,`role_id`,`password`) values (14,'Jainish','Shah','7,shitanshu appartment\r\nNear,Darpan Six Road,Naranpura','India',1,91829182,'2015-01-20','jainishshah0124@gmail.com','Male','jainish0124',2,'Ωèeã•8\"º‚Fı„3'),(15,'Jainish','Shah','Naranpura','India',1,89281,'1997-06-24','jaisin@gmail.com','Male','jainish',2,'Õß84yD»“k€3ø\"n'),(18,'Jainish','Shah','7,shitanshu appartment\r\nNear,Darpan Six Road,Naranpura380013','India',1,9129129182,'1111-01-01','jainishsh24@gmail.com','Male','jainish14',2,'Ωèeã•8\"º‚Fı„3'),(19,'john','cena','jaymagal society,  naranpura, ahmedabad380013','India',1,9825098250,'1997-04-18','jcena@gmail.com','Male','cena007',2,'í…Tı’f∂¡·√úó*À«'),(20,'Alice','Solanki','tower380013','India',1,1201921021,'1211-01-01','alice@gmail.com','Male','alicesolanki',2,'üK£MÅ¸-Gß4Û%\r‡');

/*Table structure for table `request_product` */

DROP TABLE IF EXISTS `request_product`;

CREATE TABLE `request_product` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `product_id` int(11) NOT NULL,
  `productimage_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `request_product_ibfk_1` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `productimage_id` (`productimage_id`),
  CONSTRAINT `request_product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`),
  CONSTRAINT `request_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `request_product_ibfk_3` FOREIGN KEY (`productimage_id`) REFERENCES `product_image` (`productimage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `request_product` */

/*Table structure for table `role_master` */

DROP TABLE IF EXISTS `role_master`;

CREATE TABLE `role_master` (
  `role_id` int(1) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `role_master` */

insert  into `role_master`(`role_id`,`rolename`) values (1,'Admin'),(3,'Shop Keeper'),(2,'User');

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(30) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `state` */

insert  into `state`(`state_id`,`state_name`) values (1,'Gujarat'),(2,'Rajasthan'),(3,'Maharashtra'),(4,'Uttar Pradesh'),(5,'Jammu And Kashmir'),(6,'Karnataka'),(7,'Andhra Pradesh'),(8,'Odisha'),(9,'Chhattisgarh'),(10,'Tamil Nadu'),(11,'Telangana'),(12,'Bihar'),(13,'West Bengal'),(14,'Arunachal Pradesh'),(15,'Jharkhand'),(16,'Assam'),(17,'Himachal Pradesh'),(18,'Uttarakhand'),(19,'Punjab'),(20,'Haryana'),(21,'Kerala'),(22,'Meghalaya'),(23,'Manipur'),(24,'Mizoram'),(25,'Nagaland'),(26,'Tripura'),(27,'Sikkim'),(28,'Goa'),(29,'Delhi'),(30,'Puducherry'),(31,'Chandigarh'),(32,'Madhya Pradesh');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` blob NOT NULL,
  `rolename` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `rolename` (`rolename`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`username`) REFERENCES `register` (`username`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`rolename`) REFERENCES `role_master` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`rolename`) values (10,'jainish0124','Ωèeã•8\"º‚Fı„3','User'),(12,'jainish','Õß84yD»“k€3ø\"n','Admin'),(15,'jainish14','Ωèeã•8\"º‚Fı„3','User'),(16,'cena007','í…Tı’f∂¡·√úó*À«','User'),(17,'alicesolanki','üK£MÅ¸-Gß4Û%\r‡','User');

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `wishlist_ibfk_1` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wishlist` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
