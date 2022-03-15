-- mysql

CREATE TABLE `qd_buy_offer_4` (
  `pkid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '��������',
  `buyOffer_title` varchar(500) DEFAULT NULL COMMENT 'ѯ�۱���',
  `number` varchar(20) NOT NULL COMMENT 'ѯ�۵���ţ�YYYYMMDD+8λ��ˮ�룩',
  `source` varchar(45) NOT NULL COMMENT 'ѯ�۵���Դ������qqȺ��openId��',
  `platform_number` varchar(20) DEFAULT NULL COMMENT 'ƽ̨��ţ�Ⱥ�ţ�',
  `platform_name` varchar(500) DEFAULT NULL COMMENT 'ƽ̨���ƣ�Ⱥ���ƣ�',
  `delivery_time` bigint(20) DEFAULT NULL COMMENT '����',
  `delivery_address` varchar(100) DEFAULT NULL COMMENT '�ջ���',
  `buy_scope` bigint(20) DEFAULT NULL COMMENT 'ѯ�۷�Χ',
  `status` tinyint(4) NOT NULL COMMENT 'ѯ�۵�״̬ 0��ʧЧ  1����Ч',
  `buy_describe` varchar(250) DEFAULT NULL COMMENT 'ѯ�۵�����',
  `bill_annex` longblob COMMENT '���ݸ���',
  `invoice_title` varchar(200) DEFAULT NULL COMMENT '�ͻ�̧ͷ',
  `contact_number` varchar(45) DEFAULT NULL COMMENT '�ͻ���ţ��ͻ���openId��',
  `contact_name` varchar(100) DEFAULT NULL COMMENT '�ͻ�����',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '��ϵ�˵绰',
  `contact_qq` varchar(20) DEFAULT NULL COMMENT '��ϵ��qq',
  `contact_email` varchar(40) DEFAULT NULL COMMENT '��ϵ������',
  `original_text` varchar(2000) DEFAULT NULL COMMENT 'ѯ��ԭ��',
  `buy_time` datetime NOT NULL COMMENT 'ѯ��ʱ��',
  `buy_effective_time` datetime NOT NULL COMMENT 'ѯ����Чʱ��',
  `buy_type` tinyint(4) NOT NULL COMMENT 'ѯ�۵����� 1�����Ⱥ 2:��Ӫ��ת��  3���ⲿ����',
  `modify_time` datetime DEFAULT NULL COMMENT '�༭ʱ��',
  `nlp_id` varchar(200) NOT NULL COMMENT '��Ѷ������Ϣnlp������ȫ��Ψһ��־',
  `belong_industry` tinyint(4) NOT NULL COMMENT '������ҵ��������1��������2����ɫ������3������Ԫ������4�����ڣ�5���ۺϹ�ҵƷ��6�����䣺7����ϸ��ѧƷ��8��ӡˢ��9�����Σ�10��������11��������12��������13��������0',
  `add_time` datetime NOT NULL COMMENT '���ʱ��',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `ids_nlpid_butType` (`nlp_id`,`buy_type`)
) ENGINE=InnoDB AUTO_INCREMENT=804671618022993921 DEFAULT CHARSET=utf8mb4 COMMENT='ѯ�۵���'
;


-- impala
create table tct_ods.qshop_qd_buy_offer_4 (
  `pkid` bigint comment '��������',
  `buyOffer_title` string comment 'ѯ�۱���',
  `number` string comment 'ѯ�۵���ţ�YYYYMMDD+8λ��ˮ�룩',
  `source` string comment 'ѯ�۵���Դ������qqȺ��openId��',
  `platform_number` string comment 'ƽ̨��ţ�Ⱥ�ţ�',
  `platform_name` string comment 'ƽ̨���ƣ�Ⱥ���ƣ�',
  `delivery_time` bigint comment '����',
  `delivery_address` string comment '�ջ���',
  `buy_scope` bigint comment 'ѯ�۷�Χ',
  `status` tinyint comment 'ѯ�۵�״̬ 0��ʧЧ  1����Ч',
  `buy_describe` string comment 'ѯ�۵�����',
  -- `bill_annex` longblob COMMENT '���ݸ���',
  `invoice_title` string comment '�ͻ�̧ͷ',
  `contact_number` string comment '�ͻ���ţ��ͻ���openId��',
  `contact_name` string comment '�ͻ�����',
  `contact_phone` string comment '��ϵ�˵绰',
  `contact_qq` string comment '��ϵ��qq',
  `contact_email` string comment '��ϵ������',
  `original_text` string comment 'ѯ��ԭ��',
  `buy_time` timestamp comment 'ѯ��ʱ��',
  `buy_effective_time` timestamp comment 'ѯ����Чʱ��',
  `buy_type` tinyint comment 'ѯ�۵����� 1�����Ⱥ 2:��Ӫ��ת��  3���ⲿ����',
  `modify_time` timestamp comment '�༭ʱ��',
  `nlp_id` string comment '��Ѷ������Ϣnlp������ȫ��Ψһ��־',
  `belong_industry` tinyint comment '������ҵ��������1��������2����ɫ������3������Ԫ������4�����ڣ�5���ۺϹ�ҵƷ��6�����䣺7����ϸ��ѧƷ��8��ӡˢ��9�����Σ�10��������11��������12��������13��������0',
  `add_time` timestamp comment '���ʱ��'
) 
comment 'ѯ�۵���'
stored as parquet