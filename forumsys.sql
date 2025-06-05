/*
 Navicat Premium Data Transfer

 Source Server         : forever
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : forumsys

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 05/06/2025 12:00:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adminPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'password');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `post_id` int(0) NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (3, 14, 'user1', '怎么有人没水了呀', '2025-03-14');
INSERT INTO `comment` VALUES (4, 11, 'user1', '感谢分享！', '2025-03-13');
INSERT INTO `comment` VALUES (13, 18, 'zzr', '1111', '2025-03-07');
INSERT INTO `comment` VALUES (14, 11, 'user1', '111', '2025-03-04');
INSERT INTO `comment` VALUES (15, 20, '123', '111', '2025-03-22');
INSERT INTO `comment` VALUES (25, 22, 'lc', '逆天', '2025-04-20');
INSERT INTO `comment` VALUES (30, 47, 'luobiao', '我有', '2025-04-21');
INSERT INTO `comment` VALUES (33, 22, 'lc', '哈哈', '2025-04-26');
INSERT INTO `comment` VALUES (42, 11, 'lc', '学到了！', '2025-04-26');
INSERT INTO `comment` VALUES (43, 48, 'lc', '一定来', '2025-04-26');
INSERT INTO `comment` VALUES (44, 26, 'lc', '有', '2025-05-06');
INSERT INTO `comment` VALUES (45, 45, 'lc', '联系我', '2025-05-17');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '//序号',
  `title` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '//标题',
  `author` varchar(128) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '//作者',
  `type` varchar(40) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '//类型',
  `content` text CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '//文章内容',
  `date` date NOT NULL COMMENT '//发布日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 62 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (11, 'C++入门分享', 'user1', '学习讨论', '学习 C++，可以分为两大部分：C++语言和 C++标准库先说 C++语言部分：1.语言基础，推荐图书 C++ Primer（中文版 第5版）2.进一步提升，可以读 Effective C++（第3版 中文版）和 More Effective C++（中文版）这两本书，帮助你写更规范专业的 C++代码3.有C基础的，也可以直接看 C++面向对象开发 | 博览网 Boolan对1&2中的重点难点做了深入剖析，BTW 课程主讲就是上面两书的翻译侯捷老师然后 C++标准库的部分：1.经典之作：侯捷的 《STL源码剖析》2.觉得书难啃的，可以看对应的在线课 STL标准库与泛型编程 | 博览网 Boolan课程还有个综合版 《C++开发工程师》微专业 | 博览网 Boolan 适合想系统学习 C++的掌握这两部分，才是真正的 C++入门了，即可以从事 C++开发的相关岗位工作。', '2025-03-05');
INSERT INTO `post` VALUES (45, '谁见我饭卡了？', 'lc', '校园生活', '今天饭卡丢了大概在操场那边有没有好心人捡到。', '2025-04-20');
INSERT INTO `post` VALUES (14, '怎么宿舍又没水了', 'user2', '校园生活', '包租婆没水了！！！', '2020-12-14');
INSERT INTO `post` VALUES (16, '有人有二手小电驴出售吗', 'user1', '校园生活', '如题！', '2025-03-05');
INSERT INTO `post` VALUES (18, '求大一下学期计本书单！', 'zzr', '校园生活', '求大一下学期计本书单！', '2025-03-22');
INSERT INTO `post` VALUES (19, 'hello', '123', '校园生活', 'hello', '2025-03-22');
INSERT INTO `post` VALUES (20, '出书', '123', '校园生活', '出书，九九新，没怎么使用过，先到先得', '2025-03-22');
INSERT INTO `post` VALUES (21, '求大三密码学试卷!!!', 'lc', '学习讨论', '有没有学长有上次密码学考试的试卷没？跪求！！！help！！！！', '2025-03-22');
INSERT INTO `post` VALUES (22, '表白bb', 'lb', '表白墙', '表白2022级软件工程3班罗彪', '2025-03-22');
INSERT INTO `post` VALUES (23, '表白hhh', 'muya', '表白墙', '世林：\r\n    展信安。\r\n最近总在晚自习后绕到实验楼前的香樟树下，看月光把影子拉得很长。忽然想起去年深秋你抱着竞赛题集从梧桐道走过的样子，连落叶都在你肩头跳华尔兹。\r\n你解题时指尖无意识摩挲笔帽的小动作，你讲函数图像时眼里流转的星河，还有你总在书包侧袋备着的薄荷糖 —— 这些细碎的光，在我19岁的天空里拼成了银河。\r\n听说梧桐树的年轮会记住所有秘密，我偷偷把心事刻在第三棵树的第三圈纹路里。如果你明天中午经过那里，会不会发现树影间藏着一封未署名的情书？\r\n    生物园的蓝雪花开了，我在最大的那簇花心里藏了东西。', '2025-03-22');
INSERT INTO `post` VALUES (24, '收吹风机', 'muya', '学习讨论', '收吹风机', '2025-03-22');
INSERT INTO `post` VALUES (25, '明天晚上有一起回学校的吗？', 'muya', '校园生活', '明天榆中拼车，我这两个人', '2025-03-22');
INSERT INTO `post` VALUES (26, '学校附近有卖花的吗？', 'muya', '校园生活', '学校附近有卖花的吗？价格贵吗？', '2025-03-22');
INSERT INTO `post` VALUES (46, 'Java 学习笔记', 'lc', '学习讨论', '1.数据类型：基本数据类型（如 byte、short、int、long、float、double、char、boolean）和引用数据类型（类、接口、数组等）。int 类型占 4 字节，取值范围 -2147483648 到 2147483647。\r\n\r\n2.变量与常量：变量声明如 int num = 10;，常量用 final 修饰，如 final double PI=3.1415926;\r\n\r\n3.运算符：算术运算符（+、-、*、/、%）、关系运算符（>、<、== 等）、逻辑运算符（&&、||、!）等。', '2025-04-20');
INSERT INTO `post` VALUES (47, '你们谁有22软3hhh的微信？', 'muya', '表白墙', '你们谁有 22 软 3 谭世林的微信？真的特别着急找他有点事儿，之前因为一些项目合作和他有过接触，最近又有一个很重要的合作机会想和他聊聊，但是当时没有保存他的联系方式，现在通过其他渠道也一直没能联系上他。如果有哪位同学正好有他的微信，麻烦你把他的微信推给我一下，或者告诉我一声，真的非常感谢！要是你不方便直接推微信的话，也可以先跟他说一声我在找他，然后让他联系我，拜托了！', '2025-04-20');
INSERT INTO `post` VALUES (48, '欢迎大家下周星期天来参加我和汇川的婚礼', 'luobiao', '校园生活', '欢迎大家下周星期天来参加我的婚礼。我和爱人对那天满怀期待，想象着温馨场景里有大家温暖的笑容。\r\n我们精心筹备了婚礼，从场地布置到菜品选择都亲力亲为。仪式上，我们会交换誓言，许下一生承诺，特别期待大家的见证与祝福。\r\n婚礼后安排了娱乐活动，希望大家能尽情放松、开怀畅玩。\r\n一直以来，我的生活因大家的陪伴和支持而美好，未来我和爱人也会带着这份祝福，用心经营家庭。\r\n期待与大家相聚，共享这份幸福！\r\n', '2025-04-21');
INSERT INTO `post` VALUES (49, '运动会志愿者招募', 'lc', '校园生活', '运动会急需志愿者，可加一体化育人积分', '2025-04-22');
INSERT INTO `post` VALUES (59, '寻找一个学习搭子', '123', '校园生活', '寻找一个学习搭子，本人比较懒希望找一个学习搭子相互监督学习。', '2025-04-26');
INSERT INTO `post` VALUES (60, '求数计院gg微信', '123', '表白墙', '求数计院赵汇川微信！！！！', '2025-04-26');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `passwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rtime` date NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user1', '111111', '男', '2025-03-09');
INSERT INTO `user` VALUES (3, 'user2', '222222', '男', '2025-03-14');
INSERT INTO `user` VALUES (6, 'zzr', '111111', '男', '2025-03-22');
INSERT INTO `user` VALUES (7, '123', '123', '男', '2025-03-22');
INSERT INTO `user` VALUES (12, '456', '456', '男', '2025-03-22');
INSERT INTO `user` VALUES (20, 'lc', '123', '男', '2025-03-22');
INSERT INTO `user` VALUES (33, 'lb', '123', '男', '2025-03-22');
INSERT INTO `user` VALUES (36, 'luobiao', '123', '男', '2025-03-22');
INSERT INTO `user` VALUES (37, 'muya', '123', '女', '2025-03-22');
INSERT INTO `user` VALUES (38, 'a', 'a', '男', '2025-04-19');

SET FOREIGN_KEY_CHECKS = 1;
