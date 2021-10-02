-- �ش� ������ �����ִ� ���̺��� ��ȸ
-- ����Ʈ ������ BOUNS, DEPT, EMP, SALGRADE ���̺��� �ִ�. 
SELECT * FROM TAB;
--TNAME       TABTYPE   CLUSTERID
--BONUS	     TABLE	
--DEPT	    TABLE	
--EMP	        TABLE	
--SALGRADE	TABLE	

-- �ش� ������ �����ִ� ROW ���� COUNT():ī����Լ��� ��ȸ
-- scott ������ ���̺��� 4�� �ִ�. 
SELECT * FROM TAB; -- low ���� ī����

--DESC : DESCRIBE : ���̺��� ���� Ȯ�� 
-- ���̺��� �÷���, NULL ����,  ������ Ÿ�� �� �� �ִ�. 
DESC EMP;
/*
�̸�        ��?       ����           
--------- -------- ------------ 
TNAME     NOT NULL VARCHAR2(30) 
TABTYPE            VARCHAR2(7)  
CLUSTERID          NUMBER  
*/

DESC EMP;
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/

DESC DEPT;
/*
�̸�     ��?       ����           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/

SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.EMP;

-- ���� ���� 
--1. ��� ���̺��� ��� ��ü�� ��ȸ�Ͻÿ� 
-- �ܹ� ������ 
SELECT * FROM SCOTT.EMP;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM SCOTT.EMP;

-- A�� SCOTT.EMP ���̺� �ٸ�� : �ڹٿ��� ���������ϰ� ����Ѵ�. 
SELECT A.EMPNO, A.ENAME, A.JOB, A.MGR, A.HIREDATE, A.SAL, A.COMM, A.DEPTNO FROM SCOTT.EMP A;

-- AS Ű���带 �̿��ؼ� �÷� �ٸ�� ����ϱ�, AS ���� ���� 
SELECT   A.EMPNO      AS EMPNO 
        ,A.ENAME      AS ENAME
        ,A.JOB        AS JOB
        ,A.MGR        AS MGR
        ,A.HIREDATE   AS HIREDATE
        ,A.SAL        AS SAL
        ,A.COMM       AS COMM
        ,A.DEPTNO     AS DEPTNO
FROM     SCOTT.EMP A;

SELECT   A.EMPNO      EMPNO 
        ,A.ENAME      ENAME
        ,A.JOB        JOB
        ,A.MGR        MGR
        ,A.HIREDATE   HIREDATE
        ,A.SAL        SAL
        ,A.COMM       COMM
        ,A.DEPTNO     DEPTNO
FROM     SCOTT.EMP A;

-- �÷� �� ���̺� �����ϱ�(���� �÷��� �ǹ��ϴ��� �ּ��ޱ�)
SELECT   A.EMPNO      AS EMPNO      -- �����ȣ
        ,A.ENAME      AS ENAME      -- ����̸�
        ,A.JOB        AS JOB        -- ������
        ,A.MGR        AS MGR        -- �ش����� ��� �����ȣ
        ,A.HIREDATE   AS HIREDATE   -- �Ի���
        ,A.SAL        AS SAL        -- �޿�
        ,A.COMM       AS COMM       -- Ŀ�̼� : �󿩱�
        ,A.DEPTNO     AS DEPTNO     -- �μ���ȣ
FROM     EMP A;               -- ��� ���̺� 


--2. �μ� ���̺��� �μ� ��ü�� ��ȸ �Ͻÿ� 
-- ���̺� �ٸ��, �÷� �ٸ�� ����ϱ� AS ���� 
SELECT 
       A.DEPTNO  DEPTNO
      ,A.DNAME   DNAME
      ,A.LOC     LOC
FROM   DEPT A;

--3. �޿���� ���̺��� ������ ��ü�� ��ȸ �Ͻÿ�
-- ���̺� �ٸ��, �÷� �ٸ�� ����ϱ� AS ���� 
SELECT 
        A.GRADE  GRADE
       ,A.HISAL  HISAL
       ,A.LOSAL  LOSAL
FROM   SCOTT.SALGRADE A;

--4. ������̺��� �����ȣ, ����̸�, �Ի���, �޿��� ��ȸ �Ͻÿ� 
SELECT 
        A.EMPNO    EMPNO
       ,A.ENAME    ENAME
       ,A.HIREDATE HIREDATE
       ,A.SAL      SAL
FROM   SCOTT.EMP A;

/*
SELECT [DISTINCT] {* | column[alias].....}
FROM   table
[WHERE condition]
[GROUP BY group_by_expression]
[HAVING group_condition]
[ORDER BY column]

[] : ����� : �־ �ǰ� ��� ���� 
{} : �극�̽� : �迭 ǥ��, ������ ǥ�� �� 
* : Ǯ ��ĵ : full scan : ���̺� ���÷��� ��ü�ο� ��ȸ 
| : or ������ 
column ..... : �÷��� ���������� ����ϱ� 
[alias] : ����ص� �ǰ�, ���ص� �ǰ�

SELECT Ű���� : ��ȸ Ű���� 
DISTINCT Ű���� : �ش� �÷��� �ߺ��Ǵ� ROW�� ������ �ʵȴ�. 
FROM Ű���� : ���̺� �̸��� ���������� ���
WHERE : ��ȸ�ϰ��� �ϴ� ROW�� ������ ���
GROUP BY : ������ ������ �ο츦 �׷����� ���� ���� 
HAVING : GROUP BY�� ���� �� : GROUP BY �ؿ����� ����ϱ� 
ORDER BY : ���� ǥ�� : ��������, �������� ǥ��
*/


