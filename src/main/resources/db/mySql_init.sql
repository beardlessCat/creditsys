/*
Navicat MySQL Data Transfer

Source Server         : credit
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : credit

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-10-19 19:33:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `COMPANY_ID` varchar(32) NOT NULL,
  `COMPANY_NAME` varchar(32) NOT NULL,
  `COMPANY_INFO` text NOT NULL,
  `COMPANY_ADDRESS` text NOT NULL,
  `COMPANY_TEL` varchar(32) NOT NULL,
  `COMPANY_URL` varchar(32) NOT NULL,
  `COMPANY_APTITUDE` text NOT NULL,
  `COMPANY_SIZE` varchar(32) NOT NULL,
  `COMPANY_BUSINESS` text NOT NULL,
  `COMPANY_TYPE_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('630A32FB679D46ACA22C9D8475BE8DFC', '阿里巴巴', '世界500强', '杭州', '123', 'www.alibaba.com', '100强', '8000人', '互联网', '1');
INSERT INTO `company` VALUES ('69266BAAED984E0896C25232292C8AB2', '腾讯', '世界五百强', '中国广东', '123', 'www.tencent.com', '世界500强', '1w人', '通讯，游戏', '1');
INSERT INTO `company` VALUES ('FEDB67C2AEEB41E89AC726AACBCC4BE2', '花呗', '金融世界', '北京', '343', 'www.huabei/com', '600强', '1000人', '金融', '0FE9D5F23FE14CF79A2AF26EB2063BD4');

-- ----------------------------
-- Table structure for `company_type`
-- ----------------------------
DROP TABLE IF EXISTS `company_type`;
CREATE TABLE `company_type` (
  `TYPE_ID` varchar(32) NOT NULL,
  `TYPE_NAME` varchar(32) NOT NULL,
  `TYPE_REMAKE` text NOT NULL,
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_type
-- ----------------------------
INSERT INTO `company_type` VALUES ('0FE9D5F23FE14CF79A2AF26EB2063BD4', '金融', '金融行业');
INSERT INTO `company_type` VALUES ('1', '互联网', '互联网');
INSERT INTO `company_type` VALUES ('2', '电力', '电力');
INSERT INTO `company_type` VALUES ('2C378133F56A44CE9BAC536BAED4AB7D', '33', '3');
INSERT INTO `company_type` VALUES ('3', '医疗', '金融');
INSERT INTO `company_type` VALUES ('4F03D3051924441C90AA300FDA98D255', '5', '5');
INSERT INTO `company_type` VALUES ('77329607D1C840BD8BA36B640FA1BF20', '7', '7');
INSERT INTO `company_type` VALUES ('788D1BA6160741B6A58EE17A3FB7BD20', '4', '4');
INSERT INTO `company_type` VALUES ('79339031F23D4A96B29B9F5C4E46ADD6', '1', '1');
INSERT INTO `company_type` VALUES ('A76D78D7EEAB4A6F89DCDBDCE95CE556', '2', '2');
INSERT INTO `company_type` VALUES ('C37DD93A0D9A406E97BC1459C2A7DFB7', '52', '5');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `COURSE_ID` varchar(32) NOT NULL,
  `COURSE_CODE` varchar(32) NOT NULL,
  `COURSE_NAME` varchar(16) NOT NULL,
  `COURSE_PERIOD` varchar(16) NOT NULL,
  `COURSE_REQUIRE` text NOT NULL,
  `COURSE_SCORE` varchar(32) NOT NULL,
  `COURSE_FORM` varchar(32) NOT NULL,
  `COURSE_REFER` text NOT NULL,
  `COURSE_FEED` text NOT NULL,
  `COURSE_CREDIT` varchar(10) NOT NULL,
  `COURSE_CHECKED` varchar(16) NOT NULL,
  `PD_LESSON` varchar(10) NOT NULL,
  `PL_LESSON` varchar(10) NOT NULL,
  `COURSE_PROPERTY` varchar(32) NOT NULL,
  `PD_TEST` varchar(16) NOT NULL,
  PRIMARY KEY (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1412201705261005696', 'bcjs', '编程技术', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2', '1');
INSERT INTO `course` VALUES ('1439201705032105196', 'C++', 'C++', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `course` VALUES ('2055201705082205649', 'xhw', '无线网络', '48', '实验', 'dfg', '笔试', '发给', 'sdf', '3', 'dfg', '24', '24', '专业限选课', '12');
INSERT INTO `course` VALUES ('2765201705261005616', 'GDSX', '高等数学', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '基础必修课', '1');
INSERT INTO `course` VALUES ('3422201705041405702', 'WLBC', '网络编程', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2', '1');
INSERT INTO `course` VALUES ('3715201705261005949', 'WLAN', '网络安全', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业必修课', '1');
INSERT INTO `course` VALUES ('3811201705032105230', 'HTML', 'web开发基础', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4');
INSERT INTO `course` VALUES ('4157201705032105108', 'WEB', 'WEB应用开发', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '专业任选课', '5');
INSERT INTO `course` VALUES ('4165201705261005775', 'DXYY', '大学英语', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '4890201705261005249', '1');
INSERT INTO `course` VALUES ('4353201706192206788', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '8623201705110905787', '1');
INSERT INTO `course` VALUES ('4354201705032105593', 'C', 'C', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业任选课', '1');
INSERT INTO `course` VALUES ('4633201705261005145', 'SJFX', '数据分析', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业限选课', '1');
INSERT INTO `course` VALUES ('5874201705032105170', 'JAVA', 'JAVA', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '2', '3');
INSERT INTO `course` VALUES ('6162201705261005194', 'SJYS', '数据运算', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业限选课', '1');
INSERT INTO `course` VALUES ('625120170504140540', 'JS', 'html基础', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业任选课', '1');
INSERT INTO `course` VALUES ('7123201705261005105', 'SJMS', '设计模式', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业限选课', '1');
INSERT INTO `course` VALUES ('8753201705261005214', 'SJJG', '数据结构', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业必修课', '1');
INSERT INTO `course` VALUES ('9123201705041705865', 'GDJSJWL', '高等计算机网络', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '专业限选课', '1');
INSERT INTO `course` VALUES ('9430201705261005592', 'DXSJY', '大学生就业指导', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '基础选修课', '1');
INSERT INTO `course` VALUES ('9720201705041405897', 'JSJWL', '计算机网络', '64', '必修', '平时成绩+考试成绩', '闭卷', '《计算机网络》', '1', '3', '笔试', '1', '1', '2', '1');

-- ----------------------------
-- Table structure for `course_depend`
-- ----------------------------
DROP TABLE IF EXISTS `course_depend`;
CREATE TABLE `course_depend` (
  `DEPEND_ID` varchar(32) NOT NULL,
  `COURSE_PID` varchar(32) DEFAULT NULL,
  `COURSE_SID` varchar(32) NOT NULL,
  `MAJOR_ID` varchar(32) NOT NULL,
  `COURSE_NAME` varchar(32) DEFAULT NULL,
  `IS_NES` varchar(32) DEFAULT NULL,
  `COURSE_PNAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`DEPEND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_depend
-- ----------------------------
INSERT INTO `course_depend` VALUES ('148020170526100505', '0', '4354201705032105593', '11111', 'C', 'checked', '0');
INSERT INTO `course_depend` VALUES ('1557201706122106623', '9720201705041405897', '3422201705041405702', '11111', '网络编程', 'checked', '计算机网络');
INSERT INTO `course_depend` VALUES ('3241201706192206599', '0', '4165201705261005775', '11111', '大学英语', 'checked', '0');
INSERT INTO `course_depend` VALUES ('4109201710171610532', '8753201705261005214', '9720201705041405897', '11111', '计算机网络', 'checked', '数据结构');
INSERT INTO `course_depend` VALUES ('4434201705261005764', '0', '1412201705261005696', '11111', '编程技术', 'checked', '0');
INSERT INTO `course_depend` VALUES ('4693201705261005241', '0', '6162201705261005194', '11111', '数据运算', 'checked', '0');
INSERT INTO `course_depend` VALUES ('4864201705261005667', '0', '9430201705261005592', '11111', '大学生就业指导', 'checked', '0');
INSERT INTO `course_depend` VALUES ('5027201705261005834', '4354201705032105593', '5874201705032105170', '11111', 'JAVA', 'checked', 'C');
INSERT INTO `course_depend` VALUES ('5785201705261005736', '0', '2765201705261005616', '11111', '高等数学', 'checked', '0');
INSERT INTO `course_depend` VALUES ('6259201705261005190', '3422201705041405702', '2055201705082205649', '11111', '无线网络', 'checked', '网络编程');
INSERT INTO `course_depend` VALUES ('6332201706192206851', '0', '4353201706192206788', '11111', '1', 'checked', '0');
INSERT INTO `course_depend` VALUES ('6734201706122106469', '0', '625120170504140540', '11111', 'html基础', 'checked', '0');
INSERT INTO `course_depend` VALUES ('7223201705261005265', '0', '8753201705261005214', '11111', '数据结构', 'checked', '0');
INSERT INTO `course_depend` VALUES ('7348201705261005998', '0', '3715201705261005949', '11111', '网络安全', 'checked', '0');
INSERT INTO `course_depend` VALUES ('7424201706122106869', '3811201705032105230', '4157201705032105108', '11111', 'WEB应用开发', 'checked', 'web开发基础');
INSERT INTO `course_depend` VALUES ('7543201705261005899', '1439201705032105196', '5874201705032105170', '11111', 'JAVA', 'checked', 'C++');
INSERT INTO `course_depend` VALUES ('7691201706122106752', '625120170504140540', '3811201705032105230', '11111', 'web开发基础', 'checked', 'html基础');
INSERT INTO `course_depend` VALUES ('8245201705261005743', '9720201705041405897', '9123201705041705865', '11111', '高等计算机网络', 'checked', '计算机网络');
INSERT INTO `course_depend` VALUES ('8650201706122106828', '5874201705032105170', '4157201705032105108', '11111', 'WEB应用开发', 'checked', 'JAVA');
INSERT INTO `course_depend` VALUES ('8837201705261005152', '0', '7123201705261005105', '11111', '设计模式', 'checked', '0');
INSERT INTO `course_depend` VALUES ('9154201705261005198', '0', '4633201705261005145', '11111', '数据分析', 'checked', '0');
INSERT INTO `course_depend` VALUES ('9983201705261005850', '0', '1439201705032105196', '11111', 'C++', 'checked', '0');

-- ----------------------------
-- Table structure for `course_relation`
-- ----------------------------
DROP TABLE IF EXISTS `course_relation`;
CREATE TABLE `course_relation` (
  `SR_ID` varchar(32) NOT NULL,
  `SR_PID` varchar(32) NOT NULL,
  `SR_NAME` varchar(32) NOT NULL,
  `SR_TYPE` varchar(32) NOT NULL,
  `SR_DATE` varchar(32) DEFAULT NULL,
  `SR_IS_NESS` varchar(32) DEFAULT NULL,
  `SR_PROPERTY` text,
  `SR_OTHER_ID` varchar(32) NOT NULL,
  `SR_REMAKE` text,
  PRIMARY KEY (`SR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_relation
-- ----------------------------
INSERT INTO `course_relation` VALUES ('1038201705032105530', '5483201705032105501', 'C++\\输出语句', '3', '1', '1', '1', '2814201705032105553', '1');
INSERT INTO `course_relation` VALUES ('1207201705032105831', '4745201705032105839', 'IO', '3', '1', '1', '1', '1508201705032105969', '1');
INSERT INTO `course_relation` VALUES ('1221201705032105844', '5408201705032105243', '二（C++）', '2', 'q', 'q', 'q', '4695201705032105226', '精通');
INSERT INTO `course_relation` VALUES ('1232201705032105910', '1221201705032105844', 'C++程序开发', '3', '1', '1', '1', '4000201705032105703', '1');
INSERT INTO `course_relation` VALUES ('1289201705032105348', '4714201705032105573', 'Cweb桌面开发', '3', '1', '1', '1', '7949201705032105623', '4');
INSERT INTO `course_relation` VALUES ('1519201706122106290', '5233201705261005236', '图', '2', null, null, null, '2813201706122106241', '图');
INSERT INTO `course_relation` VALUES ('1539201705261005216', '0', '数据运算', '1', '1', '1', '专业限选课', '6162201705261005194', null);
INSERT INTO `course_relation` VALUES ('1681201705032105517', '1793201705032105137', '二（web）', '2', 'q', 'q', 'q', '9814201705032105308', '精通');
INSERT INTO `course_relation` VALUES ('1787201705032105259', '0', 'web开发基础', '1', '4', '4', '4', '3811201705032105230', null);
INSERT INTO `course_relation` VALUES ('1793201705032105137', '0', 'WEB应用开发', '1', '5', '5', '专业任选课', '4157201705032105108', null);
INSERT INTO `course_relation` VALUES ('1926201705261005731', '0', '编程技术', '1', '1', '1', '专业限选课', '1412201705261005696', null);
INSERT INTO `course_relation` VALUES ('2024201706122106952', '8914201706122106649', '多线程', '3', null, null, null, '7703201706122106593', '多线程');
INSERT INTO `course_relation` VALUES ('2105201705261005976', '0', '网络安全', '1', '1', '1', '专业必修课', '3715201705261005949', null);
INSERT INTO `course_relation` VALUES ('2178201705032105278', '4745201705032105839', '多态', '3', '1', '1', '1', '1276201705032105369', '1');
INSERT INTO `course_relation` VALUES ('2482201705032105768', '1787201705032105259', '一(html)', '2', 'q', 'q', 'q', '3335201705032105859', '入门');
INSERT INTO `course_relation` VALUES ('2635201706122106833', '1519201706122106290', '深度优先遍历', '3', null, null, null, '1528201706122106966', '深度优先遍历');
INSERT INTO `course_relation` VALUES ('2897201705032105967', '3406201705032105437', 'web--spring', '3', '1', '1', '1', '5510201705032105568', '1');
INSERT INTO `course_relation` VALUES ('3088201705032105881', '9326201705032105199', 'C循环', '3', '1', '1', '1', '2565201705032105121', '1');
INSERT INTO `course_relation` VALUES ('3299201705032105113', '1681201705032105517', 'web ssm', '3', '1', '1', '1', '2167201705032105301', '1');
INSERT INTO `course_relation` VALUES ('3372201705041405543', '5446201705041405952', '物理层', '3', '1', '1', '1', '2120201705041405367', '1');
INSERT INTO `course_relation` VALUES ('3392201705041405732', '0', '网络编程', '1', '1', '1', '专业必修课', '3422201705041405702', null);
INSERT INTO `course_relation` VALUES ('3406201705032105437', '1793201705032105137', '一（web）', '2', 'q', 'q', 'q', '2726201705032105625', '入门');
INSERT INTO `course_relation` VALUES ('4281201705032105407', '8958201705032105211', '网络编程', '2', 'q', 'q', 'q', '2698201705032105577', '精通');
INSERT INTO `course_relation` VALUES ('4315201705032105701', '6282201705032105701', 'js使用', '3', '1', '1', '1', '9759201705032105882', '1');
INSERT INTO `course_relation` VALUES ('4660201706192206823', '0', '1', '1', '1', '1', '8623201705110905787', '4353201706192206788', null);
INSERT INTO `course_relation` VALUES ('4714201705032105573', '6167201705032105631', '二（c）', '2', 'q', 'q', 'q', '8591201705032105593', '精通');
INSERT INTO `course_relation` VALUES ('4745201705032105839', '8958201705032105211', 'javaSE', '2', 'q', 'q', 'q', '2600201705032105877', '入门');
INSERT INTO `course_relation` VALUES ('486120170612210667', '5446201705041405952', 'TCP', '3', null, null, null, '3142201706122106979', 'TCP');
INSERT INTO `course_relation` VALUES ('5233201705261005236', '0', '数据结构', '1', '1', '1', '专业必修课', '8753201705261005214', null);
INSERT INTO `course_relation` VALUES ('5285201706122106644', '1519201706122106290', '广度优先遍历', '3', null, null, null, '4756201706122106975', '广度优先遍历');
INSERT INTO `course_relation` VALUES ('5358201705032105765', '5483201705032105501', 'C++打印语句', '3', '1', '1', '1', '1502201705032105594', '2');
INSERT INTO `course_relation` VALUES ('5408201705032105243', '0', 'C++', '1', '2', '2', '专业限选课', '1439201705032105196', null);
INSERT INTO `course_relation` VALUES ('5446201705041405952', '5724201705041405963', '第一章', '2', '1', '1', '1', '4956201705041405732', '物理层');
INSERT INTO `course_relation` VALUES ('5483201705032105501', '5408201705032105243', '一（C++）', '2', 'q', 'q', 'q', '6854201705032105425', '入门');
INSERT INTO `course_relation` VALUES ('5585201705082205678', '0', '无线网络', '1', '48', '实验', '专业限选课', '2055201705082205649', null);
INSERT INTO `course_relation` VALUES ('5724201705041405963', '0', '计算机网络', '1', '64', '必修', '2', '9720201705041405897', null);
INSERT INTO `course_relation` VALUES ('5859201705032105580', '9326201705032105199', 'C输出语句', '3', '1', '1', '1', '1367201705032105881', '1');
INSERT INTO `course_relation` VALUES ('5931201705032105212', '4281201705032105407', 'socket', '3', '1', '1', '1', '5396201705032105785', '1');
INSERT INTO `course_relation` VALUES ('6010201705032105420', '1681201705032105517', 'ssh', '3', '1', '1', '1', '4876201705032105202', '122');
INSERT INTO `course_relation` VALUES ('6095201705261005126', '0', '设计模式', '1', '1', '1', '专业限选课', '7123201705261005105', null);
INSERT INTO `course_relation` VALUES ('6167201705032105631', '0', 'C', '1', '1', '1', '专业任选课', '4354201705032105593', null);
INSERT INTO `course_relation` VALUES ('625720170503210530', '2482201705032105768', 'html使用', '3', '1', '1', '1', '589120170503210537', '2');
INSERT INTO `course_relation` VALUES ('6276201706122106996', '5446201705041405952', 'UDP', '3', null, null, null, '2159201706122106938', 'UDP');
INSERT INTO `course_relation` VALUES ('6282201705032105701', '1787201705032105259', '二(html)', '2', 'q', 'q', 'q', '4286201705032105208', '精通');
INSERT INTO `course_relation` VALUES ('633220170612210621', '8971201706122106277', '广度优先遍历', '3', null, null, null, '4756201706122106975', '广度优先遍历');
INSERT INTO `course_relation` VALUES ('6373201705032105748', '3406201705032105437', 'web功能', '3', '1', '1', '1', '1686201705032105784', '1');
INSERT INTO `course_relation` VALUES ('6491201705261005799', '0', '大学英语', '1', '1', '1', '4890201705261005249', '4165201705261005775', null);
INSERT INTO `course_relation` VALUES ('6793201705032105846', '4281201705032105407', 'java多线程', '3', '1', '1', '1', '8784201705032105319', '3');
INSERT INTO `course_relation` VALUES ('718520170504140564', '0', 'html基础', '1', '1', '1', '专业任选课', '625120170504140540', null);
INSERT INTO `course_relation` VALUES ('7223201706122106719', '5446201705041405952', 'socket', '3', null, null, null, '2923201706122106664', 'socket');
INSERT INTO `course_relation` VALUES ('7777201705032105278', '1221201705032105844', 'C++内核开发', '3', '1', '1', '1', '9489201705032105887', '3');
INSERT INTO `course_relation` VALUES ('7820201705261005625', '0', '大学生就业指导', '1', '1', '1', '基础选修课', '9430201705261005592', null);
INSERT INTO `course_relation` VALUES ('7826201706122106781', '8971201706122106277', 'socket', '3', null, null, null, '2923201706122106664', 'socket');
INSERT INTO `course_relation` VALUES ('7844201705261005168', '0', '数据分析', '1', '1', '1', '专业限选课', '4633201705261005145', null);
INSERT INTO `course_relation` VALUES ('7998201705032105228', '4714201705032105573', 'Cweb开发', '3', '1', '1', '1', '737020170503210505', '3');
INSERT INTO `course_relation` VALUES ('8505201705032105555', '6282201705032105701', '网站部署', '3', '1', '1', '1', '4185201705032105600', '1');
INSERT INTO `course_relation` VALUES ('8635201705251805566', '5724201705041405963', '阿萨德', '2', null, null, null, '2464201705251805328', '阿萨德');
INSERT INTO `course_relation` VALUES ('8795201705191305220', '5446201705041405952', 'java循环', '3', '48', '是', '专业必修课', '1508201705032105969', '1');
INSERT INTO `course_relation` VALUES ('8914201706122106649', '3392201705041405732', '多线程1', '2', null, null, null, '2807201706122106398', '多线程');
INSERT INTO `course_relation` VALUES ('8917201705261005678', '0', '高等数学', '1', '1', '1', '基础必修课', '2765201705261005616', null);
INSERT INTO `course_relation` VALUES ('8958201705032105211', '0', 'JAVA', '1', '3', '3', '专业任选课', '5874201705032105170', null);
INSERT INTO `course_relation` VALUES ('8971201706122106277', '3392201705041405732', 'socket', '2', null, null, null, '8305201706122106367', 'socket通信');
INSERT INTO `course_relation` VALUES ('9254201705032105848', '2482201705032105768', 'html的展示', '3', '1', '1', '1', '7567201705032105551', '1');
INSERT INTO `course_relation` VALUES ('9326201705032105199', '6167201705032105631', '一（c）', '2', 'q', 'q', 'q', '929720170503210504', '入门');
INSERT INTO `course_relation` VALUES ('9729201706122106955', '5483201705032105501', '多线程', '3', null, null, null, '6856201706122106895', '多线程');
INSERT INTO `course_relation` VALUES ('9731201705041705887', '0', '高等计算机网络', '1', '1', '1', '专业限选课', '9123201705041705865', null);

-- ----------------------------
-- Table structure for `course_type`
-- ----------------------------
DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `CTYPE_ID` varchar(32) NOT NULL,
  `CTYPE_NAME` varchar(128) NOT NULL,
  `CTYPE_DESC` text,
  PRIMARY KEY (`CTYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_type
-- ----------------------------
INSERT INTO `course_type` VALUES ('2', '专业必修课', '专业必修课');
INSERT INTO `course_type` VALUES ('3658201705110905184', '专业限选课', '专业限选课');
INSERT INTO `course_type` VALUES ('4890201705261005249', '公共选修课', '公共选修课');
INSERT INTO `course_type` VALUES ('5099201705261005413', '基础必修课', '基础必修课');
INSERT INTO `course_type` VALUES ('8623201705110905787', '专业任选课', '专业任选课');

-- ----------------------------
-- Table structure for `cultivatescheme`
-- ----------------------------
DROP TABLE IF EXISTS `cultivatescheme`;
CREATE TABLE `cultivatescheme` (
  `CULTIVATE_ID` varchar(32) NOT NULL COMMENT '培养方案id',
  `MAJOR_ID` varchar(32) NOT NULL COMMENT '专业id',
  `CULTIVATE_BUSINESS` text NOT NULL COMMENT '业务培养目标',
  `CULTIVATE_SKILLS` text NOT NULL COMMENT '能力技能',
  `CULTIVATE_PROCESS` text NOT NULL COMMENT '教学环节',
  `CULTIVATE_PERCENT` varchar(8) NOT NULL COMMENT '学时学分比例',
  `CULTIVATE_STANDARD` text NOT NULL COMMENT '毕业标准',
  `CULTIVATE_LEAST_STUDY_TIME` varchar(8) NOT NULL COMMENT '最少学习年限',
  `CULTIVATE_MOST_STUDY_TIME` varchar(8) NOT NULL COMMENT '最多学习年限',
  `CULTIVATE_INNOVATE_SCORE` varchar(8) NOT NULL COMMENT '创新学分',
  `CULTIVATE_ALL_COURSE_PERIOD` varchar(8) NOT NULL COMMENT '课程总学时',
  `CULTIVATE_ALL_COURSE_SCORE` varchar(8) NOT NULL COMMENT '课程总学分',
  `CULTIVATE_MAJOR_OPT_SCORE` varchar(8) NOT NULL COMMENT '专业任选课学分',
  `CULTIVATE_PUBLIC_OPT_SCORE` varchar(8) NOT NULL COMMENT '公共选修课学分',
  `CULTIVATE_REQ_COURSE_PERIOD` varchar(8) NOT NULL COMMENT '必修课学时',
  `CULTIVATE_REQ_COURSE_SCORE` varchar(8) NOT NULL COMMENT '必修课学分',
  `CULTIVATE_OPT_PERIOD` varchar(8) NOT NULL COMMENT '选修课学时',
  `CULTIVATE_OPT_SCORE` varchar(8) NOT NULL COMMENT '选修课学分',
  `CULTIVATE_THEORY_PERIOD` varchar(8) NOT NULL COMMENT '理论教学课程学时',
  `CULTIVATE_THEORY_SCORE` varchar(8) NOT NULL COMMENT '理论教学课程学分',
  `CULTIVATE_PRACTICE_PERIOD` varchar(8) NOT NULL COMMENT '实践教学课程学时',
  `CULTIVATE_PRACTICE_SCORE` varchar(8) NOT NULL COMMENT '实践教学课程学分',
  `CULTIVATE_CENTER_SCORE` varchar(8) NOT NULL COMMENT '集中实践教学环节学分',
  PRIMARY KEY (`CULTIVATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教学方案表';

-- ----------------------------
-- Records of cultivatescheme
-- ----------------------------
INSERT INTO `cultivatescheme` VALUES ('1464201706181506723', '7376201705121205286', '1', '122', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cultivatescheme` VALUES ('1760201705141505534', '003', '4', '2', '2', '2', '4', '4', '34', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4');
INSERT INTO `cultivatescheme` VALUES ('6469201705191505557', '002', '3', '33', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3');
INSERT INTO `cultivatescheme` VALUES ('C001', '001', '222222', 'ererthrt', 'erge', 'erte', 'erte', 'sfg', 'etre', 'rgt', 'gh', 'erg', 'eg', 'rth', 'rtherg', 'trh', 'rth', 'rtherg', 'rth', '5yh', 'rtherg', '45h', '4h');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `ID` varchar(32) NOT NULL,
  `PID` varchar(32) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('0a22ff1186f24a6b9189ae0bccc37528', '9ebd264055aa4f5b9112db58c338e94e', '广告部1', 'dept');
INSERT INTO `dept` VALUES ('2c9153620f6344bda08ed1b238a4cdf0', 'e99e1e819fce4dac8054d8c42e4854ab', '业务部', 'dept');
INSERT INTO `dept` VALUES ('2f83c97cb5464890bba8291b51bd61a8', 'e99e1e819fce4dac8054d8c42e4854ab', '研发部', 'dept');
INSERT INTO `dept` VALUES ('33f0fbc0243743cfa615714b1764fcf7', 'da7b002944dd41d0bf7c00120b94bb48', '财务部', 'dept');
INSERT INTO `dept` VALUES ('3b70590f02e1486a967b2eb3463d024c', '779df9d28040485781768a08ead27567', '活动部', 'dept');
INSERT INTO `dept` VALUES ('779df9d28040485781768a08ead27567', 'e99e1e819fce4dac8054d8c42e4854ab', '企划部', 'dept');
INSERT INTO `dept` VALUES ('7ac8139930fb4a5fb4fd5412e2aa87bf', 'e99e1e819fce4dac8054d8c42e4854ab', '销售部', 'dept');
INSERT INTO `dept` VALUES ('9ebd264055aa4f5b9112db58c338e94e', 'df6253b3095c4d2c8083ef9cd4074b40', '广告部', 'dept');
INSERT INTO `dept` VALUES ('b7091fb6a38149079d07911d4b5a9537', '9ebd264055aa4f5b9112db58c338e94e', '广告部2', 'dept');
INSERT INTO `dept` VALUES ('da7b002944dd41d0bf7c00120b94bb48', 'e99e1e819fce4dac8054d8c42e4854ab', '运营部', 'dept');
INSERT INTO `dept` VALUES ('df6253b3095c4d2c8083ef9cd4074b40', '33f0fbc0243743cfa615714b1764fcf7', '策划部', 'dept');
INSERT INTO `dept` VALUES ('e99e1e819fce4dac8054d8c42e4854ab', '00000000000000000000000000000000', '示例单位', 'unit');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `MAJOR_ID` varchar(32) NOT NULL COMMENT '专业id',
  `MAJOR_CODE` varchar(32) DEFAULT NULL COMMENT '专业代码',
  `MAJOR_NAME` varchar(64) DEFAULT NULL COMMENT '专业名称',
  `MAJOR_ENGLISH_NAME` varchar(64) DEFAULT NULL COMMENT '专业英文名称',
  `MAJOR_LENGTH` varchar(8) DEFAULT NULL COMMENT '学制',
  `MAJOR_DEGREE` varchar(8) DEFAULT NULL COMMENT '学位',
  `MAJOR_ACADEMY` varchar(32) DEFAULT NULL COMMENT '所属学院',
  `MAJOR_PURPOSE` text COMMENT '培养目标',
  `MAJOR_CONDITION` text COMMENT '教学条件',
  `MAJOR_OVERVIEW` text COMMENT '专业概述',
  PRIMARY KEY (`MAJOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专业表';

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('001', 'JSJ001', '网络工程', 'fdb', '4', 'sdv', 'E438D7BABA384CC3B229FEBC0AAADBBF', 'dfb', 'bdf', 'gbhrt');
INSERT INTO `major` VALUES ('002', 'JSJ002', '计算机科学', 'fdb', 'sdv', 'sdv', '1184A6C96E1D4F1380154618FA48A71D', 'dfb', 'bdf', 'gbhrt');
INSERT INTO `major` VALUES ('003', 'JSJ003', '软件测试', 'fdb', 'sdv', 'sdv', 'BDCA93ABE30C4862B4FA8A1BF0136082', 'dfb', 'bdf', 'gbhrt');
INSERT INTO `major` VALUES ('5440201705091405622', 'JSJ004', '软件工程', 'fdb', 'sdv', 'sdv', '5', 'dfb', 'bdf', 'gbhrt');
INSERT INTO `major` VALUES ('7376201705121205286', 'JSJ005', '工商管理', 'sdsfsf', '4', '学士', 'FF135F712BF24C9D97F188D9020BBD7F', 'sdfgs', 'fdg', '暗示的该sdf');

-- ----------------------------
-- Table structure for `major_direct`
-- ----------------------------
DROP TABLE IF EXISTS `major_direct`;
CREATE TABLE `major_direct` (
  `MAJOR_DIRECT_ID` varchar(32) NOT NULL,
  `MAJOR_DIRECT_NAME` varchar(128) NOT NULL,
  `MAJOR_DIRECT_DESC` text NOT NULL,
  `MAJOR_ID` text NOT NULL,
  PRIMARY KEY (`MAJOR_DIRECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_direct
-- ----------------------------
INSERT INTO `major_direct` VALUES ('2', '数据中心技术', 'HAHAH', '001');
INSERT INTO `major_direct` VALUES ('3', '网络应用开发', '3', '002');
INSERT INTO `major_direct` VALUES ('3253201705111005564', '编程开发技术', 'q', '003');

-- ----------------------------
-- Table structure for `paper`
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `PAPER_NAME` varchar(32) NOT NULL,
  `PAPER_ID` varchar(32) NOT NULL,
  `COURSE_PAPER_ID` varchar(32) NOT NULL,
  `MAJOR_PAPER_ID` varchar(32) NOT NULL,
  `TERM_MARK` varchar(8) NOT NULL,
  `TOTAL_RESULT` varchar(4) NOT NULL,
  `RESULT_MAX` varchar(4) NOT NULL,
  `RESULT_DESC` text NOT NULL,
  `RESULT_MIN` varchar(4) NOT NULL,
  `USER_TOTAL` varchar(4) NOT NULL,
  `HARD_DEGREE` varchar(3) NOT NULL,
  `PAPER_CODE` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`PAPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('JAVA 开发', '2681201704121504773', '5874201705032105170', '网络工程', '2017', '100', '100', '理想', '60', '70', '难', 'WLGH');
INSERT INTO `paper` VALUES ('计算机网络', '5276201704112204689', '9720201705041405897', '网络工程', '2013', '100', '100', '不理想', '100', '70', '难', 'JSJWL');

-- ----------------------------
-- Table structure for `paper_detial`
-- ----------------------------
DROP TABLE IF EXISTS `paper_detial`;
CREATE TABLE `paper_detial` (
  `DETIAL_ID` varchar(32) NOT NULL,
  `DETIAL_PAPERID` varchar(32) NOT NULL,
  `DETIAL_TYPE` varchar(32) NOT NULL,
  `DETIAL_DESC` text NOT NULL,
  `DETIAL_RESULT` varchar(5) NOT NULL,
  `DETIAL_RATE` varchar(5) DEFAULT NULL,
  `DETIAL_DEGREE` varchar(5) NOT NULL,
  `DETIAL_NAME` varchar(32) NOT NULL,
  PRIMARY KEY (`DETIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_detial
-- ----------------------------
INSERT INTO `paper_detial` VALUES ('1304201705252105259', '5276201704112204689', '选择题', '物理层', '10', null, '难', '5');
INSERT INTO `paper_detial` VALUES ('2357201705252105367', '5276201704112204689', '计算题', '计算题', '20', null, '难', '6');
INSERT INTO `paper_detial` VALUES ('3192201705252105249', '5276201704112204689', '选择题', 'udp', '10', null, '简单', '2');
INSERT INTO `paper_detial` VALUES ('5022201705252105691', '5276201704112204689', '选择题', '链路层', '10', null, '难', '4');
INSERT INTO `paper_detial` VALUES ('6078201705252105242', '5276201704112204689', '选择题', 'tcp', '10', null, '简单', '1');
INSERT INTO `paper_detial` VALUES ('7180201705252105724', '5276201704112204689', '选择题', 'ftp', '10', null, '简单', '3');
INSERT INTO `paper_detial` VALUES ('9351201705252105196', '5276201704112204689', '综合题', '考察综合能力', '30', null, '难', '7');

-- ----------------------------
-- Table structure for `paper_relation`
-- ----------------------------
DROP TABLE IF EXISTS `paper_relation`;
CREATE TABLE `paper_relation` (
  `PR_ID` varchar(32) NOT NULL,
  `PR_PID` varchar(32) NOT NULL,
  `TYPE` varchar(32) DEFAULT NULL,
  `PR_NAME` varchar(32) NOT NULL,
  `PR_TYPE` varchar(32) DEFAULT NULL,
  `PR_DESC` text,
  `PR_SCORE` varchar(32) DEFAULT NULL,
  `PR_HARD` varchar(32) DEFAULT NULL,
  `PR_RATE` varchar(32) DEFAULT NULL,
  `OTHER_ID` varchar(32) DEFAULT NULL,
  `PR_INDEX` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`PR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_relation
-- ----------------------------
INSERT INTO `paper_relation` VALUES ('1689201705252105405', '9942201705252105859', '3', '7', '综合题', '考察综合能力', '20', '难', null, '9351201705252105196', '7');
INSERT INTO `paper_relation` VALUES ('2048201705252105908', '2405201704112204239', '3', '1', '选择题', 'tcp', '10', '简单', null, '6078201705252105242', '1');
INSERT INTO `paper_relation` VALUES ('2405201704112204239', '5974201704112204723', '2', '一：', '选择', '选择', '10', '难', null, null, '1');
INSERT INTO `paper_relation` VALUES ('3817201705252105987', '8212201704112204171', '3', '6', '计算题', '计算题', '30', '难', null, '2357201705252105367', '6');
INSERT INTO `paper_relation` VALUES ('410620170412150438', '6469201704121504865', '2', '一：', '选择题', '选择题', '20', '简单', '100%', null, '1');
INSERT INTO `paper_relation` VALUES ('4239201705252105462', '2405201704112204239', '3', '3', '选择题', 'ftp', '10', '简单', null, '7180201705252105724', '3');
INSERT INTO `paper_relation` VALUES ('4279201705252105361', '2405201704112204239', '3', '4', '选择题', '链路层', '10', '难', null, '5022201705252105691', '4');
INSERT INTO `paper_relation` VALUES ('4635201704121504893', '6469201704121504865', '2', '二：', '填空题', '填空', '100', '难', '1', null, '2');
INSERT INTO `paper_relation` VALUES ('5974201704112204723', '0', '1', '计算机网络', null, null, null, null, null, '5276201704112204689', null);
INSERT INTO `paper_relation` VALUES ('6469201704121504865', '0', '1', 'JAVA 开发', null, null, null, null, null, '2681201704121504773', null);
INSERT INTO `paper_relation` VALUES ('728720170525210525', '2405201704112204239', '3', '2', '选择题', 'udp', '10', '简单', null, '3192201705252105249', '2');
INSERT INTO `paper_relation` VALUES ('8212201704112204171', '5974201704112204723', '2', '二：', '填空', '填空', '12', '难', null, null, '2');
INSERT INTO `paper_relation` VALUES ('8941201705252105755', '2405201704112204239', '3', '5', '选择题', '物理层', '10', '难', null, '1304201705252105259', '5');
INSERT INTO `paper_relation` VALUES ('9942201705252105859', '5974201704112204723', '2', '三', '综合题', null, '40', '难', null, null, '3');

-- ----------------------------
-- Table structure for `plan_relation`
-- ----------------------------
DROP TABLE IF EXISTS `plan_relation`;
CREATE TABLE `plan_relation` (
  `PR_ID` varchar(32) NOT NULL,
  `PR_PID` varchar(32) NOT NULL,
  `PR_NAME` varchar(128) NOT NULL,
  `PR_TYPE` varchar(8) DEFAULT NULL,
  `PR_CODE` varchar(100) DEFAULT NULL,
  `PR_DEPT` varchar(100) DEFAULT NULL,
  `MAJOR_ID` varchar(32) DEFAULT NULL,
  `ACTUAL_CREDIT` varchar(100) DEFAULT NULL,
  `CHARGE_CRERDIT` varchar(100) DEFAULT NULL,
  `CHECK_STYLE` varchar(100) DEFAULT NULL,
  `TOTAL_PERIOD` varchar(100) DEFAULT NULL,
  `TALK_PERIOD` varchar(100) DEFAULT NULL,
  `COMP_PERIOD` varchar(100) DEFAULT NULL,
  `TEST_PERIOD` varchar(100) DEFAULT NULL,
  `START_TERM` varchar(100) DEFAULT NULL,
  `IF_CHARGE` varchar(100) DEFAULT NULL,
  `OTHER_ID` varchar(32) DEFAULT NULL,
  `PR_DEGREE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`PR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_relation
-- ----------------------------
INSERT INTO `plan_relation` VALUES ('1', '0', '网络工程教学计划', '1', null, null, '001', null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `plan_relation` VALUES ('1305201706181706516', '5995201706181706681', '网络编程', '4', 'WLBC', '7376201705121205286', '3', '1', null, '1', null, '1', '1', '1', null, '是', '工商管理', '3422201705041405702');
INSERT INTO `plan_relation` VALUES ('1356201706181706761', '508920170618170626', '基础必修课', '2', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '5099201705261005413', '2');
INSERT INTO `plan_relation` VALUES ('1787201706181706741', '508920170618170626', '专业任选课', '2', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '8623201705110905787', '2');
INSERT INTO `plan_relation` VALUES ('1822201706181706441', '5881201706181706723', '编程开发技术', '3', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '3253201705111005564', '3');
INSERT INTO `plan_relation` VALUES ('203820170526100548', '1', '专业任选课', '2', null, null, '001', null, null, null, null, null, null, null, null, null, '8623201705110905787', '2');
INSERT INTO `plan_relation` VALUES ('2476201705261005177', '747820170526100517', '大学英语', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '4165201705261005775', '3');
INSERT INTO `plan_relation` VALUES ('2479201705261005996', '1', '专业必修课', '2', null, null, '001', null, null, null, null, null, null, null, null, null, '2', '2');
INSERT INTO `plan_relation` VALUES ('2655201705261005432', '2479201705261005996', '网络安全', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '3715201705261005949', '3');
INSERT INTO `plan_relation` VALUES ('3204201705261005719', '203820170526100548', 'JS语言', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '625120170504140540', '3');
INSERT INTO `plan_relation` VALUES ('3318201706181706703', '508920170618170626', '公共选修课', '2', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '4890201705261005249', '2');
INSERT INTO `plan_relation` VALUES ('4136201705261005790', '203820170526100548', 'html', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '3811201705032105230', '3');
INSERT INTO `plan_relation` VALUES ('4233201705261005765', '6252201705261005679', 'C++', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '1439201705032105196', '4');
INSERT INTO `plan_relation` VALUES ('4405201705261005220', '747820170526100517', '高等数学', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '2765201705261005616', '3');
INSERT INTO `plan_relation` VALUES ('4546201705261005397', '7748201705261005643', '编程技术', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '1412201705261005696', '4');
INSERT INTO `plan_relation` VALUES ('508920170618170626', '0', '工商管理教学计划', '1', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `plan_relation` VALUES ('511020170526100560', '9619201705261005520', '数据运算', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '6162201705261005194', '4');
INSERT INTO `plan_relation` VALUES ('5156201706181706496', '5995201706181706681', '编程技术', '4', 'bcjs', '7376201705121205286', '3', '1', null, '1', null, '1', '1', '1', null, '是', '工商管理', '1412201705261005696');
INSERT INTO `plan_relation` VALUES ('5204201705261005740', '203820170526100548', 'C', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '4354201705032105593', '3');
INSERT INTO `plan_relation` VALUES ('5519201705261005798', '6252201705261005679', '无线网络', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '2055201705082205649', '4');
INSERT INTO `plan_relation` VALUES ('567220170618170600', '5995201706181706681', '大学英语', '4', 'DXYY', '工商管理', '7376201705121205286', '1', null, '1', null, '1', '1', '1', null, '是', '4165201705261005775', '3');
INSERT INTO `plan_relation` VALUES ('568220170618170608', '1822201706181706441', '编程技术', '4', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '1412201705261005696', '4');
INSERT INTO `plan_relation` VALUES ('5800201706181706981', '5995201706181706681', '网络编程', '4', 'WLBC', '工商管理学院', '7376201705121205286', '1', null, '1', null, '1', '1', '1', null, '是', '3422201705041405702', '3');
INSERT INTO `plan_relation` VALUES ('5881201706181706723', '508920170618170626', '专业限选课', '2', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '3658201705110905184', '2');
INSERT INTO `plan_relation` VALUES ('5995201706181706681', '508920170618170626', '专业必修课', '2', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '2', '2');
INSERT INTO `plan_relation` VALUES ('6048201705261005506', '1', '专业限选课', '2', null, null, '001', null, null, null, null, null, null, null, null, null, '3658201705110905184', '2');
INSERT INTO `plan_relation` VALUES ('6177201705261005817', '203820170526100548', 'JAVA', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '5874201705032105170', '3');
INSERT INTO `plan_relation` VALUES ('619220170526100539', '9619201705261005520', '数据分析', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '4633201705261005145', '4');
INSERT INTO `plan_relation` VALUES ('6252201705261005679', '6048201705261005506', '网络应用开发', '3', null, null, '001', null, null, null, null, null, null, null, null, null, '3', '3');
INSERT INTO `plan_relation` VALUES ('6302201706181706512', '5881201706181706723', '网络应用开发', '3', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '3', '3');
INSERT INTO `plan_relation` VALUES ('6746201705261005767', '203820170526100548', 'WEB', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '4157201705032105108', '3');
INSERT INTO `plan_relation` VALUES ('692020170526100573', '1', '公共选修课', '2', null, null, '001', null, null, null, null, null, null, null, null, null, '4890201705261005249', '2');
INSERT INTO `plan_relation` VALUES ('747820170526100517', '1', '基础必修课', '2', null, null, '001', null, null, null, null, null, null, null, null, null, '5099201705261005413', '2');
INSERT INTO `plan_relation` VALUES ('7512201706181706389', '5881201706181706723', '数据中心技术', '3', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '2', '3');
INSERT INTO `plan_relation` VALUES ('7748201705261005643', '6048201705261005506', '编程开发技术', '3', null, null, '001', null, null, null, null, null, null, null, null, null, '3253201705111005564', '3');
INSERT INTO `plan_relation` VALUES ('8251201705261005133', '692020170526100573', '大学生就业指导', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '9430201705261005592', '3');
INSERT INTO `plan_relation` VALUES ('8526201706181706969', '1822201706181706441', '大学英语', '4', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '4165201705261005775', '4');
INSERT INTO `plan_relation` VALUES ('8706201705261005434', '7748201705261005643', '设计模式', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '7123201705261005105', '4');
INSERT INTO `plan_relation` VALUES ('9299201706181706961', '5995201706181706681', '编程技术', '4', 'bcjs', '工商管理', '7376201705121205286', '1', null, '1', null, '1', '1', '1', null, '是', '1412201705261005696', '3');
INSERT INTO `plan_relation` VALUES ('9619201705261005520', '6048201705261005506', '数据中心技术', '3', null, null, '001', null, null, null, null, null, null, null, null, null, '2', '3');
INSERT INTO `plan_relation` VALUES ('9773201705261005400', '2479201705261005996', '数据结构', '4', null, null, '001', null, null, null, null, null, null, null, null, null, '8753201705261005214', '3');
INSERT INTO `plan_relation` VALUES ('9948201706181706990', '1822201706181706441', '网络编程', '4', null, null, '7376201705121205286', null, null, null, null, null, null, null, null, null, '3422201705041405702', '4');

-- ----------------------------
-- Table structure for `point`
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point` (
  `POINT_ID` varchar(32) NOT NULL,
  `POINT_UNIT_ID` varchar(32) DEFAULT NULL,
  `POINT_NAME` text NOT NULL,
  `POINT_CONTENT` text NOT NULL,
  `POINT_REMAKE` text NOT NULL,
  PRIMARY KEY (`POINT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES ('1276201705032105369', '2600201705032105877', 'javaSwing开发', 'javaSwing开发', '1');
INSERT INTO `point` VALUES ('1367201705032105881', '929720170503210504', 'C输出语句', 'C输出语句', '1');
INSERT INTO `point` VALUES ('1502201705032105594', '6854201705032105425', 'C++打印语句', 'C++打印语句', '2');
INSERT INTO `point` VALUES ('1508201705032105969', '2600201705032105877', 'java循环', 'java循环', '1');
INSERT INTO `point` VALUES ('1528201706122106966', null, '深度优先遍历', '深度优先遍历', '深度优先遍历');
INSERT INTO `point` VALUES ('1686201705032105784', '2726201705032105625', 'web功能', 'web功能', '1');
INSERT INTO `point` VALUES ('1856201706122106418', null, 'socket', 'socket', 'socket');
INSERT INTO `point` VALUES ('2120201705041405367', '4956201705041405732', '物理层', '物理层', '1');
INSERT INTO `point` VALUES ('2159201706122106938', '4956201705041405732', 'UDP', 'UDP', 'UDP');
INSERT INTO `point` VALUES ('2167201705032105301', '9814201705032105308', 'web ssm', 'web ssm', '1');
INSERT INTO `point` VALUES ('2565201705032105121', '929720170503210504', 'C循环', 'C循环', '1');
INSERT INTO `point` VALUES ('2814201705032105553', '6854201705032105425', 'C++\\输出语句', 'C++\\输出语句', '1');
INSERT INTO `point` VALUES ('2904201706122306405', null, '1', '1', '1');
INSERT INTO `point` VALUES ('2923201706122106664', null, 'socket', 'socket', 'socket');
INSERT INTO `point` VALUES ('3142201706122106979', '4956201705041405732', 'TCP', 'TCP', 'TCP');
INSERT INTO `point` VALUES ('3143201706122306343', null, '1', '1', '1');
INSERT INTO `point` VALUES ('4000201705032105703', '4695201705032105226', 'C++程序开发', 'C++程序开发', '1');
INSERT INTO `point` VALUES ('4185201705032105600', '4286201705032105208', '网站部署', '网站部署', '1');
INSERT INTO `point` VALUES ('4756201706122106975', null, '广度优先遍历', '广度优先遍历', '广度优先遍历');
INSERT INTO `point` VALUES ('4876201705032105202', '9814201705032105308', 'ssh', 'ssh', '122');
INSERT INTO `point` VALUES ('5396201705032105785', '2698201705032105577', 'java 网络编程', 'java 网络编程', '1');
INSERT INTO `point` VALUES ('5510201705032105568', '2726201705032105625', 'web--spring', 'web--spring', '1');
INSERT INTO `point` VALUES ('589120170503210537', '3335201705032105859', 'html使用', 'html使用', '2');
INSERT INTO `point` VALUES ('737020170503210505', '8591201705032105593', 'Cweb开发', 'Cweb开发', '3');
INSERT INTO `point` VALUES ('7567201705032105551', '3335201705032105859', 'html的展示', 'html的展示', '1');
INSERT INTO `point` VALUES ('7703201706122106593', null, '多线程', '多线程', '多线程');
INSERT INTO `point` VALUES ('7949201705032105623', '8591201705032105593', 'Cweb桌面开发', 'Cweb桌面开发', '4');
INSERT INTO `point` VALUES ('8784201705032105319', '2698201705032105577', 'java多线程', 'java多线程', '3');
INSERT INTO `point` VALUES ('9489201705032105887', '4695201705032105226', 'C++内核开发', 'C++内核开发', '3');
INSERT INTO `point` VALUES ('9759201705032105882', '4286201705032105208', 'js使用', 'js使用', '1');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `POSITION_ID` varchar(32) NOT NULL,
  `POSITION_NAME` varchar(10) NOT NULL,
  `POSITION_DESC` text NOT NULL,
  `POSITION_SALARY` varchar(8) NOT NULL,
  `POSITION_REMAKE` text NOT NULL,
  PRIMARY KEY (`POSITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('63974D27834441BB8A2B5D7441C85DC7', 'python', '网络爬虫技术', '10K', 'Python');
INSERT INTO `position` VALUES ('959A28E40F754F869559A32A9BBD4C4E', 'ios', '苹果ios系统的开发', '7k', 'ios开发');
INSERT INTO `position` VALUES ('9BE3FEA7D2F64343B6D20F7D37B90D99', 'android', '进行智能app的开发1', '9k', 'android开发');
INSERT INTO `position` VALUES ('E636CED2F23A4F068FD10773658CE7CF', 'java工程师', '进行javaweb系统的开发', '6k', 'java');

-- ----------------------------
-- Table structure for `relation`
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `RELATION_ID` varchar(32) NOT NULL,
  `RELATION_PID` varchar(32) NOT NULL,
  `RELATION_RES` varchar(32) NOT NULL,
  `RELATION_TYPE` varchar(32) NOT NULL,
  `RELATION_REMAIN` text,
  `RELATION_REMAKE` text,
  `OTHER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RELATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES ('2165201706122106807', '2392201706122106467', 'web ssm', '4', '熟练掌握', '熟练掌握', '2167201705032105301');
INSERT INTO `relation` VALUES ('2248201706122106804', '2615201706122106792', '广度优先遍历', '4', '熟练掌握', '熟练掌握', '4756201706122106975');
INSERT INTO `relation` VALUES ('2392201706122106467', '9503201704131004601', '开发框架', '3', '熟悉某种开发框架', null, '3');
INSERT INTO `relation` VALUES ('2615201706122106792', '9503201704131004601', '数据结构', '3', '对数据结构有一定的了解', null, 'DBC7FE9758DF4581A6DDA5EBD0513E62');
INSERT INTO `relation` VALUES ('280520170612210644', '2615201706122106792', '深度优先遍历', '4', '熟练掌握', '熟练掌握', '1528201706122106966');
INSERT INTO `relation` VALUES ('4002201704131004927', '0', '阿里巴巴', '1', '985', 'alibaba', '630A32FB679D46ACA22C9D8475BE8DFC');
INSERT INTO `relation` VALUES ('4580201706122106354', '7642201706122106129', 'html使用', '4', '熟练掌握', '熟练掌握', '589120170503210537');
INSERT INTO `relation` VALUES ('5567201706122106793', '6455201706122106514', '多线程', '4', '熟练掌握', '熟练掌握', '7703201706122106593');
INSERT INTO `relation` VALUES ('6455201706122106514', '9503201704131004601', '多线程', '3', '熟悉多线程', null, '1684BCA40C7F4D29A4C6D6DF9BEFDE5C');
INSERT INTO `relation` VALUES ('7023201706122206612', '2392201706122106467', 'TCP', '4', '熟练掌握', '熟练掌握', '3142201706122106979');
INSERT INTO `relation` VALUES ('7642201706122106129', '9503201704131004601', '前段技术', '3', '熟练掌握前段技术', null, '4');
INSERT INTO `relation` VALUES ('8278201706122106704', '2392201706122106467', 'ssh', '4', '熟练掌握', '熟练掌握', '4876201705032105202');
INSERT INTO `relation` VALUES ('9421201706122206593', '2392201706122106467', 'UDP', '4', '熟练掌握', '熟练掌握', '2159201706122106938');
INSERT INTO `relation` VALUES ('9503201704131004601', '4002201704131004927', 'java工程师', '2', 'java', 'java', '630A32FB679D46ACA22C9D8475BE8DFC');

-- ----------------------------
-- Table structure for `result_detial`
-- ----------------------------
DROP TABLE IF EXISTS `result_detial`;
CREATE TABLE `result_detial` (
  `RD_ID` varchar(32) NOT NULL,
  `RD_INFO_ID` varchar(32) DEFAULT NULL,
  `RD_RESULT` varchar(32) DEFAULT NULL,
  `RD_RATE` varchar(32) DEFAULT NULL,
  `RD_RANKING` varchar(32) DEFAULT NULL,
  `PR_ID` varchar(32) DEFAULT NULL,
  `PR_PID` varchar(32) DEFAULT NULL,
  `TYPE` varchar(32) DEFAULT NULL,
  `PR_NAME` varchar(32) DEFAULT NULL,
  `OTHER_ID` varchar(32) DEFAULT NULL,
  `USER_LOGIN_NAME` varchar(32) DEFAULT NULL,
  `RD_INDEX` varchar(32) DEFAULT NULL,
  `DETIAL_CORE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result_detial
-- ----------------------------
INSERT INTO `result_detial` VALUES ('1020201705252205473', '5433201705252205647', null, null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113031', null, '40');
INSERT INTO `result_detial` VALUES ('1176201704121604905', '7226201704121604253', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('1206201705252105368', '3782201705252105794', '5', null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113030', '4', '10');
INSERT INTO `result_detial` VALUES ('1233201705252105600', '3782201705252105794', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('1352201705252105305', '3782201705252105794', '7', null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113030', '3', '10');
INSERT INTO `result_detial` VALUES ('1542201704241004282', '8451201704231204349', null, null, null, '5763201704121504204', '410620170412150438', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('1553201704231704694', '3392201704231204677', null, null, null, '410620170412150438', '6469201704121504865', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('1559201705252205397', '5433201705252205647', '10', null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113031', '6', '20');
INSERT INTO `result_detial` VALUES ('1645201705252205451', '552720170525220559', '5', null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113030', '2', '10');
INSERT INTO `result_detial` VALUES ('1670201705252205260', '6034201705252205385', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('1691201704121704233', '9354201704121704129', null, null, null, '7040201704112204101', '8212201704112204171', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('1693201706202106988', '6923201706202106824', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113031', null, null);
INSERT INTO `result_detial` VALUES ('1719201704231704808', '3392201704231204677', null, null, null, '4635201704121504893', '6469201704121504865', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('1771201705252205311', '2746201705252205589', '9', null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113030', '5', '10');
INSERT INTO `result_detial` VALUES ('1776201705252205930', '2746201705252205589', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('1798201705252205524', '552720170525220559', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('1813201705011305261', '990520170424140429', null, null, null, '4635201704121504893', '6469201704121504865', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('1943201704112204282', '5822201704112204872', '1', '1', '1', '5974201704112204723', '0', '1', '计算机网络A', '5276201704112204689', null, null, null);
INSERT INTO `result_detial` VALUES ('2079201705252205416', '552720170525220559', '5', null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113030', '4', '10');
INSERT INTO `result_detial` VALUES ('2082201705252205806', '8778201705252205336', '5', null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113030', '2', '10');
INSERT INTO `result_detial` VALUES ('2161201705252205872', '5433201705252205647', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113031', null, null);
INSERT INTO `result_detial` VALUES ('2253201704241004208', '8451201704231204349', null, null, null, '410620170412150438', '6469201704121504865', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('2255201704121704150', '9354201704121704129', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('2294201704231704772', '3392201704231204677', null, null, null, '5763201704121504204', '410620170412150438', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('2332201705252205488', '552720170525220559', '9', null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113030', '5', '10');
INSERT INTO `result_detial` VALUES ('2372201705252205967', '8778201705252205336', null, null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113030', null, '40');
INSERT INTO `result_detial` VALUES ('2494201704121504382', '1755201704121504667', 'd', null, null, '6753201704121504554', '4635201704121504893', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('2518201704121604933', '4433201704121504468', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('2553201705252205357', '5433201705252205647', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113031', null, '12');
INSERT INTO `result_detial` VALUES ('2561201704121604859', '4433201704121504468', null, null, null, '5974201704112204723', '0', '1', '计算机网络A', '5276201704112204689', null, null, null);
INSERT INTO `result_detial` VALUES ('2700201706202106468', '9293201706202106764', '9', null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113030', '5', '10');
INSERT INTO `result_detial` VALUES ('2761201704231704844', '3392201704231204677', null, null, null, '3799201704121504103', '4635201704121504893', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('2807201706202106346', '6923201706202106824', '23', null, null, '1689201705252105405', '9942201705252105859', '3', '7', '9351201705252105196', '20131113031', '7', '20');
INSERT INTO `result_detial` VALUES ('2819201705252205332', '552720170525220559', '9', null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('2830201704231704731', '3392201704231204677', null, null, null, '2005201704121504135', '410620170412150438', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('2901201704131004802', '1672201704131004104', null, null, null, '7095201704112204619', '8212201704112204171', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('2944201705252105811', '3782201705252105794', null, null, null, '1689201705252105405', '9942201705252105859', '3', '7', '9351201705252105196', '20131113030', '7', '30');
INSERT INTO `result_detial` VALUES ('2946201704131004712', '1672201704131004104', null, null, null, '3066201704112204378', '2405201704112204239', '3', '01', '3616780BB3DC4E738E2E99A6A8A73648', null, null, null);
INSERT INTO `result_detial` VALUES ('2990201704112204352', '5822201704112204872', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('3016201705252205872', '2746201705252205589', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113030', null, null);
INSERT INTO `result_detial` VALUES ('3079201704231204517', '3621201704231204411', null, null, null, '6753201704121504554', '4635201704121504893', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('308020170525210580', '3782201705252105794', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113030', null, null);
INSERT INTO `result_detial` VALUES ('3186201705252205198', '5433201705252205647', '5', null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113031', '2', '10');
INSERT INTO `result_detial` VALUES ('3186201705252205744', '6034201705252205385', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('3257201704231204499', '3621201704231204411', null, null, null, '3799201704121504103', '4635201704121504893', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('3271201704121604765', '7374201704121604829', null, null, null, '7040201704112204101', '8212201704112204171', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('3286201704231704876', '3392201704231204677', null, null, null, '6753201704121504554', '4635201704121504893', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('3293201704241004169', '8451201704231204349', null, null, null, '6469201704121504865', '0', '1', '网络优化', '2681201704121504773', null, null, null);
INSERT INTO `result_detial` VALUES ('3331201704121504281', '1755201704121504667', 'd', null, null, '410620170412150438', '6469201704121504865', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('3347201704231204464', '3621201704231204411', null, null, null, '4635201704121504893', '6469201704121504865', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('3361201704112204332', '5822201704112204872', null, null, null, '9760201704112204353', '2405201704112204239', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('3521201705252205373', '552720170525220559', '7', null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113030', '3', '10');
INSERT INTO `result_detial` VALUES ('3639201706202106946', '9293201706202106764', '15', null, null, '1689201705252105405', '9942201705252105859', '3', '7', '9351201705252105196', '20131113030', '7', '20');
INSERT INTO `result_detial` VALUES ('3670201704121704132', '9354201704121704129', null, null, null, '5974201704112204723', '0', '1', '计算机网络A', '5276201704112204689', null, null, null);
INSERT INTO `result_detial` VALUES ('3764201705252205355', '9536201705252205915', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('3795201706202106256', '9293201706202106764', '7', null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113030', '3', '10');
INSERT INTO `result_detial` VALUES ('3897201705252205845', '8778201705252205336', null, null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113030', '5', '10');
INSERT INTO `result_detial` VALUES ('3923201706202106329', '9293201706202106764', '5', null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113030', '4', '10');
INSERT INTO `result_detial` VALUES ('3931201706202106128', '6923201706202106824', '3', null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113031', '4', '10');
INSERT INTO `result_detial` VALUES ('4038201705252105227', '3782201705252105794', '9', null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('4066201705252205435', '2746201705252205589', '15', null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113030', '6', '20');
INSERT INTO `result_detial` VALUES ('4083201704121604905', '4433201704121504468', null, null, null, '3066201704112204378', '2405201704112204239', '3', '01', '3616780BB3DC4E738E2E99A6A8A73648', null, null, null);
INSERT INTO `result_detial` VALUES ('4100201705252205885', '8778201705252205336', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('4181201704121504240', '1755201704121504667', null, null, null, '6469201704121504865', '0', '1', '网络优化', '2681201704121504773', null, null, null);
INSERT INTO `result_detial` VALUES ('4271201705252205663', '6034201705252205385', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113030', null, null);
INSERT INTO `result_detial` VALUES ('4343201704231204449', '3621201704231204411', null, null, null, '5763201704121504204', '410620170412150438', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('4673201705252205444', '9536201705252205915', null, null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('4711201704121504351', '1755201704121504667', '2', '1', '1', '3799201704121504103', '4635201704121504893', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('4719201705252205631', '8778201705252205336', '9', null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('4735201704121604964', '4433201704121504468', null, null, null, '7040201704112204101', '8212201704112204171', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('4783201704131004759', '1672201704131004104', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('4809201706202106110', '9293201706202106764', '9', null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('4916201706202106400', '9293201706202106764', '5', null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113030', '2', '10');
INSERT INTO `result_detial` VALUES ('4918201705252205262', '552720170525220559', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113030', null, null);
INSERT INTO `result_detial` VALUES ('4944201705252205176', '6034201705252205385', null, null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113030', '5', '10');
INSERT INTO `result_detial` VALUES ('4979201704131004628', '1672201704131004104', null, null, null, '5974201704112204723', '0', '1', '计算机网络A', '5276201704112204689', null, null, null);
INSERT INTO `result_detial` VALUES ('5135201705011305185', '990520170424140429', null, null, null, '6469201704121504865', '0', '1', '网络优化', '2681201704121504773', null, null, null);
INSERT INTO `result_detial` VALUES ('5175201705252205555', '6034201705252205385', null, null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113030', null, '40');
INSERT INTO `result_detial` VALUES ('5327201706202106272', '6923201706202106824', '10', null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113031', '6', '30');
INSERT INTO `result_detial` VALUES ('5380201705252205765', '8778201705252205336', null, null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113030', '4', '10');
INSERT INTO `result_detial` VALUES ('5397201704121604943', '7226201704121604253', null, null, null, '9760201704112204353', '2405201704112204239', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('5491201705252105733', '3782201705252105794', null, null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113030', null, '40');
INSERT INTO `result_detial` VALUES ('5516201705252205597', '552720170525220559', null, null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113030', null, '40');
INSERT INTO `result_detial` VALUES ('5567201705011305308', '990520170424140429', null, null, null, '6753201704121504554', '4635201704121504893', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('5596201704121604722', '7374201704121604829', null, null, null, '9760201704112204353', '2405201704112204239', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('5620201705252205561', '552720170525220559', '15', null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113030', '6', '20');
INSERT INTO `result_detial` VALUES ('5659201704121604781', '7374201704121604829', null, null, null, '7095201704112204619', '8212201704112204171', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('5684201704112204400', '5822201704112204872', null, null, null, '7095201704112204619', '8212201704112204171', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('5697201705252205513', '2746201705252205589', null, null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113030', null, '40');
INSERT INTO `result_detial` VALUES ('5739201704121604989', '7226201704121604253', null, null, null, '7040201704112204101', '8212201704112204171', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('5762201704121604883', '7226201704121604253', null, null, null, '5974201704112204723', '0', '1', '计算机网络A', '5276201704112204689', null, null, null);
INSERT INTO `result_detial` VALUES ('5777201705011305276', '990520170424140429', null, null, null, '3799201704121504103', '4635201704121504893', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('589820170525220511', '6034201705252205385', null, null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113030', '4', '10');
INSERT INTO `result_detial` VALUES ('5903201705252105446', '3782201705252105794', '5', null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113030', '2', '10');
INSERT INTO `result_detial` VALUES ('5926201704121604881', '4433201704121504468', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('5972201704121604732', '7374201704121604829', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('6028201705252205547', '8778201705252205336', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113030', null, null);
INSERT INTO `result_detial` VALUES ('6037201704121504316', '1755201704121504667', null, null, null, '5763201704121504204', '410620170412150438', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('606420170620210642', '9293201706202106764', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113030', null, null);
INSERT INTO `result_detial` VALUES ('6152201705252205633', '552720170525220559', '15', null, null, '1689201705252105405', '9942201705252105859', '3', '7', '9351201705252105196', '20131113030', '7', '30');
INSERT INTO `result_detial` VALUES ('616620170620210692', '6923201706202106824', '10', null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113031', '3', '10');
INSERT INTO `result_detial` VALUES ('6249201706202106643', '9293201706202106764', '15', null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113030', '6', '30');
INSERT INTO `result_detial` VALUES ('6284201704121604702', '7374201704121604829', null, null, null, '3066201704112204378', '2405201704112204239', '3', '01', '3616780BB3DC4E738E2E99A6A8A73648', null, null, null);
INSERT INTO `result_detial` VALUES ('6410201704231204395', '3621201704231204411', null, null, null, '6469201704121504865', '0', '1', '网络优化', '2681201704121504773', null, null, null);
INSERT INTO `result_detial` VALUES ('6419201704121704221', '9354201704121704129', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('6440201706202106235', '6923201706202106824', '5', null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113031', '2', '12');
INSERT INTO `result_detial` VALUES ('6466201704131004697', '1672201704131004104', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('6597201705252105665', '3782201705252105794', null, null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113030', '6', '20');
INSERT INTO `result_detial` VALUES ('6746201706202106199', '6923201706202106824', '6', null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113031', '5', '10');
INSERT INTO `result_detial` VALUES ('686320170525220505', '2746201705252205589', '9', null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('6939201704121604958', '7226201704121604253', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('6940201705252205550', '5433201705252205647', '23', null, null, '1689201705252105405', '9942201705252105859', '3', '7', '9351201705252105196', '20131113031', '7', '30');
INSERT INTO `result_detial` VALUES ('6947201704121604980', '4433201704121504468', null, null, null, '7095201704112204619', '8212201704112204171', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('6988201705252205591', '2746201705252205589', '15', null, null, '1689201705252105405', '9942201705252105859', '3', '7', '9351201705252105196', '20131113030', '7', '30');
INSERT INTO `result_detial` VALUES ('706420170620210623', '6923201706202106824', '2', null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113031', '1', '10');
INSERT INTO `result_detial` VALUES ('7104201705252105550', '3782201705252105794', '9', null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113030', '5', '10');
INSERT INTO `result_detial` VALUES ('7133201704131004744', '1672201704131004104', null, null, null, '9760201704112204353', '2405201704112204239', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('736620170525220546', '5433201705252205647', '10', null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113031', '3', '10');
INSERT INTO `result_detial` VALUES ('7371201704121604926', '4433201704121504468', null, null, null, '9760201704112204353', '2405201704112204239', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('7382201705011305245', '990520170424140429', null, null, null, '5763201704121504204', '410620170412150438', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('7453201704231204433', '3621201704231204411', null, null, null, '2005201704121504135', '410620170412150438', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('7532201704112204316', '5822201704112204872', '3', '3', '3', '3066201704112204378', '2405201704112204239', '3', '01', '3616780BB3DC4E738E2E99A6A8A73648', null, null, null);
INSERT INTO `result_detial` VALUES ('7536201705252205925', '8778201705252205336', null, null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113030', '6', '20');
INSERT INTO `result_detial` VALUES ('7595201704241004346', '8451201704231204349', null, null, null, '3799201704121504103', '4635201704121504893', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('7633201705252205235', '2746201705252205589', '5', null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113030', '2', '10');
INSERT INTO `result_detial` VALUES ('7915201704241004314', '8451201704231204349', null, null, null, '4635201704121504893', '6469201704121504865', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('7973201705252205396', '6034201705252205385', null, null, null, '3817201705252105987', '8212201704112204171', '3', '6', '2357201705252105367', '20131113030', '6', '20');
INSERT INTO `result_detial` VALUES ('8087201705252205160', '2746201705252205589', '5', null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113030', '4', '10');
INSERT INTO `result_detial` VALUES ('8100201705011305208', '990520170424140429', null, null, null, '410620170412150438', '6469201704121504865', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('8249201706202106163', '6923201706202106824', '5', null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113031', '2', '10');
INSERT INTO `result_detial` VALUES ('840820170525220584', '6034201705252205385', null, null, null, '728720170525210525', '2405201704112204239', '3', '2', '3192201705252105249', '20131113030', '2', '10');
INSERT INTO `result_detial` VALUES ('8431201705252205968', '5433201705252205647', '2', null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113031', '1', '10');
INSERT INTO `result_detial` VALUES ('8456201704121604926', '7226201704121604253', null, null, null, '3066201704112204378', '2405201704112204239', '3', '01', '3616780BB3DC4E738E2E99A6A8A73648', null, null, null);
INSERT INTO `result_detial` VALUES ('8543201704121704202', '9354201704121704129', null, null, null, '9760201704112204353', '2405201704112204239', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('8554201705252105165', '3782201705252105794', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('8557201704112204383', '5822201704112204872', null, null, null, '7040201704112204101', '8212201704112204171', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('8628201706202106874', '9293201706202106764', '7', null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113030', '3', '40');
INSERT INTO `result_detial` VALUES ('8652201704121504285', '1755201704121504667', null, null, null, '2005201704121504135', '410620170412150438', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('8711201705252205929', '6034201705252205385', null, null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113030', '3', '10');
INSERT INTO `result_detial` VALUES ('8741201705252205255', '9536201705252205915', null, null, null, '5974201704112204723', '0', '1', '计算机网络', '5276201704112204689', '20131113030', null, null);
INSERT INTO `result_detial` VALUES ('8754201705011305229', '990520170424140429', null, null, null, '2005201704121504135', '410620170412150438', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('878020170525220582', '2746201705252205589', '7', null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113030', '3', '10');
INSERT INTO `result_detial` VALUES ('8848201705252205725', '8778201705252205336', null, null, null, '4239201705252105462', '2405201704112204239', '3', '3', '7180201705252105724', '20131113030', '3', '10');
INSERT INTO `result_detial` VALUES ('8853201705252205918', '5433201705252205647', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113031', null, '12');
INSERT INTO `result_detial` VALUES ('887220170412160411', '7226201704121604253', null, null, null, '7095201704112204619', '8212201704112204171', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('8885201706202106561', '9293201706202106764', '5', null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113030', '2', '12');
INSERT INTO `result_detial` VALUES ('8986201704131004775', '1672201704131004104', null, null, null, '7040201704112204101', '8212201704112204171', '3', '02', 'EC476AECACC64098812C1F3451E5E874', null, null, null);
INSERT INTO `result_detial` VALUES ('9059201704121604658', '7374201704121604829', null, null, null, '5974201704112204723', '0', '1', '计算机网络A', '5276201704112204689', null, null, null);
INSERT INTO `result_detial` VALUES ('9062201704231204418', '3621201704231204411', null, null, null, '410620170412150438', '6469201704121504865', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('9192201706202106311', '6923201706202106824', '10', null, null, '9942201705252105859', '5974201704112204723', '2', '三', null, '20131113031', '3', '40');
INSERT INTO `result_detial` VALUES ('9245201704121604682', '7374201704121604829', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('925020170525220507', '8778201705252205336', null, null, null, '1689201705252105405', '9942201705252105859', '3', '7', '9351201705252105196', '20131113030', '7', '30');
INSERT INTO `result_detial` VALUES ('9272201704121504345', '1755201704121504667', '2', '1', '1', '4635201704121504893', '6469201704121504865', '2', '二：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('932620170620210657', '6923201706202106824', '2', null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113031', '1', '10');
INSERT INTO `result_detial` VALUES ('9329201704112204300', '5822201704112204872', '2', null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, null, null, null);
INSERT INTO `result_detial` VALUES ('9364201704121704248', '9354201704121704129', null, null, null, '7095201704112204619', '8212201704112204171', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('9430201704241004378', '8451201704231204349', null, null, null, '6753201704121504554', '4635201704121504893', '3', '02', '4347FECA23A74647ADD1B345EE4D9E84', null, null, null);
INSERT INTO `result_detial` VALUES ('9471201704241004246', '8451201704231204349', null, null, null, '2005201704121504135', '410620170412150438', '3', '01', '11', null, null, null);
INSERT INTO `result_detial` VALUES ('9508201705252205272', '5433201705252205647', '6', null, null, '8941201705252105755', '2405201704112204239', '3', '5', '1304201705252105259', '20131113031', '5', '10');
INSERT INTO `result_detial` VALUES ('9544201705252205123', '5433201705252205647', '3', null, null, '4279201705252105361', '2405201704112204239', '3', '4', '5022201705252105691', '20131113031', '4', '10');
INSERT INTO `result_detial` VALUES ('9570201704231704654', '3392201704231204677', null, null, null, '6469201704121504865', '0', '1', '网络优化', '2681201704121504773', null, null, null);
INSERT INTO `result_detial` VALUES ('9576201705252205377', '2746201705252205589', null, null, null, '8212201704112204171', '5974201704112204723', '2', '二：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('9822201704121704181', '9354201704121704129', null, null, null, '3066201704112204378', '2405201704112204239', '3', '01', '3616780BB3DC4E738E2E99A6A8A73648', null, null, null);
INSERT INTO `result_detial` VALUES ('9826201706202106181', '9293201706202106764', '9', null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('9882201705252205295', '552720170525220559', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113030', null, '12');
INSERT INTO `result_detial` VALUES ('9887201705252205825', '6034201705252205385', null, null, null, '2048201705252105908', '2405201704112204239', '3', '1', '6078201705252105242', '20131113030', '1', '10');
INSERT INTO `result_detial` VALUES ('9892201705252205580', '8778201705252205336', null, null, null, '2405201704112204239', '5974201704112204723', '2', '一：', null, '20131113030', null, '12');

-- ----------------------------
-- Table structure for `result_info`
-- ----------------------------
DROP TABLE IF EXISTS `result_info`;
CREATE TABLE `result_info` (
  `RESULT_ID` varchar(32) NOT NULL,
  `RI_PAPER_ID` varchar(32) DEFAULT NULL,
  `RI_USER_ID` varchar(32) DEFAULT NULL,
  `RI_RESULT` varchar(32) DEFAULT NULL,
  `RI_RATE` varchar(32) DEFAULT NULL,
  `RESULT_TOTAL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RESULT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result_info
-- ----------------------------
INSERT INTO `result_info` VALUES ('6923201706202106824', '5276201704112204689', '00832A3C99D2464698A6D0F0C01FF971', '59.0', null, '70');
INSERT INTO `result_info` VALUES ('9293201706202106764', '5276201704112204689', '345706D83FE846F3A410EA36AF5EB214', '65.0', null, '70');

-- ----------------------------
-- Table structure for `sys_dept_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_info`;
CREATE TABLE `sys_dept_info` (
  `DEPT_ID` varchar(32) NOT NULL COMMENT '组织id',
  `DEPT_NAME` varchar(16) NOT NULL COMMENT '组织名称',
  `DEPT_DESC` text COMMENT '描述',
  `DEPT_PARENT_ID` varchar(32) NOT NULL COMMENT '上级组织id',
  `DEPT_LEVEL` decimal(65,30) NOT NULL COMMENT '组织登记',
  `DEPT_ORDER` decimal(65,30) NOT NULL COMMENT '序号',
  `DEPT_IS_VALID` varchar(8) NOT NULL COMMENT '有效标识',
  `DEPT_LEADER` varchar(32) DEFAULT NULL COMMENT '负责人',
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept_info
-- ----------------------------
INSERT INTO `sys_dept_info` VALUES ('1', 'XXXX大学', null, '0', '1.000000000000000000000000000000', '1.000000000000000000000000000000', '0', '1');
INSERT INTO `sys_dept_info` VALUES ('2', '计算机学院', '计算机学院', '1', '2.000000000000000000000000000000', '1.000000000000000000000000000000', '1', '2');
INSERT INTO `sys_dept_info` VALUES ('3', '网络工程', null, '1', '3.000000000000000000000000000000', '1.000000000000000000000000000000', '0', '3');
INSERT INTO `sys_dept_info` VALUES ('4', '软件工程', null, '1', '3.000000000000000000000000000000', '2.000000000000000000000000000000', '0', '4');
INSERT INTO `sys_dept_info` VALUES ('5', '管理学院', null, '1', '2.000000000000000000000000000000', '2.000000000000000000000000000000', '0', '5');
INSERT INTO `sys_dept_info` VALUES ('7', '工程造价', null, '1', '3.000000000000000000000000000000', '244.000000000000000000000000000000', '0', '7777777777777');

-- ----------------------------
-- Table structure for `sys_res_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_res_info`;
CREATE TABLE `sys_res_info` (
  `RES_ID` varchar(32) NOT NULL COMMENT '权限id',
  `RES_NAME` varchar(32) NOT NULL COMMENT '权限名称',
  `RES_URL` varchar(128) DEFAULT NULL COMMENT '权限url',
  `RES_CODE` varchar(64) NOT NULL COMMENT '权限代码',
  `RES_PARENT_ID` varchar(32) DEFAULT NULL COMMENT '上级权限id',
  `RES_TYPE` varchar(8) NOT NULL COMMENT '权限类型',
  `RES_ORDER` varchar(8) NOT NULL COMMENT '权限序号',
  `RES_DESC` text COMMENT '权限描述',
  PRIMARY KEY (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res_info
-- ----------------------------
INSERT INTO `sys_res_info` VALUES ('0AA88F88F1C44D04B9838981B821F6BF', '专业管理', '/major/list', 'ZYGL', '8C24B8ECBB514913848DC93869DB269C', '1', '2', '专业管理');
INSERT INTO `sys_res_info` VALUES ('1', '用户管理', null, 'YHGL', '8', '1', '1', '用户管理');
INSERT INTO `sys_res_info` VALUES ('10', '角色管理', '/sysRole/list', 'JSGL', '3', '1', '1', '角色管理');
INSERT INTO `sys_res_info` VALUES ('11', '资源权限管理', '/sysRes/list', 'QXGL', '2', '1', '1', '资源权限管理');
INSERT INTO `sys_res_info` VALUES ('12', '用户权限管理', '/sysUser/toListUser', '用户权限管理', '1', '1', '2', '用户权限管理');
INSERT INTO `sys_res_info` VALUES ('13', '用户添加', 'user:add', 'YHTJ', '9', '2', '1', '用户添加');
INSERT INTO `sys_res_info` VALUES ('14', '用户查询', 'user:serch', 'YHCX', '9', '2', '2', '用户查询');
INSERT INTO `sys_res_info` VALUES ('15', '用户修改', 'user:update', 'YHXG', '9', '2', '3', '用户修改');
INSERT INTO `sys_res_info` VALUES ('16', '用户删除', 'user:delete', 'YHSC', '9', '2', '4', '用户删除');
INSERT INTO `sys_res_info` VALUES ('17', '角色查询', 'role:serch', 'JSCX', '10', '2', '5', '角色查询');
INSERT INTO `sys_res_info` VALUES ('2', '资源权限管理', null, 'QXGL', '8', '1', '2', '资源权限管理');
INSERT INTO `sys_res_info` VALUES ('2BE158C0576E41FE87CBF336096A2513', '知识单元管理', 'unit/list', 'ZSDYGL', '8C24B8ECBB514913848DC93869DB269C', '1', '3', '知识单元管理');
INSERT INTO `sys_res_info` VALUES ('3', '角色管理', null, 'JSGL', '8', '1', '3', '角色管理');
INSERT INTO `sys_res_info` VALUES ('309CD0A7533449BBB67FAE47CA45C925', '部门添加', 'dept:add', 'BMTJ', '536456D9054C4C849A6191AD1510FFB4', '2', '2', '部门添加权限');
INSERT INTO `sys_res_info` VALUES ('32602924F73343C9AC2E3355067E8482', '部门修改', 'dept:edit', 'BMXG', '536456D9054C4C849A6191AD1510FFB4', '2', '3', '部门修改');
INSERT INTO `sys_res_info` VALUES ('3B07A427B0504A94ADB6722AD2442160', '部门管理', null, 'BMGL', '8', '1', '4', '部门管理');
INSERT INTO `sys_res_info` VALUES ('4', '角色添加', 'role:add', 'A', '10', '2', '4', null);
INSERT INTO `sys_res_info` VALUES ('5', '角色删除', 'role:delete', '1', '10', '2', '5', null);
INSERT INTO `sys_res_info` VALUES ('536456D9054C4C849A6191AD1510FFB4', '部门管理', '/sysDept/list', 'BMGL', '3B07A427B0504A94ADB6722AD2442160', '1', '1', '部门管理');
INSERT INTO `sys_res_info` VALUES ('538892B7CC8E45EE958A5AB0C6E6D3EC', '权限删除', 'res:delete', 'QXSC', '11', '2', '4', '权限删除');
INSERT INTO `sys_res_info` VALUES ('64AA36F0359E465A925210AC566AA7AA', '课程类型管理', 'courseType/list', 'KCLXGL', '8C24B8ECBB514913848DC93869DB269C', '1', '5', '课程类型管理');
INSERT INTO `sys_res_info` VALUES ('7', '角色修改', 'role:update', '1', '10', '2', '6', null);
INSERT INTO `sys_res_info` VALUES ('724DA4149C0F48B891413F39528B1408', '角色授权', 'role:authrole', 'QXSQ', '10', '2', '5', '对角色进行授权');
INSERT INTO `sys_res_info` VALUES ('8', '权限系统', null, 'QXXT', '0', '1', '7', null);
INSERT INTO `sys_res_info` VALUES ('8C24B8ECBB514913848DC93869DB269C', '教学管理', null, 'JXGL', 'A3B0E099966D4E568B9BCC323F384CF3', '1', '1', '教学管理');
INSERT INTO `sys_res_info` VALUES ('9', '用户管理', '/sysUser/list', 'YHGL', '1', '1', '1', '用户管理');
INSERT INTO `sys_res_info` VALUES ('95926CBDD1F3446A9F957B784B8BB6B2', '部门删除', 'dept:delete', 'BMSC', '536456D9054C4C849A6191AD1510FFB4', '2', '4', '部门删除\n');
INSERT INTO `sys_res_info` VALUES ('A3B0E099966D4E568B9BCC323F384CF3', '教务管理', null, 'JWGL', '0', '1', '2', '教务信息管理');
INSERT INTO `sys_res_info` VALUES ('A82E708B688540BB8D50C5EFC2BB6378', '权限添加', 'res:add', '权限添加', '11', '2', '2', '权限添加');
INSERT INTO `sys_res_info` VALUES ('D1CC0CDF04EC4BCDA60D361A5E888C61', '部门查询', 'dept:serch', 'BMCX', '536456D9054C4C849A6191AD1510FFB4', '2', '1', '部门查询权限');
INSERT INTO `sys_res_info` VALUES ('D8E994F321B54B3383B9DF483985A509', '课程管理', '/course/list', 'KCGL', '8C24B8ECBB514913848DC93869DB269C', '1', '1', '课程管理');
INSERT INTO `sys_res_info` VALUES ('E01BE39DC5A744D4BEEA306F57331675', '权限查询', 'res:serch', 'QXCX', '11', '2', '1', '权限查询');
INSERT INTO `sys_res_info` VALUES ('E3472BD29BCB4947BCB0A966B63E8032', '知识点管理', 'point/list', 'ZSDGL', '8C24B8ECBB514913848DC93869DB269C', '1', '4', '知识点管理');
INSERT INTO `sys_res_info` VALUES ('E439746FF0424E3A8CF2A16A25F23455', '权限修改', 'res:edit', 'QXXG', '11', '2', '3', '权限修改');

-- ----------------------------
-- Table structure for `sys_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色id',
  `ROLE_NAME` varchar(32) NOT NULL COMMENT '角色名称',
  `ROLE_IS_VALID` varchar(8) NOT NULL COMMENT '有效标识',
  `ROLE_PARENT_ID` varchar(32) NOT NULL COMMENT '上级角色',
  `REMAKE` text COMMENT '备注',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES ('1', '学生', '1', '1', '学生21');
INSERT INTO `sys_role_info` VALUES ('19B2AF8127BD475699F17CB22609E01B', '测试', '0', '3', '测试');
INSERT INTO `sys_role_info` VALUES ('2', '校长', '1', '0', null);
INSERT INTO `sys_role_info` VALUES ('3', '院长', '1', '2', '院长');
INSERT INTO `sys_role_info` VALUES ('4', '专业负责人', '1', '3', null);
INSERT INTO `sys_role_info` VALUES ('5', '导员', '1', '19B2AF8127BD475699F17CB22609E01B', null);
INSERT INTO `sys_role_info` VALUES ('6', '超级管理员', '0', '0', 'eee');

-- ----------------------------
-- Table structure for `sys_role_res_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res_info`;
CREATE TABLE `sys_role_res_info` (
  `RR_ROLE_ID` varchar(32) NOT NULL COMMENT '角色标识',
  `RR_RES_ID` varchar(32) NOT NULL COMMENT '资标识',
  PRIMARY KEY (`RR_ROLE_ID`,`RR_RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res_info
-- ----------------------------
INSERT INTO `sys_role_res_info` VALUES ('1', '1');
INSERT INTO `sys_role_res_info` VALUES ('1', '12');
INSERT INTO `sys_role_res_info` VALUES ('1', '13');
INSERT INTO `sys_role_res_info` VALUES ('1', '14');
INSERT INTO `sys_role_res_info` VALUES ('1', '15');
INSERT INTO `sys_role_res_info` VALUES ('1', '16');
INSERT INTO `sys_role_res_info` VALUES ('1', '5');
INSERT INTO `sys_role_res_info` VALUES ('1', '9');

-- ----------------------------
-- Table structure for `sys_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info` (
  `USER_ID` varchar(32) NOT NULL COMMENT '用户id',
  `USER_DEPT_ID` varchar(32) NOT NULL COMMENT '所属机构id',
  `USER_PWD` varchar(128) NOT NULL COMMENT '登录密码',
  `USER_NAME` varchar(32) NOT NULL COMMENT '用户名',
  `CARD_ID` varchar(18) NOT NULL COMMENT '身份证号',
  `USER_ADDR` text NOT NULL COMMENT '地址',
  `USER_CONTACT` varchar(32) NOT NULL COMMENT '联系方式',
  `ENTER_DATE` datetime NOT NULL COMMENT '入校（职）日期',
  `LEAVE_DATE` datetime DEFAULT NULL COMMENT '离校（职）日期',
  `USER_PROFESS` varchar(32) DEFAULT NULL COMMENT '职称（针对非学生）',
  `USER_STATUS` varchar(8) NOT NULL COMMENT '用户状态',
  `USER_EMAIL` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `LAST_LOGIN` datetime DEFAULT NULL COMMENT '上次登录时间',
  `SCHOOL_YEAR` decimal(65,30) DEFAULT NULL COMMENT '学年制（针对学生）',
  `REMARK` text COMMENT '备注',
  `USER_NO` varchar(32) NOT NULL COMMENT '用户编号（学号，工号）',
  `USER_SEX` varchar(8) NOT NULL COMMENT '用户性别',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES ('1', '1', 'E10ADC3949BA59ABBE56E057F20F883E', 'A', '3714*2', '德州', '18865947337', '2017-08-07 00:00:00', '2017-08-31 00:00:00', '666', '1', '948228970@qq.com', null, '4.000000000000000000000000000000', null, 'admin', '1');
INSERT INTO `sys_user_info` VALUES ('2', '2', '123456', 'B', '3714*2', '德州', '18865947337', '2017-08-07 00:00:00', '2017-08-31 00:00:00', null, '1', '948228970@qq.com', '2017-08-31 00:00:00', '4.000000000000000000000000000000', null, '20131113032', '1');
INSERT INTO `sys_user_info` VALUES ('299FAC8528484B559834B792E7A07D9B', '3', '202CB962AC59075B964B07152D234B70', '12', '3714*2', '12', '12', '2017-10-13 00:00:00', '2017-10-13 00:00:00', '12', '0', '21', '2017-10-13 09:27:59', '12.000000000000000000000000000000', '12', '12', '2');
INSERT INTO `sys_user_info` VALUES ('3', '3', '123456', 'C', '3714*2', '天津', '18865947337', '2017-08-07 00:00:00', '2017-08-31 00:00:00', null, '1', '948228970@qq.com', '2017-08-31 00:00:00', '4.000000000000000000000000000000', null, '20131113031', '2');
INSERT INTO `sys_user_info` VALUES ('4', '1', 'E10ADC3949BA59ABBE56E057F20F883E', 'D', '3714*2', '德州', '18865947337', '2017-08-07 00:00:00', '2017-08-31 00:00:00', '666', '1', '948228970@qq.com', null, '4.000000000000000000000000000000', null, '20131113030', '1');

-- ----------------------------
-- Table structure for `sys_user_res_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_res_info`;
CREATE TABLE `sys_user_res_info` (
  `UR_USER_ID` varchar(32) NOT NULL COMMENT '用户标识',
  `UR_RES_ID` varchar(32) NOT NULL COMMENT '资源标识',
  PRIMARY KEY (`UR_USER_ID`,`UR_RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_res_info
-- ----------------------------
INSERT INTO `sys_user_res_info` VALUES ('1', '0AA88F88F1C44D04B9838981B821F6BF');
INSERT INTO `sys_user_res_info` VALUES ('1', '1');
INSERT INTO `sys_user_res_info` VALUES ('1', '10');
INSERT INTO `sys_user_res_info` VALUES ('1', '11');
INSERT INTO `sys_user_res_info` VALUES ('1', '12');
INSERT INTO `sys_user_res_info` VALUES ('1', '13');
INSERT INTO `sys_user_res_info` VALUES ('1', '14');
INSERT INTO `sys_user_res_info` VALUES ('1', '15');
INSERT INTO `sys_user_res_info` VALUES ('1', '16');
INSERT INTO `sys_user_res_info` VALUES ('1', '17');
INSERT INTO `sys_user_res_info` VALUES ('1', '2');
INSERT INTO `sys_user_res_info` VALUES ('1', '2BE158C0576E41FE87CBF336096A2513');
INSERT INTO `sys_user_res_info` VALUES ('1', '3');
INSERT INTO `sys_user_res_info` VALUES ('1', '309CD0A7533449BBB67FAE47CA45C925');
INSERT INTO `sys_user_res_info` VALUES ('1', '32602924F73343C9AC2E3355067E8482');
INSERT INTO `sys_user_res_info` VALUES ('1', '3B07A427B0504A94ADB6722AD2442160');
INSERT INTO `sys_user_res_info` VALUES ('1', '4');
INSERT INTO `sys_user_res_info` VALUES ('1', '5');
INSERT INTO `sys_user_res_info` VALUES ('1', '536456D9054C4C849A6191AD1510FFB4');
INSERT INTO `sys_user_res_info` VALUES ('1', '538892B7CC8E45EE958A5AB0C6E6D3EC');
INSERT INTO `sys_user_res_info` VALUES ('1', '64AA36F0359E465A925210AC566AA7AA');
INSERT INTO `sys_user_res_info` VALUES ('1', '7');
INSERT INTO `sys_user_res_info` VALUES ('1', '724DA4149C0F48B891413F39528B1408');
INSERT INTO `sys_user_res_info` VALUES ('1', '8');
INSERT INTO `sys_user_res_info` VALUES ('1', '8C24B8ECBB514913848DC93869DB269C');
INSERT INTO `sys_user_res_info` VALUES ('1', '9');
INSERT INTO `sys_user_res_info` VALUES ('1', '95926CBDD1F3446A9F957B784B8BB6B2');
INSERT INTO `sys_user_res_info` VALUES ('1', 'A3B0E099966D4E568B9BCC323F384CF3');
INSERT INTO `sys_user_res_info` VALUES ('1', 'A82E708B688540BB8D50C5EFC2BB6378');
INSERT INTO `sys_user_res_info` VALUES ('1', 'D1CC0CDF04EC4BCDA60D361A5E888C61');
INSERT INTO `sys_user_res_info` VALUES ('1', 'D8E994F321B54B3383B9DF483985A509');
INSERT INTO `sys_user_res_info` VALUES ('1', 'E01BE39DC5A744D4BEEA306F57331675');
INSERT INTO `sys_user_res_info` VALUES ('1', 'E3472BD29BCB4947BCB0A966B63E8032');
INSERT INTO `sys_user_res_info` VALUES ('1', 'E439746FF0424E3A8CF2A16A25F23455');
INSERT INTO `sys_user_res_info` VALUES ('2', '3');
INSERT INTO `sys_user_res_info` VALUES ('2', '5');
INSERT INTO `sys_user_res_info` VALUES ('2', '6');
INSERT INTO `sys_user_res_info` VALUES ('2', '7');
INSERT INTO `sys_user_res_info` VALUES ('3', '4');
INSERT INTO `sys_user_res_info` VALUES ('3', '5');
INSERT INTO `sys_user_res_info` VALUES ('3', '6');
INSERT INTO `sys_user_res_info` VALUES ('3', '7');
INSERT INTO `sys_user_res_info` VALUES ('4', '4');
INSERT INTO `sys_user_res_info` VALUES ('4', '5');
INSERT INTO `sys_user_res_info` VALUES ('4', '6');
INSERT INTO `sys_user_res_info` VALUES ('4', '7');

-- ----------------------------
-- Table structure for `sys_user_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_info`;
CREATE TABLE `sys_user_role_info` (
  `UR_USER_ID` varchar(32) NOT NULL COMMENT '用户标识',
  `UR_ROLE_ID` varchar(32) NOT NULL COMMENT '角色标识',
  PRIMARY KEY (`UR_USER_ID`,`UR_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role_info
-- ----------------------------
INSERT INTO `sys_user_role_info` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `table1`
-- ----------------------------
DROP TABLE IF EXISTS `table1`;
CREATE TABLE `table1` (
  `id` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table1
-- ----------------------------
INSERT INTO `table1` VALUES ('1', 'A', '0');
INSERT INTO `table1` VALUES ('2', 'B', '1');
INSERT INTO `table1` VALUES ('3', 'C', '1');
INSERT INTO `table1` VALUES ('4', 'D', '2');
INSERT INTO `table1` VALUES ('5', 'E', '4');
INSERT INTO `table1` VALUES ('6', 'F', '1');
INSERT INTO `table1` VALUES ('7', 'G', '1');

-- ----------------------------
-- Table structure for `technology`
-- ----------------------------
DROP TABLE IF EXISTS `technology`;
CREATE TABLE `technology` (
  `TECHNOLOGY_ID` varchar(32) NOT NULL,
  `TECHNOLOGY_NAME` varchar(32) NOT NULL,
  `TECHNOLOGY_INFO` text,
  `TECHNOLOGY_REMAKE` text,
  PRIMARY KEY (`TECHNOLOGY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technology
-- ----------------------------
INSERT INTO `technology` VALUES ('1684BCA40C7F4D29A4C6D6DF9BEFDE5C', '多线程', '多线程', '多线程');
INSERT INTO `technology` VALUES ('2', 'orale应用', '进行orale 的维护与开发', 'oracle应用11');
INSERT INTO `technology` VALUES ('3', '开发框架', 'ssm三大框架灵活使用', '进行修改以及改进');
INSERT INTO `technology` VALUES ('3E10145869354333AEF4D1D840B6E7E7', 'echarts', '百度echarts的应用', '报表开发');
INSERT INTO `technology` VALUES ('4', '前段技术', '前台jquery的开发、html、jsp', '前端');
INSERT INTO `technology` VALUES ('BCBC7907249B4E30B196F469436F51FB', 'TCP', 'TCP', 'TCP');
INSERT INTO `technology` VALUES ('DBC7FE9758DF4581A6DDA5EBD0513E62', '数据结构', '数据结构', '数据结构');

-- ----------------------------
-- Table structure for `treenodes`
-- ----------------------------
DROP TABLE IF EXISTS `treenodes`;
CREATE TABLE `treenodes` (
  `id` int(11) NOT NULL,
  `nodename` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of treenodes
-- ----------------------------
INSERT INTO `treenodes` VALUES ('1', 'A', '0');
INSERT INTO `treenodes` VALUES ('2', 'B', '1');
INSERT INTO `treenodes` VALUES ('3', 'C', '1');
INSERT INTO `treenodes` VALUES ('4', 'D', '2');
INSERT INTO `treenodes` VALUES ('5', 'E', '2');
INSERT INTO `treenodes` VALUES ('6', 'F', '3');
INSERT INTO `treenodes` VALUES ('7', 'G', '6');
INSERT INTO `treenodes` VALUES ('8', 'H', '0');
INSERT INTO `treenodes` VALUES ('9', 'I', '8');
INSERT INTO `treenodes` VALUES ('10', 'J', '8');
INSERT INTO `treenodes` VALUES ('11', 'K', '8');
INSERT INTO `treenodes` VALUES ('12', 'L', '9');
INSERT INTO `treenodes` VALUES ('13', 'M', '9');
INSERT INTO `treenodes` VALUES ('14', 'N', '12');
INSERT INTO `treenodes` VALUES ('15', 'O', '12');
INSERT INTO `treenodes` VALUES ('16', 'P', '15');
INSERT INTO `treenodes` VALUES ('17', 'Q', '15');

-- ----------------------------
-- Table structure for `t_coursewares`
-- ----------------------------
DROP TABLE IF EXISTS `t_coursewares`;
CREATE TABLE `t_coursewares` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `DURATION` decimal(65,30) DEFAULT NULL,
  `DEVICE_TYPE` varchar(20) DEFAULT NULL,
  `FILE_TYPE` varchar(20) DEFAULT NULL,
  `OPEN` varchar(1) DEFAULT NULL,
  `TRANSFORM_STATUS` varchar(2) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coursewares
-- ----------------------------
INSERT INTO `t_coursewares` VALUES ('0d2d1206c58c47b5a7b037edd9674249', '9', '9', '9.000000000000000000000000000000', 'PC', 'SCORM包', '1', '0', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('1665f48839d7453db1b76b911dc09000', '2', '2', '2.000000000000000000000000000000', 'PC,MOBILE', '视频', '1', '1', null, null);
INSERT INTO `t_coursewares` VALUES ('1afd690916ae471fa6968d1ea3a10703', '11', '11', '11.000000000000000000000000000000', 'PC', 'SCORM包', '1', '0', null, null);
INSERT INTO `t_coursewares` VALUES ('26da3625d0cc4991afd5828b7dd71466', 'test6', 'test6', '16.000000000000000000000000000000', 'PC,MOBILE', '视频', '1', '0', '2016-05-17 00:00:00', '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('32b5b5bbea7244ecb40fa4dd215c8b15', 'test3', 'test3', '13.000000000000000000000000000000', 'PC', 'SCORM包', '1', '0', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('573e78a21f2641d0ba60518c98b0ba44', '7', '7', '7.000000000000000000000000000000', 'PC', 'SCORM包', '1', '0', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('57fbaeb776224c48ab25cf15944aa789', '5', '5', '5.000000000000000000000000000000', 'PC', 'SCORM包', '1', '0', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('95187e00f7ac44d3a4c1237cbe9dabf2', '112', '12', '12.000000000000000000000000000000', 'PC', 'SCORM包', '1', '1', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('d309002c024a4353a91ba98043787599', 'test5', 'test5', '15.000000000000000000000000000000', 'PC,MOBILE', 'SCORM包', '1', '0', '2016-05-17 00:00:00', '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('d897aaf7c96844e98b2558df12f351c2', '3', '3', '3.000000000000000000000000000000', 'PC,MOBILE', '录播课程', '1', '1', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('e740d626327141de8c5796bb23a8b60a', '6', '6', '6.000000000000000000000000000000', 'PC', 'SCORM包', '1', '0', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('fbf6799527b844dabcc9828d890d7581', 'test', 'test', '11.000000000000000000000000000000', 'PC,MOBILE', '视频', '1', '0', null, '2016-05-17 00:00:00');
INSERT INTO `t_coursewares` VALUES ('ff6d662e633c42329ae6273566df7e46', '10', '10', '10.000000000000000000000000000000', 'PC', '文档', '1', '0', null, null);

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `ID` decimal(65,30) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `URL` varchar(50) DEFAULT NULL,
  `PERMISSION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1.000000000000000000000000000000', '删除用户', null, null, 'user:delete');
INSERT INTO `t_permission` VALUES ('2.000000000000000000000000000000', '修改用户', null, null, 'user:update');

-- ----------------------------
-- Table structure for `t_permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission_role`;
CREATE TABLE `t_permission_role` (
  `ID` decimal(65,30) NOT NULL,
  `PERMISSION_ID` decimal(65,30) DEFAULT NULL,
  `ROLE_ID` decimal(65,30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission_role
-- ----------------------------
INSERT INTO `t_permission_role` VALUES ('1.000000000000000000000000000000', '1.000000000000000000000000000000', '1.000000000000000000000000000000');
INSERT INTO `t_permission_role` VALUES ('2.000000000000000000000000000000', '2.000000000000000000000000000000', '1.000000000000000000000000000000');
INSERT INTO `t_permission_role` VALUES ('3.000000000000000000000000000000', '3.000000000000000000000000000000', '1.000000000000000000000000000000');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ID` decimal(65,30) NOT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1.000000000000000000000000000000', null, '管理员');
INSERT INTO `t_role` VALUES ('2.000000000000000000000000000000', null, '经理');
INSERT INTO `t_role` VALUES ('3.000000000000000000000000000000', null, '小职员');

-- ----------------------------
-- Table structure for `t_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_user`;
CREATE TABLE `t_role_user` (
  `ID` decimal(65,30) NOT NULL,
  `USER_ID` decimal(65,30) DEFAULT NULL,
  `ROLE_ID` decimal(65,30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_user
-- ----------------------------
INSERT INTO `t_role_user` VALUES ('1.000000000000000000000000000000', '3.000000000000000000000000000000', '1.000000000000000000000000000000');
INSERT INTO `t_role_user` VALUES ('2.000000000000000000000000000000', '4.000000000000000000000000000000', '3.000000000000000000000000000000');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `NAME` varchar(16) DEFAULT NULL,
  `ID` decimal(65,30) NOT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `AGE` decimal(65,30) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('admin', '3.000000000000000000000000000000', 'E10ADC3949BA59ABBE56E057F20F883E', '123.000000000000000000000000000000', null);
INSERT INTO `t_user` VALUES ('1234', '4.000000000000000000000000000000', '81DC9BDB52D04DC20036DBD8313ED055', '1.000000000000000000000000000000', null);
INSERT INTO `t_user` VALUES ('22', '5.000000000000000000000000000000', '81DC9BDB52D04DC20036DBD8313ED055', '22.000000000000000000000000000000', null);
INSERT INTO `t_user` VALUES ('66', '6.000000000000000000000000000000', '81DC9BDB52D04DC20036DBD8313ED055', '66.000000000000000000000000000000', null);
INSERT INTO `t_user` VALUES ('123', '7.000000000000000000000000000000', '123', '12.000000000000000000000000000000', null);

-- ----------------------------
-- Table structure for `uc_department`
-- ----------------------------
DROP TABLE IF EXISTS `uc_department`;
CREATE TABLE `uc_department` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `PID` varchar(32) DEFAULT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(200) NOT NULL COMMENT '部门名称',
  `DEPT_SHORT_NAME` text COMMENT '部门简称',
  `DEPT_CODE` varchar(100) DEFAULT NULL COMMENT '部门编号',
  `DEPT_LEVEL` varchar(100) DEFAULT NULL COMMENT '部门级别',
  `DEPT_FLOOR_CODE` text COMMENT '层级编号，100200',
  `DEPT_ISLEAF` decimal(38,0) DEFAULT NULL COMMENT '是否末级节点，0：否，1：是',
  `DEPT_FLOOR_NUM` decimal(38,0) DEFAULT NULL COMMENT '层级数，记录树形第几层',
  `DEPT_INDEX` decimal(38,0) DEFAULT NULL COMMENT '显示序号',
  `DEPT_DESC` text COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of uc_department
-- ----------------------------
INSERT INTO `uc_department` VALUES ('1', '0', '山东建筑大学', null, 'jzdx', '1', null, '0', null, null, null);
INSERT INTO `uc_department` VALUES ('1184A6C96E1D4F1380154618FA48A71D', '2', '计算机科学与技术', null, 'jsjkxyjs', '3', null, '0', null, null, null);
INSERT INTO `uc_department` VALUES ('2', '1', '计算机学院', null, 'jsjxy', '2', null, '0', null, null, null);
INSERT INTO `uc_department` VALUES ('5', '2', '软件工程', null, 'rjgc', '3', null, '1', null, null, null);
INSERT INTO `uc_department` VALUES ('BDCA93ABE30C4862B4FA8A1BF0136082', '2', '软件测试', null, 'rjcs', '3', null, '0', null, null, null);
INSERT INTO `uc_department` VALUES ('E438D7BABA384CC3B229FEBC0AAADBBF', '2', '网络工程', null, 'wlgc', '3', null, '0', null, null, null);
INSERT INTO `uc_department` VALUES ('FF135F712BF24C9D97F188D9020BBD7F', '2', '工商管理', null, 'gsgl', '3', null, '0', null, null, null);

-- ----------------------------
-- Table structure for `uc_group`
-- ----------------------------
DROP TABLE IF EXISTS `uc_group`;
CREATE TABLE `uc_group` (
  `GROUP_ID` varchar(32) NOT NULL,
  `GROUP_NAME` varchar(200) DEFAULT NULL,
  `GROUP_DESC` text,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uc_group
-- ----------------------------
INSERT INTO `uc_group` VALUES ('1', '分组一', '1');
INSERT INTO `uc_group` VALUES ('2', '分组二', '2');
INSERT INTO `uc_group` VALUES ('3', '分组三', '3');

-- ----------------------------
-- Table structure for `uc_user`
-- ----------------------------
DROP TABLE IF EXISTS `uc_user`;
CREATE TABLE `uc_user` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `USER_LOGINNAME` varchar(100) DEFAULT NULL COMMENT '登录账号',
  `USER_PASSWORD` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `USER_REALNAME` varchar(200) DEFAULT NULL COMMENT '姓名',
  `USER_SEX` varchar(10) DEFAULT NULL COMMENT '性别',
  `USER_DUTY` varchar(100) DEFAULT NULL COMMENT '职务',
  `USER_POST` varchar(100) DEFAULT NULL COMMENT '职位',
  `USER_IP` varchar(100) DEFAULT NULL COMMENT '登录IP',
  `USER_TEL` varchar(100) DEFAULT NULL COMMENT '电话',
  `USER_PHONE` varchar(100) DEFAULT NULL COMMENT '手机',
  `USER_EMAIL` varchar(100) DEFAULT NULL COMMENT 'Email',
  `USER_STATUS` varchar(100) DEFAULT NULL COMMENT '用户状态,1:正常,2;锁定',
  `USER_DESC` text COMMENT '备注',
  `USER_INDEX` decimal(65,30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of uc_user
-- ----------------------------
INSERT INTO `uc_user` VALUES ('00832A3C99D2464698A6D0F0C01FF971', '20131113031', '123456', '李育强', '0', null, '5', '2016.9', null, null, null, null, null, '0.000000000000000000000000000000');
INSERT INTO `uc_user` VALUES ('2F82C577E57F4474ADCF1371DB528699', '20131113029', '123456', '刘云娇', '1', '2', 'E438D7BABA384CC3B229FEBC0AAADBBF', '2016.9', null, '2', null, null, null, '0.000000000000000000000000000000');
INSERT INTO `uc_user` VALUES ('345706D83FE846F3A410EA36AF5EB214', '20131113030', '123456', '苗同学', '0', null, '5', '2016.9', null, null, null, null, null, '0.000000000000000000000000000000');
INSERT INTO `uc_user` VALUES ('4314065A5E0E43E9801158D489CB6F67', 'admin', '123456', '000000', '0', '2', '2', '2', null, '2', null, null, null, '0.000000000000000000000000000000');
INSERT INTO `uc_user` VALUES ('881AFEC600254DC0B13C2B7C52661CFF', '0000003', '123456', '宋导员', '1', '5', '5', '5', null, '5', null, null, null, '0.000000000000000000000000000000');
INSERT INTO `uc_user` VALUES ('D26CC15A7C1B475880AAD2515B61CF4E', '1', '123456', '1', '0', null, 'E438D7BABA384CC3B229FEBC0AAADBBF', '1', null, '1', null, null, null, '0.000000000000000000000000000000');
INSERT INTO `uc_user` VALUES ('E71F54BAFAF84C458B0C46B40E92ECD0', '0000002', '123456', '刘院长', '1', '1', '1', '1', null, '1', null, null, null, '0.000000000000000000000000000000');
INSERT INTO `uc_user` VALUES ('FCC876D093A2453FAE636D747EA1C9A2', '0000001', '123456', '李老师', '1', '4', '4', '4', null, '4', null, null, null, '0.000000000000000000000000000000');

-- ----------------------------
-- Table structure for `uc_user_dept`
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_dept`;
CREATE TABLE `uc_user_dept` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `DEPT_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uc_user_dept
-- ----------------------------
INSERT INTO `uc_user_dept` VALUES ('1', '424997CCBB444B8C806D2D0BD68104C5', '11');
INSERT INTO `uc_user_dept` VALUES ('11111', '2F82C577E57F4474ADCF1371DB528699', 'E438D7BABA384CC3B229FEBC0AAADBBF');
INSERT INTO `uc_user_dept` VALUES ('12', '9667CF7D75564AB5A6C1F56FBB4F2E39', '5');
INSERT INTO `uc_user_dept` VALUES ('2', '424997CCBB444B8C806D2D0BD68104C5', '1');
INSERT INTO `uc_user_dept` VALUES ('3', '424997CCBB444B8C806D2D0BD68104C5', '3');
INSERT INTO `uc_user_dept` VALUES ('4', '424997CCBB444B8C806D2D0BD68104C5', '4');
INSERT INTO `uc_user_dept` VALUES ('5', '424997CCBB444B8C806D2D0BD68104C5', '5');
INSERT INTO `uc_user_dept` VALUES ('6', 'D8ADE9407CE04FDA82E7375CBFFFBBB5', '1184A6C96E1D4F1380154618FA48A71D');
INSERT INTO `uc_user_dept` VALUES ('7', 'D8ADE9407CE04FDA82E7375CBFFFBBB5', '1184A6C96E1D4F1380154618FA48A71D');
INSERT INTO `uc_user_dept` VALUES ('8', 'D8ADE9407CE04FDA82E7375CBFFFBBB5', '1184A6C96E1D4F1380154618FA48A71D');
INSERT INTO `uc_user_dept` VALUES ('9', '9667CF7D75564AB5A6C1F56FBB4F2E39', 'AFE50F71A077494DA237C3244786890B');
INSERT INTO `uc_user_dept` VALUES ('90', '9667CF7D75564AB5A6C1F56FBB4F2E39', 'AFE50F71A077494DA237C3244786890B');

-- ----------------------------
-- Table structure for `uc_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_group`;
CREATE TABLE `uc_user_group` (
  `UG_ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) NOT NULL,
  `GROUP_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`UG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uc_user_group
-- ----------------------------
INSERT INTO `uc_user_group` VALUES ('64239B2299C14DEBB3107A25A026A165', '4314065A5E0E43E9801158D489CB6F67', '1');
INSERT INTO `uc_user_group` VALUES ('6EA4ABA326A644619F6673E17BD0E399', '4314065A5E0E43E9801158D489CB6F67', '1');
INSERT INTO `uc_user_group` VALUES ('8F65E89EAD534444984AF7AF5975C552', '4314065A5E0E43E9801158D489CB6F67', '3');

-- ----------------------------
-- Table structure for `uc_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_role`;
CREATE TABLE `uc_user_role` (
  `UR_ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) NOT NULL,
  `ROLE_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`UR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uc_user_role
-- ----------------------------
INSERT INTO `uc_user_role` VALUES ('07B032FA39CB4F9FBDF7A54EDEF462C7', '345706D83FE846F3A410EA36AF5EB214', '7B5292151E344ED6A411E94580F58EF1');
INSERT INTO `uc_user_role` VALUES ('3', 'FCC876D093A2453FAE636D747EA1C9A2', '507af6e13aec4055b0999aee0f3b9402');
INSERT INTO `uc_user_role` VALUES ('393010C707B54D7386E19A7D814FA447', '4314065A5E0E43E9801158D489CB6F67', 'e8899e27f86148ccb9445f4e3956da72');
INSERT INTO `uc_user_role` VALUES ('59224A4F51384EB696BE2C316881D81F', 'E8B7C4C1052140C69DB013F83F85E89A', '5ea9d643692a4f0e94002f0c17a0cc4c');
INSERT INTO `uc_user_role` VALUES ('650B6219AAD94E9BB26846A04F993C3F', '2F82C577E57F4474ADCF1371DB528699', '507af6e13aec4055b0999aee0f3b9402');
INSERT INTO `uc_user_role` VALUES ('91B7D34EABD74887907C84A8D98B613F', '00832A3C99D2464698A6D0F0C01FF971', '7B5292151E344ED6A411E94580F58EF1');
INSERT INTO `uc_user_role` VALUES ('C245E84095B047A99B1421F2B548A2B5', 'D26CC15A7C1B475880AAD2515B61CF4E', '7B5292151E344ED6A411E94580F58EF1');
INSERT INTO `uc_user_role` VALUES ('C7E8FE9C54284D91B9F5BE09AA85F697', '6E4F148A88F9426BB06F27532D72EC04', '1559AC34F1074AFAADBCE94AB473DFD2');
INSERT INTO `uc_user_role` VALUES ('ED7B344E9B3D4A849403CFEE3C999B5D', '2F82C577E57F4474ADCF1371DB528699', '7B5292151E344ED6A411E94580F58EF1');

-- ----------------------------
-- Table structure for `unit`
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `UNIT_ID` varchar(32) NOT NULL,
  `UN_COURSE_ID` varchar(32) DEFAULT NULL,
  `UNIT_NAME` text NOT NULL,
  `UNIT_CONTENT` text NOT NULL,
  `UNIT_REMAKE` text NOT NULL,
  PRIMARY KEY (`UNIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('2014201706122306618', null, '2', '2', '2');
INSERT INTO `unit` VALUES ('2600201705032105877', '5874201705032105170', '一（java）', 'java入门', '入门');
INSERT INTO `unit` VALUES ('2698201705032105577', '5874201705032105170', '二（java）', 'java精通', '精通');
INSERT INTO `unit` VALUES ('2726201705032105625', '4157201705032105108', '一（web）', 'web入门', '入门');
INSERT INTO `unit` VALUES ('2807201706122106398', '3422201705041405702', '多线程1', '多线程', '多线程');
INSERT INTO `unit` VALUES ('2813201706122106241', '8753201705261005214', '图', '图', '图');
INSERT INTO `unit` VALUES ('3335201705032105859', '3811201705032105230', '一(html)', 'web入门', '入门');
INSERT INTO `unit` VALUES ('4286201705032105208', '3811201705032105230', '二(html)', 'html精通', '精通');
INSERT INTO `unit` VALUES ('4695201705032105226', '1439201705032105196', '二（C++）', 'C++精通', '精通');
INSERT INTO `unit` VALUES ('4956201705041405732', '9720201705041405897', '第一章', '物理层', '物理层');
INSERT INTO `unit` VALUES ('5616201706122206647', null, '1', '1', '1');
INSERT INTO `unit` VALUES ('6854201705032105425', '1439201705032105196', '一（C++）', 'C++入门', '入门');
INSERT INTO `unit` VALUES ('8305201706122106367', '3422201705041405702', 'socket', 'socket通信', 'socket通信');
INSERT INTO `unit` VALUES ('8591201705032105593', '4354201705032105593', '二（c）', 'C语言精通', '精通');
INSERT INTO `unit` VALUES ('929720170503210504', '4354201705032105593', '一（c）', 'C语言入门', '入门');
INSERT INTO `unit` VALUES ('9814201705032105308', '4157201705032105108', '二（web）', 'web精通', '精通');

-- ----------------------------
-- Table structure for `up_resource`
-- ----------------------------
DROP TABLE IF EXISTS `up_resource`;
CREATE TABLE `up_resource` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `PID` varchar(32) DEFAULT NULL COMMENT '父资源ID',
  `RES_CODE` text COMMENT '资源编号',
  `RES_NAME` text NOT NULL COMMENT '资源名称',
  `RES_PATH` text COMMENT '资源路径',
  `RES_ICON` text COMMENT '资源图标',
  `RES_TYPE` varchar(100) NOT NULL COMMENT '资源类型，menu:菜单,url:链接',
  `APP_CODE` varchar(100) DEFAULT NULL COMMENT '应用编号，默认ID值，否则手填值',
  `RES_INDEX` decimal(65,30) DEFAULT NULL COMMENT '显示序号',
  `RES_FLOOR_CODE` text COMMENT '树形层级编号',
  `RES_FLOOR_NUM` decimal(38,0) DEFAULT NULL COMMENT '层级数',
  `RES_DESC` text COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of up_resource
-- ----------------------------
INSERT INTO `up_resource` VALUES ('0507C638502B4B048DA7EF697039D900', 'CCE2CAE9E73B41FB952284B25F8DD964', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('09DA46E9B53F473BBC169D2FF8B99FFD', '182B90379E744DC0BEBEFD244913119A', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('0A2A5C89ED8F461AACF401EE4688033D', '31B97B74083E408F94010D56245AE011', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('0A9E5B9688C44A989ECF91B30D3386EB', '4A1B561647F24C6CBA62AC1AB2D005E1', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('0C18570E90D341C9B64DA50B0999E5B3', '4E0520A2972A489C961861EF569F9B46', null, '查操作', null, null, '1', null, '4.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('0d647b121b844c8c9db0fb9b34cbdae3', '9a6fc7534e8b42d1a8173749f93dc46c', null, '人员信息', 'user/list', null, 'menu', 'vsupm-up', '2.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:9a6fc7534e8b42d1a8173749f93dc46c:0d647b121b844c8c9db0fb9b34cbdae3', '3', '企业人员基本信息维护');
INSERT INTO `up_resource` VALUES ('0E211C15E5B04834B16653028C21FF16', '0d647b121b844c8c9db0fb9b34cbdae3', null, '删操作', null, null, '1', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('15E2D8C0AACA48B4BD8DCFB6E3CAA634', '4011C4EB0FBC40FDB2C47B6F871DDBF4', null, '选课推荐', null, null, '0', null, '5.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('16C2BA7DBA774E618CB9A096E8A86676', '4A1B561647F24C6CBA62AC1AB2D005E1', null, '增操作', null, null, '1', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('175301D6F8EB4861A6F089D85B2B9264', '586395E3CC4F448CB726A067141D030A', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('182B90379E744DC0BEBEFD244913119A', 'BB0F87D16A764033ACC0B80BC027528E', null, '关系维护', 'relation/listTree', null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('24b059ca6b15448fa9a36affbc7233f2', '0', null, '权限中心', null, null, 'menu', null, '3.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2', '1', null);
INSERT INTO `up_resource` VALUES ('257B0FCFAC784E768AE6B7C9B2994530', 'B09871416BE24CC4821D9032215082C5', null, '查操作', null, null, '链接', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('265F22DEEF07420EA65AEB98DF3FC21F', 'E0ED3D9881EC4A36B97AB954CB257CFD', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('2C5FC01FEE58454D97DC97BA688EF1FB', '67298f18b65047ebad2626d3abce7d4b', null, '删操作', null, null, '1', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('2E582D52D5974181B7265C2F73B1BFA1', '34F89EC3FA3B43E587024C44DF34AF34', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('2F1E989FDBD141F48D41297AE87D4D21', '0', null, '个人信息', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('31B97B74083E408F94010D56245AE011', 'BB0F87D16A764033ACC0B80BC027528E', null, '职位管理', 'position/list', null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('325ea7ab8b114700930edfcb39e54b62', '50c55d7d42894090846d19b33ab7ee66', null, '资源维护', 'resource/list', null, 'menu', 'vsupm-up', '2.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:50c55d7d42894090846d19b33ab7ee66:325ea7ab8b114700930edfcb39e54b62', '3', null);
INSERT INTO `up_resource` VALUES ('34F89EC3FA3B43E587024C44DF34AF34', 'B6EA0CD7DC12410D961F3F1DC665BB9B', null, '课程管理', 'course/list', null, '菜单', null, '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('35E9281F41184588958CDB4E6DD7F045', '8E727B2FC6AC40AE8288F487137D6650', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('37F4224FE3A64E40B4F7766D4BD66D3E', 'E0ED3D9881EC4A36B97AB954CB257CFD', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('3CB30E16274F4FA5AF76CBA2CCB8020A', '0d647b121b844c8c9db0fb9b34cbdae3', null, '增操作', null, null, '1', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('3E9884400651429A8AA2789C6FFCB0C0', 'EDCBB920702B49999500A0A883A427DB', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('3EBCEDC4CD4440129BF62EFB1C0688D6', '4A1B561647F24C6CBA62AC1AB2D005E1', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('3F7EFF92FD9043ADBF962BF72B84C6DD', '34F89EC3FA3B43E587024C44DF34AF34', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('4011C4EB0FBC40FDB2C47B6F871DDBF4', '0', null, '推荐系统', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('40B816DEDA9B4BC6964136B084058BDC', '31B97B74083E408F94010D56245AE011', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('41C957FAA86F4A619E1A900A7013ED8E', '4E0520A2972A489C961861EF569F9B46', null, '删操作', null, null, '1', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('423C8E57CA0D4E0892452F31F179BD4E', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', null, '专业管理', 'major/list', null, '菜单', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('45AEAD19A30C420190C513D02EB0D876', '85E1BE421B9B4851BAC595378FDBD3C4', null, '增操作', null, null, '1', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('4A1B561647F24C6CBA62AC1AB2D005E1', 'BB0F87D16A764033ACC0B80BC027528E', null, '类型管理', 'companyType/list', null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('4D5EE6D8B8F64805BC5FF7976D61CD85', 'f91121dd1be3404587858b2b13147413', null, '改操作', null, null, '1', null, '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('4D8C733A24B14ADFA5BA3F5AAC48C6F6', '15E2D8C0AACA48B4BD8DCFB6E3CAA634', null, '选课推荐-企业技能', '/recommendCourse/chooseIndex', null, '菜单', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('4E0520A2972A489C961861EF569F9B46', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', null, '专业方向', 'majorDirect/list', null, '菜单', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('509DF19A0103477CB68D216018AD7FC5', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', null, '培养方案', 'cultivateScheme/list', null, '菜单', null, '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('50c55d7d42894090846d19b33ab7ee66', '24b059ca6b15448fa9a36affbc7233f2', null, '权限管理', null, null, 'menu', 'vsupm-up', '2.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:50c55d7d42894090846d19b33ab7ee66', '2', '管理企业人员使用各系统的权限');
INSERT INTO `up_resource` VALUES ('5525BDB4C8A648BEB5CF2B6FA061DFD9', '34F89EC3FA3B43E587024C44DF34AF34', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('585C7F3651E248148BF0A4A56A915973', 'B9364A7F1DD2479B8DDB0F791C1D7B35', null, '查操作', null, null, '链接', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('586395E3CC4F448CB726A067141D030A', 'B6EA0CD7DC12410D961F3F1DC665BB9B', null, '知识点管理', 'point/list', null, '菜单', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('58EB4ABB1E8E4EB995E189E60AC84015', '4011C4EB0FBC40FDB2C47B6F871DDBF4', null, '学习进度管理', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('5BF7FC4FE7154C4B8216034916EB2186', '4A1B561647F24C6CBA62AC1AB2D005E1', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('5ff63996da314c74a37cb664a1b17a20', '9a6fc7534e8b42d1a8173749f93dc46c', null, '分配角色', 'role/allotRole', null, 'menu', 'vsupm-up', '4.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:9a6fc7534e8b42d1a8173749f93dc46c:5ff63996da314c74a37cb664a1b17a20', '3', null);
INSERT INTO `up_resource` VALUES ('642AFB58A9A647FF9C390B1B384BC122', 'C55EEF5BF0A241B5AFCA830AC27C6EEC', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('67298f18b65047ebad2626d3abce7d4b', '9a6fc7534e8b42d1a8173749f93dc46c', null, '组织机构', 'dept/list', null, 'menu', 'vsupm-up', '1.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:9a6fc7534e8b42d1a8173749f93dc46c:67298f18b65047ebad2626d3abce7d4b', '3', '企业组织机构信息维护');
INSERT INTO `up_resource` VALUES ('67CF23842D504AE79556B2740193D5F2', 'B9364A7F1DD2479B8DDB0F791C1D7B35', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('6F7182141341469AAFB87A9722747A2F', '586395E3CC4F448CB726A067141D030A', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('7385C2D9CC834A2B886496E7D1002732', '0d647b121b844c8c9db0fb9b34cbdae3', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('739F9769B3A34F3CBE87B7FAB27FF533', '423C8E57CA0D4E0892452F31F179BD4E', null, '改操作', null, null, '1', null, '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('7B4B94DF026349B98655AC77BB93ABCA', '4011C4EB0FBC40FDB2C47B6F871DDBF4', null, '考试管理', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('7C410E1DD7C0415FA2610FFD2393AA19', '15E2D8C0AACA48B4BD8DCFB6E3CAA634', null, '课程  推荐--教学计划', 'recommendCourse/toPlan', null, '菜单', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('84CE2B6138054CAD974106BE2A2F2DC2', '85E1BE421B9B4851BAC595378FDBD3C4', null, '改操作', null, null, '1', null, '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('85E1BE421B9B4851BAC595378FDBD3C4', 'B6EA0CD7DC12410D961F3F1DC665BB9B', null, '课程类型管理', 'courseType/list', null, '菜单', null, '4.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('86E92E4E78654568838F224A28DCA91F', 'EDCBB920702B49999500A0A883A427DB', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('8A27D95DB5E44CEB92E91FDBA6983796', 'C4B9AA8DF38243C78B6DBF7512A3C76D', null, '个人信息管理', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('8af412d02ea24260b74968eb1db5b4c4', '9a6fc7534e8b42d1a8173749f93dc46c', null, '分配资源', 'user/listUser', null, 'menu', 'vsupm-up', '5.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:9a6fc7534e8b42d1a8173749f93dc46c:8af412d02ea24260b74968eb1db5b4c4', '3', null);
INSERT INTO `up_resource` VALUES ('8C95587100214A91BF0841B6F4BBE7A0', 'f91121dd1be3404587858b2b13147413', null, '增操作', null, null, '1', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('8E5C51A787ED419AB6D16FD114D82A86', 'CCE2CAE9E73B41FB952284B25F8DD964', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('8E727B2FC6AC40AE8288F487137D6650', '9a6fc7534e8b42d1a8173749f93dc46c', null, '角色维护', 'role/list', null, 'menu', 'vsupm-up', '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('95A6A4830D92434EAC231BD11770FEF3', '423C8E57CA0D4E0892452F31F179BD4E', null, '删操作', null, null, '1', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('971E81C8054B449F98DFC94A4DBFA3E5', '58EB4ABB1E8E4EB995E189E60AC84015', null, '学习进度', '/course/learnProgess', null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('9a6fc7534e8b42d1a8173749f93dc46c', '24b059ca6b15448fa9a36affbc7233f2', null, '组织架构', null, null, 'menu', 'vsupm-up', '1.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:9a6fc7534e8b42d1a8173749f93dc46c', '2', '主要管理企业人员、部门');
INSERT INTO `up_resource` VALUES ('9AD732EB271E406E8BDC3CFC19F8CCB2', '67298f18b65047ebad2626d3abce7d4b', null, '改操作', null, null, '1', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('9D41CAC61DB34C0489FED62DA8737C05', 'CCE2CAE9E73B41FB952284B25F8DD964', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('A18068A4EF3144E8B00200A568CD72E5', 'E0ED3D9881EC4A36B97AB954CB257CFD', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('A414E2929C0D43F4937ACEE2F30DC8EA', 'E0ED3D9881EC4A36B97AB954CB257CFD', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('AA181C78517E4088A783785FD4AEE618', '423C8E57CA0D4E0892452F31F179BD4E', null, '增操作', null, null, '1', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('AB8786FA555E43B9833FB13956CC6AC3', '31B97B74083E408F94010D56245AE011', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('ACD8CD60C985461990D48E77513D5500', 'C55EEF5BF0A241B5AFCA830AC27C6EEC', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('AECBCDEAA63D42EDAB49157F851C348F', '34F89EC3FA3B43E587024C44DF34AF34', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('B05A67E22C6842EC9EDE06A5636CA61F', 'CCE2CAE9E73B41FB952284B25F8DD964', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('B09871416BE24CC4821D9032215082C5', '7B4B94DF026349B98655AC77BB93ABCA', null, '试卷管理', 'paper/list', null, '菜单', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('B34C63C136F74E95800D9AD96BBD859E', 'f91121dd1be3404587858b2b13147413', null, '查操作', null, null, '1', null, '4.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('B6A120BB3EA84125BBDB772D4DE4C062', 'C55EEF5BF0A241B5AFCA830AC27C6EEC', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('B6EA0CD7DC12410D961F3F1DC665BB9B', '4011C4EB0FBC40FDB2C47B6F871DDBF4', null, '课程管理', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('B9364A7F1DD2479B8DDB0F791C1D7B35', 'BB0F87D16A764033ACC0B80BC027528E', null, '公司管理', 'company/list', null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('BB0F87D16A764033ACC0B80BC027528E', '4011C4EB0FBC40FDB2C47B6F871DDBF4', null, '就业管理', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('BBFD01104F9B49EA944B14B975038E41', '67298f18b65047ebad2626d3abce7d4b', null, '增操作', null, null, '1', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('BC1B8A9F93044E5796FF6768AE5F402E', 'B6EA0CD7DC12410D961F3F1DC665BB9B', null, '课程关系维护', 'courseRelation/toList', null, '菜单', null, '5.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('BC23D7EA5A764C309AB1E4B24EB34271', '31B97B74083E408F94010D56245AE011', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('BF4D65C501AA42E9A3D51F295A797C59', 'C55EEF5BF0A241B5AFCA830AC27C6EEC', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('C02B305E46D545F2B0731E0A7CEF93A7', '325ea7ab8b114700930edfcb39e54b62', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('C2665117D00E4DAABE6768D88A722CD6', '8E727B2FC6AC40AE8288F487137D6650', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('C4B9AA8DF38243C78B6DBF7512A3C76D', '2F1E989FDBD141F48D41297AE87D4D21', null, '个人信息', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('C55EEF5BF0A241B5AFCA830AC27C6EEC', '7B4B94DF026349B98655AC77BB93ABCA', null, '成绩管理', 'resultInfo/list', null, '菜单', null, '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('CA0119C9E36F4F65886BD6173D0EC6A4', '8E727B2FC6AC40AE8288F487137D6650', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('CCE2CAE9E73B41FB952284B25F8DD964', '7B4B94DF026349B98655AC77BB93ABCA', null, '题目管理', 'paperDetial/list', null, '菜单', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('D00796E9B3C844D1ABBFF01C34415B7C', '423C8E57CA0D4E0892452F31F179BD4E', null, '查操作', null, null, '1', null, '4.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('D0B2B4DDF0A34AF5B79E4157429C5B5C', '4011C4EB0FBC40FDB2C47B6F871DDBF4', null, '专业管理', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('D2A0BC0C91FE46418DD1C88AFEFA880C', 'B09871416BE24CC4821D9032215082C5', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('D2C13BC7D50D4D8DB3A13AF484FEA15B', '586395E3CC4F448CB726A067141D030A', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('D7891B3F690C410AA53C09BE7B812430', '85E1BE421B9B4851BAC595378FDBD3C4', null, '查操作', null, null, '1', null, '4.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('DA198A17A47C4A059C93522E505D015E', 'B09871416BE24CC4821D9032215082C5', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('DA55F5041D1F4CBCA800FA72C289585C', 'B09871416BE24CC4821D9032215082C5', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('DCF58E5DD9E8485981AC1E139CDD8C10', 'B9364A7F1DD2479B8DDB0F791C1D7B35', null, '改操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('DF025269726F41CEA76110634FC25147', 'EDCBB920702B49999500A0A883A427DB', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('DF0909F71CD54992AB3A2C6AD8569A2A', '586395E3CC4F448CB726A067141D030A', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('DF9921D27A6D4ACAAD12223FCA723D0C', '85E1BE421B9B4851BAC595378FDBD3C4', null, '删操作', null, null, '1', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('E0739469A8294488A2DBD435641ABFAD', 'f91121dd1be3404587858b2b13147413', null, '删操作', null, null, '1', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('E0ED3D9881EC4A36B97AB954CB257CFD', 'B6EA0CD7DC12410D961F3F1DC665BB9B', null, '单元管理', 'unit/list', null, '菜单', null, '2.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('E162B03DD30C4414AA7AEFB1A19DA880', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', null, '教学计划管理', 'planRelation/listTree', null, '菜单', null, '4.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('E5CD521A4A3F4219B6E846C3A40031FB', '325ea7ab8b114700930edfcb39e54b62', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('E62BFFCB8AF2475681CE0D4F1A5BD0EE', '67298f18b65047ebad2626d3abce7d4b', null, '查操作', null, null, '1', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('E653AEBCB9D64DA2AD525EC325677421', '4E0520A2972A489C961861EF569F9B46', null, '改操作', null, null, '1', null, '3.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('EDCBB920702B49999500A0A883A427DB', 'BB0F87D16A764033ACC0B80BC027528E', null, '技术管理', 'technology/list', null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('EDDB09362DE34711A6FDF05CBC48CA87', '0d647b121b844c8c9db0fb9b34cbdae3', null, '查操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('EEF0512C777048ACA0080878799783B2', '325ea7ab8b114700930edfcb39e54b62', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('EF379A6409C74EB4B10AC0D3BBD9533B', 'B9364A7F1DD2479B8DDB0F791C1D7B35', null, '删操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('F2DE0C62D3914C8F9717D89A79D50E78', '325ea7ab8b114700930edfcb39e54b62', null, '增操作', null, null, '菜单', null, null, null, null, null);
INSERT INTO `up_resource` VALUES ('F5EA9786342C42888A54D43CD8F878D5', '4E0520A2972A489C961861EF569F9B46', null, '增操作', null, null, '1', null, '1.000000000000000000000000000000', null, null, null);
INSERT INTO `up_resource` VALUES ('f91121dd1be3404587858b2b13147413', '50c55d7d42894090846d19b33ab7ee66', null, '角色管理', 'role/roleRes', null, 'menu', 'vsupm-up', '3.000000000000000000000000000000', '0:24b059ca6b15448fa9a36affbc7233f2:50c55d7d42894090846d19b33ab7ee66:f91121dd1be3404587858b2b13147413', '3', null);
INSERT INTO `up_resource` VALUES ('FBD2330853F64F31A2354F09AEA42D4D', '8E727B2FC6AC40AE8288F487137D6650', null, '删操作', null, null, '菜单', null, null, null, null, null);

-- ----------------------------
-- Table structure for `up_role`
-- ----------------------------
DROP TABLE IF EXISTS `up_role`;
CREATE TABLE `up_role` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `ROLE_NAME` varchar(200) NOT NULL COMMENT '角色名',
  `ROLE_DESC` text COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of up_role
-- ----------------------------
INSERT INTO `up_role` VALUES ('1559AC34F1074AFAADBCE94AB473DFD2', '公司HR', '公司HR');
INSERT INTO `up_role` VALUES ('507af6e13aec4055b0999aee0f3b9402', '老师', '学校老师集合');
INSERT INTO `up_role` VALUES ('7B5292151E344ED6A411E94580F58EF1', '学生', '学校中学生集合');
INSERT INTO `up_role` VALUES ('e8899e27f86148ccb9445f4e3956da72', '超级管理员', '拥有所有权限');

-- ----------------------------
-- Table structure for `up_role_resource_relation`
-- ----------------------------
DROP TABLE IF EXISTS `up_role_resource_relation`;
CREATE TABLE `up_role_resource_relation` (
  `ROREID` varchar(32) NOT NULL,
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色ID',
  `RES_ID` varchar(32) NOT NULL COMMENT '资源_ID',
  `RES_CHECKED_STATE` varchar(100) DEFAULT NULL COMMENT '资源状态，用于构建资源树和授权显示控制',
  PRIMARY KEY (`ROREID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of up_role_resource_relation
-- ----------------------------
INSERT INTO `up_role_resource_relation` VALUES ('0004A058E306491492A98EA5AEBF9D23', '7B5292151E344ED6A411E94580F58EF1', '971E81C8054B449F98DFC94A4DBFA3E5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('0046DE288A554B76BE477DED5F62AE7F', 'e8899e27f86148ccb9445f4e3956da72', '265F22DEEF07420EA65AEB98DF3FC21F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('05F8A43633DE45CF92B2B811CC2F455A', 'e8899e27f86148ccb9445f4e3956da72', 'CCE2CAE9E73B41FB952284B25F8DD964', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('06BAC679320341E991D636632C6195DE', '7B5292151E344ED6A411E94580F58EF1', 'AECBCDEAA63D42EDAB49157F851C348F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('0976F5F0DD7E4829880CC9108EA616FA', 'e8899e27f86148ccb9445f4e3956da72', 'DA198A17A47C4A059C93522E505D015E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('0CCE564F68984C228A03E7997D03F2E1', '7B5292151E344ED6A411E94580F58EF1', '0507C638502B4B048DA7EF697039D900', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('0E2D94A861B64558AFD97811774ADB16', '7B5292151E344ED6A411E94580F58EF1', '586395E3CC4F448CB726A067141D030A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('0F3DEB2C38FC4B7589B54ED45229677F', 'e8899e27f86148ccb9445f4e3956da72', '58EB4ABB1E8E4EB995E189E60AC84015', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('0F79DC0046414790811A552C0F0A4934', 'e8899e27f86148ccb9445f4e3956da72', '16C2BA7DBA774E618CB9A096E8A86676', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('1010F601F7784DCC88786DBA209C3E04', 'e8899e27f86148ccb9445f4e3956da72', '67CF23842D504AE79556B2740193D5F2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('158FB1E400D94F139BD566FE38E0CA0A', 'e8899e27f86148ccb9445f4e3956da72', 'C02B305E46D545F2B0731E0A7CEF93A7', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('17204C0FFDFC47EABAD541EA0498CCB0', 'e8899e27f86148ccb9445f4e3956da72', '4D8C733A24B14ADFA5BA3F5AAC48C6F6', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('17E5B49D8C8742F9B98FA77B6E76D8B4', 'e8899e27f86148ccb9445f4e3956da72', '257B0FCFAC784E768AE6B7C9B2994530', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('18BBD5DF09BD487AA1BAC79D2A512B0D', 'e8899e27f86148ccb9445f4e3956da72', 'D7891B3F690C410AA53C09BE7B812430', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('18BD656357504934B79A8EDAC022B599', 'e8899e27f86148ccb9445f4e3956da72', '0d647b121b844c8c9db0fb9b34cbdae3', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('193AC9E2262545AA95C2B678678E3527', 'e8899e27f86148ccb9445f4e3956da72', 'AB8786FA555E43B9833FB13956CC6AC3', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('19C730F23C4F48CA82F065325F9624DF', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'F2DE0C62D3914C8F9717D89A79D50E78', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('1A4FA5E3E2074D3A869E8A9233AA5D9C', 'e8899e27f86148ccb9445f4e3956da72', '50c55d7d42894090846d19b33ab7ee66', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('1AFC257A22C64E28A318B87C6FDF468C', '7B5292151E344ED6A411E94580F58EF1', 'A414E2929C0D43F4937ACEE2F30DC8EA', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('1BCD2B7F3F0E4FB9AF77A4CB276CFAF5', 'e8899e27f86148ccb9445f4e3956da72', '5BF7FC4FE7154C4B8216034916EB2186', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('2089E02A6DA1495F88EE18D93368ABCB', 'e8899e27f86148ccb9445f4e3956da72', 'B9364A7F1DD2479B8DDB0F791C1D7B35', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('2113F2EA522A4092B21F194073E3D476', 'e8899e27f86148ccb9445f4e3956da72', '509DF19A0103477CB68D216018AD7FC5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('220451873BF64D45AD3C51C0CED0B96D', '7B5292151E344ED6A411E94580F58EF1', '7B4B94DF026349B98655AC77BB93ABCA', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('2270453E373844B2BAAD0B244C566718', '7B5292151E344ED6A411E94580F58EF1', '3EBCEDC4CD4440129BF62EFB1C0688D6', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('23D5EEFE0F4E4D29A9F39158BF62035D', 'e8899e27f86148ccb9445f4e3956da72', 'E0ED3D9881EC4A36B97AB954CB257CFD', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('26C3C8087A424AD19C402F446E173749', '7B5292151E344ED6A411E94580F58EF1', '642AFB58A9A647FF9C390B1B384BC122', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('276EE62EE3F844049B2C1FEC768FAC00', 'e8899e27f86148ccb9445f4e3956da72', 'E62BFFCB8AF2475681CE0D4F1A5BD0EE', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('29558F1725F54A9FAD970ABD40AAFC27', '7B5292151E344ED6A411E94580F58EF1', 'C55EEF5BF0A241B5AFCA830AC27C6EEC', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('29B56BD51E574F3EA3C730178BA0F41B', 'e8899e27f86148ccb9445f4e3956da72', '45AEAD19A30C420190C513D02EB0D876', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('2B0BF4797AA24B6981C2294A2DC8DC23', 'e8899e27f86148ccb9445f4e3956da72', 'C2665117D00E4DAABE6768D88A722CD6', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('2C0769E9AC8840109E4A820447ED8119', '7B5292151E344ED6A411E94580F58EF1', 'BC1B8A9F93044E5796FF6768AE5F402E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('2FC2DCECDC8B48DCBA4A223D7B20469F', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'C2665117D00E4DAABE6768D88A722CD6', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('310EE0E73B8340C5B294B173D2C04F5D', 'e8899e27f86148ccb9445f4e3956da72', 'E162B03DD30C4414AA7AEFB1A19DA880', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('33CDA00662774B9F9074D0BF2BBAEB79', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '7385C2D9CC834A2B886496E7D1002732', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('34CC00A026764F39A81CE761C3A50023', 'e8899e27f86148ccb9445f4e3956da72', '8af412d02ea24260b74968eb1db5b4c4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('350AF73F47404B73ACEE5FA603F1A6D0', 'e8899e27f86148ccb9445f4e3956da72', '9D41CAC61DB34C0489FED62DA8737C05', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('359CC72D0BC04C2AA98FEDDF9CCB7991', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '0d647b121b844c8c9db0fb9b34cbdae3', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('375108F1CBA74B94BA2213452E45BB9F', '7B5292151E344ED6A411E94580F58EF1', 'DF025269726F41CEA76110634FC25147', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('37E17791504242A1A0BA6AD487C20E7B', 'e8899e27f86148ccb9445f4e3956da72', 'F5EA9786342C42888A54D43CD8F878D5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('3849A04CA514431E9873BC8F4C90310B', 'e8899e27f86148ccb9445f4e3956da72', 'BC1B8A9F93044E5796FF6768AE5F402E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('3938F83C322847EF941A113E500B93D6', 'e8899e27f86148ccb9445f4e3956da72', '84CE2B6138054CAD974106BE2A2F2DC2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('39C5DD194E194222BC36AB4B811253F8', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '9AD732EB271E406E8BDC3CFC19F8CCB2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('3ACC4D1560C84DC2A262F14383212475', 'e8899e27f86148ccb9445f4e3956da72', '4E0520A2972A489C961861EF569F9B46', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('3BA1850C4B6C42329D19E9E96246C88A', 'e8899e27f86148ccb9445f4e3956da72', '0A2A5C89ED8F461AACF401EE4688033D', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('3D488FB5969D4FF4B76116B87038D26F', '7B5292151E344ED6A411E94580F58EF1', 'E162B03DD30C4414AA7AEFB1A19DA880', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('3D5C56CE08AF4F368DD24C1FFABA4D16', 'e8899e27f86148ccb9445f4e3956da72', 'DF025269726F41CEA76110634FC25147', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('3F613B45C6F040F3A062873F3B6885A9', '7B5292151E344ED6A411E94580F58EF1', '16C2BA7DBA774E618CB9A096E8A86676', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('414A15F452A44D1A94767761D331C09D', '7B5292151E344ED6A411E94580F58EF1', '3F7EFF92FD9043ADBF962BF72B84C6DD', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('41896605C5CC4A2A8CAB51025EE5D5DB', 'e8899e27f86148ccb9445f4e3956da72', 'B05A67E22C6842EC9EDE06A5636CA61F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('433C4A7D8BC546F694CB180CE7E9E75A', '7B5292151E344ED6A411E94580F58EF1', '34F89EC3FA3B43E587024C44DF34AF34', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('433F379A3E854C13BFC155D8478EF6E0', 'e8899e27f86148ccb9445f4e3956da72', '0507C638502B4B048DA7EF697039D900', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('446517484771467CA04414ABC8DBBC77', 'e8899e27f86148ccb9445f4e3956da72', '85E1BE421B9B4851BAC595378FDBD3C4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('463C8EEC9EC24A2D94E697776F23F321', 'e8899e27f86148ccb9445f4e3956da72', '31B97B74083E408F94010D56245AE011', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('482FFB8F2B684F4DADD9AAE667F83F7B', '7B5292151E344ED6A411E94580F58EF1', 'D2A0BC0C91FE46418DD1C88AFEFA880C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('483C31D946CD4C17AA0135E2636171F4', 'e8899e27f86148ccb9445f4e3956da72', 'E5CD521A4A3F4219B6E846C3A40031FB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('4969A7D165DC41A2BD94F15138836BC1', '7B5292151E344ED6A411E94580F58EF1', 'B09871416BE24CC4821D9032215082C5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('4B4A643FF9594B89AA946875ED0E3E21', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'FBD2330853F64F31A2354F09AEA42D4D', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('4F5B9139DCDD41DC9C9DC54CEF589E55', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '5ff63996da314c74a37cb664a1b17a20', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('4F6F21C149AD41BFBFE6724F0AEC59AE', 'e8899e27f86148ccb9445f4e3956da72', 'BB0F87D16A764033ACC0B80BC027528E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('5014CB325E1E436BB9E92D7F7F8447E9', '7B5292151E344ED6A411E94580F58EF1', '2F1E989FDBD141F48D41297AE87D4D21', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('506CF5CC6DF04CF49B35A9A8ACA9564C', 'e8899e27f86148ccb9445f4e3956da72', 'BF4D65C501AA42E9A3D51F295A797C59', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('51E3D06F708D4709B1602636D611D4A6', '7B5292151E344ED6A411E94580F58EF1', 'AB8786FA555E43B9833FB13956CC6AC3', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('51FD1EB42661419FBEA66D857FE9027E', 'e8899e27f86148ccb9445f4e3956da72', '4011C4EB0FBC40FDB2C47B6F871DDBF4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('537D8618925B40CAAE4D5458B7407827', 'e8899e27f86148ccb9445f4e3956da72', 'EDCBB920702B49999500A0A883A427DB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('5863F37ADFF64DB3AFFFBE6F0B729AAF', 'e8899e27f86148ccb9445f4e3956da72', '175301D6F8EB4861A6F089D85B2B9264', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('591D985A6E654772AF7AF58D2A6E2807', '7B5292151E344ED6A411E94580F58EF1', '67CF23842D504AE79556B2740193D5F2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('59746BF051D74CB6A48CB5736FF98A7B', '7B5292151E344ED6A411E94580F58EF1', 'B05A67E22C6842EC9EDE06A5636CA61F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('5A2E2272E82B4E1D82F1D94CB9924569', 'e8899e27f86148ccb9445f4e3956da72', 'DCF58E5DD9E8485981AC1E139CDD8C10', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('5B71F288F9394C17AE4D7DE7E6E18AC2', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'E62BFFCB8AF2475681CE0D4F1A5BD0EE', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('5CDD6238CA2842BAB2CF066BF8C52AB1', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '8af412d02ea24260b74968eb1db5b4c4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('61BB3D12BECB4C3A8D94403D68BA687D', '7B5292151E344ED6A411E94580F58EF1', '2E582D52D5974181B7265C2F73B1BFA1', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('63D7E22545BF49C7B0DAF15C1E7D83B5', 'e8899e27f86148ccb9445f4e3956da72', '6F7182141341469AAFB87A9722747A2F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('649A9829B7C0478F8E00032B3F5084F5', '7B5292151E344ED6A411E94580F58EF1', 'EF379A6409C74EB4B10AC0D3BBD9533B', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('64F11F400B6148228D9BF329EE3E80CC', '7B5292151E344ED6A411E94580F58EF1', '4A1B561647F24C6CBA62AC1AB2D005E1', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('65DE671A392C4FBBBE756E05E3193CD3', '7B5292151E344ED6A411E94580F58EF1', 'DA198A17A47C4A059C93522E505D015E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('65EB3154CE7C402297AF2BEC30129717', 'e8899e27f86148ccb9445f4e3956da72', 'BBFD01104F9B49EA944B14B975038E41', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('65F5431C4AB84C298BEFDF82D0C20B45', '7B5292151E344ED6A411E94580F58EF1', 'E0ED3D9881EC4A36B97AB954CB257CFD', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('66B0F8C9F68C4A1EA1AD19BCDDF70B94', 'e8899e27f86148ccb9445f4e3956da72', '2E582D52D5974181B7265C2F73B1BFA1', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('675EBF5F296D428A87CF3183D5BAB3CA', '7B5292151E344ED6A411E94580F58EF1', '4E0520A2972A489C961861EF569F9B46', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('6786B121CFB14D4C923F7ED49689AE30', 'e8899e27f86148ccb9445f4e3956da72', '4A1B561647F24C6CBA62AC1AB2D005E1', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('69249C3912404AA7B194B437513ED433', 'e8899e27f86148ccb9445f4e3956da72', '7C410E1DD7C0415FA2610FFD2393AA19', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('6990A9644D1C4010947038585A9A01EF', '7B5292151E344ED6A411E94580F58EF1', '4D8C733A24B14ADFA5BA3F5AAC48C6F6', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('69A672AACCEF45AF8BC9767CD2F24B58', '7B5292151E344ED6A411E94580F58EF1', '4011C4EB0FBC40FDB2C47B6F871DDBF4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('69FBB34FD0CE4341A438162871CBDDBC', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '24b059ca6b15448fa9a36affbc7233f2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('6B1333E5FBC84189BEF80828A1CF5489', '7B5292151E344ED6A411E94580F58EF1', '0A9E5B9688C44A989ECF91B30D3386EB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('6BFCAE7875574CE68BEC31F94AD8B7F1', '7B5292151E344ED6A411E94580F58EF1', 'B2F068E3795A43A7952567521C568215', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('6DB0CBBE70B645CAAB833213F1C3C5CE', 'e8899e27f86148ccb9445f4e3956da72', 'ACD8CD60C985461990D48E77513D5500', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('6E7E07BDC6024711871F817B07AE5D2C', '7B5292151E344ED6A411E94580F58EF1', 'D072186E3CEC44E2A5956A40292826FD', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('6F9311F3390241C9BF3D6CD524725730', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'EDDB09362DE34711A6FDF05CBC48CA87', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('717F4856F6B640FD88147A32AFA297EF', '7B5292151E344ED6A411E94580F58EF1', 'A18068A4EF3144E8B00200A568CD72E5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('7387A56C5EDA45E790016A725CDFBD2A', 'e8899e27f86148ccb9445f4e3956da72', '423C8E57CA0D4E0892452F31F179BD4E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('738FDE2FCD214EC08FBF8754BC492224', 'e8899e27f86148ccb9445f4e3956da72', '325ea7ab8b114700930edfcb39e54b62', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('7428B245E8C445EEAEA89A93D197D8E0', '7B5292151E344ED6A411E94580F58EF1', 'BF4D65C501AA42E9A3D51F295A797C59', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('75C15629A60D472C8B2E4233B64F83D6', '7B5292151E344ED6A411E94580F58EF1', 'D2C13BC7D50D4D8DB3A13AF484FEA15B', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('75D6458B3F964CC99E0AB7737044885A', 'e8899e27f86148ccb9445f4e3956da72', 'B09871416BE24CC4821D9032215082C5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('7753C5D781D748669B5B583C37133484', '7B5292151E344ED6A411E94580F58EF1', '3E9884400651429A8AA2789C6FFCB0C0', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('778DBD00AF954AA8A6B67716029B5FB0', 'e8899e27f86148ccb9445f4e3956da72', '9a6fc7534e8b42d1a8173749f93dc46c', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('7882BFA33CFC4FE6AE692AB2EDB38CB8', '7B5292151E344ED6A411E94580F58EF1', '5BF7FC4FE7154C4B8216034916EB2186', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('79BBBD78C83E41DA804C1C2886D72DC7', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '3CB30E16274F4FA5AF76CBA2CCB8020A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('7A058E750C40461A94AFF434415324C7', '7B5292151E344ED6A411E94580F58EF1', '182B90379E744DC0BEBEFD244913119A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('7CA4883CD070424E82584821CB331342', 'e8899e27f86148ccb9445f4e3956da72', 'FBD2330853F64F31A2354F09AEA42D4D', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('7CD238E242764CF892568AFB48A22984', '7B5292151E344ED6A411E94580F58EF1', 'EDCBB920702B49999500A0A883A427DB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8181E5C8371D469490B6EB6A4F598696', 'e8899e27f86148ccb9445f4e3956da72', '3CB30E16274F4FA5AF76CBA2CCB8020A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('82FACEB936184620A369F5E49C0D2994', '7B5292151E344ED6A411E94580F58EF1', 'ACD8CD60C985461990D48E77513D5500', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('831F10CB172D4F5C8AAC47C3EA426605', 'e8899e27f86148ccb9445f4e3956da72', '5525BDB4C8A648BEB5CF2B6FA061DFD9', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8358F338370A44F9A80C059FD6AAE04D', '7B5292151E344ED6A411E94580F58EF1', 'C4B9AA8DF38243C78B6DBF7512A3C76D', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('835B7C4620BC4B19A45FE23CA67F133C', '7B5292151E344ED6A411E94580F58EF1', '423C8E57CA0D4E0892452F31F179BD4E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('837A106E38354CF694ED9478531CF149', '7B5292151E344ED6A411E94580F58EF1', 'DF0909F71CD54992AB3A2C6AD8569A2A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('84F8249FF9414382B07A508AAF968439', 'e8899e27f86148ccb9445f4e3956da72', 'AECBCDEAA63D42EDAB49157F851C348F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('86D781AF9A4C4AFE84E4633C2F957A1F', 'e8899e27f86148ccb9445f4e3956da72', '642AFB58A9A647FF9C390B1B384BC122', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8A22CCF16B9E443A85E46FC0A264AB4A', 'e8899e27f86148ccb9445f4e3956da72', 'BC23D7EA5A764C309AB1E4B24EB34271', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8B42C54684D245EF8985D2B6EC7203D5', 'e8899e27f86148ccb9445f4e3956da72', '09DA46E9B53F473BBC169D2FF8B99FFD', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8BCB2ECAC68F47E3967E468A6D46D92C', '7B5292151E344ED6A411E94580F58EF1', '58EB4ABB1E8E4EB995E189E60AC84015', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8E2FF11A7DCF44B7A802EF14DD0535FD', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '35E9281F41184588958CDB4E6DD7F045', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8E48E03A5FAA47D4B96B9AF89E2C7F81', '7B5292151E344ED6A411E94580F58EF1', '86E92E4E78654568838F224A28DCA91F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('8FB7E8205AFB4962AC87EB0F58FF389F', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '8E727B2FC6AC40AE8288F487137D6650', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('901A5DFDA4044827939CBE28D99A91CE', 'e8899e27f86148ccb9445f4e3956da72', '35E9281F41184588958CDB4E6DD7F045', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('90578F57932C43BA916F8AC3D63C9409', '7B5292151E344ED6A411E94580F58EF1', '31B97B74083E408F94010D56245AE011', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('906775C8DB2045AB9F34F50A4FE3B671', '7B5292151E344ED6A411E94580F58EF1', '85E1BE421B9B4851BAC595378FDBD3C4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('90721000D79942F0A3EB7480BA6D9E56', '7B5292151E344ED6A411E94580F58EF1', '09DA46E9B53F473BBC169D2FF8B99FFD', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('911DE2B653554E2CAF936F255998B3B8', 'e8899e27f86148ccb9445f4e3956da72', '15E2D8C0AACA48B4BD8DCFB6E3CAA634', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('95BACFBB39B845C0959DB0E509FACE1F', '7B5292151E344ED6A411E94580F58EF1', '509DF19A0103477CB68D216018AD7FC5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('971DF47B6BB147FCA9A943EC8B8B0ED5', 'e8899e27f86148ccb9445f4e3956da72', '3EBCEDC4CD4440129BF62EFB1C0688D6', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('9732D1D48D914FC7A08C78CAA4C6A6C7', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'E5CD521A4A3F4219B6E846C3A40031FB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('9800D66EDC184FA5B31CB7EA3313AC0C', 'e8899e27f86148ccb9445f4e3956da72', '5ff63996da314c74a37cb664a1b17a20', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('980DEEDA24214124955048D2720B5406', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '67298f18b65047ebad2626d3abce7d4b', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('990F37AC69A54BA9AB666C0DED87BFDF', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '2C5FC01FEE58454D97DC97BA688EF1FB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('9AF2592F981E419FAD8DC0DBA9E92CE3', '7B5292151E344ED6A411E94580F58EF1', '5525BDB4C8A648BEB5CF2B6FA061DFD9', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('9C7945A3DE424CB4B11525C0D54B4879', 'e8899e27f86148ccb9445f4e3956da72', '9AD732EB271E406E8BDC3CFC19F8CCB2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('9D0D90D3199442D1BA3CBEFCD05AAA85', 'e8899e27f86148ccb9445f4e3956da72', '0E211C15E5B04834B16653028C21FF16', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A0293054E339431499A13EC13A3E8952', 'e8899e27f86148ccb9445f4e3956da72', 'DF0909F71CD54992AB3A2C6AD8569A2A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A0662B2C120246C59B3FE2E1ADC071D3', 'e8899e27f86148ccb9445f4e3956da72', '40B816DEDA9B4BC6964136B084058BDC', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A1530D7B540B40168B33C58AA4472177', 'e8899e27f86148ccb9445f4e3956da72', '3F7EFF92FD9043ADBF962BF72B84C6DD', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A1F89F7D27344A71A5DF8C3E5B1AB653', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '325ea7ab8b114700930edfcb39e54b62', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A21ED0471A4E4D0489DD4C1AACD1030A', 'e8899e27f86148ccb9445f4e3956da72', 'EF379A6409C74EB4B10AC0D3BBD9533B', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A23EFD0A9A8244BE86CF3077079FF8AC', 'e8899e27f86148ccb9445f4e3956da72', 'B6EA0CD7DC12410D961F3F1DC665BB9B', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A33E8B119AC64D4281764946D67EC2F1', 'e8899e27f86148ccb9445f4e3956da72', '182B90379E744DC0BEBEFD244913119A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A607E556CED74E83BA022F3CBC6CC721', 'e8899e27f86148ccb9445f4e3956da72', '86E92E4E78654568838F224A28DCA91F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A6AA59BF82B54DD7879CE5E185107F69', '7B5292151E344ED6A411E94580F58EF1', 'BB0F87D16A764033ACC0B80BC027528E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('A8352C0F00374A6CB46803A659B46577', 'e8899e27f86148ccb9445f4e3956da72', '3E9884400651429A8AA2789C6FFCB0C0', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('AA6D1734F7024F1C86042636962A6FB8', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'EEF0512C777048ACA0080878799783B2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('AB57FA3FAC27444FAB2AEF8BF53E604A', 'e8899e27f86148ccb9445f4e3956da72', 'DA55F5041D1F4CBCA800FA72C289585C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('AB60E2F60AF74FAD89310645C2A3F20D', 'e8899e27f86148ccb9445f4e3956da72', '739F9769B3A34F3CBE87B7FAB27FF533', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('AF42ABDDF8E44261A75BC8F6FAE61752', 'e8899e27f86148ccb9445f4e3956da72', '95A6A4830D92434EAC231BD11770FEF3', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B155BE49B1CF46F2BA4D47377AFE0C20', 'e8899e27f86148ccb9445f4e3956da72', '41C957FAA86F4A619E1A900A7013ED8E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B17AF47141EB4397884329FC6D3A5BB9', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'CA0119C9E36F4F65886BD6173D0EC6A4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B3FF2BC5334E4616BCFDD7CB9A21DE3D', '7B5292151E344ED6A411E94580F58EF1', '8E5C51A787ED419AB6D16FD114D82A86', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B4201AE15E0345069128B1E272DBBEEA', 'e8899e27f86148ccb9445f4e3956da72', 'D2A0BC0C91FE46418DD1C88AFEFA880C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B647DBFCE6E547D0AA7D4314C233E373', 'e8899e27f86148ccb9445f4e3956da72', '2C5FC01FEE58454D97DC97BA688EF1FB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B66AF9E65BE1493DBE1A472B97154FE2', '7B5292151E344ED6A411E94580F58EF1', 'DA55F5041D1F4CBCA800FA72C289585C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B6C93B9E067B40099663A44F50D33A52', 'e8899e27f86148ccb9445f4e3956da72', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B6F20737917E42B9B0F94FF7B103D489', 'e8899e27f86148ccb9445f4e3956da72', '7B4B94DF026349B98655AC77BB93ABCA', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B7498F3CF7074DE0A89BBC4A82D671CC', '7B5292151E344ED6A411E94580F58EF1', 'BC23D7EA5A764C309AB1E4B24EB34271', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B841E816ECFC43BC97B8513E2FDF7F3F', 'e8899e27f86148ccb9445f4e3956da72', 'DF9921D27A6D4ACAAD12223FCA723D0C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B86EDAA5C09C4A20BBA8040AC976342B', '7B5292151E344ED6A411E94580F58EF1', 'CCE2CAE9E73B41FB952284B25F8DD964', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('B8D3E4583178442388EFE920797C9157', '7B5292151E344ED6A411E94580F58EF1', '7C410E1DD7C0415FA2610FFD2393AA19', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('BAF1CD7D8D32428D9499E4997D9FF384', 'e8899e27f86148ccb9445f4e3956da72', 'EEF0512C777048ACA0080878799783B2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C0C6486E09054A029ED76FA99B7143D5', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '0E211C15E5B04834B16653028C21FF16', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C1C3629323754056BB78A705FF77F8F2', '7B5292151E344ED6A411E94580F58EF1', '175301D6F8EB4861A6F089D85B2B9264', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C2DF01DCFFFB45C69AA901D16AC1B2F3', 'e8899e27f86148ccb9445f4e3956da72', 'F2DE0C62D3914C8F9717D89A79D50E78', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C32FE6DFDFE940F0AB550EA0605AA15F', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '9a6fc7534e8b42d1a8173749f93dc46c', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C3BC5AFA340E4A24B2380B901728E5D9', 'e8899e27f86148ccb9445f4e3956da72', 'C55EEF5BF0A241B5AFCA830AC27C6EEC', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C64821E84AB4422990C3DB364175AF93', '7B5292151E344ED6A411E94580F58EF1', '6F7182141341469AAFB87A9722747A2F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C677F6674A39490BAE894F0A38133327', 'e8899e27f86148ccb9445f4e3956da72', 'EDDB09362DE34711A6FDF05CBC48CA87', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C6C1B80EF8704395BFB0FE2DAC950877', 'e8899e27f86148ccb9445f4e3956da72', '7385C2D9CC834A2B886496E7D1002732', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('C9096CB9D7BE4D739E9DAF58533E3248', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'C02B305E46D545F2B0731E0A7CEF93A7', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D293632FC11D4AB8AAA07533704E481D', 'e8899e27f86148ccb9445f4e3956da72', '34F89EC3FA3B43E587024C44DF34AF34', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D365FF215CD644B0BE7E251D5712A83A', 'e8899e27f86148ccb9445f4e3956da72', 'D2C13BC7D50D4D8DB3A13AF484FEA15B', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D4F1647EEC614A0FB38C4E99205CECF2', '7B5292151E344ED6A411E94580F58EF1', '265F22DEEF07420EA65AEB98DF3FC21F', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D6CAC3BFD0E74CAD9E2DC60C02B0821E', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'f91121dd1be3404587858b2b13147413', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D6D01B1D5E1045B9819A10BA2A24858C', 'e8899e27f86148ccb9445f4e3956da72', '37F4224FE3A64E40B4F7766D4BD66D3E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D6ED900298C940A89AB2ADCC60BD248C', 'e8899e27f86148ccb9445f4e3956da72', 'E653AEBCB9D64DA2AD525EC325677421', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D753E18652A84BAF9618AB7BABB501BF', 'e8899e27f86148ccb9445f4e3956da72', '8E5C51A787ED419AB6D16FD114D82A86', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D9C17A9F3C014A0BB68FD661BF649BEC', 'e8899e27f86148ccb9445f4e3956da72', 'D00796E9B3C844D1ABBFF01C34415B7C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('D9C4E363779D45CCAB2949A476993D38', '7B5292151E344ED6A411E94580F58EF1', '9D41CAC61DB34C0489FED62DA8737C05', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('DC2776B073FF4B7B8460F64BDFEAAA1F', '57DC7DE7F9F74FADA9CD02FFA311A0BD', '50c55d7d42894090846d19b33ab7ee66', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('DC79AAA879D1415CB6188CBC9068A44E', '7B5292151E344ED6A411E94580F58EF1', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('DDE03845CFD0462DB90C9E5485444A07', 'e8899e27f86148ccb9445f4e3956da72', '0A9E5B9688C44A989ECF91B30D3386EB', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('DE9E92D3B3B24080BA8896DF751C7E61', 'e8899e27f86148ccb9445f4e3956da72', 'B6A120BB3EA84125BBDB772D4DE4C062', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('DE9F18EDC56F408881726C5955C0BD17', '7B5292151E344ED6A411E94580F58EF1', '0A2A5C89ED8F461AACF401EE4688033D', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('DEE199CE744C4C1F8AAC7E5870C83A12', '7B5292151E344ED6A411E94580F58EF1', '37F4224FE3A64E40B4F7766D4BD66D3E', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('E041354F968C40BB9F34EFC91AFB0D23', '57DC7DE7F9F74FADA9CD02FFA311A0BD', 'BBFD01104F9B49EA944B14B975038E41', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('E136191075714585B7C4735760239CB1', 'e8899e27f86148ccb9445f4e3956da72', 'CA0119C9E36F4F65886BD6173D0EC6A4', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('E1AC02D2BE8C41C3AC34A328149A8E11', 'e8899e27f86148ccb9445f4e3956da72', '0C18570E90D341C9B64DA50B0999E5B3', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('E4D89BDB7FA34822A1693BA27B22D5A9', '7B5292151E344ED6A411E94580F58EF1', 'B6EA0CD7DC12410D961F3F1DC665BB9B', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('E572DE5322CE40DDAC7144BE1044E56B', 'e8899e27f86148ccb9445f4e3956da72', '24b059ca6b15448fa9a36affbc7233f2', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('E7D4C6E10887408CA81A94AF7E0BDC88', 'e8899e27f86148ccb9445f4e3956da72', '8E727B2FC6AC40AE8288F487137D6650', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('E8A317B978084EA692A3715BD5D58E25', 'e8899e27f86148ccb9445f4e3956da72', 'f91121dd1be3404587858b2b13147413', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('EE389E9EF6D8444BB8C0DF94DC5DD7AB', '7B5292151E344ED6A411E94580F58EF1', '8A27D95DB5E44CEB92E91FDBA6983796', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('EF318362D27543FF91DD0A86BB5ACE87', '7B5292151E344ED6A411E94580F58EF1', '257B0FCFAC784E768AE6B7C9B2994530', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('F035B177E4414056B108ACD58DED84AD', 'e8899e27f86148ccb9445f4e3956da72', '67298f18b65047ebad2626d3abce7d4b', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('F252BEA4AB3D47B495A1B270A79C190C', '7B5292151E344ED6A411E94580F58EF1', 'DCF58E5DD9E8485981AC1E139CDD8C10', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('F3BAD7ACA6EF4BF7B7E44B05A5739F2E', 'e8899e27f86148ccb9445f4e3956da72', 'A18068A4EF3144E8B00200A568CD72E5', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('F5487B27F4AA4AF2AFC7318ED6536E19', '7B5292151E344ED6A411E94580F58EF1', '40B816DEDA9B4BC6964136B084058BDC', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('F71E5A0D757144479E9EBD5CA43474CA', '7B5292151E344ED6A411E94580F58EF1', 'B6A120BB3EA84125BBDB772D4DE4C062', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('F9B45DD094C04A68BB314CDCF0348350', 'e8899e27f86148ccb9445f4e3956da72', 'AA181C78517E4088A783785FD4AEE618', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('FAFFA998FD154EAEB2EE3F3DDEC8C0E6', 'e8899e27f86148ccb9445f4e3956da72', 'A414E2929C0D43F4937ACEE2F30DC8EA', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('FB0CA32494CB45178A3F075483DBE355', '7B5292151E344ED6A411E94580F58EF1', 'B9364A7F1DD2479B8DDB0F791C1D7B35', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('FC2DC34DE77F40A5A5AFAEC4FDD598C3', 'e8899e27f86148ccb9445f4e3956da72', '585C7F3651E248148BF0A4A56A915973', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('FCDFD5D8E64A4558A5EA491507FC7B43', 'e8899e27f86148ccb9445f4e3956da72', '586395E3CC4F448CB726A067141D030A', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('FDD19446288946B5AB37807B8630D77E', '7B5292151E344ED6A411E94580F58EF1', '585C7F3651E248148BF0A4A56A915973', 'checked');
INSERT INTO `up_role_resource_relation` VALUES ('FEA46808E6E146C5BAE2D7FE77B29C63', 'e8899e27f86148ccb9445f4e3956da72', '971E81C8054B449F98DFC94A4DBFA3E5', 'checked');

-- ----------------------------
-- Table structure for `up_user_resource_relation`
-- ----------------------------
DROP TABLE IF EXISTS `up_user_resource_relation`;
CREATE TABLE `up_user_resource_relation` (
  `REUID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) NOT NULL,
  `RES_ID` varchar(32) NOT NULL,
  `RES_CHECKED_STATE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of up_user_resource_relation
-- ----------------------------
INSERT INTO `up_user_resource_relation` VALUES ('02018CD9B3894501B6A41B24862FE1B6', '4314065A5E0E43E9801158D489CB6F67', '586395E3CC4F448CB726A067141D030A', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('02473B3FAC1746BAA93810EB64CA7F9C', '2F82C577E57F4474ADCF1371DB528699', '509DF19A0103477CB68D216018AD7FC5', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('02E840A52B924E3690A550201ECEA29F', '4314065A5E0E43E9801158D489CB6F67', 'EDCBB920702B49999500A0A883A427DB', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('08869A22B5A44BCDA369BA068FE9A8DD', '4314065A5E0E43E9801158D489CB6F67', 'BBFD01104F9B49EA944B14B975038E41', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('08E7392CCABE4860B0159A961D5EE593', '4314065A5E0E43E9801158D489CB6F67', '8af412d02ea24260b74968eb1db5b4c4', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('09D1997F56AB483FB9A1C85F21D08127', '4314065A5E0E43E9801158D489CB6F67', '16C2BA7DBA774E618CB9A096E8A86676', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('0AA3ABECA02E4ECFBEA5EBDB272E7DA9', '4314065A5E0E43E9801158D489CB6F67', '3CB30E16274F4FA5AF76CBA2CCB8020A', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('0DD2EBF567B94904B47E5607522D4CE4', '4314065A5E0E43E9801158D489CB6F67', 'E5CD521A4A3F4219B6E846C3A40031FB', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('0F6725C17293482982FF8A7E558ADDD9', '4314065A5E0E43E9801158D489CB6F67', '7B4B94DF026349B98655AC77BB93ABCA', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('147A546E4D074E02BBDA14491F512386', '4314065A5E0E43E9801158D489CB6F67', 'FBD2330853F64F31A2354F09AEA42D4D', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('190EF95A49064C5D976F9982BA896324', '4314065A5E0E43E9801158D489CB6F67', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('1A311DAF8B0B4CC6B895CF2F4E70D352', '2F82C577E57F4474ADCF1371DB528699', 'D0B2B4DDF0A34AF5B79E4157429C5B5C', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('21A3DFA77D4544178AF98C58BA267057', '4314065A5E0E43E9801158D489CB6F67', '509DF19A0103477CB68D216018AD7FC5', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('23F2A7D06E574184BEBF10686568E25A', '4314065A5E0E43E9801158D489CB6F67', 'D2C13BC7D50D4D8DB3A13AF484FEA15B', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('24FC6B51FA7449818E8EE563BBAF3434', '4314065A5E0E43E9801158D489CB6F67', '5BF7FC4FE7154C4B8216034916EB2186', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('2559AB426307466CBB845E5FCBF95052', '4314065A5E0E43E9801158D489CB6F67', '0A2A5C89ED8F461AACF401EE4688033D', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('2C98A7CB636845589BA00D44C2D55D0D', '4314065A5E0E43E9801158D489CB6F67', 'F2DE0C62D3914C8F9717D89A79D50E78', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('2CC4E20EC0474D23B3FE02C383604EF8', '4314065A5E0E43E9801158D489CB6F67', 'D2A0BC0C91FE46418DD1C88AFEFA880C', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('2E7B9156C2364C189CD510D43D056736', '2F82C577E57F4474ADCF1371DB528699', '423C8E57CA0D4E0892452F31F179BD4E', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('2EAF34DD9762408DA6E5469F01044F76', '4314065A5E0E43E9801158D489CB6F67', 'E0ED3D9881EC4A36B97AB954CB257CFD', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('314FEFF5E5A94359B67CB74CF763BB12', '4314065A5E0E43E9801158D489CB6F67', 'EF379A6409C74EB4B10AC0D3BBD9533B', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('3491C5F8C31C4C1BBD74689CC6B80B0E', '4314065A5E0E43E9801158D489CB6F67', 'B6EA0CD7DC12410D961F3F1DC665BB9B', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('37B4B6F4CD79410FBE8F508805529787', '4314065A5E0E43E9801158D489CB6F67', 'B09871416BE24CC4821D9032215082C5', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('37CC6CB3FDFE4D0FB1D1785CA7375995', '4314065A5E0E43E9801158D489CB6F67', 'f91121dd1be3404587858b2b13147413', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('3F9CC2B122F14DB38EB434F4F8C56C3B', '4314065A5E0E43E9801158D489CB6F67', '67CF23842D504AE79556B2740193D5F2', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('3FAC7644C0D74679B252586CAD3C316A', '4314065A5E0E43E9801158D489CB6F67', 'DF025269726F41CEA76110634FC25147', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('41EDA88BE94C4CFEA0F13DBC8A1E262D', '4314065A5E0E43E9801158D489CB6F67', 'E62BFFCB8AF2475681CE0D4F1A5BD0EE', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('438EAF229269423D9A49B39265C8DC9C', '4314065A5E0E43E9801158D489CB6F67', 'EEF0512C777048ACA0080878799783B2', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('4BE4BA92784E4EBBBE172572C07C15B6', '4314065A5E0E43E9801158D489CB6F67', '3E9884400651429A8AA2789C6FFCB0C0', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('4F31E8D9F89E44DEAF2B5615BE04A28D', '4314065A5E0E43E9801158D489CB6F67', '58EB4ABB1E8E4EB995E189E60AC84015', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('51799651056D4B2489A6EE6F72AD0744', '4314065A5E0E43E9801158D489CB6F67', '325ea7ab8b114700930edfcb39e54b62', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('526719D0FE3D4EA9A708AC29EB844C9B', '4314065A5E0E43E9801158D489CB6F67', '67298f18b65047ebad2626d3abce7d4b', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('52E765D15340486C968D101E620AC9A9', '4314065A5E0E43E9801158D489CB6F67', '4D8C733A24B14ADFA5BA3F5AAC48C6F6', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('559C02A2A81B4462803AB8F352B447FE', '4314065A5E0E43E9801158D489CB6F67', 'CCE2CAE9E73B41FB952284B25F8DD964', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('570118A0191649229C67336C7C321C8E', '4314065A5E0E43E9801158D489CB6F67', '9AD732EB271E406E8BDC3CFC19F8CCB2', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('57FC0F7004A64FB7A861B05633985FE9', '4314065A5E0E43E9801158D489CB6F67', '8E727B2FC6AC40AE8288F487137D6650', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('5C4EC4D3F47147FAACBDE281EA78100A', '4314065A5E0E43E9801158D489CB6F67', '0A9E5B9688C44A989ECF91B30D3386EB', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('5DC8AB4A25A14163AE73A2B77CA02CC0', '4314065A5E0E43E9801158D489CB6F67', 'A18068A4EF3144E8B00200A568CD72E5', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('612BDF7B63E3436290BE9A13EEFD50AB', '4314065A5E0E43E9801158D489CB6F67', 'D072186E3CEC44E2A5956A40292826FD', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('612ED4ECF7AE48AFB502295FFCC97884', '2F82C577E57F4474ADCF1371DB528699', '4E0520A2972A489C961861EF569F9B46', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('61B9C14B56644DE69FD0BD180A75E703', '4314065A5E0E43E9801158D489CB6F67', '50c55d7d42894090846d19b33ab7ee66', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('6439EBA6AF88494B9BE0D4C886DE5DF1', '4314065A5E0E43E9801158D489CB6F67', '6F7182141341469AAFB87A9722747A2F', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('64E794FD29AB423184C11E7EF8467B65', '4314065A5E0E43E9801158D489CB6F67', 'C55EEF5BF0A241B5AFCA830AC27C6EEC', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('68745E917F104B3E99E94837373E8E9D', '4314065A5E0E43E9801158D489CB6F67', 'DCF58E5DD9E8485981AC1E139CDD8C10', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('6B59FE1CA6B944A69BCF34F2A4DE47F8', '4314065A5E0E43E9801158D489CB6F67', '3EBCEDC4CD4440129BF62EFB1C0688D6', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('6E5772A07C85426198B67935B4F92072', '4314065A5E0E43E9801158D489CB6F67', '31B97B74083E408F94010D56245AE011', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('6E72D2625AF74CB7950F309845708418', '4314065A5E0E43E9801158D489CB6F67', '971E81C8054B449F98DFC94A4DBFA3E5', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('74889250E19E4145A00321B9C83627C1', '4314065A5E0E43E9801158D489CB6F67', '40B816DEDA9B4BC6964136B084058BDC', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('760600E99D484AD5A75D9EE3DF1D1F21', '4314065A5E0E43E9801158D489CB6F67', 'AB8786FA555E43B9833FB13956CC6AC3', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('78837F430A604B5AB4BFAFEC8C88A4E5', '4314065A5E0E43E9801158D489CB6F67', '585C7F3651E248148BF0A4A56A915973', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('7B886BE0F0BF4F9FACCDA720A6B3EAF6', '4314065A5E0E43E9801158D489CB6F67', 'DA198A17A47C4A059C93522E505D015E', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('7C64F8713897496DAE7FC093E328726E', '4314065A5E0E43E9801158D489CB6F67', '9a6fc7534e8b42d1a8173749f93dc46c', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('7F161E2125E8440B8394325019786238', '4314065A5E0E43E9801158D489CB6F67', 'EDDB09362DE34711A6FDF05CBC48CA87', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('7F73DED0BC0E44CF8AB50AC3572DF0D2', '4314065A5E0E43E9801158D489CB6F67', 'BB0F87D16A764033ACC0B80BC027528E', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('80FBCAAE435D44AD8AC87F8B4A350164', '4314065A5E0E43E9801158D489CB6F67', '3F7EFF92FD9043ADBF962BF72B84C6DD', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('82AE01DE8F054692A75508D93DFC124D', '4314065A5E0E43E9801158D489CB6F67', '8E5C51A787ED419AB6D16FD114D82A86', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('83FAA57AFCFD4CBB89652C0716144DD3', '4314065A5E0E43E9801158D489CB6F67', '0507C638502B4B048DA7EF697039D900', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('851A3143CB1C4352B141FAA71E1D05CC', '4314065A5E0E43E9801158D489CB6F67', 'CA0119C9E36F4F65886BD6173D0EC6A4', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('87C1A0B0602A4DBBA390FEE83D3CBBD8', '4314065A5E0E43E9801158D489CB6F67', 'BC23D7EA5A764C309AB1E4B24EB34271', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('8E815C0A9C644BCB8E1B1B6E927A4804', '4314065A5E0E43E9801158D489CB6F67', '4E0520A2972A489C961861EF569F9B46', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('9427941EF7904F18A3BCEC8040588C26', '4314065A5E0E43E9801158D489CB6F67', '35E9281F41184588958CDB4E6DD7F045', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('98F07C936190478E917FA45E80AE5BDB', '4314065A5E0E43E9801158D489CB6F67', '4A1B561647F24C6CBA62AC1AB2D005E1', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('9EDB35C4913340D492C2A3DACACCCAD2', '4314065A5E0E43E9801158D489CB6F67', 'B6A120BB3EA84125BBDB772D4DE4C062', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('A148935739C34656ACBF608538DA4EAB', '4314065A5E0E43E9801158D489CB6F67', '9D41CAC61DB34C0489FED62DA8737C05', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('A170CA87BEF4410FB7149BD9F6FF189E', '4314065A5E0E43E9801158D489CB6F67', '642AFB58A9A647FF9C390B1B384BC122', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('A3E3889ED69349C587167239AA329FC7', '4314065A5E0E43E9801158D489CB6F67', '34F89EC3FA3B43E587024C44DF34AF34', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('AAE69C630C8A4E549F5AABE82F9BECFD', '4314065A5E0E43E9801158D489CB6F67', '7385C2D9CC834A2B886496E7D1002732', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('AE504570725B40E78796CA770B68FF25', '4314065A5E0E43E9801158D489CB6F67', '5525BDB4C8A648BEB5CF2B6FA061DFD9', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('B0F6359C8A6844EF85E0DEADD3C86BC2', '4314065A5E0E43E9801158D489CB6F67', 'B9364A7F1DD2479B8DDB0F791C1D7B35', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('B1579B82297044499D8CC8424AD518DB', '4314065A5E0E43E9801158D489CB6F67', '2C5FC01FEE58454D97DC97BA688EF1FB', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('B176DAE1EBDD445A844A68F20BC912C2', '4314065A5E0E43E9801158D489CB6F67', '265F22DEEF07420EA65AEB98DF3FC21F', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('B363B7F162314F4C953B0AA1DD2E1464', '4314065A5E0E43E9801158D489CB6F67', 'ACD8CD60C985461990D48E77513D5500', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('B42AF79448A849478F9847C76B6CA8F2', '4314065A5E0E43E9801158D489CB6F67', 'DF0909F71CD54992AB3A2C6AD8569A2A', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('B5C4809483AF456A858878531F9CEF6C', '4314065A5E0E43E9801158D489CB6F67', 'DA55F5041D1F4CBCA800FA72C289585C', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('B8BFD8CEA9AC461CADF5CE9E117B2362', '4314065A5E0E43E9801158D489CB6F67', '423C8E57CA0D4E0892452F31F179BD4E', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('C1C69899257E450B83B8F3192BAA2209', '4314065A5E0E43E9801158D489CB6F67', 'AECBCDEAA63D42EDAB49157F851C348F', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('C836450EB7D54D55B42004E61510781D', '4314065A5E0E43E9801158D489CB6F67', 'BF4D65C501AA42E9A3D51F295A797C59', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('C88841A157914524977055C66078EBFD', '4314065A5E0E43E9801158D489CB6F67', '4011C4EB0FBC40FDB2C47B6F871DDBF4', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('D0A722979CEC4041835F13B440A8271A', '2F82C577E57F4474ADCF1371DB528699', 'D072186E3CEC44E2A5956A40292826FD', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('D0DF12E3437C4350885017DEF3A232FB', '4314065A5E0E43E9801158D489CB6F67', 'BC1B8A9F93044E5796FF6768AE5F402E', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('D2C6521F8B25453FB67C0E3F8508D3AE', '4314065A5E0E43E9801158D489CB6F67', '175301D6F8EB4861A6F089D85B2B9264', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('D428124751104A89BFE8E28DCDCC3A4D', '4314065A5E0E43E9801158D489CB6F67', '5ff63996da314c74a37cb664a1b17a20', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('D669266A51BF4E8BBAFAE588F541F6AE', '4314065A5E0E43E9801158D489CB6F67', '86E92E4E78654568838F224A28DCA91F', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('D6816A74B7D04453B70FD9BDACD15E05', '4314065A5E0E43E9801158D489CB6F67', '2E582D52D5974181B7265C2F73B1BFA1', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('DB20D5794ED3476E95BA3EEEDA81EAA1', '4314065A5E0E43E9801158D489CB6F67', '0d647b121b844c8c9db0fb9b34cbdae3', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('DEA9A6552F68488B85025B11A2F5A3E2', '4314065A5E0E43E9801158D489CB6F67', '0E211C15E5B04834B16653028C21FF16', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('DFC254D71A6D414EBAF056E3EF84B062', '4314065A5E0E43E9801158D489CB6F67', '24b059ca6b15448fa9a36affbc7233f2', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('E054F111E7AF43918128190C59C71396', '4314065A5E0E43E9801158D489CB6F67', 'B05A67E22C6842EC9EDE06A5636CA61F', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('E8AA784DB77C497EBE08DECB5F2E45C5', '4314065A5E0E43E9801158D489CB6F67', 'C02B305E46D545F2B0731E0A7CEF93A7', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('EB6C190CF6F3457F80D4034AB418F572', '4314065A5E0E43E9801158D489CB6F67', '257B0FCFAC784E768AE6B7C9B2994530', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('EE654123146C4C64BF14D5675087402D', '4314065A5E0E43E9801158D489CB6F67', '37F4224FE3A64E40B4F7766D4BD66D3E', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('EF7DE61C54804144A6E342332F3DE8D8', '4314065A5E0E43E9801158D489CB6F67', 'C2665117D00E4DAABE6768D88A722CD6', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('F234475FEA214B8B9E8F4679394DA623', '4314065A5E0E43E9801158D489CB6F67', 'A414E2929C0D43F4937ACEE2F30DC8EA', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('F79ED4B7AEC44A2E833405AF98162610', '4314065A5E0E43E9801158D489CB6F67', '09DA46E9B53F473BBC169D2FF8B99FFD', 'checked');
INSERT INTO `up_user_resource_relation` VALUES ('FA06AB9036904723A6E4CB5D3F6056D2', '4314065A5E0E43E9801158D489CB6F67', '182B90379E744DC0BEBEFD244913119A', 'checked');

-- ----------------------------
-- Function structure for `getResChild`
-- ----------------------------
DROP FUNCTION IF EXISTS `getResChild`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getResChild`(rootId VARCHAR(32)) RETURNS longtext CHARSET utf8
BEGIN 
       DECLARE str LONGTEXT ; 
       DECLARE cid LONGTEXT ; 
       SET str = ''; 
       SET cid =rootId; 
       WHILE cid is not null DO 
         SET str= concat(str,',',cid); 
         SELECT group_concat(res_id) INTO cid FROM sys_res_info where FIND_IN_SET(res_parent_id,cid)>0; 
       END WHILE; 
       RETURN str; 
     END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getResPid`
-- ----------------------------
DROP FUNCTION IF EXISTS `getResPid`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getResPid`(rootId VARCHAR(32)) RETURNS longtext CHARSET utf8
BEGIN 
      declare fid LONGTEXT default  '0';
      declare str LONGTEXT default rootId;
      while rootId>0 do
      set fid=(SELECT res_parent_id FROM sys_res_info  WHERE rootId=res_id); 
     IF fid > 0 THEN  
     SET str=concat(str,',',fid);   
     SET rootId=fid;  
     ELSE SET rootId=fid;  
     END IF;  
     END WHILE;
 return str;
     END
;;
DELIMITER ;
