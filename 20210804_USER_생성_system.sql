--����Ŭ�� �����Ϳ� ������ ���� ���� SYSTEM �Ǵ� SYS �������� �Ѵ�. 
SHOW USER;

-- ���������ϱ� 
-- �����̸� : test01
-- ������й�ȣ : 1234
--CREATE USER : ������ �����ϴ� Ű���� 
--IDENTIFIED BY : ��й�ȣ�� �����ϴ� Ű���� 
--CREATE USER ������ IDENTIFIED BY ��й�ȣ 
CREATE USER test01 IDENTIFIED BY 1234;

--C:\Users\KOSMO>sqlplus test01/1234
--ERROR:
--ORA-01045: user TEST01 lacks CREATE SESSION privilege; logon denied
--
--ORA-01045 : ����Ŭ �����ڵ� 
--����Ŭ �����ڵ带 ���ͳݿ��� �˻��ؼ� ������ ������Ѵ�. 

--��ó�� ������ �����ϸ� 
--�޶� ������ �����Ǳ� ������ 
--������� 
--���̺� ���� ������ �ο��ؾ� �Ѵ�. �ش��ϴ� ������ 

--������� �ֱ� 
--GRANT CREATE SESSION TO : �������� ���� ������ �ִ� ����
GRANT CREATE SESSION TO test01;

--C:\Users\KOSMO>sqlplus test01/1234
--������ ���ӵ�:
--Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
--With the Partitioning, OLAP, Data Mining and Real Application Testing options
--
--SQL>

--���̺� ���� ������ �ο��ؾ� �Ѵ�. �ش��ϴ� ������ 
GRANT CREATE TABLE TO test01;

--Grant��(��) �����߽��ϴ�.

--���̺� �����̽� ���� 
ALTER USER test01 QUOTA UNLIMITED ON USERS;

--���� �����ؼ� ���̺� ����� 
--1. system/1234 �α���
--2. ��������� 
--CREATE USER test01 IDENTIFIED BY 1234;
--��й�ȣ �ٲٱ� 
--ALTER USER test01 IDENTIFIED BY 1234;
--3. ���� ���� �ο�
--GRANT CREATE SESSION TO test01;
--4. ���̺� ���� ���� �ο�
--GRANT CREATE TABLE TO test01;
--5. ���̺� �����̽� ������ ���� : 2M, 5M, 10M, UNLIMITED �� 
--ALTER USER test01 QUOTA UNLIMITED ON USERS;
--6. ������ �������� �α��� �ؼ� ���̺� �����ϱ� 
--CREATE TABLE T1_TABLE (
--    TESTCOLUMN1 VARCHAR2(20) 
--   ,TESTCOLUMN2 VARCHAR2(200)
--);

test02/1234 ��������� 
T2_TABLE ���̺� ����� 
T2_COLUMN1 VARCHAR2(20)
T2_COLUMN2 VARCHAR2(200)  


