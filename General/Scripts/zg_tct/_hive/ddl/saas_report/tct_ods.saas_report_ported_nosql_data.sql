create table if not exists tct_ods.saas_report_ported_nosql_data (
  `pkid` bigint comment '��������',
  `batch` string comment '���飬���ںϲ����������',
  
  `outer_item` string comment '������',
  `item_key` string comment '������key��redis���ַ�����string����ƽ״̬�£�hash��key��set���������Ǵ�ƽ״̬��map/json��set/json��',
  `item_value` string comment '������ֵvalue',
  
  `add_time` timestamp comment '��������ʱ��'
) 
partitioned by (dt string comment '�����ֶ�')
comment '�ӷǹ�ϵ�����ݿ�ͬ������������'
stored as avro
;