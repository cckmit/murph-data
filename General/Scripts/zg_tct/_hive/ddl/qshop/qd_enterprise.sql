-- mysql
CREATE TABLE `qd_enterprise` (
  `pkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `enterprise_id` bigint(20) NOT NULL COMMENT '������ҵid',
  `enterprise_name` varchar(50) DEFAULT NULL COMMENT '������ҵ����',
  `qd_main_no` varchar(20) DEFAULT NULL COMMENT '��ҵ����',
  `qd_enterprise_name` varchar(50) DEFAULT NULL COMMENT '�����ҵ����',
  `qd_no_name` varchar(255) DEFAULT NULL COMMENT '����ײ�����',
  `qd_no_count` int(11) DEFAULT NULL COMMENT '�����ײ���ϯ����',
  `qd_no_expire_time` datetime DEFAULT NULL COMMENT '����ײ�ʧЧʱ��',
  `status` tinyint(4) DEFAULT '0' COMMENT '״̬ Ĭ��0 0������1����',
  `appid` varchar(50) DEFAULT NULL,
  `secret_key` varchar(50) DEFAULT NULL,
  `belong_industry` tinyint(4) NOT NULL DEFAULT '1' COMMENT '������ҵ��������1��������2����ɫ������3������Ԫ������4�����ڣ�5���ۺϹ�ҵƷ��6�����䣺7����ϸ��ѧƷ��8��ӡˢ��9�����Σ�10��������11��������12��������13��������0',
  `add_by` bigint(20) DEFAULT NULL COMMENT '�����',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `add_ip` varchar(20) DEFAULT NULL COMMENT '���ip',
  `modified_by` bigint(20) DEFAULT NULL COMMENT '�޸���',
  `modified_time` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `modified_ip` varchar(20) DEFAULT NULL COMMENT '�޸�ip',
  `valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '��¼�Ƿ���Ч 1:��Ч 0����Ч',
  `auth_type` tinyint(4) DEFAULT '0' COMMENT '��ҵ��Ȩ���ͣ�0����Ȩ��1����Ȩ',
  `sid` varchar(50) DEFAULT NULL COMMENT 'Ӧ��id',
  `saleMatch_push_all` tinyint(4) DEFAULT '1' COMMENT '�Ƿ����̻����͸������µ������� 1:�� 0����',
  `shop_status` varchar(1) DEFAULT 'N' COMMENT '�Ƿ�����ҵ����(Y:����;N:������)',
  `shop_no` varchar(32) DEFAULT NULL COMMENT '���̱��',
  `is_virtual_enterprise` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�������ҵ 0���� 1�� 2 ��Q��ҵ',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `un_enterprise_appid` (`appid`) USING BTREE,
  KEY `enterprise_id_index` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4
;

--impala
create table  tct_ods.qshop_qd_enterprise (
  `pkid` bigint comment '����',
  `enterprise_id` bigint comment '������ҵid',
  `enterprise_name` string comment '������ҵ����',
  `qd_main_no` string comment '��ҵ����',
  `qd_enterprise_name` string comment '�����ҵ����',
  `qd_no_name` string comment '����ײ�����',
  `qd_no_count` bigint  comment '�����ײ���ϯ����',
  `qd_no_expire_time` timestamp  comment '����ײ�ʧЧʱ��',
  `status` tinyint comment '״̬ Ĭ��0 0������1����',
  `appid` string comment 'appid',
  `secret_key` string,
  `belong_industry` tinyint comment '������ҵ��������1��������2����ɫ������3������Ԫ������4�����ڣ�5���ۺϹ�ҵƷ��6�����䣺7����ϸ��ѧƷ��8��ӡˢ��9�����Σ�10��������11��������12��������13��������0',
  `add_by` bigint comment '�����',
  `add_time` timestamp comment '���ʱ��',
  `add_ip` string comment '���ip',
  `modified_by` bigint comment '�޸���',
  `modified_time` timestamp comment '�޸�ʱ��',
  `modified_ip` string comment '�޸�ip',
  `valid` tinyint comment '��¼�Ƿ���Ч 1:��Ч 0����Ч',
  `auth_type` tinyint comment '��ҵ��Ȩ���ͣ�0����Ȩ��1����Ȩ',
  `sid` string comment 'Ӧ��id',
  `saleMatch_push_all` tinyint comment '�Ƿ����̻����͸������µ������� 1:�� 0����',
  `shop_status` char(3) comment '�Ƿ�����ҵ����(Y:����;N:������)',
  `shop_no` string comment '���̱��',
  `is_virtual_enterprise` tinyint comment '�Ƿ�������ҵ 0���� 1�� 2 ��Q��ҵ'
) 
comment '��Ӧ����Ϣ��'
-- row format serde 'org.apache.hive.hcatalog.data.JsonSerDe'
stored as parquet
;