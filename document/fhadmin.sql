/*
Navicat MySQL Data Transfer

Source Server         : 120.79.29.138
Source Server Version : 50638
Source Host           : 120.79.29.138:3306
Source Database       : fhadmin

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-04-06 20:04:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for DB_FHDB
-- ----------------------------
DROP TABLE IF EXISTS `DB_FHDB`;
CREATE TABLE `DB_FHDB` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for DB_TIMINGBACKUP
-- ----------------------------
DROP TABLE IF EXISTS `DB_TIMINGBACKUP`;
CREATE TABLE `DB_TIMINGBACKUP` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for OA_DATAJUR
-- ----------------------------
DROP TABLE IF EXISTS `OA_DATAJUR`;
CREATE TABLE `OA_DATAJUR` (
  `DATAJUR_ID` varchar(100) NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`),
  KEY `FSTAFF` (`STAFF_ID`),
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for OA_DEPARTMENT
-- ----------------------------
DROP TABLE IF EXISTS `OA_DEPARTMENT`;
CREATE TABLE `OA_DEPARTMENT` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for OA_FHFILE
-- ----------------------------
DROP TABLE IF EXISTS `OA_FHFILE`;
CREATE TABLE `OA_FHFILE` (
  `FHFILE_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '上传时间',
  `BZ` varchar(100) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '长传者',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门ID',
  `FILESIZE` varchar(255) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`FHFILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for OA_STAFF
-- ----------------------------
DROP TABLE IF EXISTS `OA_STAFF`;
CREATE TABLE `OA_STAFF` (
  `STAFF_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_APP_USER
-- ----------------------------
DROP TABLE IF EXISTS `SYS_APP_USER`;
CREATE TABLE `SYS_APP_USER` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_CODEEDITOR
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CODEEDITOR`;
CREATE TABLE `SYS_CODEEDITOR` (
  `CODEEDITOR_ID` varchar(100) NOT NULL,
  `TYPE` varchar(30) DEFAULT NULL COMMENT '类型',
  `FTLNMAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CODECONTENT` text COMMENT '代码',
  PRIMARY KEY (`CODEEDITOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_CREATECODE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CREATECODE`;
CREATE TABLE `SYS_CREATECODE` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_DICTIONARIES
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICTIONARIES`;
CREATE TABLE `SYS_DICTIONARIES` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_FHBUTTON
-- ----------------------------
DROP TABLE IF EXISTS `SYS_FHBUTTON`;
CREATE TABLE `SYS_FHBUTTON` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_FHLOG
-- ----------------------------
DROP TABLE IF EXISTS `SYS_FHLOG`;
CREATE TABLE `SYS_FHLOG` (
  `FHLOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_FHSMS
-- ----------------------------
DROP TABLE IF EXISTS `SYS_FHSMS`;
CREATE TABLE `SYS_FHSMS` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_LOGINIMG
-- ----------------------------
DROP TABLE IF EXISTS `SYS_LOGINIMG`;
CREATE TABLE `SYS_LOGINIMG` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_MENU
-- ----------------------------
DROP TABLE IF EXISTS `SYS_MENU`;
CREATE TABLE `SYS_MENU` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE`;
CREATE TABLE `SYS_ROLE` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_ROLE_FHBUTTON
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_FHBUTTON`;
CREATE TABLE `SYS_ROLE_FHBUTTON` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_USER
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER`;
CREATE TABLE `SYS_USER` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `ROLE_IDS` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SYS_USERPHOTO
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USERPHOTO`;
CREATE TABLE `SYS_USERPHOTO` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for TB_ATTACHED
-- ----------------------------
DROP TABLE IF EXISTS `TB_ATTACHED`;
CREATE TABLE `TB_ATTACHED` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for TB_ATTACHEDMX
-- ----------------------------
DROP TABLE IF EXISTS `TB_ATTACHEDMX`;
CREATE TABLE `TB_ATTACHEDMX` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for TB_PICTURES
-- ----------------------------
DROP TABLE IF EXISTS `TB_PICTURES`;
CREATE TABLE `TB_PICTURES` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for WEIXIN_COMMAND
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_COMMAND`;
CREATE TABLE `WEIXIN_COMMAND` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for WEIXIN_IMGMSG
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_IMGMSG`;
CREATE TABLE `WEIXIN_IMGMSG` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for WEIXIN_KEY
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_KEY`;
CREATE TABLE `WEIXIN_KEY` (
  `KEY_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `APPID` varchar(100) DEFAULT NULL COMMENT 'appid',
  `APPSECRET` varchar(100) DEFAULT NULL COMMENT 'appsecret',
  `ACCESS_TOKEN` varchar(100) DEFAULT NULL COMMENT 'access_token',
  `CREATETIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  PRIMARY KEY (`KEY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for WEIXIN_MYMENU
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_MYMENU`;
CREATE TABLE `WEIXIN_MYMENU` (
  `MYMENU_ID` varchar(100) NOT NULL,
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `TITLE` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(100) DEFAULT NULL COMMENT '指向',
  `XID` varchar(10) DEFAULT NULL COMMENT 'XID',
  PRIMARY KEY (`MYMENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for WEIXIN_TEXTMSG
-- ----------------------------
DROP TABLE IF EXISTS `WEIXIN_TEXTMSG`;
CREATE TABLE `WEIXIN_TEXTMSG` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