--#########################################
-- ���� : SORT 
--#########################################
--SELECT������ ��ȸ�� �����͸�(��ȸ�� �÷�, �˻��� ������)�� ��������, ������������ �����ϴ� ��
--����Ŭ ��ȸ�� ���������� ����Ʈ
SELECT A.EMPNO FROM SCOTT.EMP A;
--�������� : Ascending : ���� ������ ū �� ������ 
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY A.EMPNO ASC;
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY 1 ASC;
--�������� : Descending : ū ������ ���� �� ������ 
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY A.EMPNO DESC;
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY 1 DESC;

-- ����Ŭ �迭������ 1 ���� �ε����� �����Ѵ�. 
--�÷��ε��� 1 : A.ENAME
--�÷����ؽ� 2 : A.EMPNO 
--�÷����ؽ� 3 : A.HIREDATE 
--�÷����ؽ� 4 : A.COMM 
SELECT A.ENAME, A.EMPNO, A.HIREDATE, A.COMM FROM SCOTT.EMP A
ORDER BY 2; -- A.EMPNO �� ASC ���� ��ȸ �Ͻÿ� 

-- NULL �÷� ��ȸ ������ �� 
SELECT A.COMM FROM SCOTT.EMP A ORDER BY 1;
SELECT A.COMM FROM SCOTT.EMP A ORDER BY 1 DESC;

--#########################################
-- DISTINCT : �ߺ� �����ϴ� Ű���� 
--#########################################
SELECT A.DEPTNO FROM SCOTT.EMP A;
SELECT DISTINCT A.DEPTNO FROM SCOTT.EMP A;
SELECT DISTINCT A.DEPTNO FROM SCOTT.EMP A ORDER BY 1;
SELECT DISTINCT A.DEPTNO FROM SCOTT.EMP A ORDER BY 1 DESC;

--#########################################
-- WHERE : ���� : condition 
--#########################################
SELECT A.* FROM SCOTT.EMP A;

--SMITH�� ��������� ���� �ʹ�. 
SELECT A.* FROM SCOTT.EMP A 
WHERE A.ENAME = 'SMITH'; -- VARCHAR2 : ���� �˻� 
--WHERE SCOTT.EMP.ENAME = 'SMITH';

--�����ȣ�� 7369 �� ��������� ���� �ʹ�. 
--����Ŭ���� ���ڴ�  '' �� ��ȯ�Ѵ�. 
SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO = 7369;
SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO = '7369';
--SELECT * FROM SCOTT.EMP A
--WHERE A.EMPNO = "7369";

-- NULL ������ 
-- IS NULL : NULL �÷��� �ִµ� ������ ��ȸ 
SELECT A.COMM FROM SCOTT.EMP A
WHERE A.COMM IS NULL;
--WHERE A.COMM = NULL;
-- IS NOT NULL : NUMM �ø��� ���� ������ ��ȸ 
SELECT A.COMM FROM SCOTT.EMP A
WHERE A.COMM IS NOT NULL;

-- LIKE �����ڿ� %(���ϵ�ī��) �˻�, ��ȸ
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE 'S%'; -- ENAME �÷����� ���� S �� �����ϴ� �÷��� ��ȸ �Ͻÿ� 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '%S%'; -- ENAME �÷����� ���� S �� ���Ե� �÷��� ��ȸ �Ͻÿ� 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '%S'; -- ENAME �÷����� ���� S �� ������ �÷��� ��ȸ �Ͻÿ� 

-- ����Ŭ�� ��ҹ��� �����Ѵ�. 
SELECT A.* FROM SCOTT.EMP A
WHERE ENAME LIKE 's%'; -- ENAME �÷����� ���� s �� �����ϴ� �÷��� ��ȸ �Ͻÿ� 

SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO LIKE '7%'; -- EMPNO �÷����� ���� 7 �� �����ϴ� �÷��� ��ȸ �Ͻÿ� 
-- SELECT A.* FROM SCOTT.EMP A
-- WHERE A.EMPNO LIKE 7%;
SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO LIKE '%9%'; -- EMPNO �÷����� ���� 9�� ���Ե� �÷��� ��ȸ �Ͻÿ� 

-- LIKE �����ڿ� _(���ϵ�ī��) �˻�, ��ȸ
-- _ : ������ھ�(�����)�� ���� �Ѱ��� ǥ���Ѵ�. 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '_A%'; -- �ι�° ���ڰ� A �ΰ��� �˻� �Ͻÿ� 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '__A%'; -- ����° ���ڰ� A �ΰ��� �˻� �Ͻÿ� 

SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME NOT LIKE '%A%'; -- ENAME�� A ���ڰ� ���Ծʵ� �÷� �˻� 


-- DUAL ���̺� (��� ���̺�): ����Ŭ���� �ִ� �׽�Ʈ ���̺� �̴�. �÷� DUMMY(���� �÷�) �Ѱ� �ִ� ���̺� 
SELECT 1 FROM DUAL;
SELECT 1 + 2 FROM DUAL;
SELECT LENGTH(1234) FROM DUAL;
SELECT LENGTH('1234') FROM DUAL;
SELECT SYSDATE FROM DUAL; -- �ڹٿ��� new Data() ���� �� 
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL; -- �ڹٿ��� SimpleDateFormat
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL; -- �ڹٿ��� SimpleDateFormat
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL; -- �ڹٿ��� SimpleDateFormat
SELECT TO_CHAR(SYSDATE, 'YYYY.MM.DD') FROM DUAL; -- �ڹٿ��� SimpleDateFormat
SELECT '20210802' FROM DUAL; -- �츮�� ���ó�¥�� ǥ�� �ߴµ� ����Ŭ ��Ƽ�������� ���ڼ��ڷ� ����. '20210802'
SELECT TO_DATE('20210802') FROM DUAL; -- ���ڼ��� '20210802' --> ��¥ �������� �ٲٴ� �Լ� : TO_DATE() �Լ�
SELECT TO_DATE('20210802', 'YYYY-MM-DD') FROM DUAL; 
SELECT TO_DATE('20210802', 'YYYY.MM.DD') FROM DUAL; 

-- ���ڿ� ��¥������ �ٲ� ������ 
-- ���� ���ڿ� ��¥������ TO_DATE() �Լ��� ��¥ ������ Ÿ������ ��ȯ�ϰ� : TO_DATE('20210802')
-- ��ȯ�� ��¥ �����͸� TO_CHAR() �Լ��� �̿��ؼ� ���ڿ� ��¥�������� ��ȯ �Ѵ�. :  TO_CHAR('21/08/02', 'YYYY.MM.DD')
SELECT TO_CHAR(TO_DATE('20210802'), 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('20210802'), 'YYYY.MM.DD') FROM DUAL;

-- ��¥ ������ ��ȸ 
-- 1981��1��1�� ������ �Ի��� ����� ��� 
SELECT A.* FROM SCOTT.EMP A
WHERE A.HIREDATE <= '1981/01/01';
SELECT A.* FROM SCOTT.EMP A
WHERE A.HIREDATE <= '81/01/01';
SELECT A.* FROM SCOTT.EMP A
WHERE A.HIREDATE <= '1981-01-01';

SELECT A.* FROM SCOTT.EMP A
WHERE TO_CHAR(TO_DATE(A.HIREDATE), 'YYYY-MM-DD') 
      <= TO_CHAR(TO_DATE('81/01/01'), 'YYYY-MM-DD');

SELECT TO_CHAR(TO_DATE(A.HIREDATE), 'YYYY-MM-DD') FROM EMP A;
SELECT TO_CHAR(TO_DATE('81/01/01'), 'YYYY-MM-DD') FROM DUAL;

-- AND 
-- ������ ������ �� ���� 
-- �� ���Ǻ��� ��ȸ �� �� 
-- �� ������ ���ļ� �������� �����. 
SELECT * FROM SCOTT.EMP A WHERE A.DEPTNO = 10; 
SELECT * FROM SCOTT.EMP A WHERE  A.JOB = 'MANAGER'; 

SELECT A.* FROM SCOTT.EMP A
WHERE A.DEPTNO = 10
AND   A.JOB = 'MANAGER';







