/*
MySQL Backup
Database: mzhotelonlinebooking
Backup Time: 2019-04-22 17:20:32
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`addressbook`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`autocompletelist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`evaluationlist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`hotellist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`hotelroomlist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`landmarklist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`manager`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`orderlist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`roomlist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`searchhotellist`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`tucao`;
DROP TABLE IF EXISTS `mzhotelonlinebooking`.`userlist`;
DROP VIEW IF EXISTS `mzhotelonlinebooking`.`eva_view`;
DROP VIEW IF EXISTS `mzhotelonlinebooking`.`hotel_eva_user_view`;
DROP VIEW IF EXISTS `mzhotelonlinebooking`.`hotel_searchhotel_view1`;
DROP VIEW IF EXISTS `mzhotelonlinebooking`.`hotel_searchhotel_view2`;
DROP VIEW IF EXISTS `mzhotelonlinebooking`.`hotel_view`;
DROP VIEW IF EXISTS `mzhotelonlinebooking`.`order_view`;
DROP VIEW IF EXISTS `mzhotelonlinebooking`.`view_rightcomment`;
CREATE TABLE `addressbook` (
  `addressBookId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '外部通讯人员ID',
  `name` varchar(20) DEFAULT NULL COMMENT '外部通信人员名',
  `category` tinyint(2) DEFAULT NULL COMMENT '外部通信人员分类',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别（1.男；0女）',
  `company` varchar(50) DEFAULT NULL COMMENT '所属单位',
  `settledPhone` varchar(16) DEFAULT NULL COMMENT '固定电话',
  `telephone` varchar(11) DEFAULT NULL COMMENT '移动电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`addressBookId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='通讯录（外部的）';
CREATE TABLE `autocompletelist` (
  `AutoComId` int(11) NOT NULL,
  `AutoAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AutoComId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `evaluationlist` (
  `EvaluationId` int(6) NOT NULL,
  `UserId` int(6) DEFAULT NULL,
  `HotelId` int(6) DEFAULT NULL,
  `CommentWord` tinytext,
  `CommentDate` varchar(15) DEFAULT NULL,
  `ClianRating` double(3,1) DEFAULT '0.0',
  `StaffQualityRating` double(3,1) DEFAULT '0.0',
  `PositionRating` double(3,1) DEFAULT '0.0',
  `ComfortableRating` double(3,1) DEFAULT '0.0',
  `FacilitiesRating` double(3,1) DEFAULT '0.0',
  `CostPerformanceRating` float(3,1) DEFAULT NULL,
  `BreakfastRating` float(3,1) DEFAULT '0.0',
  `WifiRating` float(3,1) DEFAULT '0.0',
  `SumRating` float(3,1) unsigned zerofill DEFAULT NULL,
  `likeNumber` int(11) unsigned zerofill DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`EvaluationId`) USING BTREE,
  KEY `FK_Reference_11` (`UserId`) USING BTREE,
  KEY `FK_Reference_5` (`HotelId`) USING BTREE,
  KEY `myorderid` (`OrderId`) USING BTREE,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`UserId`) REFERENCES `userlist` (`UserId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`HotelId`) REFERENCES `hotellist` (`HotelId`),
  CONSTRAINT `myorderid` FOREIGN KEY (`OrderId`) REFERENCES `orderlist` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `hotellist` (
  `HotelId` int(6) NOT NULL AUTO_INCREMENT,
  `HotelName` varchar(100) DEFAULT NULL,
  `HotelPer` text,
  `HotelAdress` varchar(100) DEFAULT NULL,
  `HotelPicture` varchar(100) DEFAULT NULL,
  `HotelType` varchar(15) DEFAULT NULL,
  `OnlineTime` varchar(15) DEFAULT NULL,
  `RoomGrade` int(11) DEFAULT NULL,
  `IsBreakfast` char(1) DEFAULT NULL,
  `HotelFacilities` varchar(100) DEFAULT NULL,
  `FacilitiesPicture` varchar(100) DEFAULT NULL,
  `CheckInTime` varchar(15) DEFAULT NULL,
  `LeaveTime` varchar(15) DEFAULT NULL,
  `Pet` varchar(15) DEFAULT NULL,
  `RePolicy` text,
  `ChileAndBed` varchar(15) DEFAULT NULL,
  `BankCard` char(1) DEFAULT NULL,
  `HotelProvince` varchar(15) DEFAULT NULL,
  `HotelDowntown` varchar(15) DEFAULT NULL,
  `HotelArea` varchar(50) DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `HotelPhoneNum` int(20) DEFAULT NULL,
  PRIMARY KEY (`HotelId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `hotelroomlist` (
  `HotelId` int(6) DEFAULT NULL,
  `RoomId` int(6) DEFAULT NULL,
  `HotelRoomId` int(11) NOT NULL,
  PRIMARY KEY (`HotelRoomId`) USING BTREE,
  KEY `FK_Reference_10` (`HotelId`) USING BTREE,
  KEY `FK_Reference_12` (`RoomId`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`HotelId`) REFERENCES `hotellist` (`HotelId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`RoomId`) REFERENCES `roomlist` (`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `landmarklist` (
  `LandmarkId` int(6) NOT NULL,
  `LandmarkName` varchar(100) DEFAULT NULL,
  `Hot` int(1) DEFAULT NULL,
  `LandmarkLongitude` double DEFAULT NULL,
  `LandmarkLalitude` double DEFAULT NULL,
  `CityName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LandmarkId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `loginName` varchar(20) NOT NULL COMMENT '管理员账号',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `status` varchar(255) DEFAULT '1',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `role` tinyint(4) DEFAULT NULL COMMENT '\r\n角色()',
  `lastTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `username` varchar(255) DEFAULT NULL COMMENT '管理员名字',
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `orderlist` (
  `UserId` int(6) DEFAULT NULL,
  `OrderId` int(6) NOT NULL AUTO_INCREMENT,
  `HotelId` int(6) DEFAULT NULL,
  `OrderTime` varchar(15) DEFAULT NULL,
  `OrderMoney` double DEFAULT NULL,
  `OrderIsPay` tinyint(1) DEFAULT NULL,
  `IsChargeback` tinyint(1) DEFAULT NULL,
  `InDate` varchar(15) DEFAULT NULL,
  `OrderDay` int(2) DEFAULT NULL,
  `OutDate` varchar(15) DEFAULT NULL,
  `RoomNum` int(11) DEFAULT NULL,
  `PeopleNum` varchar(30) DEFAULT NULL,
  `ContactNum` varchar(15) DEFAULT NULL,
  `HotelRoomId` int(11) DEFAULT NULL,
  `OrderEmail` varchar(30) DEFAULT NULL,
  `HotelName` varchar(30) DEFAULT NULL,
  `HotelType` varchar(30) DEFAULT NULL,
  `RoomGrade` int(3) DEFAULT NULL,
  `HotelAdress` varchar(50) DEFAULT NULL,
  `OrderUserName` varchar(30) DEFAULT NULL,
  `HotelImg` varchar(100) DEFAULT NULL,
  `RoomType` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OrderId`) USING BTREE,
  KEY `FK_Reference_7` (`UserId`) USING BTREE,
  KEY `FK_Reference_9` (`HotelId`) USING BTREE,
  KEY `FK_Reference_13` (`HotelRoomId`) USING BTREE,
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`HotelRoomId`) REFERENCES `hotelroomlist` (`HotelRoomId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`UserId`) REFERENCES `userlist` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=997514 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `roomlist` (
  `RoomId` int(11) NOT NULL AUTO_INCREMENT,
  `RoomType` varchar(15) DEFAULT NULL,
  `RoomPrice` double(12,0) DEFAULT NULL,
  `RoomNumber` int(11) DEFAULT NULL,
  `SurplusRoomNumber` int(11) DEFAULT NULL,
  `Facilities` varchar(100) DEFAULT NULL,
  `RoomSize` double DEFAULT NULL,
  `DiscountTime` varchar(15) DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `roomMin` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`RoomId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `searchhotellist` (
  `HotelId` int(6) DEFAULT NULL COMMENT '酒店ID',
  `RoomMin` float DEFAULT NULL COMMENT '酒店最低价\r\n',
  `RoomRating` varchar(10) DEFAULT NULL COMMENT '住宿评级（无评级、实惠型、经济型、舒适型、豪华型、尊贵型）',
  `Relax` varchar(50) DEFAULT NULL COMMENT '休闲乐活',
  `RoomQuantity` tinyint(1) DEFAULT NULL COMMENT '是否有剩余房量（0否、1是）',
  `Discount` tinyint(1) DEFAULT NULL COMMENT '是否有折扣优惠（0否、1是）',
  `FrontDesk` tinyint(1) DEFAULT NULL COMMENT '是否24小时前台（0否、1是）',
  `CancelPrepay` varchar(20) DEFAULT NULL COMMENT '取消和预付（无、免费取消、预付无需信用卡、无需预付）',
  `MealDinner` varchar(20) DEFAULT NULL COMMENT '餐点（含早餐、含早餐和晚餐、不含早餐）',
  `RoomType` varchar(10) DEFAULT NULL COMMENT '住宿类型（酒店、青旅、民宿、公寓、旅馆）',
  `Rating` int(1) DEFAULT NULL COMMENT '评分(9好极了、8非常好、7好、6令人愉悦、0~5无评分)',
  `ChainHotels` varchar(20) DEFAULT NULL COMMENT '连锁酒店(无、如家快捷、如家精选、汉庭、七天、格林联盟、格林豪泰、全季、锦江之星)',
  `SearchHotelId` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`SearchHotelId`) USING BTREE,
  KEY `FK_Reference_8` (`HotelId`) USING BTREE,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`HotelId`) REFERENCES `hotellist` (`HotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=100087 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `tucao` (
  `tucaoId` int(11) NOT NULL,
  `tucaoWord` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tucaoId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `userlist` (
  `UserId` int(6) NOT NULL AUTO_INCREMENT,
  `UserSurnme` varchar(15) DEFAULT NULL COMMENT '姓',
  `UserName` varchar(15) DEFAULT NULL COMMENT '名',
  `UserPassword` varchar(64) NOT NULL,
  `UserEmail` varchar(20) DEFAULT NULL,
  `UserPhoneNumber` varchar(15) DEFAULT NULL,
  `UserCountry` varchar(30) DEFAULT NULL,
  `UserPicture` text COMMENT '头像',
  `UserNickName` varchar(100) DEFAULT NULL COMMENT '昵称',
  `UserBirthday` varchar(15) DEFAULT NULL,
  `UserSex` char(1) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=796432 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `eva_view` AS select hotelId,ifnull(count(EvaluationId),0) evaluationNum,ifnull(avg(SumRating),0) avgRating from evaluationlist group by hotelId ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `hotel_eva_user_view` AS select e. EvaluationId,h. hotelId,e. commentWord,u.userId,u.userName,u.userCountry
from hotellist h,evaluationlist e,userlist u where h.hotelId = e.hotelId and e.userId = u.userId ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `hotel_searchhotel_view1` AS select h.HotelId,h.HotelName,h.HotelPicture,h.HotelType,h.HotelAdress,h.HotelPer,h.HotelProvince,h.HotelDowntown,h.HotelArea, ifnull(s.RoomMin,0) 
from hotellist h,searchhotellist s where h.hotelId = s.hotelId ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `hotel_searchhotel_view2` AS select ev.hotelId,ifnull(count(ev.hotelId),0) as EvaSum,ifnull(avg(ev.SumRating),0) as SumScore from hotellist h left join Evaluationlist ev on  h.hotelId = ev.hotelId group by ev.hotelId ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `hotel_view` AS select h.hotelId,h.hotelPicture,h.hotelName,h.roomGrade,s. roomMin,h.hotelDowntown,h.longitude,h.latitude from hotellist h left join searchhotellist s on h.hotelId=s.hotelId ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `order_view` AS select h.Hotelname,h.HotelAdress,h.HotelType,h.RoomGrade,h.HotelPhoneNum,o.OrderId,o.OrderTime,o.InDate,o.OutDate,o.OrderMoney,o.OrderIsPay,o.OrderEmail,o.RoomNum,o.ContactNum,u.UserName,
r.RoomType,r.RoomPrice,r.RoomSize
from HotelList h,OrderList o,UserList u,RoomList r, HotelRoomList h_r
where o.HotelId=h.HotelId and o.HotelRoomId=h_r.HotelRoomId 
and h_r.RoomId = r.RoomId and h_r.HotelId=h.HotelId ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_rightcomment` AS SELECT
	`t1`.`UserNickName` AS `UserNickName`,
	`t1`.`UserCountry` AS `UserCountry`,
	`t2`.`CommentDate` AS `CommentDate`,
	`t2`.`CommentWord` AS `CommentWord`,
	`t2`.`likeNumber` AS `likeNumber`,
	`t2`.`ClianRating` AS `ClianRating`,
	`t2`.`StaffQualityRating` AS `StaffQualityRating`,
	`t2`.`PositionRating` AS `PositionRating`,
	`t2`.`ComfortableRating` AS `ComfortableRating`,
	`t2`.`FacilitiesRating` AS `FacilitiesRating`,
	`t2`.`CostPerformanceRating` AS `CostPerformanceRating`,
	`t2`.`BreakfastRating` AS `BreakfastRating`,
	`t2`.`WifiRating` AS `WifiRating`,
	`t3`.`Hotelname` AS `Hotelname`,
	`t4`.`InDate` AS `InDate` 
FROM
	(
		(
			( `UserList` `t1` JOIN `EvaluationList` `t2` ON ( ( `t1`.`UserId` = `t2`.`UserId` ) ) )
			JOIN `HotelList` `t3` ON ( ( `t2`.`HotelId` = `t3`.`HotelId` ) ) 
		)
	JOIN `OrderList` `t4` ON ( ( `t2`.`OrderId` = `t4`.`OrderId` ) ) 
	) ;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`addressbook` WRITE;
DELETE FROM `mzhotelonlinebooking`.`addressbook`;
INSERT INTO `mzhotelonlinebooking`.`addressbook` (`addressBookId`,`name`,`category`,`gender`,`company`,`settledPhone`,`telephone`,`email`,`remark`) VALUES (1, '陈龙天', 1, 1, '阿里巴巴集团', '400-6838-101', '13800138001', '123456@qq.com', '无'),(2, '陈杰', 1, 0, '菜鸟驿站', '400-6838-102', '13800138002', '234567@qq.com', '无'),(3, '陈君', 1, 1, '百度', '400-6838-103', '13800138003', '345678@qq.com', '无'),(4, '陈斌', 1, 0, '京东', '025-32391311', '18882323232', '312312939@qq.com', '无'),(5, '陈建华', 1, 1, '腾讯', '025-84858965', '13987412563', '57841236@qq.com', '无'),(6, '小白', 1, 0, '华为', '86893400', '13913850006', 'chenzongtao@alpha.com', '无'),(7, '小黑', 2, 1, '网易', '86899102', '13913860007', 'chenyoudao@alpha.com', '无'),(8, '陈曦', 2, 0, '欢聚时代', '025-83792540', '15850583690', '2776890998@qq.com', '无'),(9, '陈莹', 2, 1, '大众点评', '86893476', '13913860002', 'chenying@alpha.com', '无'),(10, '程茜', 2, 0, '美团', '025-42424313', '18241131341', '321311334@qq.com', '无'),(11, '刘浩然', 2, 1, '饿了么', '0755-86420133', '13655246632', '645322097@qq.com', '无'),(12, '刘长玉', 2, 0, '南方电网', '86895601', '13913870001', 'liuchangyu@alpha.com', '无'),(13, '舒文杰', 2, 1, '有道云', '010-87912939', '18239493933', 'shuwenjie@163.com', '无'),(14, '吴微', 3, 0, 'Google', '0755-86435207', '13866405207', '548966403@qq.com', '无'),(15, '魏海洋', 3, 1, 'Fackbook', '075-8640-360', '13266548252', '13266548252@qq.com', '无'),(16, '王艳', 3, 0, 'Microsoft', '025-8719-540', '13726337829', 'wangyan@163.com', '无'),(17, '王耀中', 3, 1, 'Amazon', '010-8798-922', '13913850009', 'wyzhong@alpha.com', '无'),(18, '范晶', 3, 0, '小米', '010-8723-849', '18734828222', 'fanjing@163.com', '无');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`autocompletelist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`autocompletelist`;
INSERT INTO `mzhotelonlinebooking`.`autocompletelist` (`AutoComId`,`AutoAddress`) VALUES (1, '广州市,广东省,中国'),(2, '惠州市,广东省,中国'),(3, '梅州市,广东省,中国'),(4, '肇庆市,广东省,中国'),(5, '东莞市,广东省,中国'),(6, '中山市,广东省,中国'),(7, '昆明市,云南省,中国'),(8, '曲靖市,云南省,中国'),(9, '玉溪市,云南省,中国'),(10, '保山市,云南省,中国'),(11, '安宁市,云南省,中国'),(12, '泉州市,福建省,中国'),(13, '南平市,福建省,中国'),(14, '龙岩市,福建省,中国'),(15, '莆田市,福建省,中国'),(16, '宁德市,福建省,中国'),(17, '百色市,广西省,中国'),(18, '成都市,四川省,中国'),(19, '广安市,四川省,中国'),(20, '雅安市,四川省,中国'),(21, '达州市,四川省,中国'),(22, '巴中市,四川省,中国'),(23, '湛江市,广东省,中国');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`evaluationlist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`evaluationlist`;
INSERT INTO `mzhotelonlinebooking`.`evaluationlist` (`EvaluationId`,`UserId`,`HotelId`,`CommentWord`,`CommentDate`,`ClianRating`,`StaffQualityRating`,`PositionRating`,`ComfortableRating`,`FacilitiesRating`,`CostPerformanceRating`,`BreakfastRating`,`WifiRating`,`SumRating`,`likeNumber`,`OrderId`) VALUES (1, 113907, 2, '床很舒服，房间很干净。\r\n\r\n 不足 · 早餐太贵，而且只给一个人的。\r\n酒店外环境太闹，确实自己的绿地活动空间', '2018-6-6', 7.8, 7.9, 7.8, 7.8, 7.8, 7.8, 7.9, 8.9, 7.2, 00000000008, 1),(2, 586802, 6, '地理位子好，酒店附近有很多美食。酒店服务好，非常人性化。早上很早到的酒店，商量后很快给予入住。促销期间价格优惠，极好性价比。还会再次入住。\r\n', '2018-9-9', 8.8, 7.8, 7.8, 4.7, 7.6, 6.9, 9.8, 9.0, 7.4, NULL, 2),(4, 4, 14, '· 預訂1天早餐，結果退房時被收取2天早餐費，幸好覆核帳單才發現被多收了退回，浪費了十幾分鐘！\r\n下雨天，酒店前的路段會水浸', '2017-3-3', 8.8, 6.5, 5.5, 8.5, 8.8, 4.6, 5.6, 5.6, 6.4, NULL, 3),(5, 7, 13, '不足 · 早餐太贵，而且只给一个人的。\r\n酒店外环境太闹，确实自己的绿地活动空间。', '2017-3-8', 5.5, 8.5, 7.5, 7.6, 8.4, 7.1, 1.6, 8.6, 8.6, 00000000005, 5),(6, 11, 7, '不足 · 健身房的面积和一家五星酒店不相符，太小了。', '2018-9-6', 4.5, 6.5, 8.5, 7.6, 8.6, 1.3, 9.6, 7.4, 1.9, 00000000008, 3),(7, 15, 9, '地理位子好，酒店附近有很多美食。酒店服务好，非常人性化。早上很早到的酒店，商量后很快给予入住。促销期间价格优惠，极好性价比。还会再次入住。', '2018-8-4', 8.5, 4.6, 7.6, 4.9, 5.9, 8.9, 9.4, 7.9, 7.9, 00000000009, 5),(8, 20, 6, '服务友善专业，房间干净，周边很热闹，有现代的商业也有市井的美食', '2018-7-6', 5.6, 9.5, 6.8, 8.7, 9.5, 4.6, 8.5, 7.5, 7.9, 00000000005, 2),(9, 14, 10, '不足 · 被子感觉潮湿，床垫很硬', '2018-9-3', 7.5, 8.8, 6.8, 7.6, 6.5, 9.8, 7.8, 9.8, 7.8, 00000000005, 1),(10, 12, 2, ' 地理位置好，交通方便，服务好。房间临街，街景和对面的花园酒店的景色很好。周围就餐、购物方便。点都德、广州酒家都很好。酒店虽老，但不旧。', '2018-8-5', 7.6, 9.5, 1.9, 8.5, 8.8, 7.6, 9.5, 8.4, 8.4, 00000000004, 4),(11, 3, 6, '酒店有一股味道，不知道是否因为在黄梅季节', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.6, NULL, 10875),(12, 4, 7, '位置非常好，中心地段，去哪都不远，周围吃的也多', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.2, NULL, 46975),(13, 586796, 10, '卫生太差，异味太重了', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.5, NULL, 56928),(14, 586806, 12, '环境还不错', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.4, NULL, 4),(15, 586803, 11, 'wifi特别不稳定，信号不好', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.9, NULL, 59625),(16, 586802, 17, '物有所值', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 5.5, NULL, 6),(18, 93514, 21, '只睡了一晚，没特别感觉', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.8, NULL, 987551),(19, 113907, 20, '床很舒服', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 5.3, NULL, 276741),(20, 531862, 22, '感觉早餐太贵了', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 5.6, NULL, 893545),(21, 586802, 9, '退房时时掉了东西，夜晚才告知', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.9, NULL, 450174),(22, 586806, 35, '会客厅很舒服', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.8, NULL, 822121),(23, 586806, 33, '以为会很旧的、超乎预期', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 9.3, NULL, 775372),(24, 758488, 58, '地點優勢，方便出行，出租車或地鐵都很方便', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.6, NULL, 423398),(27, 758488, 56, '床睡的舒服', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.9, NULL, 109392),(28, 586802, 55, '收拾整洁 床舒服', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 5.9, NULL, 59625),(29, 586803, 6, '地点很好，外滩，豫园等景点都很近。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 9.2, NULL, 90379),(30, 758488, 10, '服务员收拾护肤品的风格特别可爱', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.0, NULL, 109392),(31, 113907, 23, '梅州语溪茶书院 ', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.5, NULL, 276741),(32, 3, 15, '去游泳非得戴泳帽，虽说可以从其它商店买，但是相信大部分游客都没有，只能从那里买（20元一个）。请问一句，就不能像房间里浴巾一样免费提供，旅客当然不能带走，就是使用嘛', '2017-5-5', 2.6, 3.6, 4.7, 2.6, 9.2, 3.8, 6.5, 9.2, 6.2, NULL, 4),(33, 3, 33, '房间隔音稍差，房间卫生仍有可以改进的地方。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.5, NULL, 369165),(34, 93514, 34, '工作人员带着上海人普遍的优越感……不过也可以理解', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.0, NULL, 369165),(35, 758488, 35, '虽然地处繁华地带，从窗口望出去，只能看到拥挤的大上海鳞次栉比的高楼窗口。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.0, NULL, 371600),(36, 586802, 36, '只有一个小小的建议，床上用品不是特别的舒适，被罩和床单接触皮肤时感觉硬硬的。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 9.0, NULL, 423398),(37, 113907, 50, '对住客也不提供免费的停车服务，这是五星级酒店不应该的。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.0, NULL, 371600),(38, 93514, 51, '淋浴房的玻璃门太重了，夹了我的手', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.0, NULL, 371600),(39, 3, 51, '服务很好，为不同的人提供不同的枕头', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.0, NULL, 423398),(40, 586802, 52, '地点超棒，临近南京东路步行街和外滩。酒店设施一流，到处金壁辉煌，十分舒适。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.0, NULL, 822121),(41, 758488, 53, '不明白為什麼要加收15%服務費，booking網站上也沒説要加收。房間裏面的食品貴的離譜，比外面貴能理解 可貴10倍價錢，感覺很可笑。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 5.9, NULL, 987551),(42, 93514, 54, '周围交通较拥堵，进出酒店不是很方便', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.8, NULL, 5),(50, 113907, 55, '虽然地处繁华地带，从窗口望出去，只能看到拥挤的大上海鳞次栉比的高楼窗口。', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.7, NULL, 6),(51, 3, 56, '位置方便，服务一流', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.8, NULL, 46975),(52, 4, 7, '位置方便，服务一流', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.7, NULL, 10875),(53, 586802, 6, '服务很好，为不同的人提供不同的枕头', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.5, NULL, 90379),(54, 113907, 4, '网络连接慢', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.8, NULL, 775372),(55, 4, 2, '床很舒服，房间很干净。\r\n\r\n 不足 · 早餐太贵，而且只给一个人的。\r\n酒店外环境太闹，确实自己的绿地活动空间', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 9.0, NULL, 775372),(56, 758488, 2, '· 預訂1天早餐，結果退房時被收取2天早餐費，幸好覆核帳單才發現被多收了退回，浪費了十幾分鐘！\r\n下雨天，酒店前的路段會水浸', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 5.0, NULL, 987551),(57, 93514, 11, '不足 · 被子感觉潮湿，床垫很硬', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.1, NULL, 942696),(58, 3, 12, '网络连接慢', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.3, NULL, 897706),(59, 113907, 12, '· 預訂1天早餐，結果退房時被收取2天早餐費，幸好覆核帳單才發現被多收了退回，浪費了十幾分鐘！\r\n下雨天，酒店前的路段會水浸', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 6.5, NULL, 4),(60, 531862, 13, '床很舒服，房间很干净。\r\n\r\n 不足 · 早餐太贵，而且只给一个人的。\r\n酒店外环境太闹，确实自己的绿地活动空间', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.0, NULL, 5),(70, 586796, 2, '网络连接慢', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 7.8, NULL, 6),(88, 586803, 14, '梅州语溪茶书院 ', NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 8.0, NULL, 2);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`hotellist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`hotellist`;
INSERT INTO `mzhotelonlinebooking`.`hotellist` (`HotelId`,`HotelName`,`HotelPer`,`HotelAdress`,`HotelPicture`,`HotelType`,`OnlineTime`,`RoomGrade`,`IsBreakfast`,`HotelFacilities`,`FacilitiesPicture`,`CheckInTime`,`LeaveTime`,`Pet`,`RePolicy`,`ChileAndBed`,`BankCard`,`HotelProvince`,`HotelDowntown`,`HotelArea`,`Longitude`,`Latitude`,`HotelPhoneNum`) VALUES (2, '梅州华美达酒店', '梅州华美达酒店位于梅州，提供免费WiFi和24小时前台。 每间客房都设有一间私人浴室。', ' 梅州梅江区江南彬芳大道 ', '../resources/res/images/hotels/43610164.jpg', '豪华型', '2017-3-14', 4, '0', '../res/img/梅州华美达酒店/Facilities', '../res/img/梅州华美达酒店/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。不允许携带宠物入住。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1368255604, 24.2810194521, NULL),(4, '梅州湖畔酒店 ', '梅州湖畔酒店属天然氧吧，吃，住，养生锻炼。', '梅州 梅江区 三角镇泮坑旅游区 ，近梅龙高速。', '../resources/res/images/hotels/156342197.jpg', '舒适型', '2018-9-8', 4, '0', NULL, NULL, '今日12：00', '明日12：00', '0', ' 允许1名10岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1476912252, 24.2536438598, NULL),(6, '万象江山商务酒店', '格林豪泰广东省梅州市万象江山商务酒店位于梅州，提供24小时前台和免费WiFi。 所有客房均配有电视。', '梅州金燕大道89号', '../resources/res/images/hotels/34686774.jpg', '舒适型', '2015-12-22', 3, '1', '../res/img/万象江山商务酒店 /Facilities', '../res/img/万象江山商务酒店 /Facilities/img', '今日12：00', '明日12：00', '1', '在客人入住当天的18:00后，酒店有权不予保留客房。敬请预计于上述时间后抵达的客人直接与酒店联系。预订确认信中附有联络详情。\r\n若在入住日的18:00后仍未到店，住宿有权取消预留客房。预计于该时间点后到店的客人，请提前直接与住宿联系，联系方式请参见订单确认信。客人必须： \r\n- 在登记入住时出示政府签发的有效身份证或护照 \r\n\r\n- 在登记入住当天的23:00之前登记入住\r\n', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1422034174, 24.2797566776, NULL),(7, '7天连锁酒店', '7天连锁酒店梅州五洲城汽车总站店位于嘉应，提供免费WiFi。每间客房均配有电视、空调和有线频道，提供电热水壶。私人浴室配有淋浴、免费洗浴用品和拖鞋。其它还包括床单。...', '梅州梅江区梅州大道29号（原金良宾馆)', '../resources/res/images/hotels/41964100.jpg', '经济型', '2014-12-19', 2, '0', '../res/img/7天连锁酒店/Facilities', '../res/img/7天连锁酒店/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1241099884, 24.3207563575, NULL),(9, '爱丽丝庄园民宿', '爱丽丝庄园民宿位于梅州，提供花园、露台、订票服务、餐厅、免费WiFi和旅游咨询台。\r\n\r\n客房均提供阳台、带淋浴和免费洗浴用品的私人浴室、平板电视以及吹风机。\r\n\r\n客人可以在梅州及其周边地区进行钓鱼等活动。 ', '梅州梅江区城北镇扎上村黄沙坑水库侧 ', '../resources/res/images/hotels/52275412.jpg', '实惠型', '2018-4-25', 1, '0', '../res/img/爱丽丝庄园民宿/Facilities', '../res/img/爱丽丝庄园民宿/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.0716412789, 24.3541685812, NULL),(10, '锦江之星', '锦江之星梅州彬芳大道店位于梅州。\r\n\r\n每间客房均配有电视、水壶以及带淋浴的私人浴室，提供拖鞋、免费洗浴用品和吹风机，让客人拥有舒适体验。\r\n\r\n酒店设有24小时前台。 \r\n\r\n和广州其他住宿相比，住过的客人都觉得这家的性价比很高！', '梅州梅州市梅江区彬芳大道88号  ', '../resources/res/images/hotels/113336172.jpg', '舒适型', '2016-7-26', 3, '1', '../res/img/锦江之星梅州彬芳大道店/Facilities', '../res/img/锦江之星梅州彬芳大道店/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n所有额外入住的儿童或成人，加床的收费是每晚 CNY 250 。\r\n\r\n最多容纳：每间客房1张加床。\r\n允许客人携带儿童入住。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1368703062, 24.3006792063, NULL),(11, '芭缇阳光连锁酒店', '芭缇阳光连锁酒店梅州汽车总站店位于梅州，配备带免费WiFi的带空调的客房。所有客房均配有带有线频道的电视和私人浴室。这家住宿提供24小时前台。 ', '梅州梅江区梅州大道1号', '../resources/res/images/hotels/59229973.jpg', '舒适型', '2017-8-3', 3, '1', '../res/img/芭缇阳光连锁酒店/Facilities', '../res/img/芭缇阳光连锁酒店/Facilities/img', '今日12：00', '明日12：00', '1', '客人必须： \r\n- 在登记入住时出示政府签发的有效身份证或护照 \r\n\r\n- 在登记入住当天的23:00之前登记入住\r\n恕不接待儿童入住。\r\n\r\n这间客房不可加床。\r\n\r\n宠物\r\n不允许携带宠物入住。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1189605684, 24.3212859718, NULL),(12, '7天连锁酒店', '7天连锁酒店梅州彬芳大道店位于嘉应。酒店提供免费WiFi。每间客房均提供有线电视、空调、电热水壶、带淋浴、免费洗浴用品和拖鞋的私人浴室以及床单。\r\n\r\n7天连锁酒店梅州彬芳大道店提供24小时前台、行李寄存处以及免费停车场。 ', '梅州梅江区彬芳大道37号新南大厦 –', '../resources/res/images/hotels/62702960.jpg', '经济型', '2014-12-19', 2, '1', '../res/img/7天连锁酒店/Facilities', '../res/img/7天连锁酒店/Facilities/img', '今日12：00', '明日12：00', '0', '恕不接待儿童入住。\r\n\r\n允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1361452471, 24.301211124, NULL),(13, ' 维也纳国际店', '维也纳国际店梅州锭子桥店位于梅州，提供免费WiFi，以及带有线电视的客房。\r\n\r\n私人浴室配有淋浴。\r\n\r\n前台提供周边的游览和活动信息。 \r\n\r\n维也纳国际店梅州锭子桥店于2015年9月1日开始在Booking.com上接受预订\r\n连锁酒店: 维也纳国际酒店', '梅州梅江区环市西路锭子桥南端维也纳国际酒店 ', '../resources/res/images/hotels/113336172.jpg', '豪华型', '2015-09-01', 4, '0', '../res/img/维也纳国际店/Facilities', '../res/img/维也纳国际店/Facilities', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n恕不接待儿童入住。\r\n\r\n这间客房不可加床。\r\n\r\n宠物\r\n不允许携带宠物入住。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.0979081898, 24.3013828115, NULL),(14, '梅州语溪茶书院 ', '梅州语溪茶书院位于梅州，享有山景，提供免费WiFi。这家家庭式住宿提供带露台的带空调的客房。\r\n\r\n这家家庭式住宿配有带微波炉、冰箱和电热水壶的小厨房。\r\n\r\n前台可为客人提供当地的出行和活动建议。\r\n\r\n客人还可以在共用休息室放松身心。 \r\n\r\n这间住宿提供以下设施或服务：\r\n 用餐区   露台   阳光露台   阳台   露台\r\n梅州语溪茶书院于2017年10月12日开始', '梅州梅江区三角镇泮坑旅游度假区泮坑小学对面 –', '../resources/res/images/hotels/121532547.jpg', '实惠型', '2018-08-09', 1, '1', '.../res/梅州语溪茶书院/dada', '.../res/梅州语溪茶书院/dada', '今日12：00', '明日12：00', '1', '不同类型的客房附带不同的取消预订和预先付费政策 请输入您的入住日期并参阅您所需的客房的条款。\r\n\r\n儿童和加床\r\n允许客人携带儿童入住。\r\n\r\n这间客房不可加床。', NULL, '', '广东省', '梅州市', '梅江区', 116.1437292252, 24.2601238598, NULL),(15, '科谷度假公寓', '科谷度假公寓（梅州客天下店）提供免费WiFi、花园和露台。\r\n\r\n每间房间都提供厨房以及带用餐区和电视的起居室。 \r\n\r\n科谷度假公寓（梅州客天下店）于2017年1月10日开始', '梅州梅江区客天下旅游产业园圣山西路E区爱巢大堂', '../resources/res/images/hotels/142348082.jpg', '尊贵型', '2017-1-10', 5, '1', '../res/sdd', '../res/sdd', '今日12：00', '明日12：00', '0', '恕不接待儿童入住。\r\n\r\n这间客房不可加床。\r\n\r\n宠物\r\n不允许携带宠物入住。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1539505186, 24.2669680331, NULL),(16, '富源来公寓', '富源来高档电梯公寓(丽都店）位于梅州，提供花园。住宿配备免费Wifi。\r\n\r\n这家带空调的公寓可通往阳台，配有1间独立卧室。住宿提供平板电视。\r\n\r\n这家公寓提供露台。 \r\n\r\n富源来高档电梯公寓(丽都店）于2018年8月27日开始在Booking.com上接受预订', '梅州梅江区丽都中路华梅3巷丽映尚城8栋701房', '../resources/res/images/hotels/149370486.jpg', '舒适型', '2018-8-27', 3, '1', '.../res/img/南丰/dvs', '.../res/img/南丰/dvs', '今日12：00', '明日12：00', '1', '允许客人携带儿童入住。\r\n\r\n所有额外入住的儿童或成人，加床的收费是每晚 CNY 350 。\r\n\r\n最多容纳：每间客房1张加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1305444665, 24.2847378035, NULL),(17, '泮坑酒店', '泮坑酒店坐落于梅州，配备带私人露台的住宿。这家住宿提供的设施包括餐厅、24小时前台、共用休息室和免费WiFi。客房配备阳台。\r\n\r\n所有房间均配有带有线频道的电视、电热水壶、淋浴设施、免费洗浴用品和书桌。这家度假村的所有客房都拥有休息区。\r\n\r\n这家住宿每天供应自助早餐。 \r\n\r\n地理位置好！住过的客人都说和梅州其他住宿相比，这家的位置棒棒哒。\r\n\r\n泮坑酒店于2017年8月10日开始', ' 梅州梅江区三角镇泮坑旅游区', '../resources/res/images/hotels/149370486.jpg', '舒适型', '2017-8-6', 3, '0', '.../res/img/远洋/fdvsv', '.../res/img/远洋/fdvsv', '今日12：00', '明日12：00', '1', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名6岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1468422252, 24.2562158598, NULL),(18, '万象江山酒店', '格林豪泰广东省梅州市万象江山商务酒店位于梅州，提供住宿。住宿提供免费WiFi。\r\n\r\n这家酒店的前台工作人员可随时为客人提供信息。 \r\n\r\n格林豪泰广东省梅州市万象江山商务酒店于2015年12月22日开始在Booking.com上接受预订\r\n连锁酒店: 格林豪泰酒店', '梅州金燕大道89号 ', '../resources/res/images/hotels/749338544.jpg', '舒适型', '2018-6-5', 3, '1', '.../res/img/W/fvsd', '.../res/img/W/fvsd', '今日12：00', '明日12：00', '1', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1422034174, 24.2797566776, NULL),(19, '金沙湾国际大酒店', '梅州金沙湾国际大酒店位于梅州，提供桑拿浴室、健身中心和晚间娱乐节目，客人可以享受桑拿和按摩服务。\r\n\r\n梅州金沙湾国际大酒店距离梅州火车站有13分钟车程，距离梅县机场有14分钟车程。\r\n\r\n所有客房都配备了空调和保险箱，设有咖啡机和迷你吧。还提供私人浴室。为了客人的舒适，客房还备有浴袍、拖鞋和吹风机。\r\n\r\n酒店内设有自动提款机。客人可以在酒店内锻炼身体。酒店提供自行车出租服务，设有商务设施。前台的工作人员可以提供行李寄存服务。 \r\n\r\n梅州金沙湾国际大酒店于2016年1月14日开始', '梅州江南沿江西路', '../resources/res/images/hotels/156342197.jpg', '尊贵型', '2018-8-9', 5, '1', '.../res/img/新粤/dhc', '.../res/img/新粤/dhc', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1238208215, 24.3037889969, NULL),(20, '碧桂园假日酒店', '梅州碧桂园假日酒店位于梅州，配有季节性室外泳池。住宿为客人提供24小时前台和礼宾服务。\r\n\r\n这家酒店的客房均配有平板电视。 Country Garden Phoenix Hotel的客房配有私人浴室，也提供免费WiFi。这家住宿的房间均提供空调和书桌。\r\n\r\n这家住宿提供欧陆式或亚洲风味早餐。\r\n\r\n最近的机场是揭阳潮汕机场，距离梅州碧桂园假日酒店有95公里。 \r\n\r\n梅州碧桂园假日酒店于2016年9月18日开始', ' 梅州梅县畲江镇高新产业园中心大道，近206国道', '../resources/res/images/hotels/121532547.jpg', '豪华型', '2016-9.18', 4, '1', '.../res/baitiane/dvd', '.../res/baitiane/dvd', '今日12：00', '明日12：00', '1', '欢迎儿童入住。', NULL, NULL, '广东省', '梅州市', '梅县区', 115.9907473546, 24.0297916744, NULL),(21, '雁鸣湖旅游度假村', '梅州雁鸣湖旅游度假村位于大坪，坐落在风景如画的度假胜地内，提供覆盖了公共区的免费WiFi。\r\n\r\n度假村距离梅州火车站有45分钟车程。观光旅游方面，度假村距离灵光寺有不到15分钟的车程。\r\n\r\n梅州雁鸣湖旅游度假村的每间客房都装有空调，设有一间带拖鞋、浴袍和吹风机的浴室，配备了一部电话和一台冰箱。\r\n\r\n前台可为客人安排行李寄存服务和外币兑换服务。为方便商务旅客，度假村还设有会议设施。客人可以在高尔夫球场打高尔夫球，也可以在网球场打网球。 \r\n\r\n梅州雁鸣湖旅游度假村于2015年12月1日开始', '梅州雁洋镇南福村 ', '../resources/res/images/hotels/67087363.jpg', '豪华型', '2015-12-7', 4, '0', '.../res/地中海/vsd', '.../res/地中海/vsd', '今日12：00', '明日12：00', '1', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅县区', 116.3914494758, 24.4451112839, NULL),(22, '尚客优连锁酒店', '尚客优连锁酒店梅州嘉应大学店位于梅州，距离嘉应大学仅有1分钟步行路程，提供客房。\r\n\r\n所有客房均配有24小时热水淋浴、私人浴室和免费洗浴用品，让客人享受舒适的住宿体验。 \r\n\r\n尚客优连锁酒店梅州嘉应大学店于2016年10月14日开始', '梅州梅松路121号恩环楼 ', '../resources/res/images/hotels/81584098.jpg', '经济型', '2016-10-14', 2, '0', NULL, NULL, '今日12:00', '明日12:00', '0', '允许客人携带儿童入住。\r\n\r\n允许1名2岁以下的儿童，加1张婴儿床，收费：每人每晚CNY80。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1000244553, 24.2737366342, NULL),(23, '\r\n梅州客天下国际大酒店 ', '地理位置好！住过的客人都说和湛江其他住宿相比，这家的位置棒棒哒。\r\n\r\n梅州客天下国际大酒店位于客天下旅游产业园，近万达商业广场、万象江山步行街，出行便利。\r\n　　酒店将客家文化和现代风格完美结合，五大主题酒店均诠释了客天下本质的特征——崇尚自然，它以得天独厚的自然风光和舒适怡人的自然气候以及独具匠心的建筑风格，舒适一流的度假设施，让您感觉到客家传统文化的魅力，浓郁的南国情调及国际一流的人性化服务，感受回家的温馨。同时，酒店具备大型的会议场所、中西餐厅、泳池等配套设施，提供体贴入微的尊贵服务。', '梅州 梅江区 客天下旅游产业园 ，近梅州火车站', '../resources/res/images/hotels/52275412.jpg', '尊贵型', '2017-9-4', 5, '1', NULL, NULL, '今日14：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1579605186, 24.2667080331, NULL),(24, '梅州金沙湾国际大酒店', '梅州金沙湾国际大酒店座落于梅州市中心商业繁华区，毗邻风景秀丽的梅江河畔，周围餐厅、购物、政府机关等林立。\r\n　　梅州金沙湾国际大酒店由广东省恒泰公路工程有限公司按高星级标准投资建造的豪华酒店，占地面积约15000平方米，总建筑面积为38000多平方米。酒店由A、B两座塔楼组成，裙楼设临江饭店、全日自助餐厅、宴会厅、多功能厅、桑拿，康体、KTV娱乐等配套设施一应俱全。是一家集住宿、餐饮、会议、康体、娱乐为一体的大型商务休闲酒店。\r\n梅州金沙湾国际大酒店始终以“全面顾客满意”为核心，推行“一站式”的服务方式，以“诚心为您”的服务理念，让您在商务旅途中尊享“家”的温馨与惬意。', '梅州 梅江区 江南沿江西路 ，近西桥。', '../resources/res/images/hotels/113336172.jpg', '尊贵型', '2018-6-1', 5, '2', NULL, NULL, '今日12：00', '明日12：00', '1', ' 允许1名10岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1238208215, 24.3037889969, NULL),(25, '梅州昌盛豪生大酒店', '梅州昌盛豪生大酒店为梅州市地标性建筑，位于府前大道8号，城市最黄金地段，人民广场，曾宪梓体育馆近在咫尺。秀美梅花山壮观景致尽收眼底。  \r\n　　梅州昌盛豪生大酒店由昌盛集团有限公司投资，美国豪生酒店管理公司管理，外部装潢豪华夺目，套房时尚舒适，配置卓越的高科技便利设施及亲切自然的服务，专为商旅客人设计。 \r\n　　酒店大堂达970平方米，层高近10米，豪华经典、气势雄伟。采用各类高档材质修饰墙壁，描绘出客家山水的秀丽景象及人文风情，同时配合来自澳洲的Airaroma品牌香薰，使宾客感受非同凡响体验。 \r\n　　酒店内设有以“食享”为主基调的4间美食餐厅及大堂酒廊，提供中、西餐及独具特色的面馆。健身中心、室外网球场、水疗、室外游泳池等健身设施一应俱全。 \r\n　　约1200平方米的无柱式豪生宴会厅层高8.6米，可满足1200人的会议或780人的宴会；可拆分为三个多功能厅，根据会议及用餐的需求进行多种组合，超大LED显示屏、全方位立体音响及视听设备、立体投影仪、专业的服务管理团队为您的会议活动奠定良好的基础；二层5间会议室面积从76-120平方米不等，为分组讨论及中小型会议提供了理想的场地。  \r\n　　梅州昌盛豪生大酒店以“超乎期望，精彩难忘 Your Expectations， Are Exceeded”为服务理念，为您提供贴心、周到、专业的优质服务，诚邀您前来入住。 ', '梅州 府前大道8号 ，人民广场对面。', '../resources/res/images/hotels/149370486.jpg', '豪华型', '2018-8-8', 4, '1', NULL, NULL, '今日12：00', '明日12：00', '1', '不允许携带宠物入住', NULL, NULL, '广东省', '梅州市', '梅县区', 116.0878823552, 24.2830368319, NULL),(26, '宝象华悦国际酒店 ', '梅州宝象华悦国际酒店地处世界客都梅州市中心，位于梅州繁华地段，地理位置优越，距梅州市政府约5分钟车程，周边工商、农业银行约1分钟路程；约10分钟车程即可到万达、大润发广场进行购物；步行约10分钟内就可到“尚派、潮汇”酒吧休闲放松及“江南美食城”体验全国各地特色小食。距红色文化的叶帅故居、雁南飞、雁鸣湖、灵关寺约35分钟车程、客天下、千佛塔等著名景点均在10分钟车程左右。\r\n　　这是梅州一家世界酒店国际金钥匙联盟酒店由香港宝象华悦国际酒店管理有限公司管理，酒店建筑面积为31000平米，现代中式建筑风格，集食、住、会务、游、购、娱配套于一体。\r\n　　酒店拥有各式客房百余余间（套），设有正宗粤菜及特色客家菜式的中餐厅，5个不同类型的宴会厅可承接各种不同的宴席，最大得可容纳500人同时用餐，绿色有机的象妈妈农家菜馆突出客家美食的精髓；商务会议室3间，可供20人至300人同时会议。\r\n　　酒店秉着“先利人、后利己、用心极致、满意加惊喜，在客人的惊喜中找到富有的人生”的服务理念，为您提供竭尽所能的服务。', '梅州 梅江区 丽都西路34号,与沿江西路交界处', '../resources/res/images/hotels/81584098.jpg', '豪华型', '2017-9-8', 4, '1', NULL, NULL, '今日12：00', '明日12：00', '0', '允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1224464665, 24.2878458035, NULL),(27, '梅州金叶国际大酒店', '梅州金叶国际大酒店地处梅州江南闹市中的“世外桃园”+——梅江河畔，地处闽粤赣三省交界处的“金三角”，风光无限、景致宜人。\r\n　　是一家集旅业、餐饮、会展、娱乐为一体的多功能服务的酒店，是富有文化品位的梅州城区标志性建筑物之一。梅州金叶国际大酒店以独特的建筑风格与周围幽雅的环境融为一体，客房洁净、温馨，是商、旅人士下榻的上佳之处。', '梅州 梅江区 江南彬芳大道30号 ，近梅州市政府。', '../resources/res/images/hotels/81584098.jpg', '尊贵型', '2018-9-7', 5, '1', NULL, NULL, '今日12：00', '明日12：00', '1', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名4岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1371303062, 24.2992692063, NULL),(28, '梅州银星大酒店', '明粤酒店位于湛江，设有健身中心和内部酒吧。\r\n\r\n梅州银星大酒店地处梅州市商业中心地带，正对剑英公园，是一家商务型酒店。酒店距离机场、火车站、汽车站仅5分钟车程，交通便利，四通八达；邻近大型购物中心更近在咫尺，生活十分便利。\r\n　　梅州银星大酒店空气清新，环境优美，坚持以“宾客至上，服务第一”的服务宗旨，笑迎八方宾客，是您在世界客都——梅州商务旅游、休闲度假的首选酒店。', '梅州 梅江区 华南大道39号（梅州市剑英公园对面） ，近梅州市国土资源综合服务中心。', '../resources/res/images/hotels/121532547.jpg', '豪华型', '2018-7-9', 5, '0', NULL, NULL, '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名4岁以下的儿童，使用现有床铺免费', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1236445104, 24.277710348, NULL),(29, '梅州春宇宾馆', '春宇宾馆位于梅州市梅江区江南鸿通路8号(帝景湾大门正对面)，东临归读公园，南靠彬芳大道直通火车站。拥68间客房，120个床位，高雅的酒店设计、各房间配有独立空调，配置宽带WIFI上网及国内长途电话，室内大型停车场;二至六楼客房;七楼棋牌室.四周环境优雅、尽显酒店豪华气派，入住春宇宾馆是阁下理想的选择。', '梅州 梅江区 鸿通路8号 ，近新中路。', '../resources/res/images/hotels/121532547.jpg', '舒适型', '2016-8-9', 2, '0', NULL, NULL, '今日12：00', '明日12：00', '1', ' 允许1名10岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1390503062, 24.2914192063, NULL),(31, '梅州四季华景酒店', '四季华景酒店位于梅州市梅县区府前大道，临近商业区，地理位置优良，酒店提供一流的服务和设施，酒店所有员工竭诚为您服务。', '梅州 梅县区 新城府前大道88号华景商业广场 ，梅县文体中心侧。', '../resources/res/images/hotels/121532547.jpg', '舒适型', '2018-7-7', 2, '0', NULL, NULL, '今日12：00', '明日12：00', '0', '免费！ 允许1名4岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅县区', 116.0884939742, 24.2798271068, NULL),(32, '维也纳酒店梅州火车站店 ', '地理位置好！住过的客人都说和梅州其他住宿相比，这家的位置棒棒哒。\r\n\r\n和梅州其他住宿相比，住过的客人都觉得这家的性价比很高！', '梅州梅塘东路59号(三角地圆盘旁)', '../resources/res/images/hotels/89448803.jpg', '豪华型', '2018-9-9', 6, '4', NULL, NULL, '今日12：00', '明日12：00', '0', '免费！ 允许1名4岁以下的儿童，使用现有床铺免费。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1208857438, 24.2750175714, NULL),(33, '梅州华美达酒店', '酒店距离最近的机场——揭阳潮汕国际机场90公里。 \r\n\r\n地理位置好！住过的客人都说和梅州其他住宿相比，这家的位置棒棒哒。', '梅州梅江区江南彬芳大道 ', '../resources/res/images/hotels/156342197.jpg', '豪华型', '2017-8-9', 4, '0', NULL, NULL, '今日12：00', '明日12：00', '0', '附加费用不会自动计算在总价中，您需在入住时另行支付。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1368255604, 24.2810194521, NULL),(34, '维也纳酒店', '维也纳酒店广东梅州江南店坐落在梅州市。\r\n\r\n这家酒店的每间客房均提供空调、有线电视、电烧水壶和私人浴室，配有拖鞋、免费洗浴用品和吹风机。', '梅州江南团结三路36号', '../resources/res/images/hotels/52275412.jpg', '豪华型', '2017-8-9', 5, '0', NULL, NULL, '今日12：00', '明日12：00', '1', '附加费用不会自动计算在总价中，您需在入住时另行支付。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1348603062, 24.2955592063, NULL),(35, '尚客优快捷酒店', '尚客优连锁广东梅州梅县新城店于2018年1月12日开始', '梅州梅县莲心路桃源酒店', '../resources/res/images/hotels/121532547.jpg', '舒适型', '2018-7-7', 3, '1', NULL, NULL, '今日12：00', '明日12：00', '0', '不提供加床', NULL, NULL, '广东省', '梅州市', '梅县区', 116.1047056397, 24.2859466523, NULL),(36, '格林东方酒店', '格林东方酒店(梅州丽都西路客都店)地处梅州市丽都西路，毗邻风景秀丽的梅江河畔，方便前往市政府、一江两岸。\r\n　　\r\n　　格林东方酒店(梅州丽都西路客都店)配套设施齐全，拥有各类型豪华客房、可容千人的客都宴会厅及各类雅致厢房。酒店同时提供粤、客家菜式，早、夜茶、拥有大中小型会议中心、KTV、棋牌室、大型花园式生态停车场等附属设施，是你旅途中的温馨驿站。', '梅州 梅江区 丽都西路32号 ，梅江三路与丽都西路交界。', '../resources/res/images/hotels/89448803.jpg', '豪华型', '2017-8-9', 4, '0', NULL, NULL, '今日12：00', '明日12：00', '1', '这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1240534665, 24.2875998035, NULL),(50, '驿家精品酒店', '酒店地理位置优越，闹中取静，环境舒适，交通出行十分便利。酒店装修简约时尚，舒适温馨。', '梅州 梅县区 新县城府前大道农业银行对面 ，近公园南路口。 ', '../resources/res/images/hotels/59229973.jpg', '舒适型', '2015-6-6', 3, '1', '../res/img/瓦迪客公寓/Facilities', '../res/img/瓦迪客公寓/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅县区', 116.0904339742, 24.2777071068, NULL),(51, '梅州又见民宿 ', '又见民宿位于梅州，提供酒吧、免费WiFi、24小时前台和客房服务。 民宿配有电视。\r\n', '梅州 梅江区 彬芳大道75-18号 ，曾宪梓中学北门旁。', '../resources/res/images/hotels/94250000.jpg', '实惠型', '2012-3-6', 1, '1', '../res/img/趣致国际酒店公寓/Facilities', '../res/img/趣致国际酒店公寓/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名10岁以下的儿童，使用现有床铺免费。\r\n\r\n允许1名年龄较大的儿童或者成人，一张加床收费：每人每晚CNY150。\r\n\r\n最多容纳：每间客房1张加床。\r\n\r\n这间客房不可加床婴儿床。\r\n\r\n所提出的任何加床要求均需获得住宿提供方的确认。\r\n\r\n附加费用不会自动计算在总价中，您需在入住时另行支付。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1357549563, 24.2887594641, NULL),(52, '梅州飞尚精品酒店 ', '微八酒店西村地铁站店位于广州，距离越秀公园2.2公里，设有共用休息室，各处均禁烟，距离广州市艺术博物馆有不到20分钟的车程，距离西村地铁站有3分钟的步行路程。\r\n\r\n微八酒店西村地铁站店距离五羊石像有不到20分钟的车程，距离怀圣寺约有15分钟的车程，距离广州白云国际机场有1小时车程。\r\n\r\n酒店的客房均配有带淋浴、免费洗浴用品和吹风机的私人浴室，提供电视、空调和书桌。\r\n\r\n客人可在广州及其周边地区参加徒步旅行等活动。微八酒店西村地铁站店提供熨烫服务以及传真和复印等商务设施。24小时前台的工作人员可为客人提供当地的出行建议。 \r\n\r\n旅友们喜爱荔湾区的理由：街头小吃、当地美食和当地集市。\r\n\r\n夫妻/情侣特别喜欢这家住宿的位置，为两人住宿体验给出了8.3分。\r\n\r\n梅州飞尚精品酒店是深圳市海俐投资实业有限公司旗下精品酒店，位于梅州市梅江区彬芳大道南园D1-4栋。酒店以简约舒适的欧日风格呈现。酒店地理位置优越。距江南商业圈、江南汽车站、火车站、仅需5分钟车程，梅州市机场约15分钟车程；交通十分便利，是您商务、旅游、购物、度假的首选之地。梅州飞尚精品酒店由名师设计，格调优雅，温馨舒适，尽显欧日风格。我们秉承飞尚“尊重备至、温良谦恭、真诚质朴、乐于助人、彬彬有礼”的核心价值观。为您提供超值、健康、安全、便捷的消费体验，是您商务旅居的最佳选择。', '梅州 梅江区 彬芳大道南园D1-4栋(近万达广场)', '../resources/res/images/hotels/102070707.jpg', '经济型', '2016-5-17', 2, '1', '../res/img/微八酒店/Facilities', '../res/img/微八酒店/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名16岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1371849563, 24.2844294641, NULL),(53, '梅州圣山小筑酒店', '梅州圣山小筑酒店位于自然风光秀丽，人文景观独特的国家4A级旅游景区—中国客天下，是以民俗风情为主题，以自然相融为特色，以生态体验为基底，融合山体、森林、船木和绿植等元素，着力打造天地人和的禅意空间。\r\n　　小筑以群山相连，与丛林相拥，遵循“依山就势、融于自然、轻微植入、和谐发展”的理念，充分挖掘圣人谷的地域地点和环境优势，在潺潺流水和绿茵盘绕的丛林中有机生长。小筑的设计匠心独运，精致优雅，无不体现对细节的极致追求和对自然生态的尊重。设计师为住客提供全方位的绝佳视角，从不同角度观赏周围的自然美景，做到开门是景，推窗见绿。', '梅州 东升村客天下旅游产业园 ，近天赐阁。', '../resources/res/images/hotels/41964100.jpg', '尊贵型', '2009-11-9', 5, '1', '../res/img/广州香格里拉大酒店/Facilities', '../res/img/广州香格里拉大酒店/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n免费！ 所有额外入住的2岁以下的儿童，加婴儿床不收费。\r\n\r\n所有额外入住的16岁以下的儿童，加床的收费是每晚 CNY 409 。\r\n\r\n所有额外入住的年龄较大的儿童或者成人，加床的收费是每晚 CNY 409 。\r\n\r\n最多容纳：每间客房1张加床。\r\n\r\n所提出的任何加床或婴儿床的要求均需获得酒店的确认。\r\n\r\n附加费用不会自动计算在总价中，您需在入住时另行支付。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1554675186, 24.2709870331, NULL),(54, '梅州麓湖山酒店', '梅州麓湖山酒店位于南口镇广东麓湖山文化产业园区内，地段优越。客房温馨舒适，干净整洁，是您理想的入住场所。', '梅州 梅县区 南口镇广东麓湖山文化产业园区内 ，近高尔夫球会。', '../resources/res/images/hotels/89448803.jpg', '尊贵型', '2016-10-19', 5, '0', '../res/img/伊索公寓/Facilities', '../res/img/伊索公寓/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 最多可容纳2名12岁以下的儿童，使用现有床铺不收费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅县区', 115.983820139, 24.2554502431, NULL),(55, '梅州雁南飞围龙大酒店 ', '梅州雁南飞围龙大酒店地处雁南飞茶田度假村内，临近桥溪古韵景区、雁鸣湖度假村，山水秀丽、清新的空气会让您心旷神怡。\r\n　　梅州雁南飞围龙大酒店所处景区总占地面积667公顷，是广东宝丽华集团有限公司投资开发，是一个融茶叶生产和旅游度假于一体的生态农业示范区和旅游景区。酒店拥有各类型客房，房间优美典雅，房内设施齐全，服务个性化、细致。\r\n　　同时，酒店配备茶室、桌球室、乒乓球室、网球场、健身室、按摩室等康乐设施，以完美体现客家文化和茶文化为内涵兴建了围龙食府、茶情阁、会议中心等完整的旅游度假及会议设施。\r\n　　此外，梅州雁南飞围龙大酒店赏心悦目的自然环境和园林艺术、传统与现代相得益彰的围龙屋建筑、精彩优美的客家歌舞和茶艺表演、多情的客家山水、可口的客家美食，让您流连忘返。', '梅州 梅县区 雁洋镇长教管理区 ，近省道s223。', '../resources/res/images/hotels/44060699.jpg', '豪华型', '2014-10-24', 4, '0', '../res/img/7天优品/Facilities', '../res/img/7天优品/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅县区', 116.3779127896, 24.3865383736, NULL),(56, '梅州乾坤润精品酒店', '梅州乾坤润精品酒店位于梅州梅县大新城府前大道侧客家新世界综合体内，客家新世界商业广场引入知名百货购物商场、影院、电器、娱乐城、饮食餐饮等商业，实现购物、逛街、看电影、打电玩、餐饮、零售、文化、体育、娱乐等一站式消费服务。\r\n　　\r\n　　酒店采用欧式复古轻奢设计风格，力求为往来游客提供一个既方便快捷玩乐又有文化情怀的精品酒店居所。', '梅州 梅县区 府前大道客家新世界大润发营销中心旁 ，近广梅南路口。', '../resources/res/images/hotels/43610164.jpg', '舒适型', '2018-1-31', 3, '0', '../res/img/迎商公寓/Facilities', '../res/img/迎商公寓/Facilities/img', '今日12：00', '明日12：00', '1', '允许客人携带儿童入住。\r\n\r\n这间客房不可加床。住宿方允许客人携带宠物入住，但需事先提出请求。 住宿方可能会收取额外费用。', NULL, NULL, '广东省', '梅州市', '梅县区', 116.0819923552, 24.2899768319, NULL),(57, '梅州迎宾馆', '梅州迎宾馆位于梅州市江南沿江西路，地处市区中心、梅江河畔；东与梅江桥、剑英大桥南端相连，西接嘉应大桥，后通梅州市委大院，景色秀丽，地理位置优越。 \r\n　　梅州迎宾馆集餐饮、住宿、商务为一体，具有浓厚客家文化底蕴，拥有各式温馨客房可供您选择。此外，宾馆还设有停车场、前台贵重物品保险柜、有可无线上网的公共区域、中餐厅、大堂吧等配套服务设施，为您提供一应俱全的便捷生活。 ', '梅州 梅江区 江南沿江西路 ，梅江公园旁。', '../resources/res/images/hotels/149370486.jpg', '实惠型', '2018-4-20', 1, '1', '../res/img/浮生堂/Facilities', '../res/img/浮生堂/Facilities/img', '今日12：00', '明日12：00', '0', '每间客房允许使用现有床铺的最多可入住儿童人数取决于您所选的房型。请查看所选房型以确定最多可入住人数。\r\n\r\n不提供婴儿床\r\n不提供加床', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1243108215, 24.3098689969, NULL),(58, '梅州嘉州假日酒店', '梅州嘉州假日酒店位于梅州市江南新中路21号，地处梅州经济政治文化中心，距离火车站只有4到5公里，行程较短，出行方便，开车只要10分钟到15分钟左右，到机场也相当很方便。地理位置好，到市政府才有两三百米，周围有商场广场与城市综合体环绕，购物比较方便，除此之外，还有汇丰书城与酒店遥相辉映，文化气息浓郁，客房卫生干净，精致典雅舒适，又有合适优惠的定位价格，服务周到。酒店边上小巷子就有几家梅州特色早餐店与餐馆，让您在感受梅州传统文化精粹的同时还能品尝到客家特色美食，吃住两不误，这就是，嘉州假日。', '梅州 江南新中路21号 ，近市政府。', '../resources/res/images/hotels/52275412.jpg', '舒适型', '2017-3-10', 3, '1', '../res/img/逸居/Facilities', '../res/img/逸居/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '梅州市', '梅江区', 116.1317603062, 24.2940192063, NULL),(59, '梅州栢琚酒店', '梅州栢琚酒店位于梅州市梅县区核心位置的新县城门楼对面，建筑面积约为16000平方米，距离梅州城西高速出口、锭子桥汽车站、顺丰汽车站仅5分钟车程，地段优越，交通便捷。公寓周边是槐江新区，槐江新区将在火电站搬迁后规划为：集高等教育学府、三甲医院、高端住宅区和城市广场等一体化的大型新区，客家新世界购物中心也离酒店仅有百米之遥。华美达广场由栢琚酒店，华美轩酒家和莲庭西餐厅组成，酒店由意大利佛罗伦萨国际设计学院年轻的设计团队设计，简约大气而个性十足。酒店主打色为令人倍感温馨又明快的淡米黄，设计处处体贴又简约大方。入住酒店的客人可凭房卡在每天上午，下午，晚上特定时间段享受饮料茶水，咖啡点心，并可参加每周一次的音乐派对，是年轻人交友放松，休闲聚会的最佳住所。酒店餐饮部门由香港UID设计师事务所设计，典雅而华贵。', '梅州 梅县区 广梅中路678号新县城门楼对面 ，近府前大道。', '../resources/res/images/hotels/52275412.jpg', '舒适型', NULL, 3, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '广东省', '梅州市', '梅县区', 116.0807944329, 24.294562817, NULL),(88, '惠州西湖宾馆', '惠州西湖宾馆位于惠州市惠城区，距离惠州西湖1公里，距离惠州汽车总站2.1公里，提供客房服务和行李寄存处。\r\n\r\n惠州西湖宾馆的客房均配有书桌和平板有线电视。私人浴室提供吹风机。\r\n\r\n宾馆距离深圳宝安国际机场78公里。 \r\n\r\n旅友们喜爱惠城区的理由：山地行走、餐厅和天气温暖。\r\n\r\n惠州西湖宾馆于2017年11月15日开始', ' 惠州, 惠城区, 下角芳华洲 ', '../resources/res/images/hotels/52275412.jpg', '舒适型', '2017-11-15', 3, '1', '../res/img/逸居/Facilities', '../res/img/逸居/Facilities/img', '今日12：00', '明日12：00', '0', '允许客人携带儿童入住。\r\n\r\n免费！ 允许1名12岁以下的儿童，使用现有床铺免费。\r\n\r\n这间客房不可加床。', NULL, NULL, '广东省', '惠州市', '惠城区', 114.4064391375, 23.1034457449, NULL),(89, '惠州小径湾艾美酒店 在新窗口中打开  ', '小径湾艾美酒店位于惠东，设有季节性开放的室外游泳池，享有海景。客人可以光顾酒店内的餐厅。\r\n\r\n酒店的部分客房设有休息区，供客人在忙碌了一天后休闲放松。每间客房均设有空调和平板电视，还配有水壶，设有私人浴室，浴袍、拖鞋和免费洗浴用品。\r\n\r\n酒店设有24小时前台。\r\n\r\n小径湾艾美酒店距离惠州机场45公里，距离深圳宝安国际机场115公里。\r\n\r\n旅友们喜爱惠阳区的理由：商务出行、海滩和休闲。\r\n\r\n夫妻/情侣特别喜欢这家住宿的位置，为两人住宿体验给出了8.5分。', ' 惠州, 惠阳区, 大亚湾霞涌，小径湾 1 号', '../resources/res/images/hotels/52275412.jpg', '尊贵型', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '广东省', '惠州市', '惠阳区', 114.6977994, 22.7953037375, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`hotelroomlist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`hotelroomlist`;
INSERT INTO `mzhotelonlinebooking`.`hotelroomlist` (`HotelId`,`RoomId`,`HotelRoomId`) VALUES (2, 1, 1),(4, 2, 2),(6, 3, 3),(10, 4, 4),(6, 1, 5),(6, 2, 6),(7, 2, 7),(7, 1, 8),(7, 3, 9),(7, 4, 10);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`landmarklist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`landmarklist`;
INSERT INTO `mzhotelonlinebooking`.`landmarklist` (`LandmarkId`,`LandmarkName`,`Hot`,`LandmarkLongitude`,`LandmarkLalitude`,`CityName`) VALUES (100001, '广州白云国际机场 ', 1, 113.3158714862, 23.3964036695, '广州市'),(100002, '广州火车站 ', 1, 113.2644043102, 23.1554004235, '广州市'),(100003, '黄花岗七十二烈士陵园 ', 0, 113.3010106563, 23.1469826444, '广州市'),(100004, '广东革命历史博物馆 ', 0, 113.2897280914, 23.1346553688, '广州市'),(100005, '天河体育馆 ', 1, 113.33136378, 23.1437679837, '广州市'),(100006, '丽柏广场', 0, 113.3194742909, 23.109212533, '广州市'),(100007, '五羊石像 ', 1, 113.2693729208, 23.1440779141, '广州市'),(100008, '广州起义烈士陵园 ', 0, 113.2921979172, 23.1352113884, '广州市'),(100009, '广州塔', 1, 113.3309751406, 23.1123809784, '广州市'),(100010, '广州大剧院', 1, 113.3287468446, 23.1211691273, '广州市'),(100011, '维多利亚广场', 0, 113.2637290244, 23.2028615214, '广州市'),(100012, '广州动物园', 0, 113.3117890197, 23.1476653945, '广州市'),(100013, '越秀公园 ', 1, 113.2727374459, 23.1469289159, '广州市'),(100014, '广州大学', 0, 113.377238079, 23.0466582522, '广州市'),(100015, '暨南大学', 0, 113.3540422912, 23.136884406, '广州市'),(100016, '南方医科大学', 0, 113.3409364254, 23.193174152, '广州市'),(100017, '华南师范大学 ', 0, 113.3589081793, 23.144996042, '广州市'),(100018, '网易大厦', 0, 113.3797428722, 23.1319463242, '广州市'),(100019, '广州红专厂 ', 0, 113.3756945615, 23.1181485229, '广州市'),(100020, '长隆欢乐世界 ', 0, 113.3379280268, 23.0052487966, '广州市'),(100021, '长隆水上乐园 ', 0, 113.3306374092, 23.0084495245, '广州市'),(100022, '上下九步行街 ', 0, 113.2557899845, 23.1211010188, '广州市'),(100024, '环市路酒吧街 ', 0, 113.3689081392, 22.9282437517, '广州市');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`manager` WRITE;
DELETE FROM `mzhotelonlinebooking`.`manager`;
INSERT INTO `mzhotelonlinebooking`.`manager` (`managerId`,`loginName`,`password`,`status`,`createDate`,`role`,`lastTime`,`username`) VALUES (1, 'admin', '123456', '1', '2019-01-30 15:07:29', NULL, NULL, '梅州酒店管理员');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`orderlist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`orderlist`;
INSERT INTO `mzhotelonlinebooking`.`orderlist` (`UserId`,`OrderId`,`HotelId`,`OrderTime`,`OrderMoney`,`OrderIsPay`,`IsChargeback`,`InDate`,`OrderDay`,`OutDate`,`RoomNum`,`PeopleNum`,`ContactNum`,`HotelRoomId`,`OrderEmail`,`HotelName`,`HotelType`,`RoomGrade`,`HotelAdress`,`OrderUserName`,`HotelImg`,`RoomType`) VALUES (1, 1, 1, '2018-3-3', 4855, 1, 0, '2018-3-8', 2, '2018-3月-9日', 1, '1位成人和1位儿童', '17875512026', 1, '2584125752@qq.com', '梅州华美达酒店', '尊贵型', 4, ' 梅州梅江区江南彬芳大道 ', '小玲', '../resources/res/images/hotels/142348082.jpg', NULL),(1, 2, 6, '2018-3-6', 512, 1, 0, '2018-7-7', 1, '2018-7月-9日', 1, '1位成人和1位儿童', '17875512026', 2, '2587469354@qq.com', '7天连锁酒店', '普通型', 2, '梅州梅江区梅州大道29号（原金良宾馆)', '小彦', '../resources/res/images/hotels/52275412.jpg', NULL),(2, 3, 1, '2018-3-8', 12558, 1, 0, '2018-7-7', 3, '2018-7月-9日', 1, '1位成人和1位儿童', '17987987987', 3, '2658713595@qq.com', '梅州华美达酒店', '尊贵型', 4, ' 梅州梅江区江南彬芳大道', '小志', '../resources/res/images/hotels/121532547.jpg', NULL),(3, 4, 1, '2018-8-30', 255, 0, 0, '2018-8-31', 2, '2018-9月-1日', 1, '1位成人和4位儿童', '19849848655', 4, '3597546594@qq.com', '梅州华美达酒店', '尊贵型', 4, ' 梅州梅江区江南彬芳大道', '娜娜', '../resources/res/images/hotels/67087363.jpg', NULL),(4, 5, 1, '2018-8-2', 254, 1, 0, '2018-8-9', 4, '2018-8月-11日', 1, '1位成人和1位儿童', '12564456456', 6, '3697458224@qq.com', '科谷度假公寓', '豪华型', 5, '梅州梅江区客天下旅游产业园圣山西路E区爱巢大堂', '娜娜', '../resources/res/images/hotels/142348082.jpg', NULL),(3, 6, 58, '2018-8-30', 666, 1, 0, '2018-8-31', 10, '2018-9月-9日', 1, '1位成人和4位儿童', '17875512076', 2, '632755825@qq.com', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'Nier', '../resources/res/images/hotels/41964100.jpg', NULL),(3, 10875, 21, '2018-9-8', 1776, 1, 0, '2018年9月8日', 1, '2018年9月9日', 2, '2位成人和2位儿童', '+86 17875512076', 5, '3697458224@qq.com', '雁鸣湖旅游度假村', '豪华型', 4, '梅州雁洋镇南福村 ', 'qinxiaoxiong', '../resources/res/images/hotels/67087363.jpg', NULL),(586796, 46975, 8, '2018-12-23', 130, 1, 0, '2018年12月23日', 1, '2018年12月24日', 1, '2位成人和0位儿童', '17875512076', NULL, '046975', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道 ', 'zsad', '../resources/res/images/hotels/67087363.jpg', '商务客房'),(3, 56928, 2, '2019-4-11', 520, 1, 0, '2019年4月18日', 2, '2019年4月20日', 2, '2位成人和2位儿童', '14567854511', NULL, '056928', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道 ', 'sdfsfd', '../resources/res/images/hotels/67087363.jpg', '商务客房'),(758488, 59625, 6, '2019-4-11', 440, 1, 0, '2019年4月12日', 1, '2019年4月13日', 2, '2位成人和2位儿童', '15698564821', NULL, '059625', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'assad', '../resources/res/images/hotels/41964100.jpg', '行政房'),(3, 90379, 9, '2018-9-8', 440, 0, 0, '2018年9月14日', 1, '2018年9月15日', 2, '2位成人和2位儿童', '+64 17875512076', 7, '3697458224@qq.com', '7天连锁酒店', '经济型', 2, '梅州梅江区梅州大道29号（原金良宾馆)', 'Niernier', '../resources/res/images/hotels/52275412.jpg', NULL),(3, 109392, 9, '2018-9-9', 888, 1, 0, '2018年9月14日', 2, '2018年9月16日', 1, '2位成人和0位儿童', '+86 17875512076', NULL, '109392', '7天连锁酒店', '经济型', 2, '梅州梅江区梅州大道29号（原金良宾馆)', 'NierTina', '../resources/res/images/hotels/52275412.jpg', NULL),(586796, 254957, 6, '2018-12-23', 320, 1, 0, '2018年12月23日', 1, '2018年12月24日', 2, '2位成人和2位儿童', '17875555551', NULL, '254957', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'zas', '../resources/res/images/hotels/41964100.jpg', '豪华房'),(3, 260361, 2, '2019-4-12', 640, 0, 0, '2019年4月18日', 2, '2019年4月20日', 2, '2位成人和2位儿童', '18758645856', NULL, '260361', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道 ', 'aaasd', '../resources/res/images/hotels/41964100.jpg', '豪华房'),(586796, 276741, 6, '2018-12-25', 1776, 1, 0, '2018年12月25日', 1, '2018年12月26日', 2, '2位成人和2位儿童', '17865231547', NULL, '276741', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'aaaaaa', '../resources/res/images/hotels/41964100.jpg', '商务行政套房'),(2, 369165, 1, '2018-9-6', 260, 1, 0, '2018年9月8日', 1, '2018年9月9日', 2, '2位成人和5位儿童', '+64 17875512076', 4, '3597546594@qq.com', '科谷度假公寓', '尊贵型', 5, '梅州梅江区客天下旅游产业园圣山西路E区爱巢大堂', '刘德华', '../resources/res/images/hotels/142348082.jpg', NULL),(3, 371600, 52, '2018-9-9', 38850, 0, 0, '2018年9月14日', 25, '2018年10月9日', 2, '2位成人和2位儿童', '17875512076', NULL, '371600', '7天连锁酒店', '经济型', 2, '梅州梅江区梅州大道29号（原金良宾馆)', 'dasdsadsfz', '../resources/res/images/hotels/52275412.jpg', NULL),(3, 394301, 6, '2019-4-12', 260, 0, 0, '2019年4月12日', 1, '2019年4月13日', 2, '2位成人和2位儿童', '17875512089', NULL, '394301', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'adasasdas', '../resources/res/images/hotels/41964100.jpg', '商务客房'),(93514, 423398, 6, '2019-4-10', 320, 1, 0, '2019年4月19日', 1, '2019年4月20日', 2, '2位成人和2位儿童', '15978564521', NULL, '423398', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'aasad', '../resources/res/images/hotels/41964100.jpg', '豪华房'),(567881, 450174, 11, '2018-9-9', 260, 0, 0, '2018年9月11日', 1, '2018年9月12日', 2, '2位成人和2位儿童', '+84 17875512036', NULL, '450174', '科谷度假公寓', '尊贵型', 5, '梅州梅江区客天下旅游产业园圣山西路E区爱巢大堂', 'asdasdas', '../resources/res/images/hotels/142348082.jpg', NULL),(669806, 539248, 6, '2019-4-22', 320, 0, 1, '2019年4月23日', 1, '2019年4月24日', 2, '2位成人和2位儿童', '17878878652', NULL, '539248', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'dsaasd', '../resources/res/images/hotels/34686774.jpg', '豪华房'),(669806, 631756, 2, '2019-4-22', 480, 0, 1, '2019年4月22日', 3, '2019年4月25日', 1, '1位成人和0位儿童', '17875512076', NULL, '631756', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道 ', 'sasd', '../resources/res/images/hotels/41964100.jpg', '豪华房'),(586796, 706537, 11, '2018-12-24', 3108, 1, 0, '2018年12月24日', 2, '2018年12月26日', 2, '2位成人和2位儿童', '13838384382', NULL, '706537', '芭缇阳光连锁酒店', '舒适型', 3, '梅州梅江区梅州大道1号', 'zzzsd', '../resources/res/images/hotels/26291349.jpg', '精英大房或双床房'),(669806, 710921, 2, '2019-4-22', 440, 1, 0, '2019年4月22日', 1, '2019年4月23日', 2, '2位成人和2位儿童', '17879986545', NULL, '710921', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道 ', 'adasda', '../resources/res/images/hotels/41964100.jpg', '行政房'),(3, 775372, 7, '2019-2-12', 640, 0, 0, '2019年2月12日', 2, '2019年2月14日', 2, '2位成人和2位儿童', '17846657953', NULL, '775372', '7天连锁酒店', '经济型', 2, '梅州梅江区梅州大道29号（原金良宾馆)', 'wa', '../resources/res/images/hotels/26291349.jpg', '豪华房'),(3, 822121, 6, '2018-12-19', 0, 0, 0, '2018年12月20日', 0, '2018年12月20日', 2, '2位成人和2位儿童', '15019817375', NULL, '822121', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'wefw', '../resources/res/images/hotels/41964100.jpg', NULL),(669806, 831073, 2, '2019-4-22', 880, 0, 1, '2019年4月22日', 2, '2019年4月24日', 2, '2位成人和2位儿童', '18759589624', NULL, '831073', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道 ', 'asdsada', '../resources/res/images/hotels/41964100.jpg', '行政房'),(758488, 893545, 2, '2019-4-11', 320, 1, 0, '2019年4月11日', 1, '2019年4月12日', 2, '2位成人和2位儿童', '15487564523', NULL, '893545', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道 ', 'sfsaasfas', '../resources/res/images/hotels/41964100.jpg', '豪华房'),(758488, 897706, 6, '2019-4-11', 880, 1, 0, '2019年4月11日', 2, '2019年4月13日', 2, '2位成人和2位儿童', '15698564582', NULL, '897706', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'ssasd a', '../resources/res/images/hotels/41964100.jpg', '行政房'),(586796, 942696, 6, '2018-12-26', 1776, 1, 0, '2018年12月30日', 2, '2019年1月1日', 1, '2位成人和0位儿童', '17965512368', NULL, '942696', '万象江山商务酒店', '舒适型', 3, '梅州金燕大道89号', 'sasa', '../resources/res/images/hotels/41964100.jpg', '商务行政套房'),(567881, 987551, 7, '2018-9-8', 1776, 0, 0, '2018年9月8日', 1, '2018年9月9日', 2, '2位成人和2位儿童', '+86 17875512036', 7, '3597546594@qq.com', '梅州华美达酒店', '豪华型', 4, ' 梅州梅江区江南彬芳大道', 'asfw', '../resources/res/images/hotels/67087363.jpg', NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`roomlist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`roomlist`;
INSERT INTO `mzhotelonlinebooking`.`roomlist` (`RoomId`,`RoomType`,`RoomPrice`,`RoomNumber`,`SurplusRoomNumber`,`Facilities`,`RoomSize`,`DiscountTime`,`Discount`,`roomMin`) VALUES (1, '商务客房', 130, 40, 56, NULL, 20, '0', 0.8, 130),(2, '豪华房', 160, 28, 20, NULL, 35, '1', 0.8, 128),(3, '行政房', 220, 20, 13, NULL, 40, '4', 0.7, 220),(4, '商务行政套房', 888, 10, 13, NULL, 88, '3', 0.88, 888),(5, '精英大房或双床房', 777, 5, 5, NULL, 77, '4', 0.88, 777);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`searchhotellist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`searchhotellist`;
INSERT INTO `mzhotelonlinebooking`.`searchhotellist` (`HotelId`,`RoomMin`,`RoomRating`,`Relax`,`RoomQuantity`,`Discount`,`FrontDesk`,`CancelPrepay`,`MealDinner`,`RoomType`,`Rating`,`ChainHotels`,`SearchHotelId`) VALUES (2, 888, '尊贵型', '健身中心、Spa、按摩', 1, 1, 1, '预付无需信用卡', '含早餐', '酒店', 7, '无', 100001),(6, 188, '舒适型', '按摩', 1, 1, 1, '预付无需信用卡', '不含早', '酒店', 7, '无', 100006),(7, 442, '豪华型', '健身中心、Spa、按摩', 1, 1, 1, '无需预付', '不含早餐', '酒店', 7, '无', 100007),(10, 118, '经济型', '徒步活动', 1, 1, 1, '预付无需信用卡', '不含早餐', '旅馆', 6, '无', 100008),(9, 128, '经济型', '徒步活动', 1, 1, 1, '预付无需信用卡', '不含早餐', '酒店', 7, '汉庭连锁', 100009),(10, 438, '尊贵型', '健身中心、Spa、按摩、自行车租赁', 1, 1, 1, '无需预付', '不含早餐', '酒店', 7, '无', 100010),(11, 888, '尊贵型', '健身中心、Spa、按摩、自行车租赁、徒步活动', 1, 1, 1, '预付无需信用卡', '含早餐', '别墅', 8, '无', 100011),(12, 160, '舒适型', '徒步活动', 0, 0, 0, '预付无需信用卡', '不含早餐', '公寓', 7, '无', 100012),(50, 168, '舒适型', '室内游泳池', 0, 1, 0, '无需预付', '不含早餐', '青旅', 7, '无', 100050),(51, 988, '豪华型', '室内游泳池', 0, 0, 0, '无需预付', '不含早餐', '公寓', 7, '无', 100051),(52, 158, '无评级', '室内游泳池', 1, 0, 1, '预付无需信用卡', '不含早餐', '酒店', 0, '无', 100052),(53, 1388, '尊贵型', '健身中心、按摩、自行车租赁', 1, 1, 1, '无需预付', '含早餐', '酒店', 8, '无', 100053),(54, 138, '无评级', '自行车租赁（额外收费）', 0, 0, 0, '预付无需信用卡', '不含早餐', '公寓', 0, '无', 100054),(55, 59, '无评级', '按摩', 1, 0, 1, '预付无需信用卡', '不含早餐', '酒店', 0, '7天连锁', 100055),(13, 188, '尊贵型', '室内游泳池', 1, 1, 1, '预付无需信用卡', '不含早餐', '酒店', 8, '格林联盟', 100056),(14, 288, '尊贵型', '室内游泳池', 1, 1, 1, '无需预付', '含早餐', '别墅', 7, '汉庭连锁', 100057),(15, 258, '尊贵型', '室内游泳池', 1, 1, 1, '无需预付', '含早餐', '别墅', 7, '汉庭连锁', 100058),(16, 88, '实惠型', 'Spa、自行车租赁', 1, 0, 0, '预付无需信用卡', '不含早餐', '酒店', 6, '无', 100059),(17, 366, '尊贵型', '室内游泳池', 1, 0, 1, '预付无需信用卡', '含早餐', '酒店', 7, '7天连锁', 100060),(18, 358, '尊贵型', '徒步活动', 1, 1, 1, '无需预付', '含早餐', '酒店', 7, '7天连锁', 100061),(19, 188, '舒适型', '健身中心、按摩、自行车租赁、室内游泳池', 1, 0, 0, '预付无需信用卡', '含早餐', '酒店', 6, '无', 100062),(20, 1888, '尊贵型', '健身中心、按摩、自行车租赁、室内游泳池', 1, 0, 1, '无需预付', '含早餐', '酒店', 7, '汉庭连锁', 100063),(21, 1688, '尊贵型', '健身中心、按摩、自行车租赁、室内游泳池', 1, 1, 1, '无需预付', '含早餐', '酒店', 8, '7天连锁', 100064),(22, 438, '豪华型', '健身中心、按摩、自行车租赁、室内游泳池', 1, 0, 1, '无需预付', '含早餐', '酒店', 7, '格林联盟', 100065),(23, 1258, '尊贵型', '健身中心、按摩、自行车租赁、室内游泳池', 1, 0, 1, '无需预付', '含早餐', '酒店', 7, '7天连锁', 100066),(24, 268, '尊贵型', '徒步活动', 1, 0, 1, '无需预付', '含早餐', '酒店', 7, '7天连锁', 100067),(25, 248, '豪华型', '徒步活动', 1, 0, 1, '无需预付', '含早餐', '酒店', 7, '7天连锁', 100068),(26, 248, '豪华型', '徒步活动', 1, 0, 1, '预付无需信用卡', '含早餐', '酒店', 7, '汉庭连锁', 100069),(27, 188, '舒适型', '自行车租赁', 1, 0, 0, '免费取消', '不含早餐', '公寓', 6, '无', 100070),(28, 468, '豪华型', '自行车租赁', 1, 0, 1, '免费取消', '不含早餐', '酒店', 7, '锦江之星', 100071),(29, 258, '豪华型', '室内游泳池', 1, 0, 0, '免费取消', '不含早餐', '酒店', 7, '锦江之星', 100072),(58, 168, '舒适型', '自行车租赁', 1, 0, 0, '预付无需信用卡', '不含早餐', '酒店', 6, '无', 100073),(31, 168, '舒适型', '自行车租赁', 0, 0, 0, '预付无需信用卡', '不含早餐', '酒店', 5, '无', 100074),(32, 668, '豪华型', '室内游泳池', 1, 0, 0, '免费取消', '含早餐', '酒店', 7, '7天连锁', 100075),(33, 668, '豪华型', '室内游泳池', 1, 0, 1, '免费取消', '含早餐', '酒店', 7, '汉庭连锁', 100076),(34, 508, '豪华型', '室内游泳池', 1, 0, 1, '免费取消', '含早餐', '酒店', 7, '锦江之星', 100077),(35, 148, '舒适型', '徒步活动', 0, 0, 1, '无需预付', '不含早餐', '酒店', 4, '无', 100078),(36, 508, '尊贵型', '室内游泳池', 1, 1, 1, '免费取消', '含早餐', '酒店', 6, '无', 100079),(88, 238, '舒适型', '健身中心、按摩、自行车租赁、室内游泳池', 1, 1, 0, '免费取消', '含早餐', '宾馆', 7, '无', 100081),(58, 108, '舒适型', '自行车租赁', 1, 0, 0, '预付无需信用卡', '不含早餐', '宾馆', 8, '无', 100084),(56, 268, '豪华型', '健身中心、按摩、自行车租赁、室内游泳池', 1, 0, 1, '无需预付', '含早餐', '旅馆', 7, '无', 100085),(57, 88, '实惠型', '自行车租赁', 1, 1, 1, '无需预付', '不含早餐', '宾馆', 8, '无', 100086);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`tucao` WRITE;
DELETE FROM `mzhotelonlinebooking`.`tucao`;
INSERT INTO `mzhotelonlinebooking`.`tucao` (`tucaoId`,`tucaoWord`) VALUES (1, '去游泳非得戴泳帽，虽说可以从其它商店买，但是相信大部分游客都没有，只能从那里买（20元一个）。请问一句，就不能像房间里浴巾一样免费提供，旅客当然不能带走，就是使用嘛'),(2, '床很舒服，房间很干净。\r\n\r\n 不足 · 早餐太贵，而且只给一个人的。\r\n酒店外环境太闹，确实自己的绿地活动空间'),(3, '地理位子好，酒店附近有很多美食。酒店服务好，非常人性化。早上很早到的酒店，商量后很快给予入住。促销期间价格优惠，极好性价比。还会再次入住。\r\n'),(4, '不足 · 被子感觉潮湿，床垫很硬'),(5, '· 預訂1天早餐，結果退房時被收取2天早餐費，幸好覆核帳單才發現被多收了退回，浪費了十幾分鐘！\r\n下雨天，酒店前的路段會水浸'),(6, '地点很好，外滩，豫园等景点都很近。'),(7, '服务员收拾护肤品的风格特别可爱'),(8, '原本我是訂一大床，但現場是給兩張床'),(9, '服务很好，为不同的人提供不同的枕头'),(10, '网络连接慢'),(11, '位置方便，服务一流'),(12, '位置不错，南京东路4号出口直走几百米就到；房间是最满意的，宽敞明亮，很舒适；没有买早餐，在我看来也不是特别必要的，因为周边紧邻南京步行街，还有周边有不少小店和便利店，早餐也比较好解决。'),(13, '服务态度更积极会比较好；淋浴间的下水速度比较慢。'),(14, '地下停车场的员工素质太差，和我的朋友发生不必要的争吵。投诉到大堂，经理居然不做任何处理。\r\n\r\n\r\n눇酒店设施很新，很舒服，服务也好，地理位置优越，性价比比较高'),(15, '淋浴房的玻璃门太重了，夹了我的手'),(16, '房间隔音稍差，房间卫生仍有可以改进的地方。\r\n\r\n房间隔音稍差，房间卫生仍有可以改进的地方。\r\n\r\n房间隔音稍差，房间卫生仍有可以改进的地方。'),(17, '工作人员带着上海人普遍的优越感……不过也可以理解'),(18, '晚上窗外有轻微滴水的声音'),(19, '虽然地处繁华地带，从窗口望出去，只能看到拥挤的大上海鳞次栉比的高楼窗口。'),(20, 'booking预定不含早餐，结果早餐太贵了，不值'),(21, '明明Booking上早餐是150一人，但在酒店咨询是要180多。'),(22, '地点超棒，临近南京东路步行街和外滩。酒店设施一流，到处金壁辉煌，十分舒适。'),(23, '只有一个小小的建议，床上用品不是特别的舒适，被罩和床单接触皮肤时感觉硬硬的。'),(24, '不明白為什麼要加收15%服務費，booking網站上也沒説要加收。房間裏面的食品貴的離譜，比外面貴能理解 可貴10倍價錢，感覺很可笑。'),(25, '对住客也不提供免费的停车服务，这是五星级酒店不应该的。'),(26, '周围交通较拥堵，进出酒店不是很方便');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mzhotelonlinebooking`.`userlist` WRITE;
DELETE FROM `mzhotelonlinebooking`.`userlist`;
INSERT INTO `mzhotelonlinebooking`.`userlist` (`UserId`,`UserSurnme`,`UserName`,`UserPassword`,`UserEmail`,`UserPhoneNumber`,`UserCountry`,`UserPicture`,`UserNickName`,`UserBirthday`,`UserSex`,`createDate`) VALUES (3, '朱', '小兵', 'e10adc3949ba59abbe56e057f20f883e', 'Zhuxb@qq.com', '17875512076', '法国', '3img.png', 'Neir', '2010-7-16', '男', '2019-01-18 16:09:17'),(4, NULL, 'Tina', 'e10adc3949ba59abbe56e057f20f883e', 'Zhuxb@qq.com', NULL, NULL, NULL, 'Jason', NULL, NULL, '2019-01-23 16:09:14'),(93514, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'Zhuxba@qq.com', NULL, NULL, '93514img.png', 'lucy', NULL, NULL, '2019-04-10 11:42:04'),(113907, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', '12@qq.com', NULL, NULL, NULL, 'sandy', NULL, NULL, '2019-03-28 12:44:13'),(531862, '', '', 'e10adc3949ba59abbe56e057f20f883e', 'Zhuxb3@qq.com', '', NULL, NULL, 'suwei', NULL, NULL, '2019-04-10 11:06:47'),(586796, '', 'Lucy', 'e10adc3949ba59abbe56e057f20f883e', '17875512076@qq.com', '1111', NULL, '586796img.png', 'Nier', NULL, NULL, '2019-01-13 16:09:26'),(586802, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', '1@qq.com', NULL, NULL, NULL, 'tina', NULL, NULL, '2019-03-26 11:47:08'),(586803, NULL, '111', 'e10adc3949ba59abbe56e057f20f883e', '21312@qq.com', '12312123', NULL, NULL, 'macy', NULL, NULL, '2019-03-28 09:34:54'),(586806, NULL, '111', '698d51a19d8a121ce581499d7b701668', '21312@qq.com', '14312123111', NULL, NULL, 'navy', NULL, NULL, '2019-03-28 09:45:59'),(669806, '', '', 'e10adc3949ba59abbe56e057f20f883e', 'zxb@qq.com', '', NULL, NULL, '光子', NULL, NULL, '2019-04-22 15:12:52'),(703022, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'Zhuxb2@qq.com', NULL, NULL, NULL, 'tandy', NULL, NULL, '2019-04-10 11:05:45'),(758488, '', '', 'e10adc3949ba59abbe56e057f20f883e', 'Zhuxbaaa@qq.com', '', NULL, '758488img.png', '撒打算撒旦', NULL, NULL, '2019-04-11 14:48:04'),(796431, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'Zhuxbq@qq.com', NULL, NULL, '796431img.png', NULL, NULL, NULL, '2019-04-16 11:13:11');
UNLOCK TABLES;
COMMIT;
CREATE DEFINER = `root`@`localhost` TRIGGER `roomMinPrice_tri` AFTER INSERT ON `userlist` FOR EACH ROW update roomlist set roommin = roomprice * discount where discounttime = (select date_format(curdate(),'%w') from dual);;
