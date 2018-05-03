/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.21-log : Database - ry
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ry` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ry`;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`sched_name`,`trigger_name`,`trigger_group`,`cron_expression`,`time_zone_id`) values ('RuoyiScheduler','TASK_1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_2','DEFAULT','0/20 * * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`sched_name`,`job_name`,`job_group`,`description`,`job_class_name`,`is_durable`,`is_nonconcurrent`,`is_update_data`,`requests_recovery`,`job_data`) values ('RuoyiScheduler','TASK_1','DEFAULT',NULL,'com.ruoyi.project.monitor.job.util.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0(com.ruoyi.project.monitor.job.domain.Job\0\0\0\0\0\0\0\0I\0statusL\0createByt\0Ljava/lang/String;L\0\ncreateTimeq\0~\0	L\0cronExpressionq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0	xp\0\0\0t\0admint\02018-03-01 00:00:00.0t\00/10 * * * * ?t\0系统默认（无参）sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0ryTaskt\0\nryNoParamst\0\0pppx\0'),('RuoyiScheduler','TASK_2','DEFAULT',NULL,'com.ruoyi.project.monitor.job.util.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0(com.ruoyi.project.monitor.job.domain.Job\0\0\0\0\0\0\0\0I\0statusL\0createByt\0Ljava/lang/String;L\0\ncreateTimeq\0~\0	L\0cronExpressionq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0	xp\0\0\0t\0admint\02018-03-01 00:00:00.0t\00/20 * * * * ?t\0系统默认（有参）sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0ryTaskt\0ryParamst\0rypppx\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`sched_name`,`lock_name`) values ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`sched_name`,`instance_name`,`last_checkin_time`,`checkin_interval`) values ('RuoyiScheduler','DESKTOP-ME8RBH31525342460374',1525343439698,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`sched_name`,`trigger_name`,`trigger_group`,`job_name`,`job_group`,`description`,`next_fire_time`,`prev_fire_time`,`priority`,`trigger_state`,`trigger_type`,`start_time`,`end_time`,`calendar_name`,`misfire_instr`,`job_data`) values ('RuoyiScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1524908760000,-1,5,'PAUSED','CRON',1524908758000,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0(com.ruoyi.project.monitor.job.domain.Job\0\0\0\0\0\0\0\0I\0statusL\0createByt\0Ljava/lang/String;L\0\ncreateTimeq\0~\0	L\0cronExpressionq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0	xp\0\0\0t\0admint\02018-04-28 18:22:02.0t\00/10 * * * * ?t\0系统默认（无参）sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0ryTaskt\0\nryNoParamst\0\0pppx\0'),('RuoyiScheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1524908760000,-1,5,'PAUSED','CRON',1524908758000,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0(com.ruoyi.project.monitor.job.domain.Job\0\0\0\0\0\0\0\0I\0statusL\0createByt\0Ljava/lang/String;L\0\ncreateTimeq\0~\0	L\0cronExpressionq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0	xp\0\0\0t\0admint\02018-03-01 00:00:00.0t\00/20 * * * * ?t\0系统默认（有参）sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0ryTaskt\0ryParamst\0rypppx\0');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `email` varchar(20) DEFAULT '' COMMENT '邮箱',
  `status` int(1) DEFAULT '0' COMMENT '部门状态:0正常,1停用',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'唐山学院',0,'马云','15011112221','ry@qq.com',0,'admin','2018-05-01 10:38:10','ry','2018-03-01 00:00:00'),(101,100,'智能与信息工程学院',1,'马研','15011112222','ry@qq.com',0,'admin','2018-05-02 10:34:09','admin','2018-05-02 10:34:09'),(102,100,'计算机系',2,'马市','15011112223','ry@qq.com',0,'admin','2018-05-02 10:36:09','admin','2018-05-02 10:36:09'),(103,100,'土木系',3,'马测','15011112224','ry@qq.com',0,'admin','2018-05-02 10:36:52','admin','2018-05-02 10:36:52'),(104,100,'外语系',4,'马财','15011112225','ry@qq.com',0,'admin','2018-05-02 13:28:52','admin','2018-05-02 13:28:52'),(105,100,'经管系',5,'马运','15011112226','ry@qq.com',0,'admin','2018-05-02 13:28:57','admin','2018-05-02 13:28:57'),(106,101,'电子信息工程',1,'马一','15011112227','ry@qq.com',0,'admin','2018-05-02 10:34:24','admin','2018-05-02 10:34:24'),(107,101,'通信工程',2,'马二','15011112228','ry@qq.com',0,'admin','2018-05-02 10:35:41','admin','2018-05-02 10:35:41'),(108,102,'软件工程',1,'马一','15011112229','ry@qq.com',0,'admin','2018-05-02 10:36:20','admin','2018-05-02 10:36:20'),(109,102,'计算机科学与技术',2,'马二','15011112210','ry@qq.com',0,'admin','2018-05-02 10:36:41','admin','2018-05-02 10:36:41'),(110,101,'轨道交通自动化',3,'马三','15200000000','mj@163.com',0,'admin','2018-05-02 10:35:33','','0000-00-00 00:00:00');

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1禁用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'工商银行','01','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2,2,'建设银行','02','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(3,3,'农业银行','03','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(4,4,'光大银行','04','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(5,5,'兴业银行','05','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(6,6,'中国银行','06','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(7,7,'平安银行','07','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(8,8,'招商银行','08','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(9,1,'微信支付','WX','sys_pay_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(10,2,'支付宝','ZFB','sys_pay_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(11,3,'QQ支付','JD','sys_pay_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(12,4,'京东支付','QQ','sys_pay_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1禁用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'银行列表','sys_bank_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','银行数据列表'),(2,'支付通道','sys_pay_code',0,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','支付通道列表');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`method_name`,`params`,`cron_expression`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ryTask','系统默认（无参）','ryNoParams','','0/10 * * * * ?',1,'admin','2018-04-28 18:22:02','zhangsx','2018-04-28 18:22:02','ryTask'),(2,'ryTask','系统默认（有参）','ryParams','ry','0/20 * * * * ?',1,'admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `is_exception` int(1) DEFAULT '0' COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` int(1) DEFAULT '0' COMMENT '登录状态 0成功 1失败',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`login_name`,`ipaddr`,`browser`,`os`,`status`,`msg`,`login_time`) values (1,'admin','127.0.0.1','Chrome 45','Windows 7',0,'登录成功','2018-03-01 00:00:00'),(100,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-04-28 17:48:30'),(101,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'退出成功','2018-04-28 17:55:53'),(102,'zhangsx','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-04-28 17:56:03'),(103,'zhangsx','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'退出成功','2018-04-28 18:23:33'),(104,'common','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-04-28 18:23:47'),(105,'common','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'退出成功','2018-04-28 18:29:51'),(106,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-04-28 18:29:53'),(107,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-04-28 18:47:46'),(108,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 10:15:02'),(109,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 11:28:40'),(110,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 13:28:19'),(111,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 14:12:37'),(112,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 15:40:16'),(113,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 16:42:57'),(114,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 17:50:44'),(115,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-02 17:54:55'),(116,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-02 17:58:29'),(117,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-02 18:06:13'),(118,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-02 18:23:41'),(119,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-02 18:31:49'),(120,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'退出成功','2018-05-02 18:31:53'),(121,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-02 18:32:03'),(122,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 10:49:01'),(123,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'退出成功','2018-05-03 10:55:12'),(124,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 10:55:19'),(125,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:04:37'),(126,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:08:49'),(127,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:14:00'),(128,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:18:58'),(129,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:23:44'),(130,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:27:32'),(131,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:31:20'),(132,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:35:09'),(133,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'退出成功','2018-05-03 11:35:26'),(134,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 11:35:29'),(135,'admin','0:0:0:0:0:0:0:1','Firefox','Windows 10',0,'登录成功','2018-05-03 15:46:46'),(136,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 15:47:30'),(137,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 15:50:46'),(138,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 15:52:37'),(139,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 16:12:20'),(140,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 16:15:19'),(141,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 16:32:01'),(142,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 16:34:33'),(143,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 16:39:04'),(144,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 16:42:50'),(145,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 17:11:54'),(146,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 17:13:25'),(147,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 17:14:26'),(148,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 17:18:50'),(149,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 17:21:04'),(150,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'退出成功','2018-05-03 17:21:12'),(151,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 17:21:21'),(152,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 17:21:46'),(153,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 17:26:59'),(154,'admin','0:0:0:0:0:0:0:1','Chrome','Windows 10',0,'登录成功','2018-05-03 17:28:41'),(155,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',1,'密码输入错误1次，123456','2018-05-03 17:38:22'),(156,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',1,'密码输入错误2次，123456','2018-05-03 17:38:24'),(157,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 17:38:29'),(158,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:00:15'),(159,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:02:23'),(160,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:08:20'),(161,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:13:20'),(162,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:14:57'),(163,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'退出成功','2018-05-03 18:21:28'),(164,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:21:30'),(165,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'退出成功','2018-05-03 18:23:46'),(166,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:23:48'),(167,'4140220427','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'退出成功','2018-05-03 18:27:11'),(168,'admin','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10',0,'登录成功','2018-05-03 18:27:21');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT NULL COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '类型:M目录,C菜单,F按钮',
  `visible` int(1) DEFAULT '0' COMMENT '菜单状态:0显示,1隐藏',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`menu_type`,`visible`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理',0,1,'#','M',0,'','fa fa-gear','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','系统管理目录'),(2,'系统监控',0,2,'#','M',0,'','fa fa-video-camera','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','系统监控目录'),(3,'系统工具',0,3,'#','M',0,'','fa fa-bars','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','系统工具目录'),(4,'用户管理',1,1,'/system/user','C',0,'system:user:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','用户管理菜单'),(5,'角色管理',1,2,'/system/role','C',0,'system:role:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','角色管理菜单'),(6,'菜单管理',1,3,'/system/menu','C',0,'system:menu:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','菜单管理菜单'),(7,'院系管理',1,4,'/system/dept','C',0,'system:dept:view','#','admin','2018-05-03 18:22:32','ry','2018-03-01 00:00:00','部门管理菜单'),(8,'去向管理',1,5,'/system/post','C',0,'system:post:view','#','admin','2018-05-03 18:24:31','ry','2018-03-01 00:00:00','岗位管理菜单'),(9,'字典管理',1,6,'/system/dict','C',0,'system:dict:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','字典管理菜单'),(10,'参数设置',1,7,'/system/config','C',0,'system:config:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','参数设置菜单'),(11,'操作日志',2,1,'/monitor/operlog','C',0,'monitor:operlog:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','操作日志菜单'),(12,'登录日志',2,2,'/monitor/logininfor','C',0,'monitor:logininfor:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','登录日志菜单'),(13,'在线用户',2,3,'/monitor/online','C',0,'monitor:online:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','在线用户菜单'),(14,'定时任务',2,4,'/monitor/job','C',0,'monitor:job:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','定时任务菜单'),(15,'数据监控',2,5,'/monitor/data','C',0,'monitor:data:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','数据监控菜单'),(16,'表单构建',3,1,'/tool/build','C',0,'tool:build:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','表单构建菜单'),(17,'代码生成',3,2,'/tool/gen','C',0,'tool:gen:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','代码生成菜单'),(18,'用户查询',4,1,'#','F',0,'system:user:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(19,'用户新增',4,2,'#','F',0,'system:user:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(20,'用户修改',4,3,'#','F',0,'system:user:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(21,'用户删除',4,4,'#','F',0,'system:user:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(22,'用户保存',4,5,'#','F',0,'system:user:save','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(23,'批量删除',4,6,'#','F',0,'system:user:batchRemove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(24,'重置密码',4,7,'#','F',0,'system:user:resetPwd','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(25,'角色查询',5,1,'#','F',0,'system:role:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(26,'角色新增',5,2,'#','F',0,'system:role:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(27,'角色修改',5,3,'#','F',0,'system:role:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(28,'角色删除',5,4,'#','F',0,'system:role:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(29,'角色保存',5,5,'#','F',0,'system:role:save','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(30,'批量删除',5,6,'#','F',0,'system:role:batchRemove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(31,'菜单查询',6,1,'#','F',0,'system:menu:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(32,'菜单新增',6,2,'#','F',0,'system:menu:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(33,'菜单修改',6,3,'#','F',0,'system:menu:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(34,'菜单删除',6,4,'#','F',0,'system:menu:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(35,'菜单保存',6,5,'#','F',0,'system:menu:save','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(36,'院系查询',7,1,'#','F',0,'system:dept:list','#','admin','2018-05-03 18:25:45','ry','2018-03-01 00:00:00',''),(37,'院系新增',7,2,'#','F',0,'system:dept:add','#','admin','2018-05-03 18:25:50','ry','2018-03-01 00:00:00',''),(38,'院系修改',7,3,'#','F',0,'system:dept:edit','#','admin','2018-05-03 18:25:55','ry','2018-03-01 00:00:00',''),(39,'院系删除',7,4,'#','F',0,'system:dept:remove','#','admin','2018-05-03 18:26:00','ry','2018-03-01 00:00:00',''),(40,'院系保存',7,5,'#','F',0,'system:dept:save','#','admin','2018-05-03 18:26:06','ry','2018-03-01 00:00:00',''),(41,'去向查询',8,1,'#','F',0,'system:post:list','#','admin','2018-05-03 18:26:13','ry','2018-03-01 00:00:00',''),(42,'去向新增',8,2,'#','F',0,'system:post:add','#','admin','2018-05-03 18:26:17','ry','2018-03-01 00:00:00',''),(43,'去向修改',8,3,'#','F',0,'system:post:edit','#','admin','2018-05-03 18:26:22','ry','2018-03-01 00:00:00',''),(44,'去向删除',8,4,'#','F',0,'system:post:remove','#','admin','2018-05-03 18:26:27','ry','2018-03-01 00:00:00',''),(45,'去向保存',8,5,'#','F',0,'system:post:save','#','admin','2018-05-03 18:26:36','ry','2018-03-01 00:00:00',''),(46,'批量删除',8,6,'#','F',0,'system:post:batchRemove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(47,'字典查询',9,1,'#','F',0,'system:dict:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(48,'字典新增',9,2,'#','F',0,'system:dict:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(49,'字典修改',9,3,'#','F',0,'system:dict:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(50,'字典删除',9,4,'#','F',0,'system:dict:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(51,'字典保存',9,5,'#','F',0,'system:dict:save','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(52,'批量删除',9,6,'#','F',0,'system:dict:batchRemove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(53,'操作查询',11,1,'#','F',0,'monitor:operlog:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(54,'批量删除',11,2,'#','F',0,'monitor:operlog:batchRemove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(55,'详细信息',11,3,'#','F',0,'monitor:operlog:detail','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(56,'登录查询',12,1,'#','F',0,'monitor:logininfor:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(57,'批量删除',12,2,'#','F',0,'monitor:logininfor:batchRemove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(58,'在线查询',13,1,'#','F',0,'monitor:online:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(59,'批量强退',13,2,'#','F',0,'monitor:online:batchForceLogout','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(60,'单条强退',13,3,'#','F',0,'monitor:online:forceLogout','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(61,'任务查询',14,1,'#','F',0,'monitor:job:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(62,'任务新增',14,2,'#','F',0,'monitor:job:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(63,'任务修改',14,3,'#','F',0,'monitor:job:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(64,'任务删除',14,4,'#','F',0,'monitor:job:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(65,'任务保存',14,5,'#','F',0,'monitor:job:save','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(66,'状态修改',14,6,'#','F',0,'monitor:job:changeStatus','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(67,'批量删除',14,7,'#','F',0,'monitor:job:batchRemove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(68,'生成查询',16,1,'#','F',0,'tool:gen:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(69,'生成代码',16,2,'#','F',0,'tool:gen:code','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `action` varchar(100) DEFAULT '' COMMENT '功能请求',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `channel` varchar(20) DEFAULT '' COMMENT '来源渠道',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态 0正常 1异常',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`action`,`method`,`channel`,`login_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_param`,`status`,`error_msg`,`oper_time`) values (1,'监控管理','在线用户-强退用户','com.ruoyi.project.monitor.online.controller.UserOnlineController()','web','admin','研发部门','delete.do?id=1','127.0.0.1','JSON参数',0,'错误描述','2018-03-01 00:00:00'),(100,'系统工具','代码生成-生成代码','com.ruoyi.project.tool.gen.controller.GenController.genCode()','web','admin','研发一部','/tool/gen/genCode/sys_oper_log','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:49:00'),(101,'系统工具','代码生成-生成代码','com.ruoyi.project.tool.gen.controller.GenController.genCode()','web','admin','研发一部','/tool/gen/genCode/sys_oper_log','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:49:02'),(102,'监控管理','定时任务-新增调度','com.ruoyi.project.monitor.job.controller.JobController.add()','web','admin','研发一部','/monitor/job/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:50:07'),(103,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','研发一部','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:51:50'),(104,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','研发一部','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:52:13'),(105,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','研发一部','/system/user/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"100\"],\"loginName\":[\"张书新欢迎你\"],\"userName\":[\"admin\"],\"password\":[\"admin123\"],\"email\":[\"876145734@qq.com\"],\"phonenumber\":[\"15203256631\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}',0,NULL,'2018-04-28 17:52:51'),(106,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','admin','研发一部','/system/role/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:53:00'),(107,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','admin','研发一部','/system/role/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:53:04'),(108,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','admin','研发一部','/system/role/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:53:20'),(109,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','研发一部','/system/user/edit/100','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:53:47'),(110,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','研发一部','/system/user/edit/100','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:53:57'),(111,'系统管理','用户管理-重置密码','com.ruoyi.project.system.user.controller.UserController.resetPwd()','web','admin','研发一部','/system/user/resetPwd/100','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:54:15'),(112,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','研发一部','/system/user/edit/100','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:54:22'),(113,'系统管理','用户管理-批量删除','com.ruoyi.project.system.user.controller.UserController.batchRemove()','web','admin','研发一部','/system/user/batchRemove','0:0:0:0:0:0:0:1','{\"ids[]\":[\"100\"]}',0,NULL,'2018-04-28 17:54:28'),(114,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','研发一部','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 17:54:31'),(116,'监控管理','操作日志-批量删除','com.ruoyi.project.monitor.operlog.controller.OperlogController.batchRemove()','web','zhangsx','若依集团','/monitor/operlog/batchRemove','0:0:0:0:0:0:0:1','{\"ids[]\":[\"115\"]}',0,NULL,'2018-04-28 18:15:08'),(117,'监控管理','定时任务-修改调度','com.ruoyi.project.monitor.job.controller.JobController.edit()','web','zhangsx','若依集团','/monitor/job/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 18:21:34'),(118,'监控管理','定时任务-修改调度','com.ruoyi.project.monitor.job.controller.JobController.edit()','web','zhangsx','若依集团','/monitor/job/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 18:21:49'),(119,'监控管理','定时任务-保存调度','com.ruoyi.project.monitor.job.controller.JobController.save()','web','zhangsx','若依集团','/monitor/job/save','0:0:0:0:0:0:0:1','{\"jobId\":[\"1\"],\"jobName\":[\"ryTask\"],\"jobGroup\":[\"系统默认（无参）\"],\"methodName\":[\"ryNoParams\"],\"params\":[\"\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"status\":[\"0\"],\"remark\":[\"ryTask\"]}',0,NULL,'2018-04-28 18:21:53'),(120,'监控管理','定时任务-状态修改','com.ruoyi.project.monitor.job.controller.JobController.changeStatus()','web','zhangsx','若依集团','/monitor/job/changeStatus/','0:0:0:0:0:0:0:1','{\"jobId\":[\"1\"],\"status\":[\"1\"]}',0,NULL,'2018-04-28 18:22:02'),(121,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','zhangsx','若依集团','/system/role/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 18:22:10'),(122,'系统管理','角色管理-保存角色','com.ruoyi.project.system.role.controller.RoleController.save()','web','zhangsx','若依集团','/system/role/save','0:0:0:0:0:0:0:1','{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}',0,NULL,'2018-04-28 18:22:22'),(123,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','zhangsx','若依集团','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 18:22:31'),(124,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','zhangsx','若依集团','/system/user/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"108\"],\"loginName\":[\"common\"],\"userName\":[\"zhangsx\"],\"password\":[\"123456\"],\"email\":[\"232@111.com\"],\"phonenumber\":[\"1234567890\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}',0,NULL,'2018-04-28 18:23:30'),(125,'系统管理','部门管理-新增部门','com.ruoyi.project.system.dept.controller.DeptController.add()','web','admin','研发一部','/system/dept/add/100','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-04-28 18:47:55'),(126,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','研发一部','/system/user/edit/102','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:31:09'),(127,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/101','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:33:49'),(128,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"deptName\":[\"智能与信息工程学院\"],\"orderNum\":[\"1\"],\"leader\":[\"马研\"],\"phone\":[\"15011112222\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:34:09'),(129,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/106','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:34:13'),(130,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"106\"],\"parentId\":[\"101\"],\"deptName\":[\"电子信息工程\"],\"orderNum\":[\"1\"],\"leader\":[\"马一\"],\"phone\":[\"15011112227\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:34:24'),(131,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/107','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:34:28'),(132,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"107\"],\"parentId\":[\"101\"],\"deptName\":[\"通信工程\"],\"orderNum\":[\"2\"],\"leader\":[\"马二\"],\"phone\":[\"15011112228\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}',0,NULL,'2018-05-02 10:34:41'),(133,'系统管理','部门管理-新增部门','com.ruoyi.project.system.dept.controller.DeptController.add()','web','admin','研发一部','/system/dept/add/101','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:34:46'),(134,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"parentId\":[\"101\"],\"deptName\":[\"轨道交通自动化\"],\"orderNum\":[\"3\"],\"leader\":[\"马三\"],\"phone\":[\"15200000000\"],\"email\":[\"mj@163.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:35:33'),(135,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/107','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:35:38'),(136,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"107\"],\"parentId\":[\"101\"],\"deptName\":[\"通信工程\"],\"orderNum\":[\"2\"],\"leader\":[\"马二\"],\"phone\":[\"15011112228\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:35:41'),(137,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/102','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:35:48'),(138,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"deptName\":[\"计算机系\"],\"orderNum\":[\"2\"],\"leader\":[\"马市\"],\"phone\":[\"15011112223\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:36:09'),(139,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/108','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:36:13'),(140,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"108\"],\"parentId\":[\"102\"],\"deptName\":[\"软件工程\"],\"orderNum\":[\"1\"],\"leader\":[\"马一\"],\"phone\":[\"15011112229\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:36:20'),(141,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/109','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:36:24'),(142,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"109\"],\"parentId\":[\"102\"],\"deptName\":[\"计算机科学与技术\"],\"orderNum\":[\"2\"],\"leader\":[\"马二\"],\"phone\":[\"15011112210\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}',0,NULL,'2018-05-02 10:36:34'),(143,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/109','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:36:38'),(144,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"109\"],\"parentId\":[\"102\"],\"deptName\":[\"计算机科学与技术\"],\"orderNum\":[\"2\"],\"leader\":[\"马二\"],\"phone\":[\"15011112210\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:36:41'),(145,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/103','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:36:44'),(146,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"deptName\":[\"土木系\"],\"orderNum\":[\"3\"],\"leader\":[\"马测\"],\"phone\":[\"15011112224\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 10:36:52'),(147,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/104','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:36:55'),(148,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"104\"],\"parentId\":[\"100\"],\"deptName\":[\"外语系\"],\"orderNum\":[\"4\"],\"leader\":[\"马财\"],\"phone\":[\"15011112225\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}',0,NULL,'2018-05-02 10:37:05'),(149,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','研发一部','/system/dept/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:37:08'),(150,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','研发一部','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"105\"],\"parentId\":[\"100\"],\"deptName\":[\"经管系\"],\"orderNum\":[\"5\"],\"leader\":[\"马运\"],\"phone\":[\"15011112226\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}',0,NULL,'2018-05-02 10:37:14'),(151,'系统管理','字典管理-查询字典数据','com.ruoyi.project.system.dict.controller.DictTypeController.detail()','web','admin','研发一部','/system/dict/detail/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:38:25'),(152,'系统管理','字典管理-查询字典数据','com.ruoyi.project.system.dict.controller.DictTypeController.detail()','web','admin','研发一部','/system/dict/detail/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:38:32'),(153,'系统管理','字典管理-修改字典数据','com.ruoyi.project.system.dict.controller.DictDataController.edit()','web','admin','研发一部','/system/dict/data/edit/10','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:38:35'),(154,'系统管理','字典管理-修改字典类型','com.ruoyi.project.system.dict.controller.DictTypeController.edit()','web','admin','研发一部','/system/dict/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:38:45'),(155,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','研发一部','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:41:10'),(156,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','admin','研发一部','/system/role/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:48:12'),(157,'系统工具','代码生成-生成代码','com.ruoyi.project.tool.gen.controller.GenController.genCode()','web','admin','研发一部','/tool/gen/genCode/sys_user','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:51:41'),(158,'系统工具','代码生成-生成代码','com.ruoyi.project.tool.gen.controller.GenController.genCode()','web','admin','研发一部','/tool/gen/genCode/sys_user','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 10:51:44'),(159,'系统管理','菜单管理-新增菜单','com.ruoyi.project.system.menu.controller.MenuController.add()','web','admin','电子信息工程','/system/menu/add/0','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 11:28:47'),(160,'系统管理','菜单管理-修改菜单','com.ruoyi.project.system.menu.controller.MenuController.edit()','web','admin','电子信息工程','/system/menu/edit/18','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 11:29:46'),(161,'系统管理','菜单管理-修改菜单','com.ruoyi.project.system.menu.controller.MenuController.edit()','web','admin','电子信息工程','/system/menu/edit/4','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 11:29:52'),(162,'系统管理','菜单管理-新增菜单','com.ruoyi.project.system.menu.controller.MenuController.add()','web','admin','电子信息工程','/system/menu/add/0','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 11:30:02'),(163,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/102','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:28:29'),(164,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','电子信息工程','/system/dept/edit/104','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:28:49'),(165,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','电子信息工程','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"104\"],\"parentId\":[\"100\"],\"deptName\":[\"外语系\"],\"orderNum\":[\"4\"],\"leader\":[\"马财\"],\"phone\":[\"15011112225\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 13:28:52'),(166,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','admin','电子信息工程','/system/dept/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:28:55'),(167,'系统管理','部门管理-保存部门','com.ruoyi.project.system.dept.controller.DeptController.save()','web','admin','电子信息工程','/system/dept/save','0:0:0:0:0:0:0:1','{\"deptId\":[\"105\"],\"parentId\":[\"100\"],\"deptName\":[\"经管系\"],\"orderNum\":[\"5\"],\"leader\":[\"马运\"],\"phone\":[\"15011112226\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}',0,NULL,'2018-05-02 13:28:57'),(168,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:29:06'),(169,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"1\"],\"postCode\":[\"ceo\"],\"postName\":[\"院长\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 13:29:27'),(170,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:29:30'),(171,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"2\"],\"postCode\":[\"se\"],\"postName\":[\"主任\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 13:29:38'),(172,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/3','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:29:41'),(173,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"3\"],\"postCode\":[\"hr\"],\"postName\":[\"辅导员\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 13:29:52'),(174,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/4','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:29:54'),(175,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"4\"],\"postCode\":[\"user\"],\"postName\":[\"学生\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 13:30:05'),(176,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 13:37:16'),(177,'系统管理','角色管理-新增角色','com.ruoyi.project.system.role.controller.RoleController.add()','web','admin','电子信息工程','/system/role/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 15:40:20'),(178,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 15:58:24'),(179,'系统管理','角色管理-新增角色','com.ruoyi.project.system.role.controller.RoleController.add()','web','admin','电子信息工程','/system/role/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:10:34'),(180,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:10:41'),(181,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:13:41'),(182,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"1\"],\"postCode\":[\"Already employed\"],\"postName\":[\"已就业\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 17:15:19'),(183,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:15:23'),(184,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"2\"],\"postCode\":[\"Non employment\"],\"postName\":[\"未就业\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 17:16:24'),(185,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/3','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:16:29'),(186,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"3\"],\"postCode\":[\"Entrepreneurship\"],\"postName\":[\"创业\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 17:17:45'),(187,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','admin','电子信息工程','/system/post/edit/4','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:17:48'),(188,'系统管理','岗位管理-保存岗位','com.ruoyi.project.system.post.controller.PostController.save()','web','admin','电子信息工程','/system/post/save','0:0:0:0:0:0:0:1','{\"postId\":[\"4\"],\"postCode\":[\"Others\"],\"postName\":[\"其他\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}',0,NULL,'2018-05-02 17:18:00'),(189,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:19:23'),(190,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:50:50'),(191,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:55:00'),(192,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 17:58:35'),(193,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:04:07'),(194,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:06:20'),(195,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"\"],\"number\":[\"2019\"],\"studentId\":[\"4140220427\"],\"deptId\":[\"\"],\"loginName\":[\"4140220427\"],\"userName\":[\"张书苇\"],\"password\":[\"123456\"],\"email\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"1\"]}',0,NULL,'2018-05-02 18:06:53'),(196,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/103','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:06:58'),(197,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/103','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:07:07'),(198,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/102','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:07:39'),(199,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:07:51'),(200,'系统管理','用户管理-批量删除','com.ruoyi.project.system.user.controller.UserController.batchRemove()','web','admin','电子信息工程','/system/user/batchRemove','0:0:0:0:0:0:0:1','{\"ids[]\":[\"102\"]}',0,NULL,'2018-05-02 18:20:11'),(201,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:20:20'),(202,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"\"],\"number\":[\"2018\"],\"studentId\":[\"4140220427\"],\"deptId\":[\"106\"],\"loginName\":[\"4140220427\"],\"userName\":[\"张书苇\"],\"password\":[\"123456\"],\"email\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-02 18:20:44'),(203,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/104','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:20:48'),(204,'系统管理','用户管理-重置密码','com.ruoyi.project.system.user.controller.UserController.resetPwd()','web','admin','电子信息工程','/system/user/resetPwd/104','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:20:59'),(205,'系统管理','用户管理-批量删除','com.ruoyi.project.system.user.controller.UserController.batchRemove()','web','admin','电子信息工程','/system/user/batchRemove','0:0:0:0:0:0:0:1','{\"ids[]\":[\"104\"]}',0,NULL,'2018-05-02 18:22:29'),(206,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:23:46'),(207,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"313231\"],\"number\":[\"2018\"],\"studentId\":[\"4140220427\"],\"deptId\":[\"106\"],\"loginName\":[\"4140220427\"],\"userName\":[\"张书苇\"],\"password\":[\"123456\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-02 18:24:19'),(208,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:24:22'),(209,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:32:07'),(210,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','admin','电子信息工程','/system/role/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:33:30'),(211,'系统管理','角色管理-保存角色','com.ruoyi.project.system.role.controller.RoleController.save()','web','admin','电子信息工程','/system/role/save','0:0:0:0:0:0:0:1','{\"roleId\":[\"2\"],\"roleName\":[\"学生\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}',0,NULL,'2018-05-02 18:33:36'),(212,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:33:52'),(213,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/101','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:33:56'),(214,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-02 18:33:59'),(215,'系统管理','用户管理-重置密码','com.ruoyi.project.system.user.controller.UserController.resetPwd()','web','admin','电子信息工程','/system/user/resetPwd/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 10:55:28'),(216,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 10:55:31'),(217,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:04:42'),(218,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:05:48'),(219,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:08:54'),(220,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:13:24'),(221,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:14:08'),(222,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"313231\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:14:27'),(223,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:18:18'),(224,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:19:03'),(225,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"313231\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect EQ, actual COMMA company : update sys_user\n 		 SET dept_id = ?,\n 			\n 			user_name = ?,\n 			email = ?,\n 			phonenumber = ?,\n 			\n            \n            \n            company,\n            \n 			\n 			status = ?,\n 			\n 			update_by = ?,\n 			update_time = sysdate() \n 		where 1=1\n 		 and user_id = ?\r\n### SQL: update sys_user     SET dept_id = ?,          user_name = ?,     email = ?,     phonenumber = ?,                                            company,                       status = ?,          update_by = ?,     update_time = sysdate()     where 1=1     and user_id = ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect EQ, actual COMMA company : update sys_user\n 		 SET dept_id = ?,\n 			\n 			user_name = ?,\n 			email = ?,\n 			phonenumber = ?,\n 			\n            \n            \n            company,\n            \n 			\n 			status = ?,\n 			\n 			update_by = ?,\n 			update_time = sysdate() \n 		where 1=1\n 		 and user_id = ?\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect EQ, actual COMMA company : update sys_user\n 		 SET dept_id = ?,\n 			\n 			user_name = ?,\n 			email = ?,\n 			phonenumber = ?,\n 			\n            \n            \n            company,\n            \n 			\n 			status = ?,\n 			\n 			update_by = ?,\n 			update_time = sysdate() \n 		where 1=1\n 		 and user_id = ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect EQ, actual COMMA company : update sys_user\n 		 SET dept_id = ?,\n 			\n 			user_name = ?,\n 			email = ?,\n 			phonenumber = ?,\n 			\n            \n            \n            company,\n            \n 			\n 			status = ?,\n 			\n 			update_by = ?,\n 			update_time = sysdate() \n 		where 1=1\n 		 and user_id = ?','2018-05-03 11:19:19'),(226,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:23:49'),(227,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"313231\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:23:54'),(228,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:23:57'),(229,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:25:36'),(230,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:25:52'),(231,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:25:58'),(232,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:27:37'),(233,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:27:45'),(234,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:27:52'),(235,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:29:03'),(236,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:31:25'),(237,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:31:51'),(238,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:32:32'),(239,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"companyAdress\":[\"高科西路\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:32:36'),(240,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:35:14'),(241,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"companyAddress\":[\"高科西路\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 11:35:18'),(242,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:35:22'),(243,'系统管理','部门管理-修改部门','com.ruoyi.project.system.dept.controller.DeptController.edit()','web','4140220427','电子信息工程','/system/dept/edit/106','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:35:57'),(244,'系统管理','部门管理-新增部门','com.ruoyi.project.system.dept.controller.DeptController.add()','web','4140220427','电子信息工程','/system/dept/add/100','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:36:03'),(245,'系统管理','用户管理-批量删除','com.ruoyi.project.system.user.controller.UserController.batchRemove()','web','4140220427','电子信息工程','/system/user/batchRemove','0:0:0:0:0:0:0:1','{\"ids[]\":[\"2\"]}',0,NULL,'2018-05-03 11:38:18'),(246,'系统管理','用户管理-重置密码','com.ruoyi.project.system.user.controller.UserController.resetPwd()','web','4140220427','电子信息工程','/system/user/resetPwd/101','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 11:44:16'),(247,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/101','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 15:52:47'),(248,'系统管理','角色管理-删除角色','com.ruoyi.project.system.role.controller.RoleController.remove()','web','admin','电子信息工程','/system/role/remove/2','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 15:53:19'),(249,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 15:53:25'),(250,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 15:53:31'),(251,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','admin','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"邢台市人民医院\"],\"companyAddress\":[\"邢台市河西区\"],\"number\":[\"2018\"],\"studentId\":[\"4140220428\"],\"deptId\":[\"106\"],\"loginName\":[\"4140220428\"],\"userName\":[\"崔鑫\"],\"password\":[\"admin123\"],\"email\":[\"cx@163.com\"],\"phonenumber\":[\"15222222222\"],\"status\":[\"0\"],\"role',0,NULL,'2018-05-03 15:55:02'),(252,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','admin','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 16:58:20'),(253,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/106','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 17:28:46'),(254,'系统管理','用户管理-删除用户','com.ruoyi.project.system.user.controller.UserController.remove()','web','admin','电子信息工程','/system/user/remove/101','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 17:28:57'),(255,'系统管理','用户管理-重置密码','com.ruoyi.project.system.user.controller.UserController.resetPwd()','web','admin','电子信息工程','/system/user/resetPwd/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 17:29:00'),(256,'系统管理','用户管理-重置密码','com.ruoyi.project.system.user.controller.UserController.resetPwd()','web','admin','电子信息工程','/system/user/resetPwd/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 17:29:06'),(257,'系统管理','用户管理-重置密码','com.ruoyi.project.system.user.controller.UserController.resetPwd()','web','admin','电子信息工程','/system/user/resetPwd','0:0:0:0:0:0:0:1','{\"userId\":[\"105\"],\"loginName\":[\"4140220427\"],\"password\":[\"admin123\"]}',0,NULL,'2018-05-03 17:29:15'),(258,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 17:39:06'),(259,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"companyAddress\":[\"高科西路\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 17:39:10'),(260,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/106','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 17:39:13'),(261,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"邢台市人民医院\"],\"companyAddress\":[\"邢台市河西区\"],\"userId\":[\"106\"],\"deptId\":[\"106\"],\"userName\":[\"崔鑫\"],\"email\":[\"cx@163.com\"],\"phonenumber\":[\"15222222222\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 17:39:17'),(262,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/106','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:00:19'),(263,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"邢台市人民医院\"],\"companyAddress\":[\"邢台市河西区\"],\"userId\":[\"106\"],\"deptId\":[\"106\"],\"userName\":[\"崔鑫\"],\"email\":[\"cx@163.com\"],\"phonenumber\":[\"15222222222\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 18:00:22'),(264,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:00:24'),(265,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"123123\"],\"companyAddress\":[\"高科西路\"],\"userId\":[\"105\"],\"deptId\":[\"106\"],\"userName\":[\"张书苇\"],\"email\":[\"31322@11\"],\"phonenumber\":[\"1213\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}',0,NULL,'2018-05-03 18:00:27'),(266,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','4140220427','电子信息工程','/system/user/edit/105','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:03:32'),(267,'系统管理','用户管理-新增用户','com.ruoyi.project.system.user.controller.UserController.add()','web','4140220427','电子信息工程','/system/user/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:03:35'),(268,'系统管理','部门管理-保存部门','com.ruoyi.project.system.user.controller.UserController.save()','web','4140220427','电子信息工程','/system/user/save','0:0:0:0:0:0:0:1','{\"company\":[\"融信信息科技有限公司\"],\"companyAddress\":[\"上海市浦东新区高科西路1810号13楼\"],\"number\":[\"2019\"],\"studentId\":[\"4140220426\"],\"deptId\":[\"108\"],\"loginName\":[\"4140220426\"],\"userName\":[\"张书新\"],\"password\":[\"admin123\"],\"email\":[\"zhangsxnaive@163.com\"],\"phonenumber\":[\"1561130',0,NULL,'2018-05-03 18:05:01'),(269,'系统管理','角色管理-新增角色','com.ruoyi.project.system.role.controller.RoleController.add()','web','4140220427','电子信息工程','/system/role/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:19:55'),(270,'系统管理','角色管理-保存角色','com.ruoyi.project.system.role.controller.RoleController.save()','web','4140220427','电子信息工程','/system/role/save','0:0:0:0:0:0:0:1','{\"roleName\":[\"超级管理员\"],\"roleKey\":[\"root\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"超管\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10,2,11,53,54,55,12,56,57,13,58,59,',0,NULL,'2018-05-03 18:20:31'),(271,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','4140220427','电子信息工程','/system/role/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:20:35'),(272,'系统管理','角色管理-保存角色','com.ruoyi.project.system.role.controller.RoleController.save()','web','4140220427','电子信息工程','/system/role/save','0:0:0:0:0:0:0:1','{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10\"]}',0,NULL,'2018-05-03 18:20:39'),(273,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','4140220427','电子信息工程','/system/role/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:20:51'),(274,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','4140220427','电子信息工程','/system/role/edit/3','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:20:57'),(275,'系统管理','角色管理-保存角色','com.ruoyi.project.system.role.controller.RoleController.save()','web','4140220427','电子信息工程','/system/role/save','0:0:0:0:0:0:0:1','{\"roleId\":[\"3\"],\"roleName\":[\"超级管理员\"],\"roleKey\":[\"root\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10,2,11,53,54,55,12,56',0,NULL,'2018-05-03 18:21:01'),(276,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','4140220427','电子信息工程','/system/role/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:21:05'),(277,'系统管理','角色管理-保存角色','com.ruoyi.project.system.role.controller.RoleController.save()','web','4140220427','电子信息工程','/system/role/save','0:0:0:0:0:0:0:1','{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10\"]}',0,NULL,'2018-05-03 18:21:08'),(278,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','4140220427','电子信息工程','/system/role/edit/3','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:21:14'),(279,'系统管理','角色管理-修改角色','com.ruoyi.project.system.role.controller.RoleController.edit()','web','4140220427','电子信息工程','/system/role/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:21:23'),(280,'系统管理','字典管理-查询字典数据','com.ruoyi.project.system.dict.controller.DictTypeController.detail()','web','4140220427','电子信息工程','/system/dict/detail/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:21:44'),(281,'系统管理','岗位管理-修改岗位','com.ruoyi.project.system.post.controller.PostController.edit()','web','4140220427','电子信息工程','/system/post/edit/1','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:24:45'),(282,'系统管理','岗位管理-新增岗位','com.ruoyi.project.system.post.controller.PostController.add()','web','4140220427','电子信息工程','/system/post/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:26:50'),(283,'系统管理','岗位管理-新增岗位','com.ruoyi.project.system.post.controller.PostController.add()','web','4140220427','电子信息工程','/system/post/add','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:27:00'),(284,'系统管理','用户管理-修改用户','com.ruoyi.project.system.user.controller.UserController.edit()','web','admin','电子信息工程','/system/user/edit/107','0:0:0:0:0:0:0:1','{}',0,NULL,'2018-05-03 18:27:39');

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` int(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'Already employed','已就业',1,0,'admin','2018-05-02 17:15:19','admin','2018-05-02 17:15:19',''),(2,'Non employment','未就业',2,0,'admin','2018-05-02 17:16:24','admin','2018-05-02 17:16:24',''),(3,'Entrepreneurship','创业',3,0,'admin','2018-05-02 17:17:45','admin','2018-05-02 17:17:45',''),(4,'Others','其他',4,0,'admin','2018-05-02 17:18:00','admin','2018-05-02 17:18:00','');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(10) NOT NULL COMMENT '显示顺序',
  `status` int(1) DEFAULT '0' COMMENT '角色状态:0正常,1禁用',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'管理员','admin',2,0,'admin','2018-05-03 18:21:08','4140220427','2018-05-03 18:21:08','管理员'),(3,'超级管理员','root',1,0,'4140220427','2018-05-03 18:21:01','4140220427','2018-05-03 18:21:01','超管');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (1,1),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) DEFAULT '' COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `student_id` varchar(10) DEFAULT NULL COMMENT '学号',
  `employee` varchar(10) DEFAULT NULL COMMENT '就业状态',
  `number` int(4) DEFAULT NULL COMMENT '届数',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `email` varchar(100) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(20) DEFAULT '' COMMENT '手机号码',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `salt` varchar(100) DEFAULT '' COMMENT '盐加密',
  `user_type` char(1) DEFAULT 'N' COMMENT '类型:Y默认用户,N非默认用户',
  `status` int(1) DEFAULT '0' COMMENT '帐号状态:0正常,1禁用',
  `refuse_des` varchar(500) DEFAULT '' COMMENT '拒绝登录描述',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`student_id`,`employee`,`number`,`company`,`company_address`,`email`,`phonenumber`,`password`,`salt`,`user_type`,`status`,`refuse_des`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,106,'admin','若依',NULL,NULL,NULL,NULL,NULL,'yzz_ivy@163.com','15088888888','29c67a30398638269fe600f73a054934','111111','Y',0,'维护中','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00'),(105,106,'4140220427','张书苇','4140220427','未就业',2018,'123123','高科西路','31322@11','1213','c16899d62c5fba11a4fc33580e16e120','a2cf36','N',0,'','admin','2018-05-03 18:00:26','4140220427','2018-05-03 18:00:26'),(106,106,'4140220428','崔鑫','4140220428','未就业',2018,'邢台市人民医院','邢台市河西区','cx@163.com','15222222222','abe44d25cd8cf15b01bd881d86365b20','927e2b','N',0,'','admin','2018-05-03 18:00:22','4140220427','2018-05-03 18:00:22'),(107,108,'4140220426','张书新','4140220426','已就业',2019,'融信信息科技有限公司','上海市浦东新区高科西路1810号13楼','zhangsxnaive@163.com','15611300356','3b58a3a8e3c9bf43a10c3c75b1d6d997','2b4eb7','N',0,'','4140220427','2018-05-03 18:05:01','','0000-00-00 00:00:00');

/*Table structure for table `sys_user_online` */

DROP TABLE IF EXISTS `sys_user_online`;

CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestsamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'session创建时间',
  `last_access_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

/*Data for the table `sys_user_online` */

insert  into `sys_user_online`(`sessionId`,`login_name`,`dept_name`,`ipaddr`,`browser`,`os`,`status`,`start_timestsamp`,`last_access_time`,`expire_time`) values ('4c7482a6-ddd0-472d-87fe-8e279e4862ac','admin','电子信息工程','0:0:0:0:0:0:0:1','Microsoft Edge','Windows 10','on_line','2018-05-03 18:27:22','2018-05-03 18:27:22',1800000);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values ('1','1'),('100','1'),('101','1'),('102','4'),('103','1'),('104','2'),('105','2'),('106','2'),('107','1'),('2','2');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(100,1),(105,1),(107,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
