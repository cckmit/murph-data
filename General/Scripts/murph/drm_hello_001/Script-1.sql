-- CONNECTION: url=jdbc:h2:E:\Github\java-kits\murph-drm-core\target\test-classes\workspace\hello_001\drm.db;AUTO_SERVER=TRUE;AUTO_RECONNECT=TRUE;USER=root;PASSWORD=drm_user;CASE_INSENSITIVE_IDENTIFIERS=TRUE;DATABASE_TO_LOWER=TRUE;IGNORE_UNKNOWN_SETTINGS=TRUE
-- New script in drm_hello_001.

CREATE LINKED TABLE drm_link_table ('org.postgresql.Driver', 'jdbc:postgresql:test', 'sa', 'sa', 'TEST');


CREATE LINKED TABLE drm_link_table ('com.mysql.cj.jdbc.Driver', 'jdbc:mysql://10.0.34.28:3306/saas_report', 'ua_tctbi', 'oT6Ut2ybqGqMTuLd', 'ported_nosql_data');


select * from drm_link_table;