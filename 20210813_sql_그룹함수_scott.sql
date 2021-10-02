 --�׷� �Լ�
-- �׷��Լ��� ����� 1���� ������ ��������.
 --�����Լ��� ����� �������� ������ ��������.
 
 show user;
 --SUM(), COUNT(),AVG(), MAX(), MIN() �׷��Լ� : ������� 1���� ������ ����
SELECT SUM(SAL) FROM EMP;
SELECT COUNT (SAL) FROM EMP; -- COUNT() �׷��Լ� : ������� 1���� ������
SELECT AVG(SAL) FROM EMP;
SELECT ROUND(AVG(SAL)) FROM EMP;
SELECT MAX(SAL) FROM EMP;
SELECT MIN(SAL) FROM EMP;

--ROUND(), TO_CHAR() �����Լ� : ������� �������� ������
SELECT ROUND(SAL) FROM EMP; -- ROUND() �����Լ� : ������� �������� ������
SELECT ROUND (2222.1234) FROM DUAL; -- ROUND() : �ݿø�����.
SELECT ROUND (2222.6235, 3) FROM DUAL; -- ROUND() : �Ҽ��� N��°���� �ݿø�����.
SELECT TO_CHAR(HIREDATE, 'YYYY-MM-DD') HIREDATE FROM EMP; 


-- EMP ���̺��� �Ի����� ���� ���� ����� �����, �Ի����� ��ȸ
-- ADAMS	87/05/23
SELECT ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC; -- ����üŷ

SELECT MAX(HIREDATE) FROM EMP; --�Ի����� ���� ���� : MAX()�Լ�
SELECT MIN(HIREDATE)FROM EMP; --�Ի����� ���� ���� : MIN()�Լ�

SELECT A.ENAME, A.HIREDATE FROM EMP A 
WHERE A.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); 

--EMP ���̺��� ����� ���� ���� ����� �����ȣ, ����� �Ի����� ��ȸ�Ͻÿ�.

SELECT MAX(EMPNO), MIN(EMPNO) FROM EMP;
SELECT ENAME, EMPNO FROM EMP ORDER BY EMPNO; -- ����üŷ SMITH	7369
SELECT EMPNO, ENAME, HIREDATE FROM EMP
WHERE EMPNO = (SELECT MIN(EMPNO) FROM EMP);

--EMP ���̺��� �޿��� ���ϸ��� ����� �����ȣ, ����� �Ի����� ��ȸ�Ͻÿ�.
SELECT MAX(SAL), MIN(SAL) FROM EMP;
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC; -- ����üŷ KING 5000
SELECT EMPNO, ENAME, HIREDATE FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);
    
    
--EMP ���̺��� �󿩰� ���� ���� �����ȣ, ����� �Ի����� ��ȸ�Ͻÿ�.
SELECT MAX(COMM), MIN(COMM) FROM EMP;
SELECT ENAME, COMM FROM EMP ORDER BY COMM DESC; -- ����üŷ MARTIN 1400
SELECT EMPNO, ENAME, HIREDATE FROM EMP
WHERE COMM = (SELECT MAX(COMM) FROM EMP);

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE COMM = (SELECT MAX(COMM) FROM EMP);

--GROUP BY 
SELECT DEPTNO FROM EMP;
SELECT COUNT(DEPTNO) FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;

SELECT DEPTNO FROM EMP GROUP BY DEPTNO; -- ��ȸ��
SELECT * FROM EMP GROUP BY DEPTNO; -- GROUP BY ǥ������ �ƴ� , �ƽ�Ÿ����ũ�� GROUP BY 7�� ��� X
SELECT A.* FROM EMP A GROUP BY A.DEPTNO; -- GROUP BYǥ������ �ƴ�
SELECT A.DEPTNO, A.ENAME FROM EMP A GROUP BY A.DEPTNO, A.ENAME; 
SELECT A.DEPTNO, A.JOB FROM EMP A GROUP BY A.DEPTNO, A.JOB;
SELECT DEPTNO, JOB FROM EMP; -- 14��

SELECT A.DEPTNO FROM EMP A GROUP BY A.DEPTNO HAVING A.DEPTNO = 30;
--30�μ��� �޿� �Ѿ�

