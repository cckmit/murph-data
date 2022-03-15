-- mysql
CREATE TABLE `qd_user_friend` (
  `pkid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(45) NOT NULL COMMENT '��ϯ��Ӧ����ҵappid',
  `open_id` varchar(100) NOT NULL COMMENT '��ϯopenid',
  `account_id` bigint(15) NOT NULL COMMENT '��ϯ��Ӧ�û�id',
  `friend_open_id` varchar(100) NOT NULL COMMENT '����openid',
  `add_by` bigint(15) DEFAULT '0' COMMENT '������id',
  `add_time` datetime NOT NULL COMMENT '����ʱ��',
  `modified_by` bigint(15) DEFAULT '0' COMMENT '����޸���ID',
  `modified_time` datetime NOT NULL COMMENT '����޸�ʱ��',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч 1��Ч 0��Ч',
  PRIMARY KEY (`pkid`),
  KEY `idx_friend_open_id` (`friend_open_id`),
  KEY `idx_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4 COMMENT='��ϯ�̻����ѱ�'
;

-- impala
create table tct_ods.qshop_qd_user_friend (
  `pkid` bigint,
  `app_id` string comment '��ϯ��Ӧ����ҵappid',
  `open_id` string comment '��ϯopenid',
  `account_id` bigint comment '��ϯ��Ӧ�û�id',
  `friend_open_id` string comment '����openid',
  `add_by` bigint comment '������id',
  `add_time` timestamp comment '����ʱ��',
  `modified_by` bigint comment '����޸���ID',
  `modified_time` timestamp comment '����޸�ʱ��',
  `valid` tinyint comment '�Ƿ���Ч 1��Ч 0��Ч'
) 
comment '��ϯ�̻����ѱ�'
-- row format serde 'org.apache.hive.hcatalog.data.JsonSerDe'
stored as parquet
;