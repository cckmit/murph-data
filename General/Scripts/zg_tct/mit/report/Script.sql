-- CONNECTION: url=jdbc:mysql://10.0.34.28:3306/saas_report
-- New script in report.

--  Drop table

--  DROP TABLE saas_report.fetched_redis_data;

CREATE TABLE saas_report.fetched_redis_data (
	pkid BIGINT UNSIGNED auto_increment NOT NULL,
	redis_item varchar(100) NOT NULL COMMENT 'redis��',
	item_key varchar(500) NOT NULL COMMENT 'redisֵkey��hash��key��set��������string',
	item_value varchar(100) NOT NULL COMMENT 'redisֵvalue',
	add_time datetime COMMENT '��������ʱ��',
	PRIMARY KEY (`pkid`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_bin
COMMENT='redis ͬ������������';
