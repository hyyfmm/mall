/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.15 : Database - mall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mall` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mall`;

/*Table structure for table `t_mall_act` */

DROP TABLE IF EXISTS `t_mall_act`;

CREATE TABLE `t_mall_act` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

/*Data for the table `t_mall_act` */

/*Table structure for table `t_mall_address` */

DROP TABLE IF EXISTS `t_mall_address`;

CREATE TABLE `t_mall_address` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `yh_dz` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `dzzt` int(11) DEFAULT NULL COMMENT '地址状态',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `shjr` varchar(100) DEFAULT NULL COMMENT '收件人',
  `lxfsh` varchar(100) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

/*Data for the table `t_mall_address` */

insert  into `t_mall_address`(`Id`,`yh_dz`,`dzzt`,`yh_id`,`shjr`,`lxfsh`) values (1,'叼叼省38市250县',38438,5,'罗38','13843825038');

/*Table structure for table `t_mall_attr` */

DROP TABLE IF EXISTS `t_mall_attr`;

CREATE TABLE `t_mall_attr` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxm_mch` varchar(100) DEFAULT NULL COMMENT '属性名称',
  `shfqy` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `flbh2` int(11) DEFAULT NULL COMMENT '分类编号2',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='属性名表';

/*Data for the table `t_mall_attr` */

insert  into `t_mall_attr`(`Id`,`shxm_mch`,`shfqy`,`flbh2`,`chjshj`) values (1,'内存容量',NULL,16,'2017-11-16 11:15:00'),(2,'硬盘容量',NULL,16,'2017-11-16 11:15:46'),(3,'屏幕尺寸',NULL,16,'2017-11-16 11:16:38'),(4,'选择颜色',NULL,25,'2017-11-16 11:21:19'),(5,'选择版本',NULL,25,'2017-11-16 11:22:02'),(6,'选择内存',NULL,25,'2017-11-16 11:22:30');

/*Table structure for table `t_mall_ck_info` */

DROP TABLE IF EXISTS `t_mall_ck_info`;

CREATE TABLE `t_mall_ck_info` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `ck_mch` varchar(100) DEFAULT NULL COMMENT '仓库名称',
  `ck_dz` varchar(100) DEFAULT NULL COMMENT '仓库地址',
  `ck_lx` varchar(1) DEFAULT NULL COMMENT '仓库类型',
  `ck_mj` double DEFAULT NULL COMMENT '仓库面积',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

/*Data for the table `t_mall_ck_info` */

/*Table structure for table `t_mall_class_1` */

DROP TABLE IF EXISTS `t_mall_class_1`;

CREATE TABLE `t_mall_class_1` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flmch1` varchar(100) DEFAULT NULL COMMENT '分类名称1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='分类1表';

/*Data for the table `t_mall_class_1` */

insert  into `t_mall_class_1`(`Id`,`flmch1`) values (6,'服装鞋帽'),(7,'家用电器'),(8,'电脑办公'),(9,'清洁用品'),(10,'母婴玩具'),(11,'手机数码'),(12,'图书音像'),(13,'鞋靴箱包'),(14,'户外钟表'),(15,'食品烟酒');

/*Table structure for table `t_mall_class_2` */

DROP TABLE IF EXISTS `t_mall_class_2`;