SELECT A.DEPTNO, SUM(A.SAL) FROM EMP A GROUP BY A.DEPTNO HAVING A. DEPTNO =30; -- GROUP BY ����ؼ� ���, WHERE ���� ���� �ȵ� > GROUP BY��
SELECT SUM(A.SAL) FROM EMP A WHERE A.DEPTNO = 30; --30 �Լ��� ���� �ϳ��� ����ϱ� ������ ���Ŀ� ����
SELECT A.EMPNO, SUM(A.SAL) FROM EMP A WHERE A.EMPNO =7369;--A.DEPTNO�� �����Լ��� ���� ������ ���X
SELECT A.EMPNO, SUM(A.SAL) FROM EMP A GROUP BY A.EMPNO;
--A.EMPNO�� �����Լ�
--SUM(A.SAL)�� �׷��Լ� 
--��µǴ� ROW�� ������ �ٸ�..  
--ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
--00937. 00000 -  "not a single-group group function"
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO HAVING DEPTNO = 30;
SELECT  A.DEPTNO
        ,COUNT(A.SAL)
        ,SUM(A.SAL)
        ,ROUND(AVG(A.SAL),2)
        ,MAX(A.SAL)
        ,MIN(A.SAL)
FROM    EMP A
GROUP BY A.DEPTNO
HAVING A.DEPTNO = 30;

SELECT  A.DEPTNO
       ,COUNT(A.SAL)
       ,SUM(A.SAL)
       ,ROUND(AVG(A.SAL),2)
       ,MAX(A.SAL)
       ,MIN(A.SAL)
FROM    EMP A
GROUP BY A.DEPTNO
ORDER BY 1;

--ROLLUP �Լ�
--GROUP BY ���� �Բ� ���
--SELECT �� �����Ϳ� �� �������� �Ѱ踦 ����.

SELECT JOB, SAL FROM EMP;
SELECT JOB FROM EMP GROUP BY JOB;
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;
SELECT JOB, SUM(SAL) FROM EMP GROUP BY ROLLUP(JOB);

SELECT DEPTNO, SAL FROM EMP;
SELECT DEPTNO FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);

SELECT * FROM (SELECT JOB, SUM(SAL) AS SALSUM FROM EMP GROUP BY JOB);

--�μ��� �ο� ���� �޿� �հ�

SELECT JOB, SAL FROM EMP;
SELECT JOB FROM EMP GROUP BY JOB;
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;
SELECT JOB, SUM(SAL) FROM EMP GROUP BY ROLLUP(JOB);

SELECT DEPTNO, SAL FROM EMP;
SELECT DEPTNO FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);



SELECT B.DNAME, A.JOB, SUM(A.SAL) SAL, COUNT(A.EMPNO) EMPCNT
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
GROUP BY ROLLUP(B.DNAME, A.JOB)
ORDER BY 1;

-- RANK() OVER()
-- ����Ŭ���� ������ �ο��ϴ� �Լ�
-- ��°��� ������ ���� ������ �ο���.

--�޿� ������ ���غ�����
SELECT   EMPNO, ENAME, SAL FROM EMP ORDER BY 3 DESC;

--RK�� ��°��� �޿��� ������ ���� ������ �ο��ȴ�.
SELECT  EMPNO, ENAME, SAL,
        RANK() OVER(ORDER BY SAL DESC) AS RK
FROM EMP;

--�ߺ� RANK �� ���� �����ϰ� �ѹ���
SELECT  EMPNO, ENAME, SAL,
        DENSE_RANK() OVER(ORDER BY SAL DESC) AS RK
FROM EMP;

--�׷캰�� ���� �ο�
SELECT  DEPTNO, EMPNO, ENAME, SAL,
        RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RK
FROM EMP;

