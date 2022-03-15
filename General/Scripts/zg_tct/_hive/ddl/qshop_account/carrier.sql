-- mysql;
create table `carrier` (
  `pkid` bigint(20) unsigned not null AUTO_INCREMENT COMMENT '主键',
  `carrier_fullname` varchar(50) not null COMMENT '运营商全称',
  `carrier_shortname` varchar(30) not null COMMENT '运营商简称',
  `belong_industry` tinyint(4) not null COMMENT '所属行业',
  `carrier_intro` varchar(100) default null COMMENT '运营商简介',
  `principal` varchar(45) not null COMMENT '负责人',
  `principal_qq` varchar(20) not null COMMENT '负责人QQ',
  `principal_mobile` varchar(20) not null COMMENT '负责人手机号',
  `valid` tinyint(4) default '1' COMMENT '是否有效',
  `app_id` varchar(64) default null COMMENT 'appId',
  `remark` varchar(200) default null COMMENT '备注',
  `add_time` datetime default null COMMENT '添加时间',
  `add_by` bigint(20) default null COMMENT '添加人',
  `modify_time` datetime default null COMMENT '修改时间',
  `modify_by` bigint(20) default null COMMENT '修改人',
  `dealer_id` bigint(20) default null COMMENT '所属经销商',
  `carrier_type` tinyint(4) default null COMMENT '运营商类型，1销售代理商，2平台运营商',
  `customer_service_qq` varchar(50) default null COMMENT '客服qq',
  primary key (`pkid`),
  unique key `app_id` (`app_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1111111122 default CHARSET = utf8mb4 COMMENT = '供应商信息表'
;

-- impala;
-- drop table if exists tct_ods.qshop_carrier;
create table if not exists tct_ods.qshop_account_carrier (
  `pkid` bigint comment '主键',
  `carrier_fullname` string comment '运营商全称',
  `carrier_shortname` string comment '运营商简称',
  `belong_industry` tinyint comment '所属行业',
  `carrier_intro` string comment '运营商简介',
  `principal` string comment '负责人',
  `principal_qq` string comment '负责人qq',
  `principal_mobile` string comment '负责人手机号',
  `valid` tinyint comment '是否有效',
  `app_id` string comment 'appid',
  `remark` string comment '备注',
  `add_time` timestamp comment '添加时间',
  `add_by` bigint comment '添加人',
  `modify_time` timestamp comment '修改时间',
  `modify_by` bigint comment '修改人',
  `dealer_id` bigint comment '所属经销商',
  `carrier_type` tinyint comment '运营商类型，1销售代理商，2平台运营商',
  `customer_service_qq` string comment '客服qq'
)  
comment '供应商信息表'
-- row format serde 'org.apache.hive.hcatalog.data.JsonSerDe'
stored as parquet