CREATE TABLE `t_mall_class_2` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flmch2` varchar(100) DEFAULT NULL COMMENT '分类名称2',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='分类2表';

/*Data for the table `t_mall_class_2` */

insert  into `t_mall_class_2`(`Id`,`flmch2`,`flbh1`) values (11,'男装',6),(12,'女装',6),(13,'童装',6),(14,'冰箱',7),(15,'洗衣机',7),(16,'笔记本',8),(17,'游戏本',8),(18,'洗发',9),(19,'护肤',9),(20,'牙膏牙刷',9),(21,'内衣',6),(22,'配饰',6),(23,'电视',7),(24,'空调',7),(25,'手机',11),(26,'数码相机',11),(27,'耳机',11),(28,'显示器',8),(29,'鼠标',8),(30,'键盘',8),(31,'路由器',8),(32,'平板电脑',8),(33,'时尚女鞋',13),(34,'流行男鞋',13),(35,'箱包',13),(36,'音箱',12),(37,'教材',12),(38,'杂志',12),(39,'电子书',12),(40,'科学记录片',12),(41,'游戏机',11),(42,'奶粉',10),(43,'玩具',10),(44,'婴儿车',10),(45,'乐器',10),(46,'跑步机',14),(47,'钟表',14),(48,'球类',14),(49,'乐器',14),(50,'钓鱼用品',14),(51,'水果',15),(52,'中外名酒',15),(53,'茶类',15);

/*Table structure for table `t_mall_comment_image` */

DROP TABLE IF EXISTS `t_mall_comment_image`;

CREATE TABLE `t_mall_comment_image` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `pl_id` int(11) DEFAULT NULL COMMENT '评论id',
  `url` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论图片表';

/*Data for the table `t_mall_comment_image` */

/*Table structure for table `t_mall_flow` */

DROP TABLE IF EXISTS `t_mall_flow`;

CREATE TABLE `t_mall_flow` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `psfsh` varchar(100) DEFAULT NULL COMMENT '配送方式',
  `psshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '配送时间',
  `psmsh` varchar(100) DEFAULT NULL COMMENT '配送描述',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chjshj` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  `mqdd` varchar(100) DEFAULT NULL COMMENT '目前地点',
  `mdd` varchar(100) DEFAULT NULL COMMENT '目的地',
  `ywy` varchar(100) DEFAULT NULL COMMENT '业务员',
  `lxfsh` varchar(100) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='物流表';

/*Data for the table `t_mall_flow` */

insert  into `t_mall_flow`(`Id`,`psfsh`,`psshj`,`psmsh`,`yh_id`,`chjshj`,`dd_id`,`mqdd`,`mdd`,`ywy`,`lxfsh`) values (1,'hanfu快递','2017-11-20 20:02:38',NULL,5,'0000-00-00 00:00:00',2,'商品未出库',NULL,NULL,NULL),(2,'hanfu快递','2017-11-20 20:15:07',NULL,5,'0000-00-00 00:00:00',3,'商品未出库',NULL,NULL,NULL),(3,'hanfu快递','2017-11-21 20:19:36','商品准备发货',5,'0000-00-00 00:00:00',4,'商品未出库',NULL,'老佟','123123123123'),(4,'hanfu快递','2017-11-20 20:20:47',NULL,5,'0000-00-00 00:00:00',5,'商品未出库',NULL,NULL,NULL),(5,'hanfu快递','2017-11-20 20:21:41',NULL,5,'0000-00-00 00:00:00',6,'商品未出库',NULL,NULL,NULL),(6,'hanfu快递','2017-11-20 20:28:23',NULL,5,'0000-00-00 00:00:00',7,'商品未出库',NULL,NULL,NULL);

/*Table structure for table `t_mall_flow_info` */

DROP TABLE IF EXISTS `t_mall_flow_info`;

CREATE TABLE `t_mall_flow_info` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流信息表';

/*Data for the table `t_mall_flow_info` */

/*Table structure for table `t_mall_minicar` */

DROP TABLE IF EXISTS `t_mall_minicar`;

CREATE TABLE `t_mall_minicar` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='迷你购物车';

/*Data for the table `t_mall_minicar` */

/*Table structure for table `t_mall_order` */

DROP TABLE IF EXISTS `t_mall_order`;

CREATE TABLE `t_mall_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shhr` varchar(100) DEFAULT NULL COMMENT '收货人',
  `zje` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `jdh` int(11) DEFAULT NULL COMMENT '进度号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yjsdshj` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计送达时间',
  `dzh_id` int(11) DEFAULT NULL COMMENT '地址id',
  `dzh_mch` varchar(255) DEFAULT NULL COMMENT '地址名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Data for the table `t_mall_order` */

