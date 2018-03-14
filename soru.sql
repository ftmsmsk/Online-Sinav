/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : soru

 Target Server Type    : MySQL
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 07/02/2018 14:35:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kullanici
-- ----------------------------
DROP TABLE IF EXISTS `kullanici`;
CREATE TABLE `kullanici`  (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `adi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `soyadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kullanici
-- ----------------------------
INSERT INTO `kullanici` VALUES (83, 'yu', 'yu');
INSERT INTO `kullanici` VALUES (84, 'gül', 'gül');
INSERT INTO `kullanici` VALUES (85, 'halil', 'han');
INSERT INTO `kullanici` VALUES (86, 'a', 'a');
INSERT INTO `kullanici` VALUES (87, 'a', 'a');
INSERT INTO `kullanici` VALUES (88, 'b', 'ö');
INSERT INTO `kullanici` VALUES (89, 'nazan', 'a');
INSERT INTO `kullanici` VALUES (90, 'de', 'f');
INSERT INTO `kullanici` VALUES (91, 'err', 'err');
INSERT INTO `kullanici` VALUES (92, 'mali', 'mali');
INSERT INTO `kullanici` VALUES (93, 'vel', 'i');
INSERT INTO `kullanici` VALUES (94, 'jlpğpü', 'pğopüğ');
INSERT INTO `kullanici` VALUES (95, 'ıy9o0*', 'o90p*-');
INSERT INTO `kullanici` VALUES (96, 'zeynep', 'j');

-- ----------------------------
-- Table structure for secenek
-- ----------------------------
DROP TABLE IF EXISTS `secenek`;
CREATE TABLE `secenek`  (
  `secenekid` int(11) NOT NULL AUTO_INCREMENT,
  `soruid` int(11) NULL DEFAULT NULL,
  `secenek` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `sdurum` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`secenekid`) USING BTREE,
  INDEX `secenekSil`(`soruid`) USING BTREE,
  CONSTRAINT `secenekSil` FOREIGN KEY (`soruid`) REFERENCES `sorular` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of secenek
-- ----------------------------
INSERT INTO `secenek` VALUES (0, NULL, 'cevap verilmedi', 'boş');
INSERT INTO `secenek` VALUES (1, 5, '1500', 'yanlış');
INSERT INTO `secenek` VALUES (2, 5, '1453', 'doğru');
INSERT INTO `secenek` VALUES (3, 5, '1200', 'yanlış');
INSERT INTO `secenek` VALUES (4, 2, 'Ankara', 'doğru');
INSERT INTO `secenek` VALUES (5, 2, 'İstanbul', 'yanlış');
INSERT INTO `secenek` VALUES (6, 5, '1300', 'yanlış');
INSERT INTO `secenek` VALUES (14, 9, 'ali', 'yanlis');
INSERT INTO `secenek` VALUES (15, 9, 'veli', 'yanlis');
INSERT INTO `secenek` VALUES (17, 2, 'izmir', 'yanlis');
INSERT INTO `secenek` VALUES (18, 2, 'samsun', 'yanlis');
INSERT INTO `secenek` VALUES (19, 4, 'c', 'yanlis');
INSERT INTO `secenek` VALUES (20, 4, 'a', 'doğru');
INSERT INTO `secenek` VALUES (21, 4, 'l', 'yanlis');
INSERT INTO `secenek` VALUES (23, 11, 'kuzey yarım kure', 'doğru');
INSERT INTO `secenek` VALUES (25, 11, 'güney yarım küre', 'yanlis');

-- ----------------------------
-- Table structure for sonuc
-- ----------------------------
DROP TABLE IF EXISTS `sonuc`;
CREATE TABLE `sonuc`  (
  `soid` int(11) NOT NULL AUTO_INCREMENT,
  `ssoruid` int(11) NULL DEFAULT NULL,
  `ssecid` int(11) NULL DEFAULT NULL,
  `skulid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`soid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sonuc
-- ----------------------------
INSERT INTO `sonuc` VALUES (68, 2, 4, 93);
INSERT INTO `sonuc` VALUES (69, 4, 0, 93);
INSERT INTO `sonuc` VALUES (70, 5, 2, 93);
INSERT INTO `sonuc` VALUES (71, 9, 0, 93);
INSERT INTO `sonuc` VALUES (72, 11, 23, 93);
INSERT INTO `sonuc` VALUES (73, 2, 0, 95);
INSERT INTO `sonuc` VALUES (74, 4, 0, 95);
INSERT INTO `sonuc` VALUES (75, 5, 0, 95);
INSERT INTO `sonuc` VALUES (76, 9, 0, 95);
INSERT INTO `sonuc` VALUES (77, 11, 0, 95);
INSERT INTO `sonuc` VALUES (78, 2, 17, 96);
INSERT INTO `sonuc` VALUES (79, 4, 0, 96);
INSERT INTO `sonuc` VALUES (80, 5, 2, 96);
INSERT INTO `sonuc` VALUES (81, 9, 15, 96);
INSERT INTO `sonuc` VALUES (82, 11, 23, 96);
INSERT INTO `sonuc` VALUES (83, 2, 0, 96);
INSERT INTO `sonuc` VALUES (84, 4, 0, 96);
INSERT INTO `sonuc` VALUES (85, 5, 0, 96);
INSERT INTO `sonuc` VALUES (86, 9, 0, 96);
INSERT INTO `sonuc` VALUES (87, 11, 0, 96);

-- ----------------------------
-- Table structure for sorular
-- ----------------------------
DROP TABLE IF EXISTS `sorular`;
CREATE TABLE `sorular`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `soruAdi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sorular
-- ----------------------------
INSERT INTO `sorular` VALUES (2, 'Türkiyenin başkenti neresidir?');
INSERT INTO `sorular` VALUES (4, 'Alfabenin ilk harfi nedir?');
INSERT INTO `sorular` VALUES (5, 'İstanbulun fethi ne zamandır?');
INSERT INTO `sorular` VALUES (8, 'uhygtfrd');
INSERT INTO `sorular` VALUES (9, 'yüksek ökçeler kitabının yazarı kimdir?');
INSERT INTO `sorular` VALUES (11, 'Türkiye hangi yarım kürededir?');

-- ----------------------------
-- Procedure structure for kullaniciId
-- ----------------------------
DROP PROCEDURE IF EXISTS `kullaniciId`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kullaniciId`(IN `adi` varchar(255),IN `soyadi` varchar(255))
BEGIN
	select kullanici.kid from kullanici where kullanici.adi=adi and kullanici.soyadi=soyadi;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for kullaniciKayit
-- ----------------------------
DROP PROCEDURE IF EXISTS `kullaniciKayit`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kullaniciKayit`(IN `adi` varchar(255),IN `soyadi` varchar(255))
BEGIN
insert into kullanici values(null,adi,soyadi);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sayi
-- ----------------------------
DROP PROCEDURE IF EXISTS `sayi`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sayi`()
BEGIN
	select COUNT(soruAdi) from sorular where soruAdi!='null';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for secenekEkle
-- ----------------------------
DROP PROCEDURE IF EXISTS `secenekEkle`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secenekEkle`(IN `sid` int(11),IN `cvp` varchar(255),IN `cevap` varchar(255))
BEGIN
	insert into secenek VALUES(null,sid,cvp,cevap);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for secenekGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `secenekGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secenekGetir`(IN `sid` int(11))
BEGIN
	select soruid,secenekid,secenek,sdurum from secenek where secenek.soruid=sid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for secenekSil
-- ----------------------------
DROP PROCEDURE IF EXISTS `secenekSil`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secenekSil`(IN `secenekid` int(11))
BEGIN
	delete from secenek where secenek.secenekid=secenekid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sinavKayit
-- ----------------------------
DROP PROCEDURE IF EXISTS `sinavKayit`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sinavKayit`(IN `ssoruid` int(11),IN `ssecid` int(11),IN `skulid` int(11))
BEGIN
	insert into sonuc values(null,ssoruid,ssecid,skulid);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sinavSoruGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `sinavSoruGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sinavSoruGetir`()
BEGIN
select s.sid,se.secenekid,s.soruAdi,se.secenek from sorular as s
inner join secenek as se
on s.sid=se.soruid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sinavSorulari
-- ----------------------------
DROP PROCEDURE IF EXISTS `sinavSorulari`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sinavSorulari`()
BEGIN
	SELECT so.sid,so.soruAdi from sorular as so
	inner join secenek as se
	on so.sid=se.soruid GROUP BY sid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sonucGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `sonucGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sonucGetir`(IN `ad` VARCHAR(255),IN `soyad` VARCHAR(255))
BEGIN
	select s.sid,s.soruAdi,se.secenek,se.sdurum from sonuc as so
	inner join kullanici as k
	on so.skulid=k.kid
	inner join sorular as s
	on so.ssoruid=s.sid
	inner join secenek as se
	on so.ssecid=se.secenekid where k.adi=ad and k.soyadi=soyad;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for soru
-- ----------------------------
DROP PROCEDURE IF EXISTS `soru`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `soru`(IN `sid` int(11))
BEGIN
	SELECT * from sorular where sorular.sid=sid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for soruEkle
-- ----------------------------
DROP PROCEDURE IF EXISTS `soruEkle`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `soruEkle`(IN `soru` varchar(255))
BEGIN
	insert into sorular values(null,soru);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for soruGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `soruGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `soruGetir`(IN `sid` int(11))
BEGIN
	select sorular.soruAdi from sorular where sorular.sid=sid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for soruSil
-- ----------------------------
DROP PROCEDURE IF EXISTS `soruSil`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `soruSil`(IN `sid` int(11))
BEGIN
	delete from sorular where sorular.sid=sid;


END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
