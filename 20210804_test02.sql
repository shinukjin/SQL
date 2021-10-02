SHOW USER


CREATE TABLE T2_TABLE(
     T2_COLUMN1 VARCHAR2(20)
    ,T2_COLUMN2 VARCHAR2(200)
);
-- DROP TABLE T2_TABLE; ���̺� ����
SELECT * FROM T2_TABLE;

--���̺� �μ�Ʈ�ϱ�
--INSERT INTO : �μ�Ʈ Ű����
--T2_TABLE : ���̺��
--(T2_COLUMN1, T2_COULMN2) : �÷����� , ���� ������ ����ϱ�
--VALUES : Ű����
--() : �÷��� ������ ���߾ ������� ���� , ���� ����ϱ�
INSERT INTO T2_TABLE (T2_COLUMN1, T2_COLUMN2) VALUES ('111','111');

SELECT * FROM T2_TABLE;

--����Ŭ���� ISUD, CRUD �� �� �����ؾ� �Ұ�!!!!!
--SELECT
-- DDL : Ʈ������� ó���ؾ��ϴ� ��ɾ�
-- ����Ŭ���� Ʈ������� �ش��ϴ� ROW�� COMMIT, ROLLBACK �ϴ� ���̴�.
-- ����Ŭ���� DDL �� INSERT, UPDATE, DELETE ������ Ʈ����Ǹ� �����ڰ� �����ؾ��Ѵ�. 
-- COMMIT, ROLLACK �� �����ؾ��Ѵ�.

-- INSERT, UPDATE, DELETE
-- �μ�Ʈ ������Ʈ ����Ʈ ��ɾ�� Ʈ������� �߻� ��Ű��
-- 1. �μ�Ʈ, ������Ʈ, ����Ʈ�� ������ ����Ŭ �޸𸮿� �ۼ��ȴ�.
-- 2. �� ���¿��� SELECT �ϸ� ��ȸ�� �ȴ�.
--    sqlplus������ ��ȸ�� �Ǵµ�, �ܺ� �������α׷������� ��ȸ�� �Ұ��� �ϴ�.
-- 2-1. �μ�Ʈ, ������Ʈ, ����Ʈ �� ���� ����Ŭ �޸𸮿��� �����Ϸ��� ROLLBACK ��ɾ �����ϸ� �ȴ�.
-- 2-2. �μ�Ʈ, ������Ʈ, ����Ʈ �� ��ȸ�� �����ѵ�
--     COMMIT ��ɾ �������� �ʰ� ROLLBACK ��ɾ �����ϸ� ��ȸ�� �ȵȴ�.
-- 3. COMMIT ��ɾ ������Ѿ� ����Ŭ ���Ͽ� �ۼ��ȴ�.
-- 3-1. COMMIT ����� ���� �� ���Ŀ��� ROLLBACK�� ���� �ʴ´�.
-- 4. �� ���¿��� sqlplus �� �ܺ� �������α׷����� ��ȸ�� �����ϴ�.
-- 4-1. �ܺ� �������α׷����� ����Ŭ���̺� �ִ� �����͸� ��ȸ�Ϸ��� 
--     ���Ͽ� ����� �����͸� ��ȸ�� �����ϴ�.
--     ������ �޸𸮿� �ִ� ������ ������ �����ϱ� ������

INSERT INTO T2_TABLE (T2_COLUMN1, T2_COLUMN2) VALUES ('111','111');
SELECT * FROM T2_TABLE;
ROLLBACK; --COMMIT �� �������� �ѹ���� �ʴ´�.
COMMIT;

CREATE TABLE T3 (
        T3_1 NUMBER(4) PRIMARY KEY
        , T3_2 VARCHAR2(20)
        , T3_3 VARCHAR2(20)
        , T3_4 NUMBER(7,4) --�Ҽ��� ���� 7�ڸ� 1111�� 1111.0000���� ���� FAIL
        , T3_5 VARCHAR2(1)
        , T3_6 DATE
);
SELECT * FROM TAB;
SELECT * FROM T3;
SELECT SYSDATE FROM DUAL;
INSERT INTO T3(T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (12,'AA','AA11',111.1111,'Y',SYSDATE);

--INSERT INTO T3(T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11,'AA','AA11',111.1111,'Y1',SYSDATE);
--INSERT INTO T3(T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11,'AA','AA11',111.1111,'Y1',SYSDATE);
--
--���� ���� -
--ORA-12899: "TEST02"."T3"."T3_5" ���� ���� ���� �ʹ� ŭ(����: 2, �ִ밪: 1)
--
--PRIMARY KEY = NOT NULL + UNIQUE
--INSERT INTO T3(T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11,'AA','AA11',111.1111,'Y',SYSDATE);
--INSERT INTO T3(T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11,'AA','AA11',111.1111,'Y',SYSDATE);
--
--���� ���� -
--ORA-00001: ���Ἲ ���� ����(TEST02.SYS_C0011116)�� ����˴ϴ�
INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (12, 'AA', 'AA12', 12.1234, 'Y', SYSDATE);
INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (13, 'AA', 'AA13', 13.1234, 'Y', SYSDATE);
INSERT INTO T3 VALUES (18, 'AA', 'AA13', 14.1234, 'Y', SYSDATE);
ROLLBACK;
COMMIT;



