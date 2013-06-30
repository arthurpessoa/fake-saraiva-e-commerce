/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : saraiva

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-06-30 14:49:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', 'Arthur', 'Pessoa', '', '', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', '30', '464');
INSERT INTO `address` VALUES ('2', '2', 'vitor ', 'graciani', '', '', '', 'maria domingas millego, 144', '', 'sorocaba', '', '30', '464');

-- ----------------------------
-- Table structure for `affiliate`
-- ----------------------------
DROP TABLE IF EXISTS `affiliate`;
CREATE TABLE `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of affiliate
-- ----------------------------

-- ----------------------------
-- Table structure for `affiliate_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `affiliate_transaction`;
CREATE TABLE `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of affiliate_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `attribute`
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `attribute_description`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_description`;
CREATE TABLE `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute_description
-- ----------------------------

-- ----------------------------
-- Table structure for `attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group`;
CREATE TABLE `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute_group
-- ----------------------------

-- ----------------------------
-- Table structure for `attribute_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group_description`;
CREATE TABLE `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute_group_description
-- ----------------------------

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('7', 'SlideBanner', '1');
INSERT INTO `banner` VALUES ('8', 'Editoras', '1');

-- ----------------------------
-- Table structure for `banner_image`
-- ----------------------------
DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner_image
-- ----------------------------
INSERT INTO `banner_image` VALUES ('91', '7', 'index.php?route=product/search&amp;search=engenharia%20tecnologia', 'data/banner/02_banner-980x280.jpg');
INSERT INTO `banner_image` VALUES ('90', '7', 'index.php?route=product/search&amp;search=empreendedorismo', 'data/banner/01_banner-980x280.jpg');
INSERT INTO `banner_image` VALUES ('113', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=15', 'data/editoras/arqueiro.jpg');
INSERT INTO `banner_image` VALUES ('112', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=12', 'data/editoras/Editora-Globo.jpg');
INSERT INTO `banner_image` VALUES ('111', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=5', 'data/editoras/abril.jpg');
INSERT INTO `banner_image` VALUES ('110', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=11', 'data/editoras/logo Insular.jpg');
INSERT INTO `banner_image` VALUES ('109', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=13', 'data/editoras/draco2009_logo.jpg');
INSERT INTO `banner_image` VALUES ('108', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=14', 'data/editoras/editora-atica.jpg');

-- ----------------------------
-- Table structure for `banner_image_description`
-- ----------------------------
DROP TABLE IF EXISTS `banner_image_description`;
CREATE TABLE `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner_image_description
-- ----------------------------
INSERT INTO `banner_image_description` VALUES ('91', '2', '7', 'Tecnologia');
INSERT INTO `banner_image_description` VALUES ('90', '2', '7', 'Empreendedor');
INSERT INTO `banner_image_description` VALUES ('113', '2', '8', 'Editora Arqueiro');
INSERT INTO `banner_image_description` VALUES ('112', '2', '8', 'Editora Globo');
INSERT INTO `banner_image_description` VALUES ('111', '2', '8', 'Abril');
INSERT INTO `banner_image_description` VALUES ('110', '2', '8', 'Editora Insular');
INSERT INTO `banner_image_description` VALUES ('109', '2', '8', 'Editora Draco');
INSERT INTO `banner_image_description` VALUES ('108', '2', '8', 'Editora Atica');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('59', '', '0', '1', '3', '0', '1', '2013-04-25 16:10:53', '2013-06-05 14:19:44');
INSERT INTO `category` VALUES ('61', '', '59', '0', '1', '0', '1', '2013-06-05 13:40:01', '2013-06-05 13:40:01');
INSERT INTO `category` VALUES ('62', '', '59', '0', '1', '0', '1', '2013-06-05 13:40:44', '2013-06-05 13:40:44');
INSERT INTO `category` VALUES ('63', '', '59', '0', '1', '0', '1', '2013-06-05 13:41:03', '2013-06-05 13:41:03');
INSERT INTO `category` VALUES ('64', '', '59', '0', '1', '0', '1', '2013-06-05 13:41:33', '2013-06-05 13:42:15');
INSERT INTO `category` VALUES ('65', '', '59', '0', '1', '0', '1', '2013-06-05 13:41:54', '2013-06-05 13:42:32');
INSERT INTO `category` VALUES ('66', '', '59', '0', '1', '0', '1', '2013-06-05 13:43:14', '2013-06-05 13:43:14');
INSERT INTO `category` VALUES ('67', '', '59', '0', '1', '0', '1', '2013-06-05 13:43:54', '2013-06-05 13:44:34');
INSERT INTO `category` VALUES ('68', '', '59', '0', '1', '0', '1', '2013-06-05 13:44:21', '2013-06-05 13:44:21');
INSERT INTO `category` VALUES ('69', '', '59', '0', '1', '0', '1', '2013-06-05 13:45:24', '2013-06-05 13:45:24');
INSERT INTO `category` VALUES ('70', '', '59', '0', '1', '0', '1', '2013-06-05 13:46:44', '2013-06-05 13:46:44');
INSERT INTO `category` VALUES ('71', '', '59', '0', '1', '0', '1', '2013-06-05 13:48:28', '2013-06-05 13:48:28');
INSERT INTO `category` VALUES ('72', '', '59', '0', '1', '0', '1', '2013-06-05 13:49:02', '2013-06-05 13:49:02');
INSERT INTO `category` VALUES ('73', '', '59', '0', '1', '0', '1', '2013-06-05 13:50:16', '2013-06-05 13:50:16');
INSERT INTO `category` VALUES ('74', '', '59', '0', '1', '0', '1', '2013-06-05 13:51:30', '2013-06-05 13:51:30');
INSERT INTO `category` VALUES ('75', '', '59', '0', '1', '0', '1', '2013-06-05 13:52:27', '2013-06-05 13:52:27');
INSERT INTO `category` VALUES ('76', '', '59', '0', '1', '0', '1', '2013-06-05 13:52:58', '2013-06-05 13:53:15');
INSERT INTO `category` VALUES ('77', '', '59', '0', '1', '0', '1', '2013-06-05 13:54:40', '2013-06-05 13:54:40');
INSERT INTO `category` VALUES ('78', '', '59', '0', '1', '0', '1', '2013-06-05 13:55:48', '2013-06-05 13:55:48');
INSERT INTO `category` VALUES ('79', '', '59', '0', '1', '0', '1', '2013-06-05 13:56:39', '2013-06-05 13:56:39');
INSERT INTO `category` VALUES ('80', '', '59', '0', '1', '0', '1', '2013-06-05 13:57:32', '2013-06-05 13:57:32');
INSERT INTO `category` VALUES ('81', '', '59', '0', '1', '0', '1', '2013-06-05 14:04:08', '2013-06-05 14:04:08');
INSERT INTO `category` VALUES ('82', '', '59', '0', '1', '0', '1', '2013-06-05 14:05:01', '2013-06-05 14:05:01');
INSERT INTO `category` VALUES ('83', '', '59', '0', '1', '0', '1', '2013-06-05 14:05:36', '2013-06-05 14:05:36');
INSERT INTO `category` VALUES ('84', '', '59', '0', '1', '0', '1', '2013-06-05 14:06:06', '2013-06-05 14:06:06');
INSERT INTO `category` VALUES ('85', '', '59', '0', '1', '0', '1', '2013-06-05 14:06:40', '2013-06-05 14:06:40');
INSERT INTO `category` VALUES ('86', '', '59', '0', '1', '0', '1', '2013-06-05 14:07:38', '2013-06-05 14:07:38');
INSERT INTO `category` VALUES ('87', '', '59', '0', '1', '0', '1', '2013-06-05 14:08:11', '2013-06-05 14:08:11');
INSERT INTO `category` VALUES ('88', '', '59', '0', '1', '0', '1', '2013-06-05 14:08:43', '2013-06-05 14:08:43');
INSERT INTO `category` VALUES ('89', '', '59', '0', '1', '0', '1', '2013-06-05 14:09:02', '2013-06-05 14:09:02');
INSERT INTO `category` VALUES ('90', '', '59', '0', '1', '0', '1', '2013-06-05 14:10:17', '2013-06-05 14:10:17');
INSERT INTO `category` VALUES ('91', '', '59', '0', '1', '0', '1', '2013-06-05 14:10:43', '2013-06-05 14:10:43');

-- ----------------------------
-- Table structure for `category_description`
-- ----------------------------
DROP TABLE IF EXISTS `category_description`;
CREATE TABLE `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_description
-- ----------------------------
INSERT INTO `category_description` VALUES ('59', '2', 'Livros', '', '', '');
INSERT INTO `category_description` VALUES ('61', '2', 'Administração', '', '', '');
INSERT INTO `category_description` VALUES ('62', '2', 'Agropecuária', '', '', '');
INSERT INTO `category_description` VALUES ('63', '2', 'Artes', '', '', '');
INSERT INTO `category_description` VALUES ('64', '2', 'Audiolivro', '', '', '');
INSERT INTO `category_description` VALUES ('65', '2', 'Auto-ajuda', '', '', '');
INSERT INTO `category_description` VALUES ('66', '2', 'Ciências Biológicas', '', '', '');
INSERT INTO `category_description` VALUES ('67', '2', 'Ciências Exatas', '', '', '');
INSERT INTO `category_description` VALUES ('68', '2', 'Ciências Humanas e Sociais', '', '', '');
INSERT INTO `category_description` VALUES ('69', '2', 'Contabilidade', '', '', '');
INSERT INTO `category_description` VALUES ('70', '2', 'Cursos e Idiomas', '', '', '');
INSERT INTO `category_description` VALUES ('71', '2', 'Dicionários ', '', '', '');
INSERT INTO `category_description` VALUES ('72', '2', 'Didáticos', '', '', '');
INSERT INTO `category_description` VALUES ('73', '2', 'Direito', '', '', '');
INSERT INTO `category_description` VALUES ('74', '2', 'Diversos', '', '', '');
INSERT INTO `category_description` VALUES ('75', '2', 'Economia', '', '', '');
INSERT INTO `category_description` VALUES ('76', '2', 'Engenharia e Economia', '', '', '');
INSERT INTO `category_description` VALUES ('77', '2', 'Esoterismo', '', '', '');
INSERT INTO `category_description` VALUES ('78', '2', 'Esportes e Lazer', '', '', '');
INSERT INTO `category_description` VALUES ('79', '2', 'Espiritualismo', '', '', '');
INSERT INTO `category_description` VALUES ('80', '2', 'Gastronomia', '', '', '');
INSERT INTO `category_description` VALUES ('81', '2', 'Geografia e História', '', '', '');
INSERT INTO `category_description` VALUES ('82', '2', 'Informática', '', '', '');
INSERT INTO `category_description` VALUES ('83', '2', 'Linguística', '', '', '');
INSERT INTO `category_description` VALUES ('84', '2', 'Literatura Estrangeira', '', '', '');
INSERT INTO `category_description` VALUES ('85', '2', 'Literatura Infanto-Juvenil', '', '', '');
INSERT INTO `category_description` VALUES ('86', '2', 'Literatura Nacional', '', '', '');
INSERT INTO `category_description` VALUES ('87', '2', 'Medicina', '', '', '');
INSERT INTO `category_description` VALUES ('88', '2', 'Pocket Books', '', '', '');
INSERT INTO `category_description` VALUES ('89', '2', 'Psicologia', '', '', '');
INSERT INTO `category_description` VALUES ('90', '2', 'Religião', '', '', '');
INSERT INTO `category_description` VALUES ('91', '2', 'Turismo', '', '', '');

-- ----------------------------
-- Table structure for `category_filter`
-- ----------------------------
DROP TABLE IF EXISTS `category_filter`;
CREATE TABLE `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_filter
-- ----------------------------

-- ----------------------------
-- Table structure for `category_path`
-- ----------------------------
DROP TABLE IF EXISTS `category_path`;
CREATE TABLE `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_path
-- ----------------------------
INSERT INTO `category_path` VALUES ('59', '59', '0');
INSERT INTO `category_path` VALUES ('61', '59', '0');
INSERT INTO `category_path` VALUES ('61', '61', '1');
INSERT INTO `category_path` VALUES ('62', '59', '0');
INSERT INTO `category_path` VALUES ('62', '62', '1');
INSERT INTO `category_path` VALUES ('63', '59', '0');
INSERT INTO `category_path` VALUES ('63', '63', '1');
INSERT INTO `category_path` VALUES ('64', '64', '1');
INSERT INTO `category_path` VALUES ('65', '65', '1');
INSERT INTO `category_path` VALUES ('64', '59', '0');
INSERT INTO `category_path` VALUES ('65', '59', '0');
INSERT INTO `category_path` VALUES ('66', '59', '0');
INSERT INTO `category_path` VALUES ('66', '66', '1');
INSERT INTO `category_path` VALUES ('67', '67', '1');
INSERT INTO `category_path` VALUES ('68', '59', '0');
INSERT INTO `category_path` VALUES ('68', '68', '1');
INSERT INTO `category_path` VALUES ('67', '59', '0');
INSERT INTO `category_path` VALUES ('69', '59', '0');
INSERT INTO `category_path` VALUES ('69', '69', '1');
INSERT INTO `category_path` VALUES ('70', '59', '0');
INSERT INTO `category_path` VALUES ('70', '70', '1');
INSERT INTO `category_path` VALUES ('71', '59', '0');
INSERT INTO `category_path` VALUES ('71', '71', '1');
INSERT INTO `category_path` VALUES ('72', '59', '0');
INSERT INTO `category_path` VALUES ('72', '72', '1');
INSERT INTO `category_path` VALUES ('73', '59', '0');
INSERT INTO `category_path` VALUES ('73', '73', '1');
INSERT INTO `category_path` VALUES ('74', '59', '0');
INSERT INTO `category_path` VALUES ('74', '74', '1');
INSERT INTO `category_path` VALUES ('75', '59', '0');
INSERT INTO `category_path` VALUES ('75', '75', '1');
INSERT INTO `category_path` VALUES ('76', '76', '1');
INSERT INTO `category_path` VALUES ('76', '59', '0');
INSERT INTO `category_path` VALUES ('77', '59', '0');
INSERT INTO `category_path` VALUES ('77', '77', '1');
INSERT INTO `category_path` VALUES ('78', '59', '0');
INSERT INTO `category_path` VALUES ('78', '78', '1');
INSERT INTO `category_path` VALUES ('79', '59', '0');
INSERT INTO `category_path` VALUES ('79', '79', '1');
INSERT INTO `category_path` VALUES ('80', '59', '0');
INSERT INTO `category_path` VALUES ('80', '80', '1');
INSERT INTO `category_path` VALUES ('81', '59', '0');
INSERT INTO `category_path` VALUES ('81', '81', '1');
INSERT INTO `category_path` VALUES ('82', '59', '0');
INSERT INTO `category_path` VALUES ('82', '82', '1');
INSERT INTO `category_path` VALUES ('83', '59', '0');
INSERT INTO `category_path` VALUES ('83', '83', '1');
INSERT INTO `category_path` VALUES ('84', '59', '0');
INSERT INTO `category_path` VALUES ('84', '84', '1');
INSERT INTO `category_path` VALUES ('85', '59', '0');
INSERT INTO `category_path` VALUES ('85', '85', '1');
INSERT INTO `category_path` VALUES ('86', '59', '0');
INSERT INTO `category_path` VALUES ('86', '86', '1');
INSERT INTO `category_path` VALUES ('87', '59', '0');
INSERT INTO `category_path` VALUES ('87', '87', '1');
INSERT INTO `category_path` VALUES ('88', '59', '0');
INSERT INTO `category_path` VALUES ('88', '88', '1');
INSERT INTO `category_path` VALUES ('89', '59', '0');
INSERT INTO `category_path` VALUES ('89', '89', '1');
INSERT INTO `category_path` VALUES ('90', '59', '0');
INSERT INTO `category_path` VALUES ('90', '90', '1');
INSERT INTO `category_path` VALUES ('91', '59', '0');
INSERT INTO `category_path` VALUES ('91', '91', '1');

-- ----------------------------
-- Table structure for `category_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `category_to_layout`;
CREATE TABLE `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_to_layout
-- ----------------------------

-- ----------------------------
-- Table structure for `category_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `category_to_store`;
CREATE TABLE `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_to_store
-- ----------------------------
INSERT INTO `category_to_store` VALUES ('59', '0');
INSERT INTO `category_to_store` VALUES ('61', '0');
INSERT INTO `category_to_store` VALUES ('62', '0');
INSERT INTO `category_to_store` VALUES ('63', '0');
INSERT INTO `category_to_store` VALUES ('64', '0');
INSERT INTO `category_to_store` VALUES ('65', '0');
INSERT INTO `category_to_store` VALUES ('66', '0');
INSERT INTO `category_to_store` VALUES ('67', '0');
INSERT INTO `category_to_store` VALUES ('68', '0');
INSERT INTO `category_to_store` VALUES ('69', '0');
INSERT INTO `category_to_store` VALUES ('70', '0');
INSERT INTO `category_to_store` VALUES ('71', '0');
INSERT INTO `category_to_store` VALUES ('72', '0');
INSERT INTO `category_to_store` VALUES ('73', '0');
INSERT INTO `category_to_store` VALUES ('74', '0');
INSERT INTO `category_to_store` VALUES ('75', '0');
INSERT INTO `category_to_store` VALUES ('76', '0');
INSERT INTO `category_to_store` VALUES ('77', '0');
INSERT INTO `category_to_store` VALUES ('78', '0');
INSERT INTO `category_to_store` VALUES ('79', '0');
INSERT INTO `category_to_store` VALUES ('80', '0');
INSERT INTO `category_to_store` VALUES ('81', '0');
INSERT INTO `category_to_store` VALUES ('82', '0');
INSERT INTO `category_to_store` VALUES ('83', '0');
INSERT INTO `category_to_store` VALUES ('84', '0');
INSERT INTO `category_to_store` VALUES ('85', '0');
INSERT INTO `category_to_store` VALUES ('86', '0');
INSERT INTO `category_to_store` VALUES ('87', '0');
INSERT INTO `category_to_store` VALUES ('88', '0');
INSERT INTO `category_to_store` VALUES ('89', '0');
INSERT INTO `category_to_store` VALUES ('90', '0');
INSERT INTO `category_to_store` VALUES ('91', '0');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'Afghanistan', 'AF', 'AFG', '', '0', '1');
INSERT INTO `country` VALUES ('2', 'Albania', 'AL', 'ALB', '', '0', '1');
INSERT INTO `country` VALUES ('3', 'Algeria', 'DZ', 'DZA', '', '0', '1');
INSERT INTO `country` VALUES ('4', 'American Samoa', 'AS', 'ASM', '', '0', '1');
INSERT INTO `country` VALUES ('5', 'Andorra', 'AD', 'AND', '', '0', '1');
INSERT INTO `country` VALUES ('6', 'Angola', 'AO', 'AGO', '', '0', '1');
INSERT INTO `country` VALUES ('7', 'Anguilla', 'AI', 'AIA', '', '0', '1');
INSERT INTO `country` VALUES ('8', 'Antarctica', 'AQ', 'ATA', '', '0', '1');
INSERT INTO `country` VALUES ('9', 'Antigua and Barbuda', 'AG', 'ATG', '', '0', '1');
INSERT INTO `country` VALUES ('10', 'Argentina', 'AR', 'ARG', '', '0', '1');
INSERT INTO `country` VALUES ('11', 'Armenia', 'AM', 'ARM', '', '0', '1');
INSERT INTO `country` VALUES ('12', 'Aruba', 'AW', 'ABW', '', '0', '1');
INSERT INTO `country` VALUES ('13', 'Australia', 'AU', 'AUS', '', '0', '1');
INSERT INTO `country` VALUES ('14', 'Austria', 'AT', 'AUT', '', '0', '1');
INSERT INTO `country` VALUES ('15', 'Azerbaijan', 'AZ', 'AZE', '', '0', '1');
INSERT INTO `country` VALUES ('16', 'Bahamas', 'BS', 'BHS', '', '0', '1');
INSERT INTO `country` VALUES ('17', 'Bahrain', 'BH', 'BHR', '', '0', '1');
INSERT INTO `country` VALUES ('18', 'Bangladesh', 'BD', 'BGD', '', '0', '1');
INSERT INTO `country` VALUES ('19', 'Barbados', 'BB', 'BRB', '', '0', '1');
INSERT INTO `country` VALUES ('20', 'Belarus', 'BY', 'BLR', '', '0', '1');
INSERT INTO `country` VALUES ('21', 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '0', '1');
INSERT INTO `country` VALUES ('22', 'Belize', 'BZ', 'BLZ', '', '0', '1');
INSERT INTO `country` VALUES ('23', 'Benin', 'BJ', 'BEN', '', '0', '1');
INSERT INTO `country` VALUES ('24', 'Bermuda', 'BM', 'BMU', '', '0', '1');
INSERT INTO `country` VALUES ('25', 'Bhutan', 'BT', 'BTN', '', '0', '1');
INSERT INTO `country` VALUES ('26', 'Bolivia', 'BO', 'BOL', '', '0', '1');
INSERT INTO `country` VALUES ('27', 'Bosnia and Herzegovina', 'BA', 'BIH', '', '0', '1');
INSERT INTO `country` VALUES ('28', 'Botswana', 'BW', 'BWA', '', '0', '1');
INSERT INTO `country` VALUES ('29', 'Bouvet Island', 'BV', 'BVT', '', '0', '1');
INSERT INTO `country` VALUES ('30', 'Brazil', 'BR', 'BRA', '', '0', '1');
INSERT INTO `country` VALUES ('31', 'British Indian Ocean Territory', 'IO', 'IOT', '', '0', '1');
INSERT INTO `country` VALUES ('32', 'Brunei Darussalam', 'BN', 'BRN', '', '0', '1');
INSERT INTO `country` VALUES ('33', 'Bulgaria', 'BG', 'BGR', '', '0', '1');
INSERT INTO `country` VALUES ('34', 'Burkina Faso', 'BF', 'BFA', '', '0', '1');
INSERT INTO `country` VALUES ('35', 'Burundi', 'BI', 'BDI', '', '0', '1');
INSERT INTO `country` VALUES ('36', 'Cambodia', 'KH', 'KHM', '', '0', '1');
INSERT INTO `country` VALUES ('37', 'Cameroon', 'CM', 'CMR', '', '0', '1');
INSERT INTO `country` VALUES ('38', 'Canada', 'CA', 'CAN', '', '0', '1');
INSERT INTO `country` VALUES ('39', 'Cape Verde', 'CV', 'CPV', '', '0', '1');
INSERT INTO `country` VALUES ('40', 'Cayman Islands', 'KY', 'CYM', '', '0', '1');
INSERT INTO `country` VALUES ('41', 'Central African Republic', 'CF', 'CAF', '', '0', '1');
INSERT INTO `country` VALUES ('42', 'Chad', 'TD', 'TCD', '', '0', '1');
INSERT INTO `country` VALUES ('43', 'Chile', 'CL', 'CHL', '', '0', '1');
INSERT INTO `country` VALUES ('44', 'China', 'CN', 'CHN', '', '0', '1');
INSERT INTO `country` VALUES ('45', 'Christmas Island', 'CX', 'CXR', '', '0', '1');
INSERT INTO `country` VALUES ('46', 'Cocos (Keeling) Islands', 'CC', 'CCK', '', '0', '1');
INSERT INTO `country` VALUES ('47', 'Colombia', 'CO', 'COL', '', '0', '1');
INSERT INTO `country` VALUES ('48', 'Comoros', 'KM', 'COM', '', '0', '1');
INSERT INTO `country` VALUES ('49', 'Congo', 'CG', 'COG', '', '0', '1');
INSERT INTO `country` VALUES ('50', 'Cook Islands', 'CK', 'COK', '', '0', '1');
INSERT INTO `country` VALUES ('51', 'Costa Rica', 'CR', 'CRI', '', '0', '1');
INSERT INTO `country` VALUES ('52', 'Cote D\'Ivoire', 'CI', 'CIV', '', '0', '1');
INSERT INTO `country` VALUES ('53', 'Croatia', 'HR', 'HRV', '', '0', '1');
INSERT INTO `country` VALUES ('54', 'Cuba', 'CU', 'CUB', '', '0', '1');
INSERT INTO `country` VALUES ('55', 'Cyprus', 'CY', 'CYP', '', '0', '1');
INSERT INTO `country` VALUES ('56', 'Czech Republic', 'CZ', 'CZE', '', '0', '1');
INSERT INTO `country` VALUES ('57', 'Denmark', 'DK', 'DNK', '', '0', '1');
INSERT INTO `country` VALUES ('58', 'Djibouti', 'DJ', 'DJI', '', '0', '1');
INSERT INTO `country` VALUES ('59', 'Dominica', 'DM', 'DMA', '', '0', '1');
INSERT INTO `country` VALUES ('60', 'Dominican Republic', 'DO', 'DOM', '', '0', '1');
INSERT INTO `country` VALUES ('61', 'East Timor', 'TL', 'TLS', '', '0', '1');
INSERT INTO `country` VALUES ('62', 'Ecuador', 'EC', 'ECU', '', '0', '1');
INSERT INTO `country` VALUES ('63', 'Egypt', 'EG', 'EGY', '', '0', '1');
INSERT INTO `country` VALUES ('64', 'El Salvador', 'SV', 'SLV', '', '0', '1');
INSERT INTO `country` VALUES ('65', 'Equatorial Guinea', 'GQ', 'GNQ', '', '0', '1');
INSERT INTO `country` VALUES ('66', 'Eritrea', 'ER', 'ERI', '', '0', '1');
INSERT INTO `country` VALUES ('67', 'Estonia', 'EE', 'EST', '', '0', '1');
INSERT INTO `country` VALUES ('68', 'Ethiopia', 'ET', 'ETH', '', '0', '1');
INSERT INTO `country` VALUES ('69', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', '0', '1');
INSERT INTO `country` VALUES ('70', 'Faroe Islands', 'FO', 'FRO', '', '0', '1');
INSERT INTO `country` VALUES ('71', 'Fiji', 'FJ', 'FJI', '', '0', '1');
INSERT INTO `country` VALUES ('72', 'Finland', 'FI', 'FIN', '', '0', '1');
INSERT INTO `country` VALUES ('74', 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '1', '1');
INSERT INTO `country` VALUES ('75', 'French Guiana', 'GF', 'GUF', '', '0', '1');
INSERT INTO `country` VALUES ('76', 'French Polynesia', 'PF', 'PYF', '', '0', '1');
INSERT INTO `country` VALUES ('77', 'French Southern Territories', 'TF', 'ATF', '', '0', '1');
INSERT INTO `country` VALUES ('78', 'Gabon', 'GA', 'GAB', '', '0', '1');
INSERT INTO `country` VALUES ('79', 'Gambia', 'GM', 'GMB', '', '0', '1');
INSERT INTO `country` VALUES ('80', 'Georgia', 'GE', 'GEO', '', '0', '1');
INSERT INTO `country` VALUES ('81', 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '1', '1');
INSERT INTO `country` VALUES ('82', 'Ghana', 'GH', 'GHA', '', '0', '1');
INSERT INTO `country` VALUES ('83', 'Gibraltar', 'GI', 'GIB', '', '0', '1');
INSERT INTO `country` VALUES ('84', 'Greece', 'GR', 'GRC', '', '0', '1');
INSERT INTO `country` VALUES ('85', 'Greenland', 'GL', 'GRL', '', '0', '1');
INSERT INTO `country` VALUES ('86', 'Grenada', 'GD', 'GRD', '', '0', '1');
INSERT INTO `country` VALUES ('87', 'Guadeloupe', 'GP', 'GLP', '', '0', '1');
INSERT INTO `country` VALUES ('88', 'Guam', 'GU', 'GUM', '', '0', '1');
INSERT INTO `country` VALUES ('89', 'Guatemala', 'GT', 'GTM', '', '0', '1');
INSERT INTO `country` VALUES ('90', 'Guinea', 'GN', 'GIN', '', '0', '1');
INSERT INTO `country` VALUES ('91', 'Guinea-Bissau', 'GW', 'GNB', '', '0', '1');
INSERT INTO `country` VALUES ('92', 'Guyana', 'GY', 'GUY', '', '0', '1');
INSERT INTO `country` VALUES ('93', 'Haiti', 'HT', 'HTI', '', '0', '1');
INSERT INTO `country` VALUES ('94', 'Heard and Mc Donald Islands', 'HM', 'HMD', '', '0', '1');
INSERT INTO `country` VALUES ('95', 'Honduras', 'HN', 'HND', '', '0', '1');
INSERT INTO `country` VALUES ('96', 'Hong Kong', 'HK', 'HKG', '', '0', '1');
INSERT INTO `country` VALUES ('97', 'Hungary', 'HU', 'HUN', '', '0', '1');
INSERT INTO `country` VALUES ('98', 'Iceland', 'IS', 'ISL', '', '0', '1');
INSERT INTO `country` VALUES ('99', 'India', 'IN', 'IND', '', '0', '1');
INSERT INTO `country` VALUES ('100', 'Indonesia', 'ID', 'IDN', '', '0', '1');
INSERT INTO `country` VALUES ('101', 'Iran (Islamic Republic of)', 'IR', 'IRN', '', '0', '1');
INSERT INTO `country` VALUES ('102', 'Iraq', 'IQ', 'IRQ', '', '0', '1');
INSERT INTO `country` VALUES ('103', 'Ireland', 'IE', 'IRL', '', '0', '1');
INSERT INTO `country` VALUES ('104', 'Israel', 'IL', 'ISR', '', '0', '1');
INSERT INTO `country` VALUES ('105', 'Italy', 'IT', 'ITA', '', '0', '1');
INSERT INTO `country` VALUES ('106', 'Jamaica', 'JM', 'JAM', '', '0', '1');
INSERT INTO `country` VALUES ('107', 'Japan', 'JP', 'JPN', '', '0', '1');
INSERT INTO `country` VALUES ('108', 'Jordan', 'JO', 'JOR', '', '0', '1');
INSERT INTO `country` VALUES ('109', 'Kazakhstan', 'KZ', 'KAZ', '', '0', '1');
INSERT INTO `country` VALUES ('110', 'Kenya', 'KE', 'KEN', '', '0', '1');
INSERT INTO `country` VALUES ('111', 'Kiribati', 'KI', 'KIR', '', '0', '1');
INSERT INTO `country` VALUES ('112', 'North Korea', 'KP', 'PRK', '', '0', '1');
INSERT INTO `country` VALUES ('113', 'Korea, Republic of', 'KR', 'KOR', '', '0', '1');
INSERT INTO `country` VALUES ('114', 'Kuwait', 'KW', 'KWT', '', '0', '1');
INSERT INTO `country` VALUES ('115', 'Kyrgyzstan', 'KG', 'KGZ', '', '0', '1');
INSERT INTO `country` VALUES ('116', 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', '0', '1');
INSERT INTO `country` VALUES ('117', 'Latvia', 'LV', 'LVA', '', '0', '1');
INSERT INTO `country` VALUES ('118', 'Lebanon', 'LB', 'LBN', '', '0', '1');
INSERT INTO `country` VALUES ('119', 'Lesotho', 'LS', 'LSO', '', '0', '1');
INSERT INTO `country` VALUES ('120', 'Liberia', 'LR', 'LBR', '', '0', '1');
INSERT INTO `country` VALUES ('121', 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', '0', '1');
INSERT INTO `country` VALUES ('122', 'Liechtenstein', 'LI', 'LIE', '', '0', '1');
INSERT INTO `country` VALUES ('123', 'Lithuania', 'LT', 'LTU', '', '0', '1');
INSERT INTO `country` VALUES ('124', 'Luxembourg', 'LU', 'LUX', '', '0', '1');
INSERT INTO `country` VALUES ('125', 'Macau', 'MO', 'MAC', '', '0', '1');
INSERT INTO `country` VALUES ('126', 'FYROM', 'MK', 'MKD', '', '0', '1');
INSERT INTO `country` VALUES ('127', 'Madagascar', 'MG', 'MDG', '', '0', '1');
INSERT INTO `country` VALUES ('128', 'Malawi', 'MW', 'MWI', '', '0', '1');
INSERT INTO `country` VALUES ('129', 'Malaysia', 'MY', 'MYS', '', '0', '1');
INSERT INTO `country` VALUES ('130', 'Maldives', 'MV', 'MDV', '', '0', '1');
INSERT INTO `country` VALUES ('131', 'Mali', 'ML', 'MLI', '', '0', '1');
INSERT INTO `country` VALUES ('132', 'Malta', 'MT', 'MLT', '', '0', '1');
INSERT INTO `country` VALUES ('133', 'Marshall Islands', 'MH', 'MHL', '', '0', '1');
INSERT INTO `country` VALUES ('134', 'Martinique', 'MQ', 'MTQ', '', '0', '1');
INSERT INTO `country` VALUES ('135', 'Mauritania', 'MR', 'MRT', '', '0', '1');
INSERT INTO `country` VALUES ('136', 'Mauritius', 'MU', 'MUS', '', '0', '1');
INSERT INTO `country` VALUES ('137', 'Mayotte', 'YT', 'MYT', '', '0', '1');
INSERT INTO `country` VALUES ('138', 'Mexico', 'MX', 'MEX', '', '0', '1');
INSERT INTO `country` VALUES ('139', 'Micronesia, Federated States of', 'FM', 'FSM', '', '0', '1');
INSERT INTO `country` VALUES ('140', 'Moldova, Republic of', 'MD', 'MDA', '', '0', '1');
INSERT INTO `country` VALUES ('141', 'Monaco', 'MC', 'MCO', '', '0', '1');
INSERT INTO `country` VALUES ('142', 'Mongolia', 'MN', 'MNG', '', '0', '1');
INSERT INTO `country` VALUES ('143', 'Montserrat', 'MS', 'MSR', '', '0', '1');
INSERT INTO `country` VALUES ('144', 'Morocco', 'MA', 'MAR', '', '0', '1');
INSERT INTO `country` VALUES ('145', 'Mozambique', 'MZ', 'MOZ', '', '0', '1');
INSERT INTO `country` VALUES ('146', 'Myanmar', 'MM', 'MMR', '', '0', '1');
INSERT INTO `country` VALUES ('147', 'Namibia', 'NA', 'NAM', '', '0', '1');
INSERT INTO `country` VALUES ('148', 'Nauru', 'NR', 'NRU', '', '0', '1');
INSERT INTO `country` VALUES ('149', 'Nepal', 'NP', 'NPL', '', '0', '1');
INSERT INTO `country` VALUES ('150', 'Netherlands', 'NL', 'NLD', '', '0', '1');
INSERT INTO `country` VALUES ('151', 'Netherlands Antilles', 'AN', 'ANT', '', '0', '1');
INSERT INTO `country` VALUES ('152', 'New Caledonia', 'NC', 'NCL', '', '0', '1');
INSERT INTO `country` VALUES ('153', 'New Zealand', 'NZ', 'NZL', '', '0', '1');
INSERT INTO `country` VALUES ('154', 'Nicaragua', 'NI', 'NIC', '', '0', '1');
INSERT INTO `country` VALUES ('155', 'Niger', 'NE', 'NER', '', '0', '1');
INSERT INTO `country` VALUES ('156', 'Nigeria', 'NG', 'NGA', '', '0', '1');
INSERT INTO `country` VALUES ('157', 'Niue', 'NU', 'NIU', '', '0', '1');
INSERT INTO `country` VALUES ('158', 'Norfolk Island', 'NF', 'NFK', '', '0', '1');
INSERT INTO `country` VALUES ('159', 'Northern Mariana Islands', 'MP', 'MNP', '', '0', '1');
INSERT INTO `country` VALUES ('160', 'Norway', 'NO', 'NOR', '', '0', '1');
INSERT INTO `country` VALUES ('161', 'Oman', 'OM', 'OMN', '', '0', '1');
INSERT INTO `country` VALUES ('162', 'Pakistan', 'PK', 'PAK', '', '0', '1');
INSERT INTO `country` VALUES ('163', 'Palau', 'PW', 'PLW', '', '0', '1');
INSERT INTO `country` VALUES ('164', 'Panama', 'PA', 'PAN', '', '0', '1');
INSERT INTO `country` VALUES ('165', 'Papua New Guinea', 'PG', 'PNG', '', '0', '1');
INSERT INTO `country` VALUES ('166', 'Paraguay', 'PY', 'PRY', '', '0', '1');
INSERT INTO `country` VALUES ('167', 'Peru', 'PE', 'PER', '', '0', '1');
INSERT INTO `country` VALUES ('168', 'Philippines', 'PH', 'PHL', '', '0', '1');
INSERT INTO `country` VALUES ('169', 'Pitcairn', 'PN', 'PCN', '', '0', '1');
INSERT INTO `country` VALUES ('170', 'Poland', 'PL', 'POL', '', '0', '1');
INSERT INTO `country` VALUES ('171', 'Portugal', 'PT', 'PRT', '', '0', '1');
INSERT INTO `country` VALUES ('172', 'Puerto Rico', 'PR', 'PRI', '', '0', '1');
INSERT INTO `country` VALUES ('173', 'Qatar', 'QA', 'QAT', '', '0', '1');
INSERT INTO `country` VALUES ('174', 'Reunion', 'RE', 'REU', '', '0', '1');
INSERT INTO `country` VALUES ('175', 'Romania', 'RO', 'ROM', '', '0', '1');
INSERT INTO `country` VALUES ('176', 'Russian Federation', 'RU', 'RUS', '', '0', '1');
INSERT INTO `country` VALUES ('177', 'Rwanda', 'RW', 'RWA', '', '0', '1');
INSERT INTO `country` VALUES ('178', 'Saint Kitts and Nevis', 'KN', 'KNA', '', '0', '1');
INSERT INTO `country` VALUES ('179', 'Saint Lucia', 'LC', 'LCA', '', '0', '1');
INSERT INTO `country` VALUES ('180', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', '0', '1');
INSERT INTO `country` VALUES ('181', 'Samoa', 'WS', 'WSM', '', '0', '1');
INSERT INTO `country` VALUES ('182', 'San Marino', 'SM', 'SMR', '', '0', '1');
INSERT INTO `country` VALUES ('183', 'Sao Tome and Principe', 'ST', 'STP', '', '0', '1');
INSERT INTO `country` VALUES ('184', 'Saudi Arabia', 'SA', 'SAU', '', '0', '1');
INSERT INTO `country` VALUES ('185', 'Senegal', 'SN', 'SEN', '', '0', '1');
INSERT INTO `country` VALUES ('186', 'Seychelles', 'SC', 'SYC', '', '0', '1');
INSERT INTO `country` VALUES ('187', 'Sierra Leone', 'SL', 'SLE', '', '0', '1');
INSERT INTO `country` VALUES ('188', 'Singapore', 'SG', 'SGP', '', '0', '1');
INSERT INTO `country` VALUES ('189', 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', '0', '1');
INSERT INTO `country` VALUES ('190', 'Slovenia', 'SI', 'SVN', '', '0', '1');
INSERT INTO `country` VALUES ('191', 'Solomon Islands', 'SB', 'SLB', '', '0', '1');
INSERT INTO `country` VALUES ('192', 'Somalia', 'SO', 'SOM', '', '0', '1');
INSERT INTO `country` VALUES ('193', 'South Africa', 'ZA', 'ZAF', '', '0', '1');
INSERT INTO `country` VALUES ('194', 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', '0', '1');
INSERT INTO `country` VALUES ('195', 'Spain', 'ES', 'ESP', '', '0', '1');
INSERT INTO `country` VALUES ('196', 'Sri Lanka', 'LK', 'LKA', '', '0', '1');
INSERT INTO `country` VALUES ('197', 'St. Helena', 'SH', 'SHN', '', '0', '1');
INSERT INTO `country` VALUES ('198', 'St. Pierre and Miquelon', 'PM', 'SPM', '', '0', '1');
INSERT INTO `country` VALUES ('199', 'Sudan', 'SD', 'SDN', '', '0', '1');
INSERT INTO `country` VALUES ('200', 'Suriname', 'SR', 'SUR', '', '0', '1');
INSERT INTO `country` VALUES ('201', 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', '0', '1');
INSERT INTO `country` VALUES ('202', 'Swaziland', 'SZ', 'SWZ', '', '0', '1');
INSERT INTO `country` VALUES ('203', 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '1', '1');
INSERT INTO `country` VALUES ('204', 'Switzerland', 'CH', 'CHE', '', '0', '1');
INSERT INTO `country` VALUES ('205', 'Syrian Arab Republic', 'SY', 'SYR', '', '0', '1');
INSERT INTO `country` VALUES ('206', 'Taiwan', 'TW', 'TWN', '', '0', '1');
INSERT INTO `country` VALUES ('207', 'Tajikistan', 'TJ', 'TJK', '', '0', '1');
INSERT INTO `country` VALUES ('208', 'Tanzania, United Republic of', 'TZ', 'TZA', '', '0', '1');
INSERT INTO `country` VALUES ('209', 'Thailand', 'TH', 'THA', '', '0', '1');
INSERT INTO `country` VALUES ('210', 'Togo', 'TG', 'TGO', '', '0', '1');
INSERT INTO `country` VALUES ('211', 'Tokelau', 'TK', 'TKL', '', '0', '1');
INSERT INTO `country` VALUES ('212', 'Tonga', 'TO', 'TON', '', '0', '1');
INSERT INTO `country` VALUES ('213', 'Trinidad and Tobago', 'TT', 'TTO', '', '0', '1');
INSERT INTO `country` VALUES ('214', 'Tunisia', 'TN', 'TUN', '', '0', '1');
INSERT INTO `country` VALUES ('215', 'Turkey', 'TR', 'TUR', '', '0', '1');
INSERT INTO `country` VALUES ('216', 'Turkmenistan', 'TM', 'TKM', '', '0', '1');
INSERT INTO `country` VALUES ('217', 'Turks and Caicos Islands', 'TC', 'TCA', '', '0', '1');
INSERT INTO `country` VALUES ('218', 'Tuvalu', 'TV', 'TUV', '', '0', '1');
INSERT INTO `country` VALUES ('219', 'Uganda', 'UG', 'UGA', '', '0', '1');
INSERT INTO `country` VALUES ('220', 'Ukraine', 'UA', 'UKR', '', '0', '1');
INSERT INTO `country` VALUES ('221', 'United Arab Emirates', 'AE', 'ARE', '', '0', '1');
INSERT INTO `country` VALUES ('222', 'United Kingdom', 'GB', 'GBR', '', '1', '1');
INSERT INTO `country` VALUES ('223', 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', '0', '1');
INSERT INTO `country` VALUES ('224', 'United States Minor Outlying Islands', 'UM', 'UMI', '', '0', '1');
INSERT INTO `country` VALUES ('225', 'Uruguay', 'UY', 'URY', '', '0', '1');
INSERT INTO `country` VALUES ('226', 'Uzbekistan', 'UZ', 'UZB', '', '0', '1');
INSERT INTO `country` VALUES ('227', 'Vanuatu', 'VU', 'VUT', '', '0', '1');
INSERT INTO `country` VALUES ('228', 'Vatican City State (Holy See)', 'VA', 'VAT', '', '0', '1');
INSERT INTO `country` VALUES ('229', 'Venezuela', 'VE', 'VEN', '', '0', '1');
INSERT INTO `country` VALUES ('230', 'Viet Nam', 'VN', 'VNM', '', '0', '1');
INSERT INTO `country` VALUES ('231', 'Virgin Islands (British)', 'VG', 'VGB', '', '0', '1');
INSERT INTO `country` VALUES ('232', 'Virgin Islands (U.S.)', 'VI', 'VIR', '', '0', '1');
INSERT INTO `country` VALUES ('233', 'Wallis and Futuna Islands', 'WF', 'WLF', '', '0', '1');
INSERT INTO `country` VALUES ('234', 'Western Sahara', 'EH', 'ESH', '', '0', '1');
INSERT INTO `country` VALUES ('235', 'Yemen', 'YE', 'YEM', '', '0', '1');
INSERT INTO `country` VALUES ('237', 'Democratic Republic of Congo', 'CD', 'COD', '', '0', '1');
INSERT INTO `country` VALUES ('238', 'Zambia', 'ZM', 'ZMB', '', '0', '1');
INSERT INTO `country` VALUES ('239', 'Zimbabwe', 'ZW', 'ZWE', '', '0', '1');
INSERT INTO `country` VALUES ('240', 'Jersey', 'JE', 'JEY', '', '1', '1');
INSERT INTO `country` VALUES ('241', 'Guernsey', 'GG', 'GGY', '', '1', '1');
INSERT INTO `country` VALUES ('242', 'Montenegro', 'ME', 'MNE', '', '0', '1');
INSERT INTO `country` VALUES ('243', 'Serbia', 'RS', 'SRB', '', '0', '1');
INSERT INTO `country` VALUES ('244', 'Aaland Islands', 'AX', 'ALA', '', '0', '1');
INSERT INTO `country` VALUES ('245', 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', '0', '1');
INSERT INTO `country` VALUES ('246', 'Curacao', 'CW', 'CUW', '', '0', '1');
INSERT INTO `country` VALUES ('247', 'Palestinian Territory, Occupied', 'PS', 'PSE', '', '0', '1');
INSERT INTO `country` VALUES ('248', 'South Sudan', 'SS', 'SSD', '', '0', '1');
INSERT INTO `country` VALUES ('249', 'St. Barthelemy', 'BL', 'BLM', '', '0', '1');
INSERT INTO `country` VALUES ('250', 'St. Martin (French part)', 'MF', 'MAF', '', '0', '1');
INSERT INTO `country` VALUES ('251', 'Canary Islands', 'IC', 'ICA', '', '0', '1');

-- ----------------------------
-- Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('4', '10% de Desconto', '2222', 'P', '10.0000', '0', '0', '0.0000', '2011-01-01', '2012-01-01', '10', '10', '1', '2009-01-27 13:55:03');
INSERT INTO `coupon` VALUES ('5', 'Entrega Gratis', '3333', 'P', '0.0000', '0', '1', '100.0000', '2009-03-01', '2009-08-31', '10', '10', '1', '2009-03-14 21:13:53');

-- ----------------------------
-- Table structure for `coupon_category`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_category`;
CREATE TABLE `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_category
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_history`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_history`;
CREATE TABLE `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_history
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_product`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_product`;
CREATE TABLE `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_product
-- ----------------------------

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('2', 'Real', 'BRL', 'R$ ', '', '2', '1.00000000', '1', '2013-06-29 18:14:14');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '0', 'Arthur', 'Pessoa', 'arthur_pessoa@outlook.com', '13) 96252857', '', '5513e29c05849a8df7860957d972411fab013d32', '99bf3b9ce', 'a:0:{}', '', '0', '1', '1', '127.0.0.1', '1', '1', '', '2013-06-09 16:58:52');
INSERT INTO `customer` VALUES ('2', '0', 'vitor ', 'graciani', 'vitorbcc.09@gmail.com', '34563245', '', '0da5a93b80d12626dcbc9f54fe5b5753a2f26b9a', '6fa2d47f8', 'a:0:{}', 'a:0:{}', '0', '2', '1', '177.157.231.31', '1', '1', '', '2013-06-24 15:11:31');

-- ----------------------------
-- Table structure for `customer_ban_ip`
-- ----------------------------
DROP TABLE IF EXISTS `customer_ban_ip`;
CREATE TABLE `customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_ban_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `customer_field`
-- ----------------------------
DROP TABLE IF EXISTS `customer_field`;
CREATE TABLE `customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_field
-- ----------------------------

-- ----------------------------
-- Table structure for `customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_group
-- ----------------------------
INSERT INTO `customer_group` VALUES ('1', '0', '1', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `customer_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `customer_group_description`;
CREATE TABLE `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_group_description
-- ----------------------------
INSERT INTO `customer_group_description` VALUES ('1', '2', 'Default', 'test');

-- ----------------------------
-- Table structure for `customer_history`
-- ----------------------------
DROP TABLE IF EXISTS `customer_history`;
CREATE TABLE `customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_history
-- ----------------------------

-- ----------------------------
-- Table structure for `customer_ip`
-- ----------------------------
DROP TABLE IF EXISTS `customer_ip`;
CREATE TABLE `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_ip
-- ----------------------------
INSERT INTO `customer_ip` VALUES ('1', '1', '187.111.191.146', '2013-06-09 16:58:53');
INSERT INTO `customer_ip` VALUES ('2', '1', '127.0.0.1', '2013-06-10 12:15:03');
INSERT INTO `customer_ip` VALUES ('3', '2', '177.157.231.31', '2013-06-24 15:11:35');

-- ----------------------------
-- Table structure for `customer_online`
-- ----------------------------
DROP TABLE IF EXISTS `customer_online`;
CREATE TABLE `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_online
-- ----------------------------

-- ----------------------------
-- Table structure for `customer_reward`
-- ----------------------------
DROP TABLE IF EXISTS `customer_reward`;
CREATE TABLE `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `customer_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `customer_transaction`;
CREATE TABLE `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_field`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field`;
CREATE TABLE `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_field
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_field_description`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_description`;
CREATE TABLE `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_field_description
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_field_to_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_to_customer_group`;
CREATE TABLE `custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_field_to_customer_group
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_field_value`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_value`;
CREATE TABLE `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_field_value
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_field_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_value_description`;
CREATE TABLE `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_field_value_description
-- ----------------------------

-- ----------------------------
-- Table structure for `download`
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for `download_description`
-- ----------------------------
DROP TABLE IF EXISTS `download_description`;
CREATE TABLE `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_description
-- ----------------------------

-- ----------------------------
-- Table structure for `extension`
-- ----------------------------
DROP TABLE IF EXISTS `extension`;
CREATE TABLE `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=428 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of extension
-- ----------------------------
INSERT INTO `extension` VALUES ('23', 'payment', 'cod');
INSERT INTO `extension` VALUES ('22', 'total', 'shipping');
INSERT INTO `extension` VALUES ('57', 'total', 'sub_total');
INSERT INTO `extension` VALUES ('58', 'total', 'tax');
INSERT INTO `extension` VALUES ('59', 'total', 'total');
INSERT INTO `extension` VALUES ('410', 'module', 'banner');
INSERT INTO `extension` VALUES ('426', 'module', 'carousel');
INSERT INTO `extension` VALUES ('390', 'total', 'credit');
INSERT INTO `extension` VALUES ('387', 'shipping', 'flat');
INSERT INTO `extension` VALUES ('349', 'total', 'handling');
INSERT INTO `extension` VALUES ('350', 'total', 'low_order_fee');
INSERT INTO `extension` VALUES ('389', 'total', 'coupon');
INSERT INTO `extension` VALUES ('413', 'module', 'category');
INSERT INTO `extension` VALUES ('411', 'module', 'affiliate');
INSERT INTO `extension` VALUES ('408', 'module', 'account');
INSERT INTO `extension` VALUES ('393', 'total', 'reward');
INSERT INTO `extension` VALUES ('398', 'total', 'voucher');
INSERT INTO `extension` VALUES ('407', 'payment', 'free_checkout');
INSERT INTO `extension` VALUES ('427', 'module', 'featured');
INSERT INTO `extension` VALUES ('419', 'module', 'slideshow');

-- ----------------------------
-- Table structure for `filter`
-- ----------------------------
DROP TABLE IF EXISTS `filter`;
CREATE TABLE `filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filter
-- ----------------------------

-- ----------------------------
-- Table structure for `filter_description`
-- ----------------------------
DROP TABLE IF EXISTS `filter_description`;
CREATE TABLE `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filter_description
-- ----------------------------

-- ----------------------------
-- Table structure for `filter_group`
-- ----------------------------
DROP TABLE IF EXISTS `filter_group`;
CREATE TABLE `filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filter_group
-- ----------------------------

-- ----------------------------
-- Table structure for `filter_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `filter_group_description`;
CREATE TABLE `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filter_group_description
-- ----------------------------

-- ----------------------------
-- Table structure for `geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `geo_zone`;
CREATE TABLE `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of geo_zone
-- ----------------------------
INSERT INTO `geo_zone` VALUES ('3', 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25');
INSERT INTO `geo_zone` VALUES ('4', 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- ----------------------------
-- Table structure for `information`
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('3', '1', '3', '1');
INSERT INTO `information` VALUES ('4', '1', '1', '1');
INSERT INTO `information` VALUES ('5', '1', '4', '1');
INSERT INTO `information` VALUES ('6', '1', '2', '1');

-- ----------------------------
-- Table structure for `information_description`
-- ----------------------------
DROP TABLE IF EXISTS `information_description`;
CREATE TABLE `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information_description
-- ----------------------------
INSERT INTO `information_description` VALUES ('4', '2', 'Sobre', '&lt;p&gt;Sobre sobre lalala&lt;/p&gt;\r\n');
INSERT INTO `information_description` VALUES ('5', '2', 'Termos e Condições', '&lt;p&gt;Termos e Condições&lt;/p&gt;\r\n');
INSERT INTO `information_description` VALUES ('3', '2', 'Politica de Privacidade', '&lt;p&gt;Politica de Privacidade&lt;/p&gt;\r\n');
INSERT INTO `information_description` VALUES ('6', '2', 'Informação de Entrega', '&lt;p&gt;Informação de Entrega&lt;/p&gt;\r\n');

-- ----------------------------
-- Table structure for `information_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `information_to_layout`;
CREATE TABLE `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information_to_layout
-- ----------------------------

-- ----------------------------
-- Table structure for `information_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `information_to_store`;
CREATE TABLE `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information_to_store
-- ----------------------------
INSERT INTO `information_to_store` VALUES ('3', '0');
INSERT INTO `information_to_store` VALUES ('4', '0');
INSERT INTO `information_to_store` VALUES ('5', '0');
INSERT INTO `information_to_store` VALUES ('6', '0');

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('2', ' Português (BR)', 'pt-br', 'pt_BR.UTF-8, pt_BR, UTF-8', 'br.png', 'portuguese-br', 'portuguese-br', '1', '1');

-- ----------------------------
-- Table structure for `layout`
-- ----------------------------
DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layout
-- ----------------------------
INSERT INTO `layout` VALUES ('1', 'Home');
INSERT INTO `layout` VALUES ('2', 'Product');
INSERT INTO `layout` VALUES ('3', 'Categorias');
INSERT INTO `layout` VALUES ('4', 'Default');
INSERT INTO `layout` VALUES ('5', 'Editoras');
INSERT INTO `layout` VALUES ('6', 'Conta');
INSERT INTO `layout` VALUES ('7', 'Checkout');
INSERT INTO `layout` VALUES ('8', 'Contato');
INSERT INTO `layout` VALUES ('9', 'Mapa do Site');
INSERT INTO `layout` VALUES ('10', 'Afiliados');
INSERT INTO `layout` VALUES ('11', 'Information');

-- ----------------------------
-- Table structure for `layout_route`
-- ----------------------------
DROP TABLE IF EXISTS `layout_route`;
CREATE TABLE `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layout_route
-- ----------------------------
INSERT INTO `layout_route` VALUES ('34', '6', '0', 'account');
INSERT INTO `layout_route` VALUES ('35', '10', '0', 'affiliate/');
INSERT INTO `layout_route` VALUES ('36', '3', '0', 'product/category');
INSERT INTO `layout_route` VALUES ('26', '1', '0', 'common/home');
INSERT INTO `layout_route` VALUES ('20', '2', '0', 'product/product');
INSERT INTO `layout_route` VALUES ('24', '11', '0', 'information/information');
INSERT INTO `layout_route` VALUES ('38', '5', '0', 'product/manufacturer');
INSERT INTO `layout_route` VALUES ('23', '7', '0', 'checkout/');
INSERT INTO `layout_route` VALUES ('37', '8', '0', 'information/contact');
INSERT INTO `layout_route` VALUES ('33', '9', '0', 'information/sitemap');

-- ----------------------------
-- Table structure for `length_class`
-- ----------------------------
DROP TABLE IF EXISTS `length_class`;
CREATE TABLE `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of length_class
-- ----------------------------
INSERT INTO `length_class` VALUES ('1', '1.00000000');
INSERT INTO `length_class` VALUES ('2', '10.00000000');

-- ----------------------------
-- Table structure for `length_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `length_class_description`;
CREATE TABLE `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of length_class_description
-- ----------------------------
INSERT INTO `length_class_description` VALUES ('1', '2', 'Centimetros', 'cm');
INSERT INTO `length_class_description` VALUES ('2', '2', 'Millimetros', 'mm');

-- ----------------------------
-- Table structure for `manufacturer`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES ('5', 'Abril', 'data/editoras/abril.jpg', '0');
INSERT INTO `manufacturer` VALUES ('12', 'Editora Globo', 'data/editoras/Editora-Globo.jpg', '0');
INSERT INTO `manufacturer` VALUES ('13', 'Editoras Draco', 'data/editoras/draco2009_logo.jpg', '0');
INSERT INTO `manufacturer` VALUES ('11', 'Editora Insular', 'data/editoras/logo Insular.jpg', '0');
INSERT INTO `manufacturer` VALUES ('14', 'Editora Atica', 'data/editoras/editora-atica.jpg', '0');
INSERT INTO `manufacturer` VALUES ('15', 'Arqueiro', 'data/editoras/arqueiro.jpg', '0');

-- ----------------------------
-- Table structure for `manufacturer_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer_to_store`;
CREATE TABLE `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer_to_store
-- ----------------------------
INSERT INTO `manufacturer_to_store` VALUES ('5', '0');
INSERT INTO `manufacturer_to_store` VALUES ('11', '0');
INSERT INTO `manufacturer_to_store` VALUES ('12', '0');
INSERT INTO `manufacturer_to_store` VALUES ('13', '0');
INSERT INTO `manufacturer_to_store` VALUES ('14', '0');
INSERT INTO `manufacturer_to_store` VALUES ('15', '0');

-- ----------------------------
-- Table structure for `option`
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of option
-- ----------------------------
INSERT INTO `option` VALUES ('1', 'radio', '2');
INSERT INTO `option` VALUES ('2', 'checkbox', '3');
INSERT INTO `option` VALUES ('4', 'text', '4');
INSERT INTO `option` VALUES ('5', 'select', '1');
INSERT INTO `option` VALUES ('6', 'textarea', '5');
INSERT INTO `option` VALUES ('7', 'file', '6');
INSERT INTO `option` VALUES ('8', 'date', '7');
INSERT INTO `option` VALUES ('9', 'time', '8');
INSERT INTO `option` VALUES ('10', 'datetime', '9');
INSERT INTO `option` VALUES ('11', 'select', '1');
INSERT INTO `option` VALUES ('12', 'date', '1');

-- ----------------------------
-- Table structure for `option_description`
-- ----------------------------
DROP TABLE IF EXISTS `option_description`;
CREATE TABLE `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of option_description
-- ----------------------------
INSERT INTO `option_description` VALUES ('1', '2', 'Radio');
INSERT INTO `option_description` VALUES ('2', '2', 'Checkbox');
INSERT INTO `option_description` VALUES ('4', '2', 'Text');
INSERT INTO `option_description` VALUES ('6', '2', 'Textarea');
INSERT INTO `option_description` VALUES ('8', '2', 'Data');
INSERT INTO `option_description` VALUES ('7', '2', 'Arquivo');
INSERT INTO `option_description` VALUES ('5', '2', 'Select');
INSERT INTO `option_description` VALUES ('9', '2', 'Time');
INSERT INTO `option_description` VALUES ('10', '2', 'Data e Hora');
INSERT INTO `option_description` VALUES ('12', '2', 'Data de Entrega');
INSERT INTO `option_description` VALUES ('11', '2', 'Size');

-- ----------------------------
-- Table structure for `option_value`
-- ----------------------------
DROP TABLE IF EXISTS `option_value`;
CREATE TABLE `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of option_value
-- ----------------------------
INSERT INTO `option_value` VALUES ('43', '1', '', '3');
INSERT INTO `option_value` VALUES ('32', '1', '', '1');
INSERT INTO `option_value` VALUES ('45', '2', '', '4');
INSERT INTO `option_value` VALUES ('44', '2', '', '3');
INSERT INTO `option_value` VALUES ('42', '5', '', '4');
INSERT INTO `option_value` VALUES ('41', '5', '', '3');
INSERT INTO `option_value` VALUES ('39', '5', '', '1');
INSERT INTO `option_value` VALUES ('40', '5', '', '2');
INSERT INTO `option_value` VALUES ('31', '1', '', '2');
INSERT INTO `option_value` VALUES ('23', '2', '', '1');
INSERT INTO `option_value` VALUES ('24', '2', '', '2');
INSERT INTO `option_value` VALUES ('46', '11', '', '1');
INSERT INTO `option_value` VALUES ('47', '11', '', '2');
INSERT INTO `option_value` VALUES ('48', '11', '', '3');

-- ----------------------------
-- Table structure for `option_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `option_value_description`;
CREATE TABLE `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of option_value_description
-- ----------------------------
INSERT INTO `option_value_description` VALUES ('43', '2', '1', 'Large');
INSERT INTO `option_value_description` VALUES ('32', '2', '1', 'Small');
INSERT INTO `option_value_description` VALUES ('45', '2', '2', 'Checkbox 4');
INSERT INTO `option_value_description` VALUES ('44', '2', '2', 'Checkbox 3');
INSERT INTO `option_value_description` VALUES ('31', '2', '1', 'Medium');
INSERT INTO `option_value_description` VALUES ('42', '2', '5', 'Yellow');
INSERT INTO `option_value_description` VALUES ('41', '2', '5', 'Green');
INSERT INTO `option_value_description` VALUES ('39', '2', '5', 'Red');
INSERT INTO `option_value_description` VALUES ('40', '2', '5', 'Blue');
INSERT INTO `option_value_description` VALUES ('23', '2', '2', 'Checkbox 1');
INSERT INTO `option_value_description` VALUES ('24', '2', '2', 'Checkbox 2');
INSERT INTO `option_value_description` VALUES ('48', '2', '11', 'Large');
INSERT INTO `option_value_description` VALUES ('47', '2', '11', 'Medium');
INSERT INTO `option_value_description` VALUES ('46', '2', '11', 'Small');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '0', 'INV-2013-00', '0', 'Saraiva', 'http://arthurpessoa.no-ip.org/saraiva/', '1', '1', 'Arthur', 'Pessoa', 'arthur_pessoa@outlook.com', '13) 96252857', '', 'Arthur', 'Pessoa', '', '', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Pagar quando retirar na loja', 'cod', 'Arthur', 'Pessoa', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Valor total para todo o pedido.', 'flat.flat', '', '116.0000', '1', '0', '0.0000', '2', '2', 'BRL', '1.00000000', '187.111.191.146', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4', '2013-06-09 16:59:53', '2013-06-09 16:59:56');
INSERT INTO `order` VALUES ('2', '0', 'INV-2013-00', '0', 'Saraiva', 'http://arthurpessoa.no-ip.org/saraiva/', '1', '1', 'Arthur', 'Pessoa', 'arthur_pessoa@outlook.com', '13) 96252857', '', 'Arthur', 'Pessoa', '', '', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Pagar quando retirar na loja', 'cod', 'Arthur', 'Pessoa', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Valor total para todo o pedido.', 'flat.flat', '', '84.8000', '1', '0', '0.0000', '2', '2', 'BRL', '1.00000000', '187.111.191.146', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4', '2013-06-09 17:45:45', '2013-06-09 17:45:47');
INSERT INTO `order` VALUES ('3', '0', 'INV-2013-00', '0', 'Saraiva', 'http://arthurpessoa.no-ip.org/saraiva/', '1', '1', 'Arthur', 'Pessoa', 'arthur_pessoa@outlook.com', '13) 96252857', '', 'Arthur', 'Pessoa', '', '', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Pagar quando retirar na loja', 'cod', 'Arthur', 'Pessoa', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Valor total para todo o pedido.', 'flat.flat', '', '78.0000', '1', '0', '0.0000', '2', '2', 'BRL', '1.00000000', '187.111.191.146', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4', '2013-06-09 17:55:17', '2013-06-09 17:55:19');
INSERT INTO `order` VALUES ('4', '0', 'INV-2013-00', '0', 'Saraiva', 'http://127.0.0.1/saraiva/', '1', '1', 'Arthur', 'Pessoa', 'arthur_pessoa@outlook.com', '13) 96252857', '', 'Arthur', 'Pessoa', '', '', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Pagar quando retirar na loja', 'cod', 'Arthur', 'Pessoa', '', 'Avenida Sorocabana 8080', '', 'Mongaguá', '', 'Brazil', '30', 'São Paulo', '464', '', 'Valor total para todo o pedido.', 'flat.flat', '', '54.0000', '1', '0', '0.0000', '2', '2', 'BRL', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4', '2013-06-10 12:15:48', '2013-06-10 12:15:50');
INSERT INTO `order` VALUES ('5', '0', 'INV-2013-00', '0', 'Saraiva', 'http://arthurpessoa.no-ip.org/saraiva/', '2', '1', 'vitor ', 'graciani', 'vitorbcc.09@gmail.com', '34563245', '', 'vitor ', 'graciani', '', '', '', 'maria domingas millego, 144', '', 'sorocaba', '', 'Brazil', '30', 'São Paulo', '464', '', 'Pagar quando retirar na loja', 'cod', 'vitor ', 'graciani', '', 'maria domingas millego, 144', '', 'sorocaba', '', 'Brazil', '30', 'São Paulo', '464', '', 'Valor total para todo o pedido.', 'flat.flat', '', '69.0000', '1', '0', '0.0000', '2', '2', 'BRL', '1.00000000', '177.157.231.31', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.52 Safari/537.36', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4', '2013-06-24 15:16:39', '2013-06-24 15:16:49');

-- ----------------------------
-- Table structure for `order_download`
-- ----------------------------
DROP TABLE IF EXISTS `order_download`;
CREATE TABLE `order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_download
-- ----------------------------

-- ----------------------------
-- Table structure for `order_field`
-- ----------------------------
DROP TABLE IF EXISTS `order_field`;
CREATE TABLE `order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_field
-- ----------------------------

-- ----------------------------
-- Table structure for `order_fraud`
-- ----------------------------
DROP TABLE IF EXISTS `order_fraud`;
CREATE TABLE `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_fraud
-- ----------------------------

-- ----------------------------
-- Table structure for `order_history`
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_history
-- ----------------------------
INSERT INTO `order_history` VALUES ('1', '1', '1', '1', '', '2013-06-09 16:59:56');
INSERT INTO `order_history` VALUES ('2', '2', '1', '1', '', '2013-06-09 17:45:47');
INSERT INTO `order_history` VALUES ('3', '3', '1', '1', '', '2013-06-09 17:55:19');
INSERT INTO `order_history` VALUES ('4', '4', '1', '1', '', '2013-06-10 12:15:50');
INSERT INTO `order_history` VALUES ('5', '5', '1', '1', '', '2013-06-24 15:16:49');

-- ----------------------------
-- Table structure for `order_option`
-- ----------------------------
DROP TABLE IF EXISTS `order_option`;
CREATE TABLE `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_option
-- ----------------------------

-- ----------------------------
-- Table structure for `order_product`
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '1', '50', 'Assassin\'s Creed - Revelações', 'Assassin\'s Creed - Revelações', '1', '31.0000', '31.0000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('2', '1', '51', 'A Startup de $100 - Abra o Negócio Dos Seus Sonhos', 'A Startup de $100', '1', '80.0000', '80.0000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('3', '2', '54', 'Sonho Grande', 'Sonho Grande', '1', '29.9000', '29.9000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('4', '2', '55', 'Não Tenha Medo de Ser Chefe', 'Medo de Ser Chefe', '1', '49.9000', '49.9000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('5', '3', '60', 'Como Fazer Amigos e Influenciar Pessoas - Audiolivro - CD - MP3', 'INFL332', '1', '32.0000', '32.0000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('6', '3', '56', 'Adestramento Inteligente - 2ª Ed.', 'Adestramento 2nd', '1', '41.0000', '41.0000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('7', '4', '69', '15 Minutos - Italiano - Com 02 CDs', '15 minutos', '1', '49.0000', '49.0000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('8', '5', '66', 'O Príncipe - Col. Saraiva de Bolso', 'PRNCE', '1', '18.0000', '18.0000', '0.0000', '0');
INSERT INTO `order_product` VALUES ('9', '5', '67', 'Pedagogia da Autonomia - Saberes Necessários À Prática Educativa - 43ª Ed. 2011', 'PEDAG1', '1', '46.0000', '46.0000', '0.0000', '0');

-- ----------------------------
-- Table structure for `order_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES ('2', '2', 'Processando');
INSERT INTO `order_status` VALUES ('3', '2', 'Enviado');
INSERT INTO `order_status` VALUES ('7', '2', 'Cancelado');
INSERT INTO `order_status` VALUES ('5', '2', 'Completo');
INSERT INTO `order_status` VALUES ('8', '2', 'Negado');
INSERT INTO `order_status` VALUES ('9', '2', 'Cancelamento Revertido');
INSERT INTO `order_status` VALUES ('10', '2', 'Falhou');
INSERT INTO `order_status` VALUES ('11', '2', 'Reembolsado');
INSERT INTO `order_status` VALUES ('12', '2', 'Revertido');
INSERT INTO `order_status` VALUES ('13', '2', 'Cancelado pela Operadora');
INSERT INTO `order_status` VALUES ('1', '2', 'Pendente');
INSERT INTO `order_status` VALUES ('16', '2', 'Anulado');
INSERT INTO `order_status` VALUES ('15', '2', 'Processado');
INSERT INTO `order_status` VALUES ('14', '2', 'Expirado');

-- ----------------------------
-- Table structure for `order_total`
-- ----------------------------
DROP TABLE IF EXISTS `order_total`;
CREATE TABLE `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_total
-- ----------------------------
INSERT INTO `order_total` VALUES ('1', '1', 'sub_total', 'Sub-total', 'R$ 111,00', '111.0000', '1');
INSERT INTO `order_total` VALUES ('2', '1', 'shipping', 'Valor total para todo o pedido.', 'R$ 5,00', '5.0000', '3');
INSERT INTO `order_total` VALUES ('3', '1', 'total', 'Total', 'R$ 116,00', '116.0000', '9');
INSERT INTO `order_total` VALUES ('4', '2', 'sub_total', 'Sub-total', 'R$ 79,80', '79.8000', '1');
INSERT INTO `order_total` VALUES ('5', '2', 'shipping', 'Valor total para todo o pedido.', 'R$ 5,00', '5.0000', '3');
INSERT INTO `order_total` VALUES ('6', '2', 'total', 'Total', 'R$ 84,80', '84.8000', '9');
INSERT INTO `order_total` VALUES ('7', '3', 'sub_total', 'Sub-total', 'R$ 73,00', '73.0000', '1');
INSERT INTO `order_total` VALUES ('8', '3', 'shipping', 'Valor total para todo o pedido.', 'R$ 5,00', '5.0000', '3');
INSERT INTO `order_total` VALUES ('9', '3', 'total', 'Total', 'R$ 78,00', '78.0000', '9');
INSERT INTO `order_total` VALUES ('10', '4', 'sub_total', 'Sub-total', 'R$ 49,00', '49.0000', '1');
INSERT INTO `order_total` VALUES ('11', '4', 'shipping', 'Valor total para todo o pedido.', 'R$ 5,00', '5.0000', '3');
INSERT INTO `order_total` VALUES ('12', '4', 'total', 'Total', 'R$ 54,00', '54.0000', '9');
INSERT INTO `order_total` VALUES ('13', '5', 'sub_total', 'Sub-total', 'R$ 64,00', '64.0000', '1');
INSERT INTO `order_total` VALUES ('14', '5', 'shipping', 'Valor total para todo o pedido.', 'R$ 5,00', '5.0000', '3');
INSERT INTO `order_total` VALUES ('15', '5', 'total', 'Total', 'R$ 69,00', '69.0000', '9');

-- ----------------------------
-- Table structure for `order_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `order_voucher`;
CREATE TABLE `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('50', 'Assassin\'s Creed - Revelações', '', '', '', '', '9788501400000', '', '', '299', '5', 'data/produtos/assassin_screed.jpg', '0', '1', '31.0000', '0', '0', '2013-04-24', '0.00000000', '1', '23.00000000', '16.00000000', '2.00000000', '1', '1', '1', '1', '1', '2013-04-25 15:58:02', '2013-06-05 15:06:46', '60');
INSERT INTO `product` VALUES ('51', 'A Startup de $100', '', '', '', '', '', '', '', '499', '5', 'data/produtos/StartUp.PNG', '11', '1', '100.0000', '0', '0', '2013-06-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-05 15:01:14', '2013-06-10 11:13:09', '19');
INSERT INTO `product` VALUES ('55', 'Medo de Ser Chefe', '', '', '', '', '', '', '', '19', '5', 'data/produtos/MedoChefe.PNG', '5', '1', '49.9000', '0', '0', '2013-06-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-05 15:20:05', '0000-00-00 00:00:00', '4');
INSERT INTO `product` VALUES ('54', 'Sonho Grande', '', '', '', '', '', '', '', '34', '5', 'data/produtos/SonhoGrande.PNG', '5', '1', '29.9000', '0', '0', '2013-06-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-05 15:12:19', '2013-06-05 15:13:28', '6');
INSERT INTO `product` VALUES ('56', 'Adestramento 2nd', '', '', '', '', '', '', '', '14', '5', 'data/produtos/AdestramentoSeg.PNG', '0', '1', '41.0000', '0', '0', '2013-06-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-05 15:24:39', '0000-00-00 00:00:00', '2');
INSERT INTO `product` VALUES ('57', 'Fiote Cria', '', '', '', '', '', '', '', '45', '5', 'data/produtos/CaoFiote.PNG', '0', '1', '75.0000', '0', '0', '2013-06-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-05 15:29:34', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('58', 'Aves Cerrado', '', '', '', '', '', '', '', '55', '5', 'data/produtos/Aves.PNG', '0', '1', '49.9000', '0', '0', '2013-06-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-05 15:32:13', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('59', 'Madame Charme', '', '', '', '', '', '', '', '22', '5', 'data/produtos/MadameCharme.PNG', '0', '1', '31.0000', '0', '0', '2013-06-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-05 15:38:40', '0000-00-00 00:00:00', '1');
INSERT INTO `product` VALUES ('60', 'INFL332', '', '', '', '', '', '', '', '9', '5', 'data/produtos/InFL2.PNG', '5', '1', '32.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 15:48:08', '2013-06-09 15:49:02', '0');
INSERT INTO `product` VALUES ('61', 'DIRAUDIO', '', '', '', '', '', '', '', '20', '5', 'data/produtos/DIR.PNG', '0', '1', '15.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 15:53:41', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('62', 'BIO1', '', '', '', '', '', '', '', '80', '5', 'data/produtos/GeneEgo.PNG', '0', '1', '65.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 16:01:08', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('63', 'BIO2', '', '', '', '', '', '', '', '100', '5', 'data/produtos/Evolucao.PNG', '12', '1', '45.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 16:03:38', '2013-06-10 11:12:56', '1');
INSERT INTO `product` VALUES ('64', 'MATH1', '', '', '', '', '', '', '', '59', '5', 'data/produtos/CascaNoz.PNG', '0', '1', '16.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 16:23:22', '2013-06-09 16:26:14', '0');
INSERT INTO `product` VALUES ('65', 'MATH2', '', '', '', '', '', '', '', '75', '5', 'data/produtos/MCSquare.PNG', '0', '1', '25.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 16:31:18', '0000-00-00 00:00:00', '2');
INSERT INTO `product` VALUES ('66', 'PRNCE', '', '', '', '', '', '', '', '73', '5', 'data/produtos/PRINCIPE.PNG', '5', '1', '18.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 16:57:44', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('67', 'PEDAG1', '', '', '', '', '', '', '', '67', '5', 'data/produtos/Pedagogia1.PNG', '0', '1', '46.0000', '0', '0', '2013-06-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 17:04:29', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('68', 'Inferno - Dan Brown', '', '', '', '', '', '', '', '10', '5', 'data/produtos/imagem.jpg', '15', '1', '39.0000', '0', '0', '2013-06-09', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 23:22:24', '2013-06-09 23:55:10', '1');
INSERT INTO `product` VALUES ('69', '15 minutos', '', '', '', '', '', '', '', '29', '5', 'data/produtos/imagem (1).jpg', '15', '1', '49.0000', '0', '0', '2013-06-09', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 23:45:23', '2013-06-11 14:23:04', '1');
INSERT INTO `product` VALUES ('70', 'Curso de Contabilidade', '', '', '', '', '', '', '', '50', '5', 'data/produtos/curso contabilidade.jpg', '0', '1', '95.0000', '0', '0', '2013-06-09', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-09 23:52:56', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('71', 'Mini Dicionário', '', '', '', '', '', '', '', '100', '5', 'data/produtos/miniaurelio.jpg', '0', '1', '34.0000', '0', '0', '2013-06-09', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-10 00:03:15', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('72', 'Wicca', '', '', '', '', '', '', '', '30', '5', 'data/produtos/wicca.jpg', '11', '1', '9.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 14:21:39', '2013-06-11 14:23:34', '0');
INSERT INTO `product` VALUES ('73', 'Blink', '', '', '', '', '', '', '', '89', '5', 'data/produtos/blink.PNG', '13', '1', '12.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 14:26:37', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('74', 'mistico', '', '', '', '', '', '', '', '50', '5', 'data/produtos/mistico.jpg', '11', '1', '19.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 14:31:13', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('75', 'Pudim de Natal', '', '', '', '', '', '', '', '78', '5', 'data/produtos/AgathaChristie.PNG', '14', '1', '41.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 14:33:39', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('76', 'Yoga', '', '', '', '', '', '', '', '100', '5', 'data/produtos/yoga.jpg', '5', '1', '39.0000', '0', '0', '0000-00-00', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2013-06-11 14:37:31', '0000-00-00 00:00:00', '3');
INSERT INTO `product` VALUES ('86', 'Guia Visual Itália', '', '', '', '', '', '', '', '46', '5', 'data/produtos/GuiaItalia.PNG', '12', '1', '25.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:22:22', '2013-06-11 15:23:00', '0');
INSERT INTO `product` VALUES ('88', 'Casamento Blindado', '', '', '', '', '', '', '', '74', '5', 'data/produtos/CasamentoProvaDivorcio.JPG', '15', '1', '0.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:32:24', '2013-06-11 15:35:16', '0');
INSERT INTO `product` VALUES ('79', 'leigos', '', '', '', '', '', '', '', '200', '5', 'data/produtos/c++leigos.jpg', '12', '1', '59.0000', '0', '0', '0000-00-00', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2013-06-11 14:47:41', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('80', 'receitas', '', '', '', '', '', '', '', '100', '5', 'data/produtos/receitas.jpg', '12', '1', '29.0000', '0', '0', '0000-00-00', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2013-06-11 14:53:12', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('81', 'charme', '', '', '', '', '', '', '', '100', '5', 'data/produtos/receber_com_charme.jpg', '12', '1', '39.0000', '0', '0', '1970-01-01', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '0', '1', '2013-06-11 14:58:09', '2013-06-11 15:13:49', '0');
INSERT INTO `product` VALUES ('92', 'informatica', '', '', '', '', '', '', '', '1000', '5', 'data/produtos/c++leigos.jpg', '14', '1', '59.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:06:19', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('89', 'Kairos', '', '', '', '', '', '', '', '61', '5', 'data/produtos/kairos.JPG', '11', '1', '45.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:45:41', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('84', '1000 Lugares', '', '', '', '', '', '', '', '50', '5', 'data/produtos/1000Lugares.PNG', '11', '1', '250.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:19:12', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('85', '1001', '', '', '', '', '', '', '', '1001', '5', 'data/produtos/1001cervejas.jpg', '15', '1', '50.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:19:30', '0000-00-00 00:00:00', '1');
INSERT INTO `product` VALUES ('87', 'psicopata', '', '', '', '', '', '', '', '300', '5', 'data/produtos/psicopata.jpg', '15', '1', '31.9000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:27:31', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('90', 'Gramatíca', '', '', '', '', '', '', '', '84', '5', 'data/produtos/gramaticacompleta.jpg', '12', '1', '75.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:46:53', '2013-06-11 16:11:23', '1');
INSERT INTO `product` VALUES ('93', 'Comunicação', '', '', '', '', '', '', '', '7', '5', 'data/produtos/corpofala.jpg', '14', '1', '35.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:15:02', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('91', 'Subconsciente', '', '', '', '', '', '', '', '45', '5', 'data/produtos/PoderSubconsciente.JPG', '15', '1', '98.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 15:56:42', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('94', 'Mitologia', '', '', '', '', '', '', '', '63', '5', 'data/produtos/marcaathena.jpg', '11', '1', '30.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:19:05', '2013-06-11 16:20:05', '0');
INSERT INTO `product` VALUES ('95', 'Mitologia', '', '', '', '', '', '', '', '31', '5', 'data/produtos/heroisdoolimpo.jpg', '11', '1', '19.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:23:38', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('96', 'Tratamentos', '', '', '', '', '', '', '', '46', '5', 'data/produtos/anticancer.jpg', '11', '1', '39.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:26:24', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('97', 'Clínica', '', '', '', '', '', '', '', '12', '5', 'data/produtos/emergenciaclinica.jpg', '12', '1', '150.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:29:44', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('98', 'Casgrande', '', '', '', '', '', '', '', '1', '5', 'data/produtos/casgrandeedemonios.jpg', '12', '1', '10.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:34:02', '0000-00-00 00:00:00', '0');
INSERT INTO `product` VALUES ('99', 'Anjos', '', '', '', '', '', '', '', '76', '5', 'data/produtos/filhodeeden.jpg', '13', '1', '46.0000', '0', '0', '2013-06-10', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2013-06-11 16:36:04', '0000-00-00 00:00:00', '0');

-- ----------------------------
-- Table structure for `product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `product_description`
-- ----------------------------
DROP TABLE IF EXISTS `product_description`;
CREATE TABLE `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_description
-- ----------------------------
INSERT INTO `product_description` VALUES ('50', '2', 'Assassin\'s Creed - Revelações', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Escrito por Oliver Bowden, o livro traz de volta o herói de Renascença, o primeiro livro da coleção. Mais velho, sábio e ainda letal como nunca, o Mestre Assassino Ezio precisa refazer os passos do legendário Altaïr numa jornada de descoberta e revelações.&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Uma perigosa jornada que o leva até Constantinopla, o coração do Império Otomano, onde um exército de Templários planeja desestabilizar a região.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Bowden, Oliver\r\nEditora: Galera Record\r\nCategoria: Literatura Estrangeira / Romance', 'Bowden, Oliver\r\nAssassins creed', 'Bowden, Oliver, Assassin, creed');
INSERT INTO `product_description` VALUES ('51', '2', 'A Startup de $100 - Abra o Negócio Dos Seus Sonhos', '&lt;p&gt;Neste livro, Chris Guillebeau nos ensina como levar uma vida de aventuras, significado e propósito. Para escrever este livro, o autor identificou 1.500 pessoas que abriram negócios com um modesto investimento – em alguns casos, menos de 100 dólares – e hoje geram mais de 50 mil dólares, conseguindo transformar suas paixões em lucros. Um guia de fácil utilização com lições de pessoas que aprenderam a transformar aquilo que fazem em realização pessoal. Uma leitura essencial para empreendedores e futuros empreendedores!&lt;/p&gt;\r\n', 'Autor: Guillebeau, Chris\r\nEditora: Saraiva\r\nCategoria: Administração / Administração Geral', 'Empreendedorismo Startup 100 doláres', 'empreendedorismo, start-up, negócios');
INSERT INTO `product_description` VALUES ('54', '2', 'Sonho Grande', '&lt;p&gt;Jorge Paulo Lemann, Marcel Telles e Beto Sicupira ergueram, em pouco mais de quatro décadas, o maior império da história do capitalismo brasileiro e ganharam uma projeção sem precedentes no cenário mundial. Nos últimos cinco anos eles compraram nada menos que três marcas americanas conhecidas globalmente: Budweiser, Burger King e Heinz. Tudo isso na mais absoluta discrição, esforçando-se para ficar longe dos holofotes. A fórmula de gestão que desenvolveram, seguida com fervor por seus funcionários, se baseia em meritocracia, simplicidade e busca incessante por redução de custos. Uma cultura tão eficiente quanto implacável, em que não há espaço para o desempenho medíocre. Por outro lado, quem traz resultados excepcionais tem a chance de se tornar sócio de suas companhias e fazer fortuna.&lt;br /&gt;\r\nSonho grande é o relato detalhado dos bastidores da trajetória desses empresários desde a fundação do banco Garantia, nos anos 70, até os dias de hoje.&lt;/p&gt;\r\n', 'Autor: Correa, Cristiane\r\nEditora: Sextante / Gmt\r\nCategoria: Administração / Administração Geral', 'sonho grande', 'sonho, grande, empreendedorismo');
INSERT INTO `product_description` VALUES ('55', '2', 'Não Tenha Medo de Ser Chefe', '&lt;p&gt;Jorge Paulo Lemann, Marcel Telles e Beto Sicupira ergueram, em pouco mais de quatro décadas, o maior império da história do capitalismo brasileiro e ganharam uma projeção sem precedentes no cenário mundial. Nos últimos cinco anos eles compraram nada menos que três marcas americanas conhecidas globalmente: Budweiser, Burger King e Heinz. Tudo isso na mais absoluta discrição, esforçando-se para ficar longe dos holofotes. A fórmula de gestão que desenvolveram, seguida com fervor por seus funcionários, se baseia em meritocracia, simplicidade e busca incessante por redução de custos. Uma cultura tão eficiente quanto implacável, em que não há espaço para o desempenho medíocre. Por outro lado, quem traz resultados excepcionais tem a chance de se tornar sócio de suas companhias e fazer fortuna.&lt;br /&gt;\r\nSonho grande é o relato detalhado dos bastidores da trajetória desses empresários desde a fundação do banco Garantia, nos anos 70, até os dias de hoje.&lt;/p&gt;\r\n', 'Autor: Tulgan, Bruce\r\nEditora: Sextante / Gmt\r\nCategoria: Administração / Administração Geral', 'não tenha medo de ser chefe', 'medo, chefe, empreendedorismo, não, tenha, ser, de');
INSERT INTO `product_description` VALUES ('56', '2', 'Adestramento Inteligente - 2ª Ed.', '&lt;p&gt;As técnicas sugeridas neste livro permitem adestrar cães de qualquer raça, em qualquer idade e de qualquer porte, sempre com muito respeito e carinho. São dicas práticas que permitem encontrar facilmente as melhores soluções para problemas que podem estar atrapalhando o relacionamento com o seu cão, como agressividade, xixi fora do lugar, compulsão para roer móveis, e muitos outros. Você vai aprender:&lt;br /&gt;\r\n- Que para obter o respeito de seu cão é preciso mostrar a ele que você é o líder da &quot;matilha&quot;;&lt;br /&gt;\r\n- Que o adestramento inteligente pode ser aplicado em cães a partir de 50 dias de vida e que não tem limite de idade;&lt;br /&gt;\r\n- Quais os equipamentos que contribuem para o adestramento e a maneira correta de utilizá-los;&lt;br /&gt;\r\n- Quais os principais problemas de comportamento e como resolvê-los.&lt;/p&gt;\r\n\r\n&lt;p&gt;Com amor, humor e bom senso, Alexandre Rossi, o Dr. Pet, mostra como adestrar seu melhor amigo sem sofrimento - nem para você, nem para ele.&lt;/p&gt;\r\n', 'Autor: Rossi, Alexandre\r\nEditora: Saraiva\r\nCategoria: Agropecuária / Criação de Animais', 'adestramento inteligente', 'administração, inteligente, agropecuária');
INSERT INTO `product_description` VALUES ('57', '2', 'Como Criar Um Cão Perfeito Desde Filhotinho', '&lt;p&gt;Fundador do Dog Psychology Center em Los Angeles, CESAR MILLAN liderou a lista dos mais vendidos do New York Times com os best-sellers Cesar’s Way, Be the Pack Leader, e A Member of the Family. Ele é a estrela de Dog Whisperer com Cesar Millan, o programa mais popular do canal National Geographic. Além de seus seminários educacionais e de trabalho com cães “indomáveis”, Cesar e sua esposa fundaram o Cesar and Ilusion Millan Foundation, uma organização sem fins lucrativos dedicada a ajudar os abrigos e grupos de resgate. MELISSA JO PELTIER, produtora executiva e escritora de Dog Whisperer com Cesar Millan, foi laureada no cinema e na televisão com um Emmy, um Peabody, e mais de cinquenta outros prêmios. Ela vive em Nyack, Nova York, com seu marido, o escritor e diretor John Gray.&lt;/p&gt;\r\n', 'Autor: Millan, Cesar; Peltier, Melissa Jo\r\nEditora: Agir\r\nCategoria: Agropecuária / Criação de Animais', 'Como Criar Um Cão Perfeito Desde Filhotinho', 'filhote, cão, agropecuária');
INSERT INTO `product_description` VALUES ('58', '2', 'Aves do Brasil - Pantanal &amp; Cerrado', '&lt;p&gt;&amp;nbsp;O Guia &lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt;Aves do Brasil: Pantanal &amp;amp; Cerrado&lt;/span&gt; foi criado para atender àqueles que se interessam pela observação de aves reunindo, através de rica ilustração, todas as espécies de habitam o pantanal e cerrado brasileiro. Com cerca de 336 páginas e 740 espécies de pássaros, o guia é um produto inédito, fruto do envolvimento dos maiores especialistas sobre a fauna da região e de alguns dos melhores ilustradores de pássaros do mundo, auxiliados por cartógrafos de renomada experiência. A equipe responsável pelo livro teve o respaldo de instituições de pesquisa e conservação da natureza, bancos de dados científicos e os mais modernos recursos de cartografia.&lt;/p&gt;\r\n', 'Autor: Argel, Martha; Ridgely, Robert S.; Tudor, Guy ; John A. Gwynne\r\nEditora: Horizonte Geográfico\r\nCategoria: Agropecuária / Criação de Animais', 'Aves do Brasil  Pantanal Cerrado', 'aves, passaros, agropecuária');
INSERT INTO `product_description` VALUES ('59', '2', 'Madame Charme - Lições de Estilo, Beleza e Comportamento Que Aprendi Em Paris', '&lt;p&gt;A elegância da vida Parisiense no seu dia a dia. Agradável, recheado de humor e dicas de estilo de vida. Seu brilhantismo e sinceridade impressionam as mulheres que gostariam de viver ao modo francês, mas não têm tempo para curtir um ano de intercâmbio em Paris. Editado com um texto leve e romanceado, fugindo das formas (que não combinam com Paris) dos guias tradicionais, o livro apresenta 20 segredos para você ser chic como uma parisiense.&lt;/p&gt;\r\n', 'Autor: L. Scott, Jennifer\r\nEditora: Agir\r\nCategoria: Artes / Moda', 'Madame Charme', '');
INSERT INTO `product_description` VALUES ('60', '2', 'Como Fazer Amigos e Influenciar Pessoas - Audiolivro - CD - MP3', '&lt;p&gt;&quot;Como fazer amigos e influenciar pessoas&quot; foi escrito por Dale Carnegie e lançado originalmente em 1937. Rapidamente alcançou repercussão mundial, e até hoje é considerado um dos maiores bestsellers de todos os tempos, que já ultrapassou a marca de 30 milhões de exemplares vendidos. Com mensagens simples e práticas sobre como melhorar o relacionamento interpessoal, este audiolivro lhe ajudará a aumentar seu poder pessoal, tornando-o um exemplo de sucesso em suas relações profissionais e pessoais.&lt;/p&gt;\r\n\r\n&lt;p&gt;Ouvindo este audiolivro, você vai aprender:&lt;/p&gt;\r\n\r\n&lt;p&gt;- Seis maneiras de fazer as pessoas gostarem de você;&lt;br /&gt;\r\n- Doze passos que levam as pessoas a concordarem com as suas ideias;&lt;br /&gt;\r\n- Nove maneiras para mudar as pessoas sem provocar ressentimentos.&lt;/p&gt;\r\n', 'Autor: Carnegie, Dale\r\nEditora: Nossa Cultura\r\nCategoria: Audiolivro / Auto Ajuda', 'Como Fazer Amigos e Influenciar Pessoas - Audiolivro - CD - MP3', 'influenciar, pessoas, como, fazer, amigos, autoajuda, audiolivro');
INSERT INTO `product_description` VALUES ('61', '2', 'Direito Constitucional - Vol. 9 - Col. Oab Nacional - 1º Fase - Audiolivro', '&lt;p&gt;Este audiolivro tem o objetivo de auxiliá-lo a se preparar para o Exame da Ordem dos Advogados do Brasil. Procurei usar uma linguagem objetiva e direta, a fim de facilitar ao máximo a compreensão e memorização dos conteúdos. A partir de minha experiência como professora de cursos preparatórios para exame da OAB e concursos públicos, reúne os temas que já foram indagados em exames anteriores, bem como os assuntos mais importantes que possam ser exigidos em provas futuras. Além disso, devo frisar que a leitura integral da Constituição da República de 1988 é indispensável para o seu estudo. É enorme minha satisfação em fazer parte desta coleção e espero, com isso, contribuir para o sucesso dos futuros advogados.&lt;/p&gt;\r\n', 'Autor: Russo, Luciana\r\nEditora: Saraiva\r\nCategoria: Audiolivro / Direito', 'Direito Constitucional ', 'direito, constitucional, audiolivro');
INSERT INTO `product_description` VALUES ('62', '2', 'O Gene Egoísta', '&lt;p&gt;&quot;O gene egoísta&quot; foi publicado em 1976. Se propunha a condensar o enorme corpo teórico já produzido para compreender&lt;br /&gt;\r\ncomo espécies surgem e se diversificam, como indivíduos se relacionam e colaboram entre si - e a ir além. Richard Dawkins inovou de muitas maneiras. Introduziu uma linguagem informal e metafórica numa área dominada por reflexões densas e fórmulas matemáticas. Subverteu a percepção intuitiva da importância dos organismos e dos grupos: o gene é quem comanda, quem busca perpetuar-se. Os organismos são máquinas de sobrevivência construídas pelos genes, num processo competitivo em busca da máquina mais eficaz. E a influência dos genes não pára aí. Organismos interagem entre si e com o mundo inanimado, e assim alteram seu ambiente e promovem a propagação de genes presentes em outros corpos.&lt;br /&gt;\r\nUm dos livros mais aclamados da história da divulgação científica, ele não só apresenta a biologia evolutiva de forma&lt;br /&gt;\r\nacessível, mas acrescenta uma interpretação metafórica que inspirou gerações de biólogos e simpatizantes: somos&lt;br /&gt;\r\nmáquinas de sobrevivência a serviço dos genes.&lt;/p&gt;\r\n', 'Autor: Dawkins, Richard\r\nEditora: Companhia das Letras\r\nCategoria: Ciências Biológicas / Biologia', '', '');
INSERT INTO `product_description` VALUES ('63', '2', 'A Grande História da Evolução 	 A Grande História da Evolução', '&lt;p&gt;A árvore da vida percorrida numa peregrinação de 4 bilhões de anos. Os integrantes da jornada se encontram a cada entroncamento, contam suas histórias e ressaltam as maravilhas da natureza e as revelações da biologia evolutiva. Um trabalho enciclopédico por um dos maiores evolucionistas da atualidade&lt;br /&gt;\r\n&quot;A Grande História da Evolução&quot; é uma peregrinação ao longo da árvore genealógica da vida. Partindo de onde estamos hoje, passamos por quarenta entroncamentos onde nos deparamos com ancestrais e peregrinos que vêm de outros ramos. O ponto de chegada situa-se há 4 bilhões de anos, na origem da vida.&lt;br /&gt;\r\nAo longo do trajeto, peregrinos contam suas histórias e descortinam as maravilhas da diversidade biológica que habita este planeta e os mistérios da evolução que ainda hoje desafiam biólogos. O humano ancestral &quot;Little Foot&quot; investiga como surgiu a possibilidade de andarmos sobre dois pés; o gibão ajuda a entender por que não temos que fazer calças com um furo para a cauda; o camundongo deixa claro que o que torna um organismo diferente do outro não são exatamente os genes, mas como sua atividade é regulada; castores explicam o conceito de fenótipo estendido, em que a represa é uma extensão do próprio castor; e o gafanhoto discute se existem raças. A paisagem que se descortina durante a viagem expõe uma amostra da diversidade da natureza e também explora como entendê-la. O leitor chega ao fim do percurso maravilhado e enriquecido com novas ideias e reflexões. Uma enciclopédia da vida para ler, reler e consultar&lt;/p&gt;\r\n', 'Autor: Dawkins, Richard\r\nEditora: Companhia das Letras\r\nCategoria: Ciências Biológicas / Biologia', '', '');
INSERT INTO `product_description` VALUES ('64', '2', 'O Universo Numa Casca de Noz - Col. Saraiva de Bolso', '&lt;p&gt;Em “O universo numa casca de noz”, Stephen Hawking nos conduz às fronteiras últimas da física teórica para explicar, em linguagem acessível e com riqueza de imagens, os princípios que controlam o universo. A teoria da relatividade, a mecânica quântica, o princípio da incerteza, a teoria-M e as p-branas são definidos de forma bem-humorada e compõem o que o físico chama de Teoria de Tudo.&lt;/p&gt;\r\n\r\n&lt;p&gt;Tradutor: Mônica Gagliotti Fortunato Friaça&lt;br /&gt;\r\nConsultoria: Amâncio Friaça&lt;/p&gt;\r\n', 'Autor: Hawking, Stephen William\r\nEditora: Saraiva de Bolso\r\nCategoria: Ciências Exatas / Física', '', 'casca, noz, matemática, exatas');
INSERT INTO `product_description` VALUES ('65', '2', 'Matemática e Lógica Para Concursos', '&lt;p&gt;“Você acha matemática complicada e não se lembra mais do que estudou? Acaba se atrapalhando quando o assunto é Raciocínio Lógico? Quer “brigar” por um cargo público (auditor fiscal, oficial de justiça, agente de polícia, técnico da Receita Federal, analista de finanças etc.)? Você sabe que vai precisar direcionar bem os seus estudos. A competição é acirrada e qualquer ponto pode fazer a diferença. Matemática e Lógica para Concursos, elaborada pelo professor José Luiz de Morais, especialista em preparação de candidatos a concursos públicos, reúne toda a teoria necessária e muito cobrada em concursos, para ajudar você a se preparar melhor nos estudos. Aqui, você encontrará o que realmente vai precisar estudar, de forma objetiva, didática e clara, como se estivesse assistindo a uma aula proferida pelo autor. Dividida em duas partes (Parte I – Raciocínio Lógico e Parte II – Matemática) e com um projeto gráfico moderno, em duas cores, que torna a leitura confortável e evidencia a organização do conteúdo, “Matemática e Lógica para Concursos” tem outro diferencial: ao final de cada capítulo, há exercícios resolvidos e comentados retirados de provas de concursos públicos, vestibulares, Enem, escolas militares ou elaborados pelo autor. Depois de estudar cada tópico da matéria em separado, há, ao final de cada parte, uma bateria de questões também com a resposta comentada, mas, desta vez, com os tópicos misturados, tal como aparecem nas provas. São mais de 530 exercícios comentados e resolvidos passo a passo, entre questões abertas, de múltipla escolha, de julgamento (certo ou errado/verdadeiro ou falso) ou problemas matemáticos.&lt;/p&gt;\r\n', 'Autor: Morais, José Luiz de\r\nEditora: Saraiva\r\nCategoria: Ciências Exatas / Matemática', '', 'matemática, logica, concursos');
INSERT INTO `product_description` VALUES ('66', '2', 'O Príncipe - Col. Saraiva de Bolso', '&lt;p&gt;Sob a atmosfera inquieta da Renascença e domina¬do pela ideia da unidade italiana, Maquiavel escreve “O príncipe”. Nele tenta definir o poder, as formas de governo, as virtudes do soberano e uma nova ética do fazer político. O texto reflete as condições da época, o combate às tradições medievais e é notável a abordagem livre de fatos históricos. Maquiavel deixou como legado, sobretudo com este escrito, uma contribuição essencial para a ciência política.&lt;/p&gt;\r\n\r\n&lt;p&gt;Tradução, prefácio e notas: Lívio Xavier&lt;/p&gt;\r\n', 'Autor: Maquiavel, Nicolau\r\nEditora: Saraiva de Bolso\r\nCategoria: Ciências Humanas e Sociais / Política', '', 'principe');
INSERT INTO `product_description` VALUES ('67', '2', 'Pedagogia da Autonomia - Saberes Necessários À Prática Educativa - 43ª Ed. 2011', '&lt;p&gt;Na Pedagogia da autonomia, de 1996, Paulo Freire nos apresenta uma reflexão sobre a relação entre educadores e educandos e elabora propostas de práticas pedagógicas, orientadas por uma ética universal, que desenvolvem a autonomia, a capacidade crítica e a valorização da cultura e conhecimentos empíricos de uns e outros. Criando os fundamentos para a implementação e consolidação desse diálogo político-pedagógico e sintetizando questões fundamentais para a formação dos educadores e para uma prática educativo-progressiva, Paulo Freire estabelece neste livro novas relações e condições para a tarefa da educação.&lt;/p&gt;\r\n', 'Autor: Freire, Paulo\r\nEditora: Paz e Terra\r\nCategoria: Ciências Humanas e Sociais / Pedagogia', '', 'pedagogia, autonomia, saberes');
INSERT INTO `product_description` VALUES ('68', '2', 'Inferno - Uma Nova Aventura de Robert Langdon', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Neste novo e fascinante thriller Dan Brown retoma a mistura magistral de história, arte, códigos e símbolos que o consagrou em O código Da Vinci, Anjos e demônios e O símbolo perdido e faz de Inferno sua aposta mais alta até o momento.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;No coração da Itália, Robert Langdon, o professor de Simbologia de Harvard, é arrastado para um mundo angustiante centrado em uma das obras literárias mais duradouras e misteriosas da história: O Inferno, de Dante Alighieri.&lt;/span&gt;&lt;br /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Numa corrida contra o tempo, Langdon luta contra um adversário assustador e enfrenta um enigma engenhoso que o arrasta para uma clássica paisagem de arte, passagens secretas e ciência futurística. Tendo como pano de fundo o sombrio poema de Dante, Langdon mergulha numa caçada frenética para encontrar respostas e decidir em quem confiar, antes que o mundo que conhecemos seja destruído.&lt;/span&gt;&lt;/p&gt;\r\n', 'Neste novo e fascinante thriller Dan Brown retoma a mistura magistral de história, arte, códigos e símbolos que o consagrou em O código Da Vinci, Anjos e demônios e O símbolo perdido e faz de Inferno sua aposta mais alta até o momento', '', 'Literatura Estrangeira, Romance, Brown, Dan, Inferno');
INSERT INTO `product_description` VALUES ('69', '2', '15 Minutos - Italiano - Com 02 CDs', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;A série 15 Minutos foi feita para quem quer aprender um idioma de forma rápida, fácil e eficaz. Dividido em 60 aulas com duração de 15 minutos, os livros abrangem diversos temas do cotidiano e cobrem situações de lazer a negócios. Este volume traz Cd de áudio para o leitor aprimorar sua pronúncia ouvindo italianos nativos.&lt;/span&gt;&lt;/p&gt;\r\n', 'Aprenda Idiomas com 15 minutos por dia.', '', '15 minutos, italiano');
INSERT INTO `product_description` VALUES ('70', '2', 'Curso de Contabilidade Para Não Contadores - 7ª Ed. 2011', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Este é o primeiro livro voltado especificamente para disciplinas de Contabilidade, (Contabilidade, Custos, Análise de Demonstrações Financeiras) dos cursos de graduação que não visam formar contadores, mas profissionais que serão usuários da Contabilidade. Sua linguagem evita termos excessivamente técnicos, simplifica conceitos considerados complexos e desmistifica algumas idéias tidas como inacessíveis ao não contador. É um texto atual, que abrange a Contabilidade moderna e aspectos da Lei das Sociedades Anônimas, como Balanço Social, Valor Adicionado, Fluxo de Caixa.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Os capítulos são distribuídos de acordo com a demanda de cada curso (Administração, Economia, Direito, Engenharia). Análise de empresa na iminência de concordata e falência, por exemplo, é indicado especificamente para o Curso de Direito. Ao final de cada capítulo é apresentada uma prova aplicada numa instituição de ensino (USP, PUC, USF, Unip, Unisa, UEL, FGV, Unib), propiciando ao estudante uma avaliação prática de sua aprendizagem em relação ao ponto estudado.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Esta quarta edição traz algumas alterações, considerando principalmente algumas mudanças da legislação do nosso país, tais como o Novo Código Civil, mudanças no Imposto de Renda, etc.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Foi excluído desta edilção, um capítulo sobre falência para uma análise mais aprofundada, uma vez que no meio contábil não há consenso em alguns pontos testados nesta nova lei. Segundo os autores, o capítulo retornará em uma nova edição, após consolidação de procedimentos contábeis.&lt;/span&gt;&lt;/p&gt;\r\n', 'Este é o primeiro livro voltado especificamente para disciplinas de Contabilidade, (Contabilidade, Custos, Análise de Demonstrações Financeiras) dos cursos de graduação que não visam formar contadores, mas profissionais que serão usuários da Contabilidade', '', 'Contabilidade, Atlas');
INSERT INTO `product_description` VALUES ('71', '2', 'Míni Dicionário Aurélio da Língua Portuguesa - 8ª Ed. 2010 - Nova Ortografia', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: normal;&quot;&gt;Layout moderno e no tamanho ideal para levar na mochila, na pasta ou na bolsa. O Mini Aurélio é perfeito para acompanhar o dia a dia dos alunos. É útil também para profissionais e pessoas que precisam de uma ferramenta prática para esclarecer dúvidas ou saber os sentidos das palavras.&lt;/span&gt;&lt;/p&gt;\r\n', 'Layout moderno e no tamanho ideal para levar na mochila, na pasta ou na bolsa. O Mini Aurélio é perfeito para acompanhar o dia a dia dos alunos. É útil também para profissionais e pessoas que precisam de uma ferramenta prática para esclarecer dúvidas ou s', '', 'Dicionário, Aurélio, Mini');
INSERT INTO `product_description` VALUES ('72', '2', 'Almanaque Wicca 2013 - Guia de Magia e Espiritualidade', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Repleto de artigos sobre magia e espiritualidade, encantamentos e práticas, o Almanaque Wicca 2013 inspira leigos e praticantes de magia de todas as idades, a despertar sua sabedoria e forças espirituais para melhorar a sua vida e encontrar soluções para impasses e desafios do cotidiano. A obra é recheada de artigos com convidados especiais de grande importância no assunto. Você vai ler sobre: magia com fadas; confissões de uma bruxa brasileira; encantamento para atrair o amor; autoconhecimento através dos números; Thor, o Deus Nórdico do Trovão; como fazer refeições mágicas em dez minutos e muito mais. Pela primeira vez o Almanaque homenageia também os homens, publicando sobre rituais para praticantes do sexo masculino. O livro traz também novidades nas Tabelas e no Calendário.&lt;/span&gt;&lt;/p&gt;\r\n', 'Repleto de artigos sobre magia e espiritualidade, encantamentos e práticas, o Almanaque Wicca 2013 inspira leigos e praticantes de magia de todas as idades, a despertar sua sabedoria e forças espirituais para melhorar a sua vida e encontrar soluções para ', '', 'esoterismo, wicca');
INSERT INTO `product_description` VALUES ('73', '2', 'Blink : The Power of Thinking Without Thinking', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;In his international bestseller The Tipping Point, Malcolm Gladwell redefined how we understand the world around us. Now, in &quot;Blink&quot;, he revolutionizes the way we understand the world within.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Gladwell, Malcolm\r\nEditora: Back Bay Books\r\nCategoria: Pocket Books / Pocket Books', 'Blink Power of Thinking', 'blink, power, of, thinking, without, pocketbook');
INSERT INTO `product_description` VALUES ('74', '2', 'O Místico', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Em “O Místico”, Ian Mecler oferece ao leitor um enredo mágico repleto de sabedoria. Conhecido por seus livros ligados à espiritualidade, o autor surpreende ao narrar uma história cativante, permeada por encontros com incríveis mestres espirituais, passando pelo Espiritismo, pelo Xamanismo, pela Cabala e por muitas outras doutrinas. Recheado de ensinamentos e mistérios da Cabala, especialidade do autor, o livro revela segredos sobre um fantástico templo espiritual, em uma viagem pela árvore da vida, que se inicia diante de um inesperado desafio. Em uma profunda reflexão a respeito de nossa impermanência, surge uma pergunta essencial: Qual é o sentido de uma vida que pode se esvair a qualquer instante? Afinal, há algum sentido em nossa jornada por este planeta? “O Místico” parte em busca de uma resposta, percorrendo um caminho permeado por lindas paisagens, mestres notáveis e um raro acervo de sabedoria. Trata-se de uma obra que ilumina a nossa compreensão e nos move em direção a um estado de plenitude e alegria.&lt;/span&gt;&lt;/p&gt;\r\n', 'Em “O Místico”, Ian Mecler oferece ao leitor um enredo mágico repleto de sabedoria. Conhecido por seus livros ligados à espiritualidade, o autor surpreende ao narrar uma história cativante, permeada por encontros com incríveis mestres espirituais, passand', '', 'Mistico, espiritualismo');
INSERT INTO `product_description` VALUES ('75', '2', 'A Aventura do Pudim de Natal - Col. Agatha Christie', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Primeiro, foi o aviso sinistro para que Poirot não comesse pudim de passas... Depois, a descoberta de um cadáver dentro de um baú... Em seguida, uma briga, ouvida por acaso, que levou a um assassinato... Também o estranho caso do morto que alterou seus hábitos alimentares... E o mistério da vítima que sonhou com o próprio suicídio. Qual a ligação entre esses seis casos espantosos? O toque inigualável da primeira-dama do crime. Divirta-se com seis intrigantes mistérios policiais.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Christie, Agatha\r\nEditora: Nova Fronteira\r\nCategoria: Pocket Books / Pocket Books', 'Agatha Christie', 'agatha, christie, pudim, aventura, natal, pocketbook');
INSERT INTO `product_description` VALUES ('76', '2', 'Yoga Para Nervosos - Aprenda A Administar Seu Estresse', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Na década de 1960, o yoga ainda era uma terapia pouco conhecida. Seu poder era inegável, mas faltavam teorias que falassem mais sobre ele. A noção de que corpo e mente era uma coisa só ainda estava longe de ser aceita e era difícil entender que exercícios com o corpo podiam mudar nossas conexões neurais. Hoje, com as recentes descobertas da medicina, fica mais fácil entender a consistência dessa obra, cada vez mais imprescindível. Já que, se por um lado a ciência avançou, por outro, a vida anda mais conturbada e fragmentada e a necessidade de uma visão integrada entre corpo e mente é maio do que 40 anos atrás.&lt;/span&gt;&lt;/p&gt;\r\n', 'Na década de 1960, o yoga ainda era uma terapia pouco conhecida. Seu poder era inegável, mas faltavam teorias que falassem mais sobre ele. A noção de que corpo e mente era uma coisa só ainda estava longe de ser aceita e era difícil entender que exercícios', '', 'Yoga, esporte, stress');
INSERT INTO `product_description` VALUES ('86', '2', 'Guia Visual Folha de S. Paulo - Itália', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: normal;&quot;&gt;Os guias da Folha são fáceis de consultar, totalmente ilustrados e com inúmeros mapas. Nesta edição sobre a Itália traz um pouco de história e geografia, além de costumes e características de cada cidade. Roma e Lácio têm capítulos especiais.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;&lt;object height=&quot;0&quot; id=&quot;f8898928-98bb-b4a0-f97b-5895ba8e9dae&quot; type=&quot;application/gas-events-abn&quot; width=&quot;0&quot;&gt;&lt;/object&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;object height=&quot;0&quot; id=&quot;69e9e88b-8929-99ae-bb8a-2aa45b988a88&quot; type=&quot;application/gas-events-abn&quot; width=&quot;0&quot;&gt;&lt;/object&gt;&lt;/p&gt;\r\n', 'Autor: Publifolha\r\nEditora: Publifolha\r\nCategoria: Turismo / Guias de Viagem', '', 'guia, visual, folha, sao, paulo');
INSERT INTO `product_description` VALUES ('79', '2', 'Começando a Programar Em C++ Para Leigos', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Pensar como um programador e entender como o C++ funciona Criar programas e tirar bugs do seu código Administrar os conceitos e as técnicas de desenvolvimento básico em C++ Como pensam as coisas – entenda o que um computador precisa para trabalhar, o que é um algoritmo e como funcionam as linguagens de programação: Ferramentas da profissão – instale Code::Blocks, use o ambiente de desenvolvimento integrado e escreva o seu primeiro programa. Mostre-se – aprenda a escrever expressões simples, declare variáveis inteiras e tome decisões dentro de um programa.&lt;/span&gt;&lt;/p&gt;\r\n', 'Pensar como um programador e entender como o C++ funciona Criar programas e tirar bugs do seu código Administrar os conceitos e as técnicas de desenvolvimento básico em C++. Como pensam as coisas – entenda o que um computador precisa para trabalhar, o que', '', 'programação, c++, leigos');
INSERT INTO `product_description` VALUES ('87', '2', 'Mentes Perigosas - O Psicopata Mora ao Lado', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: normal;&quot;&gt;&quot;Mentes Perigosas&quot; discorre sobre pessoas frias, manipuladoras, transgressoras de regras sociais, sem consciência e desprovidas de sentimento de compaixão ou culpa. Esses &quot;predadores sociais&quot; com aparência humana estão por aí, misturados conosco, incógnitos, infiltrados em todos os setores sociais.&lt;/span&gt;&lt;/p&gt;\r\n', '&quot;Mentes Perigosas&quot; discorre sobre pessoas frias, manipuladoras, transgressoras de regras sociais, sem consciência e desprovidas de sentimento de compaixão ou culpa. Esses &quot;predadores sociais&quot; com aparência humana estão por aí, misturad', '', 'psicologia, mente, perigosa, psicopata');
INSERT INTO `product_description` VALUES ('80', '2', 'Cozinha Rápida de Ana Maria Braga', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: normal;&quot;&gt;Agora não há mais desculpa para comidinhas sem graça e fast-food. A &quot;Cozinha Rápida de Ana Maria Braga&quot; traz para você opções de entradas, pratos principais, acompanhamentos e sobremesas práticas e rápidas de fazer. Em alguns minutos, sua família terá uma refeição gostosa, barata e nutritiva, e seus convidados nem irão imaginar que seus pratos tão bonitos são tão fáceis de preparar.&lt;/span&gt;&lt;/p&gt;\r\n', 'Agora não há mais desculpa para comidinhas sem graça e fast-food. A &quot;Cozinha Rápida de Ana Maria Braga&quot; traz para você opções de entradas, pratos principais, acompanhamentos e sobremesas práticas e rápidas de fazer. Em alguns minutos, sua famíli', '', 'cozinha, ana, maria, braga, receitas');
INSERT INTO `product_description` VALUES ('81', '2', 'Receber Com Charme', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Recepcionar as pessoas em casa é algo prazeroso e extremamente cativante, que requer maestria para orquestrar todos os detalhes e oferecer uma recepção charmosa e acolhedora. Para dar uma mãozinha àqueles que já estão programando o próximo encontro com a família e os amigos, a Globo Livros lança Receber com charme, que reúne em uma única publicação dicas de decoração e receitas para recepções: sejam elas em casa, apartamento ou ambientes externos. São dez capítulos e 288 páginas ricamente ilustradas, com indicações de chefs, arquitetos, decoradores e especialistas no assunto.&lt;/span&gt;&lt;/p&gt;\r\n', 'Recepcionar as pessoas em casa é algo prazeroso e extremamente cativante, que requer maestria para orquestrar todos os detalhes e oferecer uma recepção charmosa e acolhedora. Para dar uma mãozinha àqueles que já estão programando o próximo encontro com a ', '', 'culinaria, charme');
INSERT INTO `product_description` VALUES ('92', '2', 'Começando a Programar Em C++ Para Leigos', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Pensar como um programador e entender como o C++ funciona Criar programas e tirar bugs do seu código Administrar os conceitos e as técnicas de desenvolvimento básico em C++ Como pensam as coisas – entenda o que um computador precisa para trabalhar, o que é um algoritmo e como funcionam as linguagens de programação: Ferramentas da profissão – instale Code::Blocks, use o ambiente de desenvolvimento integrado e escreva o seu primeiro programa. Mostre-se – aprenda a escrever expressões simples, declare variáveis inteiras e tome decisões dentro de um programa.&lt;/span&gt;&lt;/p&gt;\r\n', 'Pensar como um programador e entender como o C++ funciona Criar programas e tirar bugs do seu código Administrar os conceitos e as técnicas de desenvolvimento básico em C++. Como pensam as coisas – entenda o que um computador precisa para trabalhar, o que', '', 'c++, informática, leigos, aprendendo');
INSERT INTO `product_description` VALUES ('84', '2', '1.000 Lugares para Conhecer Antes de Morrer', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: normal;&quot;&gt;Um livro que lhe diz o que é belo, o que é inspirador, o que é divertido e o que é simplesmente inesquecível em todas as partes do mundo. Patricia Schultz apresenta roteiros de viagem para todos os gostos e bolsos, entre eles: reservas ecológicas, ruínas sagradas, resorts, restaurantes, vilarejos esquecidos pelo tempo, museus, teatros e muitos outros.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Schultz, Patricia\r\nEditora: Sextante / Gmt\r\nCategoria: Turismo / Guias de Viagem', 'Lugares para Conhecer Antes de Morrer', 'lugares, para, conhecer, antes, de, morrer');
INSERT INTO `product_description` VALUES ('85', '2', '1001 Cervejas Para Beber Antes de Morrer', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: normal;&quot;&gt;Há um mundo novo a ser descoberto a respeito da bebida mais popular do Brasil. Você vai se surpreender com a variedade de sabores, texturas, cores e ingredientes que vão muito além das cervejas que costumamos encontrar nos bares e restaurantes do país.&lt;/span&gt;&lt;/p&gt;\r\n', 'Há um mundo novo a ser descoberto a respeito da bebida mais popular do Brasil. Você vai se surpreender com a variedade de sabores, texturas, cores e ingredientes que vão muito além das cervejas que costumamos encontrar nos bares e restaurantes do país.', '', 'cerveja, 1001, beber');
INSERT INTO `product_description` VALUES ('88', '2', 'Casamento Blindado - o Seu Casamento À Prova de Divórcio', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Numa sociedade onde as pessoas vivem se divorciando para se casar de novo e vão sendo formados novos arranjos conjugais, parece um contrassenso falar em casamento para a vida toda. Porém, muitos acreditam que essa ainda é a modalidade de união mais sadia e sólida. No livro Casamento Blindado - O Seu Casamento à Prova de Divórcio, Renato e Cristiane Cardoso defendem que é possível ter um relacionamento feliz e duradouro.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Cardoso, Cristiane; Cardoso, Renato\r\nEditora: Thomas Nelson Brasil\r\nCategoria: Religião / Cristianismo', '', 'casamento, blindado, prova, divorcio');
INSERT INTO `product_description` VALUES ('89', '2', 'Kairós - o Tempo de Deus', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Quase três anos depois do lançamento de &quot;Ágape&quot;, maior fenômeno editorial brasileiro, que teve seus direitos vendidos para mais de 30 países e adaptação para o público infantil, chega às livrarias &quot;Kairós&quot;, o novo livro de Padre Marcelo Rossi.&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Os leitores que se emocionaram ao conhecer o amor incondicional, o Amor Ágape, irão renovar a sua fé com &quot;Kairós&quot;, que conta com prefácio do padre Fábio de Melo. No livro, Padre Marcelo parte da palavra grega kairos, que significa “momento certo”, para falar sobre o tempo de Deus em oposição ao khronos, o tempo cronológico, o tempo dos homens.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;O autor selecionou passagens da Bíblia com personagens como Abraão, Moisés, José do Egito, Isaías, Maria, Jó e Zaqueu, que passaram por situações de incompreensão, sofrimento e provação e, mesmo assim, souberam esperar pelo tempo de Deus, pelo seu kairos. Todos eles tiveram as suas vidas transformadas no momento que Deus julgou oportuno. Após cada trecho bíblico citado, reflexões e comentários do Padre Marcelo convidam o leitor a refletir sobre suas próprias angústias e a fortalecer a sua fé.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;O livro também destaca a importância da oração e apresenta no final de cada capítulo uma prece especial para ajudar os leitores a permanecerem perseverantes na fé e confiantes no poder de Deus. Kairós traz ainda uma bênção do Padre Marcelo dedicada exclusivamente aos leitores.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Da mesma maneira autêntica e carismática que conversa com milhões de brasileiros em seus programas de rádio e televisão, Padre Marcelo se comunica com os fiéis em Kairós para levar a eles os ensinamentos religiosos e conforto espiritual.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Nos 14 capítulos do livro, o autor busca fortalecer nos leitores a certeza de que Deus tem um tempo reservado para cada um de seus filhos. Nas palavras de Padre Marcelo, “tão importante quanto entender o amor Divino, é entender o tempo de Deus. Só assim é que conseguimos controlar nossas ansiedades e cultivar nossa paciência. Quem compreende o Kairós, alcança o Ágape”.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Rossi, Padre Marcelo\r\nEditora: Principium Editorial\r\nCategoria: Religião / Cristianismo', '', 'kairos, tempo, deus');
INSERT INTO `product_description` VALUES ('90', '2', 'Gramática Completa para Concursos e Vestibulares - Nova Ortografia e de Acordo com o Volp - 2ª Ed.', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Com a evolução dos estudos linguísticos e das pesquisas em língua portuguesa, há muito não saía uma gramática completa que pudesse dar conta deste progresso.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Esta lacuna é agora preenchida pela edição da Moderna Gramática Portuguesa, do profº Evanildo Bechara, revista e atualizada, também na grafia, pelo autor, eminente estudioso e pesquisador de nosso idioma, e representante da Academia Brasileira de Letras no novo Acordo Ortográfico.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;Acertando o passo com este progresso, a Moderna Gramática Portuguesa põe nas mãos dos professores, alunos e estudiosos a mais completa soma de fatos e soluções de dúvidas em língua portuguesa.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Almeida, Nilson Teixeira de\r\nEditora: Saraiva\r\nCategoria: Linguística / Português', 'Gramática completa para concursos e vestibulares traz a teoria gramatical completa explicada de um modo simples e mais de 500 testes de múltipla escolha selecionados de concursos públicos e vestibulares promovidos por diversas instituições brasileiras, co', 'Gramatíca, Portuguesa, Acordo, Ortográfico');
INSERT INTO `product_description` VALUES ('91', '2', 'O Poder do Subconsciente', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;&quot;O poder do subconsciente&quot; é uma receita infalível para obter sucesso em qualquer área. O livro nos ensina que o segredo para conseguir o que queremos - dinheiro, saúde, amor, etc. - é sempre imaginar seus desejos como algo concreto e real, que está acontecendo ou que irá acontecer, com certeza. Para tanto, é preciso desenvolver todo o potencial de seu subconsciente. As técnicas para isso estão neste livro.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Murphy, Joseph\r\nEditora: Best Seller Ltda\r\nCategoria: Psicologia / Psicologia', '', '');
INSERT INTO `product_description` VALUES ('93', '2', 'O Corpo Fala - A Linguagem Silenciosa da Comunicação Não-verbal', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; line-height: 15px;&quot;&gt;A Linguagem silenciosa da comunicação não verbal para o homem e a mulher, o jovem e o maduro, o casado e o solteiro. O profissional de qualquer área, para todo o ser humano.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Weil, Pierre; Tompakow, Roland\r\nEditora: Vozes\r\nCategoria: Linguística / Comunicação', 'O Corpo Fala - A Linguagem Silenciosa da Comunicação Não-verbal&quot; tenta desvendar a comunicação não-verbal do corpo humano. O livro é indicado para profissionais de qualquer área, ou seja, para todo o ser humano.', 'corpo, linguagem, comunicação');
INSERT INTO `product_description` VALUES ('94', '2', 'A Marca de Atena', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Annabeth está apavorada. Justo quando ela está prestes a reencontrar Percy — após seis meses afastados por culpa de Hera —, o Acampamento Júpiter parece estar se preparando para o combate. A bordo do Argo II com os amigos Jason, Piper e Leo, ela não pode culpar os semideuses romanos por pensarem que o navio é uma arma de guerra grega: afinal, com um dragão de bronze fumegante como figura de proa, a fantástica criação de Leo não parece mesmo nada amigável. Annabeth só pode torcer para que os romanos vejam seu pretor Jason na embarcação e compreendam que os visitantes do Acampamento Meio-Sangue estão ali em missão de paz.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Os problemas de Annabeth não param por aí — ela carrega no bolso um presente da mãe, que veio acompanhado de uma ordem intimidadora: Siga a Marca de Atena. Vingue-me. A guerreira já carrega nas costas o peso da profecia que mandará sete semideuses em busca das Portas da Morte. O que mais Atena poderia querer dela?&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;O maior medo de Annabeth, no entanto, é que Percy tenha mudado. E se ele já estiver habituado demais aos costumes romanos? Será que ainda precisará dos velhos amigos? Como filha da deusa da guerra e da sabedoria, Annabeth sabe que nasceu para liderar — no entanto, também sabe que nunca mais vai querer viver sem o Cabeça de Alga.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Na aguardada sequência da série &quot;Os heróis do Olimpo&quot;, do best-seller Rick Riordan, Percy Jackson e seus amigos semideuses mais uma vez correm em direção ao perigo para tentar salvar seus acampamentos, os deuses e o mundo inteiro. Narrado por Percy, Annabeth, Piper e Jason, A Marca de Atena é uma jornada inesquecível até Roma, recheada de importantes descobertas, sacrifícios surpreendentes e terrores indescritíveis.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Riordan, Rick\r\nEditora: Intrinseca\r\nCategoria: Literatura Infanto-Juvenil / Literatura Juvenil', 'Annabeth está apavorada. Justo quando ela está prestes a reencontrar Percy — após seis meses afastados por culpa de Hera —, o Acampamento Júpiter parece estar se preparando para o combate. A bordo do Argo II com os amigos Jason, Piper e Leo, ela não pode ', 'Mitologia, Athena');
INSERT INTO `product_description` VALUES ('95', '2', 'Os Diários do Semideus - Série Os Heróis do Olimpo', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Todo jovem semideus precisa se preparar para um árduo futuro: destruir monstros aventurar-se pelo mundo e lidar com os temperamentais deuses gregos e romanos. Nesse volume recheado de relatos inéditos, retratos e entrevistas com personalidades do Olimpo, diagramas e brincadeiras criados pelo Escriba Sênior do Acampamento Meio-Sangue, Rick Riordan, Percy Jackson e seus amigos vão encarar inimigos perigosos e tarefas mortais. As lições aprendidas com essas histórias poderão salvar a vida de qualquer semideus!&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Riordan, Rick\r\nEditora: Intrinseca\r\nCategoria: Literatura Infanto-Juvenil / Literatura Juvenil', 'Todo jovem semideus precisa se preparar para um árduo futuro: destruir monstros aventurar-se pelo mundo e lidar com os temperamentais deuses gregos e romanos. Nesse volume recheado de relatos inéditos, retratos e entrevistas com personalidades do Olimpo, ', 'Mitologia, Deus, Herói');
INSERT INTO `product_description` VALUES ('96', '2', 'Anticâncer', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Médico francês ensina a prevenir a doença usando defesas naturais&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Como todo organismo vivo, o corpo humano fabrica células defeituosas permanentemente. Mas é o próprio organismo, também equipado com múltiplos mecanismos, que permite detectá-las e contê-las. Este princípio científico é a base que ajudou o médico e pesquisador David Servan-Schreiber a superar o câncer e, em seguida, escrever o livro Anticâncer, que se tornou o mais vendido no mundo sobre o assunto.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Esta segunda edição revista e atualizada traz novas informações sobre os riscos quanto ao uso do telefone celular e como evitá-los; as toxinas presentes em plásticos, produtos de higiene pessoal e materiais de limpeza; recomendações sobre a ingestão de bebidas como vinho tinto e chá verde, além das propriedades anticâncer dos alimentos, incluindo novos estudos sobre o azeite, os cogumelos, as frutas com caroço e os cogumelos. Há também informações sobre o papel da vitamina D3 no retardamento do câncer e como obter níveis adequados através da alimentação ou de suplementação. E também sobre o efeito de técnicas de relaxamento e das amizades sobre o equilíbrio entre mente e corpo.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;O autor não fala somente como pesquisador. Em 1981, quando tinha apenas 30 anos, Servan-Schreiber teve câncer no cérebro. Foi tratado pelos métodos convencionais, e depois teve uma recaída. Foi então que decidiu pesquisar, para além dos métodos habituais, tudo que podia ajudar seu corpo a se defender. Na qualidade de médico, pesquisador e diretor do Centro de Medicina integrado à Universidade de Pittsburgh, nos Estados Unidos, teve acesso a informações preciosas sobre as abordagens naturais que podem contribuir para prevenir ou tratar o câncer.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Em Anticâncer, Servan-Schreiber faz o relato de tudo o que aprendeu. Conta que, depois da dura experiência de combater a doença com uma cirurgia e várias sessões de quimioterapia, pediu ao seu oncologista conselhos sobre a vida que deveria levar para evitar uma recaída. &quot;Não há nada de especial a fazer. Viva normalmente, e se o tumor reaparecer, o detectaremos bem cedo&quot;, lhe teria respondido o especialista.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Inconformado, o autor decidiu compreender aquela doença que o afligia. Precisou de meses de pesquisa para começar a entender como poderia ajudar seu corpo a se armar contra o câncer. Participou de conferências nos Estados Unidos e na Europa, percorreu bases de dados médicos e dissecou publicações científicas. &quot;Rapidamente percebi que as informações eram parciais e dispersas, e que não adquiriam a totalidade de seu sentido senão quando reunidas&quot;, explica ele, no prefácio de seu livro.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;O que a pesquisa de Servan-Schreiber tem de inovadora é dar aos nossos próprios mecanismos de defesa o papel central na luta contra a doença. &quot;Eis o que aprendi: se todos temos células cancerosas dentro de nós, temos também um corpo preparado para frustrar o processo de formação de tumores. Compete a cada um de nós utilizá-lo&quot;, afirma o médico.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Sua pesquisa revela que na Ásia, os cânceres que afligem o Ocidente - como o câncer de mama, do cólon ou da próstata - são de sete a setenta vezes menos frequentes. Entre os homens asiáticos que morrem de outras causas que não seja a doença, contudo, encontram-se tantos microtumores pré- cancerosos na próstata quanto entre os ocidentais. Alguma coisa na maneira de viver deles impede que os tumores se desenvolvam.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Dos anos 40 para cá, o ambiente está cada vez mais carregado de produtos químicos sintéticos notoriamente cancerígenos - amianto, benzina, pesticidas, entre outros. Além disso, a alimentação também mudou: consumimos mais açúcar (de cinco quilos anuais por pessoa em 1830 para 70 quilos em 2000) e mais gordura hidrogenada, muitas vezes sem nem perceber. O ômega 6, uma das piores gorduras que há, está presente nas rações servidas ao gado leiteiro e de corte e às aves de granja em quase todos os países do mundo. Pesquisas revelaram que em 2000, os ovos continham vinte vezes mais ômega 6 que em 1970.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Sem jamais duvidar do poder da medicina tradicional - que lhe salvou a vida - e depois de ter testado em si mesmo tratamentos experimentais recém- saídos das pesquisas de ponta, Servan-Schreiber explica que nós podemos estimular nossas defesas naturais contra esse mal, que &quot;é mais uma questão de estilo de vida que de genes&quot;.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Neste sentido, Anticâncer apresenta uma nova visão dos mecanismos do câncer, fundada no papel essencial do sistema imunológico, na descoberta de mecanismos inflamatórios que facilitam o crescimento de tumores e na possibilidade de bloquear seu desenvolvimento, impedindo sua realimentação através de novos vasos sangüíneos.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;No entanto, apesar de se basear em cuidadosa pesquisa, o livro Anticâncer não é um manual de biologia. Mesclando com equilíbrio passagens puramente científicas com relatos emocionantes de sua vida pessoal, Servan-Schreiber não esconde que o confronto com esta doença é uma aventura interior. Seu livro inclui reflexões sobre o nascimento do seu único filho e o fim do casamento com a mãe dele, em meio à turbulência do primeiro diagnóstico de câncer; lembranças da relação com a família e com o trabalho; prazeres, sucessos e frustrações. Todas essas emoções, para ele, tiveram influência direta nas mudanças que fizeram da sua vida o que ela é hoje. &quot;São alegrias e sofrimentos, descobertas e fracassos, que hoje fazem de mim um homem consideravelmente mais cheio de vida do que há 15 anos&quot;, conclui.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Servan-schreiber, David\r\nEditora: Objetiva\r\nCategoria: Medicina / Medicina', 'Médico francês ensina a prevenir a doença usando defesas naturais Como todo organismo vivo, o corpo humano fabrica células defeituosas permanentemente. Mas é o próprio organismo, também equipado com múltiplos mecanismos, que permite detectá-las e contê-la', 'Câncer, Tratamento');
INSERT INTO `product_description` VALUES ('97', '2', 'Emergências Clínicas - Abordagem Prática - 8ª Ed. 2013', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Oitava edição deste livro de grande sucesso, adotado como referência em inúmeras faculdades de Medicina e hospitais de todo o Brasil. Traz 85 capítulos, todos revisados e atualizados de acordo com os mais recentes guidelines e estudos, divididos em cinco grandes seções e estruturados de modo a facilitar a busca rápida e direta das informações. Seis novos capítulos são a grande novidade desta edição: “Intubação de sequência rápida e técnicas alternativas”, “Náuseas e vômitos”, “Trombose venosa profunda”, “Síndrome de lise tumoral”, “Síndrome da veia cava superior” e “Compressão medular aguda neoplásica”. O livro possui ainda um miniatlas com mais de 100 imagens coloridas e anexos com classificações de medicamentos, posologias, reações adversas e outras informações essenciais para a consulta rápida no dia a dia do serviço de emergência, além de um site com conteúdo exclusivo produzido pelos próprios autores, com questões de autoavaliação, imagens adicionais em emergências, casos clínicos comentados e todas as figuras, tabelas e quadros do livro para utilização em sala de aula.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Brandão Neto, Rodrigo Antônio; Martins, Herlon Saraiva; Neto, Augusto Scalabrini; Velasco, Irineu Tadeu\r\nEditora: Manole\r\nCategoria: Medicina / Medicina', 'Oitava edição deste livro de grande sucesso, adotado como referência em inúmeras faculdades de Medicina e hospitais de todo o Brasil. Traz 85 capítulos, todos revisados e atualizados de acordo com os mais recentes guidelines e estudos, divididos em cinco ', 'Emergências, Clínica');
INSERT INTO `product_description` VALUES ('98', '2', 'Casagrande e Seus Demônios', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Ricamente ilustrado, com um caderno recheado de fotos, a publicação tem prefácio de Marcelo Rubens Paiva, amigo de sempre, que endossa a hipótese de que tantas coisas boas, e outras tantas ruins, que permearam a vida do ex-jogador dariam um bom roteiro para um livro. “Casão faz questão de contar o inferno que viveu quando era viciado em drogas e sua internação, pois para ele é fundamental passar adiante a experiência, dividir as dores da dependência e alertar para os perigos de um vício frenético, sem preconceitos, desvios ou mentiras. A verdade ajuda a sanidade”.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Ribeiro, Gilvan; Casagrande Júnior, Walter\r\nEditora: Globo Editora\r\nCategoria: Literatura Nacional / Biografias e Memórias', 'Ricamente ilustrado, com um caderno recheado de fotos, a publicação tem prefácio de Marcelo Rubens Paiva, amigo de sempre, que endossa a hipótese de que tantas coisas boas, e outras tantas ruins, que permearam a vida do ex-jogador dariam um bom roteiro pa', 'Casagrande,Demonios');
INSERT INTO `product_description` VALUES ('99', '2', 'Filhos do Éden - Anjos da Morte - Livro 2', '&lt;p&gt;&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Desde eras longínquas, os malakins, anjos virtuosos e sábios, observam e estudam o progresso do homem. Mas eis que chega o século XX, e com ele a acelerada degradação do planeta. Os novos meios de transporte, os barcos a vapor e as estradas de ferro levaram a civilização aos cantos mais distantes do globo, afastando os mortais da natureza divina, alargando as fronteiras entre o nosso mundo e as sete camadas do céu.&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Isolados no paraíso, os malakins solicitaram então a ajuda dos “exilados”, anjos pacíficos que há anos atuavam na terra. Sua tarefa, a partir de agora, seria participar das guerras humanas, de todas as guerras, para anotar as façanhas militares, o comportamento das tropas, e depois relatá-las aos seus superiores celestes. Disfarçado de soldados comuns, esse grupo esteve presente desde as trincheiras do Somme às praias da Normandia, das selvas da Indochina ao declínio da União Soviética. Embora muitos não desejassem matar, foi isso o que lhes foi ordenado, e o que infelizmente acabaram fazendo.&lt;/span&gt;&lt;br style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(129, 129, 129); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15px;&quot;&gt;Carregado de batalhas épicas, magia negra e personagens fantásticos, &quot;Filhos do Éden: Anjos da Morte&quot; é também um inquietante relato sobre o nosso tempo, uma crítica à corrupção dos governos, aos massacres e extremismos, um alerta para o que nos tornamos e para o que ainda podemos nos tornar.&lt;/span&gt;&lt;/p&gt;\r\n', 'Autor: Spohr, Eduardo\r\nEditora: Verus\r\nCategoria: Literatura Nacional / Romance', 'Desde eras longínquas, os malakins, anjos virtuosos e sábios, observam e estudam o progresso do homem. Mas eis que chega o século XX, e com ele a acelerada degradação do planeta. Os novos meios de transporte, os barcos a vapor e as estradas de ferro levar', 'Éden, Anjos');

-- ----------------------------
-- Table structure for `product_discount`
-- ----------------------------
DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_discount
-- ----------------------------
INSERT INTO `product_discount` VALUES ('446', '50', '1', '100', '1', '29.0000', '0000-00-00', '0000-00-00');
INSERT INTO `product_discount` VALUES ('449', '51', '1', '200', '1', '80.0000', '2013-06-05', '2014-01-03');

-- ----------------------------
-- Table structure for `product_filter`
-- ----------------------------
DROP TABLE IF EXISTS `product_filter`;
CREATE TABLE `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_filter
-- ----------------------------

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2353 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------

-- ----------------------------
-- Table structure for `product_option`
-- ----------------------------
DROP TABLE IF EXISTS `product_option`;
CREATE TABLE `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_option
-- ----------------------------

-- ----------------------------
-- Table structure for `product_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `product_option_value`;
CREATE TABLE `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for `product_related`
-- ----------------------------
DROP TABLE IF EXISTS `product_related`;
CREATE TABLE `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_related
-- ----------------------------

-- ----------------------------
-- Table structure for `product_reward`
-- ----------------------------
DROP TABLE IF EXISTS `product_reward`;
CREATE TABLE `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=644 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_reward
-- ----------------------------
INSERT INTO `product_reward` VALUES ('561', '50', '1', '0');
INSERT INTO `product_reward` VALUES ('592', '51', '1', '0');
INSERT INTO `product_reward` VALUES ('568', '55', '1', '0');
INSERT INTO `product_reward` VALUES ('566', '54', '1', '0');
INSERT INTO `product_reward` VALUES ('569', '56', '1', '0');
INSERT INTO `product_reward` VALUES ('570', '57', '1', '0');
INSERT INTO `product_reward` VALUES ('571', '58', '1', '0');
INSERT INTO `product_reward` VALUES ('572', '59', '1', '0');
INSERT INTO `product_reward` VALUES ('574', '60', '1', '0');
INSERT INTO `product_reward` VALUES ('575', '61', '1', '0');
INSERT INTO `product_reward` VALUES ('576', '62', '1', '0');
INSERT INTO `product_reward` VALUES ('591', '63', '1', '0');
INSERT INTO `product_reward` VALUES ('579', '64', '1', '0');
INSERT INTO `product_reward` VALUES ('580', '65', '1', '0');
INSERT INTO `product_reward` VALUES ('581', '66', '1', '0');
INSERT INTO `product_reward` VALUES ('582', '67', '1', '0');
INSERT INTO `product_reward` VALUES ('588', '68', '1', '0');
INSERT INTO `product_reward` VALUES ('594', '69', '1', '0');
INSERT INTO `product_reward` VALUES ('587', '70', '1', '0');
INSERT INTO `product_reward` VALUES ('589', '71', '1', '0');
INSERT INTO `product_reward` VALUES ('595', '72', '1', '0');
INSERT INTO `product_reward` VALUES ('596', '73', '1', '0');
INSERT INTO `product_reward` VALUES ('597', '74', '1', '0');
INSERT INTO `product_reward` VALUES ('598', '75', '1', '0');
INSERT INTO `product_reward` VALUES ('599', '76', '1', '0');
INSERT INTO `product_reward` VALUES ('627', '86', '1', '0');
INSERT INTO `product_reward` VALUES ('628', '87', '1', '0');
INSERT INTO `product_reward` VALUES ('605', '79', '1', '0');
INSERT INTO `product_reward` VALUES ('611', '80', '1', '0');
INSERT INTO `product_reward` VALUES ('622', '81', '1', '0');
INSERT INTO `product_reward` VALUES ('634', '92', '1', '0');
INSERT INTO `product_reward` VALUES ('631', '89', '1', '0');
INSERT INTO `product_reward` VALUES ('624', '84', '1', '0');
INSERT INTO `product_reward` VALUES ('625', '85', '1', '0');
INSERT INTO `product_reward` VALUES ('630', '88', '1', '0');
INSERT INTO `product_reward` VALUES ('635', '90', '1', '0');
INSERT INTO `product_reward` VALUES ('633', '91', '1', '0');
INSERT INTO `product_reward` VALUES ('636', '93', '1', '0');
INSERT INTO `product_reward` VALUES ('638', '94', '1', '0');
INSERT INTO `product_reward` VALUES ('639', '95', '1', '0');
INSERT INTO `product_reward` VALUES ('640', '96', '1', '0');
INSERT INTO `product_reward` VALUES ('641', '97', '1', '0');
INSERT INTO `product_reward` VALUES ('642', '98', '1', '0');
INSERT INTO `product_reward` VALUES ('643', '99', '1', '0');

-- ----------------------------
-- Table structure for `product_special`
-- ----------------------------
DROP TABLE IF EXISTS `product_special`;
CREATE TABLE `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=442 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_special
-- ----------------------------
INSERT INTO `product_special` VALUES ('441', '51', '1', '1', '80.0000', '2013-06-04', '2014-02-06');

-- ----------------------------
-- Table structure for `product_to_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_category`;
CREATE TABLE `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_to_category
-- ----------------------------
INSERT INTO `product_to_category` VALUES ('50', '59');
INSERT INTO `product_to_category` VALUES ('50', '84');
INSERT INTO `product_to_category` VALUES ('50', '85');
INSERT INTO `product_to_category` VALUES ('51', '59');
INSERT INTO `product_to_category` VALUES ('51', '61');
INSERT INTO `product_to_category` VALUES ('51', '75');
INSERT INTO `product_to_category` VALUES ('54', '59');
INSERT INTO `product_to_category` VALUES ('54', '61');
INSERT INTO `product_to_category` VALUES ('55', '59');
INSERT INTO `product_to_category` VALUES ('55', '61');
INSERT INTO `product_to_category` VALUES ('55', '65');
INSERT INTO `product_to_category` VALUES ('56', '59');
INSERT INTO `product_to_category` VALUES ('56', '62');
INSERT INTO `product_to_category` VALUES ('57', '59');
INSERT INTO `product_to_category` VALUES ('57', '62');
INSERT INTO `product_to_category` VALUES ('58', '59');
INSERT INTO `product_to_category` VALUES ('58', '62');
INSERT INTO `product_to_category` VALUES ('59', '59');
INSERT INTO `product_to_category` VALUES ('59', '63');
INSERT INTO `product_to_category` VALUES ('59', '65');
INSERT INTO `product_to_category` VALUES ('60', '59');
INSERT INTO `product_to_category` VALUES ('60', '64');
INSERT INTO `product_to_category` VALUES ('60', '65');
INSERT INTO `product_to_category` VALUES ('61', '59');
INSERT INTO `product_to_category` VALUES ('61', '64');
INSERT INTO `product_to_category` VALUES ('61', '73');
INSERT INTO `product_to_category` VALUES ('62', '59');
INSERT INTO `product_to_category` VALUES ('62', '66');
INSERT INTO `product_to_category` VALUES ('63', '59');
INSERT INTO `product_to_category` VALUES ('63', '66');
INSERT INTO `product_to_category` VALUES ('64', '59');
INSERT INTO `product_to_category` VALUES ('64', '67');
INSERT INTO `product_to_category` VALUES ('65', '59');
INSERT INTO `product_to_category` VALUES ('65', '67');
INSERT INTO `product_to_category` VALUES ('65', '76');
INSERT INTO `product_to_category` VALUES ('66', '59');
INSERT INTO `product_to_category` VALUES ('66', '68');
INSERT INTO `product_to_category` VALUES ('66', '74');
INSERT INTO `product_to_category` VALUES ('66', '81');
INSERT INTO `product_to_category` VALUES ('67', '59');
INSERT INTO `product_to_category` VALUES ('67', '68');
INSERT INTO `product_to_category` VALUES ('67', '72');
INSERT INTO `product_to_category` VALUES ('67', '74');
INSERT INTO `product_to_category` VALUES ('68', '59');
INSERT INTO `product_to_category` VALUES ('68', '84');
INSERT INTO `product_to_category` VALUES ('69', '59');
INSERT INTO `product_to_category` VALUES ('69', '70');
INSERT INTO `product_to_category` VALUES ('70', '59');
INSERT INTO `product_to_category` VALUES ('70', '69');
INSERT INTO `product_to_category` VALUES ('71', '59');
INSERT INTO `product_to_category` VALUES ('71', '71');
INSERT INTO `product_to_category` VALUES ('72', '59');
INSERT INTO `product_to_category` VALUES ('72', '77');
INSERT INTO `product_to_category` VALUES ('73', '59');
INSERT INTO `product_to_category` VALUES ('73', '84');
INSERT INTO `product_to_category` VALUES ('73', '88');
INSERT INTO `product_to_category` VALUES ('74', '59');
INSERT INTO `product_to_category` VALUES ('74', '79');
INSERT INTO `product_to_category` VALUES ('74', '84');
INSERT INTO `product_to_category` VALUES ('75', '59');
INSERT INTO `product_to_category` VALUES ('75', '88');
INSERT INTO `product_to_category` VALUES ('76', '59');
INSERT INTO `product_to_category` VALUES ('76', '78');
INSERT INTO `product_to_category` VALUES ('79', '59');
INSERT INTO `product_to_category` VALUES ('79', '82');
INSERT INTO `product_to_category` VALUES ('80', '59');
INSERT INTO `product_to_category` VALUES ('80', '80');
INSERT INTO `product_to_category` VALUES ('81', '59');
INSERT INTO `product_to_category` VALUES ('81', '80');
INSERT INTO `product_to_category` VALUES ('84', '59');
INSERT INTO `product_to_category` VALUES ('84', '91');
INSERT INTO `product_to_category` VALUES ('85', '59');
INSERT INTO `product_to_category` VALUES ('85', '80');
INSERT INTO `product_to_category` VALUES ('86', '59');
INSERT INTO `product_to_category` VALUES ('86', '91');
INSERT INTO `product_to_category` VALUES ('87', '59');
INSERT INTO `product_to_category` VALUES ('87', '89');
INSERT INTO `product_to_category` VALUES ('88', '59');
INSERT INTO `product_to_category` VALUES ('88', '90');
INSERT INTO `product_to_category` VALUES ('89', '59');
INSERT INTO `product_to_category` VALUES ('89', '90');
INSERT INTO `product_to_category` VALUES ('90', '59');
INSERT INTO `product_to_category` VALUES ('90', '83');
INSERT INTO `product_to_category` VALUES ('91', '59');
INSERT INTO `product_to_category` VALUES ('91', '89');
INSERT INTO `product_to_category` VALUES ('92', '59');
INSERT INTO `product_to_category` VALUES ('92', '82');
INSERT INTO `product_to_category` VALUES ('93', '59');
INSERT INTO `product_to_category` VALUES ('93', '83');
INSERT INTO `product_to_category` VALUES ('94', '59');
INSERT INTO `product_to_category` VALUES ('94', '85');
INSERT INTO `product_to_category` VALUES ('95', '59');
INSERT INTO `product_to_category` VALUES ('95', '85');
INSERT INTO `product_to_category` VALUES ('96', '59');
INSERT INTO `product_to_category` VALUES ('96', '87');
INSERT INTO `product_to_category` VALUES ('97', '59');
INSERT INTO `product_to_category` VALUES ('97', '87');
INSERT INTO `product_to_category` VALUES ('98', '59');
INSERT INTO `product_to_category` VALUES ('98', '86');
INSERT INTO `product_to_category` VALUES ('99', '59');
INSERT INTO `product_to_category` VALUES ('99', '86');

-- ----------------------------
-- Table structure for `product_to_download`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_download`;
CREATE TABLE `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_to_download
-- ----------------------------

-- ----------------------------
-- Table structure for `product_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_layout`;
CREATE TABLE `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_to_layout
-- ----------------------------

-- ----------------------------
-- Table structure for `product_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_store`;
CREATE TABLE `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_to_store
-- ----------------------------
INSERT INTO `product_to_store` VALUES ('50', '0');
INSERT INTO `product_to_store` VALUES ('51', '0');
INSERT INTO `product_to_store` VALUES ('54', '0');
INSERT INTO `product_to_store` VALUES ('55', '0');
INSERT INTO `product_to_store` VALUES ('56', '0');
INSERT INTO `product_to_store` VALUES ('57', '0');
INSERT INTO `product_to_store` VALUES ('58', '0');
INSERT INTO `product_to_store` VALUES ('59', '0');
INSERT INTO `product_to_store` VALUES ('60', '0');
INSERT INTO `product_to_store` VALUES ('61', '0');
INSERT INTO `product_to_store` VALUES ('62', '0');
INSERT INTO `product_to_store` VALUES ('63', '0');
INSERT INTO `product_to_store` VALUES ('64', '0');
INSERT INTO `product_to_store` VALUES ('65', '0');
INSERT INTO `product_to_store` VALUES ('66', '0');
INSERT INTO `product_to_store` VALUES ('67', '0');
INSERT INTO `product_to_store` VALUES ('68', '0');
INSERT INTO `product_to_store` VALUES ('69', '0');
INSERT INTO `product_to_store` VALUES ('70', '0');
INSERT INTO `product_to_store` VALUES ('71', '0');
INSERT INTO `product_to_store` VALUES ('72', '0');
INSERT INTO `product_to_store` VALUES ('73', '0');
INSERT INTO `product_to_store` VALUES ('74', '0');
INSERT INTO `product_to_store` VALUES ('75', '0');
INSERT INTO `product_to_store` VALUES ('76', '0');
INSERT INTO `product_to_store` VALUES ('84', '0');
INSERT INTO `product_to_store` VALUES ('85', '0');
INSERT INTO `product_to_store` VALUES ('86', '0');
INSERT INTO `product_to_store` VALUES ('87', '0');
INSERT INTO `product_to_store` VALUES ('88', '0');
INSERT INTO `product_to_store` VALUES ('89', '0');
INSERT INTO `product_to_store` VALUES ('90', '0');
INSERT INTO `product_to_store` VALUES ('91', '0');
INSERT INTO `product_to_store` VALUES ('92', '0');
INSERT INTO `product_to_store` VALUES ('93', '0');
INSERT INTO `product_to_store` VALUES ('94', '0');
INSERT INTO `product_to_store` VALUES ('95', '0');
INSERT INTO `product_to_store` VALUES ('96', '0');
INSERT INTO `product_to_store` VALUES ('97', '0');
INSERT INTO `product_to_store` VALUES ('98', '0');
INSERT INTO `product_to_store` VALUES ('99', '0');

-- ----------------------------
-- Table structure for `return`
-- ----------------------------
DROP TABLE IF EXISTS `return`;
CREATE TABLE `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return
-- ----------------------------

-- ----------------------------
-- Table structure for `return_action`
-- ----------------------------
DROP TABLE IF EXISTS `return_action`;
CREATE TABLE `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return_action
-- ----------------------------
INSERT INTO `return_action` VALUES ('1', '2', 'Reembolsado');
INSERT INTO `return_action` VALUES ('2', '2', 'Crédito Emitido');
INSERT INTO `return_action` VALUES ('3', '2', 'Envio de Substituição');

-- ----------------------------
-- Table structure for `return_history`
-- ----------------------------
DROP TABLE IF EXISTS `return_history`;
CREATE TABLE `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return_history
-- ----------------------------

-- ----------------------------
-- Table structure for `return_reason`
-- ----------------------------
DROP TABLE IF EXISTS `return_reason`;
CREATE TABLE `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return_reason
-- ----------------------------
INSERT INTO `return_reason` VALUES ('1', '2', 'Chegou com defeito');
INSERT INTO `return_reason` VALUES ('2', '2', 'Recebido item errado');
INSERT INTO `return_reason` VALUES ('3', '2', 'Erro no pedido');
INSERT INTO `return_reason` VALUES ('4', '2', 'Defeito, forneça detalhes');
INSERT INTO `return_reason` VALUES ('5', '2', 'Outros, forneça detalhes');

-- ----------------------------
-- Table structure for `return_status`
-- ----------------------------
DROP TABLE IF EXISTS `return_status`;
CREATE TABLE `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return_status
-- ----------------------------
INSERT INTO `return_status` VALUES ('1', '2', 'Pendente');
INSERT INTO `return_status` VALUES ('3', '2', 'Completo');
INSERT INTO `return_status` VALUES ('2', '2', 'Aguardando Produtos');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=588 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('1', '0', 'shipping', 'shipping_sort_order', '3', '0');
INSERT INTO `setting` VALUES ('2', '0', 'sub_total', 'sub_total_sort_order', '1', '0');
INSERT INTO `setting` VALUES ('3', '0', 'sub_total', 'sub_total_status', '1', '0');
INSERT INTO `setting` VALUES ('4', '0', 'tax', 'tax_status', '1', '0');
INSERT INTO `setting` VALUES ('5', '0', 'total', 'total_sort_order', '9', '0');
INSERT INTO `setting` VALUES ('6', '0', 'total', 'total_status', '1', '0');
INSERT INTO `setting` VALUES ('7', '0', 'tax', 'tax_sort_order', '5', '0');
INSERT INTO `setting` VALUES ('8', '0', 'free_checkout', 'free_checkout_sort_order', '1', '0');
INSERT INTO `setting` VALUES ('9', '0', 'cod', 'cod_sort_order', '5', '0');
INSERT INTO `setting` VALUES ('10', '0', 'cod', 'cod_total', '0.01', '0');
INSERT INTO `setting` VALUES ('11', '0', 'cod', 'cod_order_status_id', '1', '0');
INSERT INTO `setting` VALUES ('12', '0', 'cod', 'cod_geo_zone_id', '0', '0');
INSERT INTO `setting` VALUES ('13', '0', 'cod', 'cod_status', '1', '0');
INSERT INTO `setting` VALUES ('14', '0', 'shipping', 'shipping_status', '1', '0');
INSERT INTO `setting` VALUES ('15', '0', 'shipping', 'shipping_estimator', '1', '0');
INSERT INTO `setting` VALUES ('27', '0', 'coupon', 'coupon_sort_order', '4', '0');
INSERT INTO `setting` VALUES ('28', '0', 'coupon', 'coupon_status', '1', '0');
INSERT INTO `setting` VALUES ('34', '0', 'flat', 'flat_sort_order', '1', '0');
INSERT INTO `setting` VALUES ('35', '0', 'flat', 'flat_status', '1', '0');
INSERT INTO `setting` VALUES ('36', '0', 'flat', 'flat_geo_zone_id', '0', '0');
INSERT INTO `setting` VALUES ('37', '0', 'flat', 'flat_tax_class_id', '9', '0');
INSERT INTO `setting` VALUES ('38', '0', 'carousel', 'carousel_module', 'a:1:{i:0;a:10:{s:9:\"banner_id\";s:1:\"8\";s:5:\"limit\";s:1:\"5\";s:6:\"scroll\";s:1:\"3\";s:5:\"width\";s:2:\"80\";s:6:\"height\";s:2:\"80\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:2:\"-1\";}}', '1');
INSERT INTO `setting` VALUES ('587', '0', 'featured', 'featured_module', 'a:1:{i:0;a:7:{s:5:\"limit\";s:2:\"12\";s:11:\"image_width\";s:2:\"80\";s:12:\"image_height\";s:2:\"80\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}}', '1');
INSERT INTO `setting` VALUES ('41', '0', 'flat', 'flat_cost', '5.00', '0');
INSERT INTO `setting` VALUES ('42', '0', 'credit', 'credit_sort_order', '7', '0');
INSERT INTO `setting` VALUES ('43', '0', 'credit', 'credit_status', '1', '0');
INSERT INTO `setting` VALUES ('53', '0', 'reward', 'reward_sort_order', '2', '0');
INSERT INTO `setting` VALUES ('54', '0', 'reward', 'reward_status', '1', '0');
INSERT INTO `setting` VALUES ('56', '0', 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:2:\"10\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `setting` VALUES ('57', '0', 'category', 'category_module', 'a:2:{i:0;a:5:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:5:\"count\";s:1:\"0\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:5:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:5:\"count\";s:1:\"0\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `setting` VALUES ('60', '0', 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:1:\"6\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `setting` VALUES ('548', '0', 'config', 'config_google_analytics', '', '0');
INSERT INTO `setting` VALUES ('547', '0', 'config', 'config_error_filename', 'error.txt', '0');
INSERT INTO `setting` VALUES ('546', '0', 'config', 'config_error_log', '1', '0');
INSERT INTO `setting` VALUES ('545', '0', 'config', 'config_error_display', '1', '0');
INSERT INTO `setting` VALUES ('544', '0', 'config', 'config_compression', '0', '0');
INSERT INTO `setting` VALUES ('543', '0', 'config', 'config_encryption', '0228d4c6e10f8f6a47c8b72e3a5158c4', '0');
INSERT INTO `setting` VALUES ('542', '0', 'config', 'config_password', '1', '0');
INSERT INTO `setting` VALUES ('538', '0', 'config', 'config_seo_url', '0', '0');
INSERT INTO `setting` VALUES ('539', '0', 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', '0');
INSERT INTO `setting` VALUES ('540', '0', 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', '0');
INSERT INTO `setting` VALUES ('541', '0', 'config', 'config_maintenance', '0', '0');
INSERT INTO `setting` VALUES ('94', '0', 'voucher', 'voucher_sort_order', '8', '0');
INSERT INTO `setting` VALUES ('95', '0', 'voucher', 'voucher_status', '1', '0');
INSERT INTO `setting` VALUES ('103', '0', 'free_checkout', 'free_checkout_status', '1', '0');
INSERT INTO `setting` VALUES ('104', '0', 'free_checkout', 'free_checkout_order_status_id', '1', '0');
INSERT INTO `setting` VALUES ('445', '0', 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:\"banner_id\";s:1:\"7\";s:5:\"width\";s:3:\"980\";s:6:\"height\";s:3:\"280\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `setting` VALUES ('109', '0', 'banner', 'banner_module', 'a:1:{i:0;a:8:{s:9:\"banner_id\";s:1:\"6\";s:5:\"width\";s:3:\"182\";s:6:\"height\";s:3:\"182\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}', '1');
INSERT INTO `setting` VALUES ('529', '0', 'config', 'config_account_mail', '0', '0');
INSERT INTO `setting` VALUES ('530', '0', 'config', 'config_alert_emails', '', '0');
INSERT INTO `setting` VALUES ('531', '0', 'config', 'config_fraud_detection', '0', '0');
INSERT INTO `setting` VALUES ('532', '0', 'config', 'config_fraud_key', '', '0');
INSERT INTO `setting` VALUES ('533', '0', 'config', 'config_fraud_score', '', '0');
INSERT INTO `setting` VALUES ('534', '0', 'config', 'config_fraud_status_id', '7', '0');
INSERT INTO `setting` VALUES ('535', '0', 'config', 'config_secure', '0', '0');
INSERT INTO `setting` VALUES ('536', '0', 'config', 'config_shared', '0', '0');
INSERT INTO `setting` VALUES ('537', '0', 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', '0');
INSERT INTO `setting` VALUES ('528', '0', 'config', 'config_alert_mail', '0', '0');
INSERT INTO `setting` VALUES ('527', '0', 'config', 'config_smtp_timeout', '5', '0');
INSERT INTO `setting` VALUES ('526', '0', 'config', 'config_smtp_port', '25', '0');
INSERT INTO `setting` VALUES ('525', '0', 'config', 'config_smtp_password', '', '0');
INSERT INTO `setting` VALUES ('524', '0', 'config', 'config_smtp_username', '', '0');
INSERT INTO `setting` VALUES ('523', '0', 'config', 'config_smtp_host', '', '0');
INSERT INTO `setting` VALUES ('522', '0', 'config', 'config_mail_parameter', '', '0');
INSERT INTO `setting` VALUES ('521', '0', 'config', 'config_mail_protocol', 'mail', '0');
INSERT INTO `setting` VALUES ('520', '0', 'config', 'config_ftp_status', '0', '0');
INSERT INTO `setting` VALUES ('519', '0', 'config', 'config_ftp_root', '', '0');
INSERT INTO `setting` VALUES ('518', '0', 'config', 'config_ftp_password', '', '0');
INSERT INTO `setting` VALUES ('517', '0', 'config', 'config_ftp_username', '', '0');
INSERT INTO `setting` VALUES ('516', '0', 'config', 'config_ftp_port', '21', '0');
INSERT INTO `setting` VALUES ('515', '0', 'config', 'config_ftp_host', '127.0.0.1', '0');
INSERT INTO `setting` VALUES ('514', '0', 'config', 'config_image_cart_height', '47', '0');
INSERT INTO `setting` VALUES ('513', '0', 'config', 'config_image_cart_width', '47', '0');
INSERT INTO `setting` VALUES ('512', '0', 'config', 'config_image_wishlist_height', '47', '0');
INSERT INTO `setting` VALUES ('511', '0', 'config', 'config_image_wishlist_width', '47', '0');
INSERT INTO `setting` VALUES ('510', '0', 'config', 'config_image_compare_height', '90', '0');
INSERT INTO `setting` VALUES ('509', '0', 'config', 'config_image_compare_width', '90', '0');
INSERT INTO `setting` VALUES ('508', '0', 'config', 'config_image_related_height', '80', '0');
INSERT INTO `setting` VALUES ('507', '0', 'config', 'config_image_related_width', '80', '0');
INSERT INTO `setting` VALUES ('506', '0', 'config', 'config_image_additional_height', '74', '0');
INSERT INTO `setting` VALUES ('505', '0', 'config', 'config_image_additional_width', '74', '0');
INSERT INTO `setting` VALUES ('504', '0', 'config', 'config_image_product_height', '80', '0');
INSERT INTO `setting` VALUES ('503', '0', 'config', 'config_image_product_width', '80', '0');
INSERT INTO `setting` VALUES ('502', '0', 'config', 'config_image_popup_height', '500', '0');
INSERT INTO `setting` VALUES ('501', '0', 'config', 'config_image_popup_width', '500', '0');
INSERT INTO `setting` VALUES ('500', '0', 'config', 'config_image_thumb_height', '228', '0');
INSERT INTO `setting` VALUES ('499', '0', 'config', 'config_image_thumb_width', '228', '0');
INSERT INTO `setting` VALUES ('498', '0', 'config', 'config_image_category_height', '80', '0');
INSERT INTO `setting` VALUES ('497', '0', 'config', 'config_image_category_width', '80', '0');
INSERT INTO `setting` VALUES ('496', '0', 'config', 'config_icon', 'data/cart.png', '0');
INSERT INTO `setting` VALUES ('495', '0', 'config', 'config_logo', 'data/logo.png', '0');
INSERT INTO `setting` VALUES ('494', '0', 'config', 'config_return_status_id', '2', '0');
INSERT INTO `setting` VALUES ('493', '0', 'config', 'config_return_id', '0', '0');
INSERT INTO `setting` VALUES ('492', '0', 'config', 'config_commission', '5', '0');
INSERT INTO `setting` VALUES ('491', '0', 'config', 'config_affiliate_id', '4', '0');
INSERT INTO `setting` VALUES ('490', '0', 'config', 'config_stock_status_id', '5', '0');
INSERT INTO `setting` VALUES ('489', '0', 'config', 'config_stock_checkout', '0', '0');
INSERT INTO `setting` VALUES ('488', '0', 'config', 'config_stock_warning', '0', '0');
INSERT INTO `setting` VALUES ('486', '0', 'config', 'config_complete_status_id', '5', '0');
INSERT INTO `setting` VALUES ('487', '0', 'config', 'config_stock_display', '0', '0');
INSERT INTO `setting` VALUES ('485', '0', 'config', 'config_order_status_id', '1', '0');
INSERT INTO `setting` VALUES ('484', '0', 'config', 'config_invoice_prefix', 'INV-2013-00', '0');
INSERT INTO `setting` VALUES ('483', '0', 'config', 'config_order_edit', '100', '0');
INSERT INTO `setting` VALUES ('482', '0', 'config', 'config_checkout_id', '5', '0');
INSERT INTO `setting` VALUES ('481', '0', 'config', 'config_guest_checkout', '1', '0');
INSERT INTO `setting` VALUES ('480', '0', 'config', 'config_cart_weight', '1', '0');
INSERT INTO `setting` VALUES ('478', '0', 'config', 'config_customer_price', '0', '0');
INSERT INTO `setting` VALUES ('479', '0', 'config', 'config_account_id', '3', '0');
INSERT INTO `setting` VALUES ('477', '0', 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:\"1\";}', '1');
INSERT INTO `setting` VALUES ('476', '0', 'config', 'config_customer_group_id', '1', '0');
INSERT INTO `setting` VALUES ('475', '0', 'config', 'config_customer_online', '0', '0');
INSERT INTO `setting` VALUES ('474', '0', 'config', 'config_tax_customer', 'shipping', '0');
INSERT INTO `setting` VALUES ('473', '0', 'config', 'config_tax_default', 'shipping', '0');
INSERT INTO `setting` VALUES ('472', '0', 'config', 'config_vat', '0', '0');
INSERT INTO `setting` VALUES ('471', '0', 'config', 'config_tax', '1', '0');
INSERT INTO `setting` VALUES ('470', '0', 'config', 'config_voucher_max', '1000', '0');
INSERT INTO `setting` VALUES ('469', '0', 'config', 'config_voucher_min', '1', '0');
INSERT INTO `setting` VALUES ('468', '0', 'config', 'config_download', '1', '0');
INSERT INTO `setting` VALUES ('467', '0', 'config', 'config_review_status', '1', '0');
INSERT INTO `setting` VALUES ('466', '0', 'config', 'config_product_count', '1', '0');
INSERT INTO `setting` VALUES ('465', '0', 'config', 'config_admin_limit', '20', '0');
INSERT INTO `setting` VALUES ('464', '0', 'config', 'config_catalog_limit', '15', '0');
INSERT INTO `setting` VALUES ('463', '0', 'config', 'config_weight_class_id', '1', '0');
INSERT INTO `setting` VALUES ('462', '0', 'config', 'config_length_class_id', '1', '0');
INSERT INTO `setting` VALUES ('461', '0', 'config', 'config_currency_auto', '1', '0');
INSERT INTO `setting` VALUES ('460', '0', 'config', 'config_currency', 'BRL', '0');
INSERT INTO `setting` VALUES ('459', '0', 'config', 'config_admin_language', 'pt-br', '0');
INSERT INTO `setting` VALUES ('458', '0', 'config', 'config_language', 'pt-br', '0');
INSERT INTO `setting` VALUES ('457', '0', 'config', 'config_zone_id', '464', '0');
INSERT INTO `setting` VALUES ('456', '0', 'config', 'config_country_id', '30', '0');
INSERT INTO `setting` VALUES ('455', '0', 'config', 'config_layout_id', '4', '0');
INSERT INTO `setting` VALUES ('453', '0', 'config', 'config_meta_description', 'Descrição', '0');
INSERT INTO `setting` VALUES ('452', '0', 'config', 'config_title', 'Saraiva', '0');
INSERT INTO `setting` VALUES ('454', '0', 'config', 'config_template', 'default', '0');
INSERT INTO `setting` VALUES ('450', '0', 'config', 'config_telephone', '123456789', '0');
INSERT INTO `setting` VALUES ('451', '0', 'config', 'config_fax', '', '0');
INSERT INTO `setting` VALUES ('449', '0', 'config', 'config_email', 'arthur_pessoa@outlook.com', '0');
INSERT INTO `setting` VALUES ('448', '0', 'config', 'config_address', 'Endereço', '0');
INSERT INTO `setting` VALUES ('446', '0', 'config', 'config_name', 'Saraiva', '0');
INSERT INTO `setting` VALUES ('447', '0', 'config', 'config_owner', 'Grupo ES2', '0');
INSERT INTO `setting` VALUES ('585', '0', 'featured', 'product', 'O Un', '0');
INSERT INTO `setting` VALUES ('586', '0', 'featured', 'featured_product', '50,51,54,56,60,55,58,59,63,65,62,64', '0');

-- ----------------------------
-- Table structure for `stock_status`
-- ----------------------------
DROP TABLE IF EXISTS `stock_status`;
CREATE TABLE `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_status
-- ----------------------------
INSERT INTO `stock_status` VALUES ('7', '2', 'Em Estoque');
INSERT INTO `stock_status` VALUES ('8', '2', 'Pré Venda');
INSERT INTO `stock_status` VALUES ('5', '2', 'Esgotado');
INSERT INTO `stock_status` VALUES ('6', '2', '2 à 3 dias');

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------

-- ----------------------------
-- Table structure for `tax_class`
-- ----------------------------
DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax_class
-- ----------------------------
INSERT INTO `tax_class` VALUES ('9', 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50');
INSERT INTO `tax_class` VALUES ('10', 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- ----------------------------
-- Table structure for `tax_rate`
-- ----------------------------
DROP TABLE IF EXISTS `tax_rate`;
CREATE TABLE `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax_rate
-- ----------------------------
INSERT INTO `tax_rate` VALUES ('86', '3', 'VAT (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29');
INSERT INTO `tax_rate` VALUES ('87', '3', 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- ----------------------------
-- Table structure for `tax_rate_to_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `tax_rate_to_customer_group`;
CREATE TABLE `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax_rate_to_customer_group
-- ----------------------------
INSERT INTO `tax_rate_to_customer_group` VALUES ('86', '1');
INSERT INTO `tax_rate_to_customer_group` VALUES ('87', '1');

-- ----------------------------
-- Table structure for `tax_rule`
-- ----------------------------
DROP TABLE IF EXISTS `tax_rule`;
CREATE TABLE `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax_rule
-- ----------------------------
INSERT INTO `tax_rule` VALUES ('121', '10', '86', 'payment', '1');
INSERT INTO `tax_rule` VALUES ('120', '10', '87', 'store', '0');
INSERT INTO `tax_rule` VALUES ('128', '9', '86', 'shipping', '1');
INSERT INTO `tax_rule` VALUES ('127', '9', '87', 'shipping', '2');

-- ----------------------------
-- Table structure for `url_alias`
-- ----------------------------
DROP TABLE IF EXISTS `url_alias`;
CREATE TABLE `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM AUTO_INCREMENT=775 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of url_alias
-- ----------------------------
INSERT INTO `url_alias` VALUES ('774', 'information_id=4', 'about_us');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'admin', 'bc89c61cb7b374099b28a4a925af758a4586475a', 'bb68d743a', '', '', 'arthur_pessoa@outlook.com', '', '127.0.0.1', '1', '2013-04-25 13:45:45');

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', 'Top Administrator', 'a:2:{s:6:\"access\";a:122:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:14:\"catalog/review\";i:10;s:18:\"common/filemanager\";i:11;s:13:\"design/banner\";i:12;s:13:\"design/layout\";i:13;s:14:\"extension/feed\";i:14;s:17:\"extension/manager\";i:15;s:16:\"extension/module\";i:16;s:17:\"extension/payment\";i:17;s:18:\"extension/shipping\";i:18;s:15:\"extension/total\";i:19;s:16:\"feed/google_base\";i:20;s:19:\"feed/google_sitemap\";i:21;s:20:\"localisation/country\";i:22;s:21:\"localisation/currency\";i:23;s:21:\"localisation/geo_zone\";i:24;s:21:\"localisation/language\";i:25;s:25:\"localisation/length_class\";i:26;s:25:\"localisation/order_status\";i:27;s:26:\"localisation/return_action\";i:28;s:26:\"localisation/return_reason\";i:29;s:26:\"localisation/return_status\";i:30;s:25:\"localisation/stock_status\";i:31;s:22:\"localisation/tax_class\";i:32;s:21:\"localisation/tax_rate\";i:33;s:25:\"localisation/weight_class\";i:34;s:17:\"localisation/zone\";i:35;s:14:\"module/account\";i:36;s:16:\"module/affiliate\";i:37;s:13:\"module/banner\";i:38;s:17:\"module/bestseller\";i:39;s:15:\"module/carousel\";i:40;s:15:\"module/category\";i:41;s:15:\"module/featured\";i:42;s:13:\"module/filter\";i:43;s:18:\"module/google_talk\";i:44;s:18:\"module/information\";i:45;s:13:\"module/latest\";i:46;s:16:\"module/slideshow\";i:47;s:14:\"module/special\";i:48;s:12:\"module/store\";i:49;s:14:\"module/welcome\";i:50;s:24:\"payment/authorizenet_aim\";i:51;s:21:\"payment/bank_transfer\";i:52;s:14:\"payment/cheque\";i:53;s:11:\"payment/cod\";i:54;s:21:\"payment/free_checkout\";i:55;s:14:\"payment/liqpay\";i:56;s:20:\"payment/moneybookers\";i:57;s:14:\"payment/nochex\";i:58;s:15:\"payment/paymate\";i:59;s:16:\"payment/paypoint\";i:60;s:13:\"payment/payza\";i:61;s:26:\"payment/perpetual_payments\";i:62;s:14:\"payment/pp_pro\";i:63;s:17:\"payment/pp_pro_uk\";i:64;s:19:\"payment/pp_standard\";i:65;s:15:\"payment/sagepay\";i:66;s:22:\"payment/sagepay_direct\";i:67;s:18:\"payment/sagepay_us\";i:68;s:19:\"payment/twocheckout\";i:69;s:28:\"payment/web_payment_software\";i:70;s:16:\"payment/worldpay\";i:71;s:27:\"report/affiliate_commission\";i:72;s:22:\"report/customer_credit\";i:73;s:22:\"report/customer_online\";i:74;s:21:\"report/customer_order\";i:75;s:22:\"report/customer_reward\";i:76;s:24:\"report/product_purchased\";i:77;s:21:\"report/product_viewed\";i:78;s:18:\"report/sale_coupon\";i:79;s:17:\"report/sale_order\";i:80;s:18:\"report/sale_return\";i:81;s:20:\"report/sale_shipping\";i:82;s:15:\"report/sale_tax\";i:83;s:14:\"sale/affiliate\";i:84;s:12:\"sale/contact\";i:85;s:11:\"sale/coupon\";i:86;s:13:\"sale/customer\";i:87;s:20:\"sale/customer_ban_ip\";i:88;s:19:\"sale/customer_group\";i:89;s:10:\"sale/order\";i:90;s:11:\"sale/return\";i:91;s:12:\"sale/voucher\";i:92;s:18:\"sale/voucher_theme\";i:93;s:15:\"setting/setting\";i:94;s:13:\"setting/store\";i:95;s:16:\"shipping/auspost\";i:96;s:17:\"shipping/citylink\";i:97;s:14:\"shipping/fedex\";i:98;s:13:\"shipping/flat\";i:99;s:13:\"shipping/free\";i:100;s:13:\"shipping/item\";i:101;s:23:\"shipping/parcelforce_48\";i:102;s:15:\"shipping/pickup\";i:103;s:19:\"shipping/royal_mail\";i:104;s:12:\"shipping/ups\";i:105;s:13:\"shipping/usps\";i:106;s:15:\"shipping/weight\";i:107;s:11:\"tool/backup\";i:108;s:14:\"tool/error_log\";i:109;s:12:\"total/coupon\";i:110;s:12:\"total/credit\";i:111;s:14:\"total/handling\";i:112;s:16:\"total/klarna_fee\";i:113;s:19:\"total/low_order_fee\";i:114;s:12:\"total/reward\";i:115;s:14:\"total/shipping\";i:116;s:15:\"total/sub_total\";i:117;s:9:\"total/tax\";i:118;s:11:\"total/total\";i:119;s:13:\"total/voucher\";i:120;s:9:\"user/user\";i:121;s:20:\"user/user_permission\";}s:6:\"modify\";a:122:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:14:\"catalog/review\";i:10;s:18:\"common/filemanager\";i:11;s:13:\"design/banner\";i:12;s:13:\"design/layout\";i:13;s:14:\"extension/feed\";i:14;s:17:\"extension/manager\";i:15;s:16:\"extension/module\";i:16;s:17:\"extension/payment\";i:17;s:18:\"extension/shipping\";i:18;s:15:\"extension/total\";i:19;s:16:\"feed/google_base\";i:20;s:19:\"feed/google_sitemap\";i:21;s:20:\"localisation/country\";i:22;s:21:\"localisation/currency\";i:23;s:21:\"localisation/geo_zone\";i:24;s:21:\"localisation/language\";i:25;s:25:\"localisation/length_class\";i:26;s:25:\"localisation/order_status\";i:27;s:26:\"localisation/return_action\";i:28;s:26:\"localisation/return_reason\";i:29;s:26:\"localisation/return_status\";i:30;s:25:\"localisation/stock_status\";i:31;s:22:\"localisation/tax_class\";i:32;s:21:\"localisation/tax_rate\";i:33;s:25:\"localisation/weight_class\";i:34;s:17:\"localisation/zone\";i:35;s:14:\"module/account\";i:36;s:16:\"module/affiliate\";i:37;s:13:\"module/banner\";i:38;s:17:\"module/bestseller\";i:39;s:15:\"module/carousel\";i:40;s:15:\"module/category\";i:41;s:15:\"module/featured\";i:42;s:13:\"module/filter\";i:43;s:18:\"module/google_talk\";i:44;s:18:\"module/information\";i:45;s:13:\"module/latest\";i:46;s:16:\"module/slideshow\";i:47;s:14:\"module/special\";i:48;s:12:\"module/store\";i:49;s:14:\"module/welcome\";i:50;s:24:\"payment/authorizenet_aim\";i:51;s:21:\"payment/bank_transfer\";i:52;s:14:\"payment/cheque\";i:53;s:11:\"payment/cod\";i:54;s:21:\"payment/free_checkout\";i:55;s:14:\"payment/liqpay\";i:56;s:20:\"payment/moneybookers\";i:57;s:14:\"payment/nochex\";i:58;s:15:\"payment/paymate\";i:59;s:16:\"payment/paypoint\";i:60;s:13:\"payment/payza\";i:61;s:26:\"payment/perpetual_payments\";i:62;s:14:\"payment/pp_pro\";i:63;s:17:\"payment/pp_pro_uk\";i:64;s:19:\"payment/pp_standard\";i:65;s:15:\"payment/sagepay\";i:66;s:22:\"payment/sagepay_direct\";i:67;s:18:\"payment/sagepay_us\";i:68;s:19:\"payment/twocheckout\";i:69;s:28:\"payment/web_payment_software\";i:70;s:16:\"payment/worldpay\";i:71;s:27:\"report/affiliate_commission\";i:72;s:22:\"report/customer_credit\";i:73;s:22:\"report/customer_online\";i:74;s:21:\"report/customer_order\";i:75;s:22:\"report/customer_reward\";i:76;s:24:\"report/product_purchased\";i:77;s:21:\"report/product_viewed\";i:78;s:18:\"report/sale_coupon\";i:79;s:17:\"report/sale_order\";i:80;s:18:\"report/sale_return\";i:81;s:20:\"report/sale_shipping\";i:82;s:15:\"report/sale_tax\";i:83;s:14:\"sale/affiliate\";i:84;s:12:\"sale/contact\";i:85;s:11:\"sale/coupon\";i:86;s:13:\"sale/customer\";i:87;s:20:\"sale/customer_ban_ip\";i:88;s:19:\"sale/customer_group\";i:89;s:10:\"sale/order\";i:90;s:11:\"sale/return\";i:91;s:12:\"sale/voucher\";i:92;s:18:\"sale/voucher_theme\";i:93;s:15:\"setting/setting\";i:94;s:13:\"setting/store\";i:95;s:16:\"shipping/auspost\";i:96;s:17:\"shipping/citylink\";i:97;s:14:\"shipping/fedex\";i:98;s:13:\"shipping/flat\";i:99;s:13:\"shipping/free\";i:100;s:13:\"shipping/item\";i:101;s:23:\"shipping/parcelforce_48\";i:102;s:15:\"shipping/pickup\";i:103;s:19:\"shipping/royal_mail\";i:104;s:12:\"shipping/ups\";i:105;s:13:\"shipping/usps\";i:106;s:15:\"shipping/weight\";i:107;s:11:\"tool/backup\";i:108;s:14:\"tool/error_log\";i:109;s:12:\"total/coupon\";i:110;s:12:\"total/credit\";i:111;s:14:\"total/handling\";i:112;s:16:\"total/klarna_fee\";i:113;s:19:\"total/low_order_fee\";i:114;s:12:\"total/reward\";i:115;s:14:\"total/shipping\";i:116;s:15:\"total/sub_total\";i:117;s:9:\"total/tax\";i:118;s:11:\"total/total\";i:119;s:13:\"total/voucher\";i:120;s:9:\"user/user\";i:121;s:20:\"user/user_permission\";}}');
INSERT INTO `user_group` VALUES ('10', 'Demonstration', '');

-- ----------------------------
-- Table structure for `voucher`
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `voucher_history`
-- ----------------------------
DROP TABLE IF EXISTS `voucher_history`;
CREATE TABLE `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher_history
-- ----------------------------

-- ----------------------------
-- Table structure for `voucher_theme`
-- ----------------------------
DROP TABLE IF EXISTS `voucher_theme`;
CREATE TABLE `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher_theme
-- ----------------------------
INSERT INTO `voucher_theme` VALUES ('8', 'data/demo/canon_eos_5d_2.jpg');
INSERT INTO `voucher_theme` VALUES ('7', 'data/demo/gift-voucher-birthday.jpg');
INSERT INTO `voucher_theme` VALUES ('6', 'data/demo/apple_logo.jpg');

-- ----------------------------
-- Table structure for `voucher_theme_description`
-- ----------------------------
DROP TABLE IF EXISTS `voucher_theme_description`;
CREATE TABLE `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher_theme_description
-- ----------------------------
INSERT INTO `voucher_theme_description` VALUES ('6', '2', 'Christmas');
INSERT INTO `voucher_theme_description` VALUES ('7', '2', 'Birthday');
INSERT INTO `voucher_theme_description` VALUES ('8', '2', 'General');

-- ----------------------------
-- Table structure for `weight_class`
-- ----------------------------
DROP TABLE IF EXISTS `weight_class`;
CREATE TABLE `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weight_class
-- ----------------------------
INSERT INTO `weight_class` VALUES ('1', '1.00000000');
INSERT INTO `weight_class` VALUES ('2', '1000.00000000');
INSERT INTO `weight_class` VALUES ('5', '2.20460000');
INSERT INTO `weight_class` VALUES ('6', '35.27400000');

-- ----------------------------
-- Table structure for `weight_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `weight_class_description`;
CREATE TABLE `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weight_class_description
-- ----------------------------
INSERT INTO `weight_class_description` VALUES ('1', '2', 'Kilogram', 'kg');
INSERT INTO `weight_class_description` VALUES ('2', '2', 'Gram', 'g');
INSERT INTO `weight_class_description` VALUES ('5', '2', 'Pound ', 'lb');
INSERT INTO `weight_class_description` VALUES ('6', '2', 'Ounce', 'oz');

-- ----------------------------
-- Table structure for `zone`
-- ----------------------------
DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4033 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zone
-- ----------------------------
INSERT INTO `zone` VALUES ('1', '1', 'Badakhshan', 'BDS', '1');
INSERT INTO `zone` VALUES ('2', '1', 'Badghis', 'BDG', '1');
INSERT INTO `zone` VALUES ('3', '1', 'Baghlan', 'BGL', '1');
INSERT INTO `zone` VALUES ('4', '1', 'Balkh', 'BAL', '1');
INSERT INTO `zone` VALUES ('5', '1', 'Bamian', 'BAM', '1');
INSERT INTO `zone` VALUES ('6', '1', 'Farah', 'FRA', '1');
INSERT INTO `zone` VALUES ('7', '1', 'Faryab', 'FYB', '1');
INSERT INTO `zone` VALUES ('8', '1', 'Ghazni', 'GHA', '1');
INSERT INTO `zone` VALUES ('9', '1', 'Ghowr', 'GHO', '1');
INSERT INTO `zone` VALUES ('10', '1', 'Helmand', 'HEL', '1');
INSERT INTO `zone` VALUES ('11', '1', 'Herat', 'HER', '1');
INSERT INTO `zone` VALUES ('12', '1', 'Jowzjan', 'JOW', '1');
INSERT INTO `zone` VALUES ('13', '1', 'Kabul', 'KAB', '1');
INSERT INTO `zone` VALUES ('14', '1', 'Kandahar', 'KAN', '1');
INSERT INTO `zone` VALUES ('15', '1', 'Kapisa', 'KAP', '1');
INSERT INTO `zone` VALUES ('16', '1', 'Khost', 'KHO', '1');
INSERT INTO `zone` VALUES ('17', '1', 'Konar', 'KNR', '1');
INSERT INTO `zone` VALUES ('18', '1', 'Kondoz', 'KDZ', '1');
INSERT INTO `zone` VALUES ('19', '1', 'Laghman', 'LAG', '1');
INSERT INTO `zone` VALUES ('20', '1', 'Lowgar', 'LOW', '1');
INSERT INTO `zone` VALUES ('21', '1', 'Nangrahar', 'NAN', '1');
INSERT INTO `zone` VALUES ('22', '1', 'Nimruz', 'NIM', '1');
INSERT INTO `zone` VALUES ('23', '1', 'Nurestan', 'NUR', '1');
INSERT INTO `zone` VALUES ('24', '1', 'Oruzgan', 'ORU', '1');
INSERT INTO `zone` VALUES ('25', '1', 'Paktia', 'PIA', '1');
INSERT INTO `zone` VALUES ('26', '1', 'Paktika', 'PKA', '1');
INSERT INTO `zone` VALUES ('27', '1', 'Parwan', 'PAR', '1');
INSERT INTO `zone` VALUES ('28', '1', 'Samangan', 'SAM', '1');
INSERT INTO `zone` VALUES ('29', '1', 'Sar-e Pol', 'SAR', '1');
INSERT INTO `zone` VALUES ('30', '1', 'Takhar', 'TAK', '1');
INSERT INTO `zone` VALUES ('31', '1', 'Wardak', 'WAR', '1');
INSERT INTO `zone` VALUES ('32', '1', 'Zabol', 'ZAB', '1');
INSERT INTO `zone` VALUES ('33', '2', 'Berat', 'BR', '1');
INSERT INTO `zone` VALUES ('34', '2', 'Bulqize', 'BU', '1');
INSERT INTO `zone` VALUES ('35', '2', 'Delvine', 'DL', '1');
INSERT INTO `zone` VALUES ('36', '2', 'Devoll', 'DV', '1');
INSERT INTO `zone` VALUES ('37', '2', 'Diber', 'DI', '1');
INSERT INTO `zone` VALUES ('38', '2', 'Durres', 'DR', '1');
INSERT INTO `zone` VALUES ('39', '2', 'Elbasan', 'EL', '1');
INSERT INTO `zone` VALUES ('40', '2', 'Kolonje', 'ER', '1');
INSERT INTO `zone` VALUES ('41', '2', 'Fier', 'FR', '1');
INSERT INTO `zone` VALUES ('42', '2', 'Gjirokaster', 'GJ', '1');
INSERT INTO `zone` VALUES ('43', '2', 'Gramsh', 'GR', '1');
INSERT INTO `zone` VALUES ('44', '2', 'Has', 'HA', '1');
INSERT INTO `zone` VALUES ('45', '2', 'Kavaje', 'KA', '1');
INSERT INTO `zone` VALUES ('46', '2', 'Kurbin', 'KB', '1');
INSERT INTO `zone` VALUES ('47', '2', 'Kucove', 'KC', '1');
INSERT INTO `zone` VALUES ('48', '2', 'Korce', 'KO', '1');
INSERT INTO `zone` VALUES ('49', '2', 'Kruje', 'KR', '1');
INSERT INTO `zone` VALUES ('50', '2', 'Kukes', 'KU', '1');
INSERT INTO `zone` VALUES ('51', '2', 'Librazhd', 'LB', '1');
INSERT INTO `zone` VALUES ('52', '2', 'Lezhe', 'LE', '1');
INSERT INTO `zone` VALUES ('53', '2', 'Lushnje', 'LU', '1');
INSERT INTO `zone` VALUES ('54', '2', 'Malesi e Madhe', 'MM', '1');
INSERT INTO `zone` VALUES ('55', '2', 'Mallakaster', 'MK', '1');
INSERT INTO `zone` VALUES ('56', '2', 'Mat', 'MT', '1');
INSERT INTO `zone` VALUES ('57', '2', 'Mirdite', 'MR', '1');
INSERT INTO `zone` VALUES ('58', '2', 'Peqin', 'PQ', '1');
INSERT INTO `zone` VALUES ('59', '2', 'Permet', 'PR', '1');
INSERT INTO `zone` VALUES ('60', '2', 'Pogradec', 'PG', '1');
INSERT INTO `zone` VALUES ('61', '2', 'Puke', 'PU', '1');
INSERT INTO `zone` VALUES ('62', '2', 'Shkoder', 'SH', '1');
INSERT INTO `zone` VALUES ('63', '2', 'Skrapar', 'SK', '1');
INSERT INTO `zone` VALUES ('64', '2', 'Sarande', 'SR', '1');
INSERT INTO `zone` VALUES ('65', '2', 'Tepelene', 'TE', '1');
INSERT INTO `zone` VALUES ('66', '2', 'Tropoje', 'TP', '1');
INSERT INTO `zone` VALUES ('67', '2', 'Tirane', 'TR', '1');
INSERT INTO `zone` VALUES ('68', '2', 'Vlore', 'VL', '1');
INSERT INTO `zone` VALUES ('69', '3', 'Adrar', 'ADR', '1');
INSERT INTO `zone` VALUES ('70', '3', 'Ain Defla', 'ADE', '1');
INSERT INTO `zone` VALUES ('71', '3', 'Ain Temouchent', 'ATE', '1');
INSERT INTO `zone` VALUES ('72', '3', 'Alger', 'ALG', '1');
INSERT INTO `zone` VALUES ('73', '3', 'Annaba', 'ANN', '1');
INSERT INTO `zone` VALUES ('74', '3', 'Batna', 'BAT', '1');
INSERT INTO `zone` VALUES ('75', '3', 'Bechar', 'BEC', '1');
INSERT INTO `zone` VALUES ('76', '3', 'Bejaia', 'BEJ', '1');
INSERT INTO `zone` VALUES ('77', '3', 'Biskra', 'BIS', '1');
INSERT INTO `zone` VALUES ('78', '3', 'Blida', 'BLI', '1');
INSERT INTO `zone` VALUES ('79', '3', 'Bordj Bou Arreridj', 'BBA', '1');
INSERT INTO `zone` VALUES ('80', '3', 'Bouira', 'BOA', '1');
INSERT INTO `zone` VALUES ('81', '3', 'Boumerdes', 'BMD', '1');
INSERT INTO `zone` VALUES ('82', '3', 'Chlef', 'CHL', '1');
INSERT INTO `zone` VALUES ('83', '3', 'Constantine', 'CON', '1');
INSERT INTO `zone` VALUES ('84', '3', 'Djelfa', 'DJE', '1');
INSERT INTO `zone` VALUES ('85', '3', 'El Bayadh', 'EBA', '1');
INSERT INTO `zone` VALUES ('86', '3', 'El Oued', 'EOU', '1');
INSERT INTO `zone` VALUES ('87', '3', 'El Tarf', 'ETA', '1');
INSERT INTO `zone` VALUES ('88', '3', 'Ghardaia', 'GHA', '1');
INSERT INTO `zone` VALUES ('89', '3', 'Guelma', 'GUE', '1');
INSERT INTO `zone` VALUES ('90', '3', 'Illizi', 'ILL', '1');
INSERT INTO `zone` VALUES ('91', '3', 'Jijel', 'JIJ', '1');
INSERT INTO `zone` VALUES ('92', '3', 'Khenchela', 'KHE', '1');
INSERT INTO `zone` VALUES ('93', '3', 'Laghouat', 'LAG', '1');
INSERT INTO `zone` VALUES ('94', '3', 'Muaskar', 'MUA', '1');
INSERT INTO `zone` VALUES ('95', '3', 'Medea', 'MED', '1');
INSERT INTO `zone` VALUES ('96', '3', 'Mila', 'MIL', '1');
INSERT INTO `zone` VALUES ('97', '3', 'Mostaganem', 'MOS', '1');
INSERT INTO `zone` VALUES ('98', '3', 'M\'Sila', 'MSI', '1');
INSERT INTO `zone` VALUES ('99', '3', 'Naama', 'NAA', '1');
INSERT INTO `zone` VALUES ('100', '3', 'Oran', 'ORA', '1');
INSERT INTO `zone` VALUES ('101', '3', 'Ouargla', 'OUA', '1');
INSERT INTO `zone` VALUES ('102', '3', 'Oum el-Bouaghi', 'OEB', '1');
INSERT INTO `zone` VALUES ('103', '3', 'Relizane', 'REL', '1');
INSERT INTO `zone` VALUES ('104', '3', 'Saida', 'SAI', '1');
INSERT INTO `zone` VALUES ('105', '3', 'Setif', 'SET', '1');
INSERT INTO `zone` VALUES ('106', '3', 'Sidi Bel Abbes', 'SBA', '1');
INSERT INTO `zone` VALUES ('107', '3', 'Skikda', 'SKI', '1');
INSERT INTO `zone` VALUES ('108', '3', 'Souk Ahras', 'SAH', '1');
INSERT INTO `zone` VALUES ('109', '3', 'Tamanghasset', 'TAM', '1');
INSERT INTO `zone` VALUES ('110', '3', 'Tebessa', 'TEB', '1');
INSERT INTO `zone` VALUES ('111', '3', 'Tiaret', 'TIA', '1');
INSERT INTO `zone` VALUES ('112', '3', 'Tindouf', 'TIN', '1');
INSERT INTO `zone` VALUES ('113', '3', 'Tipaza', 'TIP', '1');
INSERT INTO `zone` VALUES ('114', '3', 'Tissemsilt', 'TIS', '1');
INSERT INTO `zone` VALUES ('115', '3', 'Tizi Ouzou', 'TOU', '1');
INSERT INTO `zone` VALUES ('116', '3', 'Tlemcen', 'TLE', '1');
INSERT INTO `zone` VALUES ('117', '4', 'Eastern', 'E', '1');
INSERT INTO `zone` VALUES ('118', '4', 'Manu\'a', 'M', '1');
INSERT INTO `zone` VALUES ('119', '4', 'Rose Island', 'R', '1');
INSERT INTO `zone` VALUES ('120', '4', 'Swains Island', 'S', '1');
INSERT INTO `zone` VALUES ('121', '4', 'Western', 'W', '1');
INSERT INTO `zone` VALUES ('122', '5', 'Andorra la Vella', 'ALV', '1');
INSERT INTO `zone` VALUES ('123', '5', 'Canillo', 'CAN', '1');
INSERT INTO `zone` VALUES ('124', '5', 'Encamp', 'ENC', '1');
INSERT INTO `zone` VALUES ('125', '5', 'Escaldes-Engordany', 'ESE', '1');
INSERT INTO `zone` VALUES ('126', '5', 'La Massana', 'LMA', '1');
INSERT INTO `zone` VALUES ('127', '5', 'Ordino', 'ORD', '1');
INSERT INTO `zone` VALUES ('128', '5', 'Sant Julia de Loria', 'SJL', '1');
INSERT INTO `zone` VALUES ('129', '6', 'Bengo', 'BGO', '1');
INSERT INTO `zone` VALUES ('130', '6', 'Benguela', 'BGU', '1');
INSERT INTO `zone` VALUES ('131', '6', 'Bie', 'BIE', '1');
INSERT INTO `zone` VALUES ('132', '6', 'Cabinda', 'CAB', '1');
INSERT INTO `zone` VALUES ('133', '6', 'Cuando-Cubango', 'CCU', '1');
INSERT INTO `zone` VALUES ('134', '6', 'Cuanza Norte', 'CNO', '1');
INSERT INTO `zone` VALUES ('135', '6', 'Cuanza Sul', 'CUS', '1');
INSERT INTO `zone` VALUES ('136', '6', 'Cunene', 'CNN', '1');
INSERT INTO `zone` VALUES ('137', '6', 'Huambo', 'HUA', '1');
INSERT INTO `zone` VALUES ('138', '6', 'Huila', 'HUI', '1');
INSERT INTO `zone` VALUES ('139', '6', 'Luanda', 'LUA', '1');
INSERT INTO `zone` VALUES ('140', '6', 'Lunda Norte', 'LNO', '1');
INSERT INTO `zone` VALUES ('141', '6', 'Lunda Sul', 'LSU', '1');
INSERT INTO `zone` VALUES ('142', '6', 'Malange', 'MAL', '1');
INSERT INTO `zone` VALUES ('143', '6', 'Moxico', 'MOX', '1');
INSERT INTO `zone` VALUES ('144', '6', 'Namibe', 'NAM', '1');
INSERT INTO `zone` VALUES ('145', '6', 'Uige', 'UIG', '1');
INSERT INTO `zone` VALUES ('146', '6', 'Zaire', 'ZAI', '1');
INSERT INTO `zone` VALUES ('147', '9', 'Saint George', 'ASG', '1');
INSERT INTO `zone` VALUES ('148', '9', 'Saint John', 'ASJ', '1');
INSERT INTO `zone` VALUES ('149', '9', 'Saint Mary', 'ASM', '1');
INSERT INTO `zone` VALUES ('150', '9', 'Saint Paul', 'ASL', '1');
INSERT INTO `zone` VALUES ('151', '9', 'Saint Peter', 'ASR', '1');
INSERT INTO `zone` VALUES ('152', '9', 'Saint Philip', 'ASH', '1');
INSERT INTO `zone` VALUES ('153', '9', 'Barbuda', 'BAR', '1');
INSERT INTO `zone` VALUES ('154', '9', 'Redonda', 'RED', '1');
INSERT INTO `zone` VALUES ('155', '10', 'Antartida e Islas del Atlantico', 'AN', '1');
INSERT INTO `zone` VALUES ('156', '10', 'Buenos Aires', 'BA', '1');
INSERT INTO `zone` VALUES ('157', '10', 'Catamarca', 'CA', '1');
INSERT INTO `zone` VALUES ('158', '10', 'Chaco', 'CH', '1');
INSERT INTO `zone` VALUES ('159', '10', 'Chubut', 'CU', '1');
INSERT INTO `zone` VALUES ('160', '10', 'Cordoba', 'CO', '1');
INSERT INTO `zone` VALUES ('161', '10', 'Corrientes', 'CR', '1');
INSERT INTO `zone` VALUES ('162', '10', 'Distrito Federal', 'DF', '1');
INSERT INTO `zone` VALUES ('163', '10', 'Entre Rios', 'ER', '1');
INSERT INTO `zone` VALUES ('164', '10', 'Formosa', 'FO', '1');
INSERT INTO `zone` VALUES ('165', '10', 'Jujuy', 'JU', '1');
INSERT INTO `zone` VALUES ('166', '10', 'La Pampa', 'LP', '1');
INSERT INTO `zone` VALUES ('167', '10', 'La Rioja', 'LR', '1');
INSERT INTO `zone` VALUES ('168', '10', 'Mendoza', 'ME', '1');
INSERT INTO `zone` VALUES ('169', '10', 'Misiones', 'MI', '1');
INSERT INTO `zone` VALUES ('170', '10', 'Neuquen', 'NE', '1');
INSERT INTO `zone` VALUES ('171', '10', 'Rio Negro', 'RN', '1');
INSERT INTO `zone` VALUES ('172', '10', 'Salta', 'SA', '1');
INSERT INTO `zone` VALUES ('173', '10', 'San Juan', 'SJ', '1');
INSERT INTO `zone` VALUES ('174', '10', 'San Luis', 'SL', '1');
INSERT INTO `zone` VALUES ('175', '10', 'Santa Cruz', 'SC', '1');
INSERT INTO `zone` VALUES ('176', '10', 'Santa Fe', 'SF', '1');
INSERT INTO `zone` VALUES ('177', '10', 'Santiago del Estero', 'SD', '1');
INSERT INTO `zone` VALUES ('178', '10', 'Tierra del Fuego', 'TF', '1');
INSERT INTO `zone` VALUES ('179', '10', 'Tucuman', 'TU', '1');
INSERT INTO `zone` VALUES ('180', '11', 'Aragatsotn', 'AGT', '1');
INSERT INTO `zone` VALUES ('181', '11', 'Ararat', 'ARR', '1');
INSERT INTO `zone` VALUES ('182', '11', 'Armavir', 'ARM', '1');
INSERT INTO `zone` VALUES ('183', '11', 'Geghark\'unik\'', 'GEG', '1');
INSERT INTO `zone` VALUES ('184', '11', 'Kotayk\'', 'KOT', '1');
INSERT INTO `zone` VALUES ('185', '11', 'Lorri', 'LOR', '1');
INSERT INTO `zone` VALUES ('186', '11', 'Shirak', 'SHI', '1');
INSERT INTO `zone` VALUES ('187', '11', 'Syunik\'', 'SYU', '1');
INSERT INTO `zone` VALUES ('188', '11', 'Tavush', 'TAV', '1');
INSERT INTO `zone` VALUES ('189', '11', 'Vayots\' Dzor', 'VAY', '1');
INSERT INTO `zone` VALUES ('190', '11', 'Yerevan', 'YER', '1');
INSERT INTO `zone` VALUES ('191', '13', 'Australian Capital Territory', 'ACT', '1');
INSERT INTO `zone` VALUES ('192', '13', 'New South Wales', 'NSW', '1');
INSERT INTO `zone` VALUES ('193', '13', 'Northern Territory', 'NT', '1');
INSERT INTO `zone` VALUES ('194', '13', 'Queensland', 'QLD', '1');
INSERT INTO `zone` VALUES ('195', '13', 'South Australia', 'SA', '1');
INSERT INTO `zone` VALUES ('196', '13', 'Tasmania', 'TAS', '1');
INSERT INTO `zone` VALUES ('197', '13', 'Victoria', 'VIC', '1');
INSERT INTO `zone` VALUES ('198', '13', 'Western Australia', 'WA', '1');
INSERT INTO `zone` VALUES ('199', '14', 'Burgenland', 'BUR', '1');
INSERT INTO `zone` VALUES ('200', '14', 'Kärnten', 'KAR', '1');
INSERT INTO `zone` VALUES ('201', '14', 'Nieder&ouml;sterreich', 'NOS', '1');
INSERT INTO `zone` VALUES ('202', '14', 'Ober&ouml;sterreich', 'OOS', '1');
INSERT INTO `zone` VALUES ('203', '14', 'Salzburg', 'SAL', '1');
INSERT INTO `zone` VALUES ('204', '14', 'Steiermark', 'STE', '1');
INSERT INTO `zone` VALUES ('205', '14', 'Tirol', 'TIR', '1');
INSERT INTO `zone` VALUES ('206', '14', 'Vorarlberg', 'VOR', '1');
INSERT INTO `zone` VALUES ('207', '14', 'Wien', 'WIE', '1');
INSERT INTO `zone` VALUES ('208', '15', 'Ali Bayramli', 'AB', '1');
INSERT INTO `zone` VALUES ('209', '15', 'Abseron', 'ABS', '1');
INSERT INTO `zone` VALUES ('210', '15', 'AgcabAdi', 'AGC', '1');
INSERT INTO `zone` VALUES ('211', '15', 'Agdam', 'AGM', '1');
INSERT INTO `zone` VALUES ('212', '15', 'Agdas', 'AGS', '1');
INSERT INTO `zone` VALUES ('213', '15', 'Agstafa', 'AGA', '1');
INSERT INTO `zone` VALUES ('214', '15', 'Agsu', 'AGU', '1');
INSERT INTO `zone` VALUES ('215', '15', 'Astara', 'AST', '1');
INSERT INTO `zone` VALUES ('216', '15', 'Baki', 'BA', '1');
INSERT INTO `zone` VALUES ('217', '15', 'BabAk', 'BAB', '1');
INSERT INTO `zone` VALUES ('218', '15', 'BalakAn', 'BAL', '1');
INSERT INTO `zone` VALUES ('219', '15', 'BArdA', 'BAR', '1');
INSERT INTO `zone` VALUES ('220', '15', 'Beylaqan', 'BEY', '1');
INSERT INTO `zone` VALUES ('221', '15', 'Bilasuvar', 'BIL', '1');
INSERT INTO `zone` VALUES ('222', '15', 'Cabrayil', 'CAB', '1');
INSERT INTO `zone` VALUES ('223', '15', 'Calilabab', 'CAL', '1');
INSERT INTO `zone` VALUES ('224', '15', 'Culfa', 'CUL', '1');
INSERT INTO `zone` VALUES ('225', '15', 'Daskasan', 'DAS', '1');
INSERT INTO `zone` VALUES ('226', '15', 'Davaci', 'DAV', '1');
INSERT INTO `zone` VALUES ('227', '15', 'Fuzuli', 'FUZ', '1');
INSERT INTO `zone` VALUES ('228', '15', 'Ganca', 'GA', '1');
INSERT INTO `zone` VALUES ('229', '15', 'Gadabay', 'GAD', '1');
INSERT INTO `zone` VALUES ('230', '15', 'Goranboy', 'GOR', '1');
INSERT INTO `zone` VALUES ('231', '15', 'Goycay', 'GOY', '1');
INSERT INTO `zone` VALUES ('232', '15', 'Haciqabul', 'HAC', '1');
INSERT INTO `zone` VALUES ('233', '15', 'Imisli', 'IMI', '1');
INSERT INTO `zone` VALUES ('234', '15', 'Ismayilli', 'ISM', '1');
INSERT INTO `zone` VALUES ('235', '15', 'Kalbacar', 'KAL', '1');
INSERT INTO `zone` VALUES ('236', '15', 'Kurdamir', 'KUR', '1');
INSERT INTO `zone` VALUES ('237', '15', 'Lankaran', 'LA', '1');
INSERT INTO `zone` VALUES ('238', '15', 'Lacin', 'LAC', '1');
INSERT INTO `zone` VALUES ('239', '15', 'Lankaran', 'LAN', '1');
INSERT INTO `zone` VALUES ('240', '15', 'Lerik', 'LER', '1');
INSERT INTO `zone` VALUES ('241', '15', 'Masalli', 'MAS', '1');
INSERT INTO `zone` VALUES ('242', '15', 'Mingacevir', 'MI', '1');
INSERT INTO `zone` VALUES ('243', '15', 'Naftalan', 'NA', '1');
INSERT INTO `zone` VALUES ('244', '15', 'Neftcala', 'NEF', '1');
INSERT INTO `zone` VALUES ('245', '15', 'Oguz', 'OGU', '1');
INSERT INTO `zone` VALUES ('246', '15', 'Ordubad', 'ORD', '1');
INSERT INTO `zone` VALUES ('247', '15', 'Qabala', 'QAB', '1');
INSERT INTO `zone` VALUES ('248', '15', 'Qax', 'QAX', '1');
INSERT INTO `zone` VALUES ('249', '15', 'Qazax', 'QAZ', '1');
INSERT INTO `zone` VALUES ('250', '15', 'Qobustan', 'QOB', '1');
INSERT INTO `zone` VALUES ('251', '15', 'Quba', 'QBA', '1');
INSERT INTO `zone` VALUES ('252', '15', 'Qubadli', 'QBI', '1');
INSERT INTO `zone` VALUES ('253', '15', 'Qusar', 'QUS', '1');
INSERT INTO `zone` VALUES ('254', '15', 'Saki', 'SA', '1');
INSERT INTO `zone` VALUES ('255', '15', 'Saatli', 'SAT', '1');
INSERT INTO `zone` VALUES ('256', '15', 'Sabirabad', 'SAB', '1');
INSERT INTO `zone` VALUES ('257', '15', 'Sadarak', 'SAD', '1');
INSERT INTO `zone` VALUES ('258', '15', 'Sahbuz', 'SAH', '1');
INSERT INTO `zone` VALUES ('259', '15', 'Saki', 'SAK', '1');
INSERT INTO `zone` VALUES ('260', '15', 'Salyan', 'SAL', '1');
INSERT INTO `zone` VALUES ('261', '15', 'Sumqayit', 'SM', '1');
INSERT INTO `zone` VALUES ('262', '15', 'Samaxi', 'SMI', '1');
INSERT INTO `zone` VALUES ('263', '15', 'Samkir', 'SKR', '1');
INSERT INTO `zone` VALUES ('264', '15', 'Samux', 'SMX', '1');
INSERT INTO `zone` VALUES ('265', '15', 'Sarur', 'SAR', '1');
INSERT INTO `zone` VALUES ('266', '15', 'Siyazan', 'SIY', '1');
INSERT INTO `zone` VALUES ('267', '15', 'Susa', 'SS', '1');
INSERT INTO `zone` VALUES ('268', '15', 'Susa', 'SUS', '1');
INSERT INTO `zone` VALUES ('269', '15', 'Tartar', 'TAR', '1');
INSERT INTO `zone` VALUES ('270', '15', 'Tovuz', 'TOV', '1');
INSERT INTO `zone` VALUES ('271', '15', 'Ucar', 'UCA', '1');
INSERT INTO `zone` VALUES ('272', '15', 'Xankandi', 'XA', '1');
INSERT INTO `zone` VALUES ('273', '15', 'Xacmaz', 'XAC', '1');
INSERT INTO `zone` VALUES ('274', '15', 'Xanlar', 'XAN', '1');
INSERT INTO `zone` VALUES ('275', '15', 'Xizi', 'XIZ', '1');
INSERT INTO `zone` VALUES ('276', '15', 'Xocali', 'XCI', '1');
INSERT INTO `zone` VALUES ('277', '15', 'Xocavand', 'XVD', '1');
INSERT INTO `zone` VALUES ('278', '15', 'Yardimli', 'YAR', '1');
INSERT INTO `zone` VALUES ('279', '15', 'Yevlax', 'YEV', '1');
INSERT INTO `zone` VALUES ('280', '15', 'Zangilan', 'ZAN', '1');
INSERT INTO `zone` VALUES ('281', '15', 'Zaqatala', 'ZAQ', '1');
INSERT INTO `zone` VALUES ('282', '15', 'Zardab', 'ZAR', '1');
INSERT INTO `zone` VALUES ('283', '15', 'Naxcivan', 'NX', '1');
INSERT INTO `zone` VALUES ('284', '16', 'Acklins', 'ACK', '1');
INSERT INTO `zone` VALUES ('285', '16', 'Berry Islands', 'BER', '1');
INSERT INTO `zone` VALUES ('286', '16', 'Bimini', 'BIM', '1');
INSERT INTO `zone` VALUES ('287', '16', 'Black Point', 'BLK', '1');
INSERT INTO `zone` VALUES ('288', '16', 'Cat Island', 'CAT', '1');
INSERT INTO `zone` VALUES ('289', '16', 'Central Abaco', 'CAB', '1');
INSERT INTO `zone` VALUES ('290', '16', 'Central Andros', 'CAN', '1');
INSERT INTO `zone` VALUES ('291', '16', 'Central Eleuthera', 'CEL', '1');
INSERT INTO `zone` VALUES ('292', '16', 'City of Freeport', 'FRE', '1');
INSERT INTO `zone` VALUES ('293', '16', 'Crooked Island', 'CRO', '1');
INSERT INTO `zone` VALUES ('294', '16', 'East Grand Bahama', 'EGB', '1');
INSERT INTO `zone` VALUES ('295', '16', 'Exuma', 'EXU', '1');
INSERT INTO `zone` VALUES ('296', '16', 'Grand Cay', 'GRD', '1');
INSERT INTO `zone` VALUES ('297', '16', 'Harbour Island', 'HAR', '1');
INSERT INTO `zone` VALUES ('298', '16', 'Hope Town', 'HOP', '1');
INSERT INTO `zone` VALUES ('299', '16', 'Inagua', 'INA', '1');
INSERT INTO `zone` VALUES ('300', '16', 'Long Island', 'LNG', '1');
INSERT INTO `zone` VALUES ('301', '16', 'Mangrove Cay', 'MAN', '1');
INSERT INTO `zone` VALUES ('302', '16', 'Mayaguana', 'MAY', '1');
INSERT INTO `zone` VALUES ('303', '16', 'Moore\'s Island', 'MOO', '1');
INSERT INTO `zone` VALUES ('304', '16', 'North Abaco', 'NAB', '1');
INSERT INTO `zone` VALUES ('305', '16', 'North Andros', 'NAN', '1');
INSERT INTO `zone` VALUES ('306', '16', 'North Eleuthera', 'NEL', '1');
INSERT INTO `zone` VALUES ('307', '16', 'Ragged Island', 'RAG', '1');
INSERT INTO `zone` VALUES ('308', '16', 'Rum Cay', 'RUM', '1');
INSERT INTO `zone` VALUES ('309', '16', 'San Salvador', 'SAL', '1');
INSERT INTO `zone` VALUES ('310', '16', 'South Abaco', 'SAB', '1');
INSERT INTO `zone` VALUES ('311', '16', 'South Andros', 'SAN', '1');
INSERT INTO `zone` VALUES ('312', '16', 'South Eleuthera', 'SEL', '1');
INSERT INTO `zone` VALUES ('313', '16', 'Spanish Wells', 'SWE', '1');
INSERT INTO `zone` VALUES ('314', '16', 'West Grand Bahama', 'WGB', '1');
INSERT INTO `zone` VALUES ('315', '17', 'Capital', 'CAP', '1');
INSERT INTO `zone` VALUES ('316', '17', 'Central', 'CEN', '1');
INSERT INTO `zone` VALUES ('317', '17', 'Muharraq', 'MUH', '1');
INSERT INTO `zone` VALUES ('318', '17', 'Northern', 'NOR', '1');
INSERT INTO `zone` VALUES ('319', '17', 'Southern', 'SOU', '1');
INSERT INTO `zone` VALUES ('320', '18', 'Barisal', 'BAR', '1');
INSERT INTO `zone` VALUES ('321', '18', 'Chittagong', 'CHI', '1');
INSERT INTO `zone` VALUES ('322', '18', 'Dhaka', 'DHA', '1');
INSERT INTO `zone` VALUES ('323', '18', 'Khulna', 'KHU', '1');
INSERT INTO `zone` VALUES ('324', '18', 'Rajshahi', 'RAJ', '1');
INSERT INTO `zone` VALUES ('325', '18', 'Sylhet', 'SYL', '1');
INSERT INTO `zone` VALUES ('326', '19', 'Christ Church', 'CC', '1');
INSERT INTO `zone` VALUES ('327', '19', 'Saint Andrew', 'AND', '1');
INSERT INTO `zone` VALUES ('328', '19', 'Saint George', 'GEO', '1');
INSERT INTO `zone` VALUES ('329', '19', 'Saint James', 'JAM', '1');
INSERT INTO `zone` VALUES ('330', '19', 'Saint John', 'JOH', '1');
INSERT INTO `zone` VALUES ('331', '19', 'Saint Joseph', 'JOS', '1');
INSERT INTO `zone` VALUES ('332', '19', 'Saint Lucy', 'LUC', '1');
INSERT INTO `zone` VALUES ('333', '19', 'Saint Michael', 'MIC', '1');
INSERT INTO `zone` VALUES ('334', '19', 'Saint Peter', 'PET', '1');
INSERT INTO `zone` VALUES ('335', '19', 'Saint Philip', 'PHI', '1');
INSERT INTO `zone` VALUES ('336', '19', 'Saint Thomas', 'THO', '1');
INSERT INTO `zone` VALUES ('337', '20', 'Brestskaya (Brest)', 'BR', '1');
INSERT INTO `zone` VALUES ('338', '20', 'Homyel\'skaya (Homyel\')', 'HO', '1');
INSERT INTO `zone` VALUES ('339', '20', 'Horad Minsk', 'HM', '1');
INSERT INTO `zone` VALUES ('340', '20', 'Hrodzyenskaya (Hrodna)', 'HR', '1');
INSERT INTO `zone` VALUES ('341', '20', 'Mahilyowskaya (Mahilyow)', 'MA', '1');
INSERT INTO `zone` VALUES ('342', '20', 'Minskaya', 'MI', '1');
INSERT INTO `zone` VALUES ('343', '20', 'Vitsyebskaya (Vitsyebsk)', 'VI', '1');
INSERT INTO `zone` VALUES ('344', '21', 'Antwerpen', 'VAN', '1');
INSERT INTO `zone` VALUES ('345', '21', 'Brabant Wallon', 'WBR', '1');
INSERT INTO `zone` VALUES ('346', '21', 'Hainaut', 'WHT', '1');
INSERT INTO `zone` VALUES ('347', '21', 'Liège', 'WLG', '1');
INSERT INTO `zone` VALUES ('348', '21', 'Limburg', 'VLI', '1');
INSERT INTO `zone` VALUES ('349', '21', 'Luxembourg', 'WLX', '1');
INSERT INTO `zone` VALUES ('350', '21', 'Namur', 'WNA', '1');
INSERT INTO `zone` VALUES ('351', '21', 'Oost-Vlaanderen', 'VOV', '1');
INSERT INTO `zone` VALUES ('352', '21', 'Vlaams Brabant', 'VBR', '1');
INSERT INTO `zone` VALUES ('353', '21', 'West-Vlaanderen', 'VWV', '1');
INSERT INTO `zone` VALUES ('354', '22', 'Belize', 'BZ', '1');
INSERT INTO `zone` VALUES ('355', '22', 'Cayo', 'CY', '1');
INSERT INTO `zone` VALUES ('356', '22', 'Corozal', 'CR', '1');
INSERT INTO `zone` VALUES ('357', '22', 'Orange Walk', 'OW', '1');
INSERT INTO `zone` VALUES ('358', '22', 'Stann Creek', 'SC', '1');
INSERT INTO `zone` VALUES ('359', '22', 'Toledo', 'TO', '1');
INSERT INTO `zone` VALUES ('360', '23', 'Alibori', 'AL', '1');
INSERT INTO `zone` VALUES ('361', '23', 'Atakora', 'AK', '1');
INSERT INTO `zone` VALUES ('362', '23', 'Atlantique', 'AQ', '1');
INSERT INTO `zone` VALUES ('363', '23', 'Borgou', 'BO', '1');
INSERT INTO `zone` VALUES ('364', '23', 'Collines', 'CO', '1');
INSERT INTO `zone` VALUES ('365', '23', 'Donga', 'DO', '1');
INSERT INTO `zone` VALUES ('366', '23', 'Kouffo', 'KO', '1');
INSERT INTO `zone` VALUES ('367', '23', 'Littoral', 'LI', '1');
INSERT INTO `zone` VALUES ('368', '23', 'Mono', 'MO', '1');
INSERT INTO `zone` VALUES ('369', '23', 'Oueme', 'OU', '1');
INSERT INTO `zone` VALUES ('370', '23', 'Plateau', 'PL', '1');
INSERT INTO `zone` VALUES ('371', '23', 'Zou', 'ZO', '1');
INSERT INTO `zone` VALUES ('372', '24', 'Devonshire', 'DS', '1');
INSERT INTO `zone` VALUES ('373', '24', 'Hamilton City', 'HC', '1');
INSERT INTO `zone` VALUES ('374', '24', 'Hamilton', 'HA', '1');
INSERT INTO `zone` VALUES ('375', '24', 'Paget', 'PG', '1');
INSERT INTO `zone` VALUES ('376', '24', 'Pembroke', 'PB', '1');
INSERT INTO `zone` VALUES ('377', '24', 'Saint George City', 'GC', '1');
INSERT INTO `zone` VALUES ('378', '24', 'Saint George\'s', 'SG', '1');
INSERT INTO `zone` VALUES ('379', '24', 'Sandys', 'SA', '1');
INSERT INTO `zone` VALUES ('380', '24', 'Smith\'s', 'SM', '1');
INSERT INTO `zone` VALUES ('381', '24', 'Southampton', 'SH', '1');
INSERT INTO `zone` VALUES ('382', '24', 'Warwick', 'WA', '1');
INSERT INTO `zone` VALUES ('383', '25', 'Bumthang', 'BUM', '1');
INSERT INTO `zone` VALUES ('384', '25', 'Chukha', 'CHU', '1');
INSERT INTO `zone` VALUES ('385', '25', 'Dagana', 'DAG', '1');
INSERT INTO `zone` VALUES ('386', '25', 'Gasa', 'GAS', '1');
INSERT INTO `zone` VALUES ('387', '25', 'Haa', 'HAA', '1');
INSERT INTO `zone` VALUES ('388', '25', 'Lhuntse', 'LHU', '1');
INSERT INTO `zone` VALUES ('389', '25', 'Mongar', 'MON', '1');
INSERT INTO `zone` VALUES ('390', '25', 'Paro', 'PAR', '1');
INSERT INTO `zone` VALUES ('391', '25', 'Pemagatshel', 'PEM', '1');
INSERT INTO `zone` VALUES ('392', '25', 'Punakha', 'PUN', '1');
INSERT INTO `zone` VALUES ('393', '25', 'Samdrup Jongkhar', 'SJO', '1');
INSERT INTO `zone` VALUES ('394', '25', 'Samtse', 'SAT', '1');
INSERT INTO `zone` VALUES ('395', '25', 'Sarpang', 'SAR', '1');
INSERT INTO `zone` VALUES ('396', '25', 'Thimphu', 'THI', '1');
INSERT INTO `zone` VALUES ('397', '25', 'Trashigang', 'TRG', '1');
INSERT INTO `zone` VALUES ('398', '25', 'Trashiyangste', 'TRY', '1');
INSERT INTO `zone` VALUES ('399', '25', 'Trongsa', 'TRO', '1');
INSERT INTO `zone` VALUES ('400', '25', 'Tsirang', 'TSI', '1');
INSERT INTO `zone` VALUES ('401', '25', 'Wangdue Phodrang', 'WPH', '1');
INSERT INTO `zone` VALUES ('402', '25', 'Zhemgang', 'ZHE', '1');
INSERT INTO `zone` VALUES ('403', '26', 'Beni', 'BEN', '1');
INSERT INTO `zone` VALUES ('404', '26', 'Chuquisaca', 'CHU', '1');
INSERT INTO `zone` VALUES ('405', '26', 'Cochabamba', 'COC', '1');
INSERT INTO `zone` VALUES ('406', '26', 'La Paz', 'LPZ', '1');
INSERT INTO `zone` VALUES ('407', '26', 'Oruro', 'ORU', '1');
INSERT INTO `zone` VALUES ('408', '26', 'Pando', 'PAN', '1');
INSERT INTO `zone` VALUES ('409', '26', 'Potosi', 'POT', '1');
INSERT INTO `zone` VALUES ('410', '26', 'Santa Cruz', 'SCZ', '1');
INSERT INTO `zone` VALUES ('411', '26', 'Tarija', 'TAR', '1');
INSERT INTO `zone` VALUES ('412', '27', 'Brcko district', 'BRO', '1');
INSERT INTO `zone` VALUES ('413', '27', 'Unsko-Sanski Kanton', 'FUS', '1');
INSERT INTO `zone` VALUES ('414', '27', 'Posavski Kanton', 'FPO', '1');
INSERT INTO `zone` VALUES ('415', '27', 'Tuzlanski Kanton', 'FTU', '1');
INSERT INTO `zone` VALUES ('416', '27', 'Zenicko-Dobojski Kanton', 'FZE', '1');
INSERT INTO `zone` VALUES ('417', '27', 'Bosanskopodrinjski Kanton', 'FBP', '1');
INSERT INTO `zone` VALUES ('418', '27', 'Srednjebosanski Kanton', 'FSB', '1');
INSERT INTO `zone` VALUES ('419', '27', 'Hercegovacko-neretvanski Kanton', 'FHN', '1');
INSERT INTO `zone` VALUES ('420', '27', 'Zapadnohercegovacka Zupanija', 'FZH', '1');
INSERT INTO `zone` VALUES ('421', '27', 'Kanton Sarajevo', 'FSA', '1');
INSERT INTO `zone` VALUES ('422', '27', 'Zapadnobosanska', 'FZA', '1');
INSERT INTO `zone` VALUES ('423', '27', 'Banja Luka', 'SBL', '1');
INSERT INTO `zone` VALUES ('424', '27', 'Doboj', 'SDO', '1');
INSERT INTO `zone` VALUES ('425', '27', 'Bijeljina', 'SBI', '1');
INSERT INTO `zone` VALUES ('426', '27', 'Vlasenica', 'SVL', '1');
INSERT INTO `zone` VALUES ('427', '27', 'Sarajevo-Romanija or Sokolac', 'SSR', '1');
INSERT INTO `zone` VALUES ('428', '27', 'Foca', 'SFO', '1');
INSERT INTO `zone` VALUES ('429', '27', 'Trebinje', 'STR', '1');
INSERT INTO `zone` VALUES ('430', '28', 'Central', 'CE', '1');
INSERT INTO `zone` VALUES ('431', '28', 'Ghanzi', 'GH', '1');
INSERT INTO `zone` VALUES ('432', '28', 'Kgalagadi', 'KD', '1');
INSERT INTO `zone` VALUES ('433', '28', 'Kgatleng', 'KT', '1');
INSERT INTO `zone` VALUES ('434', '28', 'Kweneng', 'KW', '1');
INSERT INTO `zone` VALUES ('435', '28', 'Ngamiland', 'NG', '1');
INSERT INTO `zone` VALUES ('436', '28', 'North East', 'NE', '1');
INSERT INTO `zone` VALUES ('437', '28', 'North West', 'NW', '1');
INSERT INTO `zone` VALUES ('438', '28', 'South East', 'SE', '1');
INSERT INTO `zone` VALUES ('439', '28', 'Southern', 'SO', '1');
INSERT INTO `zone` VALUES ('440', '30', 'Acre', 'AC', '1');
INSERT INTO `zone` VALUES ('441', '30', 'Alagoas', 'AL', '1');
INSERT INTO `zone` VALUES ('442', '30', 'Amapá', 'AP', '1');
INSERT INTO `zone` VALUES ('443', '30', 'Amazonas', 'AM', '1');
INSERT INTO `zone` VALUES ('444', '30', 'Bahia', 'BA', '1');
INSERT INTO `zone` VALUES ('445', '30', 'Ceará', 'CE', '1');
INSERT INTO `zone` VALUES ('446', '30', 'Distrito Federal', 'DF', '1');
INSERT INTO `zone` VALUES ('447', '30', 'Espírito Santo', 'ES', '1');
INSERT INTO `zone` VALUES ('448', '30', 'Goiás', 'GO', '1');
INSERT INTO `zone` VALUES ('449', '30', 'Maranhão', 'MA', '1');
INSERT INTO `zone` VALUES ('450', '30', 'Mato Grosso', 'MT', '1');
INSERT INTO `zone` VALUES ('451', '30', 'Mato Grosso do Sul', 'MS', '1');
INSERT INTO `zone` VALUES ('452', '30', 'Minas Gerais', 'MG', '1');
INSERT INTO `zone` VALUES ('453', '30', 'Pará', 'PA', '1');
INSERT INTO `zone` VALUES ('454', '30', 'Paraíba', 'PB', '1');
INSERT INTO `zone` VALUES ('455', '30', 'Paraná', 'PR', '1');
INSERT INTO `zone` VALUES ('456', '30', 'Pernambuco', 'PE', '1');
INSERT INTO `zone` VALUES ('457', '30', 'Piauí', 'PI', '1');
INSERT INTO `zone` VALUES ('458', '30', 'Rio de Janeiro', 'RJ', '1');
INSERT INTO `zone` VALUES ('459', '30', 'Rio Grande do Norte', 'RN', '1');
INSERT INTO `zone` VALUES ('460', '30', 'Rio Grande do Sul', 'RS', '1');
INSERT INTO `zone` VALUES ('461', '30', 'Rondônia', 'RO', '1');
INSERT INTO `zone` VALUES ('462', '30', 'Roraima', 'RR', '1');
INSERT INTO `zone` VALUES ('463', '30', 'Santa Catarina', 'SC', '1');
INSERT INTO `zone` VALUES ('464', '30', 'São Paulo', 'SP', '1');
INSERT INTO `zone` VALUES ('465', '30', 'Sergipe', 'SE', '1');
INSERT INTO `zone` VALUES ('466', '30', 'Tocantins', 'TO', '1');
INSERT INTO `zone` VALUES ('467', '31', 'Peros Banhos', 'PB', '1');
INSERT INTO `zone` VALUES ('468', '31', 'Salomon Islands', 'SI', '1');
INSERT INTO `zone` VALUES ('469', '31', 'Nelsons Island', 'NI', '1');
INSERT INTO `zone` VALUES ('470', '31', 'Three Brothers', 'TB', '1');
INSERT INTO `zone` VALUES ('471', '31', 'Eagle Islands', 'EA', '1');
INSERT INTO `zone` VALUES ('472', '31', 'Danger Island', 'DI', '1');
INSERT INTO `zone` VALUES ('473', '31', 'Egmont Islands', 'EG', '1');
INSERT INTO `zone` VALUES ('474', '31', 'Diego Garcia', 'DG', '1');
INSERT INTO `zone` VALUES ('475', '32', 'Belait', 'BEL', '1');
INSERT INTO `zone` VALUES ('476', '32', 'Brunei and Muara', 'BRM', '1');
INSERT INTO `zone` VALUES ('477', '32', 'Temburong', 'TEM', '1');
INSERT INTO `zone` VALUES ('478', '32', 'Tutong', 'TUT', '1');
INSERT INTO `zone` VALUES ('479', '33', 'Blagoevgrad', '', '1');
INSERT INTO `zone` VALUES ('480', '33', 'Burgas', '', '1');
INSERT INTO `zone` VALUES ('481', '33', 'Dobrich', '', '1');
INSERT INTO `zone` VALUES ('482', '33', 'Gabrovo', '', '1');
INSERT INTO `zone` VALUES ('483', '33', 'Haskovo', '', '1');
INSERT INTO `zone` VALUES ('484', '33', 'Kardjali', '', '1');
INSERT INTO `zone` VALUES ('485', '33', 'Kyustendil', '', '1');
INSERT INTO `zone` VALUES ('486', '33', 'Lovech', '', '1');
INSERT INTO `zone` VALUES ('487', '33', 'Montana', '', '1');
INSERT INTO `zone` VALUES ('488', '33', 'Pazardjik', '', '1');
INSERT INTO `zone` VALUES ('489', '33', 'Pernik', '', '1');
INSERT INTO `zone` VALUES ('490', '33', 'Pleven', '', '1');
INSERT INTO `zone` VALUES ('491', '33', 'Plovdiv', '', '1');
INSERT INTO `zone` VALUES ('492', '33', 'Razgrad', '', '1');
INSERT INTO `zone` VALUES ('493', '33', 'Shumen', '', '1');
INSERT INTO `zone` VALUES ('494', '33', 'Silistra', '', '1');
INSERT INTO `zone` VALUES ('495', '33', 'Sliven', '', '1');
INSERT INTO `zone` VALUES ('496', '33', 'Smolyan', '', '1');
INSERT INTO `zone` VALUES ('497', '33', 'Sofia', '', '1');
INSERT INTO `zone` VALUES ('498', '33', 'Sofia - town', '', '1');
INSERT INTO `zone` VALUES ('499', '33', 'Stara Zagora', '', '1');
INSERT INTO `zone` VALUES ('500', '33', 'Targovishte', '', '1');
INSERT INTO `zone` VALUES ('501', '33', 'Varna', '', '1');
INSERT INTO `zone` VALUES ('502', '33', 'Veliko Tarnovo', '', '1');
INSERT INTO `zone` VALUES ('503', '33', 'Vidin', '', '1');
INSERT INTO `zone` VALUES ('504', '33', 'Vratza', '', '1');
INSERT INTO `zone` VALUES ('505', '33', 'Yambol', '', '1');
INSERT INTO `zone` VALUES ('506', '34', 'Bale', 'BAL', '1');
INSERT INTO `zone` VALUES ('507', '34', 'Bam', 'BAM', '1');
INSERT INTO `zone` VALUES ('508', '34', 'Banwa', 'BAN', '1');
INSERT INTO `zone` VALUES ('509', '34', 'Bazega', 'BAZ', '1');
INSERT INTO `zone` VALUES ('510', '34', 'Bougouriba', 'BOR', '1');
INSERT INTO `zone` VALUES ('511', '34', 'Boulgou', 'BLG', '1');
INSERT INTO `zone` VALUES ('512', '34', 'Boulkiemde', 'BOK', '1');
INSERT INTO `zone` VALUES ('513', '34', 'Comoe', 'COM', '1');
INSERT INTO `zone` VALUES ('514', '34', 'Ganzourgou', 'GAN', '1');
INSERT INTO `zone` VALUES ('515', '34', 'Gnagna', 'GNA', '1');
INSERT INTO `zone` VALUES ('516', '34', 'Gourma', 'GOU', '1');
INSERT INTO `zone` VALUES ('517', '34', 'Houet', 'HOU', '1');
INSERT INTO `zone` VALUES ('518', '34', 'Ioba', 'IOA', '1');
INSERT INTO `zone` VALUES ('519', '34', 'Kadiogo', 'KAD', '1');
INSERT INTO `zone` VALUES ('520', '34', 'Kenedougou', 'KEN', '1');
INSERT INTO `zone` VALUES ('521', '34', 'Komondjari', 'KOD', '1');
INSERT INTO `zone` VALUES ('522', '34', 'Kompienga', 'KOP', '1');
INSERT INTO `zone` VALUES ('523', '34', 'Kossi', 'KOS', '1');
INSERT INTO `zone` VALUES ('524', '34', 'Koulpelogo', 'KOL', '1');
INSERT INTO `zone` VALUES ('525', '34', 'Kouritenga', 'KOT', '1');
INSERT INTO `zone` VALUES ('526', '34', 'Kourweogo', 'KOW', '1');
INSERT INTO `zone` VALUES ('527', '34', 'Leraba', 'LER', '1');
INSERT INTO `zone` VALUES ('528', '34', 'Loroum', 'LOR', '1');
INSERT INTO `zone` VALUES ('529', '34', 'Mouhoun', 'MOU', '1');
INSERT INTO `zone` VALUES ('530', '34', 'Nahouri', 'NAH', '1');
INSERT INTO `zone` VALUES ('531', '34', 'Namentenga', 'NAM', '1');
INSERT INTO `zone` VALUES ('532', '34', 'Nayala', 'NAY', '1');
INSERT INTO `zone` VALUES ('533', '34', 'Noumbiel', 'NOU', '1');
INSERT INTO `zone` VALUES ('534', '34', 'Oubritenga', 'OUB', '1');
INSERT INTO `zone` VALUES ('535', '34', 'Oudalan', 'OUD', '1');
INSERT INTO `zone` VALUES ('536', '34', 'Passore', 'PAS', '1');
INSERT INTO `zone` VALUES ('537', '34', 'Poni', 'PON', '1');
INSERT INTO `zone` VALUES ('538', '34', 'Sanguie', 'SAG', '1');
INSERT INTO `zone` VALUES ('539', '34', 'Sanmatenga', 'SAM', '1');
INSERT INTO `zone` VALUES ('540', '34', 'Seno', 'SEN', '1');
INSERT INTO `zone` VALUES ('541', '34', 'Sissili', 'SIS', '1');
INSERT INTO `zone` VALUES ('542', '34', 'Soum', 'SOM', '1');
INSERT INTO `zone` VALUES ('543', '34', 'Sourou', 'SOR', '1');
INSERT INTO `zone` VALUES ('544', '34', 'Tapoa', 'TAP', '1');
INSERT INTO `zone` VALUES ('545', '34', 'Tuy', 'TUY', '1');
INSERT INTO `zone` VALUES ('546', '34', 'Yagha', 'YAG', '1');
INSERT INTO `zone` VALUES ('547', '34', 'Yatenga', 'YAT', '1');
INSERT INTO `zone` VALUES ('548', '34', 'Ziro', 'ZIR', '1');
INSERT INTO `zone` VALUES ('549', '34', 'Zondoma', 'ZOD', '1');
INSERT INTO `zone` VALUES ('550', '34', 'Zoundweogo', 'ZOW', '1');
INSERT INTO `zone` VALUES ('551', '35', 'Bubanza', 'BB', '1');
INSERT INTO `zone` VALUES ('552', '35', 'Bujumbura', 'BJ', '1');
INSERT INTO `zone` VALUES ('553', '35', 'Bururi', 'BR', '1');
INSERT INTO `zone` VALUES ('554', '35', 'Cankuzo', 'CA', '1');
INSERT INTO `zone` VALUES ('555', '35', 'Cibitoke', 'CI', '1');
INSERT INTO `zone` VALUES ('556', '35', 'Gitega', 'GI', '1');
INSERT INTO `zone` VALUES ('557', '35', 'Karuzi', 'KR', '1');
INSERT INTO `zone` VALUES ('558', '35', 'Kayanza', 'KY', '1');
INSERT INTO `zone` VALUES ('559', '35', 'Kirundo', 'KI', '1');
INSERT INTO `zone` VALUES ('560', '35', 'Makamba', 'MA', '1');
INSERT INTO `zone` VALUES ('561', '35', 'Muramvya', 'MU', '1');
INSERT INTO `zone` VALUES ('562', '35', 'Muyinga', 'MY', '1');
INSERT INTO `zone` VALUES ('563', '35', 'Mwaro', 'MW', '1');
INSERT INTO `zone` VALUES ('564', '35', 'Ngozi', 'NG', '1');
INSERT INTO `zone` VALUES ('565', '35', 'Rutana', 'RT', '1');
INSERT INTO `zone` VALUES ('566', '35', 'Ruyigi', 'RY', '1');
INSERT INTO `zone` VALUES ('567', '36', 'Phnom Penh', 'PP', '1');
INSERT INTO `zone` VALUES ('568', '36', 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', '1');
INSERT INTO `zone` VALUES ('569', '36', 'Pailin', 'PA', '1');
INSERT INTO `zone` VALUES ('570', '36', 'Keb', 'KB', '1');
INSERT INTO `zone` VALUES ('571', '36', 'Banteay Meanchey', 'BM', '1');
INSERT INTO `zone` VALUES ('572', '36', 'Battambang', 'BA', '1');
INSERT INTO `zone` VALUES ('573', '36', 'Kampong Cham', 'KM', '1');
INSERT INTO `zone` VALUES ('574', '36', 'Kampong Chhnang', 'KN', '1');
INSERT INTO `zone` VALUES ('575', '36', 'Kampong Speu', 'KU', '1');
INSERT INTO `zone` VALUES ('576', '36', 'Kampong Som', 'KO', '1');
INSERT INTO `zone` VALUES ('577', '36', 'Kampong Thom', 'KT', '1');
INSERT INTO `zone` VALUES ('578', '36', 'Kampot', 'KP', '1');
INSERT INTO `zone` VALUES ('579', '36', 'Kandal', 'KL', '1');
INSERT INTO `zone` VALUES ('580', '36', 'Kaoh Kong', 'KK', '1');
INSERT INTO `zone` VALUES ('581', '36', 'Kratie', 'KR', '1');
INSERT INTO `zone` VALUES ('582', '36', 'Mondul Kiri', 'MK', '1');
INSERT INTO `zone` VALUES ('583', '36', 'Oddar Meancheay', 'OM', '1');
INSERT INTO `zone` VALUES ('584', '36', 'Pursat', 'PU', '1');
INSERT INTO `zone` VALUES ('585', '36', 'Preah Vihear', 'PR', '1');
INSERT INTO `zone` VALUES ('586', '36', 'Prey Veng', 'PG', '1');
INSERT INTO `zone` VALUES ('587', '36', 'Ratanak Kiri', 'RK', '1');
INSERT INTO `zone` VALUES ('588', '36', 'Siemreap', 'SI', '1');
INSERT INTO `zone` VALUES ('589', '36', 'Stung Treng', 'ST', '1');
INSERT INTO `zone` VALUES ('590', '36', 'Svay Rieng', 'SR', '1');
INSERT INTO `zone` VALUES ('591', '36', 'Takeo', 'TK', '1');
INSERT INTO `zone` VALUES ('592', '37', 'Adamawa (Adamaoua)', 'ADA', '1');
INSERT INTO `zone` VALUES ('593', '37', 'Centre', 'CEN', '1');
INSERT INTO `zone` VALUES ('594', '37', 'East (Est)', 'EST', '1');
INSERT INTO `zone` VALUES ('595', '37', 'Extreme North (Extreme-Nord)', 'EXN', '1');
INSERT INTO `zone` VALUES ('596', '37', 'Littoral', 'LIT', '1');
INSERT INTO `zone` VALUES ('597', '37', 'North (Nord)', 'NOR', '1');
INSERT INTO `zone` VALUES ('598', '37', 'Northwest (Nord-Ouest)', 'NOT', '1');
INSERT INTO `zone` VALUES ('599', '37', 'West (Ouest)', 'OUE', '1');
INSERT INTO `zone` VALUES ('600', '37', 'South (Sud)', 'SUD', '1');
INSERT INTO `zone` VALUES ('601', '37', 'Southwest (Sud-Ouest).', 'SOU', '1');
INSERT INTO `zone` VALUES ('602', '38', 'Alberta', 'AB', '1');
INSERT INTO `zone` VALUES ('603', '38', 'British Columbia', 'BC', '1');
INSERT INTO `zone` VALUES ('604', '38', 'Manitoba', 'MB', '1');
INSERT INTO `zone` VALUES ('605', '38', 'New Brunswick', 'NB', '1');
INSERT INTO `zone` VALUES ('606', '38', 'Newfoundland and Labrador', 'NL', '1');
INSERT INTO `zone` VALUES ('607', '38', 'Northwest Territories', 'NT', '1');
INSERT INTO `zone` VALUES ('608', '38', 'Nova Scotia', 'NS', '1');
INSERT INTO `zone` VALUES ('609', '38', 'Nunavut', 'NU', '1');
INSERT INTO `zone` VALUES ('610', '38', 'Ontario', 'ON', '1');
INSERT INTO `zone` VALUES ('611', '38', 'Prince Edward Island', 'PE', '1');
INSERT INTO `zone` VALUES ('612', '38', 'Qu&eacute;bec', 'QC', '1');
INSERT INTO `zone` VALUES ('613', '38', 'Saskatchewan', 'SK', '1');
INSERT INTO `zone` VALUES ('614', '38', 'Yukon Territory', 'YT', '1');
INSERT INTO `zone` VALUES ('615', '39', 'Boa Vista', 'BV', '1');
INSERT INTO `zone` VALUES ('616', '39', 'Brava', 'BR', '1');
INSERT INTO `zone` VALUES ('617', '39', 'Calheta de Sao Miguel', 'CS', '1');
INSERT INTO `zone` VALUES ('618', '39', 'Maio', 'MA', '1');
INSERT INTO `zone` VALUES ('619', '39', 'Mosteiros', 'MO', '1');
INSERT INTO `zone` VALUES ('620', '39', 'Paul', 'PA', '1');
INSERT INTO `zone` VALUES ('621', '39', 'Porto Novo', 'PN', '1');
INSERT INTO `zone` VALUES ('622', '39', 'Praia', 'PR', '1');
INSERT INTO `zone` VALUES ('623', '39', 'Ribeira Grande', 'RG', '1');
INSERT INTO `zone` VALUES ('624', '39', 'Sal', 'SL', '1');
INSERT INTO `zone` VALUES ('625', '39', 'Santa Catarina', 'CA', '1');
INSERT INTO `zone` VALUES ('626', '39', 'Santa Cruz', 'CR', '1');
INSERT INTO `zone` VALUES ('627', '39', 'Sao Domingos', 'SD', '1');
INSERT INTO `zone` VALUES ('628', '39', 'Sao Filipe', 'SF', '1');
INSERT INTO `zone` VALUES ('629', '39', 'Sao Nicolau', 'SN', '1');
INSERT INTO `zone` VALUES ('630', '39', 'Sao Vicente', 'SV', '1');
INSERT INTO `zone` VALUES ('631', '39', 'Tarrafal', 'TA', '1');
INSERT INTO `zone` VALUES ('632', '40', 'Creek', 'CR', '1');
INSERT INTO `zone` VALUES ('633', '40', 'Eastern', 'EA', '1');
INSERT INTO `zone` VALUES ('634', '40', 'Midland', 'ML', '1');
INSERT INTO `zone` VALUES ('635', '40', 'South Town', 'ST', '1');
INSERT INTO `zone` VALUES ('636', '40', 'Spot Bay', 'SP', '1');
INSERT INTO `zone` VALUES ('637', '40', 'Stake Bay', 'SK', '1');
INSERT INTO `zone` VALUES ('638', '40', 'West End', 'WD', '1');
INSERT INTO `zone` VALUES ('639', '40', 'Western', 'WN', '1');
INSERT INTO `zone` VALUES ('640', '41', 'Bamingui-Bangoran', 'BBA', '1');
INSERT INTO `zone` VALUES ('641', '41', 'Basse-Kotto', 'BKO', '1');
INSERT INTO `zone` VALUES ('642', '41', 'Haute-Kotto', 'HKO', '1');
INSERT INTO `zone` VALUES ('643', '41', 'Haut-Mbomou', 'HMB', '1');
INSERT INTO `zone` VALUES ('644', '41', 'Kemo', 'KEM', '1');
INSERT INTO `zone` VALUES ('645', '41', 'Lobaye', 'LOB', '1');
INSERT INTO `zone` VALUES ('646', '41', 'Mambere-KadeÔ', 'MKD', '1');
INSERT INTO `zone` VALUES ('647', '41', 'Mbomou', 'MBO', '1');
INSERT INTO `zone` VALUES ('648', '41', 'Nana-Mambere', 'NMM', '1');
INSERT INTO `zone` VALUES ('649', '41', 'Ombella-M\'Poko', 'OMP', '1');
INSERT INTO `zone` VALUES ('650', '41', 'Ouaka', 'OUK', '1');
INSERT INTO `zone` VALUES ('651', '41', 'Ouham', 'OUH', '1');
INSERT INTO `zone` VALUES ('652', '41', 'Ouham-Pende', 'OPE', '1');
INSERT INTO `zone` VALUES ('653', '41', 'Vakaga', 'VAK', '1');
INSERT INTO `zone` VALUES ('654', '41', 'Nana-Grebizi', 'NGR', '1');
INSERT INTO `zone` VALUES ('655', '41', 'Sangha-Mbaere', 'SMB', '1');
INSERT INTO `zone` VALUES ('656', '41', 'Bangui', 'BAN', '1');
INSERT INTO `zone` VALUES ('657', '42', 'Batha', 'BA', '1');
INSERT INTO `zone` VALUES ('658', '42', 'Biltine', 'BI', '1');
INSERT INTO `zone` VALUES ('659', '42', 'Borkou-Ennedi-Tibesti', 'BE', '1');
INSERT INTO `zone` VALUES ('660', '42', 'Chari-Baguirmi', 'CB', '1');
INSERT INTO `zone` VALUES ('661', '42', 'Guera', 'GU', '1');
INSERT INTO `zone` VALUES ('662', '42', 'Kanem', 'KA', '1');
INSERT INTO `zone` VALUES ('663', '42', 'Lac', 'LA', '1');
INSERT INTO `zone` VALUES ('664', '42', 'Logone Occidental', 'LC', '1');
INSERT INTO `zone` VALUES ('665', '42', 'Logone Oriental', 'LR', '1');
INSERT INTO `zone` VALUES ('666', '42', 'Mayo-Kebbi', 'MK', '1');
INSERT INTO `zone` VALUES ('667', '42', 'Moyen-Chari', 'MC', '1');
INSERT INTO `zone` VALUES ('668', '42', 'Ouaddai', 'OU', '1');
INSERT INTO `zone` VALUES ('669', '42', 'Salamat', 'SA', '1');
INSERT INTO `zone` VALUES ('670', '42', 'Tandjile', 'TA', '1');
INSERT INTO `zone` VALUES ('671', '43', 'Aisen del General Carlos Ibanez', 'AI', '1');
INSERT INTO `zone` VALUES ('672', '43', 'Antofagasta', 'AN', '1');
INSERT INTO `zone` VALUES ('673', '43', 'Araucania', 'AR', '1');
INSERT INTO `zone` VALUES ('674', '43', 'Atacama', 'AT', '1');
INSERT INTO `zone` VALUES ('675', '43', 'Bio-Bio', 'BI', '1');
INSERT INTO `zone` VALUES ('676', '43', 'Coquimbo', 'CO', '1');
INSERT INTO `zone` VALUES ('677', '43', 'Libertador General Bernardo O\'Hi', 'LI', '1');
INSERT INTO `zone` VALUES ('678', '43', 'Los Lagos', 'LL', '1');
INSERT INTO `zone` VALUES ('679', '43', 'Magallanes y de la Antartica Chi', 'MA', '1');
INSERT INTO `zone` VALUES ('680', '43', 'Maule', 'ML', '1');
INSERT INTO `zone` VALUES ('681', '43', 'Region Metropolitana', 'RM', '1');
INSERT INTO `zone` VALUES ('682', '43', 'Tarapaca', 'TA', '1');
INSERT INTO `zone` VALUES ('683', '43', 'Valparaiso', 'VS', '1');
INSERT INTO `zone` VALUES ('684', '44', 'Anhui', 'AN', '1');
INSERT INTO `zone` VALUES ('685', '44', 'Beijing', 'BE', '1');
INSERT INTO `zone` VALUES ('686', '44', 'Chongqing', 'CH', '1');
INSERT INTO `zone` VALUES ('687', '44', 'Fujian', 'FU', '1');
INSERT INTO `zone` VALUES ('688', '44', 'Gansu', 'GA', '1');
INSERT INTO `zone` VALUES ('689', '44', 'Guangdong', 'GU', '1');
INSERT INTO `zone` VALUES ('690', '44', 'Guangxi', 'GX', '1');
INSERT INTO `zone` VALUES ('691', '44', 'Guizhou', 'GZ', '1');
INSERT INTO `zone` VALUES ('692', '44', 'Hainan', 'HA', '1');
INSERT INTO `zone` VALUES ('693', '44', 'Hebei', 'HB', '1');
INSERT INTO `zone` VALUES ('694', '44', 'Heilongjiang', 'HL', '1');
INSERT INTO `zone` VALUES ('695', '44', 'Henan', 'HE', '1');
INSERT INTO `zone` VALUES ('696', '44', 'Hong Kong', 'HK', '1');
INSERT INTO `zone` VALUES ('697', '44', 'Hubei', 'HU', '1');
INSERT INTO `zone` VALUES ('698', '44', 'Hunan', 'HN', '1');
INSERT INTO `zone` VALUES ('699', '44', 'Inner Mongolia', 'IM', '1');
INSERT INTO `zone` VALUES ('700', '44', 'Jiangsu', 'JI', '1');
INSERT INTO `zone` VALUES ('701', '44', 'Jiangxi', 'JX', '1');
INSERT INTO `zone` VALUES ('702', '44', 'Jilin', 'JL', '1');
INSERT INTO `zone` VALUES ('703', '44', 'Liaoning', 'LI', '1');
INSERT INTO `zone` VALUES ('704', '44', 'Macau', 'MA', '1');
INSERT INTO `zone` VALUES ('705', '44', 'Ningxia', 'NI', '1');
INSERT INTO `zone` VALUES ('706', '44', 'Shaanxi', 'SH', '1');
INSERT INTO `zone` VALUES ('707', '44', 'Shandong', 'SA', '1');
INSERT INTO `zone` VALUES ('708', '44', 'Shanghai', 'SG', '1');
INSERT INTO `zone` VALUES ('709', '44', 'Shanxi', 'SX', '1');
INSERT INTO `zone` VALUES ('710', '44', 'Sichuan', 'SI', '1');
INSERT INTO `zone` VALUES ('711', '44', 'Tianjin', 'TI', '1');
INSERT INTO `zone` VALUES ('712', '44', 'Xinjiang', 'XI', '1');
INSERT INTO `zone` VALUES ('713', '44', 'Yunnan', 'YU', '1');
INSERT INTO `zone` VALUES ('714', '44', 'Zhejiang', 'ZH', '1');
INSERT INTO `zone` VALUES ('715', '46', 'Direction Island', 'D', '1');
INSERT INTO `zone` VALUES ('716', '46', 'Home Island', 'H', '1');
INSERT INTO `zone` VALUES ('717', '46', 'Horsburgh Island', 'O', '1');
INSERT INTO `zone` VALUES ('718', '46', 'South Island', 'S', '1');
INSERT INTO `zone` VALUES ('719', '46', 'West Island', 'W', '1');
INSERT INTO `zone` VALUES ('720', '47', 'Amazonas', 'AMZ', '1');
INSERT INTO `zone` VALUES ('721', '47', 'Antioquia', 'ANT', '1');
INSERT INTO `zone` VALUES ('722', '47', 'Arauca', 'ARA', '1');
INSERT INTO `zone` VALUES ('723', '47', 'Atlantico', 'ATL', '1');
INSERT INTO `zone` VALUES ('724', '47', 'Bogota D.C.', 'BDC', '1');
INSERT INTO `zone` VALUES ('725', '47', 'Bolivar', 'BOL', '1');
INSERT INTO `zone` VALUES ('726', '47', 'Boyaca', 'BOY', '1');
INSERT INTO `zone` VALUES ('727', '47', 'Caldas', 'CAL', '1');
INSERT INTO `zone` VALUES ('728', '47', 'Caqueta', 'CAQ', '1');
INSERT INTO `zone` VALUES ('729', '47', 'Casanare', 'CAS', '1');
INSERT INTO `zone` VALUES ('730', '47', 'Cauca', 'CAU', '1');
INSERT INTO `zone` VALUES ('731', '47', 'Cesar', 'CES', '1');
INSERT INTO `zone` VALUES ('732', '47', 'Choco', 'CHO', '1');
INSERT INTO `zone` VALUES ('733', '47', 'Cordoba', 'COR', '1');
INSERT INTO `zone` VALUES ('734', '47', 'Cundinamarca', 'CAM', '1');
INSERT INTO `zone` VALUES ('735', '47', 'Guainia', 'GNA', '1');
INSERT INTO `zone` VALUES ('736', '47', 'Guajira', 'GJR', '1');
INSERT INTO `zone` VALUES ('737', '47', 'Guaviare', 'GVR', '1');
INSERT INTO `zone` VALUES ('738', '47', 'Huila', 'HUI', '1');
INSERT INTO `zone` VALUES ('739', '47', 'Magdalena', 'MAG', '1');
INSERT INTO `zone` VALUES ('740', '47', 'Meta', 'MET', '1');
INSERT INTO `zone` VALUES ('741', '47', 'Narino', 'NAR', '1');
INSERT INTO `zone` VALUES ('742', '47', 'Norte de Santander', 'NDS', '1');
INSERT INTO `zone` VALUES ('743', '47', 'Putumayo', 'PUT', '1');
INSERT INTO `zone` VALUES ('744', '47', 'Quindio', 'QUI', '1');
INSERT INTO `zone` VALUES ('745', '47', 'Risaralda', 'RIS', '1');
INSERT INTO `zone` VALUES ('746', '47', 'San Andres y Providencia', 'SAP', '1');
INSERT INTO `zone` VALUES ('747', '47', 'Santander', 'SAN', '1');
INSERT INTO `zone` VALUES ('748', '47', 'Sucre', 'SUC', '1');
INSERT INTO `zone` VALUES ('749', '47', 'Tolima', 'TOL', '1');
INSERT INTO `zone` VALUES ('750', '47', 'Valle del Cauca', 'VDC', '1');
INSERT INTO `zone` VALUES ('751', '47', 'Vaupes', 'VAU', '1');
INSERT INTO `zone` VALUES ('752', '47', 'Vichada', 'VIC', '1');
INSERT INTO `zone` VALUES ('753', '48', 'Grande Comore', 'G', '1');
INSERT INTO `zone` VALUES ('754', '48', 'Anjouan', 'A', '1');
INSERT INTO `zone` VALUES ('755', '48', 'Moheli', 'M', '1');
INSERT INTO `zone` VALUES ('756', '49', 'Bouenza', 'BO', '1');
INSERT INTO `zone` VALUES ('757', '49', 'Brazzaville', 'BR', '1');
INSERT INTO `zone` VALUES ('758', '49', 'Cuvette', 'CU', '1');
INSERT INTO `zone` VALUES ('759', '49', 'Cuvette-Ouest', 'CO', '1');
INSERT INTO `zone` VALUES ('760', '49', 'Kouilou', 'KO', '1');
INSERT INTO `zone` VALUES ('761', '49', 'Lekoumou', 'LE', '1');
INSERT INTO `zone` VALUES ('762', '49', 'Likouala', 'LI', '1');
INSERT INTO `zone` VALUES ('763', '49', 'Niari', 'NI', '1');
INSERT INTO `zone` VALUES ('764', '49', 'Plateaux', 'PL', '1');
INSERT INTO `zone` VALUES ('765', '49', 'Pool', 'PO', '1');
INSERT INTO `zone` VALUES ('766', '49', 'Sangha', 'SA', '1');
INSERT INTO `zone` VALUES ('767', '50', 'Pukapuka', 'PU', '1');
INSERT INTO `zone` VALUES ('768', '50', 'Rakahanga', 'RK', '1');
INSERT INTO `zone` VALUES ('769', '50', 'Manihiki', 'MK', '1');
INSERT INTO `zone` VALUES ('770', '50', 'Penrhyn', 'PE', '1');
INSERT INTO `zone` VALUES ('771', '50', 'Nassau Island', 'NI', '1');
INSERT INTO `zone` VALUES ('772', '50', 'Surwarrow', 'SU', '1');
INSERT INTO `zone` VALUES ('773', '50', 'Palmerston', 'PA', '1');
INSERT INTO `zone` VALUES ('774', '50', 'Aitutaki', 'AI', '1');
INSERT INTO `zone` VALUES ('775', '50', 'Manuae', 'MA', '1');
INSERT INTO `zone` VALUES ('776', '50', 'Takutea', 'TA', '1');
INSERT INTO `zone` VALUES ('777', '50', 'Mitiaro', 'MT', '1');
INSERT INTO `zone` VALUES ('778', '50', 'Atiu', 'AT', '1');
INSERT INTO `zone` VALUES ('779', '50', 'Mauke', 'MU', '1');
INSERT INTO `zone` VALUES ('780', '50', 'Rarotonga', 'RR', '1');
INSERT INTO `zone` VALUES ('781', '50', 'Mangaia', 'MG', '1');
INSERT INTO `zone` VALUES ('782', '51', 'Alajuela', 'AL', '1');
INSERT INTO `zone` VALUES ('783', '51', 'Cartago', 'CA', '1');
INSERT INTO `zone` VALUES ('784', '51', 'Guanacaste', 'GU', '1');
INSERT INTO `zone` VALUES ('785', '51', 'Heredia', 'HE', '1');
INSERT INTO `zone` VALUES ('786', '51', 'Limon', 'LI', '1');
INSERT INTO `zone` VALUES ('787', '51', 'Puntarenas', 'PU', '1');
INSERT INTO `zone` VALUES ('788', '51', 'San Jose', 'SJ', '1');
INSERT INTO `zone` VALUES ('789', '52', 'Abengourou', 'ABE', '1');
INSERT INTO `zone` VALUES ('790', '52', 'Abidjan', 'ABI', '1');
INSERT INTO `zone` VALUES ('791', '52', 'Aboisso', 'ABO', '1');
INSERT INTO `zone` VALUES ('792', '52', 'Adiake', 'ADI', '1');
INSERT INTO `zone` VALUES ('793', '52', 'Adzope', 'ADZ', '1');
INSERT INTO `zone` VALUES ('794', '52', 'Agboville', 'AGB', '1');
INSERT INTO `zone` VALUES ('795', '52', 'Agnibilekrou', 'AGN', '1');
INSERT INTO `zone` VALUES ('796', '52', 'Alepe', 'ALE', '1');
INSERT INTO `zone` VALUES ('797', '52', 'Bocanda', 'BOC', '1');
INSERT INTO `zone` VALUES ('798', '52', 'Bangolo', 'BAN', '1');
INSERT INTO `zone` VALUES ('799', '52', 'Beoumi', 'BEO', '1');
INSERT INTO `zone` VALUES ('800', '52', 'Biankouma', 'BIA', '1');
INSERT INTO `zone` VALUES ('801', '52', 'Bondoukou', 'BDK', '1');
INSERT INTO `zone` VALUES ('802', '52', 'Bongouanou', 'BGN', '1');
INSERT INTO `zone` VALUES ('803', '52', 'Bouafle', 'BFL', '1');
INSERT INTO `zone` VALUES ('804', '52', 'Bouake', 'BKE', '1');
INSERT INTO `zone` VALUES ('805', '52', 'Bouna', 'BNA', '1');
INSERT INTO `zone` VALUES ('806', '52', 'Boundiali', 'BDL', '1');
INSERT INTO `zone` VALUES ('807', '52', 'Dabakala', 'DKL', '1');
INSERT INTO `zone` VALUES ('808', '52', 'Dabou', 'DBU', '1');
INSERT INTO `zone` VALUES ('809', '52', 'Daloa', 'DAL', '1');
INSERT INTO `zone` VALUES ('810', '52', 'Danane', 'DAN', '1');
INSERT INTO `zone` VALUES ('811', '52', 'Daoukro', 'DAO', '1');
INSERT INTO `zone` VALUES ('812', '52', 'Dimbokro', 'DIM', '1');
INSERT INTO `zone` VALUES ('813', '52', 'Divo', 'DIV', '1');
INSERT INTO `zone` VALUES ('814', '52', 'Duekoue', 'DUE', '1');
INSERT INTO `zone` VALUES ('815', '52', 'Ferkessedougou', 'FER', '1');
INSERT INTO `zone` VALUES ('816', '52', 'Gagnoa', 'GAG', '1');
INSERT INTO `zone` VALUES ('817', '52', 'Grand-Bassam', 'GBA', '1');
INSERT INTO `zone` VALUES ('818', '52', 'Grand-Lahou', 'GLA', '1');
INSERT INTO `zone` VALUES ('819', '52', 'Guiglo', 'GUI', '1');
INSERT INTO `zone` VALUES ('820', '52', 'Issia', 'ISS', '1');
INSERT INTO `zone` VALUES ('821', '52', 'Jacqueville', 'JAC', '1');
INSERT INTO `zone` VALUES ('822', '52', 'Katiola', 'KAT', '1');
INSERT INTO `zone` VALUES ('823', '52', 'Korhogo', 'KOR', '1');
INSERT INTO `zone` VALUES ('824', '52', 'Lakota', 'LAK', '1');
INSERT INTO `zone` VALUES ('825', '52', 'Man', 'MAN', '1');
INSERT INTO `zone` VALUES ('826', '52', 'Mankono', 'MKN', '1');
INSERT INTO `zone` VALUES ('827', '52', 'Mbahiakro', 'MBA', '1');
INSERT INTO `zone` VALUES ('828', '52', 'Odienne', 'ODI', '1');
INSERT INTO `zone` VALUES ('829', '52', 'Oume', 'OUM', '1');
INSERT INTO `zone` VALUES ('830', '52', 'Sakassou', 'SAK', '1');
INSERT INTO `zone` VALUES ('831', '52', 'San-Pedro', 'SPE', '1');
INSERT INTO `zone` VALUES ('832', '52', 'Sassandra', 'SAS', '1');
INSERT INTO `zone` VALUES ('833', '52', 'Seguela', 'SEG', '1');
INSERT INTO `zone` VALUES ('834', '52', 'Sinfra', 'SIN', '1');
INSERT INTO `zone` VALUES ('835', '52', 'Soubre', 'SOU', '1');
INSERT INTO `zone` VALUES ('836', '52', 'Tabou', 'TAB', '1');
INSERT INTO `zone` VALUES ('837', '52', 'Tanda', 'TAN', '1');
INSERT INTO `zone` VALUES ('838', '52', 'Tiebissou', 'TIE', '1');
INSERT INTO `zone` VALUES ('839', '52', 'Tingrela', 'TIN', '1');
INSERT INTO `zone` VALUES ('840', '52', 'Tiassale', 'TIA', '1');
INSERT INTO `zone` VALUES ('841', '52', 'Touba', 'TBA', '1');
INSERT INTO `zone` VALUES ('842', '52', 'Toulepleu', 'TLP', '1');
INSERT INTO `zone` VALUES ('843', '52', 'Toumodi', 'TMD', '1');
INSERT INTO `zone` VALUES ('844', '52', 'Vavoua', 'VAV', '1');
INSERT INTO `zone` VALUES ('845', '52', 'Yamoussoukro', 'YAM', '1');
INSERT INTO `zone` VALUES ('846', '52', 'Zuenoula', 'ZUE', '1');
INSERT INTO `zone` VALUES ('847', '53', 'Bjelovar-Bilogora', 'BB', '1');
INSERT INTO `zone` VALUES ('848', '53', 'City of Zagreb', 'CZ', '1');
INSERT INTO `zone` VALUES ('849', '53', 'Dubrovnik-Neretva', 'DN', '1');
INSERT INTO `zone` VALUES ('850', '53', 'Istra', 'IS', '1');
INSERT INTO `zone` VALUES ('851', '53', 'Karlovac', 'KA', '1');
INSERT INTO `zone` VALUES ('852', '53', 'Koprivnica-Krizevci', 'KK', '1');
INSERT INTO `zone` VALUES ('853', '53', 'Krapina-Zagorje', 'KZ', '1');
INSERT INTO `zone` VALUES ('854', '53', 'Lika-Senj', 'LS', '1');
INSERT INTO `zone` VALUES ('855', '53', 'Medimurje', 'ME', '1');
INSERT INTO `zone` VALUES ('856', '53', 'Osijek-Baranja', 'OB', '1');
INSERT INTO `zone` VALUES ('857', '53', 'Pozega-Slavonia', 'PS', '1');
INSERT INTO `zone` VALUES ('858', '53', 'Primorje-Gorski Kotar', 'PG', '1');
INSERT INTO `zone` VALUES ('859', '53', 'Sibenik', 'SI', '1');
INSERT INTO `zone` VALUES ('860', '53', 'Sisak-Moslavina', 'SM', '1');
INSERT INTO `zone` VALUES ('861', '53', 'Slavonski Brod-Posavina', 'SB', '1');
INSERT INTO `zone` VALUES ('862', '53', 'Split-Dalmatia', 'SD', '1');
INSERT INTO `zone` VALUES ('863', '53', 'Varazdin', 'VA', '1');
INSERT INTO `zone` VALUES ('864', '53', 'Virovitica-Podravina', 'VP', '1');
INSERT INTO `zone` VALUES ('865', '53', 'Vukovar-Srijem', 'VS', '1');
INSERT INTO `zone` VALUES ('866', '53', 'Zadar-Knin', 'ZK', '1');
INSERT INTO `zone` VALUES ('867', '53', 'Zagreb', 'ZA', '1');
INSERT INTO `zone` VALUES ('868', '54', 'Camaguey', 'CA', '1');
INSERT INTO `zone` VALUES ('869', '54', 'Ciego de Avila', 'CD', '1');
INSERT INTO `zone` VALUES ('870', '54', 'Cienfuegos', 'CI', '1');
INSERT INTO `zone` VALUES ('871', '54', 'Ciudad de La Habana', 'CH', '1');
INSERT INTO `zone` VALUES ('872', '54', 'Granma', 'GR', '1');
INSERT INTO `zone` VALUES ('873', '54', 'Guantanamo', 'GU', '1');
INSERT INTO `zone` VALUES ('874', '54', 'Holguin', 'HO', '1');
INSERT INTO `zone` VALUES ('875', '54', 'Isla de la Juventud', 'IJ', '1');
INSERT INTO `zone` VALUES ('876', '54', 'La Habana', 'LH', '1');
INSERT INTO `zone` VALUES ('877', '54', 'Las Tunas', 'LT', '1');
INSERT INTO `zone` VALUES ('878', '54', 'Matanzas', 'MA', '1');
INSERT INTO `zone` VALUES ('879', '54', 'Pinar del Rio', 'PR', '1');
INSERT INTO `zone` VALUES ('880', '54', 'Sancti Spiritus', 'SS', '1');
INSERT INTO `zone` VALUES ('881', '54', 'Santiago de Cuba', 'SC', '1');
INSERT INTO `zone` VALUES ('882', '54', 'Villa Clara', 'VC', '1');
INSERT INTO `zone` VALUES ('883', '55', 'Famagusta', 'F', '1');
INSERT INTO `zone` VALUES ('884', '55', 'Kyrenia', 'K', '1');
INSERT INTO `zone` VALUES ('885', '55', 'Larnaca', 'A', '1');
INSERT INTO `zone` VALUES ('886', '55', 'Limassol', 'I', '1');
INSERT INTO `zone` VALUES ('887', '55', 'Nicosia', 'N', '1');
INSERT INTO `zone` VALUES ('888', '55', 'Paphos', 'P', '1');
INSERT INTO `zone` VALUES ('889', '56', 'Ústecký', 'U', '1');
INSERT INTO `zone` VALUES ('890', '56', 'Jihočeský', 'C', '1');
INSERT INTO `zone` VALUES ('891', '56', 'Jihomoravský', 'B', '1');
INSERT INTO `zone` VALUES ('892', '56', 'Karlovarský', 'K', '1');
INSERT INTO `zone` VALUES ('893', '56', 'Královehradecký', 'H', '1');
INSERT INTO `zone` VALUES ('894', '56', 'Liberecký', 'L', '1');
INSERT INTO `zone` VALUES ('895', '56', 'Moravskoslezský', 'T', '1');
INSERT INTO `zone` VALUES ('896', '56', 'Olomoucký', 'M', '1');
INSERT INTO `zone` VALUES ('897', '56', 'Pardubický', 'E', '1');
INSERT INTO `zone` VALUES ('898', '56', 'Plzeňský', 'P', '1');
INSERT INTO `zone` VALUES ('899', '56', 'Praha', 'A', '1');
INSERT INTO `zone` VALUES ('900', '56', 'Středočeský', 'S', '1');
INSERT INTO `zone` VALUES ('901', '56', 'Vysočina', 'J', '1');
INSERT INTO `zone` VALUES ('902', '56', 'Zlínský', 'Z', '1');
INSERT INTO `zone` VALUES ('903', '57', 'Arhus', 'AR', '1');
INSERT INTO `zone` VALUES ('904', '57', 'Bornholm', 'BH', '1');
INSERT INTO `zone` VALUES ('905', '57', 'Copenhagen', 'CO', '1');
INSERT INTO `zone` VALUES ('906', '57', 'Faroe Islands', 'FO', '1');
INSERT INTO `zone` VALUES ('907', '57', 'Frederiksborg', 'FR', '1');
INSERT INTO `zone` VALUES ('908', '57', 'Fyn', 'FY', '1');
INSERT INTO `zone` VALUES ('909', '57', 'Kobenhavn', 'KO', '1');
INSERT INTO `zone` VALUES ('910', '57', 'Nordjylland', 'NO', '1');
INSERT INTO `zone` VALUES ('911', '57', 'Ribe', 'RI', '1');
INSERT INTO `zone` VALUES ('912', '57', 'Ringkobing', 'RK', '1');
INSERT INTO `zone` VALUES ('913', '57', 'Roskilde', 'RO', '1');
INSERT INTO `zone` VALUES ('914', '57', 'Sonderjylland', 'SO', '1');
INSERT INTO `zone` VALUES ('915', '57', 'Storstrom', 'ST', '1');
INSERT INTO `zone` VALUES ('916', '57', 'Vejle', 'VK', '1');
INSERT INTO `zone` VALUES ('917', '57', 'Vestj&aelig;lland', 'VJ', '1');
INSERT INTO `zone` VALUES ('918', '57', 'Viborg', 'VB', '1');
INSERT INTO `zone` VALUES ('919', '58', '\'Ali Sabih', 'S', '1');
INSERT INTO `zone` VALUES ('920', '58', 'Dikhil', 'K', '1');
INSERT INTO `zone` VALUES ('921', '58', 'Djibouti', 'J', '1');
INSERT INTO `zone` VALUES ('922', '58', 'Obock', 'O', '1');
INSERT INTO `zone` VALUES ('923', '58', 'Tadjoura', 'T', '1');
INSERT INTO `zone` VALUES ('924', '59', 'Saint Andrew Parish', 'AND', '1');
INSERT INTO `zone` VALUES ('925', '59', 'Saint David Parish', 'DAV', '1');
INSERT INTO `zone` VALUES ('926', '59', 'Saint George Parish', 'GEO', '1');
INSERT INTO `zone` VALUES ('927', '59', 'Saint John Parish', 'JOH', '1');
INSERT INTO `zone` VALUES ('928', '59', 'Saint Joseph Parish', 'JOS', '1');
INSERT INTO `zone` VALUES ('929', '59', 'Saint Luke Parish', 'LUK', '1');
INSERT INTO `zone` VALUES ('930', '59', 'Saint Mark Parish', 'MAR', '1');
INSERT INTO `zone` VALUES ('931', '59', 'Saint Patrick Parish', 'PAT', '1');
INSERT INTO `zone` VALUES ('932', '59', 'Saint Paul Parish', 'PAU', '1');
INSERT INTO `zone` VALUES ('933', '59', 'Saint Peter Parish', 'PET', '1');
INSERT INTO `zone` VALUES ('934', '60', 'Distrito Nacional', 'DN', '1');
INSERT INTO `zone` VALUES ('935', '60', 'Azua', 'AZ', '1');
INSERT INTO `zone` VALUES ('936', '60', 'Baoruco', 'BC', '1');
INSERT INTO `zone` VALUES ('937', '60', 'Barahona', 'BH', '1');
INSERT INTO `zone` VALUES ('938', '60', 'Dajabon', 'DJ', '1');
INSERT INTO `zone` VALUES ('939', '60', 'Duarte', 'DU', '1');
INSERT INTO `zone` VALUES ('940', '60', 'Elias Pina', 'EL', '1');
INSERT INTO `zone` VALUES ('941', '60', 'El Seybo', 'SY', '1');
INSERT INTO `zone` VALUES ('942', '60', 'Espaillat', 'ET', '1');
INSERT INTO `zone` VALUES ('943', '60', 'Hato Mayor', 'HM', '1');
INSERT INTO `zone` VALUES ('944', '60', 'Independencia', 'IN', '1');
INSERT INTO `zone` VALUES ('945', '60', 'La Altagracia', 'AL', '1');
INSERT INTO `zone` VALUES ('946', '60', 'La Romana', 'RO', '1');
INSERT INTO `zone` VALUES ('947', '60', 'La Vega', 'VE', '1');
INSERT INTO `zone` VALUES ('948', '60', 'Maria Trinidad Sanchez', 'MT', '1');
INSERT INTO `zone` VALUES ('949', '60', 'Monsenor Nouel', 'MN', '1');
INSERT INTO `zone` VALUES ('950', '60', 'Monte Cristi', 'MC', '1');
INSERT INTO `zone` VALUES ('951', '60', 'Monte Plata', 'MP', '1');
INSERT INTO `zone` VALUES ('952', '60', 'Pedernales', 'PD', '1');
INSERT INTO `zone` VALUES ('953', '60', 'Peravia (Bani)', 'PR', '1');
INSERT INTO `zone` VALUES ('954', '60', 'Puerto Plata', 'PP', '1');
INSERT INTO `zone` VALUES ('955', '60', 'Salcedo', 'SL', '1');
INSERT INTO `zone` VALUES ('956', '60', 'Samana', 'SM', '1');
INSERT INTO `zone` VALUES ('957', '60', 'Sanchez Ramirez', 'SH', '1');
INSERT INTO `zone` VALUES ('958', '60', 'San Cristobal', 'SC', '1');
INSERT INTO `zone` VALUES ('959', '60', 'San Jose de Ocoa', 'JO', '1');
INSERT INTO `zone` VALUES ('960', '60', 'San Juan', 'SJ', '1');
INSERT INTO `zone` VALUES ('961', '60', 'San Pedro de Macoris', 'PM', '1');
INSERT INTO `zone` VALUES ('962', '60', 'Santiago', 'SA', '1');
INSERT INTO `zone` VALUES ('963', '60', 'Santiago Rodriguez', 'ST', '1');
INSERT INTO `zone` VALUES ('964', '60', 'Santo Domingo', 'SD', '1');
INSERT INTO `zone` VALUES ('965', '60', 'Valverde', 'VA', '1');
INSERT INTO `zone` VALUES ('966', '61', 'Aileu', 'AL', '1');
INSERT INTO `zone` VALUES ('967', '61', 'Ainaro', 'AN', '1');
INSERT INTO `zone` VALUES ('968', '61', 'Baucau', 'BA', '1');
INSERT INTO `zone` VALUES ('969', '61', 'Bobonaro', 'BO', '1');
INSERT INTO `zone` VALUES ('970', '61', 'Cova Lima', 'CO', '1');
INSERT INTO `zone` VALUES ('971', '61', 'Dili', 'DI', '1');
INSERT INTO `zone` VALUES ('972', '61', 'Ermera', 'ER', '1');
INSERT INTO `zone` VALUES ('973', '61', 'Lautem', 'LA', '1');
INSERT INTO `zone` VALUES ('974', '61', 'Liquica', 'LI', '1');
INSERT INTO `zone` VALUES ('975', '61', 'Manatuto', 'MT', '1');
INSERT INTO `zone` VALUES ('976', '61', 'Manufahi', 'MF', '1');
INSERT INTO `zone` VALUES ('977', '61', 'Oecussi', 'OE', '1');
INSERT INTO `zone` VALUES ('978', '61', 'Viqueque', 'VI', '1');
INSERT INTO `zone` VALUES ('979', '62', 'Azuay', 'AZU', '1');
INSERT INTO `zone` VALUES ('980', '62', 'Bolivar', 'BOL', '1');
INSERT INTO `zone` VALUES ('981', '62', 'Ca&ntilde;ar', 'CAN', '1');
INSERT INTO `zone` VALUES ('982', '62', 'Carchi', 'CAR', '1');
INSERT INTO `zone` VALUES ('983', '62', 'Chimborazo', 'CHI', '1');
INSERT INTO `zone` VALUES ('984', '62', 'Cotopaxi', 'COT', '1');
INSERT INTO `zone` VALUES ('985', '62', 'El Oro', 'EOR', '1');
INSERT INTO `zone` VALUES ('986', '62', 'Esmeraldas', 'ESM', '1');
INSERT INTO `zone` VALUES ('987', '62', 'Gal&aacute;pagos', 'GPS', '1');
INSERT INTO `zone` VALUES ('988', '62', 'Guayas', 'GUA', '1');
INSERT INTO `zone` VALUES ('989', '62', 'Imbabura', 'IMB', '1');
INSERT INTO `zone` VALUES ('990', '62', 'Loja', 'LOJ', '1');
INSERT INTO `zone` VALUES ('991', '62', 'Los Rios', 'LRO', '1');
INSERT INTO `zone` VALUES ('992', '62', 'Manab&iacute;', 'MAN', '1');
INSERT INTO `zone` VALUES ('993', '62', 'Morona Santiago', 'MSA', '1');
INSERT INTO `zone` VALUES ('994', '62', 'Napo', 'NAP', '1');
INSERT INTO `zone` VALUES ('995', '62', 'Orellana', 'ORE', '1');
INSERT INTO `zone` VALUES ('996', '62', 'Pastaza', 'PAS', '1');
INSERT INTO `zone` VALUES ('997', '62', 'Pichincha', 'PIC', '1');
INSERT INTO `zone` VALUES ('998', '62', 'Sucumb&iacute;os', 'SUC', '1');
INSERT INTO `zone` VALUES ('999', '62', 'Tungurahua', 'TUN', '1');
INSERT INTO `zone` VALUES ('1000', '62', 'Zamora Chinchipe', 'ZCH', '1');
INSERT INTO `zone` VALUES ('1001', '63', 'Ad Daqahliyah', 'DHY', '1');
INSERT INTO `zone` VALUES ('1002', '63', 'Al Bahr al Ahmar', 'BAM', '1');
INSERT INTO `zone` VALUES ('1003', '63', 'Al Buhayrah', 'BHY', '1');
INSERT INTO `zone` VALUES ('1004', '63', 'Al Fayyum', 'FYM', '1');
INSERT INTO `zone` VALUES ('1005', '63', 'Al Gharbiyah', 'GBY', '1');
INSERT INTO `zone` VALUES ('1006', '63', 'Al Iskandariyah', 'IDR', '1');
INSERT INTO `zone` VALUES ('1007', '63', 'Al Isma\'iliyah', 'IML', '1');
INSERT INTO `zone` VALUES ('1008', '63', 'Al Jizah', 'JZH', '1');
INSERT INTO `zone` VALUES ('1009', '63', 'Al Minufiyah', 'MFY', '1');
INSERT INTO `zone` VALUES ('1010', '63', 'Al Minya', 'MNY', '1');
INSERT INTO `zone` VALUES ('1011', '63', 'Al Qahirah', 'QHR', '1');
INSERT INTO `zone` VALUES ('1012', '63', 'Al Qalyubiyah', 'QLY', '1');
INSERT INTO `zone` VALUES ('1013', '63', 'Al Wadi al Jadid', 'WJD', '1');
INSERT INTO `zone` VALUES ('1014', '63', 'Ash Sharqiyah', 'SHQ', '1');
INSERT INTO `zone` VALUES ('1015', '63', 'As Suways', 'SWY', '1');
INSERT INTO `zone` VALUES ('1016', '63', 'Aswan', 'ASW', '1');
INSERT INTO `zone` VALUES ('1017', '63', 'Asyut', 'ASY', '1');
INSERT INTO `zone` VALUES ('1018', '63', 'Bani Suwayf', 'BSW', '1');
INSERT INTO `zone` VALUES ('1019', '63', 'Bur Sa\'id', 'BSD', '1');
INSERT INTO `zone` VALUES ('1020', '63', 'Dumyat', 'DMY', '1');
INSERT INTO `zone` VALUES ('1021', '63', 'Janub Sina\'', 'JNS', '1');
INSERT INTO `zone` VALUES ('1022', '63', 'Kafr ash Shaykh', 'KSH', '1');
INSERT INTO `zone` VALUES ('1023', '63', 'Matruh', 'MAT', '1');
INSERT INTO `zone` VALUES ('1024', '63', 'Qina', 'QIN', '1');
INSERT INTO `zone` VALUES ('1025', '63', 'Shamal Sina\'', 'SHS', '1');
INSERT INTO `zone` VALUES ('1026', '63', 'Suhaj', 'SUH', '1');
INSERT INTO `zone` VALUES ('1027', '64', 'Ahuachapan', 'AH', '1');
INSERT INTO `zone` VALUES ('1028', '64', 'Cabanas', 'CA', '1');
INSERT INTO `zone` VALUES ('1029', '64', 'Chalatenango', 'CH', '1');
INSERT INTO `zone` VALUES ('1030', '64', 'Cuscatlan', 'CU', '1');
INSERT INTO `zone` VALUES ('1031', '64', 'La Libertad', 'LB', '1');
INSERT INTO `zone` VALUES ('1032', '64', 'La Paz', 'PZ', '1');
INSERT INTO `zone` VALUES ('1033', '64', 'La Union', 'UN', '1');
INSERT INTO `zone` VALUES ('1034', '64', 'Morazan', 'MO', '1');
INSERT INTO `zone` VALUES ('1035', '64', 'San Miguel', 'SM', '1');
INSERT INTO `zone` VALUES ('1036', '64', 'San Salvador', 'SS', '1');
INSERT INTO `zone` VALUES ('1037', '64', 'San Vicente', 'SV', '1');
INSERT INTO `zone` VALUES ('1038', '64', 'Santa Ana', 'SA', '1');
INSERT INTO `zone` VALUES ('1039', '64', 'Sonsonate', 'SO', '1');
INSERT INTO `zone` VALUES ('1040', '64', 'Usulutan', 'US', '1');
INSERT INTO `zone` VALUES ('1041', '65', 'Provincia Annobon', 'AN', '1');
INSERT INTO `zone` VALUES ('1042', '65', 'Provincia Bioko Norte', 'BN', '1');
INSERT INTO `zone` VALUES ('1043', '65', 'Provincia Bioko Sur', 'BS', '1');
INSERT INTO `zone` VALUES ('1044', '65', 'Provincia Centro Sur', 'CS', '1');
INSERT INTO `zone` VALUES ('1045', '65', 'Provincia Kie-Ntem', 'KN', '1');
INSERT INTO `zone` VALUES ('1046', '65', 'Provincia Litoral', 'LI', '1');
INSERT INTO `zone` VALUES ('1047', '65', 'Provincia Wele-Nzas', 'WN', '1');
INSERT INTO `zone` VALUES ('1048', '66', 'Central (Maekel)', 'MA', '1');
INSERT INTO `zone` VALUES ('1049', '66', 'Anseba (Keren)', 'KE', '1');
INSERT INTO `zone` VALUES ('1050', '66', 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', '1');
INSERT INTO `zone` VALUES ('1051', '66', 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', '1');
INSERT INTO `zone` VALUES ('1052', '66', 'Southern (Debub)', 'DE', '1');
INSERT INTO `zone` VALUES ('1053', '66', 'Gash-Barka (Barentu)', 'BR', '1');
INSERT INTO `zone` VALUES ('1054', '67', 'Harjumaa (Tallinn)', 'HA', '1');
INSERT INTO `zone` VALUES ('1055', '67', 'Hiiumaa (Kardla)', 'HI', '1');
INSERT INTO `zone` VALUES ('1056', '67', 'Ida-Virumaa (Johvi)', 'IV', '1');
INSERT INTO `zone` VALUES ('1057', '67', 'Jarvamaa (Paide)', 'JA', '1');
INSERT INTO `zone` VALUES ('1058', '67', 'Jogevamaa (Jogeva)', 'JO', '1');
INSERT INTO `zone` VALUES ('1059', '67', 'Laane-Virumaa (Rakvere)', 'LV', '1');
INSERT INTO `zone` VALUES ('1060', '67', 'Laanemaa (Haapsalu)', 'LA', '1');
INSERT INTO `zone` VALUES ('1061', '67', 'Parnumaa (Parnu)', 'PA', '1');
INSERT INTO `zone` VALUES ('1062', '67', 'Polvamaa (Polva)', 'PO', '1');
INSERT INTO `zone` VALUES ('1063', '67', 'Raplamaa (Rapla)', 'RA', '1');
INSERT INTO `zone` VALUES ('1064', '67', 'Saaremaa (Kuessaare)', 'SA', '1');
INSERT INTO `zone` VALUES ('1065', '67', 'Tartumaa (Tartu)', 'TA', '1');
INSERT INTO `zone` VALUES ('1066', '67', 'Valgamaa (Valga)', 'VA', '1');
INSERT INTO `zone` VALUES ('1067', '67', 'Viljandimaa (Viljandi)', 'VI', '1');
INSERT INTO `zone` VALUES ('1068', '67', 'Vorumaa (Voru)', 'VO', '1');
INSERT INTO `zone` VALUES ('1069', '68', 'Afar', 'AF', '1');
INSERT INTO `zone` VALUES ('1070', '68', 'Amhara', 'AH', '1');
INSERT INTO `zone` VALUES ('1071', '68', 'Benishangul-Gumaz', 'BG', '1');
INSERT INTO `zone` VALUES ('1072', '68', 'Gambela', 'GB', '1');
INSERT INTO `zone` VALUES ('1073', '68', 'Hariai', 'HR', '1');
INSERT INTO `zone` VALUES ('1074', '68', 'Oromia', 'OR', '1');
INSERT INTO `zone` VALUES ('1075', '68', 'Somali', 'SM', '1');
INSERT INTO `zone` VALUES ('1076', '68', 'Southern Nations - Nationalities and Peoples Region', 'SN', '1');
INSERT INTO `zone` VALUES ('1077', '68', 'Tigray', 'TG', '1');
INSERT INTO `zone` VALUES ('1078', '68', 'Addis Ababa', 'AA', '1');
INSERT INTO `zone` VALUES ('1079', '68', 'Dire Dawa', 'DD', '1');
INSERT INTO `zone` VALUES ('1080', '71', 'Central Division', 'C', '1');
INSERT INTO `zone` VALUES ('1081', '71', 'Northern Division', 'N', '1');
INSERT INTO `zone` VALUES ('1082', '71', 'Eastern Division', 'E', '1');
INSERT INTO `zone` VALUES ('1083', '71', 'Western Division', 'W', '1');
INSERT INTO `zone` VALUES ('1084', '71', 'Rotuma', 'R', '1');
INSERT INTO `zone` VALUES ('1085', '72', 'Ahvenanmaan Laani', 'AL', '1');
INSERT INTO `zone` VALUES ('1086', '72', 'Etela-Suomen Laani', 'ES', '1');
INSERT INTO `zone` VALUES ('1087', '72', 'Ita-Suomen Laani', 'IS', '1');
INSERT INTO `zone` VALUES ('1088', '72', 'Lansi-Suomen Laani', 'LS', '1');
INSERT INTO `zone` VALUES ('1089', '72', 'Lapin Lanani', 'LA', '1');
INSERT INTO `zone` VALUES ('1090', '72', 'Oulun Laani', 'OU', '1');
INSERT INTO `zone` VALUES ('1114', '74', 'Ain', '01', '1');
INSERT INTO `zone` VALUES ('1115', '74', 'Aisne', '02', '1');
INSERT INTO `zone` VALUES ('1116', '74', 'Allier', '03', '1');
INSERT INTO `zone` VALUES ('1117', '74', 'Alpes de Haute Provence', '04', '1');
INSERT INTO `zone` VALUES ('1118', '74', 'Hautes-Alpes', '05', '1');
INSERT INTO `zone` VALUES ('1119', '74', 'Alpes Maritimes', '06', '1');
INSERT INTO `zone` VALUES ('1120', '74', 'Ard&egrave;che', '07', '1');
INSERT INTO `zone` VALUES ('1121', '74', 'Ardennes', '08', '1');
INSERT INTO `zone` VALUES ('1122', '74', 'Ari&egrave;ge', '09', '1');
INSERT INTO `zone` VALUES ('1123', '74', 'Aube', '10', '1');
INSERT INTO `zone` VALUES ('1124', '74', 'Aude', '11', '1');
INSERT INTO `zone` VALUES ('1125', '74', 'Aveyron', '12', '1');
INSERT INTO `zone` VALUES ('1126', '74', 'Bouches du Rh&ocirc;ne', '13', '1');
INSERT INTO `zone` VALUES ('1127', '74', 'Calvados', '14', '1');
INSERT INTO `zone` VALUES ('1128', '74', 'Cantal', '15', '1');
INSERT INTO `zone` VALUES ('1129', '74', 'Charente', '16', '1');
INSERT INTO `zone` VALUES ('1130', '74', 'Charente Maritime', '17', '1');
INSERT INTO `zone` VALUES ('1131', '74', 'Cher', '18', '1');
INSERT INTO `zone` VALUES ('1132', '74', 'Corr&egrave;ze', '19', '1');
INSERT INTO `zone` VALUES ('1133', '74', 'Corse du Sud', '2A', '1');
INSERT INTO `zone` VALUES ('1134', '74', 'Haute Corse', '2B', '1');
INSERT INTO `zone` VALUES ('1135', '74', 'C&ocirc;te d&#039;or', '21', '1');
INSERT INTO `zone` VALUES ('1136', '74', 'C&ocirc;tes d&#039;Armor', '22', '1');
INSERT INTO `zone` VALUES ('1137', '74', 'Creuse', '23', '1');
INSERT INTO `zone` VALUES ('1138', '74', 'Dordogne', '24', '1');
INSERT INTO `zone` VALUES ('1139', '74', 'Doubs', '25', '1');
INSERT INTO `zone` VALUES ('1140', '74', 'Dr&ocirc;me', '26', '1');
INSERT INTO `zone` VALUES ('1141', '74', 'Eure', '27', '1');
INSERT INTO `zone` VALUES ('1142', '74', 'Eure et Loir', '28', '1');
INSERT INTO `zone` VALUES ('1143', '74', 'Finist&egrave;re', '29', '1');
INSERT INTO `zone` VALUES ('1144', '74', 'Gard', '30', '1');
INSERT INTO `zone` VALUES ('1145', '74', 'Haute Garonne', '31', '1');
INSERT INTO `zone` VALUES ('1146', '74', 'Gers', '32', '1');
INSERT INTO `zone` VALUES ('1147', '74', 'Gironde', '33', '1');
INSERT INTO `zone` VALUES ('1148', '74', 'H&eacute;rault', '34', '1');
INSERT INTO `zone` VALUES ('1149', '74', 'Ille et Vilaine', '35', '1');
INSERT INTO `zone` VALUES ('1150', '74', 'Indre', '36', '1');
INSERT INTO `zone` VALUES ('1151', '74', 'Indre et Loire', '37', '1');
INSERT INTO `zone` VALUES ('1152', '74', 'Is&eacute;re', '38', '1');
INSERT INTO `zone` VALUES ('1153', '74', 'Jura', '39', '1');
INSERT INTO `zone` VALUES ('1154', '74', 'Landes', '40', '1');
INSERT INTO `zone` VALUES ('1155', '74', 'Loir et Cher', '41', '1');
INSERT INTO `zone` VALUES ('1156', '74', 'Loire', '42', '1');
INSERT INTO `zone` VALUES ('1157', '74', 'Haute Loire', '43', '1');
INSERT INTO `zone` VALUES ('1158', '74', 'Loire Atlantique', '44', '1');
INSERT INTO `zone` VALUES ('1159', '74', 'Loiret', '45', '1');
INSERT INTO `zone` VALUES ('1160', '74', 'Lot', '46', '1');
INSERT INTO `zone` VALUES ('1161', '74', 'Lot et Garonne', '47', '1');
INSERT INTO `zone` VALUES ('1162', '74', 'Loz&egrave;re', '48', '1');
INSERT INTO `zone` VALUES ('1163', '74', 'Maine et Loire', '49', '1');
INSERT INTO `zone` VALUES ('1164', '74', 'Manche', '50', '1');
INSERT INTO `zone` VALUES ('1165', '74', 'Marne', '51', '1');
INSERT INTO `zone` VALUES ('1166', '74', 'Haute Marne', '52', '1');
INSERT INTO `zone` VALUES ('1167', '74', 'Mayenne', '53', '1');
INSERT INTO `zone` VALUES ('1168', '74', 'Meurthe et Moselle', '54', '1');
INSERT INTO `zone` VALUES ('1169', '74', 'Meuse', '55', '1');
INSERT INTO `zone` VALUES ('1170', '74', 'Morbihan', '56', '1');
INSERT INTO `zone` VALUES ('1171', '74', 'Moselle', '57', '1');
INSERT INTO `zone` VALUES ('1172', '74', 'Ni&egrave;vre', '58', '1');
INSERT INTO `zone` VALUES ('1173', '74', 'Nord', '59', '1');
INSERT INTO `zone` VALUES ('1174', '74', 'Oise', '60', '1');
INSERT INTO `zone` VALUES ('1175', '74', 'Orne', '61', '1');
INSERT INTO `zone` VALUES ('1176', '74', 'Pas de Calais', '62', '1');
INSERT INTO `zone` VALUES ('1177', '74', 'Puy de D&ocirc;me', '63', '1');
INSERT INTO `zone` VALUES ('1178', '74', 'Pyr&eacute;n&eacute;es Atlantiques', '64', '1');
INSERT INTO `zone` VALUES ('1179', '74', 'Hautes Pyr&eacute;n&eacute;es', '65', '1');
INSERT INTO `zone` VALUES ('1180', '74', 'Pyr&eacute;n&eacute;es Orientales', '66', '1');
INSERT INTO `zone` VALUES ('1181', '74', 'Bas Rhin', '67', '1');
INSERT INTO `zone` VALUES ('1182', '74', 'Haut Rhin', '68', '1');
INSERT INTO `zone` VALUES ('1183', '74', 'Rh&ocirc;ne', '69', '1');
INSERT INTO `zone` VALUES ('1184', '74', 'Haute Sa&ocirc;ne', '70', '1');
INSERT INTO `zone` VALUES ('1185', '74', 'Sa&ocirc;ne et Loire', '71', '1');
INSERT INTO `zone` VALUES ('1186', '74', 'Sarthe', '72', '1');
INSERT INTO `zone` VALUES ('1187', '74', 'Savoie', '73', '1');
INSERT INTO `zone` VALUES ('1188', '74', 'Haute Savoie', '74', '1');
INSERT INTO `zone` VALUES ('1189', '74', 'Paris', '75', '1');
INSERT INTO `zone` VALUES ('1190', '74', 'Seine Maritime', '76', '1');
INSERT INTO `zone` VALUES ('1191', '74', 'Seine et Marne', '77', '1');
INSERT INTO `zone` VALUES ('1192', '74', 'Yvelines', '78', '1');
INSERT INTO `zone` VALUES ('1193', '74', 'Deux S&egrave;vres', '79', '1');
INSERT INTO `zone` VALUES ('1194', '74', 'Somme', '80', '1');
INSERT INTO `zone` VALUES ('1195', '74', 'Tarn', '81', '1');
INSERT INTO `zone` VALUES ('1196', '74', 'Tarn et Garonne', '82', '1');
INSERT INTO `zone` VALUES ('1197', '74', 'Var', '83', '1');
INSERT INTO `zone` VALUES ('1198', '74', 'Vaucluse', '84', '1');
INSERT INTO `zone` VALUES ('1199', '74', 'Vend&eacute;e', '85', '1');
INSERT INTO `zone` VALUES ('1200', '74', 'Vienne', '86', '1');
INSERT INTO `zone` VALUES ('1201', '74', 'Haute Vienne', '87', '1');
INSERT INTO `zone` VALUES ('1202', '74', 'Vosges', '88', '1');
INSERT INTO `zone` VALUES ('1203', '74', 'Yonne', '89', '1');
INSERT INTO `zone` VALUES ('1204', '74', 'Territoire de Belfort', '90', '1');
INSERT INTO `zone` VALUES ('1205', '74', 'Essonne', '91', '1');
INSERT INTO `zone` VALUES ('1206', '74', 'Hauts de Seine', '92', '1');
INSERT INTO `zone` VALUES ('1207', '74', 'Seine St-Denis', '93', '1');
INSERT INTO `zone` VALUES ('1208', '74', 'Val de Marne', '94', '1');
INSERT INTO `zone` VALUES ('1209', '74', 'Val d\'Oise', '95', '1');
INSERT INTO `zone` VALUES ('1210', '76', 'Archipel des Marquises', 'M', '1');
INSERT INTO `zone` VALUES ('1211', '76', 'Archipel des Tuamotu', 'T', '1');
INSERT INTO `zone` VALUES ('1212', '76', 'Archipel des Tubuai', 'I', '1');
INSERT INTO `zone` VALUES ('1213', '76', 'Iles du Vent', 'V', '1');
INSERT INTO `zone` VALUES ('1214', '76', 'Iles Sous-le-Vent', 'S', '1');
INSERT INTO `zone` VALUES ('1215', '77', 'Iles Crozet', 'C', '1');
INSERT INTO `zone` VALUES ('1216', '77', 'Iles Kerguelen', 'K', '1');
INSERT INTO `zone` VALUES ('1217', '77', 'Ile Amsterdam', 'A', '1');
INSERT INTO `zone` VALUES ('1218', '77', 'Ile Saint-Paul', 'P', '1');
INSERT INTO `zone` VALUES ('1219', '77', 'Adelie Land', 'D', '1');
INSERT INTO `zone` VALUES ('1220', '78', 'Estuaire', 'ES', '1');
INSERT INTO `zone` VALUES ('1221', '78', 'Haut-Ogooue', 'HO', '1');
INSERT INTO `zone` VALUES ('1222', '78', 'Moyen-Ogooue', 'MO', '1');
INSERT INTO `zone` VALUES ('1223', '78', 'Ngounie', 'NG', '1');
INSERT INTO `zone` VALUES ('1224', '78', 'Nyanga', 'NY', '1');
INSERT INTO `zone` VALUES ('1225', '78', 'Ogooue-Ivindo', 'OI', '1');
INSERT INTO `zone` VALUES ('1226', '78', 'Ogooue-Lolo', 'OL', '1');
INSERT INTO `zone` VALUES ('1227', '78', 'Ogooue-Maritime', 'OM', '1');
INSERT INTO `zone` VALUES ('1228', '78', 'Woleu-Ntem', 'WN', '1');
INSERT INTO `zone` VALUES ('1229', '79', 'Banjul', 'BJ', '1');
INSERT INTO `zone` VALUES ('1230', '79', 'Basse', 'BS', '1');
INSERT INTO `zone` VALUES ('1231', '79', 'Brikama', 'BR', '1');
INSERT INTO `zone` VALUES ('1232', '79', 'Janjangbure', 'JA', '1');
INSERT INTO `zone` VALUES ('1233', '79', 'Kanifeng', 'KA', '1');
INSERT INTO `zone` VALUES ('1234', '79', 'Kerewan', 'KE', '1');
INSERT INTO `zone` VALUES ('1235', '79', 'Kuntaur', 'KU', '1');
INSERT INTO `zone` VALUES ('1236', '79', 'Mansakonko', 'MA', '1');
INSERT INTO `zone` VALUES ('1237', '79', 'Lower River', 'LR', '1');
INSERT INTO `zone` VALUES ('1238', '79', 'Central River', 'CR', '1');
INSERT INTO `zone` VALUES ('1239', '79', 'North Bank', 'NB', '1');
INSERT INTO `zone` VALUES ('1240', '79', 'Upper River', 'UR', '1');
INSERT INTO `zone` VALUES ('1241', '79', 'Western', 'WE', '1');
INSERT INTO `zone` VALUES ('1242', '80', 'Abkhazia', 'AB', '1');
INSERT INTO `zone` VALUES ('1243', '80', 'Ajaria', 'AJ', '1');
INSERT INTO `zone` VALUES ('1244', '80', 'Tbilisi', 'TB', '1');
INSERT INTO `zone` VALUES ('1245', '80', 'Guria', 'GU', '1');
INSERT INTO `zone` VALUES ('1246', '80', 'Imereti', 'IM', '1');
INSERT INTO `zone` VALUES ('1247', '80', 'Kakheti', 'KA', '1');
INSERT INTO `zone` VALUES ('1248', '80', 'Kvemo Kartli', 'KK', '1');
INSERT INTO `zone` VALUES ('1249', '80', 'Mtskheta-Mtianeti', 'MM', '1');
INSERT INTO `zone` VALUES ('1250', '80', 'Racha Lechkhumi and Kvemo Svanet', 'RL', '1');
INSERT INTO `zone` VALUES ('1251', '80', 'Samegrelo-Zemo Svaneti', 'SZ', '1');
INSERT INTO `zone` VALUES ('1252', '80', 'Samtskhe-Javakheti', 'SJ', '1');
INSERT INTO `zone` VALUES ('1253', '80', 'Shida Kartli', 'SK', '1');
INSERT INTO `zone` VALUES ('1254', '81', 'Baden-W&uuml;rttemberg', 'BAW', '1');
INSERT INTO `zone` VALUES ('1255', '81', 'Bayern', 'BAY', '1');
INSERT INTO `zone` VALUES ('1256', '81', 'Berlin', 'BER', '1');
INSERT INTO `zone` VALUES ('1257', '81', 'Brandenburg', 'BRG', '1');
INSERT INTO `zone` VALUES ('1258', '81', 'Bremen', 'BRE', '1');
INSERT INTO `zone` VALUES ('1259', '81', 'Hamburg', 'HAM', '1');
INSERT INTO `zone` VALUES ('1260', '81', 'Hessen', 'HES', '1');
INSERT INTO `zone` VALUES ('1261', '81', 'Mecklenburg-Vorpommern', 'MEC', '1');
INSERT INTO `zone` VALUES ('1262', '81', 'Niedersachsen', 'NDS', '1');
INSERT INTO `zone` VALUES ('1263', '81', 'Nordrhein-Westfalen', 'NRW', '1');
INSERT INTO `zone` VALUES ('1264', '81', 'Rheinland-Pfalz', 'RHE', '1');
INSERT INTO `zone` VALUES ('1265', '81', 'Saarland', 'SAR', '1');
INSERT INTO `zone` VALUES ('1266', '81', 'Sachsen', 'SAS', '1');
INSERT INTO `zone` VALUES ('1267', '81', 'Sachsen-Anhalt', 'SAC', '1');
INSERT INTO `zone` VALUES ('1268', '81', 'Schleswig-Holstein', 'SCN', '1');
INSERT INTO `zone` VALUES ('1269', '81', 'Th&uuml;ringen', 'THE', '1');
INSERT INTO `zone` VALUES ('1270', '82', 'Ashanti Region', 'AS', '1');
INSERT INTO `zone` VALUES ('1271', '82', 'Brong-Ahafo Region', 'BA', '1');
INSERT INTO `zone` VALUES ('1272', '82', 'Central Region', 'CE', '1');
INSERT INTO `zone` VALUES ('1273', '82', 'Eastern Region', 'EA', '1');
INSERT INTO `zone` VALUES ('1274', '82', 'Greater Accra Region', 'GA', '1');
INSERT INTO `zone` VALUES ('1275', '82', 'Northern Region', 'NO', '1');
INSERT INTO `zone` VALUES ('1276', '82', 'Upper East Region', 'UE', '1');
INSERT INTO `zone` VALUES ('1277', '82', 'Upper West Region', 'UW', '1');
INSERT INTO `zone` VALUES ('1278', '82', 'Volta Region', 'VO', '1');
INSERT INTO `zone` VALUES ('1279', '82', 'Western Region', 'WE', '1');
INSERT INTO `zone` VALUES ('1280', '84', 'Attica', 'AT', '1');
INSERT INTO `zone` VALUES ('1281', '84', 'Central Greece', 'CN', '1');
INSERT INTO `zone` VALUES ('1282', '84', 'Central Macedonia', 'CM', '1');
INSERT INTO `zone` VALUES ('1283', '84', 'Crete', 'CR', '1');
INSERT INTO `zone` VALUES ('1284', '84', 'East Macedonia and Thrace', 'EM', '1');
INSERT INTO `zone` VALUES ('1285', '84', 'Epirus', 'EP', '1');
INSERT INTO `zone` VALUES ('1286', '84', 'Ionian Islands', 'II', '1');
INSERT INTO `zone` VALUES ('1287', '84', 'North Aegean', 'NA', '1');
INSERT INTO `zone` VALUES ('1288', '84', 'Peloponnesos', 'PP', '1');
INSERT INTO `zone` VALUES ('1289', '84', 'South Aegean', 'SA', '1');
INSERT INTO `zone` VALUES ('1290', '84', 'Thessaly', 'TH', '1');
INSERT INTO `zone` VALUES ('1291', '84', 'West Greece', 'WG', '1');
INSERT INTO `zone` VALUES ('1292', '84', 'West Macedonia', 'WM', '1');
INSERT INTO `zone` VALUES ('1293', '85', 'Avannaa', 'A', '1');
INSERT INTO `zone` VALUES ('1294', '85', 'Tunu', 'T', '1');
INSERT INTO `zone` VALUES ('1295', '85', 'Kitaa', 'K', '1');
INSERT INTO `zone` VALUES ('1296', '86', 'Saint Andrew', 'A', '1');
INSERT INTO `zone` VALUES ('1297', '86', 'Saint David', 'D', '1');
INSERT INTO `zone` VALUES ('1298', '86', 'Saint George', 'G', '1');
INSERT INTO `zone` VALUES ('1299', '86', 'Saint John', 'J', '1');
INSERT INTO `zone` VALUES ('1300', '86', 'Saint Mark', 'M', '1');
INSERT INTO `zone` VALUES ('1301', '86', 'Saint Patrick', 'P', '1');
INSERT INTO `zone` VALUES ('1302', '86', 'Carriacou', 'C', '1');
INSERT INTO `zone` VALUES ('1303', '86', 'Petit Martinique', 'Q', '1');
INSERT INTO `zone` VALUES ('1304', '89', 'Alta Verapaz', 'AV', '1');
INSERT INTO `zone` VALUES ('1305', '89', 'Baja Verapaz', 'BV', '1');
INSERT INTO `zone` VALUES ('1306', '89', 'Chimaltenango', 'CM', '1');
INSERT INTO `zone` VALUES ('1307', '89', 'Chiquimula', 'CQ', '1');
INSERT INTO `zone` VALUES ('1308', '89', 'El Peten', 'PE', '1');
INSERT INTO `zone` VALUES ('1309', '89', 'El Progreso', 'PR', '1');
INSERT INTO `zone` VALUES ('1310', '89', 'El Quiche', 'QC', '1');
INSERT INTO `zone` VALUES ('1311', '89', 'Escuintla', 'ES', '1');
INSERT INTO `zone` VALUES ('1312', '89', 'Guatemala', 'GU', '1');
INSERT INTO `zone` VALUES ('1313', '89', 'Huehuetenango', 'HU', '1');
INSERT INTO `zone` VALUES ('1314', '89', 'Izabal', 'IZ', '1');
INSERT INTO `zone` VALUES ('1315', '89', 'Jalapa', 'JA', '1');
INSERT INTO `zone` VALUES ('1316', '89', 'Jutiapa', 'JU', '1');
INSERT INTO `zone` VALUES ('1317', '89', 'Quetzaltenango', 'QZ', '1');
INSERT INTO `zone` VALUES ('1318', '89', 'Retalhuleu', 'RE', '1');
INSERT INTO `zone` VALUES ('1319', '89', 'Sacatepequez', 'ST', '1');
INSERT INTO `zone` VALUES ('1320', '89', 'San Marcos', 'SM', '1');
INSERT INTO `zone` VALUES ('1321', '89', 'Santa Rosa', 'SR', '1');
INSERT INTO `zone` VALUES ('1322', '89', 'Solola', 'SO', '1');
INSERT INTO `zone` VALUES ('1323', '89', 'Suchitepequez', 'SU', '1');
INSERT INTO `zone` VALUES ('1324', '89', 'Totonicapan', 'TO', '1');
INSERT INTO `zone` VALUES ('1325', '89', 'Zacapa', 'ZA', '1');
INSERT INTO `zone` VALUES ('1326', '90', 'Conakry', 'CNK', '1');
INSERT INTO `zone` VALUES ('1327', '90', 'Beyla', 'BYL', '1');
INSERT INTO `zone` VALUES ('1328', '90', 'Boffa', 'BFA', '1');
INSERT INTO `zone` VALUES ('1329', '90', 'Boke', 'BOK', '1');
INSERT INTO `zone` VALUES ('1330', '90', 'Coyah', 'COY', '1');
INSERT INTO `zone` VALUES ('1331', '90', 'Dabola', 'DBL', '1');
INSERT INTO `zone` VALUES ('1332', '90', 'Dalaba', 'DLB', '1');
INSERT INTO `zone` VALUES ('1333', '90', 'Dinguiraye', 'DGR', '1');
INSERT INTO `zone` VALUES ('1334', '90', 'Dubreka', 'DBR', '1');
INSERT INTO `zone` VALUES ('1335', '90', 'Faranah', 'FRN', '1');
INSERT INTO `zone` VALUES ('1336', '90', 'Forecariah', 'FRC', '1');
INSERT INTO `zone` VALUES ('1337', '90', 'Fria', 'FRI', '1');
INSERT INTO `zone` VALUES ('1338', '90', 'Gaoual', 'GAO', '1');
INSERT INTO `zone` VALUES ('1339', '90', 'Gueckedou', 'GCD', '1');
INSERT INTO `zone` VALUES ('1340', '90', 'Kankan', 'KNK', '1');
INSERT INTO `zone` VALUES ('1341', '90', 'Kerouane', 'KRN', '1');
INSERT INTO `zone` VALUES ('1342', '90', 'Kindia', 'KND', '1');
INSERT INTO `zone` VALUES ('1343', '90', 'Kissidougou', 'KSD', '1');
INSERT INTO `zone` VALUES ('1344', '90', 'Koubia', 'KBA', '1');
INSERT INTO `zone` VALUES ('1345', '90', 'Koundara', 'KDA', '1');
INSERT INTO `zone` VALUES ('1346', '90', 'Kouroussa', 'KRA', '1');
INSERT INTO `zone` VALUES ('1347', '90', 'Labe', 'LAB', '1');
INSERT INTO `zone` VALUES ('1348', '90', 'Lelouma', 'LLM', '1');
INSERT INTO `zone` VALUES ('1349', '90', 'Lola', 'LOL', '1');
INSERT INTO `zone` VALUES ('1350', '90', 'Macenta', 'MCT', '1');
INSERT INTO `zone` VALUES ('1351', '90', 'Mali', 'MAL', '1');
INSERT INTO `zone` VALUES ('1352', '90', 'Mamou', 'MAM', '1');
INSERT INTO `zone` VALUES ('1353', '90', 'Mandiana', 'MAN', '1');
INSERT INTO `zone` VALUES ('1354', '90', 'Nzerekore', 'NZR', '1');
INSERT INTO `zone` VALUES ('1355', '90', 'Pita', 'PIT', '1');
INSERT INTO `zone` VALUES ('1356', '90', 'Siguiri', 'SIG', '1');
INSERT INTO `zone` VALUES ('1357', '90', 'Telimele', 'TLM', '1');
INSERT INTO `zone` VALUES ('1358', '90', 'Tougue', 'TOG', '1');
INSERT INTO `zone` VALUES ('1359', '90', 'Yomou', 'YOM', '1');
INSERT INTO `zone` VALUES ('1360', '91', 'Bafata Region', 'BF', '1');
INSERT INTO `zone` VALUES ('1361', '91', 'Biombo Region', 'BB', '1');
INSERT INTO `zone` VALUES ('1362', '91', 'Bissau Region', 'BS', '1');
INSERT INTO `zone` VALUES ('1363', '91', 'Bolama Region', 'BL', '1');
INSERT INTO `zone` VALUES ('1364', '91', 'Cacheu Region', 'CA', '1');
INSERT INTO `zone` VALUES ('1365', '91', 'Gabu Region', 'GA', '1');
INSERT INTO `zone` VALUES ('1366', '91', 'Oio Region', 'OI', '1');
INSERT INTO `zone` VALUES ('1367', '91', 'Quinara Region', 'QU', '1');
INSERT INTO `zone` VALUES ('1368', '91', 'Tombali Region', 'TO', '1');
INSERT INTO `zone` VALUES ('1369', '92', 'Barima-Waini', 'BW', '1');
INSERT INTO `zone` VALUES ('1370', '92', 'Cuyuni-Mazaruni', 'CM', '1');
INSERT INTO `zone` VALUES ('1371', '92', 'Demerara-Mahaica', 'DM', '1');
INSERT INTO `zone` VALUES ('1372', '92', 'East Berbice-Corentyne', 'EC', '1');
INSERT INTO `zone` VALUES ('1373', '92', 'Essequibo Islands-West Demerara', 'EW', '1');
INSERT INTO `zone` VALUES ('1374', '92', 'Mahaica-Berbice', 'MB', '1');
INSERT INTO `zone` VALUES ('1375', '92', 'Pomeroon-Supenaam', 'PM', '1');
INSERT INTO `zone` VALUES ('1376', '92', 'Potaro-Siparuni', 'PI', '1');
INSERT INTO `zone` VALUES ('1377', '92', 'Upper Demerara-Berbice', 'UD', '1');
INSERT INTO `zone` VALUES ('1378', '92', 'Upper Takutu-Upper Essequibo', 'UT', '1');
INSERT INTO `zone` VALUES ('1379', '93', 'Artibonite', 'AR', '1');
INSERT INTO `zone` VALUES ('1380', '93', 'Centre', 'CE', '1');
INSERT INTO `zone` VALUES ('1381', '93', 'Grand\'Anse', 'GA', '1');
INSERT INTO `zone` VALUES ('1382', '93', 'Nord', 'ND', '1');
INSERT INTO `zone` VALUES ('1383', '93', 'Nord-Est', 'NE', '1');
INSERT INTO `zone` VALUES ('1384', '93', 'Nord-Ouest', 'NO', '1');
INSERT INTO `zone` VALUES ('1385', '93', 'Ouest', 'OU', '1');
INSERT INTO `zone` VALUES ('1386', '93', 'Sud', 'SD', '1');
INSERT INTO `zone` VALUES ('1387', '93', 'Sud-Est', 'SE', '1');
INSERT INTO `zone` VALUES ('1388', '94', 'Flat Island', 'F', '1');
INSERT INTO `zone` VALUES ('1389', '94', 'McDonald Island', 'M', '1');
INSERT INTO `zone` VALUES ('1390', '94', 'Shag Island', 'S', '1');
INSERT INTO `zone` VALUES ('1391', '94', 'Heard Island', 'H', '1');
INSERT INTO `zone` VALUES ('1392', '95', 'Atlantida', 'AT', '1');
INSERT INTO `zone` VALUES ('1393', '95', 'Choluteca', 'CH', '1');
INSERT INTO `zone` VALUES ('1394', '95', 'Colon', 'CL', '1');
INSERT INTO `zone` VALUES ('1395', '95', 'Comayagua', 'CM', '1');
INSERT INTO `zone` VALUES ('1396', '95', 'Copan', 'CP', '1');
INSERT INTO `zone` VALUES ('1397', '95', 'Cortes', 'CR', '1');
INSERT INTO `zone` VALUES ('1398', '95', 'El Paraiso', 'PA', '1');
INSERT INTO `zone` VALUES ('1399', '95', 'Francisco Morazan', 'FM', '1');
INSERT INTO `zone` VALUES ('1400', '95', 'Gracias a Dios', 'GD', '1');
INSERT INTO `zone` VALUES ('1401', '95', 'Intibuca', 'IN', '1');
INSERT INTO `zone` VALUES ('1402', '95', 'Islas de la Bahia (Bay Islands)', 'IB', '1');
INSERT INTO `zone` VALUES ('1403', '95', 'La Paz', 'PZ', '1');
INSERT INTO `zone` VALUES ('1404', '95', 'Lempira', 'LE', '1');
INSERT INTO `zone` VALUES ('1405', '95', 'Ocotepeque', 'OC', '1');
INSERT INTO `zone` VALUES ('1406', '95', 'Olancho', 'OL', '1');
INSERT INTO `zone` VALUES ('1407', '95', 'Santa Barbara', 'SB', '1');
INSERT INTO `zone` VALUES ('1408', '95', 'Valle', 'VA', '1');
INSERT INTO `zone` VALUES ('1409', '95', 'Yoro', 'YO', '1');
INSERT INTO `zone` VALUES ('1410', '96', 'Central and Western Hong Kong Island', 'HCW', '1');
INSERT INTO `zone` VALUES ('1411', '96', 'Eastern Hong Kong Island', 'HEA', '1');
INSERT INTO `zone` VALUES ('1412', '96', 'Southern Hong Kong Island', 'HSO', '1');
INSERT INTO `zone` VALUES ('1413', '96', 'Wan Chai Hong Kong Island', 'HWC', '1');
INSERT INTO `zone` VALUES ('1414', '96', 'Kowloon City Kowloon', 'KKC', '1');
INSERT INTO `zone` VALUES ('1415', '96', 'Kwun Tong Kowloon', 'KKT', '1');
INSERT INTO `zone` VALUES ('1416', '96', 'Sham Shui Po Kowloon', 'KSS', '1');
INSERT INTO `zone` VALUES ('1417', '96', 'Wong Tai Sin Kowloon', 'KWT', '1');
INSERT INTO `zone` VALUES ('1418', '96', 'Yau Tsim Mong Kowloon', 'KYT', '1');
INSERT INTO `zone` VALUES ('1419', '96', 'Islands New Territories', 'NIS', '1');
INSERT INTO `zone` VALUES ('1420', '96', 'Kwai Tsing New Territories', 'NKT', '1');
INSERT INTO `zone` VALUES ('1421', '96', 'North New Territories', 'NNO', '1');
INSERT INTO `zone` VALUES ('1422', '96', 'Sai Kung New Territories', 'NSK', '1');
INSERT INTO `zone` VALUES ('1423', '96', 'Sha Tin New Territories', 'NST', '1');
INSERT INTO `zone` VALUES ('1424', '96', 'Tai Po New Territories', 'NTP', '1');
INSERT INTO `zone` VALUES ('1425', '96', 'Tsuen Wan New Territories', 'NTW', '1');
INSERT INTO `zone` VALUES ('1426', '96', 'Tuen Mun New Territories', 'NTM', '1');
INSERT INTO `zone` VALUES ('1427', '96', 'Yuen Long New Territories', 'NYL', '1');
INSERT INTO `zone` VALUES ('1428', '97', 'Bacs-Kiskun', 'BK', '1');
INSERT INTO `zone` VALUES ('1429', '97', 'Baranya', 'BA', '1');
INSERT INTO `zone` VALUES ('1430', '97', 'Bekes', 'BE', '1');
INSERT INTO `zone` VALUES ('1431', '97', 'Bekescsaba', 'BS', '1');
INSERT INTO `zone` VALUES ('1432', '97', 'Borsod-Abauj-Zemplen', 'BZ', '1');
INSERT INTO `zone` VALUES ('1433', '97', 'Budapest', 'BU', '1');
INSERT INTO `zone` VALUES ('1434', '97', 'Csongrad', 'CS', '1');
INSERT INTO `zone` VALUES ('1435', '97', 'Debrecen', 'DE', '1');
INSERT INTO `zone` VALUES ('1436', '97', 'Dunaujvaros', 'DU', '1');
INSERT INTO `zone` VALUES ('1437', '97', 'Eger', 'EG', '1');
INSERT INTO `zone` VALUES ('1438', '97', 'Fejer', 'FE', '1');
INSERT INTO `zone` VALUES ('1439', '97', 'Gyor', 'GY', '1');
INSERT INTO `zone` VALUES ('1440', '97', 'Gyor-Moson-Sopron', 'GM', '1');
INSERT INTO `zone` VALUES ('1441', '97', 'Hajdu-Bihar', 'HB', '1');
INSERT INTO `zone` VALUES ('1442', '97', 'Heves', 'HE', '1');
INSERT INTO `zone` VALUES ('1443', '97', 'Hodmezovasarhely', 'HO', '1');
INSERT INTO `zone` VALUES ('1444', '97', 'Jasz-Nagykun-Szolnok', 'JN', '1');
INSERT INTO `zone` VALUES ('1445', '97', 'Kaposvar', 'KA', '1');
INSERT INTO `zone` VALUES ('1446', '97', 'Kecskemet', 'KE', '1');
INSERT INTO `zone` VALUES ('1447', '97', 'Komarom-Esztergom', 'KO', '1');
INSERT INTO `zone` VALUES ('1448', '97', 'Miskolc', 'MI', '1');
INSERT INTO `zone` VALUES ('1449', '97', 'Nagykanizsa', 'NA', '1');
INSERT INTO `zone` VALUES ('1450', '97', 'Nograd', 'NO', '1');
INSERT INTO `zone` VALUES ('1451', '97', 'Nyiregyhaza', 'NY', '1');
INSERT INTO `zone` VALUES ('1452', '97', 'Pecs', 'PE', '1');
INSERT INTO `zone` VALUES ('1453', '97', 'Pest', 'PS', '1');
INSERT INTO `zone` VALUES ('1454', '97', 'Somogy', 'SO', '1');
INSERT INTO `zone` VALUES ('1455', '97', 'Sopron', 'SP', '1');
INSERT INTO `zone` VALUES ('1456', '97', 'Szabolcs-Szatmar-Bereg', 'SS', '1');
INSERT INTO `zone` VALUES ('1457', '97', 'Szeged', 'SZ', '1');
INSERT INTO `zone` VALUES ('1458', '97', 'Szekesfehervar', 'SE', '1');
INSERT INTO `zone` VALUES ('1459', '97', 'Szolnok', 'SL', '1');
INSERT INTO `zone` VALUES ('1460', '97', 'Szombathely', 'SM', '1');
INSERT INTO `zone` VALUES ('1461', '97', 'Tatabanya', 'TA', '1');
INSERT INTO `zone` VALUES ('1462', '97', 'Tolna', 'TO', '1');
INSERT INTO `zone` VALUES ('1463', '97', 'Vas', 'VA', '1');
INSERT INTO `zone` VALUES ('1464', '97', 'Veszprem', 'VE', '1');
INSERT INTO `zone` VALUES ('1465', '97', 'Zala', 'ZA', '1');
INSERT INTO `zone` VALUES ('1466', '97', 'Zalaegerszeg', 'ZZ', '1');
INSERT INTO `zone` VALUES ('1467', '98', 'Austurland', 'AL', '1');
INSERT INTO `zone` VALUES ('1468', '98', 'Hofuoborgarsvaeoi', 'HF', '1');
INSERT INTO `zone` VALUES ('1469', '98', 'Norourland eystra', 'NE', '1');
INSERT INTO `zone` VALUES ('1470', '98', 'Norourland vestra', 'NV', '1');
INSERT INTO `zone` VALUES ('1471', '98', 'Suourland', 'SL', '1');
INSERT INTO `zone` VALUES ('1472', '98', 'Suournes', 'SN', '1');
INSERT INTO `zone` VALUES ('1473', '98', 'Vestfiroir', 'VF', '1');
INSERT INTO `zone` VALUES ('1474', '98', 'Vesturland', 'VL', '1');
INSERT INTO `zone` VALUES ('1475', '99', 'Andaman and Nicobar Islands', 'AN', '1');
INSERT INTO `zone` VALUES ('1476', '99', 'Andhra Pradesh', 'AP', '1');
INSERT INTO `zone` VALUES ('1477', '99', 'Arunachal Pradesh', 'AR', '1');
INSERT INTO `zone` VALUES ('1478', '99', 'Assam', 'AS', '1');
INSERT INTO `zone` VALUES ('1479', '99', 'Bihar', 'BI', '1');
INSERT INTO `zone` VALUES ('1480', '99', 'Chandigarh', 'CH', '1');
INSERT INTO `zone` VALUES ('1481', '99', 'Dadra and Nagar Haveli', 'DA', '1');
INSERT INTO `zone` VALUES ('1482', '99', 'Daman and Diu', 'DM', '1');
INSERT INTO `zone` VALUES ('1483', '99', 'Delhi', 'DE', '1');
INSERT INTO `zone` VALUES ('1484', '99', 'Goa', 'GO', '1');
INSERT INTO `zone` VALUES ('1485', '99', 'Gujarat', 'GU', '1');
INSERT INTO `zone` VALUES ('1486', '99', 'Haryana', 'HA', '1');
INSERT INTO `zone` VALUES ('1487', '99', 'Himachal Pradesh', 'HP', '1');
INSERT INTO `zone` VALUES ('1488', '99', 'Jammu and Kashmir', 'JA', '1');
INSERT INTO `zone` VALUES ('1489', '99', 'Karnataka', 'KA', '1');
INSERT INTO `zone` VALUES ('1490', '99', 'Kerala', 'KE', '1');
INSERT INTO `zone` VALUES ('1491', '99', 'Lakshadweep Islands', 'LI', '1');
INSERT INTO `zone` VALUES ('1492', '99', 'Madhya Pradesh', 'MP', '1');
INSERT INTO `zone` VALUES ('1493', '99', 'Maharashtra', 'MA', '1');
INSERT INTO `zone` VALUES ('1494', '99', 'Manipur', 'MN', '1');
INSERT INTO `zone` VALUES ('1495', '99', 'Meghalaya', 'ME', '1');
INSERT INTO `zone` VALUES ('1496', '99', 'Mizoram', 'MI', '1');
INSERT INTO `zone` VALUES ('1497', '99', 'Nagaland', 'NA', '1');
INSERT INTO `zone` VALUES ('1498', '99', 'Orissa', 'OR', '1');
INSERT INTO `zone` VALUES ('1499', '99', 'Pondicherry', 'PO', '1');
INSERT INTO `zone` VALUES ('1500', '99', 'Punjab', 'PU', '1');
INSERT INTO `zone` VALUES ('1501', '99', 'Rajasthan', 'RA', '1');
INSERT INTO `zone` VALUES ('1502', '99', 'Sikkim', 'SI', '1');
INSERT INTO `zone` VALUES ('1503', '99', 'Tamil Nadu', 'TN', '1');
INSERT INTO `zone` VALUES ('1504', '99', 'Tripura', 'TR', '1');
INSERT INTO `zone` VALUES ('1505', '99', 'Uttar Pradesh', 'UP', '1');
INSERT INTO `zone` VALUES ('1506', '99', 'West Bengal', 'WB', '1');
INSERT INTO `zone` VALUES ('1507', '100', 'Aceh', 'AC', '1');
INSERT INTO `zone` VALUES ('1508', '100', 'Bali', 'BA', '1');
INSERT INTO `zone` VALUES ('1509', '100', 'Banten', 'BT', '1');
INSERT INTO `zone` VALUES ('1510', '100', 'Bengkulu', 'BE', '1');
INSERT INTO `zone` VALUES ('1511', '100', 'BoDeTaBek', 'BD', '1');
INSERT INTO `zone` VALUES ('1512', '100', 'Gorontalo', 'GO', '1');
INSERT INTO `zone` VALUES ('1513', '100', 'Jakarta Raya', 'JK', '1');
INSERT INTO `zone` VALUES ('1514', '100', 'Jambi', 'JA', '1');
INSERT INTO `zone` VALUES ('1515', '100', 'Jawa Barat', 'JB', '1');
INSERT INTO `zone` VALUES ('1516', '100', 'Jawa Tengah', 'JT', '1');
INSERT INTO `zone` VALUES ('1517', '100', 'Jawa Timur', 'JI', '1');
INSERT INTO `zone` VALUES ('1518', '100', 'Kalimantan Barat', 'KB', '1');
INSERT INTO `zone` VALUES ('1519', '100', 'Kalimantan Selatan', 'KS', '1');
INSERT INTO `zone` VALUES ('1520', '100', 'Kalimantan Tengah', 'KT', '1');
INSERT INTO `zone` VALUES ('1521', '100', 'Kalimantan Timur', 'KI', '1');
INSERT INTO `zone` VALUES ('1522', '100', 'Kepulauan Bangka Belitung', 'BB', '1');
INSERT INTO `zone` VALUES ('1523', '100', 'Lampung', 'LA', '1');
INSERT INTO `zone` VALUES ('1524', '100', 'Maluku', 'MA', '1');
INSERT INTO `zone` VALUES ('1525', '100', 'Maluku Utara', 'MU', '1');
INSERT INTO `zone` VALUES ('1526', '100', 'Nusa Tenggara Barat', 'NB', '1');
INSERT INTO `zone` VALUES ('1527', '100', 'Nusa Tenggara Timur', 'NT', '1');
INSERT INTO `zone` VALUES ('1528', '100', 'Papua', 'PA', '1');
INSERT INTO `zone` VALUES ('1529', '100', 'Riau', 'RI', '1');
INSERT INTO `zone` VALUES ('1530', '100', 'Sulawesi Selatan', 'SN', '1');
INSERT INTO `zone` VALUES ('1531', '100', 'Sulawesi Tengah', 'ST', '1');
INSERT INTO `zone` VALUES ('1532', '100', 'Sulawesi Tenggara', 'SG', '1');
INSERT INTO `zone` VALUES ('1533', '100', 'Sulawesi Utara', 'SA', '1');
INSERT INTO `zone` VALUES ('1534', '100', 'Sumatera Barat', 'SB', '1');
INSERT INTO `zone` VALUES ('1535', '100', 'Sumatera Selatan', 'SS', '1');
INSERT INTO `zone` VALUES ('1536', '100', 'Sumatera Utara', 'SU', '1');
INSERT INTO `zone` VALUES ('1537', '100', 'Yogyakarta', 'YO', '1');
INSERT INTO `zone` VALUES ('1538', '101', 'Tehran', 'TEH', '1');
INSERT INTO `zone` VALUES ('1539', '101', 'Qom', 'QOM', '1');
INSERT INTO `zone` VALUES ('1540', '101', 'Markazi', 'MKZ', '1');
INSERT INTO `zone` VALUES ('1541', '101', 'Qazvin', 'QAZ', '1');
INSERT INTO `zone` VALUES ('1542', '101', 'Gilan', 'GIL', '1');
INSERT INTO `zone` VALUES ('1543', '101', 'Ardabil', 'ARD', '1');
INSERT INTO `zone` VALUES ('1544', '101', 'Zanjan', 'ZAN', '1');
INSERT INTO `zone` VALUES ('1545', '101', 'East Azarbaijan', 'EAZ', '1');
INSERT INTO `zone` VALUES ('1546', '101', 'West Azarbaijan', 'WEZ', '1');
INSERT INTO `zone` VALUES ('1547', '101', 'Kurdistan', 'KRD', '1');
INSERT INTO `zone` VALUES ('1548', '101', 'Hamadan', 'HMD', '1');
INSERT INTO `zone` VALUES ('1549', '101', 'Kermanshah', 'KRM', '1');
INSERT INTO `zone` VALUES ('1550', '101', 'Ilam', 'ILM', '1');
INSERT INTO `zone` VALUES ('1551', '101', 'Lorestan', 'LRS', '1');
INSERT INTO `zone` VALUES ('1552', '101', 'Khuzestan', 'KZT', '1');
INSERT INTO `zone` VALUES ('1553', '101', 'Chahar Mahaal and Bakhtiari', 'CMB', '1');
INSERT INTO `zone` VALUES ('1554', '101', 'Kohkiluyeh and Buyer Ahmad', 'KBA', '1');
INSERT INTO `zone` VALUES ('1555', '101', 'Bushehr', 'BSH', '1');
INSERT INTO `zone` VALUES ('1556', '101', 'Fars', 'FAR', '1');
INSERT INTO `zone` VALUES ('1557', '101', 'Hormozgan', 'HRM', '1');
INSERT INTO `zone` VALUES ('1558', '101', 'Sistan and Baluchistan', 'SBL', '1');
INSERT INTO `zone` VALUES ('1559', '101', 'Kerman', 'KRB', '1');
INSERT INTO `zone` VALUES ('1560', '101', 'Yazd', 'YZD', '1');
INSERT INTO `zone` VALUES ('1561', '101', 'Esfahan', 'EFH', '1');
INSERT INTO `zone` VALUES ('1562', '101', 'Semnan', 'SMN', '1');
INSERT INTO `zone` VALUES ('1563', '101', 'Mazandaran', 'MZD', '1');
INSERT INTO `zone` VALUES ('1564', '101', 'Golestan', 'GLS', '1');
INSERT INTO `zone` VALUES ('1565', '101', 'North Khorasan', 'NKH', '1');
INSERT INTO `zone` VALUES ('1566', '101', 'Razavi Khorasan', 'RKH', '1');
INSERT INTO `zone` VALUES ('1567', '101', 'South Khorasan', 'SKH', '1');
INSERT INTO `zone` VALUES ('1568', '102', 'Baghdad', 'BD', '1');
INSERT INTO `zone` VALUES ('1569', '102', 'Salah ad Din', 'SD', '1');
INSERT INTO `zone` VALUES ('1570', '102', 'Diyala', 'DY', '1');
INSERT INTO `zone` VALUES ('1571', '102', 'Wasit', 'WS', '1');
INSERT INTO `zone` VALUES ('1572', '102', 'Maysan', 'MY', '1');
INSERT INTO `zone` VALUES ('1573', '102', 'Al Basrah', 'BA', '1');
INSERT INTO `zone` VALUES ('1574', '102', 'Dhi Qar', 'DQ', '1');
INSERT INTO `zone` VALUES ('1575', '102', 'Al Muthanna', 'MU', '1');
INSERT INTO `zone` VALUES ('1576', '102', 'Al Qadisyah', 'QA', '1');
INSERT INTO `zone` VALUES ('1577', '102', 'Babil', 'BB', '1');
INSERT INTO `zone` VALUES ('1578', '102', 'Al Karbala', 'KB', '1');
INSERT INTO `zone` VALUES ('1579', '102', 'An Najaf', 'NJ', '1');
INSERT INTO `zone` VALUES ('1580', '102', 'Al Anbar', 'AB', '1');
INSERT INTO `zone` VALUES ('1581', '102', 'Ninawa', 'NN', '1');
INSERT INTO `zone` VALUES ('1582', '102', 'Dahuk', 'DH', '1');
INSERT INTO `zone` VALUES ('1583', '102', 'Arbil', 'AL', '1');
INSERT INTO `zone` VALUES ('1584', '102', 'At Ta\'mim', 'TM', '1');
INSERT INTO `zone` VALUES ('1585', '102', 'As Sulaymaniyah', 'SL', '1');
INSERT INTO `zone` VALUES ('1586', '103', 'Carlow', 'CA', '1');
INSERT INTO `zone` VALUES ('1587', '103', 'Cavan', 'CV', '1');
INSERT INTO `zone` VALUES ('1588', '103', 'Clare', 'CL', '1');
INSERT INTO `zone` VALUES ('1589', '103', 'Cork', 'CO', '1');
INSERT INTO `zone` VALUES ('1590', '103', 'Donegal', 'DO', '1');
INSERT INTO `zone` VALUES ('1591', '103', 'Dublin', 'DU', '1');
INSERT INTO `zone` VALUES ('1592', '103', 'Galway', 'GA', '1');
INSERT INTO `zone` VALUES ('1593', '103', 'Kerry', 'KE', '1');
INSERT INTO `zone` VALUES ('1594', '103', 'Kildare', 'KI', '1');
INSERT INTO `zone` VALUES ('1595', '103', 'Kilkenny', 'KL', '1');
INSERT INTO `zone` VALUES ('1596', '103', 'Laois', 'LA', '1');
INSERT INTO `zone` VALUES ('1597', '103', 'Leitrim', 'LE', '1');
INSERT INTO `zone` VALUES ('1598', '103', 'Limerick', 'LI', '1');
INSERT INTO `zone` VALUES ('1599', '103', 'Longford', 'LO', '1');
INSERT INTO `zone` VALUES ('1600', '103', 'Louth', 'LU', '1');
INSERT INTO `zone` VALUES ('1601', '103', 'Mayo', 'MA', '1');
INSERT INTO `zone` VALUES ('1602', '103', 'Meath', 'ME', '1');
INSERT INTO `zone` VALUES ('1603', '103', 'Monaghan', 'MO', '1');
INSERT INTO `zone` VALUES ('1604', '103', 'Offaly', 'OF', '1');
INSERT INTO `zone` VALUES ('1605', '103', 'Roscommon', 'RO', '1');
INSERT INTO `zone` VALUES ('1606', '103', 'Sligo', 'SL', '1');
INSERT INTO `zone` VALUES ('1607', '103', 'Tipperary', 'TI', '1');
INSERT INTO `zone` VALUES ('1608', '103', 'Waterford', 'WA', '1');
INSERT INTO `zone` VALUES ('1609', '103', 'Westmeath', 'WE', '1');
INSERT INTO `zone` VALUES ('1610', '103', 'Wexford', 'WX', '1');
INSERT INTO `zone` VALUES ('1611', '103', 'Wicklow', 'WI', '1');
INSERT INTO `zone` VALUES ('1612', '104', 'Be\'er Sheva', 'BS', '1');
INSERT INTO `zone` VALUES ('1613', '104', 'Bika\'at Hayarden', 'BH', '1');
INSERT INTO `zone` VALUES ('1614', '104', 'Eilat and Arava', 'EA', '1');
INSERT INTO `zone` VALUES ('1615', '104', 'Galil', 'GA', '1');
INSERT INTO `zone` VALUES ('1616', '104', 'Haifa', 'HA', '1');
INSERT INTO `zone` VALUES ('1617', '104', 'Jehuda Mountains', 'JM', '1');
INSERT INTO `zone` VALUES ('1618', '104', 'Jerusalem', 'JE', '1');
INSERT INTO `zone` VALUES ('1619', '104', 'Negev', 'NE', '1');
INSERT INTO `zone` VALUES ('1620', '104', 'Semaria', 'SE', '1');
INSERT INTO `zone` VALUES ('1621', '104', 'Sharon', 'SH', '1');
INSERT INTO `zone` VALUES ('1622', '104', 'Tel Aviv (Gosh Dan)', 'TA', '1');
INSERT INTO `zone` VALUES ('3860', '105', 'Caltanissetta', 'CL', '1');
INSERT INTO `zone` VALUES ('3842', '105', 'Agrigento', 'AG', '1');
INSERT INTO `zone` VALUES ('3843', '105', 'Alessandria', 'AL', '1');
INSERT INTO `zone` VALUES ('3844', '105', 'Ancona', 'AN', '1');
INSERT INTO `zone` VALUES ('3845', '105', 'Aosta', 'AO', '1');
INSERT INTO `zone` VALUES ('3846', '105', 'Arezzo', 'AR', '1');
INSERT INTO `zone` VALUES ('3847', '105', 'Ascoli Piceno', 'AP', '1');
INSERT INTO `zone` VALUES ('3848', '105', 'Asti', 'AT', '1');
INSERT INTO `zone` VALUES ('3849', '105', 'Avellino', 'AV', '1');
INSERT INTO `zone` VALUES ('3850', '105', 'Bari', 'BA', '1');
INSERT INTO `zone` VALUES ('3851', '105', 'Belluno', 'BL', '1');
INSERT INTO `zone` VALUES ('3852', '105', 'Benevento', 'BN', '1');
INSERT INTO `zone` VALUES ('3853', '105', 'Bergamo', 'BG', '1');
INSERT INTO `zone` VALUES ('3854', '105', 'Biella', 'BI', '1');
INSERT INTO `zone` VALUES ('3855', '105', 'Bologna', 'BO', '1');
INSERT INTO `zone` VALUES ('3856', '105', 'Bolzano', 'BZ', '1');
INSERT INTO `zone` VALUES ('3857', '105', 'Brescia', 'BS', '1');
INSERT INTO `zone` VALUES ('3858', '105', 'Brindisi', 'BR', '1');
INSERT INTO `zone` VALUES ('3859', '105', 'Cagliari', 'CA', '1');
INSERT INTO `zone` VALUES ('1643', '106', 'Clarendon Parish', 'CLA', '1');
INSERT INTO `zone` VALUES ('1644', '106', 'Hanover Parish', 'HAN', '1');
INSERT INTO `zone` VALUES ('1645', '106', 'Kingston Parish', 'KIN', '1');
INSERT INTO `zone` VALUES ('1646', '106', 'Manchester Parish', 'MAN', '1');
INSERT INTO `zone` VALUES ('1647', '106', 'Portland Parish', 'POR', '1');
INSERT INTO `zone` VALUES ('1648', '106', 'Saint Andrew Parish', 'AND', '1');
INSERT INTO `zone` VALUES ('1649', '106', 'Saint Ann Parish', 'ANN', '1');
INSERT INTO `zone` VALUES ('1650', '106', 'Saint Catherine Parish', 'CAT', '1');
INSERT INTO `zone` VALUES ('1651', '106', 'Saint Elizabeth Parish', 'ELI', '1');
INSERT INTO `zone` VALUES ('1652', '106', 'Saint James Parish', 'JAM', '1');
INSERT INTO `zone` VALUES ('1653', '106', 'Saint Mary Parish', 'MAR', '1');
INSERT INTO `zone` VALUES ('1654', '106', 'Saint Thomas Parish', 'THO', '1');
INSERT INTO `zone` VALUES ('1655', '106', 'Trelawny Parish', 'TRL', '1');
INSERT INTO `zone` VALUES ('1656', '106', 'Westmoreland Parish', 'WML', '1');
INSERT INTO `zone` VALUES ('1657', '107', 'Aichi', 'AI', '1');
INSERT INTO `zone` VALUES ('1658', '107', 'Akita', 'AK', '1');
INSERT INTO `zone` VALUES ('1659', '107', 'Aomori', 'AO', '1');
INSERT INTO `zone` VALUES ('1660', '107', 'Chiba', 'CH', '1');
INSERT INTO `zone` VALUES ('1661', '107', 'Ehime', 'EH', '1');
INSERT INTO `zone` VALUES ('1662', '107', 'Fukui', 'FK', '1');
INSERT INTO `zone` VALUES ('1663', '107', 'Fukuoka', 'FU', '1');
INSERT INTO `zone` VALUES ('1664', '107', 'Fukushima', 'FS', '1');
INSERT INTO `zone` VALUES ('1665', '107', 'Gifu', 'GI', '1');
INSERT INTO `zone` VALUES ('1666', '107', 'Gumma', 'GU', '1');
INSERT INTO `zone` VALUES ('1667', '107', 'Hiroshima', 'HI', '1');
INSERT INTO `zone` VALUES ('1668', '107', 'Hokkaido', 'HO', '1');
INSERT INTO `zone` VALUES ('1669', '107', 'Hyogo', 'HY', '1');
INSERT INTO `zone` VALUES ('1670', '107', 'Ibaraki', 'IB', '1');
INSERT INTO `zone` VALUES ('1671', '107', 'Ishikawa', 'IS', '1');
INSERT INTO `zone` VALUES ('1672', '107', 'Iwate', 'IW', '1');
INSERT INTO `zone` VALUES ('1673', '107', 'Kagawa', 'KA', '1');
INSERT INTO `zone` VALUES ('1674', '107', 'Kagoshima', 'KG', '1');
INSERT INTO `zone` VALUES ('1675', '107', 'Kanagawa', 'KN', '1');
INSERT INTO `zone` VALUES ('1676', '107', 'Kochi', 'KO', '1');
INSERT INTO `zone` VALUES ('1677', '107', 'Kumamoto', 'KU', '1');
INSERT INTO `zone` VALUES ('1678', '107', 'Kyoto', 'KY', '1');
INSERT INTO `zone` VALUES ('1679', '107', 'Mie', 'MI', '1');
INSERT INTO `zone` VALUES ('1680', '107', 'Miyagi', 'MY', '1');
INSERT INTO `zone` VALUES ('1681', '107', 'Miyazaki', 'MZ', '1');
INSERT INTO `zone` VALUES ('1682', '107', 'Nagano', 'NA', '1');
INSERT INTO `zone` VALUES ('1683', '107', 'Nagasaki', 'NG', '1');
INSERT INTO `zone` VALUES ('1684', '107', 'Nara', 'NR', '1');
INSERT INTO `zone` VALUES ('1685', '107', 'Niigata', 'NI', '1');
INSERT INTO `zone` VALUES ('1686', '107', 'Oita', 'OI', '1');
INSERT INTO `zone` VALUES ('1687', '107', 'Okayama', 'OK', '1');
INSERT INTO `zone` VALUES ('1688', '107', 'Okinawa', 'ON', '1');
INSERT INTO `zone` VALUES ('1689', '107', 'Osaka', 'OS', '1');
INSERT INTO `zone` VALUES ('1690', '107', 'Saga', 'SA', '1');
INSERT INTO `zone` VALUES ('1691', '107', 'Saitama', 'SI', '1');
INSERT INTO `zone` VALUES ('1692', '107', 'Shiga', 'SH', '1');
INSERT INTO `zone` VALUES ('1693', '107', 'Shimane', 'SM', '1');
INSERT INTO `zone` VALUES ('1694', '107', 'Shizuoka', 'SZ', '1');
INSERT INTO `zone` VALUES ('1695', '107', 'Tochigi', 'TO', '1');
INSERT INTO `zone` VALUES ('1696', '107', 'Tokushima', 'TS', '1');
INSERT INTO `zone` VALUES ('1697', '107', 'Tokyo', 'TK', '1');
INSERT INTO `zone` VALUES ('1698', '107', 'Tottori', 'TT', '1');
INSERT INTO `zone` VALUES ('1699', '107', 'Toyama', 'TY', '1');
INSERT INTO `zone` VALUES ('1700', '107', 'Wakayama', 'WA', '1');
INSERT INTO `zone` VALUES ('1701', '107', 'Yamagata', 'YA', '1');
INSERT INTO `zone` VALUES ('1702', '107', 'Yamaguchi', 'YM', '1');
INSERT INTO `zone` VALUES ('1703', '107', 'Yamanashi', 'YN', '1');
INSERT INTO `zone` VALUES ('1704', '108', '\'Amman', 'AM', '1');
INSERT INTO `zone` VALUES ('1705', '108', 'Ajlun', 'AJ', '1');
INSERT INTO `zone` VALUES ('1706', '108', 'Al \'Aqabah', 'AA', '1');
INSERT INTO `zone` VALUES ('1707', '108', 'Al Balqa\'', 'AB', '1');
INSERT INTO `zone` VALUES ('1708', '108', 'Al Karak', 'AK', '1');
INSERT INTO `zone` VALUES ('1709', '108', 'Al Mafraq', 'AL', '1');
INSERT INTO `zone` VALUES ('1710', '108', 'At Tafilah', 'AT', '1');
INSERT INTO `zone` VALUES ('1711', '108', 'Az Zarqa\'', 'AZ', '1');
INSERT INTO `zone` VALUES ('1712', '108', 'Irbid', 'IR', '1');
INSERT INTO `zone` VALUES ('1713', '108', 'Jarash', 'JA', '1');
INSERT INTO `zone` VALUES ('1714', '108', 'Ma\'an', 'MA', '1');
INSERT INTO `zone` VALUES ('1715', '108', 'Madaba', 'MD', '1');
INSERT INTO `zone` VALUES ('1716', '109', 'Almaty', 'AL', '1');
INSERT INTO `zone` VALUES ('1717', '109', 'Almaty City', 'AC', '1');
INSERT INTO `zone` VALUES ('1718', '109', 'Aqmola', 'AM', '1');
INSERT INTO `zone` VALUES ('1719', '109', 'Aqtobe', 'AQ', '1');
INSERT INTO `zone` VALUES ('1720', '109', 'Astana City', 'AS', '1');
INSERT INTO `zone` VALUES ('1721', '109', 'Atyrau', 'AT', '1');
INSERT INTO `zone` VALUES ('1722', '109', 'Batys Qazaqstan', 'BA', '1');
INSERT INTO `zone` VALUES ('1723', '109', 'Bayqongyr City', 'BY', '1');
INSERT INTO `zone` VALUES ('1724', '109', 'Mangghystau', 'MA', '1');
INSERT INTO `zone` VALUES ('1725', '109', 'Ongtustik Qazaqstan', 'ON', '1');
INSERT INTO `zone` VALUES ('1726', '109', 'Pavlodar', 'PA', '1');
INSERT INTO `zone` VALUES ('1727', '109', 'Qaraghandy', 'QA', '1');
INSERT INTO `zone` VALUES ('1728', '109', 'Qostanay', 'QO', '1');
INSERT INTO `zone` VALUES ('1729', '109', 'Qyzylorda', 'QY', '1');
INSERT INTO `zone` VALUES ('1730', '109', 'Shyghys Qazaqstan', 'SH', '1');
INSERT INTO `zone` VALUES ('1731', '109', 'Soltustik Qazaqstan', 'SO', '1');
INSERT INTO `zone` VALUES ('1732', '109', 'Zhambyl', 'ZH', '1');
INSERT INTO `zone` VALUES ('1733', '110', 'Central', 'CE', '1');
INSERT INTO `zone` VALUES ('1734', '110', 'Coast', 'CO', '1');
INSERT INTO `zone` VALUES ('1735', '110', 'Eastern', 'EA', '1');
INSERT INTO `zone` VALUES ('1736', '110', 'Nairobi Area', 'NA', '1');
INSERT INTO `zone` VALUES ('1737', '110', 'North Eastern', 'NE', '1');
INSERT INTO `zone` VALUES ('1738', '110', 'Nyanza', 'NY', '1');
INSERT INTO `zone` VALUES ('1739', '110', 'Rift Valley', 'RV', '1');
INSERT INTO `zone` VALUES ('1740', '110', 'Western', 'WE', '1');
INSERT INTO `zone` VALUES ('1741', '111', 'Abaiang', 'AG', '1');
INSERT INTO `zone` VALUES ('1742', '111', 'Abemama', 'AM', '1');
INSERT INTO `zone` VALUES ('1743', '111', 'Aranuka', 'AK', '1');
INSERT INTO `zone` VALUES ('1744', '111', 'Arorae', 'AO', '1');
INSERT INTO `zone` VALUES ('1745', '111', 'Banaba', 'BA', '1');
INSERT INTO `zone` VALUES ('1746', '111', 'Beru', 'BE', '1');
INSERT INTO `zone` VALUES ('1747', '111', 'Butaritari', 'bT', '1');
INSERT INTO `zone` VALUES ('1748', '111', 'Kanton', 'KA', '1');
INSERT INTO `zone` VALUES ('1749', '111', 'Kiritimati', 'KR', '1');
INSERT INTO `zone` VALUES ('1750', '111', 'Kuria', 'KU', '1');
INSERT INTO `zone` VALUES ('1751', '111', 'Maiana', 'MI', '1');
INSERT INTO `zone` VALUES ('1752', '111', 'Makin', 'MN', '1');
INSERT INTO `zone` VALUES ('1753', '111', 'Marakei', 'ME', '1');
INSERT INTO `zone` VALUES ('1754', '111', 'Nikunau', 'NI', '1');
INSERT INTO `zone` VALUES ('1755', '111', 'Nonouti', 'NO', '1');
INSERT INTO `zone` VALUES ('1756', '111', 'Onotoa', 'ON', '1');
INSERT INTO `zone` VALUES ('1757', '111', 'Tabiteuea', 'TT', '1');
INSERT INTO `zone` VALUES ('1758', '111', 'Tabuaeran', 'TR', '1');
INSERT INTO `zone` VALUES ('1759', '111', 'Tamana', 'TM', '1');
INSERT INTO `zone` VALUES ('1760', '111', 'Tarawa', 'TW', '1');
INSERT INTO `zone` VALUES ('1761', '111', 'Teraina', 'TE', '1');
INSERT INTO `zone` VALUES ('1762', '112', 'Chagang-do', 'CHA', '1');
INSERT INTO `zone` VALUES ('1763', '112', 'Hamgyong-bukto', 'HAB', '1');
INSERT INTO `zone` VALUES ('1764', '112', 'Hamgyong-namdo', 'HAN', '1');
INSERT INTO `zone` VALUES ('1765', '112', 'Hwanghae-bukto', 'HWB', '1');
INSERT INTO `zone` VALUES ('1766', '112', 'Hwanghae-namdo', 'HWN', '1');
INSERT INTO `zone` VALUES ('1767', '112', 'Kangwon-do', 'KAN', '1');
INSERT INTO `zone` VALUES ('1768', '112', 'P\'yongan-bukto', 'PYB', '1');
INSERT INTO `zone` VALUES ('1769', '112', 'P\'yongan-namdo', 'PYN', '1');
INSERT INTO `zone` VALUES ('1770', '112', 'Ryanggang-do (Yanggang-do)', 'YAN', '1');
INSERT INTO `zone` VALUES ('1771', '112', 'Rason Directly Governed City', 'NAJ', '1');
INSERT INTO `zone` VALUES ('1772', '112', 'P\'yongyang Special City', 'PYO', '1');
INSERT INTO `zone` VALUES ('1773', '113', 'Ch\'ungch\'ong-bukto', 'CO', '1');
INSERT INTO `zone` VALUES ('1774', '113', 'Ch\'ungch\'ong-namdo', 'CH', '1');
INSERT INTO `zone` VALUES ('1775', '113', 'Cheju-do', 'CD', '1');
INSERT INTO `zone` VALUES ('1776', '113', 'Cholla-bukto', 'CB', '1');
INSERT INTO `zone` VALUES ('1777', '113', 'Cholla-namdo', 'CN', '1');
INSERT INTO `zone` VALUES ('1778', '113', 'Inch\'on-gwangyoksi', 'IG', '1');
INSERT INTO `zone` VALUES ('1779', '113', 'Kangwon-do', 'KA', '1');
INSERT INTO `zone` VALUES ('1780', '113', 'Kwangju-gwangyoksi', 'KG', '1');
INSERT INTO `zone` VALUES ('1781', '113', 'Kyonggi-do', 'KD', '1');
INSERT INTO `zone` VALUES ('1782', '113', 'Kyongsang-bukto', 'KB', '1');
INSERT INTO `zone` VALUES ('1783', '113', 'Kyongsang-namdo', 'KN', '1');
INSERT INTO `zone` VALUES ('1784', '113', 'Pusan-gwangyoksi', 'PG', '1');
INSERT INTO `zone` VALUES ('1785', '113', 'Soul-t\'ukpyolsi', 'SO', '1');
INSERT INTO `zone` VALUES ('1786', '113', 'Taegu-gwangyoksi', 'TA', '1');
INSERT INTO `zone` VALUES ('1787', '113', 'Taejon-gwangyoksi', 'TG', '1');
INSERT INTO `zone` VALUES ('1788', '114', 'Al \'Asimah', 'AL', '1');
INSERT INTO `zone` VALUES ('1789', '114', 'Al Ahmadi', 'AA', '1');
INSERT INTO `zone` VALUES ('1790', '114', 'Al Farwaniyah', 'AF', '1');
INSERT INTO `zone` VALUES ('1791', '114', 'Al Jahra\'', 'AJ', '1');
INSERT INTO `zone` VALUES ('1792', '114', 'Hawalli', 'HA', '1');
INSERT INTO `zone` VALUES ('1793', '115', 'Bishkek', 'GB', '1');
INSERT INTO `zone` VALUES ('1794', '115', 'Batken', 'B', '1');
INSERT INTO `zone` VALUES ('1795', '115', 'Chu', 'C', '1');
INSERT INTO `zone` VALUES ('1796', '115', 'Jalal-Abad', 'J', '1');
INSERT INTO `zone` VALUES ('1797', '115', 'Naryn', 'N', '1');
INSERT INTO `zone` VALUES ('1798', '115', 'Osh', 'O', '1');
INSERT INTO `zone` VALUES ('1799', '115', 'Talas', 'T', '1');
INSERT INTO `zone` VALUES ('1800', '115', 'Ysyk-Kol', 'Y', '1');
INSERT INTO `zone` VALUES ('1801', '116', 'Vientiane', 'VT', '1');
INSERT INTO `zone` VALUES ('1802', '116', 'Attapu', 'AT', '1');
INSERT INTO `zone` VALUES ('1803', '116', 'Bokeo', 'BK', '1');
INSERT INTO `zone` VALUES ('1804', '116', 'Bolikhamxai', 'BL', '1');
INSERT INTO `zone` VALUES ('1805', '116', 'Champasak', 'CH', '1');
INSERT INTO `zone` VALUES ('1806', '116', 'Houaphan', 'HO', '1');
INSERT INTO `zone` VALUES ('1807', '116', 'Khammouan', 'KH', '1');
INSERT INTO `zone` VALUES ('1808', '116', 'Louang Namtha', 'LM', '1');
INSERT INTO `zone` VALUES ('1809', '116', 'Louangphabang', 'LP', '1');
INSERT INTO `zone` VALUES ('1810', '116', 'Oudomxai', 'OU', '1');
INSERT INTO `zone` VALUES ('1811', '116', 'Phongsali', 'PH', '1');
INSERT INTO `zone` VALUES ('1812', '116', 'Salavan', 'SL', '1');
INSERT INTO `zone` VALUES ('1813', '116', 'Savannakhet', 'SV', '1');
INSERT INTO `zone` VALUES ('1814', '116', 'Vientiane', 'VI', '1');
INSERT INTO `zone` VALUES ('1815', '116', 'Xaignabouli', 'XA', '1');
INSERT INTO `zone` VALUES ('1816', '116', 'Xekong', 'XE', '1');
INSERT INTO `zone` VALUES ('1817', '116', 'Xiangkhoang', 'XI', '1');
INSERT INTO `zone` VALUES ('1818', '116', 'Xaisomboun', 'XN', '1');
INSERT INTO `zone` VALUES ('1819', '117', 'Aizkraukles Rajons', 'AIZ', '1');
INSERT INTO `zone` VALUES ('1820', '117', 'Aluksnes Rajons', 'ALU', '1');
INSERT INTO `zone` VALUES ('1821', '117', 'Balvu Rajons', 'BAL', '1');
INSERT INTO `zone` VALUES ('1822', '117', 'Bauskas Rajons', 'BAU', '1');
INSERT INTO `zone` VALUES ('1823', '117', 'Cesu Rajons', 'CES', '1');
INSERT INTO `zone` VALUES ('1824', '117', 'Daugavpils Rajons', 'DGR', '1');
INSERT INTO `zone` VALUES ('1825', '117', 'Dobeles Rajons', 'DOB', '1');
INSERT INTO `zone` VALUES ('1826', '117', 'Gulbenes Rajons', 'GUL', '1');
INSERT INTO `zone` VALUES ('1827', '117', 'Jekabpils Rajons', 'JEK', '1');
INSERT INTO `zone` VALUES ('1828', '117', 'Jelgavas Rajons', 'JGR', '1');
INSERT INTO `zone` VALUES ('1829', '117', 'Kraslavas Rajons', 'KRA', '1');
INSERT INTO `zone` VALUES ('1830', '117', 'Kuldigas Rajons', 'KUL', '1');
INSERT INTO `zone` VALUES ('1831', '117', 'Liepajas Rajons', 'LPR', '1');
INSERT INTO `zone` VALUES ('1832', '117', 'Limbazu Rajons', 'LIM', '1');
INSERT INTO `zone` VALUES ('1833', '117', 'Ludzas Rajons', 'LUD', '1');
INSERT INTO `zone` VALUES ('1834', '117', 'Madonas Rajons', 'MAD', '1');
INSERT INTO `zone` VALUES ('1835', '117', 'Ogres Rajons', 'OGR', '1');
INSERT INTO `zone` VALUES ('1836', '117', 'Preilu Rajons', 'PRE', '1');
INSERT INTO `zone` VALUES ('1837', '117', 'Rezeknes Rajons', 'RZR', '1');
INSERT INTO `zone` VALUES ('1838', '117', 'Rigas Rajons', 'RGR', '1');
INSERT INTO `zone` VALUES ('1839', '117', 'Saldus Rajons', 'SAL', '1');
INSERT INTO `zone` VALUES ('1840', '117', 'Talsu Rajons', 'TAL', '1');
INSERT INTO `zone` VALUES ('1841', '117', 'Tukuma Rajons', 'TUK', '1');
INSERT INTO `zone` VALUES ('1842', '117', 'Valkas Rajons', 'VLK', '1');
INSERT INTO `zone` VALUES ('1843', '117', 'Valmieras Rajons', 'VLM', '1');
INSERT INTO `zone` VALUES ('1844', '117', 'Ventspils Rajons', 'VSR', '1');
INSERT INTO `zone` VALUES ('1845', '117', 'Daugavpils', 'DGV', '1');
INSERT INTO `zone` VALUES ('1846', '117', 'Jelgava', 'JGV', '1');
INSERT INTO `zone` VALUES ('1847', '117', 'Jurmala', 'JUR', '1');
INSERT INTO `zone` VALUES ('1848', '117', 'Liepaja', 'LPK', '1');
INSERT INTO `zone` VALUES ('1849', '117', 'Rezekne', 'RZK', '1');
INSERT INTO `zone` VALUES ('1850', '117', 'Riga', 'RGA', '1');
INSERT INTO `zone` VALUES ('1851', '117', 'Ventspils', 'VSL', '1');
INSERT INTO `zone` VALUES ('1852', '119', 'Berea', 'BE', '1');
INSERT INTO `zone` VALUES ('1853', '119', 'Butha-Buthe', 'BB', '1');
INSERT INTO `zone` VALUES ('1854', '119', 'Leribe', 'LE', '1');
INSERT INTO `zone` VALUES ('1855', '119', 'Mafeteng', 'MF', '1');
INSERT INTO `zone` VALUES ('1856', '119', 'Maseru', 'MS', '1');
INSERT INTO `zone` VALUES ('1857', '119', 'Mohale\'s Hoek', 'MH', '1');
INSERT INTO `zone` VALUES ('1858', '119', 'Mokhotlong', 'MK', '1');
INSERT INTO `zone` VALUES ('1859', '119', 'Qacha\'s Nek', 'QN', '1');
INSERT INTO `zone` VALUES ('1860', '119', 'Quthing', 'QT', '1');
INSERT INTO `zone` VALUES ('1861', '119', 'Thaba-Tseka', 'TT', '1');
INSERT INTO `zone` VALUES ('1862', '120', 'Bomi', 'BI', '1');
INSERT INTO `zone` VALUES ('1863', '120', 'Bong', 'BG', '1');
INSERT INTO `zone` VALUES ('1864', '120', 'Grand Bassa', 'GB', '1');
INSERT INTO `zone` VALUES ('1865', '120', 'Grand Cape Mount', 'CM', '1');
INSERT INTO `zone` VALUES ('1866', '120', 'Grand Gedeh', 'GG', '1');
INSERT INTO `zone` VALUES ('1867', '120', 'Grand Kru', 'GK', '1');
INSERT INTO `zone` VALUES ('1868', '120', 'Lofa', 'LO', '1');
INSERT INTO `zone` VALUES ('1869', '120', 'Margibi', 'MG', '1');
INSERT INTO `zone` VALUES ('1870', '120', 'Maryland', 'ML', '1');
INSERT INTO `zone` VALUES ('1871', '120', 'Montserrado', 'MS', '1');
INSERT INTO `zone` VALUES ('1872', '120', 'Nimba', 'NB', '1');
INSERT INTO `zone` VALUES ('1873', '120', 'River Cess', 'RC', '1');
INSERT INTO `zone` VALUES ('1874', '120', 'Sinoe', 'SN', '1');
INSERT INTO `zone` VALUES ('1875', '121', 'Ajdabiya', 'AJ', '1');
INSERT INTO `zone` VALUES ('1876', '121', 'Al \'Aziziyah', 'AZ', '1');
INSERT INTO `zone` VALUES ('1877', '121', 'Al Fatih', 'FA', '1');
INSERT INTO `zone` VALUES ('1878', '121', 'Al Jabal al Akhdar', 'JA', '1');
INSERT INTO `zone` VALUES ('1879', '121', 'Al Jufrah', 'JU', '1');
INSERT INTO `zone` VALUES ('1880', '121', 'Al Khums', 'KH', '1');
INSERT INTO `zone` VALUES ('1881', '121', 'Al Kufrah', 'KU', '1');
INSERT INTO `zone` VALUES ('1882', '121', 'An Nuqat al Khams', 'NK', '1');
INSERT INTO `zone` VALUES ('1883', '121', 'Ash Shati\'', 'AS', '1');
INSERT INTO `zone` VALUES ('1884', '121', 'Awbari', 'AW', '1');
INSERT INTO `zone` VALUES ('1885', '121', 'Az Zawiyah', 'ZA', '1');
INSERT INTO `zone` VALUES ('1886', '121', 'Banghazi', 'BA', '1');
INSERT INTO `zone` VALUES ('1887', '121', 'Darnah', 'DA', '1');
INSERT INTO `zone` VALUES ('1888', '121', 'Ghadamis', 'GD', '1');
INSERT INTO `zone` VALUES ('1889', '121', 'Gharyan', 'GY', '1');
INSERT INTO `zone` VALUES ('1890', '121', 'Misratah', 'MI', '1');
INSERT INTO `zone` VALUES ('1891', '121', 'Murzuq', 'MZ', '1');
INSERT INTO `zone` VALUES ('1892', '121', 'Sabha', 'SB', '1');
INSERT INTO `zone` VALUES ('1893', '121', 'Sawfajjin', 'SW', '1');
INSERT INTO `zone` VALUES ('1894', '121', 'Surt', 'SU', '1');
INSERT INTO `zone` VALUES ('1895', '121', 'Tarabulus (Tripoli)', 'TL', '1');
INSERT INTO `zone` VALUES ('1896', '121', 'Tarhunah', 'TH', '1');
INSERT INTO `zone` VALUES ('1897', '121', 'Tubruq', 'TU', '1');
INSERT INTO `zone` VALUES ('1898', '121', 'Yafran', 'YA', '1');
INSERT INTO `zone` VALUES ('1899', '121', 'Zlitan', 'ZL', '1');
INSERT INTO `zone` VALUES ('1900', '122', 'Vaduz', 'V', '1');
INSERT INTO `zone` VALUES ('1901', '122', 'Schaan', 'A', '1');
INSERT INTO `zone` VALUES ('1902', '122', 'Balzers', 'B', '1');
INSERT INTO `zone` VALUES ('1903', '122', 'Triesen', 'N', '1');
INSERT INTO `zone` VALUES ('1904', '122', 'Eschen', 'E', '1');
INSERT INTO `zone` VALUES ('1905', '122', 'Mauren', 'M', '1');
INSERT INTO `zone` VALUES ('1906', '122', 'Triesenberg', 'T', '1');
INSERT INTO `zone` VALUES ('1907', '122', 'Ruggell', 'R', '1');
INSERT INTO `zone` VALUES ('1908', '122', 'Gamprin', 'G', '1');
INSERT INTO `zone` VALUES ('1909', '122', 'Schellenberg', 'L', '1');
INSERT INTO `zone` VALUES ('1910', '122', 'Planken', 'P', '1');
INSERT INTO `zone` VALUES ('1911', '123', 'Alytus', 'AL', '1');
INSERT INTO `zone` VALUES ('1912', '123', 'Kaunas', 'KA', '1');
INSERT INTO `zone` VALUES ('1913', '123', 'Klaipeda', 'KL', '1');
INSERT INTO `zone` VALUES ('1914', '123', 'Marijampole', 'MA', '1');
INSERT INTO `zone` VALUES ('1915', '123', 'Panevezys', 'PA', '1');
INSERT INTO `zone` VALUES ('1916', '123', 'Siauliai', 'SI', '1');
INSERT INTO `zone` VALUES ('1917', '123', 'Taurage', 'TA', '1');
INSERT INTO `zone` VALUES ('1918', '123', 'Telsiai', 'TE', '1');
INSERT INTO `zone` VALUES ('1919', '123', 'Utena', 'UT', '1');
INSERT INTO `zone` VALUES ('1920', '123', 'Vilnius', 'VI', '1');
INSERT INTO `zone` VALUES ('1921', '124', 'Diekirch', 'DD', '1');
INSERT INTO `zone` VALUES ('1922', '124', 'Clervaux', 'DC', '1');
INSERT INTO `zone` VALUES ('1923', '124', 'Redange', 'DR', '1');
INSERT INTO `zone` VALUES ('1924', '124', 'Vianden', 'DV', '1');
INSERT INTO `zone` VALUES ('1925', '124', 'Wiltz', 'DW', '1');
INSERT INTO `zone` VALUES ('1926', '124', 'Grevenmacher', 'GG', '1');
INSERT INTO `zone` VALUES ('1927', '124', 'Echternach', 'GE', '1');
INSERT INTO `zone` VALUES ('1928', '124', 'Remich', 'GR', '1');
INSERT INTO `zone` VALUES ('1929', '124', 'Luxembourg', 'LL', '1');
INSERT INTO `zone` VALUES ('1930', '124', 'Capellen', 'LC', '1');
INSERT INTO `zone` VALUES ('1931', '124', 'Esch-sur-Alzette', 'LE', '1');
INSERT INTO `zone` VALUES ('1932', '124', 'Mersch', 'LM', '1');
INSERT INTO `zone` VALUES ('1933', '125', 'Our Lady Fatima Parish', 'OLF', '1');
INSERT INTO `zone` VALUES ('1934', '125', 'St. Anthony Parish', 'ANT', '1');
INSERT INTO `zone` VALUES ('1935', '125', 'St. Lazarus Parish', 'LAZ', '1');
INSERT INTO `zone` VALUES ('1936', '125', 'Cathedral Parish', 'CAT', '1');
INSERT INTO `zone` VALUES ('1937', '125', 'St. Lawrence Parish', 'LAW', '1');
INSERT INTO `zone` VALUES ('1938', '127', 'Antananarivo', 'AN', '1');
INSERT INTO `zone` VALUES ('1939', '127', 'Antsiranana', 'AS', '1');
INSERT INTO `zone` VALUES ('1940', '127', 'Fianarantsoa', 'FN', '1');
INSERT INTO `zone` VALUES ('1941', '127', 'Mahajanga', 'MJ', '1');
INSERT INTO `zone` VALUES ('1942', '127', 'Toamasina', 'TM', '1');
INSERT INTO `zone` VALUES ('1943', '127', 'Toliara', 'TL', '1');
INSERT INTO `zone` VALUES ('1944', '128', 'Balaka', 'BLK', '1');
INSERT INTO `zone` VALUES ('1945', '128', 'Blantyre', 'BLT', '1');
INSERT INTO `zone` VALUES ('1946', '128', 'Chikwawa', 'CKW', '1');
INSERT INTO `zone` VALUES ('1947', '128', 'Chiradzulu', 'CRD', '1');
INSERT INTO `zone` VALUES ('1948', '128', 'Chitipa', 'CTP', '1');
INSERT INTO `zone` VALUES ('1949', '128', 'Dedza', 'DDZ', '1');
INSERT INTO `zone` VALUES ('1950', '128', 'Dowa', 'DWA', '1');
INSERT INTO `zone` VALUES ('1951', '128', 'Karonga', 'KRG', '1');
INSERT INTO `zone` VALUES ('1952', '128', 'Kasungu', 'KSG', '1');
INSERT INTO `zone` VALUES ('1953', '128', 'Likoma', 'LKM', '1');
INSERT INTO `zone` VALUES ('1954', '128', 'Lilongwe', 'LLG', '1');
INSERT INTO `zone` VALUES ('1955', '128', 'Machinga', 'MCG', '1');
INSERT INTO `zone` VALUES ('1956', '128', 'Mangochi', 'MGC', '1');
INSERT INTO `zone` VALUES ('1957', '128', 'Mchinji', 'MCH', '1');
INSERT INTO `zone` VALUES ('1958', '128', 'Mulanje', 'MLJ', '1');
INSERT INTO `zone` VALUES ('1959', '128', 'Mwanza', 'MWZ', '1');
INSERT INTO `zone` VALUES ('1960', '128', 'Mzimba', 'MZM', '1');
INSERT INTO `zone` VALUES ('1961', '128', 'Ntcheu', 'NTU', '1');
INSERT INTO `zone` VALUES ('1962', '128', 'Nkhata Bay', 'NKB', '1');
INSERT INTO `zone` VALUES ('1963', '128', 'Nkhotakota', 'NKH', '1');
INSERT INTO `zone` VALUES ('1964', '128', 'Nsanje', 'NSJ', '1');
INSERT INTO `zone` VALUES ('1965', '128', 'Ntchisi', 'NTI', '1');
INSERT INTO `zone` VALUES ('1966', '128', 'Phalombe', 'PHL', '1');
INSERT INTO `zone` VALUES ('1967', '128', 'Rumphi', 'RMP', '1');
INSERT INTO `zone` VALUES ('1968', '128', 'Salima', 'SLM', '1');
INSERT INTO `zone` VALUES ('1969', '128', 'Thyolo', 'THY', '1');
INSERT INTO `zone` VALUES ('1970', '128', 'Zomba', 'ZBA', '1');
INSERT INTO `zone` VALUES ('1971', '129', 'Johor', 'JO', '1');
INSERT INTO `zone` VALUES ('1972', '129', 'Kedah', 'KE', '1');
INSERT INTO `zone` VALUES ('1973', '129', 'Kelantan', 'KL', '1');
INSERT INTO `zone` VALUES ('1974', '129', 'Labuan', 'LA', '1');
INSERT INTO `zone` VALUES ('1975', '129', 'Melaka', 'ME', '1');
INSERT INTO `zone` VALUES ('1976', '129', 'Negeri Sembilan', 'NS', '1');
INSERT INTO `zone` VALUES ('1977', '129', 'Pahang', 'PA', '1');
INSERT INTO `zone` VALUES ('1978', '129', 'Perak', 'PE', '1');
INSERT INTO `zone` VALUES ('1979', '129', 'Perlis', 'PR', '1');
INSERT INTO `zone` VALUES ('1980', '129', 'Pulau Pinang', 'PP', '1');
INSERT INTO `zone` VALUES ('1981', '129', 'Sabah', 'SA', '1');
INSERT INTO `zone` VALUES ('1982', '129', 'Sarawak', 'SR', '1');
INSERT INTO `zone` VALUES ('1983', '129', 'Selangor', 'SE', '1');
INSERT INTO `zone` VALUES ('1984', '129', 'Terengganu', 'TE', '1');
INSERT INTO `zone` VALUES ('1985', '129', 'Wilayah Persekutuan', 'WP', '1');
INSERT INTO `zone` VALUES ('1986', '130', 'Thiladhunmathi Uthuru', 'THU', '1');
INSERT INTO `zone` VALUES ('1987', '130', 'Thiladhunmathi Dhekunu', 'THD', '1');
INSERT INTO `zone` VALUES ('1988', '130', 'Miladhunmadulu Uthuru', 'MLU', '1');
INSERT INTO `zone` VALUES ('1989', '130', 'Miladhunmadulu Dhekunu', 'MLD', '1');
INSERT INTO `zone` VALUES ('1990', '130', 'Maalhosmadulu Uthuru', 'MAU', '1');
INSERT INTO `zone` VALUES ('1991', '130', 'Maalhosmadulu Dhekunu', 'MAD', '1');
INSERT INTO `zone` VALUES ('1992', '130', 'Faadhippolhu', 'FAA', '1');
INSERT INTO `zone` VALUES ('1993', '130', 'Male Atoll', 'MAA', '1');
INSERT INTO `zone` VALUES ('1994', '130', 'Ari Atoll Uthuru', 'AAU', '1');
INSERT INTO `zone` VALUES ('1995', '130', 'Ari Atoll Dheknu', 'AAD', '1');
INSERT INTO `zone` VALUES ('1996', '130', 'Felidhe Atoll', 'FEA', '1');
INSERT INTO `zone` VALUES ('1997', '130', 'Mulaku Atoll', 'MUA', '1');
INSERT INTO `zone` VALUES ('1998', '130', 'Nilandhe Atoll Uthuru', 'NAU', '1');
INSERT INTO `zone` VALUES ('1999', '130', 'Nilandhe Atoll Dhekunu', 'NAD', '1');
INSERT INTO `zone` VALUES ('2000', '130', 'Kolhumadulu', 'KLH', '1');
INSERT INTO `zone` VALUES ('2001', '130', 'Hadhdhunmathi', 'HDH', '1');
INSERT INTO `zone` VALUES ('2002', '130', 'Huvadhu Atoll Uthuru', 'HAU', '1');
INSERT INTO `zone` VALUES ('2003', '130', 'Huvadhu Atoll Dhekunu', 'HAD', '1');
INSERT INTO `zone` VALUES ('2004', '130', 'Fua Mulaku', 'FMU', '1');
INSERT INTO `zone` VALUES ('2005', '130', 'Addu', 'ADD', '1');
INSERT INTO `zone` VALUES ('2006', '131', 'Gao', 'GA', '1');
INSERT INTO `zone` VALUES ('2007', '131', 'Kayes', 'KY', '1');
INSERT INTO `zone` VALUES ('2008', '131', 'Kidal', 'KD', '1');
INSERT INTO `zone` VALUES ('2009', '131', 'Koulikoro', 'KL', '1');
INSERT INTO `zone` VALUES ('2010', '131', 'Mopti', 'MP', '1');
INSERT INTO `zone` VALUES ('2011', '131', 'Segou', 'SG', '1');
INSERT INTO `zone` VALUES ('2012', '131', 'Sikasso', 'SK', '1');
INSERT INTO `zone` VALUES ('2013', '131', 'Tombouctou', 'TB', '1');
INSERT INTO `zone` VALUES ('2014', '131', 'Bamako Capital District', 'CD', '1');
INSERT INTO `zone` VALUES ('2015', '132', 'Attard', 'ATT', '1');
INSERT INTO `zone` VALUES ('2016', '132', 'Balzan', 'BAL', '1');
INSERT INTO `zone` VALUES ('2017', '132', 'Birgu', 'BGU', '1');
INSERT INTO `zone` VALUES ('2018', '132', 'Birkirkara', 'BKK', '1');
INSERT INTO `zone` VALUES ('2019', '132', 'Birzebbuga', 'BRZ', '1');
INSERT INTO `zone` VALUES ('2020', '132', 'Bormla', 'BOR', '1');
INSERT INTO `zone` VALUES ('2021', '132', 'Dingli', 'DIN', '1');
INSERT INTO `zone` VALUES ('2022', '132', 'Fgura', 'FGU', '1');
INSERT INTO `zone` VALUES ('2023', '132', 'Floriana', 'FLO', '1');
INSERT INTO `zone` VALUES ('2024', '132', 'Gudja', 'GDJ', '1');
INSERT INTO `zone` VALUES ('2025', '132', 'Gzira', 'GZR', '1');
INSERT INTO `zone` VALUES ('2026', '132', 'Gargur', 'GRG', '1');
INSERT INTO `zone` VALUES ('2027', '132', 'Gaxaq', 'GXQ', '1');
INSERT INTO `zone` VALUES ('2028', '132', 'Hamrun', 'HMR', '1');
INSERT INTO `zone` VALUES ('2029', '132', 'Iklin', 'IKL', '1');
INSERT INTO `zone` VALUES ('2030', '132', 'Isla', 'ISL', '1');
INSERT INTO `zone` VALUES ('2031', '132', 'Kalkara', 'KLK', '1');
INSERT INTO `zone` VALUES ('2032', '132', 'Kirkop', 'KRK', '1');
INSERT INTO `zone` VALUES ('2033', '132', 'Lija', 'LIJ', '1');
INSERT INTO `zone` VALUES ('2034', '132', 'Luqa', 'LUQ', '1');
INSERT INTO `zone` VALUES ('2035', '132', 'Marsa', 'MRS', '1');
INSERT INTO `zone` VALUES ('2036', '132', 'Marsaskala', 'MKL', '1');
INSERT INTO `zone` VALUES ('2037', '132', 'Marsaxlokk', 'MXL', '1');
INSERT INTO `zone` VALUES ('2038', '132', 'Mdina', 'MDN', '1');
INSERT INTO `zone` VALUES ('2039', '132', 'Melliea', 'MEL', '1');
INSERT INTO `zone` VALUES ('2040', '132', 'Mgarr', 'MGR', '1');
INSERT INTO `zone` VALUES ('2041', '132', 'Mosta', 'MST', '1');
INSERT INTO `zone` VALUES ('2042', '132', 'Mqabba', 'MQA', '1');
INSERT INTO `zone` VALUES ('2043', '132', 'Msida', 'MSI', '1');
INSERT INTO `zone` VALUES ('2044', '132', 'Mtarfa', 'MTF', '1');
INSERT INTO `zone` VALUES ('2045', '132', 'Naxxar', 'NAX', '1');
INSERT INTO `zone` VALUES ('2046', '132', 'Paola', 'PAO', '1');
INSERT INTO `zone` VALUES ('2047', '132', 'Pembroke', 'PEM', '1');
INSERT INTO `zone` VALUES ('2048', '132', 'Pieta', 'PIE', '1');
INSERT INTO `zone` VALUES ('2049', '132', 'Qormi', 'QOR', '1');
INSERT INTO `zone` VALUES ('2050', '132', 'Qrendi', 'QRE', '1');
INSERT INTO `zone` VALUES ('2051', '132', 'Rabat', 'RAB', '1');
INSERT INTO `zone` VALUES ('2052', '132', 'Safi', 'SAF', '1');
INSERT INTO `zone` VALUES ('2053', '132', 'San Giljan', 'SGI', '1');
INSERT INTO `zone` VALUES ('2054', '132', 'Santa Lucija', 'SLU', '1');
INSERT INTO `zone` VALUES ('2055', '132', 'San Pawl il-Bahar', 'SPB', '1');
INSERT INTO `zone` VALUES ('2056', '132', 'San Gwann', 'SGW', '1');
INSERT INTO `zone` VALUES ('2057', '132', 'Santa Venera', 'SVE', '1');
INSERT INTO `zone` VALUES ('2058', '132', 'Siggiewi', 'SIG', '1');
INSERT INTO `zone` VALUES ('2059', '132', 'Sliema', 'SLM', '1');
INSERT INTO `zone` VALUES ('2060', '132', 'Swieqi', 'SWQ', '1');
INSERT INTO `zone` VALUES ('2061', '132', 'Ta Xbiex', 'TXB', '1');
INSERT INTO `zone` VALUES ('2062', '132', 'Tarxien', 'TRX', '1');
INSERT INTO `zone` VALUES ('2063', '132', 'Valletta', 'VLT', '1');
INSERT INTO `zone` VALUES ('2064', '132', 'Xgajra', 'XGJ', '1');
INSERT INTO `zone` VALUES ('2065', '132', 'Zabbar', 'ZBR', '1');
INSERT INTO `zone` VALUES ('2066', '132', 'Zebbug', 'ZBG', '1');
INSERT INTO `zone` VALUES ('2067', '132', 'Zejtun', 'ZJT', '1');
INSERT INTO `zone` VALUES ('2068', '132', 'Zurrieq', 'ZRQ', '1');
INSERT INTO `zone` VALUES ('2069', '132', 'Fontana', 'FNT', '1');
INSERT INTO `zone` VALUES ('2070', '132', 'Ghajnsielem', 'GHJ', '1');
INSERT INTO `zone` VALUES ('2071', '132', 'Gharb', 'GHR', '1');
INSERT INTO `zone` VALUES ('2072', '132', 'Ghasri', 'GHS', '1');
INSERT INTO `zone` VALUES ('2073', '132', 'Kercem', 'KRC', '1');
INSERT INTO `zone` VALUES ('2074', '132', 'Munxar', 'MUN', '1');
INSERT INTO `zone` VALUES ('2075', '132', 'Nadur', 'NAD', '1');
INSERT INTO `zone` VALUES ('2076', '132', 'Qala', 'QAL', '1');
INSERT INTO `zone` VALUES ('2077', '132', 'Victoria', 'VIC', '1');
INSERT INTO `zone` VALUES ('2078', '132', 'San Lawrenz', 'SLA', '1');
INSERT INTO `zone` VALUES ('2079', '132', 'Sannat', 'SNT', '1');
INSERT INTO `zone` VALUES ('2080', '132', 'Xagra', 'ZAG', '1');
INSERT INTO `zone` VALUES ('2081', '132', 'Xewkija', 'XEW', '1');
INSERT INTO `zone` VALUES ('2082', '132', 'Zebbug', 'ZEB', '1');
INSERT INTO `zone` VALUES ('2083', '133', 'Ailinginae', 'ALG', '1');
INSERT INTO `zone` VALUES ('2084', '133', 'Ailinglaplap', 'ALL', '1');
INSERT INTO `zone` VALUES ('2085', '133', 'Ailuk', 'ALK', '1');
INSERT INTO `zone` VALUES ('2086', '133', 'Arno', 'ARN', '1');
INSERT INTO `zone` VALUES ('2087', '133', 'Aur', 'AUR', '1');
INSERT INTO `zone` VALUES ('2088', '133', 'Bikar', 'BKR', '1');
INSERT INTO `zone` VALUES ('2089', '133', 'Bikini', 'BKN', '1');
INSERT INTO `zone` VALUES ('2090', '133', 'Bokak', 'BKK', '1');
INSERT INTO `zone` VALUES ('2091', '133', 'Ebon', 'EBN', '1');
INSERT INTO `zone` VALUES ('2092', '133', 'Enewetak', 'ENT', '1');
INSERT INTO `zone` VALUES ('2093', '133', 'Erikub', 'EKB', '1');
INSERT INTO `zone` VALUES ('2094', '133', 'Jabat', 'JBT', '1');
INSERT INTO `zone` VALUES ('2095', '133', 'Jaluit', 'JLT', '1');
INSERT INTO `zone` VALUES ('2096', '133', 'Jemo', 'JEM', '1');
INSERT INTO `zone` VALUES ('2097', '133', 'Kili', 'KIL', '1');
INSERT INTO `zone` VALUES ('2098', '133', 'Kwajalein', 'KWJ', '1');
INSERT INTO `zone` VALUES ('2099', '133', 'Lae', 'LAE', '1');
INSERT INTO `zone` VALUES ('2100', '133', 'Lib', 'LIB', '1');
INSERT INTO `zone` VALUES ('2101', '133', 'Likiep', 'LKP', '1');
INSERT INTO `zone` VALUES ('2102', '133', 'Majuro', 'MJR', '1');
INSERT INTO `zone` VALUES ('2103', '133', 'Maloelap', 'MLP', '1');
INSERT INTO `zone` VALUES ('2104', '133', 'Mejit', 'MJT', '1');
INSERT INTO `zone` VALUES ('2105', '133', 'Mili', 'MIL', '1');
INSERT INTO `zone` VALUES ('2106', '133', 'Namorik', 'NMK', '1');
INSERT INTO `zone` VALUES ('2107', '133', 'Namu', 'NAM', '1');
INSERT INTO `zone` VALUES ('2108', '133', 'Rongelap', 'RGL', '1');
INSERT INTO `zone` VALUES ('2109', '133', 'Rongrik', 'RGK', '1');
INSERT INTO `zone` VALUES ('2110', '133', 'Toke', 'TOK', '1');
INSERT INTO `zone` VALUES ('2111', '133', 'Ujae', 'UJA', '1');
INSERT INTO `zone` VALUES ('2112', '133', 'Ujelang', 'UJL', '1');
INSERT INTO `zone` VALUES ('2113', '133', 'Utirik', 'UTK', '1');
INSERT INTO `zone` VALUES ('2114', '133', 'Wotho', 'WTH', '1');
INSERT INTO `zone` VALUES ('2115', '133', 'Wotje', 'WTJ', '1');
INSERT INTO `zone` VALUES ('2116', '135', 'Adrar', 'AD', '1');
INSERT INTO `zone` VALUES ('2117', '135', 'Assaba', 'AS', '1');
INSERT INTO `zone` VALUES ('2118', '135', 'Brakna', 'BR', '1');
INSERT INTO `zone` VALUES ('2119', '135', 'Dakhlet Nouadhibou', 'DN', '1');
INSERT INTO `zone` VALUES ('2120', '135', 'Gorgol', 'GO', '1');
INSERT INTO `zone` VALUES ('2121', '135', 'Guidimaka', 'GM', '1');
INSERT INTO `zone` VALUES ('2122', '135', 'Hodh Ech Chargui', 'HC', '1');
INSERT INTO `zone` VALUES ('2123', '135', 'Hodh El Gharbi', 'HG', '1');
INSERT INTO `zone` VALUES ('2124', '135', 'Inchiri', 'IN', '1');
INSERT INTO `zone` VALUES ('2125', '135', 'Tagant', 'TA', '1');
INSERT INTO `zone` VALUES ('2126', '135', 'Tiris Zemmour', 'TZ', '1');
INSERT INTO `zone` VALUES ('2127', '135', 'Trarza', 'TR', '1');
INSERT INTO `zone` VALUES ('2128', '135', 'Nouakchott', 'NO', '1');
INSERT INTO `zone` VALUES ('2129', '136', 'Beau Bassin-Rose Hill', 'BR', '1');
INSERT INTO `zone` VALUES ('2130', '136', 'Curepipe', 'CU', '1');
INSERT INTO `zone` VALUES ('2131', '136', 'Port Louis', 'PU', '1');
INSERT INTO `zone` VALUES ('2132', '136', 'Quatre Bornes', 'QB', '1');
INSERT INTO `zone` VALUES ('2133', '136', 'Vacoas-Phoenix', 'VP', '1');
INSERT INTO `zone` VALUES ('2134', '136', 'Agalega Islands', 'AG', '1');
INSERT INTO `zone` VALUES ('2135', '136', 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', '1');
INSERT INTO `zone` VALUES ('2136', '136', 'Rodrigues', 'RO', '1');
INSERT INTO `zone` VALUES ('2137', '136', 'Black River', 'BL', '1');
INSERT INTO `zone` VALUES ('2138', '136', 'Flacq', 'FL', '1');
INSERT INTO `zone` VALUES ('2139', '136', 'Grand Port', 'GP', '1');
INSERT INTO `zone` VALUES ('2140', '136', 'Moka', 'MO', '1');
INSERT INTO `zone` VALUES ('2141', '136', 'Pamplemousses', 'PA', '1');
INSERT INTO `zone` VALUES ('2142', '136', 'Plaines Wilhems', 'PW', '1');
INSERT INTO `zone` VALUES ('2143', '136', 'Port Louis', 'PL', '1');
INSERT INTO `zone` VALUES ('2144', '136', 'Riviere du Rempart', 'RR', '1');
INSERT INTO `zone` VALUES ('2145', '136', 'Savanne', 'SA', '1');
INSERT INTO `zone` VALUES ('2146', '138', 'Baja California Norte', 'BN', '1');
INSERT INTO `zone` VALUES ('2147', '138', 'Baja California Sur', 'BS', '1');
INSERT INTO `zone` VALUES ('2148', '138', 'Campeche', 'CA', '1');
INSERT INTO `zone` VALUES ('2149', '138', 'Chiapas', 'CI', '1');
INSERT INTO `zone` VALUES ('2150', '138', 'Chihuahua', 'CH', '1');
INSERT INTO `zone` VALUES ('2151', '138', 'Coahuila de Zaragoza', 'CZ', '1');
INSERT INTO `zone` VALUES ('2152', '138', 'Colima', 'CL', '1');
INSERT INTO `zone` VALUES ('2153', '138', 'Distrito Federal', 'DF', '1');
INSERT INTO `zone` VALUES ('2154', '138', 'Durango', 'DU', '1');
INSERT INTO `zone` VALUES ('2155', '138', 'Guanajuato', 'GA', '1');
INSERT INTO `zone` VALUES ('2156', '138', 'Guerrero', 'GE', '1');
INSERT INTO `zone` VALUES ('2157', '138', 'Hidalgo', 'HI', '1');
INSERT INTO `zone` VALUES ('2158', '138', 'Jalisco', 'JA', '1');
INSERT INTO `zone` VALUES ('2159', '138', 'Mexico', 'ME', '1');
INSERT INTO `zone` VALUES ('2160', '138', 'Michoacan de Ocampo', 'MI', '1');
INSERT INTO `zone` VALUES ('2161', '138', 'Morelos', 'MO', '1');
INSERT INTO `zone` VALUES ('2162', '138', 'Nayarit', 'NA', '1');
INSERT INTO `zone` VALUES ('2163', '138', 'Nuevo Leon', 'NL', '1');
INSERT INTO `zone` VALUES ('2164', '138', 'Oaxaca', 'OA', '1');
INSERT INTO `zone` VALUES ('2165', '138', 'Puebla', 'PU', '1');
INSERT INTO `zone` VALUES ('2166', '138', 'Queretaro de Arteaga', 'QA', '1');
INSERT INTO `zone` VALUES ('2167', '138', 'Quintana Roo', 'QR', '1');
INSERT INTO `zone` VALUES ('2168', '138', 'San Luis Potosi', 'SA', '1');
INSERT INTO `zone` VALUES ('2169', '138', 'Sinaloa', 'SI', '1');
INSERT INTO `zone` VALUES ('2170', '138', 'Sonora', 'SO', '1');
INSERT INTO `zone` VALUES ('2171', '138', 'Tabasco', 'TB', '1');
INSERT INTO `zone` VALUES ('2172', '138', 'Tamaulipas', 'TM', '1');
INSERT INTO `zone` VALUES ('2173', '138', 'Tlaxcala', 'TL', '1');
INSERT INTO `zone` VALUES ('2174', '138', 'Veracruz-Llave', 'VE', '1');
INSERT INTO `zone` VALUES ('2175', '138', 'Yucatan', 'YU', '1');
INSERT INTO `zone` VALUES ('2176', '138', 'Zacatecas', 'ZA', '1');
INSERT INTO `zone` VALUES ('2177', '139', 'Chuuk', 'C', '1');
INSERT INTO `zone` VALUES ('2178', '139', 'Kosrae', 'K', '1');
INSERT INTO `zone` VALUES ('2179', '139', 'Pohnpei', 'P', '1');
INSERT INTO `zone` VALUES ('2180', '139', 'Yap', 'Y', '1');
INSERT INTO `zone` VALUES ('2181', '140', 'Gagauzia', 'GA', '1');
INSERT INTO `zone` VALUES ('2182', '140', 'Chisinau', 'CU', '1');
INSERT INTO `zone` VALUES ('2183', '140', 'Balti', 'BA', '1');
INSERT INTO `zone` VALUES ('2184', '140', 'Cahul', 'CA', '1');
INSERT INTO `zone` VALUES ('2185', '140', 'Edinet', 'ED', '1');
INSERT INTO `zone` VALUES ('2186', '140', 'Lapusna', 'LA', '1');
INSERT INTO `zone` VALUES ('2187', '140', 'Orhei', 'OR', '1');
INSERT INTO `zone` VALUES ('2188', '140', 'Soroca', 'SO', '1');
INSERT INTO `zone` VALUES ('2189', '140', 'Tighina', 'TI', '1');
INSERT INTO `zone` VALUES ('2190', '140', 'Ungheni', 'UN', '1');
INSERT INTO `zone` VALUES ('2191', '140', 'St‚nga Nistrului', 'SN', '1');
INSERT INTO `zone` VALUES ('2192', '141', 'Fontvieille', 'FV', '1');
INSERT INTO `zone` VALUES ('2193', '141', 'La Condamine', 'LC', '1');
INSERT INTO `zone` VALUES ('2194', '141', 'Monaco-Ville', 'MV', '1');
INSERT INTO `zone` VALUES ('2195', '141', 'Monte-Carlo', 'MC', '1');
INSERT INTO `zone` VALUES ('2196', '142', 'Ulanbaatar', '1', '1');
INSERT INTO `zone` VALUES ('2197', '142', 'Orhon', '035', '1');
INSERT INTO `zone` VALUES ('2198', '142', 'Darhan uul', '037', '1');
INSERT INTO `zone` VALUES ('2199', '142', 'Hentiy', '039', '1');
INSERT INTO `zone` VALUES ('2200', '142', 'Hovsgol', '041', '1');
INSERT INTO `zone` VALUES ('2201', '142', 'Hovd', '043', '1');
INSERT INTO `zone` VALUES ('2202', '142', 'Uvs', '046', '1');
INSERT INTO `zone` VALUES ('2203', '142', 'Tov', '047', '1');
INSERT INTO `zone` VALUES ('2204', '142', 'Selenge', '049', '1');
INSERT INTO `zone` VALUES ('2205', '142', 'Suhbaatar', '051', '1');
INSERT INTO `zone` VALUES ('2206', '142', 'Omnogovi', '053', '1');
INSERT INTO `zone` VALUES ('2207', '142', 'Ovorhangay', '055', '1');
INSERT INTO `zone` VALUES ('2208', '142', 'Dzavhan', '057', '1');
INSERT INTO `zone` VALUES ('2209', '142', 'DundgovL', '059', '1');
INSERT INTO `zone` VALUES ('2210', '142', 'Dornod', '061', '1');
INSERT INTO `zone` VALUES ('2211', '142', 'Dornogov', '063', '1');
INSERT INTO `zone` VALUES ('2212', '142', 'Govi-Sumber', '064', '1');
INSERT INTO `zone` VALUES ('2213', '142', 'Govi-Altay', '065', '1');
INSERT INTO `zone` VALUES ('2214', '142', 'Bulgan', '067', '1');
INSERT INTO `zone` VALUES ('2215', '142', 'Bayanhongor', '069', '1');
INSERT INTO `zone` VALUES ('2216', '142', 'Bayan-Olgiy', '071', '1');
INSERT INTO `zone` VALUES ('2217', '142', 'Arhangay', '073', '1');
INSERT INTO `zone` VALUES ('2218', '143', 'Saint Anthony', 'A', '1');
INSERT INTO `zone` VALUES ('2219', '143', 'Saint Georges', 'G', '1');
INSERT INTO `zone` VALUES ('2220', '143', 'Saint Peter', 'P', '1');
INSERT INTO `zone` VALUES ('2221', '144', 'Agadir', 'AGD', '1');
INSERT INTO `zone` VALUES ('2222', '144', 'Al Hoceima', 'HOC', '1');
INSERT INTO `zone` VALUES ('2223', '144', 'Azilal', 'AZI', '1');
INSERT INTO `zone` VALUES ('2224', '144', 'Beni Mellal', 'BME', '1');
INSERT INTO `zone` VALUES ('2225', '144', 'Ben Slimane', 'BSL', '1');
INSERT INTO `zone` VALUES ('2226', '144', 'Boulemane', 'BLM', '1');
INSERT INTO `zone` VALUES ('2227', '144', 'Casablanca', 'CBL', '1');
INSERT INTO `zone` VALUES ('2228', '144', 'Chaouen', 'CHA', '1');
INSERT INTO `zone` VALUES ('2229', '144', 'El Jadida', 'EJA', '1');
INSERT INTO `zone` VALUES ('2230', '144', 'El Kelaa des Sraghna', 'EKS', '1');
INSERT INTO `zone` VALUES ('2231', '144', 'Er Rachidia', 'ERA', '1');
INSERT INTO `zone` VALUES ('2232', '144', 'Essaouira', 'ESS', '1');
INSERT INTO `zone` VALUES ('2233', '144', 'Fes', 'FES', '1');
INSERT INTO `zone` VALUES ('2234', '144', 'Figuig', 'FIG', '1');
INSERT INTO `zone` VALUES ('2235', '144', 'Guelmim', 'GLM', '1');
INSERT INTO `zone` VALUES ('2236', '144', 'Ifrane', 'IFR', '1');
INSERT INTO `zone` VALUES ('2237', '144', 'Kenitra', 'KEN', '1');
INSERT INTO `zone` VALUES ('2238', '144', 'Khemisset', 'KHM', '1');
INSERT INTO `zone` VALUES ('2239', '144', 'Khenifra', 'KHN', '1');
INSERT INTO `zone` VALUES ('2240', '144', 'Khouribga', 'KHO', '1');
INSERT INTO `zone` VALUES ('2241', '144', 'Laayoune', 'LYN', '1');
INSERT INTO `zone` VALUES ('2242', '144', 'Larache', 'LAR', '1');
INSERT INTO `zone` VALUES ('2243', '144', 'Marrakech', 'MRK', '1');
INSERT INTO `zone` VALUES ('2244', '144', 'Meknes', 'MKN', '1');
INSERT INTO `zone` VALUES ('2245', '144', 'Nador', 'NAD', '1');
INSERT INTO `zone` VALUES ('2246', '144', 'Ouarzazate', 'ORZ', '1');
INSERT INTO `zone` VALUES ('2247', '144', 'Oujda', 'OUJ', '1');
INSERT INTO `zone` VALUES ('2248', '144', 'Rabat-Sale', 'RSA', '1');
INSERT INTO `zone` VALUES ('2249', '144', 'Safi', 'SAF', '1');
INSERT INTO `zone` VALUES ('2250', '144', 'Settat', 'SET', '1');
INSERT INTO `zone` VALUES ('2251', '144', 'Sidi Kacem', 'SKA', '1');
INSERT INTO `zone` VALUES ('2252', '144', 'Tangier', 'TGR', '1');
INSERT INTO `zone` VALUES ('2253', '144', 'Tan-Tan', 'TAN', '1');
INSERT INTO `zone` VALUES ('2254', '144', 'Taounate', 'TAO', '1');
INSERT INTO `zone` VALUES ('2255', '144', 'Taroudannt', 'TRD', '1');
INSERT INTO `zone` VALUES ('2256', '144', 'Tata', 'TAT', '1');
INSERT INTO `zone` VALUES ('2257', '144', 'Taza', 'TAZ', '1');
INSERT INTO `zone` VALUES ('2258', '144', 'Tetouan', 'TET', '1');
INSERT INTO `zone` VALUES ('2259', '144', 'Tiznit', 'TIZ', '1');
INSERT INTO `zone` VALUES ('2260', '144', 'Ad Dakhla', 'ADK', '1');
INSERT INTO `zone` VALUES ('2261', '144', 'Boujdour', 'BJD', '1');
INSERT INTO `zone` VALUES ('2262', '144', 'Es Smara', 'ESM', '1');
INSERT INTO `zone` VALUES ('2263', '145', 'Cabo Delgado', 'CD', '1');
INSERT INTO `zone` VALUES ('2264', '145', 'Gaza', 'GZ', '1');
INSERT INTO `zone` VALUES ('2265', '145', 'Inhambane', 'IN', '1');
INSERT INTO `zone` VALUES ('2266', '145', 'Manica', 'MN', '1');
INSERT INTO `zone` VALUES ('2267', '145', 'Maputo (city)', 'MC', '1');
INSERT INTO `zone` VALUES ('2268', '145', 'Maputo', 'MP', '1');
INSERT INTO `zone` VALUES ('2269', '145', 'Nampula', 'NA', '1');
INSERT INTO `zone` VALUES ('2270', '145', 'Niassa', 'NI', '1');
INSERT INTO `zone` VALUES ('2271', '145', 'Sofala', 'SO', '1');
INSERT INTO `zone` VALUES ('2272', '145', 'Tete', 'TE', '1');
INSERT INTO `zone` VALUES ('2273', '145', 'Zambezia', 'ZA', '1');
INSERT INTO `zone` VALUES ('2274', '146', 'Ayeyarwady', 'AY', '1');
INSERT INTO `zone` VALUES ('2275', '146', 'Bago', 'BG', '1');
INSERT INTO `zone` VALUES ('2276', '146', 'Magway', 'MG', '1');
INSERT INTO `zone` VALUES ('2277', '146', 'Mandalay', 'MD', '1');
INSERT INTO `zone` VALUES ('2278', '146', 'Sagaing', 'SG', '1');
INSERT INTO `zone` VALUES ('2279', '146', 'Tanintharyi', 'TN', '1');
INSERT INTO `zone` VALUES ('2280', '146', 'Yangon', 'YG', '1');
INSERT INTO `zone` VALUES ('2281', '146', 'Chin State', 'CH', '1');
INSERT INTO `zone` VALUES ('2282', '146', 'Kachin State', 'KC', '1');
INSERT INTO `zone` VALUES ('2283', '146', 'Kayah State', 'KH', '1');
INSERT INTO `zone` VALUES ('2284', '146', 'Kayin State', 'KN', '1');
INSERT INTO `zone` VALUES ('2285', '146', 'Mon State', 'MN', '1');
INSERT INTO `zone` VALUES ('2286', '146', 'Rakhine State', 'RK', '1');
INSERT INTO `zone` VALUES ('2287', '146', 'Shan State', 'SH', '1');
INSERT INTO `zone` VALUES ('2288', '147', 'Caprivi', 'CA', '1');
INSERT INTO `zone` VALUES ('2289', '147', 'Erongo', 'ER', '1');
INSERT INTO `zone` VALUES ('2290', '147', 'Hardap', 'HA', '1');
INSERT INTO `zone` VALUES ('2291', '147', 'Karas', 'KR', '1');
INSERT INTO `zone` VALUES ('2292', '147', 'Kavango', 'KV', '1');
INSERT INTO `zone` VALUES ('2293', '147', 'Khomas', 'KH', '1');
INSERT INTO `zone` VALUES ('2294', '147', 'Kunene', 'KU', '1');
INSERT INTO `zone` VALUES ('2295', '147', 'Ohangwena', 'OW', '1');
INSERT INTO `zone` VALUES ('2296', '147', 'Omaheke', 'OK', '1');
INSERT INTO `zone` VALUES ('2297', '147', 'Omusati', 'OT', '1');
INSERT INTO `zone` VALUES ('2298', '147', 'Oshana', 'ON', '1');
INSERT INTO `zone` VALUES ('2299', '147', 'Oshikoto', 'OO', '1');
INSERT INTO `zone` VALUES ('2300', '147', 'Otjozondjupa', 'OJ', '1');
INSERT INTO `zone` VALUES ('2301', '148', 'Aiwo', 'AO', '1');
INSERT INTO `zone` VALUES ('2302', '148', 'Anabar', 'AA', '1');
INSERT INTO `zone` VALUES ('2303', '148', 'Anetan', 'AT', '1');
INSERT INTO `zone` VALUES ('2304', '148', 'Anibare', 'AI', '1');
INSERT INTO `zone` VALUES ('2305', '148', 'Baiti', 'BA', '1');
INSERT INTO `zone` VALUES ('2306', '148', 'Boe', 'BO', '1');
INSERT INTO `zone` VALUES ('2307', '148', 'Buada', 'BU', '1');
INSERT INTO `zone` VALUES ('2308', '148', 'Denigomodu', 'DE', '1');
INSERT INTO `zone` VALUES ('2309', '148', 'Ewa', 'EW', '1');
INSERT INTO `zone` VALUES ('2310', '148', 'Ijuw', 'IJ', '1');
INSERT INTO `zone` VALUES ('2311', '148', 'Meneng', 'ME', '1');
INSERT INTO `zone` VALUES ('2312', '148', 'Nibok', 'NI', '1');
INSERT INTO `zone` VALUES ('2313', '148', 'Uaboe', 'UA', '1');
INSERT INTO `zone` VALUES ('2314', '148', 'Yaren', 'YA', '1');
INSERT INTO `zone` VALUES ('2315', '149', 'Bagmati', 'BA', '1');
INSERT INTO `zone` VALUES ('2316', '149', 'Bheri', 'BH', '1');
INSERT INTO `zone` VALUES ('2317', '149', 'Dhawalagiri', 'DH', '1');
INSERT INTO `zone` VALUES ('2318', '149', 'Gandaki', 'GA', '1');
INSERT INTO `zone` VALUES ('2319', '149', 'Janakpur', 'JA', '1');
INSERT INTO `zone` VALUES ('2320', '149', 'Karnali', 'KA', '1');
INSERT INTO `zone` VALUES ('2321', '149', 'Kosi', 'KO', '1');
INSERT INTO `zone` VALUES ('2322', '149', 'Lumbini', 'LU', '1');
INSERT INTO `zone` VALUES ('2323', '149', 'Mahakali', 'MA', '1');
INSERT INTO `zone` VALUES ('2324', '149', 'Mechi', 'ME', '1');
INSERT INTO `zone` VALUES ('2325', '149', 'Narayani', 'NA', '1');
INSERT INTO `zone` VALUES ('2326', '149', 'Rapti', 'RA', '1');
INSERT INTO `zone` VALUES ('2327', '149', 'Sagarmatha', 'SA', '1');
INSERT INTO `zone` VALUES ('2328', '149', 'Seti', 'SE', '1');
INSERT INTO `zone` VALUES ('2329', '150', 'Drenthe', 'DR', '1');
INSERT INTO `zone` VALUES ('2330', '150', 'Flevoland', 'FL', '1');
INSERT INTO `zone` VALUES ('2331', '150', 'Friesland', 'FR', '1');
INSERT INTO `zone` VALUES ('2332', '150', 'Gelderland', 'GE', '1');
INSERT INTO `zone` VALUES ('2333', '150', 'Groningen', 'GR', '1');
INSERT INTO `zone` VALUES ('2334', '150', 'Limburg', 'LI', '1');
INSERT INTO `zone` VALUES ('2335', '150', 'Noord Brabant', 'NB', '1');
INSERT INTO `zone` VALUES ('2336', '150', 'Noord Holland', 'NH', '1');
INSERT INTO `zone` VALUES ('2337', '150', 'Overijssel', 'OV', '1');
INSERT INTO `zone` VALUES ('2338', '150', 'Utrecht', 'UT', '1');
INSERT INTO `zone` VALUES ('2339', '150', 'Zeeland', 'ZE', '1');
INSERT INTO `zone` VALUES ('2340', '150', 'Zuid Holland', 'ZH', '1');
INSERT INTO `zone` VALUES ('2341', '152', 'Iles Loyaute', 'L', '1');
INSERT INTO `zone` VALUES ('2342', '152', 'Nord', 'N', '1');
INSERT INTO `zone` VALUES ('2343', '152', 'Sud', 'S', '1');
INSERT INTO `zone` VALUES ('2344', '153', 'Auckland', 'AUK', '1');
INSERT INTO `zone` VALUES ('2345', '153', 'Bay of Plenty', 'BOP', '1');
INSERT INTO `zone` VALUES ('2346', '153', 'Canterbury', 'CAN', '1');
INSERT INTO `zone` VALUES ('2347', '153', 'Coromandel', 'COR', '1');
INSERT INTO `zone` VALUES ('2348', '153', 'Gisborne', 'GIS', '1');
INSERT INTO `zone` VALUES ('2349', '153', 'Fiordland', 'FIO', '1');
INSERT INTO `zone` VALUES ('2350', '153', 'Hawke\'s Bay', 'HKB', '1');
INSERT INTO `zone` VALUES ('2351', '153', 'Marlborough', 'MBH', '1');
INSERT INTO `zone` VALUES ('2352', '153', 'Manawatu-Wanganui', 'MWT', '1');
INSERT INTO `zone` VALUES ('2353', '153', 'Mt Cook-Mackenzie', 'MCM', '1');
INSERT INTO `zone` VALUES ('2354', '153', 'Nelson', 'NSN', '1');
INSERT INTO `zone` VALUES ('2355', '153', 'Northland', 'NTL', '1');
INSERT INTO `zone` VALUES ('2356', '153', 'Otago', 'OTA', '1');
INSERT INTO `zone` VALUES ('2357', '153', 'Southland', 'STL', '1');
INSERT INTO `zone` VALUES ('2358', '153', 'Taranaki', 'TKI', '1');
INSERT INTO `zone` VALUES ('2359', '153', 'Wellington', 'WGN', '1');
INSERT INTO `zone` VALUES ('2360', '153', 'Waikato', 'WKO', '1');
INSERT INTO `zone` VALUES ('2361', '153', 'Wairarapa', 'WAI', '1');
INSERT INTO `zone` VALUES ('2362', '153', 'West Coast', 'WTC', '1');
INSERT INTO `zone` VALUES ('2363', '154', 'Atlantico Norte', 'AN', '1');
INSERT INTO `zone` VALUES ('2364', '154', 'Atlantico Sur', 'AS', '1');
INSERT INTO `zone` VALUES ('2365', '154', 'Boaco', 'BO', '1');
INSERT INTO `zone` VALUES ('2366', '154', 'Carazo', 'CA', '1');
INSERT INTO `zone` VALUES ('2367', '154', 'Chinandega', 'CI', '1');
INSERT INTO `zone` VALUES ('2368', '154', 'Chontales', 'CO', '1');
INSERT INTO `zone` VALUES ('2369', '154', 'Esteli', 'ES', '1');
INSERT INTO `zone` VALUES ('2370', '154', 'Granada', 'GR', '1');
INSERT INTO `zone` VALUES ('2371', '154', 'Jinotega', 'JI', '1');
INSERT INTO `zone` VALUES ('2372', '154', 'Leon', 'LE', '1');
INSERT INTO `zone` VALUES ('2373', '154', 'Madriz', 'MD', '1');
INSERT INTO `zone` VALUES ('2374', '154', 'Managua', 'MN', '1');
INSERT INTO `zone` VALUES ('2375', '154', 'Masaya', 'MS', '1');
INSERT INTO `zone` VALUES ('2376', '154', 'Matagalpa', 'MT', '1');
INSERT INTO `zone` VALUES ('2377', '154', 'Nuevo Segovia', 'NS', '1');
INSERT INTO `zone` VALUES ('2378', '154', 'Rio San Juan', 'RS', '1');
INSERT INTO `zone` VALUES ('2379', '154', 'Rivas', 'RI', '1');
INSERT INTO `zone` VALUES ('2380', '155', 'Agadez', 'AG', '1');
INSERT INTO `zone` VALUES ('2381', '155', 'Diffa', 'DF', '1');
INSERT INTO `zone` VALUES ('2382', '155', 'Dosso', 'DS', '1');
INSERT INTO `zone` VALUES ('2383', '155', 'Maradi', 'MA', '1');
INSERT INTO `zone` VALUES ('2384', '155', 'Niamey', 'NM', '1');
INSERT INTO `zone` VALUES ('2385', '155', 'Tahoua', 'TH', '1');
INSERT INTO `zone` VALUES ('2386', '155', 'Tillaberi', 'TL', '1');
INSERT INTO `zone` VALUES ('2387', '155', 'Zinder', 'ZD', '1');
INSERT INTO `zone` VALUES ('2388', '156', 'Abia', 'AB', '1');
INSERT INTO `zone` VALUES ('2389', '156', 'Abuja Federal Capital Territory', 'CT', '1');
INSERT INTO `zone` VALUES ('2390', '156', 'Adamawa', 'AD', '1');
INSERT INTO `zone` VALUES ('2391', '156', 'Akwa Ibom', 'AK', '1');
INSERT INTO `zone` VALUES ('2392', '156', 'Anambra', 'AN', '1');
INSERT INTO `zone` VALUES ('2393', '156', 'Bauchi', 'BC', '1');
INSERT INTO `zone` VALUES ('2394', '156', 'Bayelsa', 'BY', '1');
INSERT INTO `zone` VALUES ('2395', '156', 'Benue', 'BN', '1');
INSERT INTO `zone` VALUES ('2396', '156', 'Borno', 'BO', '1');
INSERT INTO `zone` VALUES ('2397', '156', 'Cross River', 'CR', '1');
INSERT INTO `zone` VALUES ('2398', '156', 'Delta', 'DE', '1');
INSERT INTO `zone` VALUES ('2399', '156', 'Ebonyi', 'EB', '1');
INSERT INTO `zone` VALUES ('2400', '156', 'Edo', 'ED', '1');
INSERT INTO `zone` VALUES ('2401', '156', 'Ekiti', 'EK', '1');
INSERT INTO `zone` VALUES ('2402', '156', 'Enugu', 'EN', '1');
INSERT INTO `zone` VALUES ('2403', '156', 'Gombe', 'GO', '1');
INSERT INTO `zone` VALUES ('2404', '156', 'Imo', 'IM', '1');
INSERT INTO `zone` VALUES ('2405', '156', 'Jigawa', 'JI', '1');
INSERT INTO `zone` VALUES ('2406', '156', 'Kaduna', 'KD', '1');
INSERT INTO `zone` VALUES ('2407', '156', 'Kano', 'KN', '1');
INSERT INTO `zone` VALUES ('2408', '156', 'Katsina', 'KT', '1');
INSERT INTO `zone` VALUES ('2409', '156', 'Kebbi', 'KE', '1');
INSERT INTO `zone` VALUES ('2410', '156', 'Kogi', 'KO', '1');
INSERT INTO `zone` VALUES ('2411', '156', 'Kwara', 'KW', '1');
INSERT INTO `zone` VALUES ('2412', '156', 'Lagos', 'LA', '1');
INSERT INTO `zone` VALUES ('2413', '156', 'Nassarawa', 'NA', '1');
INSERT INTO `zone` VALUES ('2414', '156', 'Niger', 'NI', '1');
INSERT INTO `zone` VALUES ('2415', '156', 'Ogun', 'OG', '1');
INSERT INTO `zone` VALUES ('2416', '156', 'Ondo', 'ONG', '1');
INSERT INTO `zone` VALUES ('2417', '156', 'Osun', 'OS', '1');
INSERT INTO `zone` VALUES ('2418', '156', 'Oyo', 'OY', '1');
INSERT INTO `zone` VALUES ('2419', '156', 'Plateau', 'PL', '1');
INSERT INTO `zone` VALUES ('2420', '156', 'Rivers', 'RI', '1');
INSERT INTO `zone` VALUES ('2421', '156', 'Sokoto', 'SO', '1');
INSERT INTO `zone` VALUES ('2422', '156', 'Taraba', 'TA', '1');
INSERT INTO `zone` VALUES ('2423', '156', 'Yobe', 'YO', '1');
INSERT INTO `zone` VALUES ('2424', '156', 'Zamfara', 'ZA', '1');
INSERT INTO `zone` VALUES ('2425', '159', 'Northern Islands', 'N', '1');
INSERT INTO `zone` VALUES ('2426', '159', 'Rota', 'R', '1');
INSERT INTO `zone` VALUES ('2427', '159', 'Saipan', 'S', '1');
INSERT INTO `zone` VALUES ('2428', '159', 'Tinian', 'T', '1');
INSERT INTO `zone` VALUES ('2429', '160', 'Akershus', 'AK', '1');
INSERT INTO `zone` VALUES ('2430', '160', 'Aust-Agder', 'AA', '1');
INSERT INTO `zone` VALUES ('2431', '160', 'Buskerud', 'BU', '1');
INSERT INTO `zone` VALUES ('2432', '160', 'Finnmark', 'FM', '1');
INSERT INTO `zone` VALUES ('2433', '160', 'Hedmark', 'HM', '1');
INSERT INTO `zone` VALUES ('2434', '160', 'Hordaland', 'HL', '1');
INSERT INTO `zone` VALUES ('2435', '160', 'More og Romdal', 'MR', '1');
INSERT INTO `zone` VALUES ('2436', '160', 'Nord-Trondelag', 'NT', '1');
INSERT INTO `zone` VALUES ('2437', '160', 'Nordland', 'NL', '1');
INSERT INTO `zone` VALUES ('2438', '160', 'Ostfold', 'OF', '1');
INSERT INTO `zone` VALUES ('2439', '160', 'Oppland', 'OP', '1');
INSERT INTO `zone` VALUES ('2440', '160', 'Oslo', 'OL', '1');
INSERT INTO `zone` VALUES ('2441', '160', 'Rogaland', 'RL', '1');
INSERT INTO `zone` VALUES ('2442', '160', 'Sor-Trondelag', 'ST', '1');
INSERT INTO `zone` VALUES ('2443', '160', 'Sogn og Fjordane', 'SJ', '1');
INSERT INTO `zone` VALUES ('2444', '160', 'Svalbard', 'SV', '1');
INSERT INTO `zone` VALUES ('2445', '160', 'Telemark', 'TM', '1');
INSERT INTO `zone` VALUES ('2446', '160', 'Troms', 'TR', '1');
INSERT INTO `zone` VALUES ('2447', '160', 'Vest-Agder', 'VA', '1');
INSERT INTO `zone` VALUES ('2448', '160', 'Vestfold', 'VF', '1');
INSERT INTO `zone` VALUES ('2449', '161', 'Ad Dakhiliyah', 'DA', '1');
INSERT INTO `zone` VALUES ('2450', '161', 'Al Batinah', 'BA', '1');
INSERT INTO `zone` VALUES ('2451', '161', 'Al Wusta', 'WU', '1');
INSERT INTO `zone` VALUES ('2452', '161', 'Ash Sharqiyah', 'SH', '1');
INSERT INTO `zone` VALUES ('2453', '161', 'Az Zahirah', 'ZA', '1');
INSERT INTO `zone` VALUES ('2454', '161', 'Masqat', 'MA', '1');
INSERT INTO `zone` VALUES ('2455', '161', 'Musandam', 'MU', '1');
INSERT INTO `zone` VALUES ('2456', '161', 'Zufar', 'ZU', '1');
INSERT INTO `zone` VALUES ('2457', '162', 'Balochistan', 'B', '1');
INSERT INTO `zone` VALUES ('2458', '162', 'Federally Administered Tribal Areas', 'T', '1');
INSERT INTO `zone` VALUES ('2459', '162', 'Islamabad Capital Territory', 'I', '1');
INSERT INTO `zone` VALUES ('2460', '162', 'North-West Frontier', 'N', '1');
INSERT INTO `zone` VALUES ('2461', '162', 'Punjab', 'P', '1');
INSERT INTO `zone` VALUES ('2462', '162', 'Sindh', 'S', '1');
INSERT INTO `zone` VALUES ('2463', '163', 'Aimeliik', 'AM', '1');
INSERT INTO `zone` VALUES ('2464', '163', 'Airai', 'AR', '1');
INSERT INTO `zone` VALUES ('2465', '163', 'Angaur', 'AN', '1');
INSERT INTO `zone` VALUES ('2466', '163', 'Hatohobei', 'HA', '1');
INSERT INTO `zone` VALUES ('2467', '163', 'Kayangel', 'KA', '1');
INSERT INTO `zone` VALUES ('2468', '163', 'Koror', 'KO', '1');
INSERT INTO `zone` VALUES ('2469', '163', 'Melekeok', 'ME', '1');
INSERT INTO `zone` VALUES ('2470', '163', 'Ngaraard', 'NA', '1');
INSERT INTO `zone` VALUES ('2471', '163', 'Ngarchelong', 'NG', '1');
INSERT INTO `zone` VALUES ('2472', '163', 'Ngardmau', 'ND', '1');
INSERT INTO `zone` VALUES ('2473', '163', 'Ngatpang', 'NT', '1');
INSERT INTO `zone` VALUES ('2474', '163', 'Ngchesar', 'NC', '1');
INSERT INTO `zone` VALUES ('2475', '163', 'Ngeremlengui', 'NR', '1');
INSERT INTO `zone` VALUES ('2476', '163', 'Ngiwal', 'NW', '1');
INSERT INTO `zone` VALUES ('2477', '163', 'Peleliu', 'PE', '1');
INSERT INTO `zone` VALUES ('2478', '163', 'Sonsorol', 'SO', '1');
INSERT INTO `zone` VALUES ('2479', '164', 'Bocas del Toro', 'BT', '1');
INSERT INTO `zone` VALUES ('2480', '164', 'Chiriqui', 'CH', '1');
INSERT INTO `zone` VALUES ('2481', '164', 'Cocle', 'CC', '1');
INSERT INTO `zone` VALUES ('2482', '164', 'Colon', 'CL', '1');
INSERT INTO `zone` VALUES ('2483', '164', 'Darien', 'DA', '1');
INSERT INTO `zone` VALUES ('2484', '164', 'Herrera', 'HE', '1');
INSERT INTO `zone` VALUES ('2485', '164', 'Los Santos', 'LS', '1');
INSERT INTO `zone` VALUES ('2486', '164', 'Panama', 'PA', '1');
INSERT INTO `zone` VALUES ('2487', '164', 'San Blas', 'SB', '1');
INSERT INTO `zone` VALUES ('2488', '164', 'Veraguas', 'VG', '1');
INSERT INTO `zone` VALUES ('2489', '165', 'Bougainville', 'BV', '1');
INSERT INTO `zone` VALUES ('2490', '165', 'Central', 'CE', '1');
INSERT INTO `zone` VALUES ('2491', '165', 'Chimbu', 'CH', '1');
INSERT INTO `zone` VALUES ('2492', '165', 'Eastern Highlands', 'EH', '1');
INSERT INTO `zone` VALUES ('2493', '165', 'East New Britain', 'EB', '1');
INSERT INTO `zone` VALUES ('2494', '165', 'East Sepik', 'ES', '1');
INSERT INTO `zone` VALUES ('2495', '165', 'Enga', 'EN', '1');
INSERT INTO `zone` VALUES ('2496', '165', 'Gulf', 'GU', '1');
INSERT INTO `zone` VALUES ('2497', '165', 'Madang', 'MD', '1');
INSERT INTO `zone` VALUES ('2498', '165', 'Manus', 'MN', '1');
INSERT INTO `zone` VALUES ('2499', '165', 'Milne Bay', 'MB', '1');
INSERT INTO `zone` VALUES ('2500', '165', 'Morobe', 'MR', '1');
INSERT INTO `zone` VALUES ('2501', '165', 'National Capital', 'NC', '1');
INSERT INTO `zone` VALUES ('2502', '165', 'New Ireland', 'NI', '1');
INSERT INTO `zone` VALUES ('2503', '165', 'Northern', 'NO', '1');
INSERT INTO `zone` VALUES ('2504', '165', 'Sandaun', 'SA', '1');
INSERT INTO `zone` VALUES ('2505', '165', 'Southern Highlands', 'SH', '1');
INSERT INTO `zone` VALUES ('2506', '165', 'Western', 'WE', '1');
INSERT INTO `zone` VALUES ('2507', '165', 'Western Highlands', 'WH', '1');
INSERT INTO `zone` VALUES ('2508', '165', 'West New Britain', 'WB', '1');
INSERT INTO `zone` VALUES ('2509', '166', 'Alto Paraguay', 'AG', '1');
INSERT INTO `zone` VALUES ('2510', '166', 'Alto Parana', 'AN', '1');
INSERT INTO `zone` VALUES ('2511', '166', 'Amambay', 'AM', '1');
INSERT INTO `zone` VALUES ('2512', '166', 'Asuncion', 'AS', '1');
INSERT INTO `zone` VALUES ('2513', '166', 'Boqueron', 'BO', '1');
INSERT INTO `zone` VALUES ('2514', '166', 'Caaguazu', 'CG', '1');
INSERT INTO `zone` VALUES ('2515', '166', 'Caazapa', 'CZ', '1');
INSERT INTO `zone` VALUES ('2516', '166', 'Canindeyu', 'CN', '1');
INSERT INTO `zone` VALUES ('2517', '166', 'Central', 'CE', '1');
INSERT INTO `zone` VALUES ('2518', '166', 'Concepcion', 'CC', '1');
INSERT INTO `zone` VALUES ('2519', '166', 'Cordillera', 'CD', '1');
INSERT INTO `zone` VALUES ('2520', '166', 'Guaira', 'GU', '1');
INSERT INTO `zone` VALUES ('2521', '166', 'Itapua', 'IT', '1');
INSERT INTO `zone` VALUES ('2522', '166', 'Misiones', 'MI', '1');
INSERT INTO `zone` VALUES ('2523', '166', 'Neembucu', 'NE', '1');
INSERT INTO `zone` VALUES ('2524', '166', 'Paraguari', 'PA', '1');
INSERT INTO `zone` VALUES ('2525', '166', 'Presidente Hayes', 'PH', '1');
INSERT INTO `zone` VALUES ('2526', '166', 'San Pedro', 'SP', '1');
INSERT INTO `zone` VALUES ('2527', '167', 'Amazonas', 'AM', '1');
INSERT INTO `zone` VALUES ('2528', '167', 'Ancash', 'AN', '1');
INSERT INTO `zone` VALUES ('2529', '167', 'Apurimac', 'AP', '1');
INSERT INTO `zone` VALUES ('2530', '167', 'Arequipa', 'AR', '1');
INSERT INTO `zone` VALUES ('2531', '167', 'Ayacucho', 'AY', '1');
INSERT INTO `zone` VALUES ('2532', '167', 'Cajamarca', 'CJ', '1');
INSERT INTO `zone` VALUES ('2533', '167', 'Callao', 'CL', '1');
INSERT INTO `zone` VALUES ('2534', '167', 'Cusco', 'CU', '1');
INSERT INTO `zone` VALUES ('2535', '167', 'Huancavelica', 'HV', '1');
INSERT INTO `zone` VALUES ('2536', '167', 'Huanuco', 'HO', '1');
INSERT INTO `zone` VALUES ('2537', '167', 'Ica', 'IC', '1');
INSERT INTO `zone` VALUES ('2538', '167', 'Junin', 'JU', '1');
INSERT INTO `zone` VALUES ('2539', '167', 'La Libertad', 'LD', '1');
INSERT INTO `zone` VALUES ('2540', '167', 'Lambayeque', 'LY', '1');
INSERT INTO `zone` VALUES ('2541', '167', 'Lima', 'LI', '1');
INSERT INTO `zone` VALUES ('2542', '167', 'Loreto', 'LO', '1');
INSERT INTO `zone` VALUES ('2543', '167', 'Madre de Dios', 'MD', '1');
INSERT INTO `zone` VALUES ('2544', '167', 'Moquegua', 'MO', '1');
INSERT INTO `zone` VALUES ('2545', '167', 'Pasco', 'PA', '1');
INSERT INTO `zone` VALUES ('2546', '167', 'Piura', 'PI', '1');
INSERT INTO `zone` VALUES ('2547', '167', 'Puno', 'PU', '1');
INSERT INTO `zone` VALUES ('2548', '167', 'San Martin', 'SM', '1');
INSERT INTO `zone` VALUES ('2549', '167', 'Tacna', 'TA', '1');
INSERT INTO `zone` VALUES ('2550', '167', 'Tumbes', 'TU', '1');
INSERT INTO `zone` VALUES ('2551', '167', 'Ucayali', 'UC', '1');
INSERT INTO `zone` VALUES ('2552', '168', 'Abra', 'ABR', '1');
INSERT INTO `zone` VALUES ('2553', '168', 'Agusan del Norte', 'ANO', '1');
INSERT INTO `zone` VALUES ('2554', '168', 'Agusan del Sur', 'ASU', '1');
INSERT INTO `zone` VALUES ('2555', '168', 'Aklan', 'AKL', '1');
INSERT INTO `zone` VALUES ('2556', '168', 'Albay', 'ALB', '1');
INSERT INTO `zone` VALUES ('2557', '168', 'Antique', 'ANT', '1');
INSERT INTO `zone` VALUES ('2558', '168', 'Apayao', 'APY', '1');
INSERT INTO `zone` VALUES ('2559', '168', 'Aurora', 'AUR', '1');
INSERT INTO `zone` VALUES ('2560', '168', 'Basilan', 'BAS', '1');
INSERT INTO `zone` VALUES ('2561', '168', 'Bataan', 'BTA', '1');
INSERT INTO `zone` VALUES ('2562', '168', 'Batanes', 'BTE', '1');
INSERT INTO `zone` VALUES ('2563', '168', 'Batangas', 'BTG', '1');
INSERT INTO `zone` VALUES ('2564', '168', 'Biliran', 'BLR', '1');
INSERT INTO `zone` VALUES ('2565', '168', 'Benguet', 'BEN', '1');
INSERT INTO `zone` VALUES ('2566', '168', 'Bohol', 'BOL', '1');
INSERT INTO `zone` VALUES ('2567', '168', 'Bukidnon', 'BUK', '1');
INSERT INTO `zone` VALUES ('2568', '168', 'Bulacan', 'BUL', '1');
INSERT INTO `zone` VALUES ('2569', '168', 'Cagayan', 'CAG', '1');
INSERT INTO `zone` VALUES ('2570', '168', 'Camarines Norte', 'CNO', '1');
INSERT INTO `zone` VALUES ('2571', '168', 'Camarines Sur', 'CSU', '1');
INSERT INTO `zone` VALUES ('2572', '168', 'Camiguin', 'CAM', '1');
INSERT INTO `zone` VALUES ('2573', '168', 'Capiz', 'CAP', '1');
INSERT INTO `zone` VALUES ('2574', '168', 'Catanduanes', 'CAT', '1');
INSERT INTO `zone` VALUES ('2575', '168', 'Cavite', 'CAV', '1');
INSERT INTO `zone` VALUES ('2576', '168', 'Cebu', 'CEB', '1');
INSERT INTO `zone` VALUES ('2577', '168', 'Compostela', 'CMP', '1');
INSERT INTO `zone` VALUES ('2578', '168', 'Davao del Norte', 'DNO', '1');
INSERT INTO `zone` VALUES ('2579', '168', 'Davao del Sur', 'DSU', '1');
INSERT INTO `zone` VALUES ('2580', '168', 'Davao Oriental', 'DOR', '1');
INSERT INTO `zone` VALUES ('2581', '168', 'Eastern Samar', 'ESA', '1');
INSERT INTO `zone` VALUES ('2582', '168', 'Guimaras', 'GUI', '1');
INSERT INTO `zone` VALUES ('2583', '168', 'Ifugao', 'IFU', '1');
INSERT INTO `zone` VALUES ('2584', '168', 'Ilocos Norte', 'INO', '1');
INSERT INTO `zone` VALUES ('2585', '168', 'Ilocos Sur', 'ISU', '1');
INSERT INTO `zone` VALUES ('2586', '168', 'Iloilo', 'ILO', '1');
INSERT INTO `zone` VALUES ('2587', '168', 'Isabela', 'ISA', '1');
INSERT INTO `zone` VALUES ('2588', '168', 'Kalinga', 'KAL', '1');
INSERT INTO `zone` VALUES ('2589', '168', 'Laguna', 'LAG', '1');
INSERT INTO `zone` VALUES ('2590', '168', 'Lanao del Norte', 'LNO', '1');
INSERT INTO `zone` VALUES ('2591', '168', 'Lanao del Sur', 'LSU', '1');
INSERT INTO `zone` VALUES ('2592', '168', 'La Union', 'UNI', '1');
INSERT INTO `zone` VALUES ('2593', '168', 'Leyte', 'LEY', '1');
INSERT INTO `zone` VALUES ('2594', '168', 'Maguindanao', 'MAG', '1');
INSERT INTO `zone` VALUES ('2595', '168', 'Marinduque', 'MRN', '1');
INSERT INTO `zone` VALUES ('2596', '168', 'Masbate', 'MSB', '1');
INSERT INTO `zone` VALUES ('2597', '168', 'Mindoro Occidental', 'MIC', '1');
INSERT INTO `zone` VALUES ('2598', '168', 'Mindoro Oriental', 'MIR', '1');
INSERT INTO `zone` VALUES ('2599', '168', 'Misamis Occidental', 'MSC', '1');
INSERT INTO `zone` VALUES ('2600', '168', 'Misamis Oriental', 'MOR', '1');
INSERT INTO `zone` VALUES ('2601', '168', 'Mountain', 'MOP', '1');
INSERT INTO `zone` VALUES ('2602', '168', 'Negros Occidental', 'NOC', '1');
INSERT INTO `zone` VALUES ('2603', '168', 'Negros Oriental', 'NOR', '1');
INSERT INTO `zone` VALUES ('2604', '168', 'North Cotabato', 'NCT', '1');
INSERT INTO `zone` VALUES ('2605', '168', 'Northern Samar', 'NSM', '1');
INSERT INTO `zone` VALUES ('2606', '168', 'Nueva Ecija', 'NEC', '1');
INSERT INTO `zone` VALUES ('2607', '168', 'Nueva Vizcaya', 'NVZ', '1');
INSERT INTO `zone` VALUES ('2608', '168', 'Palawan', 'PLW', '1');
INSERT INTO `zone` VALUES ('2609', '168', 'Pampanga', 'PMP', '1');
INSERT INTO `zone` VALUES ('2610', '168', 'Pangasinan', 'PNG', '1');
INSERT INTO `zone` VALUES ('2611', '168', 'Quezon', 'QZN', '1');
INSERT INTO `zone` VALUES ('2612', '168', 'Quirino', 'QRN', '1');
INSERT INTO `zone` VALUES ('2613', '168', 'Rizal', 'RIZ', '1');
INSERT INTO `zone` VALUES ('2614', '168', 'Romblon', 'ROM', '1');
INSERT INTO `zone` VALUES ('2615', '168', 'Samar', 'SMR', '1');
INSERT INTO `zone` VALUES ('2616', '168', 'Sarangani', 'SRG', '1');
INSERT INTO `zone` VALUES ('2617', '168', 'Siquijor', 'SQJ', '1');
INSERT INTO `zone` VALUES ('2618', '168', 'Sorsogon', 'SRS', '1');
INSERT INTO `zone` VALUES ('2619', '168', 'South Cotabato', 'SCO', '1');
INSERT INTO `zone` VALUES ('2620', '168', 'Southern Leyte', 'SLE', '1');
INSERT INTO `zone` VALUES ('2621', '168', 'Sultan Kudarat', 'SKU', '1');
INSERT INTO `zone` VALUES ('2622', '168', 'Sulu', 'SLU', '1');
INSERT INTO `zone` VALUES ('2623', '168', 'Surigao del Norte', 'SNO', '1');
INSERT INTO `zone` VALUES ('2624', '168', 'Surigao del Sur', 'SSU', '1');
INSERT INTO `zone` VALUES ('2625', '168', 'Tarlac', 'TAR', '1');
INSERT INTO `zone` VALUES ('2626', '168', 'Tawi-Tawi', 'TAW', '1');
INSERT INTO `zone` VALUES ('2627', '168', 'Zambales', 'ZBL', '1');
INSERT INTO `zone` VALUES ('2628', '168', 'Zamboanga del Norte', 'ZNO', '1');
INSERT INTO `zone` VALUES ('2629', '168', 'Zamboanga del Sur', 'ZSU', '1');
INSERT INTO `zone` VALUES ('2630', '168', 'Zamboanga Sibugay', 'ZSI', '1');
INSERT INTO `zone` VALUES ('2631', '170', 'Dolnoslaskie', 'DO', '1');
INSERT INTO `zone` VALUES ('2632', '170', 'Kujawsko-Pomorskie', 'KP', '1');
INSERT INTO `zone` VALUES ('2633', '170', 'Lodzkie', 'LO', '1');
INSERT INTO `zone` VALUES ('2634', '170', 'Lubelskie', 'LL', '1');
INSERT INTO `zone` VALUES ('2635', '170', 'Lubuskie', 'LU', '1');
INSERT INTO `zone` VALUES ('2636', '170', 'Malopolskie', 'ML', '1');
INSERT INTO `zone` VALUES ('2637', '170', 'Mazowieckie', 'MZ', '1');
INSERT INTO `zone` VALUES ('2638', '170', 'Opolskie', 'OP', '1');
INSERT INTO `zone` VALUES ('2639', '170', 'Podkarpackie', 'PP', '1');
INSERT INTO `zone` VALUES ('2640', '170', 'Podlaskie', 'PL', '1');
INSERT INTO `zone` VALUES ('2641', '170', 'Pomorskie', 'PM', '1');
INSERT INTO `zone` VALUES ('2642', '170', 'Slaskie', 'SL', '1');
INSERT INTO `zone` VALUES ('2643', '170', 'Swietokrzyskie', 'SW', '1');
INSERT INTO `zone` VALUES ('2644', '170', 'Warminsko-Mazurskie', 'WM', '1');
INSERT INTO `zone` VALUES ('2645', '170', 'Wielkopolskie', 'WP', '1');
INSERT INTO `zone` VALUES ('2646', '170', 'Zachodniopomorskie', 'ZA', '1');
INSERT INTO `zone` VALUES ('2647', '198', 'Saint Pierre', 'P', '1');
INSERT INTO `zone` VALUES ('2648', '198', 'Miquelon', 'M', '1');
INSERT INTO `zone` VALUES ('2649', '171', 'A&ccedil;ores', 'AC', '1');
INSERT INTO `zone` VALUES ('2650', '171', 'Aveiro', 'AV', '1');
INSERT INTO `zone` VALUES ('2651', '171', 'Beja', 'BE', '1');
INSERT INTO `zone` VALUES ('2652', '171', 'Braga', 'BR', '1');
INSERT INTO `zone` VALUES ('2653', '171', 'Bragan&ccedil;a', 'BA', '1');
INSERT INTO `zone` VALUES ('2654', '171', 'Castelo Branco', 'CB', '1');
INSERT INTO `zone` VALUES ('2655', '171', 'Coimbra', 'CO', '1');
INSERT INTO `zone` VALUES ('2656', '171', '&Eacute;vora', 'EV', '1');
INSERT INTO `zone` VALUES ('2657', '171', 'Faro', 'FA', '1');
INSERT INTO `zone` VALUES ('2658', '171', 'Guarda', 'GU', '1');
INSERT INTO `zone` VALUES ('2659', '171', 'Leiria', 'LE', '1');
INSERT INTO `zone` VALUES ('2660', '171', 'Lisboa', 'LI', '1');
INSERT INTO `zone` VALUES ('2661', '171', 'Madeira', 'ME', '1');
INSERT INTO `zone` VALUES ('2662', '171', 'Portalegre', 'PO', '1');
INSERT INTO `zone` VALUES ('2663', '171', 'Porto', 'PR', '1');
INSERT INTO `zone` VALUES ('2664', '171', 'Santar&eacute;m', 'SA', '1');
INSERT INTO `zone` VALUES ('2665', '171', 'Set&uacute;bal', 'SE', '1');
INSERT INTO `zone` VALUES ('2666', '171', 'Viana do Castelo', 'VC', '1');
INSERT INTO `zone` VALUES ('2667', '171', 'Vila Real', 'VR', '1');
INSERT INTO `zone` VALUES ('2668', '171', 'Viseu', 'VI', '1');
INSERT INTO `zone` VALUES ('2669', '173', 'Ad Dawhah', 'DW', '1');
INSERT INTO `zone` VALUES ('2670', '173', 'Al Ghuwayriyah', 'GW', '1');
INSERT INTO `zone` VALUES ('2671', '173', 'Al Jumayliyah', 'JM', '1');
INSERT INTO `zone` VALUES ('2672', '173', 'Al Khawr', 'KR', '1');
INSERT INTO `zone` VALUES ('2673', '173', 'Al Wakrah', 'WK', '1');
INSERT INTO `zone` VALUES ('2674', '173', 'Ar Rayyan', 'RN', '1');
INSERT INTO `zone` VALUES ('2675', '173', 'Jarayan al Batinah', 'JB', '1');
INSERT INTO `zone` VALUES ('2676', '173', 'Madinat ash Shamal', 'MS', '1');
INSERT INTO `zone` VALUES ('2677', '173', 'Umm Sa\'id', 'UD', '1');
INSERT INTO `zone` VALUES ('2678', '173', 'Umm Salal', 'UL', '1');
INSERT INTO `zone` VALUES ('2679', '175', 'Alba', 'AB', '1');
INSERT INTO `zone` VALUES ('2680', '175', 'Arad', 'AR', '1');
INSERT INTO `zone` VALUES ('2681', '175', 'Arges', 'AG', '1');
INSERT INTO `zone` VALUES ('2682', '175', 'Bacau', 'BC', '1');
INSERT INTO `zone` VALUES ('2683', '175', 'Bihor', 'BH', '1');
INSERT INTO `zone` VALUES ('2684', '175', 'Bistrita-Nasaud', 'BN', '1');
INSERT INTO `zone` VALUES ('2685', '175', 'Botosani', 'BT', '1');
INSERT INTO `zone` VALUES ('2686', '175', 'Brasov', 'BV', '1');
INSERT INTO `zone` VALUES ('2687', '175', 'Braila', 'BR', '1');
INSERT INTO `zone` VALUES ('2688', '175', 'Bucuresti', 'B', '1');
INSERT INTO `zone` VALUES ('2689', '175', 'Buzau', 'BZ', '1');
INSERT INTO `zone` VALUES ('2690', '175', 'Caras-Severin', 'CS', '1');
INSERT INTO `zone` VALUES ('2691', '175', 'Calarasi', 'CL', '1');
INSERT INTO `zone` VALUES ('2692', '175', 'Cluj', 'CJ', '1');
INSERT INTO `zone` VALUES ('2693', '175', 'Constanta', 'CT', '1');
INSERT INTO `zone` VALUES ('2694', '175', 'Covasna', 'CV', '1');
INSERT INTO `zone` VALUES ('2695', '175', 'Dimbovita', 'DB', '1');
INSERT INTO `zone` VALUES ('2696', '175', 'Dolj', 'DJ', '1');
INSERT INTO `zone` VALUES ('2697', '175', 'Galati', 'GL', '1');
INSERT INTO `zone` VALUES ('2698', '175', 'Giurgiu', 'GR', '1');
INSERT INTO `zone` VALUES ('2699', '175', 'Gorj', 'GJ', '1');
INSERT INTO `zone` VALUES ('2700', '175', 'Harghita', 'HR', '1');
INSERT INTO `zone` VALUES ('2701', '175', 'Hunedoara', 'HD', '1');
INSERT INTO `zone` VALUES ('2702', '175', 'Ialomita', 'IL', '1');
INSERT INTO `zone` VALUES ('2703', '175', 'Iasi', 'IS', '1');
INSERT INTO `zone` VALUES ('2704', '175', 'Ilfov', 'IF', '1');
INSERT INTO `zone` VALUES ('2705', '175', 'Maramures', 'MM', '1');
INSERT INTO `zone` VALUES ('2706', '175', 'Mehedinti', 'MH', '1');
INSERT INTO `zone` VALUES ('2707', '175', 'Mures', 'MS', '1');
INSERT INTO `zone` VALUES ('2708', '175', 'Neamt', 'NT', '1');
INSERT INTO `zone` VALUES ('2709', '175', 'Olt', 'OT', '1');
INSERT INTO `zone` VALUES ('2710', '175', 'Prahova', 'PH', '1');
INSERT INTO `zone` VALUES ('2711', '175', 'Satu-Mare', 'SM', '1');
INSERT INTO `zone` VALUES ('2712', '175', 'Salaj', 'SJ', '1');
INSERT INTO `zone` VALUES ('2713', '175', 'Sibiu', 'SB', '1');
INSERT INTO `zone` VALUES ('2714', '175', 'Suceava', 'SV', '1');
INSERT INTO `zone` VALUES ('2715', '175', 'Teleorman', 'TR', '1');
INSERT INTO `zone` VALUES ('2716', '175', 'Timis', 'TM', '1');
INSERT INTO `zone` VALUES ('2717', '175', 'Tulcea', 'TL', '1');
INSERT INTO `zone` VALUES ('2718', '175', 'Vaslui', 'VS', '1');
INSERT INTO `zone` VALUES ('2719', '175', 'Valcea', 'VL', '1');
INSERT INTO `zone` VALUES ('2720', '175', 'Vrancea', 'VN', '1');
INSERT INTO `zone` VALUES ('2721', '176', 'Abakan', 'AB', '1');
INSERT INTO `zone` VALUES ('2722', '176', 'Aginskoye', 'AG', '1');
INSERT INTO `zone` VALUES ('2723', '176', 'Anadyr', 'AN', '1');
INSERT INTO `zone` VALUES ('2724', '176', 'Arkahangelsk', 'AR', '1');
INSERT INTO `zone` VALUES ('2725', '176', 'Astrakhan', 'AS', '1');
INSERT INTO `zone` VALUES ('2726', '176', 'Barnaul', 'BA', '1');
INSERT INTO `zone` VALUES ('2727', '176', 'Belgorod', 'BE', '1');
INSERT INTO `zone` VALUES ('2728', '176', 'Birobidzhan', 'BI', '1');
INSERT INTO `zone` VALUES ('2729', '176', 'Blagoveshchensk', 'BL', '1');
INSERT INTO `zone` VALUES ('2730', '176', 'Bryansk', 'BR', '1');
INSERT INTO `zone` VALUES ('2731', '176', 'Cheboksary', 'CH', '1');
INSERT INTO `zone` VALUES ('2732', '176', 'Chelyabinsk', 'CL', '1');
INSERT INTO `zone` VALUES ('2733', '176', 'Cherkessk', 'CR', '1');
INSERT INTO `zone` VALUES ('2734', '176', 'Chita', 'CI', '1');
INSERT INTO `zone` VALUES ('2735', '176', 'Dudinka', 'DU', '1');
INSERT INTO `zone` VALUES ('2736', '176', 'Elista', 'EL', '1');
INSERT INTO `zone` VALUES ('2737', '176', 'Gomo-Altaysk', 'GO', '1');
INSERT INTO `zone` VALUES ('2738', '176', 'Gorno-Altaysk', 'GA', '1');
INSERT INTO `zone` VALUES ('2739', '176', 'Groznyy', 'GR', '1');
INSERT INTO `zone` VALUES ('2740', '176', 'Irkutsk', 'IR', '1');
INSERT INTO `zone` VALUES ('2741', '176', 'Ivanovo', 'IV', '1');
INSERT INTO `zone` VALUES ('2742', '176', 'Izhevsk', 'IZ', '1');
INSERT INTO `zone` VALUES ('2743', '176', 'Kalinigrad', 'KA', '1');
INSERT INTO `zone` VALUES ('2744', '176', 'Kaluga', 'KL', '1');
INSERT INTO `zone` VALUES ('2745', '176', 'Kasnodar', 'KS', '1');
INSERT INTO `zone` VALUES ('2746', '176', 'Kazan', 'KZ', '1');
INSERT INTO `zone` VALUES ('2747', '176', 'Kemerovo', 'KE', '1');
INSERT INTO `zone` VALUES ('2748', '176', 'Khabarovsk', 'KH', '1');
INSERT INTO `zone` VALUES ('2749', '176', 'Khanty-Mansiysk', 'KM', '1');
INSERT INTO `zone` VALUES ('2750', '176', 'Kostroma', 'KO', '1');
INSERT INTO `zone` VALUES ('2751', '176', 'Krasnodar', 'KR', '1');
INSERT INTO `zone` VALUES ('2752', '176', 'Krasnoyarsk', 'KN', '1');
INSERT INTO `zone` VALUES ('2753', '176', 'Kudymkar', 'KU', '1');
INSERT INTO `zone` VALUES ('2754', '176', 'Kurgan', 'KG', '1');
INSERT INTO `zone` VALUES ('2755', '176', 'Kursk', 'KK', '1');
INSERT INTO `zone` VALUES ('2756', '176', 'Kyzyl', 'KY', '1');
INSERT INTO `zone` VALUES ('2757', '176', 'Lipetsk', 'LI', '1');
INSERT INTO `zone` VALUES ('2758', '176', 'Magadan', 'MA', '1');
INSERT INTO `zone` VALUES ('2759', '176', 'Makhachkala', 'MK', '1');
INSERT INTO `zone` VALUES ('2760', '176', 'Maykop', 'MY', '1');
INSERT INTO `zone` VALUES ('2761', '176', 'Moscow', 'MO', '1');
INSERT INTO `zone` VALUES ('2762', '176', 'Murmansk', 'MU', '1');
INSERT INTO `zone` VALUES ('2763', '176', 'Nalchik', 'NA', '1');
INSERT INTO `zone` VALUES ('2764', '176', 'Naryan Mar', 'NR', '1');
INSERT INTO `zone` VALUES ('2765', '176', 'Nazran', 'NZ', '1');
INSERT INTO `zone` VALUES ('2766', '176', 'Nizhniy Novgorod', 'NI', '1');
INSERT INTO `zone` VALUES ('2767', '176', 'Novgorod', 'NO', '1');
INSERT INTO `zone` VALUES ('2768', '176', 'Novosibirsk', 'NV', '1');
INSERT INTO `zone` VALUES ('2769', '176', 'Omsk', 'OM', '1');
INSERT INTO `zone` VALUES ('2770', '176', 'Orel', 'OR', '1');
INSERT INTO `zone` VALUES ('2771', '176', 'Orenburg', 'OE', '1');
INSERT INTO `zone` VALUES ('2772', '176', 'Palana', 'PA', '1');
INSERT INTO `zone` VALUES ('2773', '176', 'Penza', 'PE', '1');
INSERT INTO `zone` VALUES ('2774', '176', 'Perm', 'PR', '1');
INSERT INTO `zone` VALUES ('2775', '176', 'Petropavlovsk-Kamchatskiy', 'PK', '1');
INSERT INTO `zone` VALUES ('2776', '176', 'Petrozavodsk', 'PT', '1');
INSERT INTO `zone` VALUES ('2777', '176', 'Pskov', 'PS', '1');
INSERT INTO `zone` VALUES ('2778', '176', 'Rostov-na-Donu', 'RO', '1');
INSERT INTO `zone` VALUES ('2779', '176', 'Ryazan', 'RY', '1');
INSERT INTO `zone` VALUES ('2780', '176', 'Salekhard', 'SL', '1');
INSERT INTO `zone` VALUES ('2781', '176', 'Samara', 'SA', '1');
INSERT INTO `zone` VALUES ('2782', '176', 'Saransk', 'SR', '1');
INSERT INTO `zone` VALUES ('2783', '176', 'Saratov', 'SV', '1');
INSERT INTO `zone` VALUES ('2784', '176', 'Smolensk', 'SM', '1');
INSERT INTO `zone` VALUES ('2785', '176', 'St. Petersburg', 'SP', '1');
INSERT INTO `zone` VALUES ('2786', '176', 'Stavropol', 'ST', '1');
INSERT INTO `zone` VALUES ('2787', '176', 'Syktyvkar', 'SY', '1');
INSERT INTO `zone` VALUES ('2788', '176', 'Tambov', 'TA', '1');
INSERT INTO `zone` VALUES ('2789', '176', 'Tomsk', 'TO', '1');
INSERT INTO `zone` VALUES ('2790', '176', 'Tula', 'TU', '1');
INSERT INTO `zone` VALUES ('2791', '176', 'Tura', 'TR', '1');
INSERT INTO `zone` VALUES ('2792', '176', 'Tver', 'TV', '1');
INSERT INTO `zone` VALUES ('2793', '176', 'Tyumen', 'TY', '1');
INSERT INTO `zone` VALUES ('2794', '176', 'Ufa', 'UF', '1');
INSERT INTO `zone` VALUES ('2795', '176', 'Ul\'yanovsk', 'UL', '1');
INSERT INTO `zone` VALUES ('2796', '176', 'Ulan-Ude', 'UU', '1');
INSERT INTO `zone` VALUES ('2797', '176', 'Ust\'-Ordynskiy', 'US', '1');
INSERT INTO `zone` VALUES ('2798', '176', 'Vladikavkaz', 'VL', '1');
INSERT INTO `zone` VALUES ('2799', '176', 'Vladimir', 'VA', '1');
INSERT INTO `zone` VALUES ('2800', '176', 'Vladivostok', 'VV', '1');
INSERT INTO `zone` VALUES ('2801', '176', 'Volgograd', 'VG', '1');
INSERT INTO `zone` VALUES ('2802', '176', 'Vologda', 'VD', '1');
INSERT INTO `zone` VALUES ('2803', '176', 'Voronezh', 'VO', '1');
INSERT INTO `zone` VALUES ('2804', '176', 'Vyatka', 'VY', '1');
INSERT INTO `zone` VALUES ('2805', '176', 'Yakutsk', 'YA', '1');
INSERT INTO `zone` VALUES ('2806', '176', 'Yaroslavl', 'YR', '1');
INSERT INTO `zone` VALUES ('2807', '176', 'Yekaterinburg', 'YE', '1');
INSERT INTO `zone` VALUES ('2808', '176', 'Yoshkar-Ola', 'YO', '1');
INSERT INTO `zone` VALUES ('2809', '177', 'Butare', 'BU', '1');
INSERT INTO `zone` VALUES ('2810', '177', 'Byumba', 'BY', '1');
INSERT INTO `zone` VALUES ('2811', '177', 'Cyangugu', 'CY', '1');
INSERT INTO `zone` VALUES ('2812', '177', 'Gikongoro', 'GK', '1');
INSERT INTO `zone` VALUES ('2813', '177', 'Gisenyi', 'GS', '1');
INSERT INTO `zone` VALUES ('2814', '177', 'Gitarama', 'GT', '1');
INSERT INTO `zone` VALUES ('2815', '177', 'Kibungo', 'KG', '1');
INSERT INTO `zone` VALUES ('2816', '177', 'Kibuye', 'KY', '1');
INSERT INTO `zone` VALUES ('2817', '177', 'Kigali Rurale', 'KR', '1');
INSERT INTO `zone` VALUES ('2818', '177', 'Kigali-ville', 'KV', '1');
INSERT INTO `zone` VALUES ('2819', '177', 'Ruhengeri', 'RU', '1');
INSERT INTO `zone` VALUES ('2820', '177', 'Umutara', 'UM', '1');
INSERT INTO `zone` VALUES ('2821', '178', 'Christ Church Nichola Town', 'CCN', '1');
INSERT INTO `zone` VALUES ('2822', '178', 'Saint Anne Sandy Point', 'SAS', '1');
INSERT INTO `zone` VALUES ('2823', '178', 'Saint George Basseterre', 'SGB', '1');
INSERT INTO `zone` VALUES ('2824', '178', 'Saint George Gingerland', 'SGG', '1');
INSERT INTO `zone` VALUES ('2825', '178', 'Saint James Windward', 'SJW', '1');
INSERT INTO `zone` VALUES ('2826', '178', 'Saint John Capesterre', 'SJC', '1');
INSERT INTO `zone` VALUES ('2827', '178', 'Saint John Figtree', 'SJF', '1');
INSERT INTO `zone` VALUES ('2828', '178', 'Saint Mary Cayon', 'SMC', '1');
INSERT INTO `zone` VALUES ('2829', '178', 'Saint Paul Capesterre', 'CAP', '1');
INSERT INTO `zone` VALUES ('2830', '178', 'Saint Paul Charlestown', 'CHA', '1');
INSERT INTO `zone` VALUES ('2831', '178', 'Saint Peter Basseterre', 'SPB', '1');
INSERT INTO `zone` VALUES ('2832', '178', 'Saint Thomas Lowland', 'STL', '1');
INSERT INTO `zone` VALUES ('2833', '178', 'Saint Thomas Middle Island', 'STM', '1');
INSERT INTO `zone` VALUES ('2834', '178', 'Trinity Palmetto Point', 'TPP', '1');
INSERT INTO `zone` VALUES ('2835', '179', 'Anse-la-Raye', 'AR', '1');
INSERT INTO `zone` VALUES ('2836', '179', 'Castries', 'CA', '1');
INSERT INTO `zone` VALUES ('2837', '179', 'Choiseul', 'CH', '1');
INSERT INTO `zone` VALUES ('2838', '179', 'Dauphin', 'DA', '1');
INSERT INTO `zone` VALUES ('2839', '179', 'Dennery', 'DE', '1');
INSERT INTO `zone` VALUES ('2840', '179', 'Gros-Islet', 'GI', '1');
INSERT INTO `zone` VALUES ('2841', '179', 'Laborie', 'LA', '1');
INSERT INTO `zone` VALUES ('2842', '179', 'Micoud', 'MI', '1');
INSERT INTO `zone` VALUES ('2843', '179', 'Praslin', 'PR', '1');
INSERT INTO `zone` VALUES ('2844', '179', 'Soufriere', 'SO', '1');
INSERT INTO `zone` VALUES ('2845', '179', 'Vieux-Fort', 'VF', '1');
INSERT INTO `zone` VALUES ('2846', '180', 'Charlotte', 'C', '1');
INSERT INTO `zone` VALUES ('2847', '180', 'Grenadines', 'R', '1');
INSERT INTO `zone` VALUES ('2848', '180', 'Saint Andrew', 'A', '1');
INSERT INTO `zone` VALUES ('2849', '180', 'Saint David', 'D', '1');
INSERT INTO `zone` VALUES ('2850', '180', 'Saint George', 'G', '1');
INSERT INTO `zone` VALUES ('2851', '180', 'Saint Patrick', 'P', '1');
INSERT INTO `zone` VALUES ('2852', '181', 'A\'ana', 'AN', '1');
INSERT INTO `zone` VALUES ('2853', '181', 'Aiga-i-le-Tai', 'AI', '1');
INSERT INTO `zone` VALUES ('2854', '181', 'Atua', 'AT', '1');
INSERT INTO `zone` VALUES ('2855', '181', 'Fa\'asaleleaga', 'FA', '1');
INSERT INTO `zone` VALUES ('2856', '181', 'Gaga\'emauga', 'GE', '1');
INSERT INTO `zone` VALUES ('2857', '181', 'Gagaifomauga', 'GF', '1');
INSERT INTO `zone` VALUES ('2858', '181', 'Palauli', 'PA', '1');
INSERT INTO `zone` VALUES ('2859', '181', 'Satupa\'itea', 'SA', '1');
INSERT INTO `zone` VALUES ('2860', '181', 'Tuamasaga', 'TU', '1');
INSERT INTO `zone` VALUES ('2861', '181', 'Va\'a-o-Fonoti', 'VF', '1');
INSERT INTO `zone` VALUES ('2862', '181', 'Vaisigano', 'VS', '1');
INSERT INTO `zone` VALUES ('2863', '182', 'Acquaviva', 'AC', '1');
INSERT INTO `zone` VALUES ('2864', '182', 'Borgo Maggiore', 'BM', '1');
INSERT INTO `zone` VALUES ('2865', '182', 'Chiesanuova', 'CH', '1');
INSERT INTO `zone` VALUES ('2866', '182', 'Domagnano', 'DO', '1');
INSERT INTO `zone` VALUES ('2867', '182', 'Faetano', 'FA', '1');
INSERT INTO `zone` VALUES ('2868', '182', 'Fiorentino', 'FI', '1');
INSERT INTO `zone` VALUES ('2869', '182', 'Montegiardino', 'MO', '1');
INSERT INTO `zone` VALUES ('2870', '182', 'Citta di San Marino', 'SM', '1');
INSERT INTO `zone` VALUES ('2871', '182', 'Serravalle', 'SE', '1');
INSERT INTO `zone` VALUES ('2872', '183', 'Sao Tome', 'S', '1');
INSERT INTO `zone` VALUES ('2873', '183', 'Principe', 'P', '1');
INSERT INTO `zone` VALUES ('2874', '184', 'Al Bahah', 'BH', '1');
INSERT INTO `zone` VALUES ('2875', '184', 'Al Hudud ash Shamaliyah', 'HS', '1');
INSERT INTO `zone` VALUES ('2876', '184', 'Al Jawf', 'JF', '1');
INSERT INTO `zone` VALUES ('2877', '184', 'Al Madinah', 'MD', '1');
INSERT INTO `zone` VALUES ('2878', '184', 'Al Qasim', 'QS', '1');
INSERT INTO `zone` VALUES ('2879', '184', 'Ar Riyad', 'RD', '1');
INSERT INTO `zone` VALUES ('2880', '184', 'Ash Sharqiyah (Eastern)', 'AQ', '1');
INSERT INTO `zone` VALUES ('2881', '184', '\'Asir', 'AS', '1');
INSERT INTO `zone` VALUES ('2882', '184', 'Ha\'il', 'HL', '1');
INSERT INTO `zone` VALUES ('2883', '184', 'Jizan', 'JZ', '1');
INSERT INTO `zone` VALUES ('2884', '184', 'Makkah', 'ML', '1');
INSERT INTO `zone` VALUES ('2885', '184', 'Najran', 'NR', '1');
INSERT INTO `zone` VALUES ('2886', '184', 'Tabuk', 'TB', '1');
INSERT INTO `zone` VALUES ('2887', '185', 'Dakar', 'DA', '1');
INSERT INTO `zone` VALUES ('2888', '185', 'Diourbel', 'DI', '1');
INSERT INTO `zone` VALUES ('2889', '185', 'Fatick', 'FA', '1');
INSERT INTO `zone` VALUES ('2890', '185', 'Kaolack', 'KA', '1');
INSERT INTO `zone` VALUES ('2891', '185', 'Kolda', 'KO', '1');
INSERT INTO `zone` VALUES ('2892', '185', 'Louga', 'LO', '1');
INSERT INTO `zone` VALUES ('2893', '185', 'Matam', 'MA', '1');
INSERT INTO `zone` VALUES ('2894', '185', 'Saint-Louis', 'SL', '1');
INSERT INTO `zone` VALUES ('2895', '185', 'Tambacounda', 'TA', '1');
INSERT INTO `zone` VALUES ('2896', '185', 'Thies', 'TH', '1');
INSERT INTO `zone` VALUES ('2897', '185', 'Ziguinchor', 'ZI', '1');
INSERT INTO `zone` VALUES ('2898', '186', 'Anse aux Pins', 'AP', '1');
INSERT INTO `zone` VALUES ('2899', '186', 'Anse Boileau', 'AB', '1');
INSERT INTO `zone` VALUES ('2900', '186', 'Anse Etoile', 'AE', '1');
INSERT INTO `zone` VALUES ('2901', '186', 'Anse Louis', 'AL', '1');
INSERT INTO `zone` VALUES ('2902', '186', 'Anse Royale', 'AR', '1');
INSERT INTO `zone` VALUES ('2903', '186', 'Baie Lazare', 'BL', '1');
INSERT INTO `zone` VALUES ('2904', '186', 'Baie Sainte Anne', 'BS', '1');
INSERT INTO `zone` VALUES ('2905', '186', 'Beau Vallon', 'BV', '1');
INSERT INTO `zone` VALUES ('2906', '186', 'Bel Air', 'BA', '1');
INSERT INTO `zone` VALUES ('2907', '186', 'Bel Ombre', 'BO', '1');
INSERT INTO `zone` VALUES ('2908', '186', 'Cascade', 'CA', '1');
INSERT INTO `zone` VALUES ('2909', '186', 'Glacis', 'GL', '1');
INSERT INTO `zone` VALUES ('2910', '186', 'Grand\' Anse (on Mahe)', 'GM', '1');
INSERT INTO `zone` VALUES ('2911', '186', 'Grand\' Anse (on Praslin)', 'GP', '1');
INSERT INTO `zone` VALUES ('2912', '186', 'La Digue', 'DG', '1');
INSERT INTO `zone` VALUES ('2913', '186', 'La Riviere Anglaise', 'RA', '1');
INSERT INTO `zone` VALUES ('2914', '186', 'Mont Buxton', 'MB', '1');
INSERT INTO `zone` VALUES ('2915', '186', 'Mont Fleuri', 'MF', '1');
INSERT INTO `zone` VALUES ('2916', '186', 'Plaisance', 'PL', '1');
INSERT INTO `zone` VALUES ('2917', '186', 'Pointe La Rue', 'PR', '1');
INSERT INTO `zone` VALUES ('2918', '186', 'Port Glaud', 'PG', '1');
INSERT INTO `zone` VALUES ('2919', '186', 'Saint Louis', 'SL', '1');
INSERT INTO `zone` VALUES ('2920', '186', 'Takamaka', 'TA', '1');
INSERT INTO `zone` VALUES ('2921', '187', 'Eastern', 'E', '1');
INSERT INTO `zone` VALUES ('2922', '187', 'Northern', 'N', '1');
INSERT INTO `zone` VALUES ('2923', '187', 'Southern', 'S', '1');
INSERT INTO `zone` VALUES ('2924', '187', 'Western', 'W', '1');
INSERT INTO `zone` VALUES ('2925', '189', 'Banskobystrický', 'BA', '1');
INSERT INTO `zone` VALUES ('2926', '189', 'Bratislavský', 'BR', '1');
INSERT INTO `zone` VALUES ('2927', '189', 'Košický', 'KO', '1');
INSERT INTO `zone` VALUES ('2928', '189', 'Nitriansky', 'NI', '1');
INSERT INTO `zone` VALUES ('2929', '189', 'Prešovský', 'PR', '1');
INSERT INTO `zone` VALUES ('2930', '189', 'Trenčiansky', 'TC', '1');
INSERT INTO `zone` VALUES ('2931', '189', 'Trnavský', 'TV', '1');
INSERT INTO `zone` VALUES ('2932', '189', 'Žilinský', 'ZI', '1');
INSERT INTO `zone` VALUES ('2933', '191', 'Central', 'CE', '1');
INSERT INTO `zone` VALUES ('2934', '191', 'Choiseul', 'CH', '1');
INSERT INTO `zone` VALUES ('2935', '191', 'Guadalcanal', 'GC', '1');
INSERT INTO `zone` VALUES ('2936', '191', 'Honiara', 'HO', '1');
INSERT INTO `zone` VALUES ('2937', '191', 'Isabel', 'IS', '1');
INSERT INTO `zone` VALUES ('2938', '191', 'Makira', 'MK', '1');
INSERT INTO `zone` VALUES ('2939', '191', 'Malaita', 'ML', '1');
INSERT INTO `zone` VALUES ('2940', '191', 'Rennell and Bellona', 'RB', '1');
INSERT INTO `zone` VALUES ('2941', '191', 'Temotu', 'TM', '1');
INSERT INTO `zone` VALUES ('2942', '191', 'Western', 'WE', '1');
INSERT INTO `zone` VALUES ('2943', '192', 'Awdal', 'AW', '1');
INSERT INTO `zone` VALUES ('2944', '192', 'Bakool', 'BK', '1');
INSERT INTO `zone` VALUES ('2945', '192', 'Banaadir', 'BN', '1');
INSERT INTO `zone` VALUES ('2946', '192', 'Bari', 'BR', '1');
INSERT INTO `zone` VALUES ('2947', '192', 'Bay', 'BY', '1');
INSERT INTO `zone` VALUES ('2948', '192', 'Galguduud', 'GA', '1');
INSERT INTO `zone` VALUES ('2949', '192', 'Gedo', 'GE', '1');
INSERT INTO `zone` VALUES ('2950', '192', 'Hiiraan', 'HI', '1');
INSERT INTO `zone` VALUES ('2951', '192', 'Jubbada Dhexe', 'JD', '1');
INSERT INTO `zone` VALUES ('2952', '192', 'Jubbada Hoose', 'JH', '1');
INSERT INTO `zone` VALUES ('2953', '192', 'Mudug', 'MU', '1');
INSERT INTO `zone` VALUES ('2954', '192', 'Nugaal', 'NU', '1');
INSERT INTO `zone` VALUES ('2955', '192', 'Sanaag', 'SA', '1');
INSERT INTO `zone` VALUES ('2956', '192', 'Shabeellaha Dhexe', 'SD', '1');
INSERT INTO `zone` VALUES ('2957', '192', 'Shabeellaha Hoose', 'SH', '1');
INSERT INTO `zone` VALUES ('2958', '192', 'Sool', 'SL', '1');
INSERT INTO `zone` VALUES ('2959', '192', 'Togdheer', 'TO', '1');
INSERT INTO `zone` VALUES ('2960', '192', 'Woqooyi Galbeed', 'WG', '1');
INSERT INTO `zone` VALUES ('2961', '193', 'Eastern Cape', 'EC', '1');
INSERT INTO `zone` VALUES ('2962', '193', 'Free State', 'FS', '1');
INSERT INTO `zone` VALUES ('2963', '193', 'Gauteng', 'GT', '1');
INSERT INTO `zone` VALUES ('2964', '193', 'KwaZulu-Natal', 'KN', '1');
INSERT INTO `zone` VALUES ('2965', '193', 'Limpopo', 'LP', '1');
INSERT INTO `zone` VALUES ('2966', '193', 'Mpumalanga', 'MP', '1');
INSERT INTO `zone` VALUES ('2967', '193', 'North West', 'NW', '1');
INSERT INTO `zone` VALUES ('2968', '193', 'Northern Cape', 'NC', '1');
INSERT INTO `zone` VALUES ('2969', '193', 'Western Cape', 'WC', '1');
INSERT INTO `zone` VALUES ('2970', '195', 'La Coru&ntilde;a', 'CA', '1');
INSERT INTO `zone` VALUES ('2971', '195', '&Aacute;lava', 'AL', '1');
INSERT INTO `zone` VALUES ('2972', '195', 'Albacete', 'AB', '1');
INSERT INTO `zone` VALUES ('2973', '195', 'Alicante', 'AC', '1');
INSERT INTO `zone` VALUES ('2974', '195', 'Almeria', 'AM', '1');
INSERT INTO `zone` VALUES ('2975', '195', 'Asturias', 'AS', '1');
INSERT INTO `zone` VALUES ('2976', '195', '&Aacute;vila', 'AV', '1');
INSERT INTO `zone` VALUES ('2977', '195', 'Badajoz', 'BJ', '1');
INSERT INTO `zone` VALUES ('2978', '195', 'Baleares', 'IB', '1');
INSERT INTO `zone` VALUES ('2979', '195', 'Barcelona', 'BA', '1');
INSERT INTO `zone` VALUES ('2980', '195', 'Burgos', 'BU', '1');
INSERT INTO `zone` VALUES ('2981', '195', 'C&aacute;ceres', 'CC', '1');
INSERT INTO `zone` VALUES ('2982', '195', 'C&aacute;diz', 'CZ', '1');
INSERT INTO `zone` VALUES ('2983', '195', 'Cantabria', 'CT', '1');
INSERT INTO `zone` VALUES ('2984', '195', 'Castell&oacute;n', 'CL', '1');
INSERT INTO `zone` VALUES ('2985', '195', 'Ceuta', 'CE', '1');
INSERT INTO `zone` VALUES ('2986', '195', 'Ciudad Real', 'CR', '1');
INSERT INTO `zone` VALUES ('2987', '195', 'C&oacute;rdoba', 'CD', '1');
INSERT INTO `zone` VALUES ('2988', '195', 'Cuenca', 'CU', '1');
INSERT INTO `zone` VALUES ('2989', '195', 'Girona', 'GI', '1');
INSERT INTO `zone` VALUES ('2990', '195', 'Granada', 'GD', '1');
INSERT INTO `zone` VALUES ('2991', '195', 'Guadalajara', 'GJ', '1');
INSERT INTO `zone` VALUES ('2992', '195', 'Guip&uacute;zcoa', 'GP', '1');
INSERT INTO `zone` VALUES ('2993', '195', 'Huelva', 'HL', '1');
INSERT INTO `zone` VALUES ('2994', '195', 'Huesca', 'HS', '1');
INSERT INTO `zone` VALUES ('2995', '195', 'Ja&eacute;n', 'JN', '1');
INSERT INTO `zone` VALUES ('2996', '195', 'La Rioja', 'RJ', '1');
INSERT INTO `zone` VALUES ('2997', '195', 'Las Palmas', 'PM', '1');
INSERT INTO `zone` VALUES ('2998', '195', 'Leon', 'LE', '1');
INSERT INTO `zone` VALUES ('2999', '195', 'Lleida', 'LL', '1');
INSERT INTO `zone` VALUES ('3000', '195', 'Lugo', 'LG', '1');
INSERT INTO `zone` VALUES ('3001', '195', 'Madrid', 'MD', '1');
INSERT INTO `zone` VALUES ('3002', '195', 'Malaga', 'MA', '1');
INSERT INTO `zone` VALUES ('3003', '195', 'Melilla', 'ML', '1');
INSERT INTO `zone` VALUES ('3004', '195', 'Murcia', 'MU', '1');
INSERT INTO `zone` VALUES ('3005', '195', 'Navarra', 'NV', '1');
INSERT INTO `zone` VALUES ('3006', '195', 'Ourense', 'OU', '1');
INSERT INTO `zone` VALUES ('3007', '195', 'Palencia', 'PL', '1');
INSERT INTO `zone` VALUES ('3008', '195', 'Pontevedra', 'PO', '1');
INSERT INTO `zone` VALUES ('3009', '195', 'Salamanca', 'SL', '1');
INSERT INTO `zone` VALUES ('3010', '195', 'Santa Cruz de Tenerife', 'SC', '1');
INSERT INTO `zone` VALUES ('3011', '195', 'Segovia', 'SG', '1');
INSERT INTO `zone` VALUES ('3012', '195', 'Sevilla', 'SV', '1');
INSERT INTO `zone` VALUES ('3013', '195', 'Soria', 'SO', '1');
INSERT INTO `zone` VALUES ('3014', '195', 'Tarragona', 'TA', '1');
INSERT INTO `zone` VALUES ('3015', '195', 'Teruel', 'TE', '1');
INSERT INTO `zone` VALUES ('3016', '195', 'Toledo', 'TO', '1');
INSERT INTO `zone` VALUES ('3017', '195', 'Valencia', 'VC', '1');
INSERT INTO `zone` VALUES ('3018', '195', 'Valladolid', 'VD', '1');
INSERT INTO `zone` VALUES ('3019', '195', 'Vizcaya', 'VZ', '1');
INSERT INTO `zone` VALUES ('3020', '195', 'Zamora', 'ZM', '1');
INSERT INTO `zone` VALUES ('3021', '195', 'Zaragoza', 'ZR', '1');
INSERT INTO `zone` VALUES ('3022', '196', 'Central', 'CE', '1');
INSERT INTO `zone` VALUES ('3023', '196', 'Eastern', 'EA', '1');
INSERT INTO `zone` VALUES ('3024', '196', 'North Central', 'NC', '1');
INSERT INTO `zone` VALUES ('3025', '196', 'Northern', 'NO', '1');
INSERT INTO `zone` VALUES ('3026', '196', 'North Western', 'NW', '1');
INSERT INTO `zone` VALUES ('3027', '196', 'Sabaragamuwa', 'SA', '1');
INSERT INTO `zone` VALUES ('3028', '196', 'Southern', 'SO', '1');
INSERT INTO `zone` VALUES ('3029', '196', 'Uva', 'UV', '1');
INSERT INTO `zone` VALUES ('3030', '196', 'Western', 'WE', '1');
INSERT INTO `zone` VALUES ('3031', '197', 'Ascension', 'A', '1');
INSERT INTO `zone` VALUES ('3032', '197', 'Saint Helena', 'S', '1');
INSERT INTO `zone` VALUES ('3033', '197', 'Tristan da Cunha', 'T', '1');
INSERT INTO `zone` VALUES ('3034', '199', 'A\'ali an Nil', 'ANL', '1');
INSERT INTO `zone` VALUES ('3035', '199', 'Al Bahr al Ahmar', 'BAM', '1');
INSERT INTO `zone` VALUES ('3036', '199', 'Al Buhayrat', 'BRT', '1');
INSERT INTO `zone` VALUES ('3037', '199', 'Al Jazirah', 'JZR', '1');
INSERT INTO `zone` VALUES ('3038', '199', 'Al Khartum', 'KRT', '1');
INSERT INTO `zone` VALUES ('3039', '199', 'Al Qadarif', 'QDR', '1');
INSERT INTO `zone` VALUES ('3040', '199', 'Al Wahdah', 'WDH', '1');
INSERT INTO `zone` VALUES ('3041', '199', 'An Nil al Abyad', 'ANB', '1');
INSERT INTO `zone` VALUES ('3042', '199', 'An Nil al Azraq', 'ANZ', '1');
INSERT INTO `zone` VALUES ('3043', '199', 'Ash Shamaliyah', 'ASH', '1');
INSERT INTO `zone` VALUES ('3044', '199', 'Bahr al Jabal', 'BJA', '1');
INSERT INTO `zone` VALUES ('3045', '199', 'Gharb al Istiwa\'iyah', 'GIS', '1');
INSERT INTO `zone` VALUES ('3046', '199', 'Gharb Bahr al Ghazal', 'GBG', '1');
INSERT INTO `zone` VALUES ('3047', '199', 'Gharb Darfur', 'GDA', '1');
INSERT INTO `zone` VALUES ('3048', '199', 'Gharb Kurdufan', 'GKU', '1');
INSERT INTO `zone` VALUES ('3049', '199', 'Janub Darfur', 'JDA', '1');
INSERT INTO `zone` VALUES ('3050', '199', 'Janub Kurdufan', 'JKU', '1');
INSERT INTO `zone` VALUES ('3051', '199', 'Junqali', 'JQL', '1');
INSERT INTO `zone` VALUES ('3052', '199', 'Kassala', 'KSL', '1');
INSERT INTO `zone` VALUES ('3053', '199', 'Nahr an Nil', 'NNL', '1');
INSERT INTO `zone` VALUES ('3054', '199', 'Shamal Bahr al Ghazal', 'SBG', '1');
INSERT INTO `zone` VALUES ('3055', '199', 'Shamal Darfur', 'SDA', '1');
INSERT INTO `zone` VALUES ('3056', '199', 'Shamal Kurdufan', 'SKU', '1');
INSERT INTO `zone` VALUES ('3057', '199', 'Sharq al Istiwa\'iyah', 'SIS', '1');
INSERT INTO `zone` VALUES ('3058', '199', 'Sinnar', 'SNR', '1');
INSERT INTO `zone` VALUES ('3059', '199', 'Warab', 'WRB', '1');
INSERT INTO `zone` VALUES ('3060', '200', 'Brokopondo', 'BR', '1');
INSERT INTO `zone` VALUES ('3061', '200', 'Commewijne', 'CM', '1');
INSERT INTO `zone` VALUES ('3062', '200', 'Coronie', 'CR', '1');
INSERT INTO `zone` VALUES ('3063', '200', 'Marowijne', 'MA', '1');
INSERT INTO `zone` VALUES ('3064', '200', 'Nickerie', 'NI', '1');
INSERT INTO `zone` VALUES ('3065', '200', 'Para', 'PA', '1');
INSERT INTO `zone` VALUES ('3066', '200', 'Paramaribo', 'PM', '1');
INSERT INTO `zone` VALUES ('3067', '200', 'Saramacca', 'SA', '1');
INSERT INTO `zone` VALUES ('3068', '200', 'Sipaliwini', 'SI', '1');
INSERT INTO `zone` VALUES ('3069', '200', 'Wanica', 'WA', '1');
INSERT INTO `zone` VALUES ('3070', '202', 'Hhohho', 'H', '1');
INSERT INTO `zone` VALUES ('3071', '202', 'Lubombo', 'L', '1');
INSERT INTO `zone` VALUES ('3072', '202', 'Manzini', 'M', '1');
INSERT INTO `zone` VALUES ('3073', '202', 'Shishelweni', 'S', '1');
INSERT INTO `zone` VALUES ('3074', '203', 'Blekinge', 'K', '1');
INSERT INTO `zone` VALUES ('3075', '203', 'Dalarna', 'W', '1');
INSERT INTO `zone` VALUES ('3076', '203', 'G&auml;vleborg', 'X', '1');
INSERT INTO `zone` VALUES ('3077', '203', 'Gotland', 'I', '1');
INSERT INTO `zone` VALUES ('3078', '203', 'Halland', 'N', '1');
INSERT INTO `zone` VALUES ('3079', '203', 'J&auml;mtland', 'Z', '1');
INSERT INTO `zone` VALUES ('3080', '203', 'J&ouml;nk&ouml;ping', 'F', '1');
INSERT INTO `zone` VALUES ('3081', '203', 'Kalmar', 'H', '1');
INSERT INTO `zone` VALUES ('3082', '203', 'Kronoberg', 'G', '1');
INSERT INTO `zone` VALUES ('3083', '203', 'Norrbotten', 'BD', '1');
INSERT INTO `zone` VALUES ('3084', '203', '&Ouml;rebro', 'T', '1');
INSERT INTO `zone` VALUES ('3085', '203', '&Ouml;sterg&ouml;tland', 'E', '1');
INSERT INTO `zone` VALUES ('3086', '203', 'Sk&aring;ne', 'M', '1');
INSERT INTO `zone` VALUES ('3087', '203', 'S&ouml;dermanland', 'D', '1');
INSERT INTO `zone` VALUES ('3088', '203', 'Stockholm', 'AB', '1');
INSERT INTO `zone` VALUES ('3089', '203', 'Uppsala', 'C', '1');
INSERT INTO `zone` VALUES ('3090', '203', 'V&auml;rmland', 'S', '1');
INSERT INTO `zone` VALUES ('3091', '203', 'V&auml;sterbotten', 'AC', '1');
INSERT INTO `zone` VALUES ('3092', '203', 'V&auml;sternorrland', 'Y', '1');
INSERT INTO `zone` VALUES ('3093', '203', 'V&auml;stmanland', 'U', '1');
INSERT INTO `zone` VALUES ('3094', '203', 'V&auml;stra G&ouml;taland', 'O', '1');
INSERT INTO `zone` VALUES ('3095', '204', 'Aargau', 'AG', '1');
INSERT INTO `zone` VALUES ('3096', '204', 'Appenzell Ausserrhoden', 'AR', '1');
INSERT INTO `zone` VALUES ('3097', '204', 'Appenzell Innerrhoden', 'AI', '1');
INSERT INTO `zone` VALUES ('3098', '204', 'Basel-Stadt', 'BS', '1');
INSERT INTO `zone` VALUES ('3099', '204', 'Basel-Landschaft', 'BL', '1');
INSERT INTO `zone` VALUES ('3100', '204', 'Bern', 'BE', '1');
INSERT INTO `zone` VALUES ('3101', '204', 'Fribourg', 'FR', '1');
INSERT INTO `zone` VALUES ('3102', '204', 'Gen&egrave;ve', 'GE', '1');
INSERT INTO `zone` VALUES ('3103', '204', 'Glarus', 'GL', '1');
INSERT INTO `zone` VALUES ('3104', '204', 'Graub&uuml;nden', 'GR', '1');
INSERT INTO `zone` VALUES ('3105', '204', 'Jura', 'JU', '1');
INSERT INTO `zone` VALUES ('3106', '204', 'Luzern', 'LU', '1');
INSERT INTO `zone` VALUES ('3107', '204', 'Neuch&acirc;tel', 'NE', '1');
INSERT INTO `zone` VALUES ('3108', '204', 'Nidwald', 'NW', '1');
INSERT INTO `zone` VALUES ('3109', '204', 'Obwald', 'OW', '1');
INSERT INTO `zone` VALUES ('3110', '204', 'St. Gallen', 'SG', '1');
INSERT INTO `zone` VALUES ('3111', '204', 'Schaffhausen', 'SH', '1');
INSERT INTO `zone` VALUES ('3112', '204', 'Schwyz', 'SZ', '1');
INSERT INTO `zone` VALUES ('3113', '204', 'Solothurn', 'SO', '1');
INSERT INTO `zone` VALUES ('3114', '204', 'Thurgau', 'TG', '1');
INSERT INTO `zone` VALUES ('3115', '204', 'Ticino', 'TI', '1');
INSERT INTO `zone` VALUES ('3116', '204', 'Uri', 'UR', '1');
INSERT INTO `zone` VALUES ('3117', '204', 'Valais', 'VS', '1');
INSERT INTO `zone` VALUES ('3118', '204', 'Vaud', 'VD', '1');
INSERT INTO `zone` VALUES ('3119', '204', 'Zug', 'ZG', '1');
INSERT INTO `zone` VALUES ('3120', '204', 'Z&uuml;rich', 'ZH', '1');
INSERT INTO `zone` VALUES ('3121', '205', 'Al Hasakah', 'HA', '1');
INSERT INTO `zone` VALUES ('3122', '205', 'Al Ladhiqiyah', 'LA', '1');
INSERT INTO `zone` VALUES ('3123', '205', 'Al Qunaytirah', 'QU', '1');
INSERT INTO `zone` VALUES ('3124', '205', 'Ar Raqqah', 'RQ', '1');
INSERT INTO `zone` VALUES ('3125', '205', 'As Suwayda', 'SU', '1');
INSERT INTO `zone` VALUES ('3126', '205', 'Dara', 'DA', '1');
INSERT INTO `zone` VALUES ('3127', '205', 'Dayr az Zawr', 'DZ', '1');
INSERT INTO `zone` VALUES ('3128', '205', 'Dimashq', 'DI', '1');
INSERT INTO `zone` VALUES ('3129', '205', 'Halab', 'HL', '1');
INSERT INTO `zone` VALUES ('3130', '205', 'Hamah', 'HM', '1');
INSERT INTO `zone` VALUES ('3131', '205', 'Hims', 'HI', '1');
INSERT INTO `zone` VALUES ('3132', '205', 'Idlib', 'ID', '1');
INSERT INTO `zone` VALUES ('3133', '205', 'Rif Dimashq', 'RD', '1');
INSERT INTO `zone` VALUES ('3134', '205', 'Tartus', 'TA', '1');
INSERT INTO `zone` VALUES ('3135', '206', 'Chang-hua', 'CH', '1');
INSERT INTO `zone` VALUES ('3136', '206', 'Chia-i', 'CI', '1');
INSERT INTO `zone` VALUES ('3137', '206', 'Hsin-chu', 'HS', '1');
INSERT INTO `zone` VALUES ('3138', '206', 'Hua-lien', 'HL', '1');
INSERT INTO `zone` VALUES ('3139', '206', 'I-lan', 'IL', '1');
INSERT INTO `zone` VALUES ('3140', '206', 'Kao-hsiung county', 'KH', '1');
INSERT INTO `zone` VALUES ('3141', '206', 'Kin-men', 'KM', '1');
INSERT INTO `zone` VALUES ('3142', '206', 'Lien-chiang', 'LC', '1');
INSERT INTO `zone` VALUES ('3143', '206', 'Miao-li', 'ML', '1');
INSERT INTO `zone` VALUES ('3144', '206', 'Nan-t\'ou', 'NT', '1');
INSERT INTO `zone` VALUES ('3145', '206', 'P\'eng-hu', 'PH', '1');
INSERT INTO `zone` VALUES ('3146', '206', 'P\'ing-tung', 'PT', '1');
INSERT INTO `zone` VALUES ('3147', '206', 'T\'ai-chung', 'TG', '1');
INSERT INTO `zone` VALUES ('3148', '206', 'T\'ai-nan', 'TA', '1');
INSERT INTO `zone` VALUES ('3149', '206', 'T\'ai-pei county', 'TP', '1');
INSERT INTO `zone` VALUES ('3150', '206', 'T\'ai-tung', 'TT', '1');
INSERT INTO `zone` VALUES ('3151', '206', 'T\'ao-yuan', 'TY', '1');
INSERT INTO `zone` VALUES ('3152', '206', 'Yun-lin', 'YL', '1');
INSERT INTO `zone` VALUES ('3153', '206', 'Chia-i city', 'CC', '1');
INSERT INTO `zone` VALUES ('3154', '206', 'Chi-lung', 'CL', '1');
INSERT INTO `zone` VALUES ('3155', '206', 'Hsin-chu', 'HC', '1');
INSERT INTO `zone` VALUES ('3156', '206', 'T\'ai-chung', 'TH', '1');
INSERT INTO `zone` VALUES ('3157', '206', 'T\'ai-nan', 'TN', '1');
INSERT INTO `zone` VALUES ('3158', '206', 'Kao-hsiung city', 'KC', '1');
INSERT INTO `zone` VALUES ('3159', '206', 'T\'ai-pei city', 'TC', '1');
INSERT INTO `zone` VALUES ('3160', '207', 'Gorno-Badakhstan', 'GB', '1');
INSERT INTO `zone` VALUES ('3161', '207', 'Khatlon', 'KT', '1');
INSERT INTO `zone` VALUES ('3162', '207', 'Sughd', 'SU', '1');
INSERT INTO `zone` VALUES ('3163', '208', 'Arusha', 'AR', '1');
INSERT INTO `zone` VALUES ('3164', '208', 'Dar es Salaam', 'DS', '1');
INSERT INTO `zone` VALUES ('3165', '208', 'Dodoma', 'DO', '1');
INSERT INTO `zone` VALUES ('3166', '208', 'Iringa', 'IR', '1');
INSERT INTO `zone` VALUES ('3167', '208', 'Kagera', 'KA', '1');
INSERT INTO `zone` VALUES ('3168', '208', 'Kigoma', 'KI', '1');
INSERT INTO `zone` VALUES ('3169', '208', 'Kilimanjaro', 'KJ', '1');
INSERT INTO `zone` VALUES ('3170', '208', 'Lindi', 'LN', '1');
INSERT INTO `zone` VALUES ('3171', '208', 'Manyara', 'MY', '1');
INSERT INTO `zone` VALUES ('3172', '208', 'Mara', 'MR', '1');
INSERT INTO `zone` VALUES ('3173', '208', 'Mbeya', 'MB', '1');
INSERT INTO `zone` VALUES ('3174', '208', 'Morogoro', 'MO', '1');
INSERT INTO `zone` VALUES ('3175', '208', 'Mtwara', 'MT', '1');
INSERT INTO `zone` VALUES ('3176', '208', 'Mwanza', 'MW', '1');
INSERT INTO `zone` VALUES ('3177', '208', 'Pemba North', 'PN', '1');
INSERT INTO `zone` VALUES ('3178', '208', 'Pemba South', 'PS', '1');
INSERT INTO `zone` VALUES ('3179', '208', 'Pwani', 'PW', '1');
INSERT INTO `zone` VALUES ('3180', '208', 'Rukwa', 'RK', '1');
INSERT INTO `zone` VALUES ('3181', '208', 'Ruvuma', 'RV', '1');
INSERT INTO `zone` VALUES ('3182', '208', 'Shinyanga', 'SH', '1');
INSERT INTO `zone` VALUES ('3183', '208', 'Singida', 'SI', '1');
INSERT INTO `zone` VALUES ('3184', '208', 'Tabora', 'TB', '1');
INSERT INTO `zone` VALUES ('3185', '208', 'Tanga', 'TN', '1');
INSERT INTO `zone` VALUES ('3186', '208', 'Zanzibar Central/South', 'ZC', '1');
INSERT INTO `zone` VALUES ('3187', '208', 'Zanzibar North', 'ZN', '1');
INSERT INTO `zone` VALUES ('3188', '208', 'Zanzibar Urban/West', 'ZU', '1');
INSERT INTO `zone` VALUES ('3189', '209', 'Amnat Charoen', 'Amnat Charoen', '1');
INSERT INTO `zone` VALUES ('3190', '209', 'Ang Thong', 'Ang Thong', '1');
INSERT INTO `zone` VALUES ('3191', '209', 'Ayutthaya', 'Ayutthaya', '1');
INSERT INTO `zone` VALUES ('3192', '209', 'Bangkok', 'Bangkok', '1');
INSERT INTO `zone` VALUES ('3193', '209', 'Buriram', 'Buriram', '1');
INSERT INTO `zone` VALUES ('3194', '209', 'Chachoengsao', 'Chachoengsao', '1');
INSERT INTO `zone` VALUES ('3195', '209', 'Chai Nat', 'Chai Nat', '1');
INSERT INTO `zone` VALUES ('3196', '209', 'Chaiyaphum', 'Chaiyaphum', '1');
INSERT INTO `zone` VALUES ('3197', '209', 'Chanthaburi', 'Chanthaburi', '1');
INSERT INTO `zone` VALUES ('3198', '209', 'Chiang Mai', 'Chiang Mai', '1');
INSERT INTO `zone` VALUES ('3199', '209', 'Chiang Rai', 'Chiang Rai', '1');
INSERT INTO `zone` VALUES ('3200', '209', 'Chon Buri', 'Chon Buri', '1');
INSERT INTO `zone` VALUES ('3201', '209', 'Chumphon', 'Chumphon', '1');
INSERT INTO `zone` VALUES ('3202', '209', 'Kalasin', 'Kalasin', '1');
INSERT INTO `zone` VALUES ('3203', '209', 'Kamphaeng Phet', 'Kamphaeng Phet', '1');
INSERT INTO `zone` VALUES ('3204', '209', 'Kanchanaburi', 'Kanchanaburi', '1');
INSERT INTO `zone` VALUES ('3205', '209', 'Khon Kaen', 'Khon Kaen', '1');
INSERT INTO `zone` VALUES ('3206', '209', 'Krabi', 'Krabi', '1');
INSERT INTO `zone` VALUES ('3207', '209', 'Lampang', 'Lampang', '1');
INSERT INTO `zone` VALUES ('3208', '209', 'Lamphun', 'Lamphun', '1');
INSERT INTO `zone` VALUES ('3209', '209', 'Loei', 'Loei', '1');
INSERT INTO `zone` VALUES ('3210', '209', 'Lop Buri', 'Lop Buri', '1');
INSERT INTO `zone` VALUES ('3211', '209', 'Mae Hong Son', 'Mae Hong Son', '1');
INSERT INTO `zone` VALUES ('3212', '209', 'Maha Sarakham', 'Maha Sarakham', '1');
INSERT INTO `zone` VALUES ('3213', '209', 'Mukdahan', 'Mukdahan', '1');
INSERT INTO `zone` VALUES ('3214', '209', 'Nakhon Nayok', 'Nakhon Nayok', '1');
INSERT INTO `zone` VALUES ('3215', '209', 'Nakhon Pathom', 'Nakhon Pathom', '1');
INSERT INTO `zone` VALUES ('3216', '209', 'Nakhon Phanom', 'Nakhon Phanom', '1');
INSERT INTO `zone` VALUES ('3217', '209', 'Nakhon Ratchasima', 'Nakhon Ratchasima', '1');
INSERT INTO `zone` VALUES ('3218', '209', 'Nakhon Sawan', 'Nakhon Sawan', '1');
INSERT INTO `zone` VALUES ('3219', '209', 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', '1');
INSERT INTO `zone` VALUES ('3220', '209', 'Nan', 'Nan', '1');
INSERT INTO `zone` VALUES ('3221', '209', 'Narathiwat', 'Narathiwat', '1');
INSERT INTO `zone` VALUES ('3222', '209', 'Nong Bua Lamphu', 'Nong Bua Lamphu', '1');
INSERT INTO `zone` VALUES ('3223', '209', 'Nong Khai', 'Nong Khai', '1');
INSERT INTO `zone` VALUES ('3224', '209', 'Nonthaburi', 'Nonthaburi', '1');
INSERT INTO `zone` VALUES ('3225', '209', 'Pathum Thani', 'Pathum Thani', '1');
INSERT INTO `zone` VALUES ('3226', '209', 'Pattani', 'Pattani', '1');
INSERT INTO `zone` VALUES ('3227', '209', 'Phangnga', 'Phangnga', '1');
INSERT INTO `zone` VALUES ('3228', '209', 'Phatthalung', 'Phatthalung', '1');
INSERT INTO `zone` VALUES ('3229', '209', 'Phayao', 'Phayao', '1');
INSERT INTO `zone` VALUES ('3230', '209', 'Phetchabun', 'Phetchabun', '1');
INSERT INTO `zone` VALUES ('3231', '209', 'Phetchaburi', 'Phetchaburi', '1');
INSERT INTO `zone` VALUES ('3232', '209', 'Phichit', 'Phichit', '1');
INSERT INTO `zone` VALUES ('3233', '209', 'Phitsanulok', 'Phitsanulok', '1');
INSERT INTO `zone` VALUES ('3234', '209', 'Phrae', 'Phrae', '1');
INSERT INTO `zone` VALUES ('3235', '209', 'Phuket', 'Phuket', '1');
INSERT INTO `zone` VALUES ('3236', '209', 'Prachin Buri', 'Prachin Buri', '1');
INSERT INTO `zone` VALUES ('3237', '209', 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', '1');
INSERT INTO `zone` VALUES ('3238', '209', 'Ranong', 'Ranong', '1');
INSERT INTO `zone` VALUES ('3239', '209', 'Ratchaburi', 'Ratchaburi', '1');
INSERT INTO `zone` VALUES ('3240', '209', 'Rayong', 'Rayong', '1');
INSERT INTO `zone` VALUES ('3241', '209', 'Roi Et', 'Roi Et', '1');
INSERT INTO `zone` VALUES ('3242', '209', 'Sa Kaeo', 'Sa Kaeo', '1');
INSERT INTO `zone` VALUES ('3243', '209', 'Sakon Nakhon', 'Sakon Nakhon', '1');
INSERT INTO `zone` VALUES ('3244', '209', 'Samut Prakan', 'Samut Prakan', '1');
INSERT INTO `zone` VALUES ('3245', '209', 'Samut Sakhon', 'Samut Sakhon', '1');
INSERT INTO `zone` VALUES ('3246', '209', 'Samut Songkhram', 'Samut Songkhram', '1');
INSERT INTO `zone` VALUES ('3247', '209', 'Sara Buri', 'Sara Buri', '1');
INSERT INTO `zone` VALUES ('3248', '209', 'Satun', 'Satun', '1');
INSERT INTO `zone` VALUES ('3249', '209', 'Sing Buri', 'Sing Buri', '1');
INSERT INTO `zone` VALUES ('3250', '209', 'Sisaket', 'Sisaket', '1');
INSERT INTO `zone` VALUES ('3251', '209', 'Songkhla', 'Songkhla', '1');
INSERT INTO `zone` VALUES ('3252', '209', 'Sukhothai', 'Sukhothai', '1');
INSERT INTO `zone` VALUES ('3253', '209', 'Suphan Buri', 'Suphan Buri', '1');
INSERT INTO `zone` VALUES ('3254', '209', 'Surat Thani', 'Surat Thani', '1');
INSERT INTO `zone` VALUES ('3255', '209', 'Surin', 'Surin', '1');
INSERT INTO `zone` VALUES ('3256', '209', 'Tak', 'Tak', '1');
INSERT INTO `zone` VALUES ('3257', '209', 'Trang', 'Trang', '1');
INSERT INTO `zone` VALUES ('3258', '209', 'Trat', 'Trat', '1');
INSERT INTO `zone` VALUES ('3259', '209', 'Ubon Ratchathani', 'Ubon Ratchathani', '1');
INSERT INTO `zone` VALUES ('3260', '209', 'Udon Thani', 'Udon Thani', '1');
INSERT INTO `zone` VALUES ('3261', '209', 'Uthai Thani', 'Uthai Thani', '1');
INSERT INTO `zone` VALUES ('3262', '209', 'Uttaradit', 'Uttaradit', '1');
INSERT INTO `zone` VALUES ('3263', '209', 'Yala', 'Yala', '1');
INSERT INTO `zone` VALUES ('3264', '209', 'Yasothon', 'Yasothon', '1');
INSERT INTO `zone` VALUES ('3265', '210', 'Kara', 'K', '1');
INSERT INTO `zone` VALUES ('3266', '210', 'Plateaux', 'P', '1');
INSERT INTO `zone` VALUES ('3267', '210', 'Savanes', 'S', '1');
INSERT INTO `zone` VALUES ('3268', '210', 'Centrale', 'C', '1');
INSERT INTO `zone` VALUES ('3269', '210', 'Maritime', 'M', '1');
INSERT INTO `zone` VALUES ('3270', '211', 'Atafu', 'A', '1');
INSERT INTO `zone` VALUES ('3271', '211', 'Fakaofo', 'F', '1');
INSERT INTO `zone` VALUES ('3272', '211', 'Nukunonu', 'N', '1');
INSERT INTO `zone` VALUES ('3273', '212', 'Ha\'apai', 'H', '1');
INSERT INTO `zone` VALUES ('3274', '212', 'Tongatapu', 'T', '1');
INSERT INTO `zone` VALUES ('3275', '212', 'Vava\'u', 'V', '1');
INSERT INTO `zone` VALUES ('3276', '213', 'Couva/Tabaquite/Talparo', 'CT', '1');
INSERT INTO `zone` VALUES ('3277', '213', 'Diego Martin', 'DM', '1');
INSERT INTO `zone` VALUES ('3278', '213', 'Mayaro/Rio Claro', 'MR', '1');
INSERT INTO `zone` VALUES ('3279', '213', 'Penal/Debe', 'PD', '1');
INSERT INTO `zone` VALUES ('3280', '213', 'Princes Town', 'PT', '1');
INSERT INTO `zone` VALUES ('3281', '213', 'Sangre Grande', 'SG', '1');
INSERT INTO `zone` VALUES ('3282', '213', 'San Juan/Laventille', 'SL', '1');
INSERT INTO `zone` VALUES ('3283', '213', 'Siparia', 'SI', '1');
INSERT INTO `zone` VALUES ('3284', '213', 'Tunapuna/Piarco', 'TP', '1');
INSERT INTO `zone` VALUES ('3285', '213', 'Port of Spain', 'PS', '1');
INSERT INTO `zone` VALUES ('3286', '213', 'San Fernando', 'SF', '1');
INSERT INTO `zone` VALUES ('3287', '213', 'Arima', 'AR', '1');
INSERT INTO `zone` VALUES ('3288', '213', 'Point Fortin', 'PF', '1');
INSERT INTO `zone` VALUES ('3289', '213', 'Chaguanas', 'CH', '1');
INSERT INTO `zone` VALUES ('3290', '213', 'Tobago', 'TO', '1');
INSERT INTO `zone` VALUES ('3291', '214', 'Ariana', 'AR', '1');
INSERT INTO `zone` VALUES ('3292', '214', 'Beja', 'BJ', '1');
INSERT INTO `zone` VALUES ('3293', '214', 'Ben Arous', 'BA', '1');
INSERT INTO `zone` VALUES ('3294', '214', 'Bizerte', 'BI', '1');
INSERT INTO `zone` VALUES ('3295', '214', 'Gabes', 'GB', '1');
INSERT INTO `zone` VALUES ('3296', '214', 'Gafsa', 'GF', '1');
INSERT INTO `zone` VALUES ('3297', '214', 'Jendouba', 'JE', '1');
INSERT INTO `zone` VALUES ('3298', '214', 'Kairouan', 'KR', '1');
INSERT INTO `zone` VALUES ('3299', '214', 'Kasserine', 'KS', '1');
INSERT INTO `zone` VALUES ('3300', '214', 'Kebili', 'KB', '1');
INSERT INTO `zone` VALUES ('3301', '214', 'Kef', 'KF', '1');
INSERT INTO `zone` VALUES ('3302', '214', 'Mahdia', 'MH', '1');
INSERT INTO `zone` VALUES ('3303', '214', 'Manouba', 'MN', '1');
INSERT INTO `zone` VALUES ('3304', '214', 'Medenine', 'ME', '1');
INSERT INTO `zone` VALUES ('3305', '214', 'Monastir', 'MO', '1');
INSERT INTO `zone` VALUES ('3306', '214', 'Nabeul', 'NA', '1');
INSERT INTO `zone` VALUES ('3307', '214', 'Sfax', 'SF', '1');
INSERT INTO `zone` VALUES ('3308', '214', 'Sidi', 'SD', '1');
INSERT INTO `zone` VALUES ('3309', '214', 'Siliana', 'SL', '1');
INSERT INTO `zone` VALUES ('3310', '214', 'Sousse', 'SO', '1');
INSERT INTO `zone` VALUES ('3311', '214', 'Tataouine', 'TA', '1');
INSERT INTO `zone` VALUES ('3312', '214', 'Tozeur', 'TO', '1');
INSERT INTO `zone` VALUES ('3313', '214', 'Tunis', 'TU', '1');
INSERT INTO `zone` VALUES ('3314', '214', 'Zaghouan', 'ZA', '1');
INSERT INTO `zone` VALUES ('3315', '215', 'Adana', 'ADA', '1');
INSERT INTO `zone` VALUES ('3316', '215', 'Adıyaman', 'ADI', '1');
INSERT INTO `zone` VALUES ('3317', '215', 'Afyonkarahisar', 'AFY', '1');
INSERT INTO `zone` VALUES ('3318', '215', 'Ağrı', 'AGR', '1');
INSERT INTO `zone` VALUES ('3319', '215', 'Aksaray', 'AKS', '1');
INSERT INTO `zone` VALUES ('3320', '215', 'Amasya', 'AMA', '1');
INSERT INTO `zone` VALUES ('3321', '215', 'Ankara', 'ANK', '1');
INSERT INTO `zone` VALUES ('3322', '215', 'Antalya', 'ANT', '1');
INSERT INTO `zone` VALUES ('3323', '215', 'Ardahan', 'ARD', '1');
INSERT INTO `zone` VALUES ('3324', '215', 'Artvin', 'ART', '1');
INSERT INTO `zone` VALUES ('3325', '215', 'Aydın', 'AYI', '1');
INSERT INTO `zone` VALUES ('3326', '215', 'Balıkesir', 'BAL', '1');
INSERT INTO `zone` VALUES ('3327', '215', 'Bartın', 'BAR', '1');
INSERT INTO `zone` VALUES ('3328', '215', 'Batman', 'BAT', '1');
INSERT INTO `zone` VALUES ('3329', '215', 'Bayburt', 'BAY', '1');
INSERT INTO `zone` VALUES ('3330', '215', 'Bilecik', 'BIL', '1');
INSERT INTO `zone` VALUES ('3331', '215', 'Bingöl', 'BIN', '1');
INSERT INTO `zone` VALUES ('3332', '215', 'Bitlis', 'BIT', '1');
INSERT INTO `zone` VALUES ('3333', '215', 'Bolu', 'BOL', '1');
INSERT INTO `zone` VALUES ('3334', '215', 'Burdur', 'BRD', '1');
INSERT INTO `zone` VALUES ('3335', '215', 'Bursa', 'BRS', '1');
INSERT INTO `zone` VALUES ('3336', '215', 'Çanakkale', 'CKL', '1');
INSERT INTO `zone` VALUES ('3337', '215', 'Çankırı', 'CKR', '1');
INSERT INTO `zone` VALUES ('3338', '215', 'Çorum', 'COR', '1');
INSERT INTO `zone` VALUES ('3339', '215', 'Denizli', 'DEN', '1');
INSERT INTO `zone` VALUES ('3340', '215', 'Diyarbakir', 'DIY', '1');
INSERT INTO `zone` VALUES ('3341', '215', 'Düzce', 'DUZ', '1');
INSERT INTO `zone` VALUES ('3342', '215', 'Edirne', 'EDI', '1');
INSERT INTO `zone` VALUES ('3343', '215', 'Elazığ', 'ELA', '1');
INSERT INTO `zone` VALUES ('3344', '215', 'Erzincan', 'EZC', '1');
INSERT INTO `zone` VALUES ('3345', '215', 'Erzurum', 'EZR', '1');
INSERT INTO `zone` VALUES ('3346', '215', 'Eskişehir', 'ESK', '1');
INSERT INTO `zone` VALUES ('3347', '215', 'Gaziantep', 'GAZ', '1');
INSERT INTO `zone` VALUES ('3348', '215', 'Giresun', 'GIR', '1');
INSERT INTO `zone` VALUES ('3349', '215', 'Gümüşhane', 'GMS', '1');
INSERT INTO `zone` VALUES ('3350', '215', 'Hakkari', 'HKR', '1');
INSERT INTO `zone` VALUES ('3351', '215', 'Hatay', 'HTY', '1');
INSERT INTO `zone` VALUES ('3352', '215', 'Iğdır', 'IGD', '1');
INSERT INTO `zone` VALUES ('3353', '215', 'Isparta', 'ISP', '1');
INSERT INTO `zone` VALUES ('3354', '215', 'İstanbul', 'IST', '1');
INSERT INTO `zone` VALUES ('3355', '215', 'İzmir', 'IZM', '1');
INSERT INTO `zone` VALUES ('3356', '215', 'Kahramanmaraş', 'KAH', '1');
INSERT INTO `zone` VALUES ('3357', '215', 'Karabük', 'KRB', '1');
INSERT INTO `zone` VALUES ('3358', '215', 'Karaman', 'KRM', '1');
INSERT INTO `zone` VALUES ('3359', '215', 'Kars', 'KRS', '1');
INSERT INTO `zone` VALUES ('3360', '215', 'Kastamonu', 'KAS', '1');
INSERT INTO `zone` VALUES ('3361', '215', 'Kayseri', 'KAY', '1');
INSERT INTO `zone` VALUES ('3362', '215', 'Kilis', 'KLS', '1');
INSERT INTO `zone` VALUES ('3363', '215', 'Kırıkkale', 'KRK', '1');
INSERT INTO `zone` VALUES ('3364', '215', 'Kırklareli', 'KLR', '1');
INSERT INTO `zone` VALUES ('3365', '215', 'Kırşehir', 'KRH', '1');
INSERT INTO `zone` VALUES ('3366', '215', 'Kocaeli', 'KOC', '1');
INSERT INTO `zone` VALUES ('3367', '215', 'Konya', 'KON', '1');
INSERT INTO `zone` VALUES ('3368', '215', 'Kütahya', 'KUT', '1');
INSERT INTO `zone` VALUES ('3369', '215', 'Malatya', 'MAL', '1');
INSERT INTO `zone` VALUES ('3370', '215', 'Manisa', 'MAN', '1');
INSERT INTO `zone` VALUES ('3371', '215', 'Mardin', 'MAR', '1');
INSERT INTO `zone` VALUES ('3372', '215', 'Mersin', 'MER', '1');
INSERT INTO `zone` VALUES ('3373', '215', 'Muğla', 'MUG', '1');
INSERT INTO `zone` VALUES ('3374', '215', 'Muş', 'MUS', '1');
INSERT INTO `zone` VALUES ('3375', '215', 'Nevşehir', 'NEV', '1');
INSERT INTO `zone` VALUES ('3376', '215', 'Niğde', 'NIG', '1');
INSERT INTO `zone` VALUES ('3377', '215', 'Ordu', 'ORD', '1');
INSERT INTO `zone` VALUES ('3378', '215', 'Osmaniye', 'OSM', '1');
INSERT INTO `zone` VALUES ('3379', '215', 'Rize', 'RIZ', '1');
INSERT INTO `zone` VALUES ('3380', '215', 'Sakarya', 'SAK', '1');
INSERT INTO `zone` VALUES ('3381', '215', 'Samsun', 'SAM', '1');
INSERT INTO `zone` VALUES ('3382', '215', 'Şanlıurfa', 'SAN', '1');
INSERT INTO `zone` VALUES ('3383', '215', 'Siirt', 'SII', '1');
INSERT INTO `zone` VALUES ('3384', '215', 'Sinop', 'SIN', '1');
INSERT INTO `zone` VALUES ('3385', '215', 'Şırnak', 'SIR', '1');
INSERT INTO `zone` VALUES ('3386', '215', 'Sivas', 'SIV', '1');
INSERT INTO `zone` VALUES ('3387', '215', 'Tekirdağ', 'TEL', '1');
INSERT INTO `zone` VALUES ('3388', '215', 'Tokat', 'TOK', '1');
INSERT INTO `zone` VALUES ('3389', '215', 'Trabzon', 'TRA', '1');
INSERT INTO `zone` VALUES ('3390', '215', 'Tunceli', 'TUN', '1');
INSERT INTO `zone` VALUES ('3391', '215', 'Uşak', 'USK', '1');
INSERT INTO `zone` VALUES ('3392', '215', 'Van', 'VAN', '1');
INSERT INTO `zone` VALUES ('3393', '215', 'Yalova', 'YAL', '1');
INSERT INTO `zone` VALUES ('3394', '215', 'Yozgat', 'YOZ', '1');
INSERT INTO `zone` VALUES ('3395', '215', 'Zonguldak', 'ZON', '1');
INSERT INTO `zone` VALUES ('3396', '216', 'Ahal Welayaty', 'A', '1');
INSERT INTO `zone` VALUES ('3397', '216', 'Balkan Welayaty', 'B', '1');
INSERT INTO `zone` VALUES ('3398', '216', 'Dashhowuz Welayaty', 'D', '1');
INSERT INTO `zone` VALUES ('3399', '216', 'Lebap Welayaty', 'L', '1');
INSERT INTO `zone` VALUES ('3400', '216', 'Mary Welayaty', 'M', '1');
INSERT INTO `zone` VALUES ('3401', '217', 'Ambergris Cays', 'AC', '1');
INSERT INTO `zone` VALUES ('3402', '217', 'Dellis Cay', 'DC', '1');
INSERT INTO `zone` VALUES ('3403', '217', 'French Cay', 'FC', '1');
INSERT INTO `zone` VALUES ('3404', '217', 'Little Water Cay', 'LW', '1');
INSERT INTO `zone` VALUES ('3405', '217', 'Parrot Cay', 'RC', '1');
INSERT INTO `zone` VALUES ('3406', '217', 'Pine Cay', 'PN', '1');
INSERT INTO `zone` VALUES ('3407', '217', 'Salt Cay', 'SL', '1');
INSERT INTO `zone` VALUES ('3408', '217', 'Grand Turk', 'GT', '1');
INSERT INTO `zone` VALUES ('3409', '217', 'South Caicos', 'SC', '1');
INSERT INTO `zone` VALUES ('3410', '217', 'East Caicos', 'EC', '1');
INSERT INTO `zone` VALUES ('3411', '217', 'Middle Caicos', 'MC', '1');
INSERT INTO `zone` VALUES ('3412', '217', 'North Caicos', 'NC', '1');
INSERT INTO `zone` VALUES ('3413', '217', 'Providenciales', 'PR', '1');
INSERT INTO `zone` VALUES ('3414', '217', 'West Caicos', 'WC', '1');
INSERT INTO `zone` VALUES ('3415', '218', 'Nanumanga', 'NMG', '1');
INSERT INTO `zone` VALUES ('3416', '218', 'Niulakita', 'NLK', '1');
INSERT INTO `zone` VALUES ('3417', '218', 'Niutao', 'NTO', '1');
INSERT INTO `zone` VALUES ('3418', '218', 'Funafuti', 'FUN', '1');
INSERT INTO `zone` VALUES ('3419', '218', 'Nanumea', 'NME', '1');
INSERT INTO `zone` VALUES ('3420', '218', 'Nui', 'NUI', '1');
INSERT INTO `zone` VALUES ('3421', '218', 'Nukufetau', 'NFT', '1');
INSERT INTO `zone` VALUES ('3422', '218', 'Nukulaelae', 'NLL', '1');
INSERT INTO `zone` VALUES ('3423', '218', 'Vaitupu', 'VAI', '1');
INSERT INTO `zone` VALUES ('3424', '219', 'Kalangala', 'KAL', '1');
INSERT INTO `zone` VALUES ('3425', '219', 'Kampala', 'KMP', '1');
INSERT INTO `zone` VALUES ('3426', '219', 'Kayunga', 'KAY', '1');
INSERT INTO `zone` VALUES ('3427', '219', 'Kiboga', 'KIB', '1');
INSERT INTO `zone` VALUES ('3428', '219', 'Luwero', 'LUW', '1');
INSERT INTO `zone` VALUES ('3429', '219', 'Masaka', 'MAS', '1');
INSERT INTO `zone` VALUES ('3430', '219', 'Mpigi', 'MPI', '1');
INSERT INTO `zone` VALUES ('3431', '219', 'Mubende', 'MUB', '1');
INSERT INTO `zone` VALUES ('3432', '219', 'Mukono', 'MUK', '1');
INSERT INTO `zone` VALUES ('3433', '219', 'Nakasongola', 'NKS', '1');
INSERT INTO `zone` VALUES ('3434', '219', 'Rakai', 'RAK', '1');
INSERT INTO `zone` VALUES ('3435', '219', 'Sembabule', 'SEM', '1');
INSERT INTO `zone` VALUES ('3436', '219', 'Wakiso', 'WAK', '1');
INSERT INTO `zone` VALUES ('3437', '219', 'Bugiri', 'BUG', '1');
INSERT INTO `zone` VALUES ('3438', '219', 'Busia', 'BUS', '1');
INSERT INTO `zone` VALUES ('3439', '219', 'Iganga', 'IGA', '1');
INSERT INTO `zone` VALUES ('3440', '219', 'Jinja', 'JIN', '1');
INSERT INTO `zone` VALUES ('3441', '219', 'Kaberamaido', 'KAB', '1');
INSERT INTO `zone` VALUES ('3442', '219', 'Kamuli', 'KML', '1');
INSERT INTO `zone` VALUES ('3443', '219', 'Kapchorwa', 'KPC', '1');
INSERT INTO `zone` VALUES ('3444', '219', 'Katakwi', 'KTK', '1');
INSERT INTO `zone` VALUES ('3445', '219', 'Kumi', 'KUM', '1');
INSERT INTO `zone` VALUES ('3446', '219', 'Mayuge', 'MAY', '1');
INSERT INTO `zone` VALUES ('3447', '219', 'Mbale', 'MBA', '1');
INSERT INTO `zone` VALUES ('3448', '219', 'Pallisa', 'PAL', '1');
INSERT INTO `zone` VALUES ('3449', '219', 'Sironko', 'SIR', '1');
INSERT INTO `zone` VALUES ('3450', '219', 'Soroti', 'SOR', '1');
INSERT INTO `zone` VALUES ('3451', '219', 'Tororo', 'TOR', '1');
INSERT INTO `zone` VALUES ('3452', '219', 'Adjumani', 'ADJ', '1');
INSERT INTO `zone` VALUES ('3453', '219', 'Apac', 'APC', '1');
INSERT INTO `zone` VALUES ('3454', '219', 'Arua', 'ARU', '1');
INSERT INTO `zone` VALUES ('3455', '219', 'Gulu', 'GUL', '1');
INSERT INTO `zone` VALUES ('3456', '219', 'Kitgum', 'KIT', '1');
INSERT INTO `zone` VALUES ('3457', '219', 'Kotido', 'KOT', '1');
INSERT INTO `zone` VALUES ('3458', '219', 'Lira', 'LIR', '1');
INSERT INTO `zone` VALUES ('3459', '219', 'Moroto', 'MRT', '1');
INSERT INTO `zone` VALUES ('3460', '219', 'Moyo', 'MOY', '1');
INSERT INTO `zone` VALUES ('3461', '219', 'Nakapiripirit', 'NAK', '1');
INSERT INTO `zone` VALUES ('3462', '219', 'Nebbi', 'NEB', '1');
INSERT INTO `zone` VALUES ('3463', '219', 'Pader', 'PAD', '1');
INSERT INTO `zone` VALUES ('3464', '219', 'Yumbe', 'YUM', '1');
INSERT INTO `zone` VALUES ('3465', '219', 'Bundibugyo', 'BUN', '1');
INSERT INTO `zone` VALUES ('3466', '219', 'Bushenyi', 'BSH', '1');
INSERT INTO `zone` VALUES ('3467', '219', 'Hoima', 'HOI', '1');
INSERT INTO `zone` VALUES ('3468', '219', 'Kabale', 'KBL', '1');
INSERT INTO `zone` VALUES ('3469', '219', 'Kabarole', 'KAR', '1');
INSERT INTO `zone` VALUES ('3470', '219', 'Kamwenge', 'KAM', '1');
INSERT INTO `zone` VALUES ('3471', '219', 'Kanungu', 'KAN', '1');
INSERT INTO `zone` VALUES ('3472', '219', 'Kasese', 'KAS', '1');
INSERT INTO `zone` VALUES ('3473', '219', 'Kibaale', 'KBA', '1');
INSERT INTO `zone` VALUES ('3474', '219', 'Kisoro', 'KIS', '1');
INSERT INTO `zone` VALUES ('3475', '219', 'Kyenjojo', 'KYE', '1');
INSERT INTO `zone` VALUES ('3476', '219', 'Masindi', 'MSN', '1');
INSERT INTO `zone` VALUES ('3477', '219', 'Mbarara', 'MBR', '1');
INSERT INTO `zone` VALUES ('3478', '219', 'Ntungamo', 'NTU', '1');
INSERT INTO `zone` VALUES ('3479', '219', 'Rukungiri', 'RUK', '1');
INSERT INTO `zone` VALUES ('3480', '220', 'Cherkasy', 'CK', '1');
INSERT INTO `zone` VALUES ('3481', '220', 'Chernihiv', 'CH', '1');
INSERT INTO `zone` VALUES ('3482', '220', 'Chernivtsi', 'CV', '1');
INSERT INTO `zone` VALUES ('3483', '220', 'Crimea', 'CR', '1');
INSERT INTO `zone` VALUES ('3484', '220', 'Dnipropetrovs\'k', 'DN', '1');
INSERT INTO `zone` VALUES ('3485', '220', 'Donets\'k', 'DO', '1');
INSERT INTO `zone` VALUES ('3486', '220', 'Ivano-Frankivs\'k', 'IV', '1');
INSERT INTO `zone` VALUES ('3487', '220', 'Kharkiv Kherson', 'KL', '1');
INSERT INTO `zone` VALUES ('3488', '220', 'Khmel\'nyts\'kyy', 'KM', '1');
INSERT INTO `zone` VALUES ('3489', '220', 'Kirovohrad', 'KR', '1');
INSERT INTO `zone` VALUES ('3490', '220', 'Kiev', 'KV', '1');
INSERT INTO `zone` VALUES ('3491', '220', 'Kyyiv', 'KY', '1');
INSERT INTO `zone` VALUES ('3492', '220', 'Luhans\'k', 'LU', '1');
INSERT INTO `zone` VALUES ('3493', '220', 'L\'viv', 'LV', '1');
INSERT INTO `zone` VALUES ('3494', '220', 'Mykolayiv', 'MY', '1');
INSERT INTO `zone` VALUES ('3495', '220', 'Odesa', 'OD', '1');
INSERT INTO `zone` VALUES ('3496', '220', 'Poltava', 'PO', '1');
INSERT INTO `zone` VALUES ('3497', '220', 'Rivne', 'RI', '1');
INSERT INTO `zone` VALUES ('3498', '220', 'Sevastopol', 'SE', '1');
INSERT INTO `zone` VALUES ('3499', '220', 'Sumy', 'SU', '1');
INSERT INTO `zone` VALUES ('3500', '220', 'Ternopil\'', 'TE', '1');
INSERT INTO `zone` VALUES ('3501', '220', 'Vinnytsya', 'VI', '1');
INSERT INTO `zone` VALUES ('3502', '220', 'Volyn\'', 'VO', '1');
INSERT INTO `zone` VALUES ('3503', '220', 'Zakarpattya', 'ZK', '1');
INSERT INTO `zone` VALUES ('3504', '220', 'Zaporizhzhya', 'ZA', '1');
INSERT INTO `zone` VALUES ('3505', '220', 'Zhytomyr', 'ZH', '1');
INSERT INTO `zone` VALUES ('3506', '221', 'Abu Zaby', 'AZ', '1');
INSERT INTO `zone` VALUES ('3507', '221', '\'Ajman', 'AJ', '1');
INSERT INTO `zone` VALUES ('3508', '221', 'Al Fujayrah', 'FU', '1');
INSERT INTO `zone` VALUES ('3509', '221', 'Ash Shariqah', 'SH', '1');
INSERT INTO `zone` VALUES ('3510', '221', 'Dubayy', 'DU', '1');
INSERT INTO `zone` VALUES ('3511', '221', 'R\'as al Khaymah', 'RK', '1');
INSERT INTO `zone` VALUES ('3512', '221', 'Umm al Qaywayn', 'UQ', '1');
INSERT INTO `zone` VALUES ('3513', '222', 'Aberdeen', 'ABN', '1');
INSERT INTO `zone` VALUES ('3514', '222', 'Aberdeenshire', 'ABNS', '1');
INSERT INTO `zone` VALUES ('3515', '222', 'Anglesey', 'ANG', '1');
INSERT INTO `zone` VALUES ('3516', '222', 'Angus', 'AGS', '1');
INSERT INTO `zone` VALUES ('3517', '222', 'Argyll and Bute', 'ARY', '1');
INSERT INTO `zone` VALUES ('3518', '222', 'Bedfordshire', 'BEDS', '1');
INSERT INTO `zone` VALUES ('3519', '222', 'Berkshire', 'BERKS', '1');
INSERT INTO `zone` VALUES ('3520', '222', 'Blaenau Gwent', 'BLA', '1');
INSERT INTO `zone` VALUES ('3521', '222', 'Bridgend', 'BRI', '1');
INSERT INTO `zone` VALUES ('3522', '222', 'Bristol', 'BSTL', '1');
INSERT INTO `zone` VALUES ('3523', '222', 'Buckinghamshire', 'BUCKS', '1');
INSERT INTO `zone` VALUES ('3524', '222', 'Caerphilly', 'CAE', '1');
INSERT INTO `zone` VALUES ('3525', '222', 'Cambridgeshire', 'CAMBS', '1');
INSERT INTO `zone` VALUES ('3526', '222', 'Cardiff', 'CDF', '1');
INSERT INTO `zone` VALUES ('3527', '222', 'Carmarthenshire', 'CARM', '1');
INSERT INTO `zone` VALUES ('3528', '222', 'Ceredigion', 'CDGN', '1');
INSERT INTO `zone` VALUES ('3529', '222', 'Cheshire', 'CHES', '1');
INSERT INTO `zone` VALUES ('3530', '222', 'Clackmannanshire', 'CLACK', '1');
INSERT INTO `zone` VALUES ('3531', '222', 'Conwy', 'CON', '1');
INSERT INTO `zone` VALUES ('3532', '222', 'Cornwall', 'CORN', '1');
INSERT INTO `zone` VALUES ('3533', '222', 'Denbighshire', 'DNBG', '1');
INSERT INTO `zone` VALUES ('3534', '222', 'Derbyshire', 'DERBY', '1');
INSERT INTO `zone` VALUES ('3535', '222', 'Devon', 'DVN', '1');
INSERT INTO `zone` VALUES ('3536', '222', 'Dorset', 'DOR', '1');
INSERT INTO `zone` VALUES ('3537', '222', 'Dumfries and Galloway', 'DGL', '1');
INSERT INTO `zone` VALUES ('3538', '222', 'Dundee', 'DUND', '1');
INSERT INTO `zone` VALUES ('3539', '222', 'Durham', 'DHM', '1');
INSERT INTO `zone` VALUES ('3540', '222', 'East Ayrshire', 'ARYE', '1');
INSERT INTO `zone` VALUES ('3541', '222', 'East Dunbartonshire', 'DUNBE', '1');
INSERT INTO `zone` VALUES ('3542', '222', 'East Lothian', 'LOTE', '1');
INSERT INTO `zone` VALUES ('3543', '222', 'East Renfrewshire', 'RENE', '1');
INSERT INTO `zone` VALUES ('3544', '222', 'East Riding of Yorkshire', 'ERYS', '1');
INSERT INTO `zone` VALUES ('3545', '222', 'East Sussex', 'SXE', '1');
INSERT INTO `zone` VALUES ('3546', '222', 'Edinburgh', 'EDIN', '1');
INSERT INTO `zone` VALUES ('3547', '222', 'Essex', 'ESX', '1');
INSERT INTO `zone` VALUES ('3548', '222', 'Falkirk', 'FALK', '1');
INSERT INTO `zone` VALUES ('3549', '222', 'Fife', 'FFE', '1');
INSERT INTO `zone` VALUES ('3550', '222', 'Flintshire', 'FLINT', '1');
INSERT INTO `zone` VALUES ('3551', '222', 'Glasgow', 'GLAS', '1');
INSERT INTO `zone` VALUES ('3552', '222', 'Gloucestershire', 'GLOS', '1');
INSERT INTO `zone` VALUES ('3553', '222', 'Greater London', 'LDN', '1');
INSERT INTO `zone` VALUES ('3554', '222', 'Greater Manchester', 'MCH', '1');
INSERT INTO `zone` VALUES ('3555', '222', 'Gwynedd', 'GDD', '1');
INSERT INTO `zone` VALUES ('3556', '222', 'Hampshire', 'HANTS', '1');
INSERT INTO `zone` VALUES ('3557', '222', 'Herefordshire', 'HWR', '1');
INSERT INTO `zone` VALUES ('3558', '222', 'Hertfordshire', 'HERTS', '1');
INSERT INTO `zone` VALUES ('3559', '222', 'Highlands', 'HLD', '1');
INSERT INTO `zone` VALUES ('3560', '222', 'Inverclyde', 'IVER', '1');
INSERT INTO `zone` VALUES ('3561', '222', 'Isle of Wight', 'IOW', '1');
INSERT INTO `zone` VALUES ('3562', '222', 'Kent', 'KNT', '1');
INSERT INTO `zone` VALUES ('3563', '222', 'Lancashire', 'LANCS', '1');
INSERT INTO `zone` VALUES ('3564', '222', 'Leicestershire', 'LEICS', '1');
INSERT INTO `zone` VALUES ('3565', '222', 'Lincolnshire', 'LINCS', '1');
INSERT INTO `zone` VALUES ('3566', '222', 'Merseyside', 'MSY', '1');
INSERT INTO `zone` VALUES ('3567', '222', 'Merthyr Tydfil', 'MERT', '1');
INSERT INTO `zone` VALUES ('3568', '222', 'Midlothian', 'MLOT', '1');
INSERT INTO `zone` VALUES ('3569', '222', 'Monmouthshire', 'MMOUTH', '1');
INSERT INTO `zone` VALUES ('3570', '222', 'Moray', 'MORAY', '1');
INSERT INTO `zone` VALUES ('3571', '222', 'Neath Port Talbot', 'NPRTAL', '1');
INSERT INTO `zone` VALUES ('3572', '222', 'Newport', 'NEWPT', '1');
INSERT INTO `zone` VALUES ('3573', '222', 'Norfolk', 'NOR', '1');
INSERT INTO `zone` VALUES ('3574', '222', 'North Ayrshire', 'ARYN', '1');
INSERT INTO `zone` VALUES ('3575', '222', 'North Lanarkshire', 'LANN', '1');
INSERT INTO `zone` VALUES ('3576', '222', 'North Yorkshire', 'YSN', '1');
INSERT INTO `zone` VALUES ('3577', '222', 'Northamptonshire', 'NHM', '1');
INSERT INTO `zone` VALUES ('3578', '222', 'Northumberland', 'NLD', '1');
INSERT INTO `zone` VALUES ('3579', '222', 'Nottinghamshire', 'NOT', '1');
INSERT INTO `zone` VALUES ('3580', '222', 'Orkney Islands', 'ORK', '1');
INSERT INTO `zone` VALUES ('3581', '222', 'Oxfordshire', 'OFE', '1');
INSERT INTO `zone` VALUES ('3582', '222', 'Pembrokeshire', 'PEM', '1');
INSERT INTO `zone` VALUES ('3583', '222', 'Perth and Kinross', 'PERTH', '1');
INSERT INTO `zone` VALUES ('3584', '222', 'Powys', 'PWS', '1');
INSERT INTO `zone` VALUES ('3585', '222', 'Renfrewshire', 'REN', '1');
INSERT INTO `zone` VALUES ('3586', '222', 'Rhondda Cynon Taff', 'RHON', '1');
INSERT INTO `zone` VALUES ('3587', '222', 'Rutland', 'RUT', '1');
INSERT INTO `zone` VALUES ('3588', '222', 'Scottish Borders', 'BOR', '1');
INSERT INTO `zone` VALUES ('3589', '222', 'Shetland Islands', 'SHET', '1');
INSERT INTO `zone` VALUES ('3590', '222', 'Shropshire', 'SPE', '1');
INSERT INTO `zone` VALUES ('3591', '222', 'Somerset', 'SOM', '1');
INSERT INTO `zone` VALUES ('3592', '222', 'South Ayrshire', 'ARYS', '1');
INSERT INTO `zone` VALUES ('3593', '222', 'South Lanarkshire', 'LANS', '1');
INSERT INTO `zone` VALUES ('3594', '222', 'South Yorkshire', 'YSS', '1');
INSERT INTO `zone` VALUES ('3595', '222', 'Staffordshire', 'SFD', '1');
INSERT INTO `zone` VALUES ('3596', '222', 'Stirling', 'STIR', '1');
INSERT INTO `zone` VALUES ('3597', '222', 'Suffolk', 'SFK', '1');
INSERT INTO `zone` VALUES ('3598', '222', 'Surrey', 'SRY', '1');
INSERT INTO `zone` VALUES ('3599', '222', 'Swansea', 'SWAN', '1');
INSERT INTO `zone` VALUES ('3600', '222', 'Torfaen', 'TORF', '1');
INSERT INTO `zone` VALUES ('3601', '222', 'Tyne and Wear', 'TWR', '1');
INSERT INTO `zone` VALUES ('3602', '222', 'Vale of Glamorgan', 'VGLAM', '1');
INSERT INTO `zone` VALUES ('3603', '222', 'Warwickshire', 'WARKS', '1');
INSERT INTO `zone` VALUES ('3604', '222', 'West Dunbartonshire', 'WDUN', '1');
INSERT INTO `zone` VALUES ('3605', '222', 'West Lothian', 'WLOT', '1');
INSERT INTO `zone` VALUES ('3606', '222', 'West Midlands', 'WMD', '1');
INSERT INTO `zone` VALUES ('3607', '222', 'West Sussex', 'SXW', '1');
INSERT INTO `zone` VALUES ('3608', '222', 'West Yorkshire', 'YSW', '1');
INSERT INTO `zone` VALUES ('3609', '222', 'Western Isles', 'WIL', '1');
INSERT INTO `zone` VALUES ('3610', '222', 'Wiltshire', 'WLT', '1');
INSERT INTO `zone` VALUES ('3611', '222', 'Worcestershire', 'WORCS', '1');
INSERT INTO `zone` VALUES ('3612', '222', 'Wrexham', 'WRX', '1');
INSERT INTO `zone` VALUES ('3613', '223', 'Alabama', 'AL', '1');
INSERT INTO `zone` VALUES ('3614', '223', 'Alaska', 'AK', '1');
INSERT INTO `zone` VALUES ('3615', '223', 'American Samoa', 'AS', '1');
INSERT INTO `zone` VALUES ('3616', '223', 'Arizona', 'AZ', '1');
INSERT INTO `zone` VALUES ('3617', '223', 'Arkansas', 'AR', '1');
INSERT INTO `zone` VALUES ('3618', '223', 'Armed Forces Africa', 'AF', '1');
INSERT INTO `zone` VALUES ('3619', '223', 'Armed Forces Americas', 'AA', '1');
INSERT INTO `zone` VALUES ('3620', '223', 'Armed Forces Canada', 'AC', '1');
INSERT INTO `zone` VALUES ('3621', '223', 'Armed Forces Europe', 'AE', '1');
INSERT INTO `zone` VALUES ('3622', '223', 'Armed Forces Middle East', 'AM', '1');
INSERT INTO `zone` VALUES ('3623', '223', 'Armed Forces Pacific', 'AP', '1');
INSERT INTO `zone` VALUES ('3624', '223', 'California', 'CA', '1');
INSERT INTO `zone` VALUES ('3625', '223', 'Colorado', 'CO', '1');
INSERT INTO `zone` VALUES ('3626', '223', 'Connecticut', 'CT', '1');
INSERT INTO `zone` VALUES ('3627', '223', 'Delaware', 'DE', '1');
INSERT INTO `zone` VALUES ('3628', '223', 'District of Columbia', 'DC', '1');
INSERT INTO `zone` VALUES ('3629', '223', 'Federated States Of Micronesia', 'FM', '1');
INSERT INTO `zone` VALUES ('3630', '223', 'Florida', 'FL', '1');
INSERT INTO `zone` VALUES ('3631', '223', 'Georgia', 'GA', '1');
INSERT INTO `zone` VALUES ('3632', '223', 'Guam', 'GU', '1');
INSERT INTO `zone` VALUES ('3633', '223', 'Hawaii', 'HI', '1');
INSERT INTO `zone` VALUES ('3634', '223', 'Idaho', 'ID', '1');
INSERT INTO `zone` VALUES ('3635', '223', 'Illinois', 'IL', '1');
INSERT INTO `zone` VALUES ('3636', '223', 'Indiana', 'IN', '1');
INSERT INTO `zone` VALUES ('3637', '223', 'Iowa', 'IA', '1');
INSERT INTO `zone` VALUES ('3638', '223', 'Kansas', 'KS', '1');
INSERT INTO `zone` VALUES ('3639', '223', 'Kentucky', 'KY', '1');
INSERT INTO `zone` VALUES ('3640', '223', 'Louisiana', 'LA', '1');
INSERT INTO `zone` VALUES ('3641', '223', 'Maine', 'ME', '1');
INSERT INTO `zone` VALUES ('3642', '223', 'Marshall Islands', 'MH', '1');
INSERT INTO `zone` VALUES ('3643', '223', 'Maryland', 'MD', '1');
INSERT INTO `zone` VALUES ('3644', '223', 'Massachusetts', 'MA', '1');
INSERT INTO `zone` VALUES ('3645', '223', 'Michigan', 'MI', '1');
INSERT INTO `zone` VALUES ('3646', '223', 'Minnesota', 'MN', '1');
INSERT INTO `zone` VALUES ('3647', '223', 'Mississippi', 'MS', '1');
INSERT INTO `zone` VALUES ('3648', '223', 'Missouri', 'MO', '1');
INSERT INTO `zone` VALUES ('3649', '223', 'Montana', 'MT', '1');
INSERT INTO `zone` VALUES ('3650', '223', 'Nebraska', 'NE', '1');
INSERT INTO `zone` VALUES ('3651', '223', 'Nevada', 'NV', '1');
INSERT INTO `zone` VALUES ('3652', '223', 'New Hampshire', 'NH', '1');
INSERT INTO `zone` VALUES ('3653', '223', 'New Jersey', 'NJ', '1');
INSERT INTO `zone` VALUES ('3654', '223', 'New Mexico', 'NM', '1');
INSERT INTO `zone` VALUES ('3655', '223', 'New York', 'NY', '1');
INSERT INTO `zone` VALUES ('3656', '223', 'North Carolina', 'NC', '1');
INSERT INTO `zone` VALUES ('3657', '223', 'North Dakota', 'ND', '1');
INSERT INTO `zone` VALUES ('3658', '223', 'Northern Mariana Islands', 'MP', '1');
INSERT INTO `zone` VALUES ('3659', '223', 'Ohio', 'OH', '1');
INSERT INTO `zone` VALUES ('3660', '223', 'Oklahoma', 'OK', '1');
INSERT INTO `zone` VALUES ('3661', '223', 'Oregon', 'OR', '1');
INSERT INTO `zone` VALUES ('3662', '223', 'Palau', 'PW', '1');
INSERT INTO `zone` VALUES ('3663', '223', 'Pennsylvania', 'PA', '1');
INSERT INTO `zone` VALUES ('3664', '223', 'Puerto Rico', 'PR', '1');
INSERT INTO `zone` VALUES ('3665', '223', 'Rhode Island', 'RI', '1');
INSERT INTO `zone` VALUES ('3666', '223', 'South Carolina', 'SC', '1');
INSERT INTO `zone` VALUES ('3667', '223', 'South Dakota', 'SD', '1');
INSERT INTO `zone` VALUES ('3668', '223', 'Tennessee', 'TN', '1');
INSERT INTO `zone` VALUES ('3669', '223', 'Texas', 'TX', '1');
INSERT INTO `zone` VALUES ('3670', '223', 'Utah', 'UT', '1');
INSERT INTO `zone` VALUES ('3671', '223', 'Vermont', 'VT', '1');
INSERT INTO `zone` VALUES ('3672', '223', 'Virgin Islands', 'VI', '1');
INSERT INTO `zone` VALUES ('3673', '223', 'Virginia', 'VA', '1');
INSERT INTO `zone` VALUES ('3674', '223', 'Washington', 'WA', '1');
INSERT INTO `zone` VALUES ('3675', '223', 'West Virginia', 'WV', '1');
INSERT INTO `zone` VALUES ('3676', '223', 'Wisconsin', 'WI', '1');
INSERT INTO `zone` VALUES ('3677', '223', 'Wyoming', 'WY', '1');
INSERT INTO `zone` VALUES ('3678', '224', 'Baker Island', 'BI', '1');
INSERT INTO `zone` VALUES ('3679', '224', 'Howland Island', 'HI', '1');
INSERT INTO `zone` VALUES ('3680', '224', 'Jarvis Island', 'JI', '1');
INSERT INTO `zone` VALUES ('3681', '224', 'Johnston Atoll', 'JA', '1');
INSERT INTO `zone` VALUES ('3682', '224', 'Kingman Reef', 'KR', '1');
INSERT INTO `zone` VALUES ('3683', '224', 'Midway Atoll', 'MA', '1');
INSERT INTO `zone` VALUES ('3684', '224', 'Navassa Island', 'NI', '1');
INSERT INTO `zone` VALUES ('3685', '224', 'Palmyra Atoll', 'PA', '1');
INSERT INTO `zone` VALUES ('3686', '224', 'Wake Island', 'WI', '1');
INSERT INTO `zone` VALUES ('3687', '225', 'Artigas', 'AR', '1');
INSERT INTO `zone` VALUES ('3688', '225', 'Canelones', 'CA', '1');
INSERT INTO `zone` VALUES ('3689', '225', 'Cerro Largo', 'CL', '1');
INSERT INTO `zone` VALUES ('3690', '225', 'Colonia', 'CO', '1');
INSERT INTO `zone` VALUES ('3691', '225', 'Durazno', 'DU', '1');
INSERT INTO `zone` VALUES ('3692', '225', 'Flores', 'FS', '1');
INSERT INTO `zone` VALUES ('3693', '225', 'Florida', 'FA', '1');
INSERT INTO `zone` VALUES ('3694', '225', 'Lavalleja', 'LA', '1');
INSERT INTO `zone` VALUES ('3695', '225', 'Maldonado', 'MA', '1');
INSERT INTO `zone` VALUES ('3696', '225', 'Montevideo', 'MO', '1');
INSERT INTO `zone` VALUES ('3697', '225', 'Paysandu', 'PA', '1');
INSERT INTO `zone` VALUES ('3698', '225', 'Rio Negro', 'RN', '1');
INSERT INTO `zone` VALUES ('3699', '225', 'Rivera', 'RV', '1');
INSERT INTO `zone` VALUES ('3700', '225', 'Rocha', 'RO', '1');
INSERT INTO `zone` VALUES ('3701', '225', 'Salto', 'SL', '1');
INSERT INTO `zone` VALUES ('3702', '225', 'San Jose', 'SJ', '1');
INSERT INTO `zone` VALUES ('3703', '225', 'Soriano', 'SO', '1');
INSERT INTO `zone` VALUES ('3704', '225', 'Tacuarembo', 'TA', '1');
INSERT INTO `zone` VALUES ('3705', '225', 'Treinta y Tres', 'TT', '1');
INSERT INTO `zone` VALUES ('3706', '226', 'Andijon', 'AN', '1');
INSERT INTO `zone` VALUES ('3707', '226', 'Buxoro', 'BU', '1');
INSERT INTO `zone` VALUES ('3708', '226', 'Farg\'ona', 'FA', '1');
INSERT INTO `zone` VALUES ('3709', '226', 'Jizzax', 'JI', '1');
INSERT INTO `zone` VALUES ('3710', '226', 'Namangan', 'NG', '1');
INSERT INTO `zone` VALUES ('3711', '226', 'Navoiy', 'NW', '1');
INSERT INTO `zone` VALUES ('3712', '226', 'Qashqadaryo', 'QA', '1');
INSERT INTO `zone` VALUES ('3713', '226', 'Qoraqalpog\'iston Republikasi', 'QR', '1');
INSERT INTO `zone` VALUES ('3714', '226', 'Samarqand', 'SA', '1');
INSERT INTO `zone` VALUES ('3715', '226', 'Sirdaryo', 'SI', '1');
INSERT INTO `zone` VALUES ('3716', '226', 'Surxondaryo', 'SU', '1');
INSERT INTO `zone` VALUES ('3717', '226', 'Toshkent City', 'TK', '1');
INSERT INTO `zone` VALUES ('3718', '226', 'Toshkent Region', 'TO', '1');
INSERT INTO `zone` VALUES ('3719', '226', 'Xorazm', 'XO', '1');
INSERT INTO `zone` VALUES ('3720', '227', 'Malampa', 'MA', '1');
INSERT INTO `zone` VALUES ('3721', '227', 'Penama', 'PE', '1');
INSERT INTO `zone` VALUES ('3722', '227', 'Sanma', 'SA', '1');
INSERT INTO `zone` VALUES ('3723', '227', 'Shefa', 'SH', '1');
INSERT INTO `zone` VALUES ('3724', '227', 'Tafea', 'TA', '1');
INSERT INTO `zone` VALUES ('3725', '227', 'Torba', 'TO', '1');
INSERT INTO `zone` VALUES ('3726', '229', 'Amazonas', 'AM', '1');
INSERT INTO `zone` VALUES ('3727', '229', 'Anzoategui', 'AN', '1');
INSERT INTO `zone` VALUES ('3728', '229', 'Apure', 'AP', '1');
INSERT INTO `zone` VALUES ('3729', '229', 'Aragua', 'AR', '1');
INSERT INTO `zone` VALUES ('3730', '229', 'Barinas', 'BA', '1');
INSERT INTO `zone` VALUES ('3731', '229', 'Bolivar', 'BO', '1');
INSERT INTO `zone` VALUES ('3732', '229', 'Carabobo', 'CA', '1');
INSERT INTO `zone` VALUES ('3733', '229', 'Cojedes', 'CO', '1');
INSERT INTO `zone` VALUES ('3734', '229', 'Delta Amacuro', 'DA', '1');
INSERT INTO `zone` VALUES ('3735', '229', 'Dependencias Federales', 'DF', '1');
INSERT INTO `zone` VALUES ('3736', '229', 'Distrito Federal', 'DI', '1');
INSERT INTO `zone` VALUES ('3737', '229', 'Falcon', 'FA', '1');
INSERT INTO `zone` VALUES ('3738', '229', 'Guarico', 'GU', '1');
INSERT INTO `zone` VALUES ('3739', '229', 'Lara', 'LA', '1');
INSERT INTO `zone` VALUES ('3740', '229', 'Merida', 'ME', '1');
INSERT INTO `zone` VALUES ('3741', '229', 'Miranda', 'MI', '1');
INSERT INTO `zone` VALUES ('3742', '229', 'Monagas', 'MO', '1');
INSERT INTO `zone` VALUES ('3743', '229', 'Nueva Esparta', 'NE', '1');
INSERT INTO `zone` VALUES ('3744', '229', 'Portuguesa', 'PO', '1');
INSERT INTO `zone` VALUES ('3745', '229', 'Sucre', 'SU', '1');
INSERT INTO `zone` VALUES ('3746', '229', 'Tachira', 'TA', '1');
INSERT INTO `zone` VALUES ('3747', '229', 'Trujillo', 'TR', '1');
INSERT INTO `zone` VALUES ('3748', '229', 'Vargas', 'VA', '1');
INSERT INTO `zone` VALUES ('3749', '229', 'Yaracuy', 'YA', '1');
INSERT INTO `zone` VALUES ('3750', '229', 'Zulia', 'ZU', '1');
INSERT INTO `zone` VALUES ('3751', '230', 'An Giang', 'AG', '1');
INSERT INTO `zone` VALUES ('3752', '230', 'Bac Giang', 'BG', '1');
INSERT INTO `zone` VALUES ('3753', '230', 'Bac Kan', 'BK', '1');
INSERT INTO `zone` VALUES ('3754', '230', 'Bac Lieu', 'BL', '1');
INSERT INTO `zone` VALUES ('3755', '230', 'Bac Ninh', 'BC', '1');
INSERT INTO `zone` VALUES ('3756', '230', 'Ba Ria-Vung Tau', 'BR', '1');
INSERT INTO `zone` VALUES ('3757', '230', 'Ben Tre', 'BN', '1');
INSERT INTO `zone` VALUES ('3758', '230', 'Binh Dinh', 'BH', '1');
INSERT INTO `zone` VALUES ('3759', '230', 'Binh Duong', 'BU', '1');
INSERT INTO `zone` VALUES ('3760', '230', 'Binh Phuoc', 'BP', '1');
INSERT INTO `zone` VALUES ('3761', '230', 'Binh Thuan', 'BT', '1');
INSERT INTO `zone` VALUES ('3762', '230', 'Ca Mau', 'CM', '1');
INSERT INTO `zone` VALUES ('3763', '230', 'Can Tho', 'CT', '1');
INSERT INTO `zone` VALUES ('3764', '230', 'Cao Bang', 'CB', '1');
INSERT INTO `zone` VALUES ('3765', '230', 'Dak Lak', 'DL', '1');
INSERT INTO `zone` VALUES ('3766', '230', 'Dak Nong', 'DG', '1');
INSERT INTO `zone` VALUES ('3767', '230', 'Da Nang', 'DN', '1');
INSERT INTO `zone` VALUES ('3768', '230', 'Dien Bien', 'DB', '1');
INSERT INTO `zone` VALUES ('3769', '230', 'Dong Nai', 'DI', '1');
INSERT INTO `zone` VALUES ('3770', '230', 'Dong Thap', 'DT', '1');
INSERT INTO `zone` VALUES ('3771', '230', 'Gia Lai', 'GL', '1');
INSERT INTO `zone` VALUES ('3772', '230', 'Ha Giang', 'HG', '1');
INSERT INTO `zone` VALUES ('3773', '230', 'Hai Duong', 'HD', '1');
INSERT INTO `zone` VALUES ('3774', '230', 'Hai Phong', 'HP', '1');
INSERT INTO `zone` VALUES ('3775', '230', 'Ha Nam', 'HM', '1');
INSERT INTO `zone` VALUES ('3776', '230', 'Ha Noi', 'HI', '1');
INSERT INTO `zone` VALUES ('3777', '230', 'Ha Tay', 'HT', '1');
INSERT INTO `zone` VALUES ('3778', '230', 'Ha Tinh', 'HH', '1');
INSERT INTO `zone` VALUES ('3779', '230', 'Hoa Binh', 'HB', '1');
INSERT INTO `zone` VALUES ('3780', '230', 'Ho Chi Minh City', 'HC', '1');
INSERT INTO `zone` VALUES ('3781', '230', 'Hau Giang', 'HU', '1');
INSERT INTO `zone` VALUES ('3782', '230', 'Hung Yen', 'HY', '1');
INSERT INTO `zone` VALUES ('3783', '232', 'Saint Croix', 'C', '1');
INSERT INTO `zone` VALUES ('3784', '232', 'Saint John', 'J', '1');
INSERT INTO `zone` VALUES ('3785', '232', 'Saint Thomas', 'T', '1');
INSERT INTO `zone` VALUES ('3786', '233', 'Alo', 'A', '1');
INSERT INTO `zone` VALUES ('3787', '233', 'Sigave', 'S', '1');
INSERT INTO `zone` VALUES ('3788', '233', 'Wallis', 'W', '1');
INSERT INTO `zone` VALUES ('3789', '235', 'Abyan', 'AB', '1');
INSERT INTO `zone` VALUES ('3790', '235', 'Adan', 'AD', '1');
INSERT INTO `zone` VALUES ('3791', '235', 'Amran', 'AM', '1');
INSERT INTO `zone` VALUES ('3792', '235', 'Al Bayda', 'BA', '1');
INSERT INTO `zone` VALUES ('3793', '235', 'Ad Dali', 'DA', '1');
INSERT INTO `zone` VALUES ('3794', '235', 'Dhamar', 'DH', '1');
INSERT INTO `zone` VALUES ('3795', '235', 'Hadramawt', 'HD', '1');
INSERT INTO `zone` VALUES ('3796', '235', 'Hajjah', 'HJ', '1');
INSERT INTO `zone` VALUES ('3797', '235', 'Al Hudaydah', 'HU', '1');
INSERT INTO `zone` VALUES ('3798', '235', 'Ibb', 'IB', '1');
INSERT INTO `zone` VALUES ('3799', '235', 'Al Jawf', 'JA', '1');
INSERT INTO `zone` VALUES ('3800', '235', 'Lahij', 'LA', '1');
INSERT INTO `zone` VALUES ('3801', '235', 'Ma\'rib', 'MA', '1');
INSERT INTO `zone` VALUES ('3802', '235', 'Al Mahrah', 'MR', '1');
INSERT INTO `zone` VALUES ('3803', '235', 'Al Mahwit', 'MW', '1');
INSERT INTO `zone` VALUES ('3804', '235', 'Sa\'dah', 'SD', '1');
INSERT INTO `zone` VALUES ('3805', '235', 'San\'a', 'SN', '1');
INSERT INTO `zone` VALUES ('3806', '235', 'Shabwah', 'SH', '1');
INSERT INTO `zone` VALUES ('3807', '235', 'Ta\'izz', 'TA', '1');
INSERT INTO `zone` VALUES ('3812', '237', 'Bas-Congo', 'BC', '1');
INSERT INTO `zone` VALUES ('3813', '237', 'Bandundu', 'BN', '1');
INSERT INTO `zone` VALUES ('3814', '237', 'Equateur', 'EQ', '1');
INSERT INTO `zone` VALUES ('3815', '237', 'Katanga', 'KA', '1');
INSERT INTO `zone` VALUES ('3816', '237', 'Kasai-Oriental', 'KE', '1');
INSERT INTO `zone` VALUES ('3817', '237', 'Kinshasa', 'KN', '1');
INSERT INTO `zone` VALUES ('3818', '237', 'Kasai-Occidental', 'KW', '1');
INSERT INTO `zone` VALUES ('3819', '237', 'Maniema', 'MA', '1');
INSERT INTO `zone` VALUES ('3820', '237', 'Nord-Kivu', 'NK', '1');
INSERT INTO `zone` VALUES ('3821', '237', 'Orientale', 'OR', '1');
INSERT INTO `zone` VALUES ('3822', '237', 'Sud-Kivu', 'SK', '1');
INSERT INTO `zone` VALUES ('3823', '238', 'Central', 'CE', '1');
INSERT INTO `zone` VALUES ('3824', '238', 'Copperbelt', 'CB', '1');
INSERT INTO `zone` VALUES ('3825', '238', 'Eastern', 'EA', '1');
INSERT INTO `zone` VALUES ('3826', '238', 'Luapula', 'LP', '1');
INSERT INTO `zone` VALUES ('3827', '238', 'Lusaka', 'LK', '1');
INSERT INTO `zone` VALUES ('3828', '238', 'Northern', 'NO', '1');
INSERT INTO `zone` VALUES ('3829', '238', 'North-Western', 'NW', '1');
INSERT INTO `zone` VALUES ('3830', '238', 'Southern', 'SO', '1');
INSERT INTO `zone` VALUES ('3831', '238', 'Western', 'WE', '1');
INSERT INTO `zone` VALUES ('3832', '239', 'Bulawayo', 'BU', '1');
INSERT INTO `zone` VALUES ('3833', '239', 'Harare', 'HA', '1');
INSERT INTO `zone` VALUES ('3834', '239', 'Manicaland', 'ML', '1');
INSERT INTO `zone` VALUES ('3835', '239', 'Mashonaland Central', 'MC', '1');
INSERT INTO `zone` VALUES ('3836', '239', 'Mashonaland East', 'ME', '1');
INSERT INTO `zone` VALUES ('3837', '239', 'Mashonaland West', 'MW', '1');
INSERT INTO `zone` VALUES ('3838', '239', 'Masvingo', 'MV', '1');
INSERT INTO `zone` VALUES ('3839', '239', 'Matabeleland North', 'MN', '1');
INSERT INTO `zone` VALUES ('3840', '239', 'Matabeleland South', 'MS', '1');
INSERT INTO `zone` VALUES ('3841', '239', 'Midlands', 'MD', '1');
INSERT INTO `zone` VALUES ('3861', '105', 'Campobasso', 'CB', '1');
INSERT INTO `zone` VALUES ('3862', '105', 'Carbonia-Iglesias', 'CI', '1');
INSERT INTO `zone` VALUES ('3863', '105', 'Caserta', 'CE', '1');
INSERT INTO `zone` VALUES ('3864', '105', 'Catania', 'CT', '1');
INSERT INTO `zone` VALUES ('3865', '105', 'Catanzaro', 'CZ', '1');
INSERT INTO `zone` VALUES ('3866', '105', 'Chieti', 'CH', '1');
INSERT INTO `zone` VALUES ('3867', '105', 'Como', 'CO', '1');
INSERT INTO `zone` VALUES ('3868', '105', 'Cosenza', 'CS', '1');
INSERT INTO `zone` VALUES ('3869', '105', 'Cremona', 'CR', '1');
INSERT INTO `zone` VALUES ('3870', '105', 'Crotone', 'KR', '1');
INSERT INTO `zone` VALUES ('3871', '105', 'Cuneo', 'CN', '1');
INSERT INTO `zone` VALUES ('3872', '105', 'Enna', 'EN', '1');
INSERT INTO `zone` VALUES ('3873', '105', 'Ferrara', 'FE', '1');
INSERT INTO `zone` VALUES ('3874', '105', 'Firenze', 'FI', '1');
INSERT INTO `zone` VALUES ('3875', '105', 'Foggia', 'FG', '1');
INSERT INTO `zone` VALUES ('3876', '105', 'Forli-Cesena', 'FC', '1');
INSERT INTO `zone` VALUES ('3877', '105', 'Frosinone', 'FR', '1');
INSERT INTO `zone` VALUES ('3878', '105', 'Genova', 'GE', '1');
INSERT INTO `zone` VALUES ('3879', '105', 'Gorizia', 'GO', '1');
INSERT INTO `zone` VALUES ('3880', '105', 'Grosseto', 'GR', '1');
INSERT INTO `zone` VALUES ('3881', '105', 'Imperia', 'IM', '1');
INSERT INTO `zone` VALUES ('3882', '105', 'Isernia', 'IS', '1');
INSERT INTO `zone` VALUES ('3883', '105', 'L&#39;Aquila', 'AQ', '1');
INSERT INTO `zone` VALUES ('3884', '105', 'La Spezia', 'SP', '1');
INSERT INTO `zone` VALUES ('3885', '105', 'Latina', 'LT', '1');
INSERT INTO `zone` VALUES ('3886', '105', 'Lecce', 'LE', '1');
INSERT INTO `zone` VALUES ('3887', '105', 'Lecco', 'LC', '1');
INSERT INTO `zone` VALUES ('3888', '105', 'Livorno', 'LI', '1');
INSERT INTO `zone` VALUES ('3889', '105', 'Lodi', 'LO', '1');
INSERT INTO `zone` VALUES ('3890', '105', 'Lucca', 'LU', '1');
INSERT INTO `zone` VALUES ('3891', '105', 'Macerata', 'MC', '1');
INSERT INTO `zone` VALUES ('3892', '105', 'Mantova', 'MN', '1');
INSERT INTO `zone` VALUES ('3893', '105', 'Massa-Carrara', 'MS', '1');
INSERT INTO `zone` VALUES ('3894', '105', 'Matera', 'MT', '1');
INSERT INTO `zone` VALUES ('3895', '105', 'Medio Campidano', 'VS', '1');
INSERT INTO `zone` VALUES ('3896', '105', 'Messina', 'ME', '1');
INSERT INTO `zone` VALUES ('3897', '105', 'Milano', 'MI', '1');
INSERT INTO `zone` VALUES ('3898', '105', 'Modena', 'MO', '1');
INSERT INTO `zone` VALUES ('3899', '105', 'Napoli', 'NA', '1');
INSERT INTO `zone` VALUES ('3900', '105', 'Novara', 'NO', '1');
INSERT INTO `zone` VALUES ('3901', '105', 'Nuoro', 'NU', '1');
INSERT INTO `zone` VALUES ('3902', '105', 'Ogliastra', 'OG', '1');
INSERT INTO `zone` VALUES ('3903', '105', 'Olbia-Tempio', 'OT', '1');
INSERT INTO `zone` VALUES ('3904', '105', 'Oristano', 'OR', '1');
INSERT INTO `zone` VALUES ('3905', '105', 'Padova', 'PD', '1');
INSERT INTO `zone` VALUES ('3906', '105', 'Palermo', 'PA', '1');
INSERT INTO `zone` VALUES ('3907', '105', 'Parma', 'PR', '1');
INSERT INTO `zone` VALUES ('3908', '105', 'Pavia', 'PV', '1');
INSERT INTO `zone` VALUES ('3909', '105', 'Perugia', 'PG', '1');
INSERT INTO `zone` VALUES ('3910', '105', 'Pesaro e Urbino', 'PU', '1');
INSERT INTO `zone` VALUES ('3911', '105', 'Pescara', 'PE', '1');
INSERT INTO `zone` VALUES ('3912', '105', 'Piacenza', 'PC', '1');
INSERT INTO `zone` VALUES ('3913', '105', 'Pisa', 'PI', '1');
INSERT INTO `zone` VALUES ('3914', '105', 'Pistoia', 'PT', '1');
INSERT INTO `zone` VALUES ('3915', '105', 'Pordenone', 'PN', '1');
INSERT INTO `zone` VALUES ('3916', '105', 'Potenza', 'PZ', '1');
INSERT INTO `zone` VALUES ('3917', '105', 'Prato', 'PO', '1');
INSERT INTO `zone` VALUES ('3918', '105', 'Ragusa', 'RG', '1');
INSERT INTO `zone` VALUES ('3919', '105', 'Ravenna', 'RA', '1');
INSERT INTO `zone` VALUES ('3920', '105', 'Reggio Calabria', 'RC', '1');
INSERT INTO `zone` VALUES ('3921', '105', 'Reggio Emilia', 'RE', '1');
INSERT INTO `zone` VALUES ('3922', '105', 'Rieti', 'RI', '1');
INSERT INTO `zone` VALUES ('3923', '105', 'Rimini', 'RN', '1');
INSERT INTO `zone` VALUES ('3924', '105', 'Roma', 'RM', '1');
INSERT INTO `zone` VALUES ('3925', '105', 'Rovigo', 'RO', '1');
INSERT INTO `zone` VALUES ('3926', '105', 'Salerno', 'SA', '1');
INSERT INTO `zone` VALUES ('3927', '105', 'Sassari', 'SS', '1');
INSERT INTO `zone` VALUES ('3928', '105', 'Savona', 'SV', '1');
INSERT INTO `zone` VALUES ('3929', '105', 'Siena', 'SI', '1');
INSERT INTO `zone` VALUES ('3930', '105', 'Siracusa', 'SR', '1');
INSERT INTO `zone` VALUES ('3931', '105', 'Sondrio', 'SO', '1');
INSERT INTO `zone` VALUES ('3932', '105', 'Taranto', 'TA', '1');
INSERT INTO `zone` VALUES ('3933', '105', 'Teramo', 'TE', '1');
INSERT INTO `zone` VALUES ('3934', '105', 'Terni', 'TR', '1');
INSERT INTO `zone` VALUES ('3935', '105', 'Torino', 'TO', '1');
INSERT INTO `zone` VALUES ('3936', '105', 'Trapani', 'TP', '1');
INSERT INTO `zone` VALUES ('3937', '105', 'Trento', 'TN', '1');
INSERT INTO `zone` VALUES ('3938', '105', 'Treviso', 'TV', '1');
INSERT INTO `zone` VALUES ('3939', '105', 'Trieste', 'TS', '1');
INSERT INTO `zone` VALUES ('3940', '105', 'Udine', 'UD', '1');
INSERT INTO `zone` VALUES ('3941', '105', 'Varese', 'VA', '1');
INSERT INTO `zone` VALUES ('3942', '105', 'Venezia', 'VE', '1');
INSERT INTO `zone` VALUES ('3943', '105', 'Verbano-Cusio-Ossola', 'VB', '1');
INSERT INTO `zone` VALUES ('3944', '105', 'Vercelli', 'VC', '1');
INSERT INTO `zone` VALUES ('3945', '105', 'Verona', 'VR', '1');
INSERT INTO `zone` VALUES ('3946', '105', 'Vibo Valentia', 'VV', '1');
INSERT INTO `zone` VALUES ('3947', '105', 'Vicenza', 'VI', '1');
INSERT INTO `zone` VALUES ('3948', '105', 'Viterbo', 'VT', '1');
INSERT INTO `zone` VALUES ('3949', '222', 'County Antrim', 'ANT', '1');
INSERT INTO `zone` VALUES ('3950', '222', 'County Armagh', 'ARM', '1');
INSERT INTO `zone` VALUES ('3951', '222', 'County Down', 'DOW', '1');
INSERT INTO `zone` VALUES ('3952', '222', 'County Fermanagh', 'FER', '1');
INSERT INTO `zone` VALUES ('3953', '222', 'County Londonderry', 'LDY', '1');
INSERT INTO `zone` VALUES ('3954', '222', 'County Tyrone', 'TYR', '1');
INSERT INTO `zone` VALUES ('3955', '222', 'Cumbria', 'CMA', '1');
INSERT INTO `zone` VALUES ('3956', '190', 'Pomurska', '1', '1');
INSERT INTO `zone` VALUES ('3957', '190', 'Podravska', '2', '1');
INSERT INTO `zone` VALUES ('3958', '190', 'Koroška', '3', '1');
INSERT INTO `zone` VALUES ('3959', '190', 'Savinjska', '4', '1');
INSERT INTO `zone` VALUES ('3960', '190', 'Zasavska', '5', '1');
INSERT INTO `zone` VALUES ('3961', '190', 'Spodnjeposavska', '6', '1');
INSERT INTO `zone` VALUES ('3962', '190', 'Jugovzhodna Slovenija', '7', '1');
INSERT INTO `zone` VALUES ('3963', '190', 'Osrednjeslovenska', '8', '1');
INSERT INTO `zone` VALUES ('3964', '190', 'Gorenjska', '9', '1');
INSERT INTO `zone` VALUES ('3965', '190', 'Notranjsko-kraška', '10', '1');
INSERT INTO `zone` VALUES ('3966', '190', 'Goriška', '11', '1');
INSERT INTO `zone` VALUES ('3967', '190', 'Obalno-kraška', '12', '1');
INSERT INTO `zone` VALUES ('3968', '33', 'Ruse', '', '1');
INSERT INTO `zone` VALUES ('3969', '101', 'Alborz', 'ALB', '1');
INSERT INTO `zone` VALUES ('3970', '21', 'Brussels-Capital Region', 'BRU', '1');
INSERT INTO `zone` VALUES ('3971', '138', 'Aguascalientes', 'AG', '1');
INSERT INTO `zone` VALUES ('3972', '222', 'Isle of Man', 'IOM', '1');
INSERT INTO `zone` VALUES ('3973', '242', 'Andrijevica', '01', '1');
INSERT INTO `zone` VALUES ('3974', '242', 'Bar', '02', '1');
INSERT INTO `zone` VALUES ('3975', '242', 'Berane', '03', '1');
INSERT INTO `zone` VALUES ('3976', '242', 'Bijelo Polje', '04', '1');
INSERT INTO `zone` VALUES ('3977', '242', 'Budva', '05', '1');
INSERT INTO `zone` VALUES ('3978', '242', 'Cetinje', '06', '1');
INSERT INTO `zone` VALUES ('3979', '242', 'Danilovgrad', '07', '1');
INSERT INTO `zone` VALUES ('3980', '242', 'Herceg-Novi', '08', '1');
INSERT INTO `zone` VALUES ('3981', '242', 'Kolašin', '09', '1');
INSERT INTO `zone` VALUES ('3982', '242', 'Kotor', '10', '1');
INSERT INTO `zone` VALUES ('3983', '242', 'Mojkovac', '11', '1');
INSERT INTO `zone` VALUES ('3984', '242', 'Nikšić', '12', '1');
INSERT INTO `zone` VALUES ('3985', '242', 'Plav', '13', '1');
INSERT INTO `zone` VALUES ('3986', '242', 'Pljevlja', '14', '1');
INSERT INTO `zone` VALUES ('3987', '242', 'Plužine', '15', '1');
INSERT INTO `zone` VALUES ('3988', '242', 'Podgorica', '16', '1');
INSERT INTO `zone` VALUES ('3989', '242', 'Rožaje', '17', '1');
INSERT INTO `zone` VALUES ('3990', '242', 'Šavnik', '18', '1');
INSERT INTO `zone` VALUES ('3991', '242', 'Tivat', '19', '1');
INSERT INTO `zone` VALUES ('3992', '242', 'Ulcinj', '20', '1');
INSERT INTO `zone` VALUES ('3993', '242', 'Žabljak', '21', '1');
INSERT INTO `zone` VALUES ('3994', '243', 'Belgrade', '00', '1');
INSERT INTO `zone` VALUES ('3995', '243', 'North Bačka', '01', '1');
INSERT INTO `zone` VALUES ('3996', '243', 'Central Banat', '02', '1');
INSERT INTO `zone` VALUES ('3997', '243', 'North Banat', '03', '1');
INSERT INTO `zone` VALUES ('3998', '243', 'South Banat', '04', '1');
INSERT INTO `zone` VALUES ('3999', '243', 'West Bačka', '05', '1');
INSERT INTO `zone` VALUES ('4000', '243', 'South Bačka', '06', '1');
INSERT INTO `zone` VALUES ('4001', '243', 'Srem', '07', '1');
INSERT INTO `zone` VALUES ('4002', '243', 'Mačva', '08', '1');
INSERT INTO `zone` VALUES ('4003', '243', 'Kolubara', '09', '1');
INSERT INTO `zone` VALUES ('4004', '243', 'Podunavlje', '10', '1');
INSERT INTO `zone` VALUES ('4005', '243', 'Braničevo', '11', '1');
INSERT INTO `zone` VALUES ('4006', '243', 'Šumadija', '12', '1');
INSERT INTO `zone` VALUES ('4007', '243', 'Pomoravlje', '13', '1');
INSERT INTO `zone` VALUES ('4008', '243', 'Bor', '14', '1');
INSERT INTO `zone` VALUES ('4009', '243', 'Zaječar', '15', '1');
INSERT INTO `zone` VALUES ('4010', '243', 'Zlatibor', '16', '1');
INSERT INTO `zone` VALUES ('4011', '243', 'Moravica', '17', '1');
INSERT INTO `zone` VALUES ('4012', '243', 'Raška', '18', '1');
INSERT INTO `zone` VALUES ('4013', '243', 'Rasina', '19', '1');
INSERT INTO `zone` VALUES ('4014', '243', 'Nišava', '20', '1');
INSERT INTO `zone` VALUES ('4015', '243', 'Toplica', '21', '1');
INSERT INTO `zone` VALUES ('4016', '243', 'Pirot', '22', '1');
INSERT INTO `zone` VALUES ('4017', '243', 'Jablanica', '23', '1');
INSERT INTO `zone` VALUES ('4018', '243', 'Pčinja', '24', '1');
INSERT INTO `zone` VALUES ('4019', '243', 'Kosovo', 'KM', '1');
INSERT INTO `zone` VALUES ('4020', '245', 'Bonaire', 'BO', '1');
INSERT INTO `zone` VALUES ('4021', '245', 'Saba', 'SA', '1');
INSERT INTO `zone` VALUES ('4022', '245', 'Sint Eustatius', 'SE', '1');
INSERT INTO `zone` VALUES ('4023', '248', 'Central Equatoria', 'EC', '1');
INSERT INTO `zone` VALUES ('4024', '248', 'Eastern Equatoria', 'EE', '1');
INSERT INTO `zone` VALUES ('4025', '248', 'Jonglei', 'JG', '1');
INSERT INTO `zone` VALUES ('4026', '248', 'Lakes', 'LK', '1');
INSERT INTO `zone` VALUES ('4027', '248', 'Northern Bahr el-Ghazal', 'BN', '1');
INSERT INTO `zone` VALUES ('4028', '248', 'Unity', 'UY', '1');
INSERT INTO `zone` VALUES ('4029', '248', 'Upper Nile', 'NU', '1');
INSERT INTO `zone` VALUES ('4030', '248', 'Warrap', 'WR', '1');
INSERT INTO `zone` VALUES ('4031', '248', 'Western Bahr el-Ghazal', 'BW', '1');
INSERT INTO `zone` VALUES ('4032', '248', 'Western Equatoria', 'EW', '1');

-- ----------------------------
-- Table structure for `zone_to_geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `zone_to_geo_zone`;
CREATE TABLE `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zone_to_geo_zone
-- ----------------------------
INSERT INTO `zone_to_geo_zone` VALUES ('57', '222', '0', '3', '2010-02-26 22:33:24', '0000-00-00 00:00:00');
INSERT INTO `zone_to_geo_zone` VALUES ('65', '222', '0', '4', '2010-12-15 15:18:13', '0000-00-00 00:00:00');
