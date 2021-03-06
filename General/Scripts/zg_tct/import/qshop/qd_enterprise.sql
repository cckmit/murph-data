-- CONNECTION: url=jdbc:mysql://127.0.0.1:3306/zg_tct_dev

-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 10.0.12.22    Database: qshop
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `qd_enterprise`
--

DROP TABLE IF EXISTS `qd_enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qd_enterprise` (
  `pkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enterprise_id` bigint(20) NOT NULL COMMENT '云商企业id',
  `enterprise_name` varchar(50) DEFAULT NULL COMMENT '云商企业名称',
  `qd_main_no` varchar(20) DEFAULT NULL COMMENT '企业主号',
  `qd_enterprise_name` varchar(50) DEFAULT NULL COMMENT '企点企业名称',
  `qd_no_name` varchar(255) DEFAULT NULL COMMENT '企点套餐名称',
  `qd_no_count` int(11) DEFAULT NULL COMMENT '企点号套餐坐席个数',
  `qd_no_expire_time` datetime DEFAULT NULL COMMENT '企点套餐失效时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 默认0 0正常；1禁用',
  `appid` varchar(50) DEFAULT NULL,
  `secret_key` varchar(50) DEFAULT NULL,
  `belong_industry` tinyint(4) NOT NULL DEFAULT '1' COMMENT '所属行业，钢铁：1；化工：2；有色金属：3；电子元器件：4；金融：5；综合工业品：6；汽配：7；精细化学品：8；印刷：9；旅游：10；教育：11；物流：12；货代：13；其他：0',
  `add_by` bigint(20) DEFAULT NULL COMMENT '添加人',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `add_ip` varchar(20) DEFAULT NULL COMMENT '添加ip',
  `modified_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_ip` varchar(20) DEFAULT NULL COMMENT '修改ip',
  `valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '记录是否有效 1:有效 0：无效',
  `auth_type` tinyint(4) DEFAULT '0' COMMENT '企业授权类型：0旧授权，1新授权',
  `sid` varchar(50) DEFAULT NULL COMMENT '应用id',
  `saleMatch_push_all` tinyint(4) DEFAULT '1' COMMENT '是否开启商机推送给主号下的所有人 1:是 0：否',
  `shop_status` varchar(1) DEFAULT 'N' COMMENT '是否开启企业店铺(Y:开启;N:不开启)',
  `shop_no` varchar(32) DEFAULT NULL COMMENT '店铺编号',
  `is_virtual_enterprise` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否虚拟企业 0不是 1是 2 个Q企业',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `un_enterprise_appid` (`appid`) USING BTREE,
  KEY `enterprise_id_index` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qd_enterprise`
--

LOCK TABLES `qd_enterprise` WRITE;
/*!40000 ALTER TABLE `qd_enterprise` DISABLE KEYS */;
INSERT INTO `qd_enterprise` VALUES (1,100000011,'胖猫化工会员中心',NULL,'胖猫化工会员中心','企点B2B-行业版',5,'2019-11-21 00:00:00',0,'202005214','DSYlaowxyG3qo1dTKe',4,NULL,'2019-05-05 17:17:45',NULL,NULL,NULL,NULL,1,1,'1300000030',1,'N','10000011',0),(10,100000002,'壳耐电子科技',NULL,'壳耐电子科技','企点B2B-行业版',3,'2019-08-21 00:00:00',0,'202003226',NULL,4,NULL,'2019-07-04 14:52:14',NULL,NULL,NULL,NULL,1,0,'10',1,'N',NULL,0),(18,200000017,'找钢网信息技术有限公司',NULL,'找钢网信息技术有限公司','企点B2B-行业版',3,'2020-07-05 12:30:44',0,'13671848346',NULL,4,NULL,'2019-07-05 12:30:44',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,0),(20,100000012,'胖猫电子会员中心',NULL,'胖猫电子会员中心','企点商通-行业版',9,'2022-02-21 00:00:00',0,'202005103',NULL,4,NULL,'2019-11-21 11:27:43',NULL,NULL,NULL,NULL,1,1,'1300000216',1,'N',NULL,0),(21,100000013,'找钢2',NULL,'找钢2','企点领航-运营商',3,'2020-04-18 00:00:00',0,'202008117','iP8xWuGvNvEyUe5UjD',4,NULL,'2019-12-25 17:41:30',NULL,NULL,NULL,NULL,1,1,'1300000143',1,'N',NULL,2),(37,100000017,'找钢Q店',NULL,'找钢Q店','企点-企业QQ 2.0 (协同)-行业版',5,'2022-02-27 00:00:00',0,'202042320','yT0Xv9E9mURVSonZwg',4,NULL,'2020-09-10 13:52:01',NULL,NULL,NULL,NULL,1,1,'1300000915',1,'Y',NULL,1),(38,200000031,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-11 15:12:36',0,'13812670762',NULL,4,NULL,'2020-09-11 15:12:36',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,2),(39,200000032,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-11 17:26:30',0,'13812670769',NULL,4,NULL,'2020-09-11 17:26:30',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,2),(41,200000034,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-11 19:53:35',0,'16601719996',NULL,4,NULL,'2020-09-11 19:53:35',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,2),(43,200000036,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-12 16:26:06',0,'17721028230','Kv2Er7Ord3QXa8zqxF',4,NULL,'2020-09-12 16:26:06',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,2),(44,200000037,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-14 16:21:57',0,'18730201023',NULL,4,NULL,'2020-09-14 16:21:56',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,2),(46,200000039,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-16 16:50:39',0,'15396732010',NULL,4,NULL,'2020-09-16 16:50:38',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,2),(47,200000040,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-25 10:13:04',0,'13812670760','J2W7qBvS33MjEY1L6I',4,NULL,'2020-09-25 10:13:04',NULL,NULL,NULL,NULL,1,0,'1300000265',1,'N',NULL,2),(51,200000044,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-27 18:40:41',0,'13812670222','ptvRk8N0hmXeun2tbj',4,NULL,'2020-09-27 18:40:41',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(53,200000046,'默认企业',NULL,'默认企业','个Q版',3,'2021-09-27 19:08:17',0,'15396732005','YpxA1G69xi4svZOgMa',4,NULL,'2020-09-27 19:08:16',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(54,200000047,'默认企业',NULL,'默认企业','个Q版',3,'2021-10-20 17:31:27',0,'18930201025',NULL,4,NULL,'2020-10-20 17:31:29',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(55,200000048,'默认企业',NULL,'默认企业','个Q版',3,'2021-10-22 11:55:35',0,'18930201023','mSUBchg9dWmBcb62FS',4,NULL,'2020-10-22 11:55:35',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(59,200000052,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-03 19:42:02',0,'15343218765','UAEMOMMvuf0wZLdaWU',4,NULL,'2020-11-03 19:42:02',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(60,200000053,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-04 17:12:18',0,'13126286648','MbW3LU0KXMCkLVorTr',4,NULL,'2020-11-04 17:12:17',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(67,200000060,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-05 17:17:50',0,'13812670764',NULL,4,NULL,'2020-11-05 17:17:50',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(68,200000061,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-05 17:24:13',0,'13812670755',NULL,4,NULL,'2020-11-05 17:24:13',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(77,200000070,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-16 16:44:33',0,'13811848104',NULL,4,NULL,'2020-11-16 16:44:32',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(79,200000072,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-16 17:09:22',0,'18600755941',NULL,4,NULL,'2020-11-16 17:09:21',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(80,200000073,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-16 17:09:24',0,'18500047794',NULL,4,NULL,'2020-11-16 17:09:24',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(81,200000074,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-16 17:09:34',0,'18311252390','a983dcc3c97d4c51bd',7,NULL,'2020-11-16 17:09:34',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(82,200000075,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-16 17:09:47',0,'15297583977',NULL,4,NULL,'2020-11-16 17:09:46',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(83,200000076,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-16 17:48:35',0,'18501202390','5ZYMebFsFdLG0ZUuKs',4,NULL,'2020-11-16 17:48:35',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(84,200000077,'默认企业',NULL,'默认企业','个Q版',3,'2021-11-17 14:34:21',0,'18930201026','RtOoXotb0LGlRShthP',4,NULL,'2020-11-17 14:34:22',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(88,100000021,'胖猫云',NULL,'胖猫云','企点商通-行业版',5,'2021-11-30 00:00:00',0,'202149843',NULL,4,NULL,'2020-12-01 14:56:48',NULL,NULL,NULL,NULL,1,1,'1300000230',1,'N',NULL,0),(90,100000022,'胖猫云',NULL,'胖猫云','企点商通-行业版',5,'2021-11-30 00:00:00',0,'202150532',NULL,4,NULL,'2020-12-07 15:01:02',NULL,NULL,NULL,NULL,1,1,'1300000230',1,'N',NULL,0),(91,200000082,'默认企业',NULL,'默认企业','个Q版',3,'2021-12-09 17:45:22',0,'18311252391','um1Mw4WlYIXcbth5dA',4,NULL,'2020-12-09 17:45:22',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(92,100000023,'胖猫云',NULL,'胖猫云','企点商通-行业版',5,'2021-11-30 00:00:00',0,'202149845',NULL,7,NULL,'2020-12-09 17:56:58',NULL,NULL,NULL,NULL,1,1,'1300000230',1,'N',NULL,0),(107,200000097,'默认企业',NULL,'默认企业','个Q版',3,'2021-12-29 15:54:50',0,'15396732008','FeYDoLFWgMOinU1glk',7,NULL,'2020-12-29 15:54:49',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(133,200000122,'默认企业',NULL,'默认企业','个Q版',3,'2022-01-12 16:58:49',0,'13262973660','uumSBB8wHhHZfXJroC',4,NULL,'2021-01-12 16:58:49',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(140,200000129,'默认企业',NULL,'默认企业','个Q版',3,'2022-01-22 10:53:13',0,'17365981878','LHMyQrCQQJpJ4J6mZ8',7,NULL,'2021-01-22 10:53:13',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(141,200000130,'默认企业',NULL,'默认企业','个Q版',3,'2022-01-22 11:35:47',0,'13524632026','aAzqC6nk4ESGZcTNaY',11,NULL,'2021-01-22 11:35:46',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(146,200000135,'默认企业',NULL,'默认企业','个Q版',3,'2022-01-28 15:47:18',0,'18702027070','h3qHYqcjostHaaD5fF',4,NULL,'2021-01-28 15:47:18',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(152,200000141,'默认企业',NULL,'默认企业','个Q版',3,'2022-03-01 15:46:44',0,'18101659893','fQv3MDp7FUW0qK3kCn',4,NULL,'2021-03-01 15:46:43',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(154,200000143,'默认企业',NULL,'默认企业','个Q版',3,'2022-03-03 10:46:25',0,'18701822914','pZhmIO5AoBkqKNSUkx',4,NULL,'2021-03-03 10:46:25',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(212,200000201,'默认企业',NULL,'默认企业','个Q版',3,'2022-03-22 16:10:57',0,'13812670763','wcLOydDA8eSPjVg6SR',4,NULL,'2021-03-22 16:10:57',NULL,NULL,NULL,NULL,1,0,'1300000671',1,'Y',NULL,2),(213,200000202,'默认企业',NULL,'默认企业','个Q版',3,'2022-03-23 10:57:53',0,'18321279917','pKfQFNzYHpjJr8m4KG',4,NULL,'2021-03-23 10:57:52',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(214,200000203,'的会计法律贷款',NULL,'默认企业','个Q版',3,'2022-03-23 17:06:05',0,'15618100419','P1E2jmkquUkFWFTMk4',4,NULL,'2021-03-23 17:06:05',NULL,NULL,NULL,NULL,1,0,'1300000671',1,'N',NULL,2),(219,200000208,'默认企业',NULL,'默认企业','个Q版',3,'2022-03-25 13:45:02',0,'15538066281','wDL6jb0sFVqr1hUud1',7,NULL,'2021-03-25 13:45:02',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(243,200000232,'默认企业',NULL,'默认企业','个Q版',3,'2022-04-12 15:38:49',0,'15035021624','ck1g4KPAC3jsZl70qb',7,NULL,'2021-04-12 15:38:48',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(250,100000024,'我的车车',NULL,'我的车车','企点商通-行业版',1,'2022-03-11 00:00:00',0,'202184433','P3StDtKZCRZusZ1wox',7,NULL,'2021-04-28 17:21:04',NULL,NULL,NULL,NULL,1,1,'1300000216',1,'N',NULL,0),(256,200000244,'默认企业',NULL,'默认企业','个Q版',3,'2022-05-26 10:47:53',0,'18721084783','fPVbH2O63wdd5Tf21I',4,NULL,'2021-05-26 10:47:53',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(259,200000247,'默认企业',NULL,'默认企业','个Q版',3,'2022-05-27 15:08:18',0,'15021166967','BLInavlGh8lxIubI65',7,NULL,'2021-05-27 15:08:18',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(268,100000025,'上海胖猫云测试',NULL,'上海胖猫云测试','腾讯企点抢单王基础版-行业版',10,'2022-05-15 00:00:00',0,'202187618',NULL,4,NULL,'2021-06-23 15:49:49',NULL,NULL,NULL,NULL,1,1,'1300000793',1,'N',NULL,0),(269,100000026,'上海电子测试企业',NULL,'上海电子测试企业','腾讯企点抢单王基础版-行业版',2,'2024-04-30 00:00:00',0,'202185669',NULL,4,NULL,'2021-06-23 15:50:36',NULL,NULL,NULL,NULL,1,1,'1300000793',1,'N',NULL,0),(270,100000027,'胖猫云（上海）科技测试',NULL,'胖猫云（上海）科技测试','腾讯企点抢单王标准版-行业版',20,'2022-06-07 00:00:00',0,'202190445',NULL,7,NULL,'2021-06-24 15:19:47',NULL,NULL,NULL,NULL,1,1,'1300000794',1,'N',NULL,0),(271,100000028,'上海胖猫云测试',NULL,'上海胖猫云测试','腾讯企点抢单王专业版-行业版',20,'2022-05-15 00:00:00',0,'202187175','ikw1c7P7cfKP10eX8V',7,NULL,'2021-06-24 15:33:51',NULL,NULL,NULL,NULL,1,1,'1300000795',1,'N',NULL,0),(273,200000258,'默认企业',NULL,'默认企业','个Q版',3,'2022-07-02 11:39:22',0,'15026911186','8DWJXhrj3LbEQUZWKP',4,NULL,'2021-07-02 11:39:22',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(276,200000261,'默认企业',NULL,'默认企业','个Q版',3,'2022-07-06 11:36:50',0,'18930201024','372884f5517d4daeb2',4,NULL,'2021-07-06 11:36:49',NULL,NULL,NULL,NULL,1,0,'1300000230',1,'N',NULL,2),(277,200000262,'默认企业',NULL,'默认企业','个Q版',3,'2022-07-07 22:11:18',0,'17638988189','kWMstq1ZT4pGyQMz33',4,NULL,'2021-07-07 22:11:17',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(278,200000263,'默认企业',NULL,'默认企业','个Q版',3,'2022-07-19 17:21:47',0,'17688466343','23yLiZVOSDOuBfYH4C',7,NULL,'2021-07-19 17:21:47',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(283,200000268,'默认企业',NULL,'默认企业','个Q版',3,'2022-07-26 15:32:55',0,'13711678783','wqYamYLHa2S1LZrEAe',7,NULL,'2021-07-26 15:32:54',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(284,100000029,'深圳腾采（测试）',NULL,'深圳腾采（测试）','企点商通-行业版',10,'2022-08-09 00:00:00',0,'202201552','EOwvChX1rQxl0jbOeC',4,NULL,'2021-08-11 18:51:45',NULL,NULL,NULL,NULL,1,1,'1300000857',1,'N',NULL,0),(285,200000269,'默认企业',NULL,'默认企业','个Q版',3,'2022-08-12 13:43:08',0,'18162923627','Yea4WJ6i1ki7H7yb90',7,NULL,'2021-08-12 13:43:08',NULL,NULL,NULL,NULL,1,0,'1300000671',1,'N',NULL,2),(286,200000270,'默认企业',NULL,'默认企业','个Q版',3,'2022-08-13 11:23:15',0,'15017542817','jE6K5ttVYTEAaCdNiD',7,NULL,'2021-08-13 11:23:14',NULL,NULL,NULL,NULL,1,0,'1300000671',1,'N',NULL,2),(288,300000001,'上海胖猫链享科技有限公司',NULL,NULL,NULL,NULL,NULL,0,'ww1e77d463bcdbf32f',NULL,7,NULL,'2021-09-08 19:40:50',NULL,NULL,'2021-12-07 10:39:24',NULL,1,0,NULL,1,'N',NULL,3),(292,300000005,'深圳市腾采科技有限公司',NULL,NULL,NULL,NULL,NULL,0,'ww8cbd963781ac07a3',NULL,4,NULL,'2021-09-28 17:15:21',NULL,NULL,'2022-01-04 16:23:22',NULL,1,0,NULL,1,'N',NULL,3),(293,200000271,'默认企业',NULL,'默认企业','个Q版',3,'2022-10-12 11:02:04',0,'17521796418','3voF3pspTEyyh6FDXj',7,NULL,'2021-10-12 11:02:03',NULL,NULL,NULL,NULL,1,0,'1300000672',1,'N',NULL,2),(297,300000009,'杭州配途',NULL,NULL,NULL,NULL,NULL,0,'ww1a5d2cdb15c1c2e5',NULL,7,NULL,'2021-11-09 16:04:22',NULL,NULL,'2021-12-16 14:08:37',NULL,1,0,NULL,1,'N',NULL,3),(298,300000010,'武汉大风科技有限公司',NULL,NULL,NULL,NULL,NULL,0,'wpnKgjCgAAGnjN-bLU1gK4JP5xSS5JFA',NULL,4,NULL,'2021-12-16 14:13:20',NULL,NULL,NULL,NULL,1,0,NULL,1,'N',NULL,3),(299,100000030,'上海测试客服',NULL,'上海测试客服','企点客服-在线客服专业版-行业版',3,'2022-10-22 00:00:00',0,'202217326',NULL,4,NULL,'2021-12-29 14:13:04',NULL,NULL,NULL,NULL,1,1,'1300000793',1,'N',NULL,0);
/*!40000 ALTER TABLE `qd_enterprise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-10 16:53:18
