create table if not exists tct_ods.saas_report_ported_nosql_data (
  `pkid` bigint comment '数据主键',
  `batch` string comment '分组，用于合并多个数据项',
  
  `outer_item` string comment '数据项',
  `item_key` string comment '数据项key：redis（字符串：string，打平状态下：hash的key、set的索引，非打平状态：map/json、set/json）',
  `item_value` string comment '数据项值value',
  
  `add_time` timestamp comment '数据新增时间'
) 
partitioned by (dt string comment '分区字段')
comment '从非关系型数据库同步过来的数据'
stored as avro
;