insert  into `t_mall_order`(`Id`,`shhr`,`zje`,`jdh`,`yh_id`,`chjshj`,`yjsdshj`,`dzh_id`,`dzh_mch`) values (1,'罗38','17699.00',1,5,'2017-11-20 20:01:46','0000-00-00 00:00:00',1,'叼叼省38市250县'),(2,'罗38','17699.00',1,5,'2017-11-20 20:02:38','0000-00-00 00:00:00',1,'叼叼省38市250县'),(3,'罗38','17699.00',1,5,'2017-11-20 20:15:07','0000-00-00 00:00:00',1,'叼叼省38市250县'),(4,'罗38','6399.00',2,5,'2017-11-20 20:19:33','2017-11-23 20:19:36',1,'叼叼省38市250县'),(5,'罗38','6399.00',2,5,'2017-11-20 20:20:47','2017-11-23 20:20:49',1,'叼叼省38市250县'),(6,'罗38','6399.00',2,5,'2017-11-20 20:21:41','2017-11-23 20:27:40',1,'叼叼省38市250县'),(7,'罗38','6399.00',2,5,'2017-11-20 20:28:23','2017-11-23 20:28:26',1,'叼叼省38市250县');

/*Table structure for table `t_mall_order_info` */

DROP TABLE IF EXISTS `t_mall_order_info`;

CREATE TABLE `t_mall_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  `flow_id` int(11) DEFAULT NULL COMMENT '物流id',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sku_mch` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  `shp_tp` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `sku_jg` decimal(10,2) DEFAULT NULL COMMENT 'sku价格',
  `sku_shl` int(11) DEFAULT NULL COMMENT 'sku数量',
  `sku_kcdz` varchar(255) DEFAULT NULL COMMENT 'sku库存地址',
  `gwch_id` int(11) DEFAULT NULL COMMENT '购物车id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='订单信息表';

/*Data for the table `t_mall_order_info` */

insert  into `t_mall_order_info`(`id`,`dd_id`,`flow_id`,`sku_id`,`chjshj`,`sku_mch`,`shp_tp`,`sku_jg`,`sku_shl`,`sku_kcdz`,`gwch_id`) values (1,NULL,2,2,'2017-11-20 20:15:07','外星人Alienware15C-R2738','upload/images/1510801421317u=2363273137,1739629969&fm=21&gp=0.jpg','17699.00',1,'北京市外星人分公司',4),(2,NULL,3,1,'2017-11-20 20:19:34','联想(Lenovo)拯救者R720 ','upload/images/1510801282503aaa.jpg','6399.00',1,'北京市京东仓库',5),(3,NULL,4,1,'2017-11-20 20:20:47','联想(Lenovo)拯救者R720 ','upload/images/1510801282503aaa.jpg','6399.00',1,'北京市京东仓库',6),(4,NULL,5,1,'2017-11-20 20:21:41','联想(Lenovo)拯救者R720 ','upload/images/1510801282503aaa.jpg','6399.00',1,'北京市京东仓库',7),(5,NULL,6,1,'2017-11-20 20:28:23','联想(Lenovo)拯救者R720 ','upload/images/1510801282503aaa.jpg','6399.00',1,'北京市京东仓库',8);

/*Table structure for table `t_mall_order_phase` */

DROP TABLE IF EXISTS `t_mall_order_phase`;

CREATE TABLE `t_mall_order_phase` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `jdh` int(11) DEFAULT NULL COMMENT '进度号',
  `jdmsh` varchar(100) DEFAULT NULL COMMENT '进度描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单进度表';

/*Data for the table `t_mall_order_phase` */

/*Table structure for table `t_mall_pay_flow_info_log` */

DROP TABLE IF EXISTS `t_mall_pay_flow_info_log`;

CREATE TABLE `t_mall_pay_flow_info_log` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易流水日志表';

/*Data for the table `t_mall_pay_flow_info_log` */

/*Table structure for table `t_mall_product` */

DROP TABLE IF EXISTS `t_mall_product`;

CREATE TABLE `t_mall_product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shp_mch` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `shp_tp` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  `flbh2` int(11) DEFAULT NULL COMMENT '分类编号2',
  `pp_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shp_msh` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品表';

/*Data for the table `t_mall_product` */

