SHOW USER;

SELECT * FROM TAB;
SELECT COUNT(*) FROM TAB;

--���̺� �����ϱ� 
--CREATE TABLE : Ű���� 
--T1_TABLE : ���̺� �̸� 
--() : �Ұ�ȣ�� �÷� ������Ÿ�� ����� , �����ڷ� �����Ѵ�.
CREATE TABLE T1_TABLE (
    TESTCOLUMN1 VARCHAR2(20) 
   ,TESTCOLUMN2 VARCHAR2(200)
);

--���� ���� -
--ORA-01031: ������ ������մϴ�
--01031. 00000 -  "insufficient privileges"
--�ý��� �������� ���̺� ���� ���� �־�� �Ѵ�. 

--���̺� ���� ���� �ο��� �� ���̺� ���� 
CREATE TABLE T1_TABLE (
    TESTCOLUMN1 VARCHAR2(20) 
   ,TESTCOLUMN2 VARCHAR2(200)
);

--ORA-01031: ������ ������մϴ�
--01031. 00000 -  "insufficient privileges"
--*Cause:    An attempt was made to perform a database operation without
--           the necessary privileges.
--*Action:   Ask your database administrator or designated security
--           administrator to grant you the necessary privileges

--���̺� �����̽��� ��� ���� ���� 
DROP TABLE T1_TABLE;

CREATE TABLE T1_TABLE (
    TESTCOLUMN1 VARCHAR2(20) 
   ,TESTCOLUMN2 VARCHAR2(200)
);

SELECT * FROM T1_TABLE;




