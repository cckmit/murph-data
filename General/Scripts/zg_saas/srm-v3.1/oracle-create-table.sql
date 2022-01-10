-- uat/erp - orcl


-- select * from ZG_ERP.TSUPPLIER_SIGN_INFO;

-- ������
CREATE TABLE ZG_ERP.TSUPPLIER_SIGN_INFO (
	PKID NUMBER,
	SUPPLIER_ID NUMBER(10,0),
	SUPPLIER_NAME VARCHAR2(100),
	SIGN_TIME DATE,
	FIRST_START_USING_TIME DATE,
	FIRST_STOP_ALL_TIME DATE,
	CREATE_TIME DATE,
	CREATE_BY VARCHAR2(100),
	LAST_MODIFIED_TIME DATE,
	LAST_MODIFIED_BY VARCHAR2(100),
	VALID CHAR(1)
);
COMMENT ON TABLE ZG_ERP.TSUPPLIER_SIGN_INFO IS '��Ӧ����ǩʱ�䡢�״�����ʱ�䡢�״�ȫ��ͣʱ�����Ϣ';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.PKID IS '����id';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.SUPPLIER_ID IS '��Ӧ��id';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.SUPPLIER_NAME IS '��Ӧ������';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.SIGN_TIME IS '��ǩʱ��';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.FIRST_START_USING_TIME IS '�״ζ�������ʱ��';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.FIRST_STOP_ALL_TIME IS '�״ζ���ȫ��ͣʱ��';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.CREATE_TIME IS '����ʱ��';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.CREATE_BY IS '������';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.LAST_MODIFIED_TIME IS '����޸�ʱ��';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.LAST_MODIFIED_BY IS '����޸�ʱ��';
COMMENT ON COLUMN ZG_ERP.TSUPPLIER_SIGN_INFO.VALID IS '�Ƿ���Ч';

-- ��������
CREATE SEQUENCE SQ_TSUPPLIER_SIGN_INFO
INCREMENT BY 1 
MINVALUE 10000000
MAXVALUE 900000000
cache 20;