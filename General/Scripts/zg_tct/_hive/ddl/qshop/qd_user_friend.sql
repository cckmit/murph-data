-- mysql
CREATE TABLE `qd_user_friend` (
  `pkid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(45) NOT NULL COMMENT '坐席对应的企业appid',
  `open_id` varchar(100) NOT NULL COMMENT '坐席openid',
  `account_id` bigint(15) NOT NULL COMMENT '坐席对应用户id',
  `friend_open_id` varchar(100) NOT NULL COMMENT '好友openid',
  `add_by` bigint(15) DEFAULT '0' COMMENT '新增者id',
  `add_time` datetime NOT NULL COMMENT '新增时间',
  `modified_by` bigint(15) DEFAULT '0' COMMENT '最后修改者ID',
  `modified_time` datetime NOT NULL COMMENT '最后修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1有效 0无效',
  PRIMARY KEY (`pkid`),
  KEY `idx_friend_open_id` (`friend_open_id`),
  KEY `idx_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4 COMMENT='坐席商机好友表'
;

-- impala
create table tct_ods.qshop_qd_user_friend (
  `pkid` bigint,
  `app_id` string comment '坐席对应的企业appid',
  `open_id` string comment '坐席openid',
  `account_id` bigint comment '坐席对应用户id',
  `friend_open_id` string comment '好友openid',
  `add_by` bigint comment '新增者id',
  `add_time` timestamp comment '新增时间',
  `modified_by` bigint comment '最后修改者ID',
  `modified_time` timestamp comment '最后修改时间',
  `valid` tinyint comment '是否有效 1有效 0无效'
) 
comment '坐席商机好友表'
-- row format serde 'org.apache.hive.hcatalog.data.JsonSerDe'
stored as parquet
;