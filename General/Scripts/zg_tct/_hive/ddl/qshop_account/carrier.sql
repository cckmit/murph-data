-- mysql;
create table `carrier` (
  `pkid` bigint(20) unsigned not null AUTO_INCREMENT COMMENT '����',
  `carrier_fullname` varchar(50) not null COMMENT '��Ӫ��ȫ��',
  `carrier_shortname` varchar(30) not null COMMENT '��Ӫ�̼��',
  `belong_industry` tinyint(4) not null COMMENT '������ҵ',
  `carrier_intro` varchar(100) default null COMMENT '��Ӫ�̼��',
  `principal` varchar(45) not null COMMENT '������',
  `principal_qq` varchar(20) not null COMMENT '������QQ',
  `principal_mobile` varchar(20) not null COMMENT '�������ֻ���',
  `valid` tinyint(4) default '1' COMMENT '�Ƿ���Ч',
  `app_id` varchar(64) default null COMMENT 'appId',
  `remark` varchar(200) default null COMMENT '��ע',
  `add_time` datetime default null COMMENT '���ʱ��',
  `add_by` bigint(20) default null COMMENT '�����',
  `modify_time` datetime default null COMMENT '�޸�ʱ��',
  `modify_by` bigint(20) default null COMMENT '�޸���',
  `dealer_id` bigint(20) default null COMMENT '����������',
  `carrier_type` tinyint(4) default null COMMENT '��Ӫ�����ͣ�1���۴����̣�2ƽ̨��Ӫ��',
  `customer_service_qq` varchar(50) default null COMMENT '�ͷ�qq',
  primary key (`pkid`),
  unique key `app_id` (`app_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1111111122 default CHARSET = utf8mb4 COMMENT = '��Ӧ����Ϣ��'
;

-- impala;
-- drop table if exists tct_ods.qshop_carrier;
create table if not exists tct_ods.qshop_account_carrier (
  `pkid` bigint comment '����',
  `carrier_fullname` string comment '��Ӫ��ȫ��',
  `carrier_shortname` string comment '��Ӫ�̼��',
  `belong_industry` tinyint comment '������ҵ',
  `carrier_intro` string comment '��Ӫ�̼��',
  `principal` string comment '������',
  `principal_qq` string comment '������qq',
  `principal_mobile` string comment '�������ֻ���',
  `valid` tinyint comment '�Ƿ���Ч',
  `app_id` string comment 'appid',
  `remark` string comment '��ע',
  `add_time` timestamp comment '���ʱ��',
  `add_by` bigint comment '�����',
  `modify_time` timestamp comment '�޸�ʱ��',
  `modify_by` bigint comment '�޸���',
  `dealer_id` bigint comment '����������',
  `carrier_type` tinyint comment '��Ӫ�����ͣ�1���۴����̣�2ƽ̨��Ӫ��',
  `customer_service_qq` string comment '�ͷ�qq'
)  
comment '��Ӧ����Ϣ��'
-- row format serde 'org.apache.hive.hcatalog.data.JsonSerDe'
stored as parquet