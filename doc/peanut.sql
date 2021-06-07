/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : peanut

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-06-03 10:59:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
                            `bookid` int(11) NOT NULL AUTO_INCREMENT,
                            `bookname` varchar(50) DEFAULT NULL,
                            `authorname` varchar(50) DEFAULT NULL,
                            `attribution` varchar(50) DEFAULT NULL,
                            `booktypeid` varchar(50) DEFAULT NULL,
                            `updateStatus` varchar(50) DEFAULT NULL,
                            `cover_url` varchar(50) DEFAULT NULL,
                            `description` text,
                            `wordcount` varchar(50) DEFAULT NULL,
                            PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('1', '诡秘之主11', '爱潜水的乌贼', '1', '6', '0', '.com', '蒸汽与机械的浪潮中，谁能触及非凡？历史和黑暗的迷雾里，又是谁在耳语？我从诡秘中醒来，睁眼看见这个世界：\r\n　　枪械，大炮，巨舰，飞空艇，差分机；魔药，占卜，诅咒，倒吊人，封印物……光明依旧照耀，神秘从未远离，这是一段“愚者”的传说', '446.51万字');
INSERT INTO `bookinfo` VALUES ('2', '诡秘之主2', '爱潜水的乌贼', '1', '4', '0', '.com', '蒸汽与机械的浪潮中，谁能触及非凡？历史和黑暗的迷雾里，又是谁在耳语？我从诡秘中醒来，睁眼看见这个世界：\r\n　　枪械，大炮，巨舰，飞空艇，差分机；魔药，占卜，诅咒，倒吊人，封印物……光明依旧照耀，神秘从未远离，这是一段“愚者”的传说', '446.51万字');
INSERT INTO `bookinfo` VALUES ('3', '诡秘之主3', '爱潜水的乌贼', '1', '5', '0', '.com', '蒸汽与机械的浪潮中，谁能触及非凡？历史和黑暗的迷雾里，又是谁在耳语？我从诡秘中醒来，睁眼看见这个世界：\r\n　　枪械，大炮，巨舰，飞空艇，差分机；魔药，占卜，诅咒，倒吊人，封印物……光明依旧照耀，神秘从未远离，这是一段“愚者”的传说', '446.51万字');
INSERT INTO `bookinfo` VALUES ('4', '言情测试1', '喵喵', '2', '10', '0', '.com', '霸道总裁', '10万字');
INSERT INTO `bookinfo` VALUES ('5', '言情测试2', '11', '2', '11', '0', '.com', 'cs', '111');
INSERT INTO `bookinfo` VALUES ('6', '灵异测试1', '11', '3', '13', '0', '.com', '11', '11');
INSERT INTO `bookinfo` VALUES ('7', '灵异测试2', '11', '3', '16', '0', '.com', '11', '1');
INSERT INTO `bookinfo` VALUES ('8', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `bookinfo` VALUES ('9', '1', '1', null, '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
                            `booktypeid` int(11) NOT NULL AUTO_INCREMENT,
                            `booktypename` varchar(50) DEFAULT NULL,
                            `flagparent` varchar(50) DEFAULT NULL,
                            `parenttypeid` varchar(50) DEFAULT NULL,
                            PRIMARY KEY (`booktypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '男生频道', '0', '0');
INSERT INTO `booktype` VALUES ('2', '女生频道', '0', '0');
INSERT INTO `booktype` VALUES ('3', '灵异频道', '0', '0');
INSERT INTO `booktype` VALUES ('4', '军事小说', '1', '1');
INSERT INTO `booktype` VALUES ('5', '网游小说', '1', '1');
INSERT INTO `booktype` VALUES ('6', '历史小说', '1', '1');
INSERT INTO `booktype` VALUES ('7', '仙侠小说', '1', '1');
INSERT INTO `booktype` VALUES ('8', '古代言情', '1', '2');
INSERT INTO `booktype` VALUES ('9', '浪漫青春', '1', '2');
INSERT INTO `booktype` VALUES ('10', '现代言情', '1', '2');
INSERT INTO `booktype` VALUES ('11', '短篇小说', '1', '2');
INSERT INTO `booktype` VALUES ('12', '玄幻小说', '1', '1');
INSERT INTO `booktype` VALUES ('13', '古代僵尸', '1', '3');
INSERT INTO `booktype` VALUES ('14', '国外生化', '1', '3');
INSERT INTO `booktype` VALUES ('15', '都市怪谈', '1', '3');
INSERT INTO `booktype` VALUES ('16', '僵尸道士', '1', '3');

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `typeoneid` varchar(50) DEFAULT NULL,
                           `typeonename` varchar(50) DEFAULT NULL,
                           `typetwoid` varchar(50) DEFAULT NULL,
                           `typetwoname` varchar(50) DEFAULT NULL,
                           `haveparent` int(2) DEFAULT NULL,
                           `channelnum` varchar(50) DEFAULT NULL,
                           `url` text,
                           `productname` varchar(50) DEFAULT NULL,
                           `productviewname` varchar(50) DEFAULT NULL,
                           `ctime` datetime DEFAULT NULL,
                           `platform` varchar(50) DEFAULT NULL,
                           `area` varchar(50) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('1', '1', '一级分类1', '4', '儿子1', '1', '123', '.com', '小白', '小白白', '2021-05-31 10:22:24', 'ios', '北京');
INSERT INTO `channel` VALUES ('2', '1', '一级分类1', '5', '儿子2', '1', '123', 'www.com', '小黑', '小黑黑', '2021-05-31 15:52:53', 'ios', '上海');
INSERT INTO `channel` VALUES ('3', '2', '一级分类2', '6', '女儿1', '1', '123', 'www.com', '小蓝', '小蓝蓝', '2021-05-31 15:52:56', 'ios', '上海');
INSERT INTO `channel` VALUES ('4', '2', '一级分类2', '7', '女儿2', '1', '123', 'www.com', '小紫', '小紫紫', '2021-05-31 15:52:58', 'ios', '上海');
INSERT INTO `channel` VALUES ('5', '3', '一级分类3', '8', '子类1', '1', '123', 'www.com', '小池', '小池池', '2021-05-31 15:52:59', 'ios', '上海');
INSERT INTO `channel` VALUES ('6', '3', '一级分类3', '9', '子类2', '1', '123', 'www.com', '小刘', '小刘刘', '2021-05-31 15:53:01', 'ios', '上海');
INSERT INTO `channel` VALUES ('7', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2021-05-31 20:38:51', '1', '1');

-- ----------------------------
-- Table structure for channeltype
-- ----------------------------
DROP TABLE IF EXISTS `channeltype`;
CREATE TABLE `channeltype` (
                               `tid` int(11) NOT NULL AUTO_INCREMENT,
                               `name` varchar(50) DEFAULT NULL,
                               `pid` int(50) DEFAULT NULL,
                               `sort` varchar(50) DEFAULT NULL,
                               `description` varchar(50) DEFAULT NULL,
                               `ctime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                               `isparent` int(2) DEFAULT NULL,
                               PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of channeltype
-- ----------------------------
INSERT INTO `channeltype` VALUES ('1', '一级分类1', '0', '1', '无备注', '2021-05-31 19:48:44', '1');
INSERT INTO `channeltype` VALUES ('2', '一级分类2', '0', '1', '无备注', '2021-05-31 19:48:45', '1');
INSERT INTO `channeltype` VALUES ('3', '一级分类3', '0', '1', '无备注', '2021-05-31 19:48:45', '1');
INSERT INTO `channeltype` VALUES ('4', '儿子1', '1', '2', '分类1的子类', '2021-05-31 19:48:47', '0');
INSERT INTO `channeltype` VALUES ('5', '儿子2', '1', '65', '分类1的子类', '2021-05-31 19:48:47', '0');
INSERT INTO `channeltype` VALUES ('6', '女儿1', '2', '6', '分类2的子类', '2021-05-31 19:48:48', '0');
INSERT INTO `channeltype` VALUES ('7', '女儿2', '2', '8', '分类2的子类', '2021-05-31 19:48:48', '0');
INSERT INTO `channeltype` VALUES ('8', '子类1', '3', '6', '分类3的子类', '2021-05-31 19:48:49', '0');
INSERT INTO `channeltype` VALUES ('9', '子类2', '3', '23', '分类3的子类', '2021-05-31 19:48:49', '0');
INSERT INTO `channeltype` VALUES ('10', '测试类', '0', '2', '无备注', null, '1');
INSERT INTO `channeltype` VALUES ('11', '测试类1', null, null, null, null, null);
INSERT INTO `channeltype` VALUES ('13', '1', '2', '1', '1', '2021-06-01 11:32:21', '0');

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
                        `gid` int(11) NOT NULL AUTO_INCREMENT,
                        `name` varchar(30) NOT NULL,
                        `title` varchar(50) NOT NULL,
                        `downloadcount` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
                        `size` double NOT NULL COMMENT '大小',
                        `state` varchar(10) NOT NULL COMMENT '状态 0停用,1启用',
                        `gameicon` text COMMENT '游戏图标',
                        `iosurl` text COMMENT 'ios下载地址',
                        `androidurl` text,
                        `platform` varchar(10) DEFAULT NULL COMMENT '平台类型安卓,ios,全平台',
                        `rank` varchar(10) DEFAULT NULL COMMENT '推荐类型..普通,推荐首页',
                        `des` varchar(255) DEFAULT NULL COMMENT '详细介绍',
                        `pictures` text,
                        `typeid` int(2) DEFAULT NULL,
                        PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('3', '航海王-起航qqqq', '开启跨服实时PVP新篇章\r\n顶尖决战 一触即发', '0000000000', '10', '3', '1.jpg', 'ios下载地址', '安卓下载地址', 'ios', '3', '《天天战争》依托最为专业的Untiy3D画面引擎，打造出时下最为流行的3D风游戏画面，在玩法上极具创新！作为一款以三国历史为题材的手游，诸位主公不仅可以将大喝断桥的张飞、忠义无双的关羽、足智多谋的诸葛', '图片路径', '3');
INSERT INTO `game` VALUES ('7', '测试', '开启跨服实时PVP新篇章\r\n顶尖决战 一触即发', '0000000000', '10', '1', '1.jpg', 'ios下载地址', '安卓下载地址', 'ios', '1', '《天天战争》依托最为专业的Untiy3D画面引擎，打造出时下最为流行的3D风游戏画面，在玩法上极具创新！作为一款以三国历史为题材的手游，诸位主公不仅可以将大喝断桥的张飞、忠义无双的关羽、足智多谋的诸葛', '图片路径', '4');
INSERT INTO `game` VALUES ('8', '航海王-起航', '开启跨服实时PVP新篇章\r\n顶尖决战 一触即发', '0000000000', '10', '1', '1.jpg', 'ios下载地址', '安卓下载地址', 'ios', '2', '《天天战争》依托最为专业的Untiy3D画面引擎，打造出时下最为流行的3D风游戏画面，在玩法上极具创新！作为一款以三国历史为题材的手游，诸位主公不仅可以将大喝断桥的张飞、忠义无双的关羽、足智多谋的诸葛', '图片路径', '1');
INSERT INTO `game` VALUES ('9', '1', '1', '0000000000', '1', '0', null, null, null, 'android', '1', null, null, '1');
INSERT INTO `game` VALUES ('16', '测试1', '测试', '0000000000', '10', '1', null, null, null, 'android', '0', null, null, '2');
INSERT INTO `game` VALUES ('17', '1', '1', '0000000000', '1', '0', null, null, null, 'android', '0', null, null, '1');
INSERT INTO `game` VALUES ('18', '1', '1', '0000000000', '1', '0', null, null, null, 'android', '0', null, null, '1');
INSERT INTO `game` VALUES ('19', '1', '1', '0000000000', '1', '0', null, null, null, 'android', '1', null, null, '1');
INSERT INTO `game` VALUES ('20', '20', '1', '0000000000', '1', '0', null, null, null, 'android', '1', null, null, '1');

-- ----------------------------
-- Table structure for gametype
-- ----------------------------
DROP TABLE IF EXISTS `gametype`;
CREATE TABLE `gametype` (
                            `typeid` int(11) NOT NULL AUTO_INCREMENT,
                            `typeName` varchar(20) NOT NULL,
                            PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gametype
-- ----------------------------
INSERT INTO `gametype` VALUES ('1', '休闲益智');
INSERT INTO `gametype` VALUES ('2', '网络游戏');
INSERT INTO `gametype` VALUES ('3', '体育竞技');
INSERT INTO `gametype` VALUES ('4', '棋牌中心');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
                        `mid` int(11) NOT NULL AUTO_INCREMENT,
                        `path` varchar(50) DEFAULT NULL,
                        `name` varchar(50) DEFAULT NULL,
                        `icon` varchar(200) DEFAULT NULL,
                        `state` tinyint(2) DEFAULT NULL,
                        `parentid` int(11) DEFAULT NULL,
                        PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '#', '小说', 'el-icon-notebook-2', '1', '0');
INSERT INTO `menu` VALUES ('2', '#', '游戏', 'el-icon-mouse', '1', '0');
INSERT INTO `menu` VALUES ('3', '#', '渠道', 'el-icon-toilet-paper', '1', '0');
INSERT INTO `menu` VALUES ('4', 'page/novel/Blibrary.jsp', '小说管理', 'el-icon-notebook-1', '1', '1');
INSERT INTO `menu` VALUES ('5', 'page/game/Game.jsp', '游戏管理', 'el-icon-aim', '1', '2');
INSERT INTO `menu` VALUES ('6', 'page/channel/channel.jsp', '渠道管理', 'el-icon-paperclip', '1', '3');
INSERT INTO `menu` VALUES ('7', '#', '权限', 'el-icon-user', '1', '0');
INSERT INTO `menu` VALUES ('8', 'page/user/rightcontrol.jsp', '权限管理', 'el-icon-setting', '1', '7');
INSERT INTO `menu` VALUES ('9', 'page/user/menu.jsp', '菜单管理', 'el-icon-s-tools', '1', '7');
INSERT INTO `menu` VALUES ('10', 'page/book/BookInfo.jsp', '电子书管理', 'el-icon-notebook-1', '1', '2');
INSERT INTO `menu` VALUES ('11', 'page/channel/ChannelType.jsp', '渠道类型', 'el-icon-paperclip', '1', '3');
INSERT INTO `menu` VALUES ('29', '#', 'Test', 'el-icon-setting', '1', '0');
INSERT INTO `menu` VALUES ('30', '1', 'test', 'el-icon-setting', '1', '29');
INSERT INTO `menu` VALUES ('31', '#', 'Test2', 'el-icon-setting', '1', '0');
INSERT INTO `menu` VALUES ('32', '1', 'Test2', 'el-icon-setting', '1', '31');

-- ----------------------------
-- Table structure for novelchapter
-- ----------------------------
DROP TABLE IF EXISTS `novelchapter`;
CREATE TABLE `novelchapter` (
                                `cid` int(11) NOT NULL AUTO_INCREMENT,
                                `bid` int(100) DEFAULT NULL,
                                `bookid` varchar(30) DEFAULT NULL,
                                `bchapterName` varchar(30) DEFAULT NULL,
                                `bchaptercontent` varchar(255) DEFAULT NULL,
                                `bchapterid` varchar(30) DEFAULT NULL,
                                PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novelchapter
-- ----------------------------
INSERT INTO `novelchapter` VALUES ('1', '9001', '9001', '天阶岛', '天阶岛是一个...', '1000');
INSERT INTO `novelchapter` VALUES ('2', '9001', '9001', '天阶岛', '天阶岛是一个...', '1001');
INSERT INTO `novelchapter` VALUES ('3', '9001', '9001', '天阶岛', '天阶岛是一个...', '1002');
INSERT INTO `novelchapter` VALUES ('5', '9001', '9001', '天阶岛', '天阶岛是一个...', '1003');

-- ----------------------------
-- Table structure for noveldetail
-- ----------------------------
DROP TABLE IF EXISTS `noveldetail`;
CREATE TABLE `noveldetail` (
                               `bid` int(11) NOT NULL AUTO_INCREMENT,
                               `bookpartner` mediumtext,
                               `bookid` varchar(30) DEFAULT NULL,
                               `bookName` varchar(100) DEFAULT NULL,
                               `bstatus` varchar(30) DEFAULT NULL,
                               `bwordCount` mediumtext,
                               `bdescription` varchar(100) DEFAULT NULL,
                               `bcoverUrl` varchar(100) DEFAULT NULL,
                               `bauthorName` varchar(30) DEFAULT NULL,
                               `blastupdatechaptername` varchar(30) DEFAULT NULL,
                               `blastupdatechapterid` int(11) DEFAULT NULL,
                               `bprice` double DEFAULT NULL,
                               `bpeanutprice` double DEFAULT NULL,
                               `bisvip` varchar(30) DEFAULT NULL,
                               `battribution` varchar(30) DEFAULT NULL,
                               `bsortid` int(30) DEFAULT NULL,
                               `pid` int(11) DEFAULT NULL,
                               `bkeyword` varchar(30) DEFAULT NULL,
                               `bisRecommand` varchar(30) DEFAULT NULL,
                               PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of noveldetail
-- ----------------------------
INSERT INTO `noveldetail` VALUES ('1', '8888', '9999', '盗墓笔记', 'true', '1', '1', '1', '1', '1', '1', '1', '1', 'true', '1', '2001', '2000', '', 'true');
INSERT INTO `noveldetail` VALUES ('3', '500', '9003', '校花的贴身高手', '0', '1000', '作者鱼人二代,校园都市玄幻', 'baidu.tieba', '鱼人二代', '天阶岛', '2000', '50', '38.6', '1', '1', '1001', '1000', '校园、玄幻', '1');
INSERT INTO `noveldetail` VALUES ('4', '500', '9004', '校花的贴身高手', '0', '1000', '作者鱼人二代,校园都市玄幻', 'baidu.tieba', '鱼人二代', '天阶岛', '2000', '50', '38.6', '1', '1', '1001', '1000', '校园、玄幻', '1');
INSERT INTO `noveldetail` VALUES ('25', '500', '9030', '太古神王', 'true', '111', '11', '11', '11', '11', '11', '11', '11', 'true', '3', '1001', '1000', '1', 'true');
INSERT INTO `noveldetail` VALUES ('26', '500', '9030', '太古神王', 'true', '111', '11', '11', '11', '11', '11', '11', '11', 'true', '3', '1001', '1000', '1', 'true');
INSERT INTO `noveldetail` VALUES ('27', '500', '9050', '莽荒纪', 'true', '11', '11', '11', '11', '11', '11', '111', '11', 'true', '3', '1001', '1000', '11', 'true');
INSERT INTO `noveldetail` VALUES ('28', '600', '9088', '雪中悍刀行', 'true', '11', '11', '11', '11', '11', '11', '11', '11', 'true', '3', '1001', '1000', '1', 'true');
INSERT INTO `noveldetail` VALUES ('29', '700', '9094', '秘术破局', 'true', '1', '1', '1', '1', '1', '1', '1', '1', 'true', '1', '1001', '1000', '1', 'true');
INSERT INTO `noveldetail` VALUES ('30', '500', '90088', '校花的贴身高手', '0', '1000', '作者鱼人二代,校园都市玄幻', 'baidu.tieba', '鱼人二代', '天阶岛', '2000', '50', '38.6', '1', '1', '1001', '1000', '校园、玄幻', '1');
INSERT INTO `noveldetail` VALUES ('33', '800', '30000', '剑来', 'true', '1', '1', '1', '1', '1', '1', '1', '1', 'true', '1', '2002', '2000', '1', 'true');
INSERT INTO `noveldetail` VALUES ('40', '500', '90111', '校花的贴身高手', '0', '1000', '作者鱼人二代,校园都市玄幻', 'baidu.tieba', '鱼人二代', '天阶岛', '2000', '50', '38.6', '1', '1', '1001', '1000', '校园、玄幻', '1');

-- ----------------------------
-- Table structure for novellist
-- ----------------------------
DROP TABLE IF EXISTS `novellist`;
CREATE TABLE `novellist` (
                             `nid` int(11) NOT NULL AUTO_INCREMENT,
                             `bsortid` int(100) DEFAULT NULL,
                             `bsortname` varchar(100) DEFAULT NULL,
                             `isPar` int(11) DEFAULT NULL,
                             `pid` int(11) DEFAULT NULL,
                             PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novellist
-- ----------------------------
INSERT INTO `novellist` VALUES ('1', '1000', '武侠', '1', '0');
INSERT INTO `novellist` VALUES ('2', '1001', '都市武侠', '0', '1000');
INSERT INTO `novellist` VALUES ('3', '2000', '恐怖', '1', '0');
INSERT INTO `novellist` VALUES ('5', '2002', '都市恐怖', '0', '2000');
INSERT INTO `novellist` VALUES ('6', '1002', '都市玄幻', '0', '1000');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
                        `rid` int(11) NOT NULL AUTO_INCREMENT,
                        `rname` varchar(20) DEFAULT NULL,
                        `state` int(11) DEFAULT NULL,
                        PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '1');
INSERT INTO `role` VALUES ('2', '游戏管理员', '1');
INSERT INTO `role` VALUES ('3', '小说管理员', '1');
INSERT INTO `role` VALUES ('4', '渠道管理员', '1');
INSERT INTO `role` VALUES ('5', 'Test', '1');
INSERT INTO `role` VALUES ('6', 'TEST3', '1');
INSERT INTO `role` VALUES ('11', 'chyyhc', '1');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
                            `rmid` int(11) NOT NULL AUTO_INCREMENT,
                            `rid` int(11) DEFAULT NULL,
                            `mid` int(11) DEFAULT NULL,
                            PRIMARY KEY (`rmid`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES ('1', '1', '1');
INSERT INTO `rolemenu` VALUES ('2', '1', '2');
INSERT INTO `rolemenu` VALUES ('3', '1', '3');
INSERT INTO `rolemenu` VALUES ('4', '2', '2');
INSERT INTO `rolemenu` VALUES ('5', '3', '1');
INSERT INTO `rolemenu` VALUES ('6', '4', '3');
INSERT INTO `rolemenu` VALUES ('7', '1', '4');
INSERT INTO `rolemenu` VALUES ('8', '1', '5');
INSERT INTO `rolemenu` VALUES ('9', '1', '6');
INSERT INTO `rolemenu` VALUES ('10', '2', '5');
INSERT INTO `rolemenu` VALUES ('11', '3', '4');
INSERT INTO `rolemenu` VALUES ('12', '4', '6');
INSERT INTO `rolemenu` VALUES ('13', '1', '7');
INSERT INTO `rolemenu` VALUES ('14', '1', '8');
INSERT INTO `rolemenu` VALUES ('15', '1', '9');
INSERT INTO `rolemenu` VALUES ('16', '1', '10');
INSERT INTO `rolemenu` VALUES ('22', '1', '11');
INSERT INTO `rolemenu` VALUES ('23', '4', '11');
INSERT INTO `rolemenu` VALUES ('29', '1', '31');
INSERT INTO `rolemenu` VALUES ('30', '1', '32');
INSERT INTO `rolemenu` VALUES ('41', '1', '29');
INSERT INTO `rolemenu` VALUES ('42', '2', '29');
INSERT INTO `rolemenu` VALUES ('43', '1', '30');
INSERT INTO `rolemenu` VALUES ('44', '2', '30');
INSERT INTO `rolemenu` VALUES ('45', '0', '1');
INSERT INTO `rolemenu` VALUES ('46', '0', '4');
INSERT INTO `rolemenu` VALUES ('47', '0', '29');
INSERT INTO `rolemenu` VALUES ('48', '0', '30');
INSERT INTO `rolemenu` VALUES ('49', '0', '31');
INSERT INTO `rolemenu` VALUES ('50', '0', '32');
INSERT INTO `rolemenu` VALUES ('51', '5', '1');
INSERT INTO `rolemenu` VALUES ('52', '5', '4');
INSERT INTO `rolemenu` VALUES ('53', '5', '29');
INSERT INTO `rolemenu` VALUES ('54', '5', '30');
INSERT INTO `rolemenu` VALUES ('55', '5', '31');
INSERT INTO `rolemenu` VALUES ('56', '5', '32');
INSERT INTO `rolemenu` VALUES ('57', '6', '2');
INSERT INTO `rolemenu` VALUES ('58', '6', '5');
INSERT INTO `rolemenu` VALUES ('59', '6', '10');
INSERT INTO `rolemenu` VALUES ('60', '6', '29');
INSERT INTO `rolemenu` VALUES ('61', '6', '30');
INSERT INTO `rolemenu` VALUES ('62', '6', '31');
INSERT INTO `rolemenu` VALUES ('63', '6', '32');
INSERT INTO `rolemenu` VALUES ('76', '11', '9');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `uid` int(11) NOT NULL AUTO_INCREMENT,
                        `username` varchar(20) NOT NULL,
                        `pwd` varchar(11) DEFAULT NULL,
                        `rid` int(11) DEFAULT NULL,
                        `headpic` varchar(200) DEFAULT NULL,
                        `headpicthumb` varchar(200) DEFAULT NULL,
                        `des` varchar(255) DEFAULT NULL,
                        `sex` varchar(2) DEFAULT NULL,
                        `birthday` date DEFAULT NULL,
                        `avatarcolor` varchar(255) DEFAULT NULL,
                        `phone` varchar(20) DEFAULT NULL,
                        `state` int(11) DEFAULT NULL,
                        `regtime` datetime DEFAULT NULL,
                        `logintime` datetime DEFAULT NULL,
                        `isvalid` int(11) DEFAULT NULL,
                        `createuid` int(11) DEFAULT NULL,
                        `channels` varchar(50) DEFAULT NULL,
                        PRIMARY KEY (`uid`,`username`),
                        UNIQUE KEY `u_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '1', 'upload/1622687917903preview.gif', '//', '这个人很懒,什么都没写', '男', '2021-05-26', '//', null, '1', '2021-05-26 19:41:22', '2021-06-03 10:43:24', '1', '0', null);
INSERT INTO `user` VALUES ('2', 'game', '123', '2', null, null, null, '男', '2021-05-27', null, '345', '1', '2021-05-27 09:58:02', '2021-06-01 15:29:44', '1', '1', null);
INSERT INTO `user` VALUES ('3', 'novel', '123', '3', null, null, null, '男', '2021-05-27', null, '456', '1', '2021-05-27 09:58:05', '2021-06-01 15:29:54', '1', '1', null);
INSERT INTO `user` VALUES ('4', 'channel', '123', '4', null, null, null, '男', '2021-05-27', null, '567', '1', '2021-05-27 09:58:07', '2021-05-31 23:15:58', '1', '1', null);
INSERT INTO `user` VALUES ('7', 'Test', '123', null, null, null, null, null, null, null, null, '1', '2021-06-01 17:12:51', '2021-06-01 19:32:01', null, null, null);
INSERT INTO `user` VALUES ('8', 'Test2', '123', null, null, null, null, null, null, null, null, '0', '2021-06-01 17:11:55', '2021-06-01 17:12:12', null, null, null);
INSERT INTO `user` VALUES ('9', 'Test3', '123', null, null, null, null, null, null, null, null, '1', '2021-06-01 22:12:30', null, null, null, null);
INSERT INTO `user` VALUES ('10', 't', '123', null, null, null, null, null, null, null, null, '1', '2021-06-02 16:52:48', null, null, null, null);
INSERT INTO `user` VALUES ('11', 'chy', '123', null, null, null, null, null, null, null, null, '1', '2021-06-02 17:36:31', null, null, null, null);

-- ----------------------------
-- Table structure for userole
-- ----------------------------
DROP TABLE IF EXISTS `userole`;
CREATE TABLE `userole` (
                           `urid` int(11) NOT NULL AUTO_INCREMENT,
                           `uid` int(11) DEFAULT NULL,
                           `rid` int(11) DEFAULT NULL,
                           PRIMARY KEY (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userole
-- ----------------------------
INSERT INTO `userole` VALUES ('1', '1', '1');
INSERT INTO `userole` VALUES ('2', '2', '2');
INSERT INTO `userole` VALUES ('3', '3', '3');
INSERT INTO `userole` VALUES ('4', '4', '4');
INSERT INTO `userole` VALUES ('10', '7', '1');
INSERT INTO `userole` VALUES ('11', '8', '2');
INSERT INTO `userole` VALUES ('12', '9', '5');
INSERT INTO `userole` VALUES ('13', '9', '3');
INSERT INTO `userole` VALUES ('14', '10', '1');
INSERT INTO `userole` VALUES ('15', '10', '2');
INSERT INTO `userole` VALUES ('16', '11', '2');
INSERT INTO `userole` VALUES ('17', '11', '3');