-- ROW NUMBER(0 OVER()
SELECT  ROWNUM, EMPNO, ENAME, SAL,
        ROW_NUMBER() OVER(ORDER BY SAL DESC) 
FROM EMP;

--RANK : �ߺ� ���� ���� ���� �ǳʶ�.(1,2,2,4)
--DENSE_RANK : �ߺ����� ���� ���� ����.(1,2,2,3)
--ROW_NUMBER : �ߺ����� ���� ���ϰ�.(1,2,3,4)
SELECT DEPTNO, EMPNO, ENAME, SAL 
      ,RANK() OVER(ORDER BY SAL DESC) AS RK 
      ,DENSE_RANK() OVER(ORDER BY SAL DESC) AS DR 
      ,ROW_NUMBER() OVER(ORDER BY SAL DESC) AS RN
FROM EMP; 

--���� �Լ� - NTILE(�з�)
-- ��������� N�� �׷����� �з��ϴ� ��� 
SELECT EMPNO
      ,NTILE(2) OVER(ORDER BY EMPNO) AS GRP_2 
      ,NTILE(3) OVER(ORDER BY EMPNO) AS GRP_3 
      ,NTILE(5) OVER(ORDER BY EMPNO) AS GRP_5 
FROM EMP; 

--CUBE() �Լ�
SELECT B.DNAME, A.JOB, SUM(A.SAL) SAL, COUNT(A.EMPNO) EMPCNT
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
GROUP BY CUBE(B.DNAME, A.JOB)
ORDER BY 1;

--����Ŭ ������Ʈ
--VIEW
--�������� ���̺� ������ �����ϱ� ���ؼ� ����Ѵ�.
--��� ���̺� ���� ������ ������ 
--���̺��� ������ �κи� ���� �� �ִ� ���� ���̺��̴�.

--CREATE AS ����
--CREATE [OR REPLACE][FORCE | NOFORCE] VIEW viewname
--[(alias, alias ..... )]
--AS subquery

CREATE TABLE EMP02
AS 
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP;

SHOW USER;
--CONN SYSTEM/1234
--GRANT CREATE VIEW TO SCOTT;


-- ��� �����ϴ� ���� �ƴ�!! ��ȸ�� �Ѵ�!! (�ܼ� VIEW�� ����VIEW�� ONLY ��ȸ��)

-- �ܼ� ��(Simple View) :  �⺻ ���̺��� 1�� �� ��
-- ISUD�� ���� >> ������ ���� �ʴ´�. ���� ��ȸ��!!
CREATE VIEW VIEW_EMP02
AS
SELECT * FROM EMP02
WHERE DEPTNO =10;

SELECT * FROM VIEW_EMP02;

INSERT INTO VIEW_EMP02
VALUES (8000, 'ANGEL', 7000, 10);
COMMIT;

-- ���� ��(Complex View): �⺻���̺��� 2�� �̻� �� ��
-- ISUD  �Ұ���
CREATE VIEW VIEW_EMP_DEPT
AS
SELECT  A.EMPNO, A.ENAME, A.SAL, B.DEPTNO, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.DEPTNO = 10;

SELECT * FROM VIEW_EMP_DEPT;
INSERT INTO VIEW_EMP_DEPT VALUES(1234, AAA, 1111,10, AAA);
-- ���� VIEW���� ISUD �Ұ���

INSERT INTO VIEW_EMP_DEPT  --���պ�� �����ȵ�
VALUES (8001, 'AAAA', 4000, 10, 'ACCUNT');

--�� ������ �÷����� ������ �� �ֵ�.
CREATE OR REPLACE VIEW VIEW_EMP02_COL(�����ȣ, �����, �޿�, �μ���ȣ) --�ٲ� �÷���
AS
SELECT EMPNO, ENAME, SAL, DEPTNO --���� �÷���
FROM EMP02;

SELECT * FROM VIEW_EMP02_COL;

SELECT * FROM VIEW_EMP02_COL WHERE �μ���ȣ = 10;--�ٲ� �÷������� ��ȸ��.
SELECT * FROM VIEW_EMP02_COL WHERE DEPTNO = 10; --�÷��� ����� ���� �÷������δ� ��ȸ�� �ȵ�.

-- �並 ���� ���� ��
CREATE OR REPLACE VIEW VIEW_EMP02_COL_1 --�� ���̺��� ���� ���� �� �÷��� ������� ����Ͽ� ����
AS
SELECT EMPNO AS E_1, ENAME AS E_2, SAL AS E_3, DEPTNO AS E_4
FROM EMP02;
SELECT * FROM EMP02;

INSERT INTO VIEW_EMP02_COL_1(E_1, E_2, E_3, E_4)
VALUES (8000, 'SWJ', 9000, 10);
    
-- �並 �����ϴ� ��
CREATE OR REPLACE VIEW VIEW_EMP02_COL --������ �ִ� �� �������� �÷����� ��ü��.
AS
SELECT EMPNO T_1, ENAME T_2, SAL T_3, DEPTNO T_4
FROM EMP02;
SELECT * FROM VIEW_EMP02_COL;

--NOFORCE : DEFAULT : �⺻���̺��� ������ �並 �������� ����
CREATE OR REPLACE VIEW VIEW_EMP02_1
AS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP02_NOTABLE
WHERE ROWNUM <=3;

--FORCE : �⺻���̺��� ��� USER_VIEWS ������ ������ �並 �����Ѵ�.
CREATE OR REPLACE FORCE VIEW VIEW_EMP02_2
AS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP02_NOTABLE
WHERE ROWNUM <=3;
--00942. 00000 -  "table or view does not exist"
--*Cause:    
--*Action:
--���: ������ ������ �Բ� �䰡 �����Ǿ����ϴ�.


--WITH CHECK OPTION
--��κ��� ��� ����¸��� ������ ��.
CREATE OR REPLACE VIEW VIEW_EMP03
AS
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP
WHERE JOB LIKE 'MANAGER' WITH CHECK OPTION;

INSERT INTO VIEW_EMP03
VALUES (9000, 'ABC', 30, 'SALESMAN');
--ORA-01402: ���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�

INSERT INTO VIEW_EMP03
VALUES (9000, 'ABC', 30, 'MANAGER');
SELECT * FROM VIEW_EMP03;
ROLLBACK;

--WITH READ ONLY ; �б⸸ ����
--��κ��� ��� ����¸��� ������ ��.
CREATE OR REPLACE VIEW VIEW_EMP04
AS
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM    EMP
WHERE JOB LIKE 'MANAGER' WITH READ ONLY;

INSERT INTO VIEW_EMP04
VALUES(9000, 'ABC', 30, 'MANAGER');
--���� ���� -
--SQL ����: ORA-42399: �б� ���� �信���� DML �۾��� ������ �� �����ϴ�.
--42399.0000 - "cannot perform a DML operation on a read-only view"


--SEQUENCE
--SEQUENCE �Լ��� ��� �ٷ�� ��Ʊ� ������ MAX ä�� ������ ����Ѵ�.
--SEQUENCE ����Ŭ �������� �ڵ� �����ϴ� ���
--MYSQL, �����Ƶ�� : AUTO_INCREMENT : �ڵ� ����
CREATE SEQUENCE EMP05_SEQ
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 1000000;
       
CREATE SEQUENCE EMP05_SEQ_1
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 1000000;

CREATE SEQUENCE EMP05_SEQ_2
       START WITH 1
       INCREMENT BY 3
       MAXVALUE 1000000;       

SELECT * FROM USER_SEQUENCES;

CREATE TABLE EMP05
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE 1=0;  -- �÷��� ��������� �����ʹ� x

SELECT * FROM EMP05;

INSERT INTO EMP05 VALUES (EMP05_SEQ.NEXTVAL, 'AAA', SYSDATE);
INSERT INTO EMP05 VALUES (EMP05_SEQ_2.NEXTVAL, 'AAA01', SYSDATE);
INSERT INTO EMP05 VALUES (EMP05_SEQ.NEXTVAL, 'AAA02', SYSDATE);

SELECT EMP05_SEQ_2.NEXTVAL FROM DUAL;
SELECT EMP05_SEQ_2.CURRVAL FROM DUAL;

SELECT EMP05_SEQ.NEXTVAL FROM DUAL;
SELECT EMP05_SEQ.CURRVAL FROM DUAL;
--�ƽ�(MAX())�� ä�� ����
SELECT MAX(NVL(NULL, 0)) + 1 FROM DUAL;

--INDEX : ���� : ������� : ���� A, B, C, ... , �ѱ� ���� : ���� ��, ��, ��, ...
--����Ŭ ���̹����̽����� INDEX ���� ���(��ȸ �ӵ� ���)���� �糯�� ��
SELECT  TABLE_NAME, INDEX_NAME, COLUMN_NAME
FROM    USER_IND_COLUMNS
WHERE   TABLE_NAME IN ('EMP', 'DEPT', 'INDEX_TEST_1', 'T2');

--���̺� ������ �����̸Ӹ� Ű�� �����ϸ�
--����Ŭ �������� �ڵ����� �ε����� �����Ѵ�
--�����ϴ� �̸��� SYS_ ���ξ� + C + 0000000 ��Ģ���� �����Ѵ�
--SYS_C0011421 : SYS_ ���ξ� + C + 0000000

CREATE TABLE INDEX_TEST_1(
    INDEX_1 NUMBER PRIMARY KEY
);

-- PK ���� �� �ڵ����� �ý��ۿ��� �ý����� �ε����� �����Ϥ� ������ 
-- ����� ���Ƿ� �ε����� ������ �� ����.

CREATE INDEX INEX_TEST_1_111 ON INDEX_TEST_1(INDEX_1);

--�ε��� �����ϱ�
CREATE TABLE T2(
    T2_1 NUMBER,
    T2_2 VARCHAR2(10)
);

--���� �ε���
CREATE INDEX INDEX_T2_T2_1 ON T2(T2_1);
--���� �ε���
CREATE INDEX INDEX_T2_T2_1_T2_2 ON T2(T2_1, T2_2);

--MAX�� �� ä������ �ϼ��ϱ�
CREATE TABLE T3(
    T3_NUM VARCHAR2(20) PRIMARY KEY
    ,DELETEYN VARCHAR2(1)
    ,INSERTDATE DATE
    ,UPDATEDATE DATE
);

--SYS_C0011422
SELECT  TABLE_NAME, INDEX_NAME, COLUMN_NAME
FROM    USER_IND_COLUMNS
WHERE   TABLE_NAME IN('T3');

select * from USER_IND_COLUMNS;
SELECT /*+ INDEX_DESC(SYS_C0011422) */
        NVL(MAX(SUBSTR(A.T3_NUM, -4)), 0) +1 COMMNO
FROM    T3 A;


--����Ŭ Constraint