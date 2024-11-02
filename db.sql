/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - bangongyongpinguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bangongyongpinguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bangongyongpinguanli`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/gongchengcailiao/upload/1614999756013.jpg'),(2,'picture2','http://localhost:8080/gongchengcailiao/upload/1614999769770.jpg'),(3,'picture3','http://localhost:8080/gongchengcailiao/upload/1614999778981.jpg'),(6,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-02-25 11:41:54'),(2,'sex_types','性别',2,'女',NULL,'2021-02-25 11:41:54'),(3,'goods_types','物品种类',1,'食品',NULL,'2021-03-23 14:17:49'),(4,'goods_types','物品种类',2,'水果',NULL,'2021-03-23 14:17:49'),(5,'goods_types','物品种类',3,'日用品',NULL,'2021-03-23 14:17:49'),(6,'goods_types','物品种类',4,'饮料',NULL,'2021-03-23 14:17:49'),(7,'goods_types','物品种类',5,'文具',NULL,'2021-03-23 14:17:49'),(8,'goods_types','物品种类',6,'其他',NULL,'2021-03-23 14:17:49'),(9,'order_types','操作类型',1,'出库',NULL,'2021-03-23 14:50:02'),(10,'order_types','操作类型',2,'入库',NULL,'2021-03-23 14:50:51');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '物品名字 Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '物品种类  Search111 ',
  `goods_number` int(11) DEFAULT NULL COMMENT '用品库存  Search111 ',
  `astrict_num` int(11) DEFAULT NULL COMMENT '限制领用数量',
  `goods_photo` varchar(200) DEFAULT NULL COMMENT '用品图片',
  `danwei` varchar(200) DEFAULT NULL COMMENT '单位',
  `danjia` decimal(10,2) DEFAULT NULL COMMENT '单价 Search111 ',
  `goods_content` varchar(200) DEFAULT NULL COMMENT '用品详情',
  `flag` int(11) DEFAULT NULL COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用品信息';

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_name`,`goods_types`,`goods_number`,`astrict_num`,`goods_photo`,`danwei`,`danjia`,`goods_content`,`flag`,`create_time`) values (1,'水杯',3,0,1,'http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616482152033.jpg','个',NULL,'123\r\n',1,'2021-03-23 14:49:15'),(2,'笔记本',5,0,NULL,'http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616482793762.jpg','本',NULL,'123\r\n',2,'2021-03-23 14:59:58'),(3,'笔',5,20,2,'http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616482814705.webp','支',NULL,'123\r\n',1,'2021-03-23 15:00:37'),(4,'泡面',1,30,5,'http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616482856478.jpg','桶',NULL,'123\r\n',1,'2021-03-23 15:01:02'),(5,'螺蛳粉',1,117,3,'http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616482879121.jpg','包',NULL,'123\r\n',1,'2021-03-23 15:01:25'),(6,'笔记本',5,10,1,'http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616487431764.jpg','本',NULL,'123\r\n',1,'2021-03-23 16:17:13'),(7,'奥利奥',1,90,10,'http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616490553226.jpg','包',NULL,'123\r\n',1,'2021-03-23 17:09:17');

/*Table structure for table `in_out_order` */

DROP TABLE IF EXISTS `in_out_order`;

CREATE TABLE `in_out_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_name` varchar(200) DEFAULT NULL COMMENT '订单名  Search111 ',
  `caozuo_name` varchar(200) DEFAULT NULL COMMENT '操作人姓名  Search111 ',
  `caozuo_table` varchar(200) DEFAULT NULL COMMENT '操作人所在表名',
  `order_types` int(11) DEFAULT NULL COMMENT '类型  Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '出入库时间  Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='出入库订单';

/*Data for the table `in_out_order` */

insert  into `in_out_order`(`id`,`order_name`,`caozuo_name`,`caozuo_table`,`order_types`,`insert_time`,`create_time`) values (3,'123','admin','users',2,'2021-03-23 15:01:48','2021-03-23 15:01:48'),(4,'购买奥利奥','admin','users',2,'2021-03-23 17:10:26','2021-03-23 17:10:26'),(5,'添加物资','admin','users',2,'2021-03-23 17:11:28','2021-03-23 17:11:28');

/*Table structure for table `in_out_order_list` */

DROP TABLE IF EXISTS `in_out_order_list`;

CREATE TABLE `in_out_order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `in_out_order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '物资表id',
  `order_number` int(11) DEFAULT NULL COMMENT '数量  Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='出入库订单详情';

/*Data for the table `in_out_order_list` */

insert  into `in_out_order_list`(`id`,`in_out_order_id`,`goods_id`,`order_number`,`create_time`) values (3,3,5,123,'2021-03-23 15:01:48'),(4,4,7,100,'2021-03-23 17:10:26'),(5,5,3,20,'2021-03-23 17:11:28'),(6,5,4,30,'2021-03-23 17:11:28'),(7,5,6,10,'2021-03-23 17:11:28');

/*Table structure for table `jilu` */

DROP TABLE IF EXISTS `jilu`;

CREATE TABLE `jilu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '领用人',
  `goods_id` int(11) DEFAULT NULL COMMENT '领用用品',
  `num` int(11) DEFAULT NULL COMMENT '领用数量',
  `lingyong_time` timestamp NULL DEFAULT NULL COMMENT '领用时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='领用记录';

/*Data for the table `jilu` */

insert  into `jilu`(`id`,`yonghu_id`,`goods_id`,`num`,`lingyong_time`,`create_time`) values (6,1,5,3,'2021-03-23 16:51:08','2021-03-23 16:51:08'),(7,2,5,3,'2021-03-23 16:58:54','2021-03-23 16:58:54'),(9,3,7,10,'2021-03-23 17:23:22','2021-03-23 17:23:22');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (5,1,'admin','users','管理员','qowx3x93watjtg8oxd5414z5kuxj53iy','2021-03-23 14:15:15','2021-03-23 18:21:49'),(6,1,'111','yonghu','用户','r066zrauzkj49pm2uyze8q3nyca7cji2','2021-03-23 16:55:29','2021-03-23 18:21:31'),(7,2,'222','yonghu','用户','eksalgfb9fn32f9k2b1ym6es781j0emp','2021-03-23 16:58:43','2021-03-23 17:58:43'),(8,3,'333','yonghu','用户','fpw1k6281ezleb4blo1dg7nwxj3t77lc','2021-03-23 17:22:11','2021-03-23 18:23:03');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-25 15:59:12');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称  Search111',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(4) DEFAULT NULL COMMENT '性别  Search111',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `id_number` varchar(255) DEFAULT NULL COMMENT '身份证',
  `role` varchar(255) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`name`,`username`,`password`,`img_photo`,`sex_types`,`phone`,`id_number`,`role`) values (1,'小金','111','111','http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616481631270.jpg',1,'17796312333','410882200011231234','用户'),(2,'小札','222','222','http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616481338998.jpg',2,'17754548971','410882200011274855','用户'),(3,'小张','333','333','http://localhost:8080/bangongyongpinguanli/file/download?fileName=1616490292764.jpg',1,'17796688956','410882200011264544','用户');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
