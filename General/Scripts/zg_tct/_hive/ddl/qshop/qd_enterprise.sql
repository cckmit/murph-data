-- mysql
CREATE TABLE `qd_enterprise` (
  `pkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enterprise_id` bigint(20) NOT NULL COMMENT '云商企业id',
  `enterprise_name` varchar(50) DEFAULT NULL COMMENT '云商企业名称',
  `qd_main_no` varchar(20) DEFAULT NULL COMMENT '企业主号',
  `qd_enterprise_name` varchar(50) DEFAULT NULL COMMENT '企点企业名称',
  `qd_no_name` varchar(255) DEFAULT NULL COMMENT '企点套餐名称',
  `qd_no_count` int(11) DEFAULT NULL COMMENT '企点号套餐坐席个数',
  `qd_no_expire_time` datetime DEFAULT NULL COMMENT '企点套餐失效时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 默认0 0正常；1禁用',
  `appid` varchar(50) DEFAULT NULL,
  `secret_key` varchar(50) DEFAULT NULL,
  `belong_industry` tinyint(4) NOT NULL DEFAULT '1' COMMENT '所属行业，钢铁：1；化工：2；有色金属：3；电子元器件：4；金融：5；综合工业品：6；汽配：7；精细化学品：8；印刷：9；旅游：10；教育：11；物流：12；货代：13；其他：0',
  `add_by` bigint(20) DEFAULT NULL COMMENT '添加人',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `add_ip` varchar(20) DEFAULT NULL COMMENT '添加ip',
  `modified_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_ip` varchar(20) DEFAULT NULL COMMENT '修改ip',
  `valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '记录是否有效 1:有效 0：无效',
  `auth_type` tinyint(4) DEFAULT '0' COMMENT '企业授权类型：0旧授权，1新授权',
  `sid` varchar(50) DEFAULT NULL COMMENT '应用id',
  `saleMatch_push_all` tinyint(4) DEFAULT '1' COMMENT '是否开启商机推送给主号下的所有人 1:是 0：否',
  `shop_status` varchar(1) DEFAULT 'N' COMMENT '是否开启企业店铺(Y:开启;N:不开启)',
  `shop_no` varchar(32) DEFAULT NULL COMMENT '店铺编号',
  `is_virtual_enterprise` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否虚拟企业 0不是 1是 2 个Q企业',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `un_enterprise_appid` (`appid`) USING BTREE,
  KEY `enterprise_id_index` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4
;

--impala
create table  tct_ods.qshop_qd_enterprise (
  `pkid` bigint comment '主键',
  `enterprise_id` bigint comment '云商企业id',
  `enterprise_name` string comment '云商企业名称',
  `qd_main_no` string comment '企业主号',
  `qd_enterprise_name` string comment '企点企业名称',
  `qd_no_name` string comment '企点套餐名称',
  `qd_no_count` bigint  comment '企点号套餐坐席个数',
  `qd_no_expire_time` timestamp  comment '企点套餐失效时间',
  `status` tinyint comment '状态 默认0 0正常；1禁用',
  `appid` string comment 'appid',
  `secret_key` string,
  `belong_industry` tinyint comment '所属行业，钢铁：1；化工：2；有色金属：3；电子元器件：4；金融：5；综合工业品：6；汽配：7；精细化学品：8；印刷：9；旅游：10；教育：11；物流：12；货代：13；其他：0',
  `add_by` bigint comment '添加人',
  `add_time` timestamp comment '添加时间',
  `add_ip` string comment '添加ip',
  `modified_by` bigint comment '修改人',
  `modified_time` timestamp comment '修改时间',
  `modified_ip` string comment '修改ip',
  `valid` tinyint comment '记录是否有效 1:有效 0：无效',
  `auth_type` tinyint comment '企业授权类型：0旧授权，1新授权',
  `sid` string comment '应用id',
  `saleMatch_push_all` tinyint comment '是否开启商机推送给主号下的所有人 1:是 0：否',
  `shop_status` char(3) comment '是否开启企业店铺(Y:开启;N:不开启)',
  `shop_no` string comment '店铺编号',
  `is_virtual_enterprise` tinyint comment '是否虚拟企业 0不是 1是 2 个Q企业'
) 
comment '供应商信息表'
-- row format serde 'org.apache.hive.hcatalog.data.JsonSerDe'
stored as parquet
;