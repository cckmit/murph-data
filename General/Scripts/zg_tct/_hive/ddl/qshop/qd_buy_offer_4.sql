-- mysql

CREATE TABLE `qd_buy_offer_4` (
  `pkid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据主键',
  `buyOffer_title` varchar(500) DEFAULT NULL COMMENT '询价标题',
  `number` varchar(20) NOT NULL COMMENT '询价单编号（YYYYMMDD+8位流水码）',
  `source` varchar(45) NOT NULL COMMENT '询价单来源（例如qq群的openId）',
  `platform_number` varchar(20) DEFAULT NULL COMMENT '平台编号（群号）',
  `platform_name` varchar(500) DEFAULT NULL COMMENT '平台名称（群名称）',
  `delivery_time` bigint(20) DEFAULT NULL COMMENT '交期',
  `delivery_address` varchar(100) DEFAULT NULL COMMENT '收货地',
  `buy_scope` bigint(20) DEFAULT NULL COMMENT '询价范围',
  `status` tinyint(4) NOT NULL COMMENT '询价单状态 0：失效  1：生效',
  `buy_describe` varchar(250) DEFAULT NULL COMMENT '询价单描述',
  `bill_annex` longblob COMMENT '单据附件',
  `invoice_title` varchar(200) DEFAULT NULL COMMENT '客户抬头',
  `contact_number` varchar(45) DEFAULT NULL COMMENT '客户编号（客户的openId）',
  `contact_name` varchar(100) DEFAULT NULL COMMENT '客户姓名',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contact_qq` varchar(20) DEFAULT NULL COMMENT '联系人qq',
  `contact_email` varchar(40) DEFAULT NULL COMMENT '联系人邮箱',
  `original_text` varchar(2000) DEFAULT NULL COMMENT '询价原文',
  `buy_time` datetime NOT NULL COMMENT '询价时间',
  `buy_effective_time` datetime NOT NULL COMMENT '询价有效时间',
  `buy_type` tinyint(4) NOT NULL COMMENT '询价单类型 1：企点群 2:运营商转发  3：外部导入',
  `modify_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `nlp_id` varchar(200) NOT NULL COMMENT '腾讯推送消息nlp场景下全局唯一标志',
  `belong_industry` tinyint(4) NOT NULL COMMENT '所属行业，钢铁：1；化工：2；有色金属：3；电子元器件：4；金融：5；综合工业品：6；汽配：7；精细化学品：8；印刷：9；旅游：10；教育：11；物流：12；货代：13；其他：0',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `ids_nlpid_butType` (`nlp_id`,`buy_type`)
) ENGINE=InnoDB AUTO_INCREMENT=804671618022993921 DEFAULT CHARSET=utf8mb4 COMMENT='询价单表'
;


-- impala
create table tct_ods.qshop_qd_buy_offer_4 (
  `pkid` bigint comment '数据主键',
  `buyOffer_title` string comment '询价标题',
  `number` string comment '询价单编号（YYYYMMDD+8位流水码）',
  `source` string comment '询价单来源（例如qq群的openId）',
  `platform_number` string comment '平台编号（群号）',
  `platform_name` string comment '平台名称（群名称）',
  `delivery_time` bigint comment '交期',
  `delivery_address` string comment '收货地',
  `buy_scope` bigint comment '询价范围',
  `status` tinyint comment '询价单状态 0：失效  1：生效',
  `buy_describe` string comment '询价单描述',
  -- `bill_annex` longblob COMMENT '单据附件',
  `invoice_title` string comment '客户抬头',
  `contact_number` string comment '客户编号（客户的openId）',
  `contact_name` string comment '客户姓名',
  `contact_phone` string comment '联系人电话',
  `contact_qq` string comment '联系人qq',
  `contact_email` string comment '联系人邮箱',
  `original_text` string comment '询价原文',
  `buy_time` timestamp comment '询价时间',
  `buy_effective_time` timestamp comment '询价有效时间',
  `buy_type` tinyint comment '询价单类型 1：企点群 2:运营商转发  3：外部导入',
  `modify_time` timestamp comment '编辑时间',
  `nlp_id` string comment '腾讯推送消息nlp场景下全局唯一标志',
  `belong_industry` tinyint comment '所属行业，钢铁：1；化工：2；有色金属：3；电子元器件：4；金融：5；综合工业品：6；汽配：7；精细化学品：8；印刷：9；旅游：10；教育：11；物流：12；货代：13；其他：0',
  `add_time` timestamp comment '添加时间'
) 
comment '询价单表'
stored as parquet