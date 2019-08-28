/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 50041
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 50041
 File Encoding         : 65001

 Date: 28/08/2019 14:35:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area`  (
  `area_id` int(5) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `area_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`area_id`),
  UNIQUE INDEX `UK_AREA` USING BTREE(`area_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES (3, '和园一号', '和园一号', 12, '2017-06-04 19:12:58', '2017-06-04 19:12:58');
INSERT INTO `tb_area` VALUES (4, '和园二号', '和园二号', 10, '2017-06-04 19:13:09', '2017-06-04 19:13:09');
INSERT INTO `tb_area` VALUES (5, '和园三号', '和园三号', 9, '2017-06-04 19:13:18', '2017-06-04 19:13:18');
INSERT INTO `tb_area` VALUES (6, '和园四号', '和园四号', 7, '2017-06-04 19:13:29', '2017-06-04 19:13:29');

-- ----------------------------
-- Table structure for tb_award
-- ----------------------------
DROP TABLE IF EXISTS `tb_award`;
CREATE TABLE `tb_award`  (
  `award_id` int(10) NOT NULL AUTO_INCREMENT,
  `award_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `award_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `award_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `point` int(10) NOT NULL DEFAULT 0,
  `priority` int(2) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `expire_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `shop_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`award_id`),
  INDEX `fk_award_shop_idx` USING BTREE(`shop_id`),
  CONSTRAINT `fk_award_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'InnoDB free: 10240 kB; (`shop_id`) REFER `shopping/tb_shop`(`shop_id`) ON DELETE' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line`  (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `line_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `line_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `priority` int(2) NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`line_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
INSERT INTO `tb_head_line` VALUES (11, '1', '1', '/upload/item/headtitle/banner1.jpg', 1, 1, '2017-06-13 20:31:57', '2017-06-13 20:31:57');
INSERT INTO `tb_head_line` VALUES (12, '2', '2', '/upload/item/headtitle/banner2.jpg', 2, 1, '2017-06-13 20:37:17', '2017-06-13 20:37:17');
INSERT INTO `tb_head_line` VALUES (14, '3', '3', '/upload/item/headtitle/banner3.jpg', 3, 1, '2017-06-13 20:39:34', '2017-06-13 20:39:34');
INSERT INTO `tb_head_line` VALUES (15, '4', '4', '/upload/item/headtitle/banner4.jpg', 4, 1, '2017-06-13 20:40:01', '2017-06-13 20:40:01');

-- ----------------------------
-- Table structure for tb_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth`  (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`local_auth_id`),
  UNIQUE INDEX `uk_local_profile` USING BTREE(`user_name`),
  INDEX `fk_local_profile` USING BTREE(`user_id`),
  CONSTRAINT `fk_local_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'InnoDB free: 10240 kB; (`user_id`) REFER `shopping/tb_person_info`(`user_id`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------
INSERT INTO `tb_local_auth` VALUES (6, 8, 'xiangze', 's05bse6q2qlb9qblls96s592y55y556s', '2017-06-04 19:09:51', '2017-06-04 19:09:51');
INSERT INTO `tb_local_auth` VALUES (7, 9, 'test', 's05bse6q2qlb9qblls96s592y55y556s', '2017-06-05 22:05:13', '2017-06-05 22:05:13');

-- ----------------------------
-- Table structure for tb_person_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `birthday` datetime NULL DEFAULT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `profile_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_flag` int(2) NOT NULL DEFAULT 0,
  `shop_owner_flag` int(2) NOT NULL DEFAULT 0,
  `admin_flag` int(2) NOT NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY USING BTREE (`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES (1, '测试用户', NULL, '1', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `tb_person_info` VALUES (8, '李翔', NULL, '1', NULL, NULL, 'http://wx.qlogo.cn/mmopen/XZumId0qMA815ApfWI2zibDnRMahic6SU0wHib2HgGJj5narL2ymRaI4Kn2Tx2Q8UfkicibvjVicu3De6fDYRMfo0uGW0SGicibxVnJ9/0', 1, 1, 1, '2017-06-04 19:01:09', '2017-06-04 19:01:09', 1);
INSERT INTO `tb_person_info` VALUES (9, '龙州一条街客服', NULL, '1', NULL, NULL, 'http://wx.qlogo.cn/mmopen/icF4iau8Sj7b0FiakC6ibBoTPmkvLpIX9YhWkNyEIGYfzYyqBiag2M3q2rnxSlXAh95UDHdWgywvEW5bN5FBzFPFazxBzqHTRqNwn/0', 1, 1, 0, '2017-06-04 21:20:43', '2017-06-04 21:20:43', 1);
INSERT INTO `tb_person_info` VALUES (10, 'king', NULL, '2', NULL, NULL, 'http://wx.qlogo.cn/mmopen/XZumId0qMA815ApfWI2zibDLckaAaV6QgcBJP0saJSDTuicZBd35HzPXUebLPSlexCIPJsLs3w6lG0xmwn3EZNicj04dJh4We7C/0', 1, 1, 0, '2017-06-07 01:36:16', '2017-06-07 01:36:16', 1);
INSERT INTO `tb_person_info` VALUES (11, '音策', NULL, '2', NULL, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCWfIBicEwS3U0legxxQd5XFpZibBXVPyz0wphvvtaXqiblzQF2GqE28c7j8FGpuYqBCg1QRJThEzuw/0', 1, 1, 0, '2017-09-18 23:39:38', '2017-09-18 23:39:38', 1);

-- ----------------------------
-- Table structure for tb_phone_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_phone_auth`;
CREATE TABLE `tb_phone_auth`  (
  `phone_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '',
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auth_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`phone_auth_id`),
  INDEX `fk_phoneauth_profile` USING BTREE(`user_id`),
  CONSTRAINT `fk_phoneauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'InnoDB free: 10240 kB; (`user_id`) REFER `shopping/tb_person_info`(`user_id`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product`  (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `product_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `normal_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `point` int(10) NULL DEFAULT NULL,
  `product_category_id` int(11) NULL DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY USING BTREE (`product_id`),
  INDEX `fk_product_shop` USING BTREE(`shop_id`),
  INDEX `fk_product_procate` USING BTREE(`product_category_id`),
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`product_category_id`) REFER `shopping/tb_product_catego' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES (4, '美式咖啡', '一丝醇香，流连忘返', '/upload/images/item/shop/15/2017060523302118864.jpg', '12', '11', 12, '2017-06-05 23:30:21', '2017-06-05 23:49:34', 1, 3, NULL, 15);
INSERT INTO `tb_product` VALUES (5, '转让八成新XX牌小车', '诚心转让八成新XX牌小车，有意者请连续8866666', '/upload/images/item/shop/15/2017060523485289817.jpg', '100000', '60000', 100, '2017-06-05 23:48:52', '2017-06-05 23:48:52', 1, 0, 9, 15);
INSERT INTO `tb_product` VALUES (6, '转让电瓶车一辆', '转让电瓶车一辆，可当面看车，电话：1111222', '/upload/images/item/shop/15/2017060608490188656.jpg', '3000', '1200', 99, '2017-06-06 08:49:01', '2017-06-06 08:50:57', 1, 0, 9, 15);
INSERT INTO `tb_product` VALUES (7, '转让半新旧男装摩托车一辆', '转让半新旧男装摩托车一辆，当面验车，电话：3333666', '/upload/images/item/shop/15/2017060608502085437.jpg', '8000', '3000', 98, '2017-06-06 08:50:20', '2017-06-06 08:51:19', 1, 0, 9, 15);
INSERT INTO `tb_product` VALUES (8, '大量二手书籍转让', '大量二手书籍转让，电话详谈，或上门看书。联系电话：5556666   地址：东苑XX楼', '/upload/images/item/shop/16/2017060608574074561.jpg', '0', '0', 100, '2017-06-06 08:57:40', '2017-06-06 08:57:40', 1, 0, 10, 16);
INSERT INTO `tb_product` VALUES (9, '<十万个为什么>', '出手一本《十万个为什么》，8成新，想要的可以联系：9998886', '/upload/images/item/shop/16/2017060609025850665.png', '25', '10', 98, '2017-06-06 09:02:58', '2017-06-06 09:02:58', 1, 0, 10, 16);
INSERT INTO `tb_product` VALUES (10, '珍珠奶茶', '珍珠奶茶，弹性十足，香甜美味。', '/upload/images/item/shop/20/2017060620114126875.jpg', '10', '8', 100, '2017-06-06 20:11:41', '2017-06-06 20:11:41', 1, 0, NULL, 20);
INSERT INTO `tb_product` VALUES (11, '红豆奶茶', '红豆和奶茶的完美结合，夏天不错的选择。', '/upload/images/item/shop/20/2017060620363014331.jpg', '10', '8', 99, '2017-06-06 20:36:30', '2017-06-06 20:36:30', 1, 1, NULL, 20);
INSERT INTO `tb_product` VALUES (12, '绿豆冰', '清热解毒。', '/upload/images/item/shop/20/2017060620384620536.jpg', '8', '7', 98, '2017-06-06 20:38:46', '2017-06-06 20:38:46', 1, 0, NULL, 20);
INSERT INTO `tb_product` VALUES (13, '芒果冰沙', '新鲜芒果制作。', '/upload/images/item/shop/20/2017060620472125629.jpg', '15', '13', 95, '2017-06-06 20:47:21', '2017-06-06 20:47:21', 1, 2, NULL, 20);
INSERT INTO `tb_product` VALUES (14, '鲜榨芒果汁', '新鲜芒果新鲜榨，香甜可口，解暑降温。', '/upload/images/item/shop/20/2017060620492297296.jpg', '8', '8', 93, '2017-06-06 20:49:22', '2017-06-06 20:49:22', 1, 0, NULL, 20);
INSERT INTO `tb_product` VALUES (15, '鲜榨西瓜汁', '每一杯都是鲜榨的，现榨现卖。', '/upload/images/item/shop/20/2017060621052824735.jpg', '8', '8', 90, '2017-06-06 21:05:28', '2017-06-06 21:05:28', 1, 0, NULL, 20);
INSERT INTO `tb_product` VALUES (16, 'new test2', 'new desc2', '\\upload\\item\\shop\\30\\2019073121044998473.jpg', '12', '8', 2, '2019-07-31 13:21:06', '2019-07-31 13:21:06', 1, NULL, 17, 30);
INSERT INTO `tb_product` VALUES (17, '测试2', 'test', '\\upload\\item\\shop\\23\\2019073113262932719.jpg', '2323', '12', 12, '2019-07-31 13:26:29', '2019-07-31 13:26:29', 0, NULL, 17, 23);
INSERT INTO `tb_product` VALUES (18, 'test2', 'test2', 'test', '2', '1', 2, '2019-07-31 19:45:03', '2019-07-31 19:45:03', 1, NULL, 17, 19);
INSERT INTO `tb_product` VALUES (19, '商品测试', 'ceshu ', '\\upload\\item\\shop\\19\\2019080113442058471.jpg', '12', '12', 12, '2019-08-01 13:44:20', '2019-08-01 13:44:20', 1, NULL, 20, 19);
INSERT INTO `tb_product` VALUES (20, 'test2', '测试2', '\\upload\\item\\shop\\21\\2019080120321821231.jpg', '99.99', '9.99', 2, '2019-08-01 14:57:07', '2019-08-01 14:57:07', 1, NULL, 19, 21);

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category`  (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `product_category_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY USING BTREE (`product_category_id`),
  INDEX `fk_procate_shop` USING BTREE(`shop_id`),
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`shop_id`) REFER `shopping/tb_shop`(`shop_id`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
INSERT INTO `tb_product_category` VALUES (9, '二手车', NULL, 100, NULL, NULL, 15);
INSERT INTO `tb_product_category` VALUES (10, '二手书籍', NULL, 100, NULL, NULL, 16);
INSERT INTO `tb_product_category` VALUES (11, '奶茶', NULL, 100, NULL, NULL, 30);
INSERT INTO `tb_product_category` VALUES (12, '咖啡', NULL, 50, NULL, NULL, 30);
INSERT INTO `tb_product_category` VALUES (13, '甜品', NULL, 30, NULL, NULL, 20);
INSERT INTO `tb_product_category` VALUES (14, '小吃', NULL, 20, NULL, NULL, 20);
INSERT INTO `tb_product_category` VALUES (15, '茗茶', NULL, 10, NULL, NULL, 20);
INSERT INTO `tb_product_category` VALUES (16, '三手书', NULL, 10, NULL, NULL, 16);
INSERT INTO `tb_product_category` VALUES (17, '测试', NULL, 1, NULL, NULL, 30);
INSERT INTO `tb_product_category` VALUES (18, '测试', NULL, 12, NULL, NULL, 21);
INSERT INTO `tb_product_category` VALUES (19, '测试', NULL, 12, NULL, NULL, 21);
INSERT INTO `tb_product_category` VALUES (20, '测试类别', NULL, 12, NULL, NULL, 19);

-- ----------------------------
-- Table structure for tb_product_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img`  (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `img_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `product_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`product_img_id`),
  INDEX `fk_proimg_product` USING BTREE(`product_id`),
  CONSTRAINT `fk_proimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`product_id`) REFER `shopping/tb_product`(`product_id`) ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
INSERT INTO `tb_product_img` VALUES (19, '/upload/images/item/shop/15/20170605233021865310.jpg', NULL, NULL, '2017-06-05 23:30:22', 4);
INSERT INTO `tb_product_img` VALUES (20, '/upload/images/item/shop/15/20170605233022618071.jpg', NULL, NULL, '2017-06-05 23:30:22', 4);
INSERT INTO `tb_product_img` VALUES (21, '/upload/images/item/shop/15/20170605233022246642.jpg', NULL, NULL, '2017-06-05 23:30:22', 4);
INSERT INTO `tb_product_img` VALUES (22, '/upload/images/item/shop/15/20170605234852321010.jpg', NULL, NULL, '2017-06-05 23:48:52', 5);
INSERT INTO `tb_product_img` VALUES (23, '/upload/images/item/shop/15/20170606084902162950.jpg', NULL, NULL, '2017-06-06 08:49:02', 6);
INSERT INTO `tb_product_img` VALUES (24, '/upload/images/item/shop/15/20170606085020558290.jpg', NULL, NULL, '2017-06-06 08:50:20', 7);
INSERT INTO `tb_product_img` VALUES (25, '/upload/images/item/shop/16/20170606085740956160.jpg', NULL, NULL, '2017-06-06 08:57:40', 8);
INSERT INTO `tb_product_img` VALUES (26, '/upload/images/item/shop/16/20170606090259397060.png', NULL, NULL, '2017-06-06 09:02:59', 9);
INSERT INTO `tb_product_img` VALUES (27, '/upload/images/item/shop/20/20170606201141425050.jpg', NULL, NULL, '2017-06-06 20:11:42', 10);
INSERT INTO `tb_product_img` VALUES (28, '/upload/images/item/shop/20/20170606201141387851.jpg', NULL, NULL, '2017-06-06 20:11:42', 10);
INSERT INTO `tb_product_img` VALUES (29, '/upload/images/item/shop/20/20170606201141503752.png', NULL, NULL, '2017-06-06 20:11:42', 10);
INSERT INTO `tb_product_img` VALUES (30, '/upload/images/item/shop/20/20170606203630923430.jpg', NULL, NULL, '2017-06-06 20:36:31', 11);
INSERT INTO `tb_product_img` VALUES (31, '/upload/images/item/shop/20/20170606203631552081.png', NULL, NULL, '2017-06-06 20:36:31', 11);
INSERT INTO `tb_product_img` VALUES (32, '/upload/images/item/shop/20/20170606203631972862.jpg', NULL, NULL, '2017-06-06 20:36:31', 11);
INSERT INTO `tb_product_img` VALUES (33, '/upload/images/item/shop/20/20170606203846623120.jpg', NULL, NULL, '2017-06-06 20:38:47', 12);
INSERT INTO `tb_product_img` VALUES (34, '/upload/images/item/shop/20/20170606204721744860.jpg', NULL, NULL, '2017-06-06 20:47:21', 13);
INSERT INTO `tb_product_img` VALUES (35, '/upload/images/item/shop/20/20170606204922968580.jpg', NULL, NULL, '2017-06-06 20:49:23', 14);
INSERT INTO `tb_product_img` VALUES (36, '/upload/images/item/shop/20/20170606210528529220.jpg', NULL, NULL, '2017-06-06 21:05:28', 15);
INSERT INTO `tb_product_img` VALUES (37, '/upload/images/item/shop/20/20170606210528132921.jpg', NULL, NULL, '2017-06-06 21:05:28', 15);
INSERT INTO `tb_product_img` VALUES (50, '\\upload\\item\\shop\\30\\2019073121045120681.jpg', NULL, NULL, '2019-07-31 21:04:51', 16);
INSERT INTO `tb_product_img` VALUES (51, '\\upload\\item\\shop\\30\\2019073121045192224.jpg', NULL, NULL, '2019-07-31 21:04:52', 16);
INSERT INTO `tb_product_img` VALUES (52, '\\upload\\item\\shop\\19\\2019080113442380869.jpg', NULL, NULL, '2019-08-01 13:44:25', 19);
INSERT INTO `tb_product_img` VALUES (53, '\\upload\\item\\shop\\19\\2019080113442547125.jpg', NULL, NULL, '2019-08-01 13:44:26', 19);
INSERT INTO `tb_product_img` VALUES (59, '\\upload\\item\\shop\\21\\2019080120322087065.jpg', NULL, NULL, '2019-08-01 20:32:21', 20);

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop`  (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL DEFAULT '' COMMENT '店铺创建人',
  `area_id` int(5) NULL DEFAULT NULL,
  `shop_category_id` int(11) NULL DEFAULT NULL,
  `parent_category_id` int(11) NULL DEFAULT NULL,
  `shop_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shop_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shop_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shop_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `longitude` double(16, 12) NULL DEFAULT NULL,
  `latitude` double(16, 12) NULL DEFAULT NULL,
  `priority` int(3) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`shop_id`),
  INDEX `fk_shop_profile` USING BTREE(`owner_id`),
  INDEX `fk_shop_area` USING BTREE(`area_id`),
  INDEX `fk_shop_shopcate` USING BTREE(`shop_category_id`),
  INDEX `fk_shop_parentcate` USING BTREE(`parent_category_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_shop_parentcate` FOREIGN KEY (`parent_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'InnoDB free: 10240 kB; (`area_id`) REFER `shopping/tb_area`(`area_id`); (`parent' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES (15, 8, 3, 14, 10, '二手车辆', '二手汽车、摩托车、电车等交通工具交易信息。asdfasdf', '面向全市', '0000000', '\\upload\\item\\shop\\15\\2019071915585063099.jpg', NULL, NULL, 100, '2017-06-05 22:04:29', '2019-07-19 15:58:51', 1, NULL);
INSERT INTO `tb_shop` VALUES (16, 8, 3, 15, 10, '旧书籍交易', '旧书籍交易信息', '旧书籍交易板块', '0000000', '\\upload\\item\\shop\\16\\2019071915560139228.jpg', NULL, NULL, 99, '2017-06-06 08:53:42', '2019-07-19 15:56:02', 1, NULL);
INSERT INTO `tb_shop` VALUES (17, 8, 3, NULL, 11, '靓仔靓妹美容护理中心', '二十年手艺，专业护理秀发受损头发。美容美发首选。', '东苑北面二号门', '4445556', '\\upload\\item\\shop\\17\\2019071916052339428.jpg', NULL, NULL, 0, '2017-06-06 09:08:45', '2019-07-19 16:05:23', 1, NULL);
INSERT INTO `tb_shop` VALUES (18, 8, 3, NULL, 11, '一剪没理发中心', '专业洗剪吹，又好又便宜。', '东苑北面3号门面', '9998887', '\\upload\\item\\shop\\18\\2019071916075589073.jpg', NULL, NULL, 0, '2017-06-06 09:11:08', '2019-07-19 16:07:56', 1, NULL);
INSERT INTO `tb_shop` VALUES (19, 8, 4, 20, 12, '吃得饱大排档', '吃得好又吃得饱，朋友聚会好地方。可预约。', '南苑东面10号门面', '1234567', '/upload/images/item/shop/19/2017060609140699548.jpg', NULL, NULL, 0, '2017-06-06 09:14:06', '2017-06-06 09:45:43', 1, NULL);
INSERT INTO `tb_shop` VALUES (20, 8, 3, NULL, 12, '香喷喷奶茶店3', '鲜榨果汁、奶茶等饮品。', '南苑东面5号门面', '77788444', '\\upload\\item\\shop\\20\\2019071916042413700.jpg', NULL, NULL, 30, '2017-06-06 09:16:33', '2019-07-19 16:04:25', 1, '\"\"');
INSERT INTO `tb_shop` VALUES (21, 8, 5, 25, 13, '海陆空量贩KTV', '订包厢电话：8889997。节假日请预约。', '西苑1号门面', '8889997', '\\upload\\item\\shop\\21\\2019073113210974696.jpg', NULL, NULL, 0, '2017-06-06 09:19:42', '2017-06-06 09:45:59', 1, NULL);
INSERT INTO `tb_shop` VALUES (22, 8, 5, 24, 13, '幽城室逃生娱乐城', '考验你的智商，和小伙伴们一起来挑战吧。', '西苑3号楼第二层', '6666333', '/upload/images/item/shop/22/2017060609223853062.jpg', NULL, NULL, 0, '2017-06-06 09:22:38', '2017-06-06 09:46:04', 1, NULL);
INSERT INTO `tb_shop` VALUES (23, 8, 6, 29, 27, '威水程序设计培训教育asdfsadf', '保教抱会，前途无量。', '北苑2栋5楼', '66633111asdf', '\\upload\\item\\shop\\23\\2019071916384761715.jpg', NULL, NULL, 0, '2017-06-06 09:27:57', '2019-07-19 16:38:48', 1, NULL);
INSERT INTO `tb_shop` VALUES (24, 8, 6, 30, 27, '武林风舞蹈培训', '专业培训舞蹈，声乐。', '北苑9懂10楼', '5555555', '/upload/images/item/shop/24/2017060609354459045.png', NULL, NULL, 0, '2017-06-06 09:35:44', '2017-06-06 09:46:13', 1, NULL);
INSERT INTO `tb_shop` VALUES (25, 8, 3, NULL, 28, '易行交通工具租赁服务中心3', '本店租赁各种汽车，摩托车等。详情请拨打电话咨询。电话：2222222', '1栋3号4号门面', '2222222', '\\upload\\item\\shop\\25\\2019071916035613583.jpg', NULL, NULL, 40, '2017-06-06 09:38:11', '2019-07-19 16:03:57', 1, NULL);
INSERT INTO `tb_shop` VALUES (26, 8, 3, NULL, 28, '有声有色', '出租各种演出道具，乐器，服装等。sadfasdf', '北苑15号门面', '7777777', '\\upload\\item\\shop\\26\\2019071915594029361.jpg', NULL, NULL, 41, '2017-06-06 09:43:12', '2019-07-19 15:59:41', 1, NULL);
INSERT INTO `tb_shop` VALUES (27, 8, 3, NULL, 12, '冰冻夏天奶茶店123', '本店出售各种冷饮，奶茶，冰花，鲜榨果汁。', '东苑7懂2号门面', '8889999', '\\upload\\item\\shop\\27\\2019071916045476531.jpg', NULL, NULL, 10, '2017-06-07 15:51:21', '2019-07-19 16:04:54', 1, '\"\"');
INSERT INTO `tb_shop` VALUES (30, 8, 3, 14, 10, '测试数据', '测试简介', '测试地址', '测试电话', '\\upload\\item\\shop\\30\\2019072917403183975.jpg', NULL, NULL, NULL, '2019-07-29 17:40:31', '2019-07-29 17:40:31', 1, NULL);
INSERT INTO `tb_shop` VALUES (31, 8, 3, 14, 10, '测试数据123', '测试简介', '测试地址', '测试电话', '\\upload\\item\\shop\\31\\2019072917420236212.jpg', NULL, NULL, NULL, '2019-07-29 17:42:02', '2019-07-29 17:42:02', 1, NULL);

-- ----------------------------
-- Table structure for tb_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category`  (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shop_category_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`shop_category_id`),
  INDEX `fk_shop_category_self` USING BTREE(`parent_id`),
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`parent_id`) REFER `shopping/tb_shop_category`(`shop_cat' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES (10, '二手市场', '二手商品交易', '/upload/images/item/shopcategory/2017061223272255687.png', 100, '2017-06-04 20:10:58', '2017-06-12 23:27:22', NULL);
INSERT INTO `tb_shop_category` VALUES (11, '美容美发', '美容美发', '/upload/images/item/shopcategory/2017061223273314635.png', 99, '2017-06-04 20:12:57', '2017-06-12 23:27:33', NULL);
INSERT INTO `tb_shop_category` VALUES (12, '美食饮品', '美食饮品', '/upload/images/item/shopcategory/2017061223274213433.png', 98, '2017-06-04 20:15:21', '2017-06-12 23:27:42', NULL);
INSERT INTO `tb_shop_category` VALUES (13, '休闲娱乐', '休闲娱乐', '/upload/images/item/shopcategory/2017061223275121460.png', 97, '2017-06-04 20:19:29', '2017-06-12 23:27:51', NULL);
INSERT INTO `tb_shop_category` VALUES (14, '旧车', '旧车', '/upload/images/item/shopcategory/2017060420315183203.png', 80, '2017-06-04 20:31:51', '2017-06-04 20:31:51', 10);
INSERT INTO `tb_shop_category` VALUES (15, '二手书籍', '二手书籍', '/upload/images/item/shopcategory/2017060420322333745.png', 79, '2017-06-04 20:32:23', '2017-06-04 20:32:23', 10);
INSERT INTO `tb_shop_category` VALUES (17, '护理', '护理', '/upload/images/item/shopcategory/2017060420372391702.png', 76, '2017-06-04 20:37:23', '2017-06-04 20:37:23', 11);
INSERT INTO `tb_shop_category` VALUES (18, '理发', '理发', '/upload/images/item/shopcategory/2017060420374775350.png', 74, '2017-06-04 20:37:47', '2017-06-04 20:37:47', 11);
INSERT INTO `tb_shop_category` VALUES (20, '大排档', '大排档', '/upload/images/item/shopcategory/2017060420460491494.png', 59, '2017-06-04 20:46:04', '2017-06-04 20:46:04', 12);
INSERT INTO `tb_shop_category` VALUES (22, '奶茶店', '奶茶店', '/upload/images/item/shopcategory/2017060420464594520.png', 58, '2017-06-04 20:46:45', '2017-06-04 20:46:45', 12);
INSERT INTO `tb_shop_category` VALUES (24, '密室逃生', '密室逃生', '/upload/images/item/shopcategory/2017060420500783376.png', 56, '2017-06-04 20:50:07', '2017-06-04 21:45:53', 13);
INSERT INTO `tb_shop_category` VALUES (25, 'KTV', 'KTV', '/upload/images/item/shopcategory/2017060420505834244.png', 57, '2017-06-04 20:50:58', '2017-06-04 20:51:14', 13);
INSERT INTO `tb_shop_category` VALUES (27, '培训教育', '培训教育', '/upload/images/item/shopcategory/2017061223280082147.png', 96, '2017-06-04 21:51:36', '2017-06-12 23:28:00', NULL);
INSERT INTO `tb_shop_category` VALUES (28, '租赁市场', '租赁市场', '/upload/images/item/shopcategory/2017061223281361578.png', 95, '2017-06-04 21:53:52', '2017-06-12 23:28:13', NULL);
INSERT INTO `tb_shop_category` VALUES (29, '程序设计', '程序设计', '/upload/images/item/shopcategory/2017060421593496807.png', 50, '2017-06-04 21:59:34', '2017-06-04 21:59:34', 27);
INSERT INTO `tb_shop_category` VALUES (30, '声乐舞蹈', '声乐舞蹈', '/upload/images/item/shopcategory/2017060421595843693.png', 49, '2017-06-04 21:59:58', '2017-06-04 21:59:58', 27);
INSERT INTO `tb_shop_category` VALUES (31, '演出道具', '演出道具', '/upload/images/item/shopcategory/2017060422114076152.png', 45, '2017-06-04 22:11:40', '2017-06-04 22:11:40', 28);
INSERT INTO `tb_shop_category` VALUES (32, '交通工具', '交通工具', '/upload/images/item/shopcategory/2017060422121144586.png', 44, '2017-06-04 22:12:11', '2017-06-04 22:12:11', 28);

-- ----------------------------
-- Table structure for tb_user_award_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_award_map`;
CREATE TABLE `tb_user_award_map`  (
  `user_award_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '',
  `award_id` int(10) NOT NULL DEFAULT '',
  `shop_id` int(10) NOT NULL DEFAULT '',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `award_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `expire_time` datetime NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `used_status` int(2) NOT NULL DEFAULT 0,
  `point` int(10) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`user_award_id`),
  INDEX `fk_user_award_map_profile` USING BTREE(`user_id`),
  INDEX `fk_user_award_map_award` USING BTREE(`award_id`),
  INDEX `fk_user_award_map_shop` USING BTREE(`shop_id`),
  CONSTRAINT `fk_user_award_map_award` FOREIGN KEY (`award_id`) REFERENCES `tb_award` (`award_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_award_map_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_award_map_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'InnoDB free: 10240 kB; (`award_id`) REFER `shopping/tb_award`(`award_id`); (`use' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_user_product_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_product_map`;
CREATE TABLE `tb_user_product_map`  (
  `user_product_id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `product_id` int(100) NULL DEFAULT NULL,
  `shop_id` int(10) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `point` int(10) NULL DEFAULT 0,
  PRIMARY KEY USING BTREE (`user_product_id`),
  INDEX `fk_user_product_map_profile` USING BTREE(`user_id`),
  INDEX `fk_user_product_map_product` USING BTREE(`product_id`),
  INDEX `fk_user_product_map_shop` USING BTREE(`shop_id`),
  CONSTRAINT `fk_user_product_map_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_product_map_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_product_map_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`product_id`) REFER `shopping/tb_product`(`product_id`);' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_user_shop_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_shop_map`;
CREATE TABLE `tb_user_shop_map`  (
  `user_shop_id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '',
  `shop_id` int(10) NOT NULL DEFAULT '',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `point` int(10) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`user_shop_id`),
  UNIQUE INDEX `uq_user_shop` USING BTREE(`user_id`, `shop_id`),
  INDEX `fk_user_shop_shop` USING BTREE(`shop_id`),
  CONSTRAINT `fk_user_shop_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_shop_user` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`shop_id`) REFER `shopping/tb_shop`(`shop_id`); (`user_i' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth`  (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '',
  `open_id` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`wechat_auth_id`),
  INDEX `fk_oauth_profile` USING BTREE(`user_id`),
  INDEX `uk_oauth` USING BTREE(`open_id`(255)),
  CONSTRAINT `fk_oauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'InnoDB free: 10240 kB; (`user_id`) REFER `shopping/tb_person_info`(`user_id`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------
INSERT INTO `tb_wechat_auth` VALUES (4, 8, 'ovLbns-gxJHqC-UTPQKvgEuENl-E', '2017-06-04 19:01:09');
INSERT INTO `tb_wechat_auth` VALUES (5, 9, 'ovLbns9oD5K4g712TW63dgSHxC3o', '2017-06-04 21:20:43');
INSERT INTO `tb_wechat_auth` VALUES (6, 10, 'ovLbnsz16NtYSt2bCoJktXOGlzyg', '2017-06-07 01:36:16');
INSERT INTO `tb_wechat_auth` VALUES (7, 11, 'ovLbns4Z7ueIBJNmgVfpDTQQLCRA', '2017-09-18 23:39:38');

SET FOREIGN_KEY_CHECKS = 1;
