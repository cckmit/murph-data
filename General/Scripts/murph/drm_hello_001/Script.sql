-- CONNECTION: url=jdbc:h2:E:\Github\java-kits\murph-drm-core\target\test-classes\workspace\hello_001\drm.db;MODE=MYSQL;AUTO_SERVER=TRUE;AUTO_RECONNECT=TRUE;USER=sa;PASSWORD=123;CASE_INSENSITIVE_IDENTIFIERS=TRUE;DATABASE_TO_LOWER=TRUE;IGNORE_UNKNOWN_SETTINGS=TRUE
-- New script in drm_hello_001.

        insert into drm_runtime_log (
            runtime_id, event, message
        ) values (
            '73114174-c0d6-4aa1-af90-e1f87d5c8e9d', 'system-init', '系统初始化'
        )