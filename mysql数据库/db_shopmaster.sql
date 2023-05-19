/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : db_shopmaster

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2019-08-02 14:40:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int(12) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float DEFAULT '1',
  `fullPrice` int(12) DEFAULT NULL,
  `reducePrice` int(12) DEFAULT NULL,
  `fullNum` int(12) DEFAULT NULL,
  `reduceNum` int(12) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '测试活动', '1231', '1', '123', '123', '1231', '12');
INSERT INTO `activity` VALUES ('2', '开业大酬宾', '开业大酬宾，全场9折。', '9.2', '100', '8', '200', '20');

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressID` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('7', '1', '北京市', '北京市市辖区', '东城区', '12312', '123123', '2131231321');
INSERT INTO `address` VALUES ('8', '3', '湖南省', '长沙市', '雨花区', '长沙理工大学', '张鑫', '18223469366');
INSERT INTO `address` VALUES ('9', '6', '四川省', '成都市', '成华区', '红星路12号', '林大神', '13590123424');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(12) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateId` int(12) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY (`cateId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '数码');
INSERT INTO `category` VALUES ('2', '服饰');
INSERT INTO `category` VALUES ('3', '家电');
INSERT INTO `category` VALUES ('4', '书籍');
INSERT INTO `category` VALUES ('5', '其他');

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('3', '93', '2019-05-13 10:47:26');
INSERT INTO `collection` VALUES ('3', '94', '2019-05-13 10:16:11');
INSERT INTO `collection` VALUES ('3', '95', '2019-05-13 10:37:35');
INSERT INTO `collection` VALUES ('3', '97', '2019-05-13 10:23:11');
INSERT INTO `collection` VALUES ('6', '93', '2019-08-01 21:54:14');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '3', '93', '4', '商品特别好，我非常喜欢', '2019-05-13 10:48:51');
INSERT INTO `comment` VALUES ('3', '6', '98', '4', '这个裙子很漂亮', '2019-08-02 14:28:10');

-- ----------------------------
-- Table structure for `deliver`
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `deliverId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliver
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsId` int(12) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int(12) NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int(12) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('93', '雷柏M217无线鼠标', '10', '29', '2019-05-10 19:43:04', '1', '鼠标', '笔记本台式电脑无限鼠标 省电正品游戏可爱白色\n产品名称：Rapoo/雷柏 m217品牌: Rapoo/雷柏雷柏无线型号: m217成色: 全新售后服务: 全国联保接口类型: USB按键数: 3个光学分辨率: 1000dpi工作方式: 光电滚轮数: 1个电池型号: 5号电池颜色分类: 黑色【送大号鼠标垫 两年免费换新】 白色【送大号鼠标垫 两年免费换新】 黑色充电版 送大号鼠标垫+大容量充电锂电池 白色充电版 送大号鼠标垫+大容量充电锂电池 黑色电池版【送一节原装电池 两年内免费换新 白色电池版【送一节原装电池 两年内免费换新无线技术: 2.4GHz无线距离: 10m毛重: 200g套餐类型: 官方标配生产企业: 雷柏是否支持人体工程学: 支持是否盒装正品: 是包装体积: 85*40135mm保修期: 24个月', '1');
INSERT INTO `goods` VALUES ('94', '女童夏装连衣裙', '99', '34', '2019-05-10 19:44:28', '2', '连衣裙', '2019新款大童夏天洋气公主裙小女孩儿童装蛋糕裙子\n品牌: BEAUTIFULME/悦己美适用年龄: 3岁 4岁 5岁 6岁 7岁 8岁 9岁 10岁 11岁 12岁 13岁面料: 其他图案: 其他风格: 韩版产地: 中国大陆省份: 浙江省地市: 杭州市适用性别: 女颜色分类: 渐变粉 渐变紫 渐变蓝货号: XTLYQ111裙型: A字裙', '1');
INSERT INTO `goods` VALUES ('95', '英特尔固态硬盘', '123', '1231', '2019-05-11 11:41:24', '1', '硬盘', '品牌: Intel/英特尔Intel固态硬盘: others硬盘容量: 256GB成色: 全新售后服务: 全国联保尺寸: 2.5英寸接口类型: SATA颜色分类: 巧克力色 红色 绿色 蓝色', '1');
INSERT INTO `goods` VALUES ('96', '宏想8G内存条', '213', '222', '2019-05-11 11:42:00', '1', '内存条', '产品名称：HEORIADY/宏想 8GB DDR3 ...品牌: HEORIADY/宏想型号: 8GB DDR3 1600S内存容量: 8GB成色: 全新售后服务: 全国联保传输类型: DDR3颜色分类: 笔记本 DDR3L 8G 1600 低压 1.35v 笔记本 DDR3 8G 1600 标压 1.5v 笔记本 DDR3L 8G 1333 低压 1.35v 笔记本 DDR3 8G 1333 标压 1.5v 笔记本 DDR3L 8G 1866 低压 1.35v组合形式: 单条生产企业: 深圳市日日顺科技有限公司内存频率: 1600MHz适用对象: 笔记本', '1');
INSERT INTO `goods` VALUES ('97', '西部数据固态硬盘', '213', '212', '2019-05-13 10:22:58', '1', '硬盘', '产品名称：WD/西部数据 WDS250G2B0A品牌: WD/西部数据型号: WDS250G2B0A硬盘容量: 250GB成色: 全新售后服务: 店铺三包尺寸: 2.5英寸接口类型: SATA颜色分类: WDS250G2B0A 标配 套餐三生产企业: 西部数据保修期: 5年', '1');
INSERT INTO `goods` VALUES ('98', '童装女童连衣裙', '69', '100', '2019-08-02 12:52:20', '2', '连衣裙', '秋装新款2019网红款超洋气时髦小女孩红色长袖裙子\n品牌: other/其他适用年龄: 3岁 4岁 5岁 6岁 7岁 8岁 9岁 10岁 11岁 12岁 13岁面料: 棉图案: 纯色风格: 公主产地: 中国大陆省份: 浙江省地市: 湖州市适用性别: 女颜色分类: Y3944227红色 Y3944227粉色货号: Y3944227裙型: A字裙参考身高: 110cm 120cm 130cm 140cm 150cm适用季节: 春秋款式: 长袖材质成分: 棉100%', '1');

-- ----------------------------
-- Table structure for `imagepath`
-- ----------------------------
DROP TABLE IF EXISTS `imagepath`;
CREATE TABLE `imagepath` (
  `pathId` int(12) NOT NULL AUTO_INCREMENT,
  `goodId` int(12) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagepath
-- ----------------------------
INSERT INTO `imagepath` VALUES ('114', '93', '3a25雷柏M217无线鼠标1.jpg');
INSERT INTO `imagepath` VALUES ('115', '93', '3a25雷柏M217无线鼠标2.jpg');
INSERT INTO `imagepath` VALUES ('116', '94', 'fesc女童夏装连衣裙1.jpg');
INSERT INTO `imagepath` VALUES ('117', '95', 'sfca英特尔固态硬盘1.jpg');
INSERT INTO `imagepath` VALUES ('118', '96', 'cadf宏想8G内存条1.jpg');
INSERT INTO `imagepath` VALUES ('119', '96', 'cadf宏想8G内存条2.jpg');
INSERT INTO `imagepath` VALUES ('120', '96', 'cadf宏想8G内存条3.jpg');
INSERT INTO `imagepath` VALUES ('121', '95', 'sfca英特尔固态硬盘2.jpg');
INSERT INTO `imagepath` VALUES ('122', '95', 'sfca英特尔固态硬盘3.jpg');
INSERT INTO `imagepath` VALUES ('123', '97', '0f0b西部数据固态硬盘1.jpg');
INSERT INTO `imagepath` VALUES ('124', '97', '0f0b西部数据固态硬盘2.jpg');
INSERT INTO `imagepath` VALUES ('125', '97', '0f0b西部数据固态硬盘3.jpg');
INSERT INTO `imagepath` VALUES ('126', '97', '0f0b西部数据固态硬盘4.jpg');
INSERT INTO `imagepath` VALUES ('129', '98', 'fb42童装女童连衣裙1.jpg');
INSERT INTO `imagepath` VALUES ('130', '98', '3a6a童装女童连衣裙2.jpg');
INSERT INTO `imagepath` VALUES ('131', '98', 'eeb9童装女童连衣裙3.jpg');
INSERT INTO `imagepath` VALUES ('132', '98', 'dcf7童装女童连衣裙4.jpg');
INSERT INTO `imagepath` VALUES ('133', '94', 'dfwd女童夏装连衣裙2.jpg');

-- ----------------------------
-- Table structure for `indent`
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `orderId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int(12) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('33', '3', '2019-05-13 10:47:42', '40', '40', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('34', '6', '2019-08-01 21:52:59', '169', '169', '1', '1', '0', '0', '9');
INSERT INTO `indent` VALUES ('35', '6', '2019-08-02 14:07:52', '261', '261', '1', '1', '1', '1', '9');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('21', '33', '93', '4');
INSERT INTO `orderitem` VALUES ('22', '34', '94', '2');
INSERT INTO `orderitem` VALUES ('23', '34', '95', '1');
INSERT INTO `orderitem` VALUES ('24', '35', '95', '1');
INSERT INTO `orderitem` VALUES ('25', '35', '98', '2');

-- ----------------------------
-- Table structure for `shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', '12345678', '2019-04-18 17:16:34', '916877983@qq.com', '18229819406');
INSERT INTO `user` VALUES ('2', 'zhangxin', '19402600297a305197962a5633e7711e', '2019-04-22 15:29:12', '994683607@qq.com', '18229819406');
INSERT INTO `user` VALUES ('3', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2019-05-16 10:46:46', '123123', '1231321');
INSERT INTO `user` VALUES ('6', 'lingege', '25d55ad283aa400af464c76d713c07ad', '2019-08-01 21:50:58', 'lingege@163.com', '13498031343');
