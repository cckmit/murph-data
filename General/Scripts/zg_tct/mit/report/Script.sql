-- CONNECTION: url=jdbc:mysql://10.0.34.28:3306/saas_report
-- New script in report.

--  Drop table

--  DROP TABLE saas_report.fetched_redis_data;

CREATE TABLE saas_report.fetched_redis_data (
	pkid BIGINT UNSIGNED auto_increment NOT NULL,
	redis_item varchar(100) NOT NULL COMMENT 'redis项',
	item_key varchar(500) NOT NULL COMMENT 'redis值key：hash的key、set的索引、string',
	item_value varchar(100) NOT NULL COMMENT 'redis值value',
	add_time datetime COMMENT '数据新增时间',
	PRIMARY KEY (`pkid`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_bin
COMMENT='redis 同步过来的数据';
