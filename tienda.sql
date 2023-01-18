/*
 Navicat Premium Data Transfer

 Source Server         : WEB
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : tienda

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 18/01/2023 15:27:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for businesses
-- ----------------------------
DROP TABLE IF EXISTS `businesses`;
CREATE TABLE `businesses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `postalCode` varchar(5) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `timeTable` text CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `opening` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `cif` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of businesses
-- ----------------------------
INSERT INTO `businesses` VALUES (1, 'Sa Lloca loca, s.l.', 'Calle del CANSAMIENTO PERMANENTE', '1234', 'Palma de la Mano', 'España de la buena', 696969696, 'tocahuevos@mevoy.com', 'Siempre abierto', '24 horas', 'M837649475', '2022-12-20 18:33:32', '2022-12-20 18:36:36', NULL);
INSERT INTO `businesses` VALUES (2, 'Can Bum Botifarra', 'Calle del Perpetuo sufrimiento', '3416', 'cascahuevos', 'España de la mala', 111111111, 'montapuercos@mevoy.com', 'Cansado y descansando', '1 hora', 'Y8934453', '2022-12-20 18:35:18', '2022-12-20 18:35:18', NULL);
INSERT INTO `businesses` VALUES (3, 'wqerqwerqwer', 'qwerwqer', '12345', 'ASDFKJASDKFH', 'ASDFASDF', 123456789, 'aasdfasdf@sdfgsdfg.es', 'asdfasfdsa 123123', 'asdfasdfasdf 5423345', '12345656A', '2022-12-22 17:56:22', '2022-12-22 17:56:22', NULL);

-- ----------------------------
-- Table structure for cart_details
-- ----------------------------
DROP TABLE IF EXISTS `cart_details`;
CREATE TABLE `cart_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `shoppingCartsId` int NULL DEFAULT NULL,
  `productsId` int NULL DEFAULT NULL,
  `price` decimal(6, 2) NOT NULL,
  `measureUnit` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `productName` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `taxeType` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shoppingCartsId`(`shoppingCartsId`) USING BTREE,
  INDEX `productsId`(`productsId`) USING BTREE,
  CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`shoppingCartsId`) REFERENCES `shopping_carts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cart_details_ibfk_2` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_details
-- ----------------------------
INSERT INTO `cart_details` VALUES (2, 1, 1, 1.00, 'gr', 'patatas', 29, '2022-12-21 09:03:04', '2022-12-21 09:03:04', NULL);
INSERT INTO `cart_details` VALUES (3, 2, 2, 3.00, 'ltr', 'leche', 15, '2022-12-21 09:03:39', '2022-12-21 09:03:58', NULL);
INSERT INTO `cart_details` VALUES (4, 1, 1, 1.20, 'gr.', 'qwrwqerwer', 1, '2022-12-23 08:46:27', '2022-12-23 08:46:27', NULL);

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `message` text CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `fingerprintsId` int NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fingerprintsId`(`fingerprintsId`) USING BTREE,
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`fingerprintsId`) REFERENCES `fingerprints` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES (1, 'aaaaaaaaaaaaaaaaaa', 'bbbbbbbbbbbbbbbb', 111111111, 'aaa@aaaa.com', 'aasdfasdf sadf asdf  asdf asdf asdf asdf asdf asdf', 1, '2022-12-21 08:21:20', '2022-12-21 08:21:20', NULL);
INSERT INTO `contacts` VALUES (2, 'cccccccccccc', 'dddddddddddddddd', 222222222, 'bbb@bbbb.com', 'aasdfasdf sadf asdf  asdf asdf asdf asdf asdf asdf', 2, '2022-12-21 08:22:05', '2022-12-21 08:22:05', NULL);
INSERT INTO `contacts` VALUES (3, 'adfasdfsa', 'asdfasdf', 777777777, 'asdfsadf@afdasd.com', 'sdfgdsfgs dfgsd dfg dsfgdsfg dg fdsg dgdsfgsdfgdsfg dsf ', 1, '2022-12-23 10:33:58', '2022-12-23 10:33:58', NULL);
INSERT INTO `contacts` VALUES (5, 'Manolete', 'fsfds', 690000000, 'manolete@monolete.com', 'gdfgfdgfdgfdhighfdhgfdhiughfdihgifdhijghfdijhgijfdhijgnfidjgifedhihighdihgidfhighdfihgifdhighfdigdf', 1, '2023-01-12 16:45:47', '2023-01-12 16:45:47', NULL);
INSERT INTO `contacts` VALUES (6, 'Manolete', 'gonzalez', 0, 'manolete@monolete.com', 'Este es un mensaje de Manolete', 1, '2023-01-12 18:16:00', '2023-01-12 18:16:00', NULL);
INSERT INTO `contacts` VALUES (7, 'Juanito', 'gonzalez', 0, 'juanito@monolete.com', 'Este es un mensaje de Manolete', 1, '2023-01-12 18:21:00', '2023-01-12 18:21:00', NULL);
INSERT INTO `contacts` VALUES (8, 'Manolete', 'fsfds', 111111111, 'ramoncin@pollos.com', 'qwer weqwer wqerwer we wer qwer qw er wqr q', 1, '2023-01-13 07:48:01', '2023-01-13 07:48:01', NULL);
INSERT INTO `contacts` VALUES (9, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 07:49:55', '2023-01-13 07:49:55', NULL);
INSERT INTO `contacts` VALUES (10, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 08:12:17', '2023-01-13 08:12:17', NULL);
INSERT INTO `contacts` VALUES (11, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 08:13:09', '2023-01-13 08:13:09', NULL);
INSERT INTO `contacts` VALUES (12, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 08:23:38', '2023-01-13 08:23:38', NULL);
INSERT INTO `contacts` VALUES (13, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 08:27:11', '2023-01-13 08:27:11', NULL);
INSERT INTO `contacts` VALUES (14, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 08:30:37', '2023-01-13 08:30:37', NULL);
INSERT INTO `contacts` VALUES (15, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 08:35:52', '2023-01-13 08:35:52', NULL);
INSERT INTO `contacts` VALUES (16, 'Manolete', 'fsfds', 111111111, 'manolete@monolete.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', 1, '2023-01-13 08:36:02', '2023-01-13 08:36:02', NULL);

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `postalCode` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'Manuel', 'Gonzalez', 111111111, 'manu@gmail.com', 'Madrid', 11111, 'Calle de los Perros, 12', '2022-12-21 07:43:15', '2022-12-21 07:43:15', NULL);
INSERT INTO `customers` VALUES (2, 'Antonio', 'Gil', 222222222, 'antonio@gmail.com', 'Palma', 33333, 'Calle de los Gatos, 12', '2022-12-21 07:43:52', '2022-12-21 07:45:14', NULL);
INSERT INTO `customers` VALUES (3, 'alkflsdjjasñlfdj', 'sadfasfdasf', 111111111, 'asdasdf@asdfas.com', 'asdfasdfasdf', 12443, 'qwerqwerqwerwqe r', '2022-12-23 10:51:54', '2022-12-23 10:51:54', NULL);
INSERT INTO `customers` VALUES (4, 'Armando', 'Manos', 123123123, 'uepdisseny@gmail.com', 'Granada', 1011, 'Calle del Perpetuo Dolor de Cabeza, 412 b', '2023-01-16 08:48:14', '2023-01-16 08:48:14', NULL);
INSERT INTO `customers` VALUES (5, 'Armando', 'Manos', 123123123, 'uepdisseny@gmail.com', 'Granada', 1011, 'Calle del Perpetuo Dolor de Cabeza, 412 b', '2023-01-16 08:49:53', '2023-01-16 08:49:53', NULL);
INSERT INTO `customers` VALUES (6, 'Armando', 'Manos', 123123123, 'uepdisseny@gmail.com', 'Granada', 1011, 'Calle del Perpetuo Dolor de Cabeza, 412 b', '2023-01-16 08:52:40', '2023-01-16 08:52:40', NULL);
INSERT INTO `customers` VALUES (7, 'Armando', 'Manos', 123123123, 'uepdisseny@gmail.com', 'Granada', 1011, 'Calle del Perpetuo Dolor de Cabeza, 412 b', '2023-01-16 09:03:14', '2023-01-16 09:03:14', NULL);
INSERT INTO `customers` VALUES (8, 'Ramon Manuel', 'Ruido Constante', 111111111, 'uepdisseny@gmail.com', 'Granada', 1011, 'Calle del Perpetuo Dolor de Cabeza, 412 b', '2023-01-16 09:16:14', '2023-01-16 09:16:14', NULL);
INSERT INTO `customers` VALUES (9, 'Manolete', 'Ruido Constante', 609090909, 'cadsa@gmaill.com', 'oijfsoip0dj', 47522, 'fsfdsfdsfsd', '2023-01-16 12:01:59', '2023-01-16 12:01:59', NULL);
INSERT INTO `customers` VALUES (10, 'Manolete', 'Ruido Constante', 111111111, 'dissenyramon@gmail.com', 'Granada', 1011, 'Calle del Perpetuo Dolor de Cabeza, 412 b', '2023-01-16 13:06:18', '2023-01-16 13:06:18', NULL);

-- ----------------------------
-- Table structure for emails
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `message` text CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emails
-- ----------------------------
INSERT INTO `emails` VALUES (1, 'dissenyramon@gmail.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', '2023-01-13 08:23:39', '2023-01-13 08:23:39', NULL);
INSERT INTO `emails` VALUES (2, 'dissenyramon@gmail.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', '2023-01-13 08:30:39', '2023-01-13 08:30:39', NULL);
INSERT INTO `emails` VALUES (3, 'dissenyramon@gmail.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', '2023-01-13 08:35:54', '2023-01-13 08:35:54', NULL);
INSERT INTO `emails` VALUES (4, 'dissenyramon@gmail.com', 'dfasdfa asf asdf asdfs adsadf dfasdf asdfasdf sadfssedf', '2023-01-13 08:36:04', '2023-01-13 08:36:04', NULL);
INSERT INTO `emails` VALUES (5, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Armando Manos</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 123123123\n    <b>Correo:</b> uepdisseny@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Armando</p>\n</div>', '2023-01-16 09:03:16', '2023-01-16 09:03:16', NULL);
INSERT INTO `emails` VALUES (6, 'uepdisseny@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Armando Manos</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 123123123\n    <b>Correo:</b> uepdisseny@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 09:03:16', '2023-01-16 09:03:16', NULL);
INSERT INTO `emails` VALUES (7, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Ramon Manuel Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> uepdisseny@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Ramon Manuel</p>\n</div>', '2023-01-16 09:16:15', '2023-01-16 09:16:15', NULL);
INSERT INTO `emails` VALUES (8, 'uepdisseny@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Ramon Manuel Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> uepdisseny@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 09:16:16', '2023-01-16 09:16:16', NULL);
INSERT INTO `emails` VALUES (9, 'qwerqwer@gmoil.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111333444\n    <b>Correo:</b> qwerqwer@gmoil.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:43:13', '2023-01-16 11:43:13', NULL);
INSERT INTO `emails` VALUES (10, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111333444\n    <b>Correo:</b> qwerqwer@gmoil.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:43:14', '2023-01-16 11:43:14', NULL);
INSERT INTO `emails` VALUES (11, 'manolete@monolete.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> manolete@monolete.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:44:02', '2023-01-16 11:44:02', NULL);
INSERT INTO `emails` VALUES (12, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> manolete@monolete.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:44:02', '2023-01-16 11:44:02', NULL);
INSERT INTO `emails` VALUES (13, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111222333\n    <b>Correo:</b> manolete@monolete.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:48:04', '2023-01-16 11:48:04', NULL);
INSERT INTO `emails` VALUES (14, 'manolete@monolete.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111222333\n    <b>Correo:</b> manolete@monolete.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:48:04', '2023-01-16 11:48:04', NULL);
INSERT INTO `emails` VALUES (15, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@pollos.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:48:38', '2023-01-16 11:48:38', NULL);
INSERT INTO `emails` VALUES (16, 'ramoncin@pollos.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@pollos.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:48:38', '2023-01-16 11:48:38', NULL);
INSERT INTO `emails` VALUES (17, 'ramoncin@pollos.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@pollos.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:50:08', '2023-01-16 11:50:08', NULL);
INSERT INTO `emails` VALUES (18, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@pollos.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:50:09', '2023-01-16 11:50:09', NULL);
INSERT INTO `emails` VALUES (19, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@pollos.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:50:55', '2023-01-16 11:50:55', NULL);
INSERT INTO `emails` VALUES (20, 'ramoncin@pollos.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@pollos.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:50:55', '2023-01-16 11:50:55', NULL);
INSERT INTO `emails` VALUES (21, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@gmaill.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:51:48', '2023-01-16 11:51:48', NULL);
INSERT INTO `emails` VALUES (22, 'ramoncin@gmaill.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@gmaill.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:51:48', '2023-01-16 11:51:48', NULL);
INSERT INTO `emails` VALUES (23, 'ramoncin@gmaill.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@gmaill.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 11:52:26', '2023-01-16 11:52:26', NULL);
INSERT INTO `emails` VALUES (24, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 333333333\n    <b>Correo:</b> ramoncin@gmaill.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 11:52:26', '2023-01-16 11:52:26', NULL);
INSERT INTO `emails` VALUES (25, 'rwerouqwer@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> rwerouqwer@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 13:04:04', '2023-01-16 13:04:04', NULL);
INSERT INTO `emails` VALUES (26, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> rwerouqwer@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 13:04:04', '2023-01-16 13:04:04', NULL);
INSERT INTO `emails` VALUES (27, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> rwerouqwer@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 13:04:24', '2023-01-16 13:04:24', NULL);
INSERT INTO `emails` VALUES (28, 'rwerouqwer@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> rwerouqwer@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 13:04:24', '2023-01-16 13:04:24', NULL);
INSERT INTO `emails` VALUES (29, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> dissenyramon@gmaill.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 13:05:14', '2023-01-16 13:05:14', NULL);
INSERT INTO `emails` VALUES (30, 'dissenyramon@gmaill.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> dissenyramon@gmaill.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 13:05:14', '2023-01-16 13:05:14', NULL);
INSERT INTO `emails` VALUES (31, 'dissenyramo@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> dissenyramo@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 13:06:08', '2023-01-16 13:06:08', NULL);
INSERT INTO `emails` VALUES (32, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> dissenyramo@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 13:06:08', '2023-01-16 13:06:08', NULL);
INSERT INTO `emails` VALUES (33, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> dissenyramon@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>Compra finalizada con exito por parte de Manolete</p>\n</div>', '2023-01-16 13:06:20', '2023-01-16 13:06:20', NULL);
INSERT INTO `emails` VALUES (34, 'dissenyramon@gmail.com', '\n<p><strong style=\"font-size:1.2rem; color:blue;\">Manolete Ruido Constante</strong></p>\n<div>\n<b style=\"color:blue;\">Datos de contacto:</b>\n    <b>Telefono:</b> 111111111\n    <b>Correo:</b> dissenyramon@gmail.com\n    <b>Población:</b> 01011 Granada\n    <b>Dirección:</b> Calle del Perpetuo Dolor de Cabeza, 412 b\n    <br/><br/><br/>\n    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>\n</div>', '2023-01-16 13:06:20', '2023-01-16 13:06:20', NULL);

-- ----------------------------
-- Table structure for faqs
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `answer` text CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faqs
-- ----------------------------
INSERT INTO `faqs` VALUES (1, 'Cuanto me mide y a que lado calza?', 'A la izquierda y 20rems', '2023-01-09 11:13:20', '2023-01-09 11:13:20', '2023-01-09 11:18:05');
INSERT INTO `faqs` VALUES (2, 'Como se llama en la intimidad?', 'Bernardos', '2023-01-09 11:16:18', '2023-01-09 11:16:18', NULL);
INSERT INTO `faqs` VALUES (3, 'Como se llama en la intimidad?', 'Bernardo', '2023-01-09 11:17:01', '2023-01-09 11:17:01', NULL);
INSERT INTO `faqs` VALUES (4, 'ramoncin@pollos.com', 'password', '2023-01-10 16:52:01', '2023-01-10 16:52:01', NULL);
INSERT INTO `faqs` VALUES (5, 'qwerqwerqwer', 'qweqqwerq', '2023-01-10 16:58:16', '2023-01-10 16:58:16', NULL);
INSERT INTO `faqs` VALUES (6, 'ramoncin@pollos.com', 'password', '2023-01-10 16:58:29', '2023-01-10 16:58:29', NULL);
INSERT INTO `faqs` VALUES (7, 'qwerqwerqwer', 'qweqqwerq', '2023-01-10 16:58:51', '2023-01-10 16:58:51', NULL);

-- ----------------------------
-- Table structure for fingerprints
-- ----------------------------
DROP TABLE IF EXISTS `fingerprints`;
CREATE TABLE `fingerprints`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NULL DEFAULT NULL,
  `fingerprint` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customerId`(`customerId`) USING BTREE,
  CONSTRAINT `fingerprints_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fingerprints
-- ----------------------------
INSERT INTO `fingerprints` VALUES (1, 1, 1111, '2022-12-21 07:50:13', '2022-12-21 07:50:13', NULL);
INSERT INTO `fingerprints` VALUES (2, 2, 2222, '2022-12-21 07:50:23', '2022-12-21 07:54:01', NULL);

-- ----------------------------
-- Table structure for image_configurations
-- ----------------------------
DROP TABLE IF EXISTS `image_configurations`;
CREATE TABLE `image_configurations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `directory` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `grid` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `contentAccepted` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `extensionConversion` varchar(4) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `widthPx` int NOT NULL,
  `heightPx` int NOT NULL,
  `quality` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_configurations
-- ----------------------------
INSERT INTO `image_configurations` VALUES (4, 'slider', '/image/thumbnail', 'single', 'image', 'thumbnail', 'jpg/jpeg/png/svg/webp', 'webp', 100, 100, 100, '2023-01-17 15:51:08', '2023-01-17 15:51:08', NULL);
INSERT INTO `image_configurations` VALUES (5, 'slider', '/image/mobile', 'single', 'image', 'mobile', 'jpg/jpeg/png/svg/webp', 'webp', 400, 400, 100, '2023-01-18 09:25:44', '2023-01-18 09:25:44', NULL);
INSERT INTO `image_configurations` VALUES (6, 'slider', '/image/desktop', 'single', 'image', 'desktop', 'jpg/jpeg/png/svg/webp', 'webp', 1000, 1000, 100, '2023-01-18 09:26:03', '2023-01-18 09:26:03', NULL);

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES (1, 'español', 1, '2022-12-16 10:32:37', '2022-12-16 10:32:37', NULL);
INSERT INTO `languages` VALUES (2, 'ingles', 1, '2022-12-16 10:32:46', '2022-12-16 10:32:46', NULL);
INSERT INTO `languages` VALUES (3, 'frances', 0, '2022-12-16 10:32:52', '2022-12-16 10:33:49', NULL);
INSERT INTO `languages` VALUES (4, 'aleman', 1, '2022-12-16 10:32:58', '2022-12-16 10:32:58', NULL);
INSERT INTO `languages` VALUES (5, 'portugues', 1, '2022-12-16 10:33:05', '2022-12-16 10:33:05', '2022-12-16 10:36:08');

-- ----------------------------
-- Table structure for locales
-- ----------------------------
DROP TABLE IF EXISTS `locales`;
CREATE TABLE `locales`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `languageAlias` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `entity` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `entityKey` int NOT NULL,
  `key` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of locales
-- ----------------------------
INSERT INTO `locales` VALUES (1, 'es', 'werqwerj qwerr werkjwer', 111111, '111111', 'aasdfasdf sadf asdf  asdf asdf asdf asdf asdf asdf', '2022-12-21 08:34:31', '2022-12-21 08:34:31', NULL);
INSERT INTO `locales` VALUES (2, 'de', 'werqwerj qwerr werkjwer', 222222, '222223', 'aasdfasdf sadf asdf  asdf asdf asdf asdf asdf asdf', '2022-12-21 08:34:47', '2022-12-21 08:35:41', NULL);

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES (1, 'Bizum', 0, '2022-12-15 18:48:10', '2022-12-15 18:49:40', '2022-12-15 18:50:02');
INSERT INTO `payment_methods` VALUES (2, 'Bizum', 0, '2022-12-15 18:48:19', '2022-12-15 18:54:11', '2022-12-16 08:39:36');
INSERT INTO `payment_methods` VALUES (3, 'Tarjeta', 0, '2022-12-15 18:48:25', '2022-12-16 08:38:45', NULL);
INSERT INTO `payment_methods` VALUES (4, 'Efectivo', 1, '2022-12-16 08:37:52', '2022-12-16 08:37:52', NULL);

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES (1, 'Ensaladas', 1, '2022-12-16 10:54:07', '2022-12-16 10:54:07', NULL);
INSERT INTO `product_categories` VALUES (2, 'Carnes', 1, '2022-12-16 10:54:16', '2022-12-16 10:54:16', NULL);
INSERT INTO `product_categories` VALUES (3, 'Pescados', 0, '2022-12-16 10:54:24', '2022-12-16 10:59:36', '2022-12-16 11:03:02');
INSERT INTO `product_categories` VALUES (4, 'Refrescos', 1, '2022-12-16 10:54:31', '2022-12-16 10:54:31', NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `price` int NOT NULL,
  `taxesId` int NULL DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  `productCategoriesId` int NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `taxesId`(`taxesId`) USING BTREE,
  INDEX `productCategoriesId`(`productCategoriesId`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`taxesId`) REFERENCES `taxes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`productCategoriesId`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'patatas', 2, 1, 1, 2, '2022-12-21 07:10:27', '2022-12-21 07:10:27', NULL);
INSERT INTO `products` VALUES (2, 'lechuga', 1, 1, 0, 1, '2022-12-21 07:11:02', '2022-12-21 07:12:40', NULL);
INSERT INTO `products` VALUES (3, 'alcachofa', 3, 4, 0, 1, '2022-12-21 07:12:08', '2022-12-21 07:14:07', NULL);

-- ----------------------------
-- Table structure for refund_details
-- ----------------------------
DROP TABLE IF EXISTS `refund_details`;
CREATE TABLE `refund_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `refundsId` int NULL DEFAULT NULL,
  `productsId` int NULL DEFAULT NULL,
  `amount` int NOT NULL,
  `price` decimal(6, 2) NOT NULL,
  `measureUnit` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `productName` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `taxesType` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `refundsId`(`refundsId`) USING BTREE,
  INDEX `productsId`(`productsId`) USING BTREE,
  CONSTRAINT `refund_details_ibfk_1` FOREIGN KEY (`refundsId`) REFERENCES `refunds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `refund_details_ibfk_2` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refund_details
-- ----------------------------
INSERT INTO `refund_details` VALUES (1, 1, 1, 1, 11.00, 'gr', 'patatas', 15, '2022-12-21 08:55:14', '2022-12-21 08:59:03', NULL);
INSERT INTO `refund_details` VALUES (2, 1, 1, 1, 11.00, 'gr', 'leche', 29, '2022-12-21 08:55:38', '2022-12-21 08:58:07', NULL);

-- ----------------------------
-- Table structure for refunds
-- ----------------------------
DROP TABLE IF EXISTS `refunds`;
CREATE TABLE `refunds`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `shoppingCartsId` int NULL DEFAULT NULL,
  `customersId` int NULL DEFAULT NULL,
  `paymentMethodsId` int NULL DEFAULT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `basePriceTotal` decimal(10, 2) NOT NULL,
  `ivaPriceTotal` decimal(10, 2) NOT NULL,
  `dateEmision` date NOT NULL,
  `hourEmision` time(0) NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shoppingCartsId`(`shoppingCartsId`) USING BTREE,
  INDEX `customersId`(`customersId`) USING BTREE,
  INDEX `paymentMethodsId`(`paymentMethodsId`) USING BTREE,
  CONSTRAINT `refunds_ibfk_1` FOREIGN KEY (`shoppingCartsId`) REFERENCES `shopping_carts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `refunds_ibfk_2` FOREIGN KEY (`customersId`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `refunds_ibfk_3` FOREIGN KEY (`paymentMethodsId`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refunds
-- ----------------------------
INSERT INTO `refunds` VALUES (1, 1, 1, 1, 11.00, 111.00, 1.00, '2022-10-09', '11:11:00', '2022-12-21 08:47:41', '2022-12-21 08:47:41', NULL);
INSERT INTO `refunds` VALUES (2, 2, 1, 2, 11.00, 111.00, 1.00, '2022-10-09', '11:11:00', '2022-12-21 08:47:57', '2022-12-21 08:50:02', NULL);

-- ----------------------------
-- Table structure for resized_images
-- ----------------------------
DROP TABLE IF EXISTS `resized_images`;
CREATE TABLE `resized_images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceImagesId` int NULL DEFAULT NULL,
  `imageConfigurationsId` int NULL DEFAULT NULL,
  `titleText` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `altText` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `entity` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `entityKey` int NOT NULL,
  `languageAlias` varchar(2) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `mimeType` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `grid` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `sizeBytes` int NOT NULL,
  `widthPx` int NOT NULL,
  `heightPx` int NOT NULL,
  `quality` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sourceImagesId`(`sourceImagesId`) USING BTREE,
  INDEX `imageConfigurationsId`(`imageConfigurationsId`) USING BTREE,
  CONSTRAINT `resized_images_ibfk_1` FOREIGN KEY (`sourceImagesId`) REFERENCES `source_images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `resized_images_ibfk_2` FOREIGN KEY (`imageConfigurationsId`) REFERENCES `image_configurations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resized_images
-- ----------------------------
INSERT INTO `resized_images` VALUES (3, 16, 4, 'Hola', 'Hola', '/storage/images/slider/1/image/thumbnail/ensalada-tomate.webp', 'slider', 1, 'es', 'ensalada-tomate.jpg', 'image', 'image/jpeg', 'thumbnail', 4056, 100, 100, 100, '2023-01-18 13:31:50', '2023-01-18 13:31:50', NULL);
INSERT INTO `resized_images` VALUES (4, 16, 5, 'Hola', 'Hola', '/storage/images/slider/1/image/mobile/ensalada-tomate.webp', 'slider', 1, 'es', 'ensalada-tomate.jpg', 'image', 'image/jpeg', 'mobile', 28380, 400, 400, 100, '2023-01-18 13:31:50', '2023-01-18 13:31:50', NULL);
INSERT INTO `resized_images` VALUES (5, 16, 6, 'Hola', 'Hola', '/storage/images/slider/1/image/desktop/ensalada-tomate.webp', 'slider', 1, 'es', 'ensalada-tomate.jpg', 'image', 'image/jpeg', 'desktop', 76278, 1000, 1000, 100, '2023-01-18 13:31:50', '2023-01-18 13:31:50', NULL);
INSERT INTO `resized_images` VALUES (6, 17, 4, 'Hola', 'Hola', '/storage/images/slider/1/image/thumbnail/ensalada.webp', 'slider', 1, 'es', 'ensalada.jpg', 'image', 'image/jpeg', 'thumbnail', 4760, 100, 100, 100, '2023-01-18 13:33:25', '2023-01-18 13:33:25', NULL);
INSERT INTO `resized_images` VALUES (7, 17, 5, 'Hola', 'Hola', '/storage/images/slider/1/image/mobile/ensalada.webp', 'slider', 1, 'es', 'ensalada.jpg', 'image', 'image/jpeg', 'mobile', 38596, 400, 400, 100, '2023-01-18 13:33:25', '2023-01-18 13:33:25', NULL);
INSERT INTO `resized_images` VALUES (8, 17, 6, 'Hola', 'Hola', '/storage/images/slider/1/image/desktop/ensalada.webp', 'slider', 1, 'es', 'ensalada.jpg', 'image', 'image/jpeg', 'desktop', 112422, 1000, 1000, 100, '2023-01-18 13:33:25', '2023-01-18 13:33:25', NULL);

-- ----------------------------
-- Table structure for sale_details
-- ----------------------------
DROP TABLE IF EXISTS `sale_details`;
CREATE TABLE `sale_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `salesId` int NULL DEFAULT NULL,
  `productsId` int NULL DEFAULT NULL,
  `amount` int NOT NULL,
  `price` decimal(6, 2) NOT NULL,
  `measureUnit` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `productName` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `taxesType` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `salesId`(`salesId`) USING BTREE,
  INDEX `productsId`(`productsId`) USING BTREE,
  CONSTRAINT `sale_details_ibfk_1` FOREIGN KEY (`salesId`) REFERENCES `sales` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sale_details_ibfk_2` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_details
-- ----------------------------
INSERT INTO `sale_details` VALUES (1, 2, 1, 1, 1111.00, 'gr', 'patatas', 29, '2022-12-21 09:15:18', '2022-12-21 09:16:22', NULL);
INSERT INTO `sale_details` VALUES (2, 1, 1, 1, 1111.00, 'gr', 'patatas', 29, '2022-12-21 09:15:48', '2022-12-21 09:15:48', NULL);

-- ----------------------------
-- Table structure for sale_errors
-- ----------------------------
DROP TABLE IF EXISTS `sale_errors`;
CREATE TABLE `sale_errors`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `paymentMethodsId` int NULL DEFAULT NULL,
  `customersId` int NULL DEFAULT NULL,
  `shoppingCartsId` int NULL DEFAULT NULL,
  `errorCode` int NOT NULL,
  `errorMessage` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paymentMethodsId`(`paymentMethodsId`) USING BTREE,
  INDEX `customersId`(`customersId`) USING BTREE,
  INDEX `shoppingCartsId`(`shoppingCartsId`) USING BTREE,
  CONSTRAINT `sale_errors_ibfk_1` FOREIGN KEY (`paymentMethodsId`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sale_errors_ibfk_2` FOREIGN KEY (`customersId`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sale_errors_ibfk_3` FOREIGN KEY (`shoppingCartsId`) REFERENCES `shopping_carts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_errors
-- ----------------------------
INSERT INTO `sale_errors` VALUES (1, 1, 1, 1, 1111, 'Esto es una mierdarrrrr', '2022-12-21 09:18:56', '2022-12-21 09:18:56', NULL);
INSERT INTO `sale_errors` VALUES (2, 2, 1, 1, 2222, 'Esto es otra mierdarrrrr', '2022-12-21 09:19:10', '2022-12-21 09:19:51', NULL);

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `shoppingCartsId` int NULL DEFAULT NULL,
  `customersId` int NULL DEFAULT NULL,
  `paymentMethodsId` int NULL DEFAULT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `basePriceTotal` decimal(10, 2) NOT NULL,
  `ivaPriceTotal` decimal(10, 2) NOT NULL,
  `dateEmision` date NOT NULL,
  `hourEmision` time(0) NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shoppingCartsId`(`shoppingCartsId`) USING BTREE,
  INDEX `customersId`(`customersId`) USING BTREE,
  INDEX `paymentMethodsId`(`paymentMethodsId`) USING BTREE,
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`shoppingCartsId`) REFERENCES `shopping_carts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customersId`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`paymentMethodsId`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES (1, 1, 1, 1, 111.00, 111.00, 11.00, '2022-10-10', '00:12:00', '2022-12-21 09:10:45', '2022-12-21 09:10:45', NULL);
INSERT INTO `sales` VALUES (2, 2, 1, 2, 222.00, 222.00, 222.00, '2022-10-20', '01:12:00', '2022-12-21 09:11:12', '2022-12-21 09:12:19', NULL);

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20221116180100-users.js');
INSERT INTO `sequelizemeta` VALUES ('20221212110720-taxes.js');
INSERT INTO `sequelizemeta` VALUES ('20221212143531-payment_methods.js');
INSERT INTO `sequelizemeta` VALUES ('20221216090805-sliders.js');
INSERT INTO `sequelizemeta` VALUES ('20221216092243-languages.js');
INSERT INTO `sequelizemeta` VALUES ('20221216104006-product-categories.js');
INSERT INTO `sequelizemeta` VALUES ('20221216111634-image-configurations.js');
INSERT INTO `sequelizemeta` VALUES ('20221216134837-source-images.js');
INSERT INTO `sequelizemeta` VALUES ('20221219082653-resized-images.js');
INSERT INTO `sequelizemeta` VALUES ('20221219091401-customers.js');
INSERT INTO `sequelizemeta` VALUES ('20221219092357-fingerprints.js');
INSERT INTO `sequelizemeta` VALUES ('20221219093128-products.js');
INSERT INTO `sequelizemeta` VALUES ('20221219101607-shopping-cart.js');
INSERT INTO `sequelizemeta` VALUES ('20221219102730-cart-details.js');
INSERT INTO `sequelizemeta` VALUES ('20221219104728-contacts.js');
INSERT INTO `sequelizemeta` VALUES ('20221219105400-locales.js');
INSERT INTO `sequelizemeta` VALUES ('20221219110605-sales.js');
INSERT INTO `sequelizemeta` VALUES ('20221219113038-sale-details.js');
INSERT INTO `sequelizemeta` VALUES ('20221219115025-sale-errors.js');
INSERT INTO `sequelizemeta` VALUES ('20221219120801-refunds.js');
INSERT INTO `sequelizemeta` VALUES ('20221219124242-refund-details.js');
INSERT INTO `sequelizemeta` VALUES ('20221219125852-businesses.js');
INSERT INTO `sequelizemeta` VALUES ('20221219125852-businessess.js');
INSERT INTO `sequelizemeta` VALUES ('20230109103300-faqs.js');
INSERT INTO `sequelizemeta` VALUES ('20230112162631-emails.js');

-- ----------------------------
-- Table structure for shopping_carts
-- ----------------------------
DROP TABLE IF EXISTS `shopping_carts`;
CREATE TABLE `shopping_carts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customersId` int NULL DEFAULT NULL,
  `fingerprintsId` int NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customersId`(`customersId`) USING BTREE,
  INDEX `fingerprintsId`(`fingerprintsId`) USING BTREE,
  CONSTRAINT `shopping_carts_ibfk_1` FOREIGN KEY (`customersId`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `shopping_carts_ibfk_2` FOREIGN KEY (`fingerprintsId`) REFERENCES `fingerprints` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_carts
-- ----------------------------
INSERT INTO `shopping_carts` VALUES (1, 1, 1, '2022-12-21 08:39:51', '2022-12-21 08:42:04', NULL);
INSERT INTO `shopping_carts` VALUES (2, 2, 2, '2022-12-21 08:40:00', '2022-12-21 08:40:30', NULL);

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sliders
-- ----------------------------
INSERT INTO `sliders` VALUES (1, 'volando1', 1, '2022-12-21 09:21:43', '2022-12-21 09:21:43', NULL);
INSERT INTO `sliders` VALUES (2, 'volando2', 0, '2022-12-21 09:21:50', '2022-12-21 09:22:06', NULL);
INSERT INTO `sliders` VALUES (3, 'slider home', 1, '2023-01-16 14:54:28', '2023-01-16 14:54:28', NULL);

-- ----------------------------
-- Table structure for source_images
-- ----------------------------
DROP TABLE IF EXISTS `source_images`;
CREATE TABLE `source_images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `entity` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `entityKey` int NOT NULL,
  `languageAlias` varchar(2) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `mimeType` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `sizeBytes` int NOT NULL,
  `widthPx` int NOT NULL,
  `heightPx` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of source_images
-- ----------------------------
INSERT INTO `source_images` VALUES (1, 'aaa/aaa/aaa', 'aaaaaa', 1111, 'es', 'aaaaaa.png', 'aaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaa', 1111, 1111, 1111, '2022-12-21 08:01:40', '2022-12-21 08:01:40', NULL);
INSERT INTO `source_images` VALUES (2, 'bbb/bbb/bbb', 'bbbbbb', 2222, 'de', 'bbbbbb.png', 'bbbbbbbbbbbbbbbbbbbb', 'bbbbbbbbbbbbb', 3333, 2222, 2222, '2022-12-21 08:03:02', '2022-12-21 08:05:25', NULL);
INSERT INTO `source_images` VALUES (3, '/storage/images/slider/1/image/original/ensalada.jpg', 'slider', 1, 'es', 'ensalada.jpg', 'image', 'image/jpeg', 170683, 640, 960, '2023-01-18 10:35:55', '2023-01-18 10:35:55', NULL);
INSERT INTO `source_images` VALUES (4, '/storage/images/slider/1/image/original/tostadas.jpg', 'slider', 1, 'es', 'tostadas.jpg', 'image', 'image/jpeg', 76062, 640, 427, '2023-01-18 10:38:01', '2023-01-18 10:38:01', NULL);
INSERT INTO `source_images` VALUES (5, '/storage/images/slider/1/image/original/garbanzos.jpg', 'slider', 1, 'es', 'garbanzos.jpg', 'image', 'image/jpeg', 44731, 640, 427, '2023-01-18 10:38:43', '2023-01-18 10:38:43', NULL);
INSERT INTO `source_images` VALUES (6, '/storage/images/slider/1/image/original/tomate-aguacate.jpg', 'slider', 1, 'es', 'tomate-aguacate.jpg', 'image', 'image/jpeg', 3461209, 6000, 4000, '2023-01-18 11:00:02', '2023-01-18 11:00:02', NULL);
INSERT INTO `source_images` VALUES (7, '/storage/images/slider/1/image/original/espaguetti.jpg', 'slider', 1, 'es', 'espaguetti.jpg', 'image', 'image/jpeg', 85756, 640, 427, '2023-01-18 11:09:55', '2023-01-18 11:09:55', NULL);
INSERT INTO `source_images` VALUES (8, '/storage/images/slider/1/image/original/espaguetti.jpg', 'slider', 1, 'es', 'espaguetti.jpg', 'image', 'image/jpeg', 85756, 640, 427, '2023-01-18 11:18:05', '2023-01-18 11:18:05', NULL);
INSERT INTO `source_images` VALUES (9, '/storage/images/slider/1/image/original/ensalada-tomate.jpg', 'slider', 1, 'es', 'ensalada-tomate.jpg', 'image', 'image/jpeg', 74967, 640, 427, '2023-01-18 11:40:38', '2023-01-18 11:40:38', NULL);
INSERT INTO `source_images` VALUES (10, '/storage/images/slider/1/image/original/pexels-adonyi-gÃ¡bor-1414651.jpg', 'slider', 1, 'es', 'pexels-adonyi-gÃ¡bor-1414651.jpg', 'image', 'image/jpeg', 2953398, 5330, 3543, '2023-01-18 11:45:17', '2023-01-18 11:45:17', NULL);
INSERT INTO `source_images` VALUES (11, '/storage/images/slider/1/image/original/pexels-adonyi-gÃ¡bor-1414651.jpg', 'slider', 1, 'es', 'pexels-adonyi-gÃ¡bor-1414651.jpg', 'image', 'image/jpeg', 2953398, 5330, 3543, '2023-01-18 11:49:39', '2023-01-18 11:49:39', NULL);
INSERT INTO `source_images` VALUES (12, '/storage/images/slider/1/image/original/pexels-adonyi-gÃ¡bor-1414651.jpg', 'slider', 1, 'es', 'pexels-adonyi-gÃ¡bor-1414651.jpg', 'image', 'image/jpeg', 2953398, 5330, 3543, '2023-01-18 11:52:16', '2023-01-18 11:52:16', NULL);
INSERT INTO `source_images` VALUES (13, '/storage/images/slider/1/image/original/tostadas.jpg', 'slider', 1, 'es', 'tostadas.jpg', 'image', 'image/jpeg', 76062, 640, 427, '2023-01-18 11:55:03', '2023-01-18 11:55:03', NULL);
INSERT INTO `source_images` VALUES (14, '/storage/images/slider/1/image/original/ensalada-tomate.jpg', 'slider', 1, 'es', 'ensalada-tomate.jpg', 'image', 'image/jpeg', 74967, 640, 427, '2023-01-18 13:27:59', '2023-01-18 13:27:59', NULL);
INSERT INTO `source_images` VALUES (15, '/storage/images/slider/1/image/original/ensalada-tomate.jpg', 'slider', 1, 'es', 'ensalada-tomate.jpg', 'image', 'image/jpeg', 74967, 640, 427, '2023-01-18 13:29:38', '2023-01-18 13:29:38', NULL);
INSERT INTO `source_images` VALUES (16, '/storage/images/slider/1/image/original/ensalada-tomate.jpg', 'slider', 1, 'es', 'ensalada-tomate.jpg', 'image', 'image/jpeg', 74967, 640, 427, '2023-01-18 13:31:50', '2023-01-18 13:31:50', NULL);
INSERT INTO `source_images` VALUES (17, '/storage/images/slider/1/image/original/ensalada.jpg', 'slider', 1, 'es', 'ensalada.jpg', 'image', 'image/jpeg', 170683, 640, 960, '2023-01-18 13:33:25', '2023-01-18 13:33:25', NULL);

-- ----------------------------
-- Table structure for taxes
-- ----------------------------
DROP TABLE IF EXISTS `taxes`;
CREATE TABLE `taxes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of taxes
-- ----------------------------
INSERT INTO `taxes` VALUES (1, 29, 0, '2022-12-15 16:36:59', '2022-12-15 16:49:54', '2022-12-15 16:50:18');
INSERT INTO `taxes` VALUES (2, 15, 1, '2022-12-15 16:37:14', '2022-12-15 16:37:14', NULL);
INSERT INTO `taxes` VALUES (3, 15, 1, '2022-12-15 16:37:27', '2022-12-15 16:37:27', NULL);
INSERT INTO `taxes` VALUES (4, 15, 0, '2022-12-15 16:38:25', '2022-12-15 16:38:25', NULL);
INSERT INTO `taxes` VALUES (5, 15, 0, '2022-12-15 16:38:52', '2022-12-15 16:38:52', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf16 COLLATE = utf16_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Ramoncino', 'ramoncin@pollos.com', '$2a$12$mI5nnQlrytW/sGDK0Ym98e7iMYz7eQ9MrbILsBx2yV1yl4BzQuNrm', '2022-12-23 11:40:52', '2022-12-23 11:40:52', NULL);
INSERT INTO `users` VALUES (2, 'Carlos', ' carlossedagambin@gmail.com', '$2a$12$/kyEv4hHZiA7n.feZO5rI.UqegJw/cKUMaGEA/g3WhQScwokiosQa', '2023-01-10 16:06:52', '2023-01-10 16:06:52', NULL);
INSERT INTO `users` VALUES (3, '', '', '', '2023-01-10 16:10:29', '2023-01-10 16:10:29', '2023-01-10 16:11:04');

SET FOREIGN_KEY_CHECKS = 1;