insert  into `t_mall_product`(`Id`,`shp_mch`,`shp_tp`,`flbh1`,`flbh2`,`pp_id`,`chjshj`,`shp_msh`) values (1,'联想(Lenovo)拯救者R720','1510801282503aaa.jpg',8,16,2,'2017-11-16 11:01:22','【吃鸡利器，4G大显存，Nvme协议Pcie固态硬盘】GTX1050Ti就选拯救者！'),(2,'外星人Alienware15C-R2738','1510801421317u=2363273137,1739629969&fm=21&gp=0.jpg',8,16,20,'2017-11-16 11:03:41','15.6英寸Gsync屏游戏笔记本电脑(i7-7700HQ 16G 256GSSD+1T GTX1060 6G独显 FHD)'),(3,'华为 HUAWEI Mate 10 Pro','1510801722118b602ab607512792a575f95afdc8cd517_5a014fc8N831604c3.jpg',11,25,18,'2017-11-16 11:08:42','全网通 6GB+64GB 银钻灰 移动联通电信4G手机 双卡双待');

/*Table structure for table `t_mall_product_color` */

DROP TABLE IF EXISTS `t_mall_product_color`;

CREATE TABLE `t_mall_product_color` (
  `id` int(11) NOT NULL COMMENT 'id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `shp_ys` varchar(100) DEFAULT NULL COMMENT '商品颜色',
  `shfqy` int(11) DEFAULT NULL COMMENT '是否启用',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品颜色信息表';

/*Data for the table `t_mall_product_color` */

/*Table structure for table `t_mall_product_comment` */

DROP TABLE IF EXISTS `t_mall_product_comment`;

CREATE TABLE `t_mall_product_comment` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `plnr` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `plshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `hpjb` int(11) DEFAULT NULL COMMENT '好评级别',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `shp_mch` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论表';

/*Data for the table `t_mall_product_comment` */

/*Table structure for table `t_mall_product_image` */

DROP TABLE IF EXISTS `t_mall_product_image`;

CREATE TABLE `t_mall_product_image` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `zy` varchar(100) DEFAULT NULL COMMENT '作用',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `url` varchar(100) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

/*Data for the table `t_mall_product_image` */

insert  into `t_mall_product_image`(`Id`,`zy`,`shp_id`,`url`) values (1,NULL,1,'1510801282503aaa.jpg'),(2,NULL,1,'1510801282504ccc.jpg'),(3,NULL,2,'1510801421317u=2363273137,1739629969&fm=21&gp=0.jpg'),(4,NULL,2,'1510801421317u=2376143440,295649722&fm=21&gp=0.jpg'),(5,NULL,2,'1510801421318u=2788266912,1008059520&fm=21&gp=0.jpg'),(6,NULL,3,'1510801722118b602ab607512792a575f95afdc8cd517_5a014fc8N831604c3.jpg'),(7,NULL,3,'1510801722119bd9f427497ba14ca0c89b939e27732b1_5a014fc9N31ca9a51.jpg');

/*Table structure for table `t_mall_product_sku_info` */

DROP TABLE IF EXISTS `t_mall_product_sku_info`;

CREATE TABLE `t_mall_product_sku_info` (
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `shp_msh` varchar(100) DEFAULT NULL COMMENT '商品描述',
  `shp_lb` varchar(100) DEFAULT NULL COMMENT '商品类别',
  `pp_id` varchar(100) DEFAULT NULL COMMENT '商品品牌',
  `shpz_zhl` varchar(100) DEFAULT NULL COMMENT '商品重量',
  `shp_chc` varchar(100) DEFAULT NULL COMMENT '商品尺寸',
  `shp_ys` int(11) NOT NULL COMMENT '商品颜色',
  `shp_bb` int(11) NOT NULL COMMENT '商品版本',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`shp_ys`,`shp_bb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku商品基本信息表';

/*Data for the table `t_mall_product_sku_info` */

/*Table structure for table `t_mall_product_version` */

DROP TABLE IF EXISTS `t_mall_product_version`;

CREATE TABLE `t_mall_product_version` (
  `id` int(11) NOT NULL COMMENT 'id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `shp_bb` varchar(100) DEFAULT NULL COMMENT '商品版本',
  `shfqy` int(11) DEFAULT NULL COMMENT '是否启用',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品版本信息表';

/*Data for the table `t_mall_product_version` */

/*Table structure for table `t_mall_redis_log` */

DROP TABLE IF EXISTS `t_mall_redis_log`;

CREATE TABLE `t_mall_redis_log` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缓存日志表';

/*Data for the table `t_mall_redis_log` */

/*Table structure for table `t_mall_search_info_log` */

DROP TABLE IF EXISTS `t_mall_search_info_log`;

CREATE TABLE `t_mall_search_info_log` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品检索日志表';

/*Data for the table `t_mall_search_info_log` */

/*Table structure for table `t_mall_shoppingcar` */

DROP TABLE IF EXISTS `t_mall_shoppingcar`;

CREATE TABLE `t_mall_shoppingcar` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `sku_jg` decimal(10,2) DEFAULT NULL COMMENT 'sku价格',
  `tjshl` int(11) DEFAULT NULL COMMENT '添加数量',
  `hj` decimal(10,2) DEFAULT NULL COMMENT '合计',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `shp_tp` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `shfxz` varchar(1) DEFAULT NULL COMMENT '是否选中',
  `kcdz` varchar(500) DEFAULT NULL COMMENT '库存地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='购物车表';

/*Data for the table `t_mall_shoppingcar` */

insert  into `t_mall_shoppingcar`(`Id`,`sku_mch`,`sku_jg`,`tjshl`,`hj`,`yh_id`,`shp_id`,`chjshj`,`sku_id`,`shp_tp`,`shfxz`,`kcdz`) values (1,'华为 HUAWEI Mate 10 Pro','4899.00',1,'4899.00',1,3,'2017-11-19 22:52:16',3,'upload/images/1510801722118b602ab607512792a575f95afdc8cd517_5a014fc8N831604c3.jpg','1','华为总部'),(2,'联想(Lenovo)拯救者R720 ','6399.00',1,'6399.00',1,1,'2017-11-19 22:53:40',1,'upload/images/1510801282503aaa.jpg','1','北京市京东仓库'),(3,'外星人Alienware15C-R2738','17699.00',1,'17699.00',1,2,'2017-11-20 14:07:25',2,'upload/images/1510801421317u=2363273137,1739629969&fm=21&gp=0.jpg','0','北京市外星人分公司');

/*Table structure for table `t_mall_shoppingcar_info` */

DROP TABLE IF EXISTS `t_mall_shoppingcar_info`;

CREATE TABLE `t_mall_shoppingcar_info` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT '名称',
  `sku_jg` decimal(11,2) DEFAULT NULL COMMENT 'sku价格',
  `yh_xm` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `yh_nch` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `yh_dz` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `shp_mch` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `shp_tp` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `sku_kc` int(11) DEFAULT NULL COMMENT '库存',
  `sku_shx` varchar(100) DEFAULT NULL COMMENT 'sku属性',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车信息表';

/*Data for the table `t_mall_shoppingcar_info` */

/*Table structure for table `t_mall_sku` */

DROP TABLE IF EXISTS `t_mall_sku`;

CREATE TABLE `t_mall_sku` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `kc` int(11) DEFAULT NULL COMMENT '库存',
  `jg` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `sku_xl` int(11) DEFAULT NULL COMMENT 'sku销量',
  `kcdz` varchar(500) DEFAULT NULL COMMENT '库存地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='sku库存表';

/*Data for the table `t_mall_sku` */

insert  into `t_mall_sku`(`Id`,`shp_id`,`kc`,`jg`,`chjshj`,`sku_mch`,`sku_xl`,`kcdz`) values (1,1,0,'6399.00','2017-11-16 11:25:35','联想(Lenovo)拯救者R720 ',NULL,'北京市京东仓库'),(2,2,168,'17699.00','2017-11-16 11:27:37','外星人Alienware15C-R2738',NULL,'北京市外星人分公司'),(3,3,1000,'4899.00','2017-11-16 11:29:01','华为 HUAWEI Mate 10 Pro',NULL,'华为总部');

/*Table structure for table `t_mall_sku_attr_value` */

DROP TABLE IF EXISTS `t_mall_sku_attr_value`;

CREATE TABLE `t_mall_sku_attr_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxm_id` int(11) DEFAULT NULL COMMENT '属性名id',
  `shxzh_id` int(11) DEFAULT NULL COMMENT '属性值id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `is_sku` varchar(1) DEFAULT NULL COMMENT '是否sku',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='sku属性和属性值关联表';

/*Data for the table `t_mall_sku_attr_value` */

insert  into `t_mall_sku_attr_value`(`Id`,`shxm_id`,`shxzh_id`,`shp_id`,`is_sku`,`chjshj`,`sku_id`) values (1,1,2,1,NULL,'2017-11-16 11:25:35',1),(2,2,4,1,NULL,'2017-11-16 11:25:35',1),(3,3,6,1,NULL,'2017-11-16 11:25:35',1),(4,1,2,2,NULL,'2017-11-16 11:27:37',2),(5,2,4,2,NULL,'2017-11-16 11:27:37',2),(6,3,6,2,NULL,'2017-11-16 11:27:37',2),(7,4,8,3,NULL,'2017-11-16 11:29:01',3),(8,5,9,3,NULL,'2017-11-16 11:29:01',3),(9,6,11,3,NULL,'2017-11-16 11:29:01',3);

/*Table structure for table `t_mall_sku_image` */

DROP TABLE IF EXISTS `t_mall_sku_image`;

CREATE TABLE `t_mall_sku_image` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `url` varchar(100) DEFAULT NULL COMMENT '图片',
  `zy` varchar(100) DEFAULT NULL COMMENT '作用',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku图片表';

/*Data for the table `t_mall_sku_image` */

/*Table structure for table `t_mall_tm_class` */

DROP TABLE IF EXISTS `t_mall_tm_class`;

CREATE TABLE `t_mall_tm_class` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `pp_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商标分类对应表';

/*Data for the table `t_mall_tm_class` */

insert  into `t_mall_tm_class`(`Id`,`pp_id`,`flbh1`) values (1,8,7),(2,1,8),(3,9,9),(4,3,6),(5,2,7),(6,2,8),(7,10,9),(8,4,6),(9,13,6),(10,14,6),(11,13,13),(12,13,14),(13,14,13),(14,14,14),(15,18,7),(16,18,8),(17,18,11),(18,19,8),(19,19,8),(20,20,8),(21,21,9),(22,22,7),(23,23,14),(24,24,14),(25,25,14),(26,26,14),(27,27,13),(28,28,13),(29,29,11),(30,30,10),(31,30,10),(32,31,10),(33,31,10),(34,32,10),(35,32,15);

/*Table structure for table `t_mall_trade_mark` */

DROP TABLE IF EXISTS `t_mall_trade_mark`;

CREATE TABLE `t_mall_trade_mark` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `ppmch` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `url` varchar(100) DEFAULT NULL COMMENT '品牌图片',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商标表';

/*Data for the table `t_mall_trade_mark` */

insert  into `t_mall_trade_mark`(`Id`,`ppmch`,`url`) values (1,'apple',NULL),(2,'lenovo\r\n',NULL),(3,'骆驼\r\n',NULL),(4,'波司登\r\n',NULL),(8,'华为\r\n',NULL),(9,'欧莱雅\r\n',NULL),(10,'沙宣\r\n',NULL),(13,'阿迪达斯',NULL),(14,'耐克\r\n',NULL),(18,'华为\r\n',NULL),(19,'宏基\r\n',NULL),(20,'外星人\r\n',NULL),(21,'欧莱雅\r\n',NULL),(22,'美的Midea\r\n',NULL),(23,'劳力士\r\n',NULL),(24,'天梭\r\n',NULL),(25,'卡地亚Carter\r\n',NULL),(26,'江诗丹顿\r\n',NULL),(27,'瑞士军刀\r\n',NULL),(28,'LV\r\n',NULL),(29,'诺基亚\r\n',NULL),(30,'三鹿\r\n',NULL),(31,'蒙牛\r\n',NULL),(32,'伊利\r\n',NULL);

/*Table structure for table `t_mall_user_account` */

DROP TABLE IF EXISTS `t_mall_user_account`;

CREATE TABLE `t_mall_user_account` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `yh_mch` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `yh_nch` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `yh_mm` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `yh_xm` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `yh_shjh` varchar(100) DEFAULT NULL COMMENT '手机号',
  `yh_yx` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `yh_tx` varchar(100) DEFAULT NULL COMMENT '头像',
  `yh_jb` varchar(100) DEFAULT NULL COMMENT '用户级别',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户账户表';

/*Data for the table `t_mall_user_account` */

insert  into `t_mall_user_account`(`Id`,`yh_mch`,`yh_nch`,`yh_mm`,`yh_xm`,`yh_shjh`,`yh_yx`,`yh_tx`,`yh_jb`) values (1,'fmm','xiaoming','123456','fuming','15901258902','79642678@qq.com',NULL,'王者'),(2,'han','xiaohan','123','hanyy','13526789018','1766889902@qq.com',NULL,NULL),(3,'bob','bob','123','bob','136178901980','1633771689@qq.com',NULL,NULL),(4,'fmm66','fmm','mm','mm','18911950123','1633771689@qq.com',NULL,NULL),(5,'罗叼叼','毕竟我顶','38','罗38','18911950123','1633771689@qq.com',NULL,NULL);

/*Table structure for table `t_mall_user_do_log` */

DROP TABLE IF EXISTS `t_mall_user_do_log`;

CREATE TABLE `t_mall_user_do_log` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

/*Data for the table `t_mall_user_do_log` */

/*Table structure for table `t_mall_user_info` */

DROP TABLE IF EXISTS `t_mall_user_info`;

CREATE TABLE `t_mall_user_info` (
  `id_card` int(11) NOT NULL COMMENT '身份证编号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户',
  `yh_shjh` varchar(100) DEFAULT NULL COMMENT '用户手机号',
  `yh_jg` varchar(100) DEFAULT NULL COMMENT '用户籍贯',
  `yh_zhzh` varchar(100) DEFAULT NULL COMMENT '用户住址',
  `yh_xb` int(11) DEFAULT NULL COMMENT '性别',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_mall_user_info` */

/*Table structure for table `t_mall_user_login_log` */

DROP TABLE IF EXISTS `t_mall_user_login_log`;

CREATE TABLE `t_mall_user_login_log` (
  `Id` int(11) NOT NULL COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户访问日志表';

/*Data for the table `t_mall_user_login_log` */

/*Table structure for table `t_mall_user_pay` */

DROP TABLE IF EXISTS `t_mall_user_pay`;

CREATE TABLE `t_mall_user_pay` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  `fkshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '付款时间',
  `dd_je` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `zhf_fsh` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `yh` varchar(100) DEFAULT NULL COMMENT '支付流水',
  `yh_lsh` varchar(100) DEFAULT NULL COMMENT '银行流水',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户支付信息表';

/*Data for the table `t_mall_user_pay` */

/*Table structure for table `t_mall_value` */

DROP TABLE IF EXISTS `t_mall_value`;

CREATE TABLE `t_mall_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxzh` varchar(100) DEFAULT NULL COMMENT '属性值',
  `shfqy` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `shxm_id` int(11) DEFAULT NULL COMMENT '属性id',
  `shxzh_mch` varchar(100) DEFAULT NULL COMMENT '属性值名',
  `chjshj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='属性值表';

/*Data for the table `t_mall_value` */

insert  into `t_mall_value`(`Id`,`shxzh`,`shfqy`,`shxm_id`,`shxzh_mch`,`chjshj`) values (1,'4',NULL,1,'G','2017-11-16 11:15:00'),(2,'8',NULL,1,'G','2017-11-16 11:15:00'),(3,'500',NULL,2,'M','2017-11-16 11:15:46'),(4,'1',NULL,2,'T','2017-11-16 11:15:46'),(5,'14',NULL,3,'英寸','2017-11-16 11:16:38'),(6,'15.6',NULL,3,'英寸','2017-11-16 11:16:38'),(7,'樱粉金',NULL,4,'色','2017-11-16 11:21:19'),(8,'宝石蓝',NULL,4,'色','2017-11-16 11:21:19'),(9,'标准',NULL,5,'版','2017-11-16 11:22:02'),(10,'套装',NULL,5,'版','2017-11-16 11:22:02'),(11,'64',NULL,6,'G','2017-11-16 11:22:30'),(12,'128',NULL,6,'G','2017-11-16 11:22:30');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
