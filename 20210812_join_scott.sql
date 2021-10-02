join swj00;
SELECT * FROM TAB;
SHOW USER;
-- ���̺� �ִ� ROW �� ���� ���ϴ� �Լ� ?? 
-- ���̺� �ִ� ���ڵ��� ���� ���ϴ� �Լ� 
-- * : �ƽ�Ÿ����ũ, ��ǳ�� : FULL SCAN 
-- ���̺���  ROW * COLUMN ��ü�� �д� 
-- 14 * 8 = 112
-- 14 * 1 = 14
SELECT COUNT(*) FROM TAB;
SELECT COUNT(TNAME) FROM TAB;

SELECT * FROM EMP;
SELECT * FROM DEPT;
-- COUNT(�÷� : NOT NULL �Ǵ� PK )
SELECT COUNT(EMPNO) FROM EMP;

SELECT COUNT(NULL) FROM DUAL;
SELECT COUNT(COMM) FROM EMP;
SELECT COUNT(COMM) FROM EMP WHERE COMM IS NOT NULL;
SELECT COUNT(COMM) FROM EMP WHERE COMM IS NULL;
SELECT COUNT(NVL(COMM, 0)) FROM EMP WHERE COMM IS NULL;
SELECT COUNT(NVL(COMM, 0)) FROM EMP;
SELECT COUNT(EMPNO) FROM EMP;

--����Ŭ ��Ƽ�������� ���̺� �ִ� �ο���� ��� �� �� ?

-- ROWNUM Ű���� : ������ Ÿ��
-- ������ ����� �� ���� �ο��Ǵ� �Ϸù�ȣ
-- ���� ���� ���� 1���� �����ϸ� ���� ������ �Ҵ� 

-- ROWID Ű���� : ������ Ÿ�� 
-- ���̺� �� ���� ��ġ�� �����ϴ� ������ �� 
-- �����ͺ��̽� ��ü���� �ߺ����� �ʴ� ������ ��
/*
1	AAAR3sAAEAAAACXAAA	7369
2	AAAR3sAAEAAAACXAAB	7499
3	AAAR3sAAEAAAACXAAC	7521
4	AAAR3sAAEAAAACXAAD	7566
5	AAAR3sAAEAAAACXAAE	7654
6	AAAR3sAAEAAAACXAAF	7698
7	AAAR3sAAEAAAACXAAG	7782
8	AAAR3sAAEAAAACXAAH	7788
9	AAAR3sAAEAAAACXAAI	7839
10	AAAR3sAAEAAAACXAAJ	7844
11	AAAR3sAAEAAAACXAAK	7876
12	AAAR3sAAEAAAACXAAL	7900
13	AAAR3sAAEAAAACXAAM	7902
14	AAAR3sAAEAAAACXAAN	7934

1 : ROWNUM 
AAAR3s : �������� ������Ʈ ��ȣ
AAE : ������ ���� ��ȣ
AAAACX : ������ �� ��ȣ 
AAA : ������ �� ��ȣ 
*/

SELECT ROWNUM, ROWID, EMPNO FROM EMP;

-- ������̺��� 5�� ��ȸ �� �ּ��� 
SELECT ROWNUM, ROWID, EMPNO FROM EMP 
WHERE ROWNUM <= 5;

SELECT ROWNUM, ROWID, HIREDATE FROM EMP;

-- �Ի����� ���������� ��� 5���� ��ȸ �Ͻÿ� 
SELECT ROWNUM, ROWID, HIREDATE 
FROM EMP
WHERE ROWNUM <= 5
ORDER BY HIREDATE;

SELECT ROWNUM, ROWID, HIREDATE 
FROM EMP
WHERE ROWNUM <= 6
ORDER BY HIREDATE;

--SELECT : ����Ʈ �� 
--    SELECT * FROM DUAL; : ��Į�� �������� : ����Ʈ ���� SELECT ������ ����ϴ� �� 
--FROM : ���� �� 
--    SELECT * FROM DUAL; : �ζ��� �� �������� : ���� ���� SELECT ������ ����ϴ� ��
--      �ζ��� �� ���������� ����ϴ� ������ 
--      ���̺� �ִ� ��ü �����͸� ������� �ʰ� 
--      �� ���ǿ� �ʿ��� �÷��� ���� �����ؼ� ����ϱ� ���ؼ� 
--      ������ ũ�⸦ ���̱� ���ؼ� ����ϴ� �� 
--      INLINE VIEW SUBQUERY �� INNSER JOIN ȿ���� �ִ�. 
--WHERE : ���� �� 
--    SELECT * FROM DUAL; : �������� : ���� ���� SELECT ������ ����ϴ� ��

-- �Ի��� ���� ������ 5���� ���ϱ� ���ؼ�
-- ���� �Ի��� ������� ��Ʈ�� �Ѵ�. 
-- ��Ʈ�� ���ڵ忡�� 5���� ��ȸ�Ѵ�. 
SELECT  A.HIREDATE 
FROM    (SELECT * FROM EMP AA ORDER BY HIREDATE) A
WHERE   ROWNUM <= 5;

SELECT  A.HIREDATE 
FROM    (SELECT AA.HIREDATE FROM EMP AA ORDER BY HIREDATE) A
WHERE   ROWNUM <= 5;

--####################################################
--���� : ���̺��� ��ġ�� �� : �������� ���̺��� ���� Ű�� ������ ��ġ�� �� 
--      �� ����Ű�� ��� ��ĥ �� �ִ�. 
--EQUI JOIN ��������, EQUAL JOIN �������� : INNSER JOIN �̳�����
--NOT-EQUI JOIN �� ��Ű����
--SELF JOIN ���� ����
--OUTER JOIN �ƿ��� ���� 

--���̺��� ��ġ�� ����  ���� 
--FROM ���� ���̺� ���� ���������� �����ϸ� �ȴ�. : ���̺� ����̺� 

--���� : ������ �����ͺ��̽� �ϴ� ��  : Relation Database 
--������ �ϳ��� ���̺�� �����ϴ� �����͵��� 
--� ������ ���ؼ� �� ���̺� �ִ� �����͸� ����� �ٸ� ���̺� �����ϴµ�
--�� �� ������ ���ؼ� ����Ű�� �����ϴ� ��쵵 �ְ� �������� �ʴ� ��쵵 �ִ�. 
--�������� ���̺�� ����� ���� ����Ʈ�� ���� ����Ϸ���(��ȸ)�Ϸ��� �� �� 
--����ϴ� ����� �����̴�. 

--CROSS JOIN 
--�ϳ��� ���̺� �ִ� ��� �÷��� ������ ���̺��� � �÷��� ���������� ��ġ���� ���� �� ���, 
--ORACLE 9 ������ CROSS JOIN, 
--ORACLE 9 �������� Cartesian : ī��þ� : ī���׽þ� ���� 
SELECT *
FROM   SCOTT.EMP, SCOTT.DEPT;

SELECT COUNT(*) FROM SCOTT.EMP;
SELECT COUNT(*) FROM SCOTT.DEPT;
SELECT COUNT(*)
FROM   SCOTT.EMP, SCOTT.DEPT;


SELECT DEPTNO FROM SCOTT.EMP;
SELECT DISTINCT DEPTNO FROM SCOTT.EMP;
SELECT DEPTNO FROM SCOTT.EMP GROUP BY DEPTNO;

SELECT DEPTNO FROM SCOTT.DEPT;
SELECT DISTINCT DEPTNO FROM SCOTT.DEPT;
SELECT DEPTNO FROM SCOTT.DEPT GROUP BY DEPTNO;

--EQUI JOIN : ��Ű ����, EQUAL JOIN : �������� 
--�� ���� ���̺��� �� ���� ������ ���̺� ó�� ���, 
--�� ���� ���̺��� ����� ���� ���̺��� ���� �����Ѵ�, 
--���� �÷� �������� ����

--###############################################
-- INNSER JOIN : �̳����� 
-- ������ = ����ؼ� �� ���̺��� ������ �÷��� ��Ī�ؼ� ��ȸ�ϴ� ��  

-- �̳� ������ ���̺� �ִ� ��� �����͸� ��ȸ �� ���� ����.
-- �÷��� �����Ͱ� ��Ī�̵��� ������ �����͸� ��ȸ�� ���� ����.
<-- �� ������ �����ϴ� ������ OUTER JOIN �ƿ��� ���� �̴�. 
--###############################################

SELECT A.DEPTNO, B.DEPTNO
FROM SCOTT.EMP A, SCOTT.DEPT B
WHERE A.DEPTNO = B.DEPTNO;
--WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT A.DEPTNO, B.DEPTNO
FROM SCOTT.EMP A, SCOTT.DEPT B
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT A.*, B.*
FROM SCOTT.EMP A, SCOTT.DEPT B
WHERE A.DEPTNO = B.DEPTNO;

-- ���̽� ����� �μ��̸��� �˷��ּ���
SELECT A.ENAME, A.DEPTNO FROM EMP A WHERE A.ENAME = 'SMITH';
SELECT A.DNAME, A.DEPTNO FROM DEPT A WHERE A.DEPTNO = 20;

SELECT A.ENAME, A.DEPTNO, B.DNAME
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND   A.ENAME = 'SMITH';

-- ���̽� ����� �μ��̸�, �μ��� �������� �˷��ּ���
SELECT A.ENAME, A.DEPTNO FROM EMP A WHERE A.ENAME = 'SMITH';
SELECT A.DNAME, A.LOC, A.DEPTNO FROM DEPT A WHERE A.DEPTNO = 20;

SELECT A.ENAME, A.DEPTNO, B.DNAME, B.LOC
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND   A.ENAME = 'SMITH';

--OUTEER JOIN
--2�� �̻��� ���̺� ��� ���� ���̺��� �ش��ϴ� �����Ͱ� �����ϴµ� 
--�ٸ� ���̺� �����Ͱ� �������� �ʴ� ��� 
--�� �����͸� ����ϱ� ���� ����, 
--�����Ͱ� �������� �ʴ� �� ���̺� (+)��ȣ�� �����ϸ� 
--�����Ͱ� �����ϵ�, �����ʵ� ���̺��� ��� ������ ���, 
--���� ���ǿ� �������� �ʴ� �൵ ���

SELECT DISTINCT DEPTNO FROM SCOTT.EMP;
SELECT DEPTNO FROM SCOTT.EMP GROUP BY DEPTNO;

SELECT DISTINCT DEPTNO FROM SCOTT.DEPT;

-- INNSER JOIN 
SELECT A.DEPTNO, B.DEPTNO
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO

-- OUTER JOIN 
SELECT A.DEPTNO, B.DEPTNO
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO(+)

SELECT A.DEPTNO, B.DEPTNO
FROM EMP A, DEPT B
WHERE A.DEPTNO(+) = B.DEPTNO

--NOT-EQUI JOIN �� ��Ű����, NOT EQUAL JOIN
--���� �÷��� ���� �ٸ� ������ ����Ͽ� ����

SELECT * FROM SALGRADE;

SELECT A.EMPNO, A.ENAME, A.SAL, B.GRADE
FROM   EMP A, SALGRADE B
WHERE  A.SAL >= B.LOSAL
AND    A.SAL <= B.HISAL

SELECT A.EMPNO, A.ENAME, A.SAL, B.GRADE
FROM   EMP A, SALGRADE B
WHERE  A.SAL BETWEEN B.LOSAL AND B.HISAL

SELECT A.EMPNO, A.ENAME, A.SAL, B.DNAME, C.GRADE
FROM   EMP A, DEPT B, SALGRADE C
WHERE  A.DEPTNO = B.DEPTNO
AND    A.SAL >= C.LOSAL
AND    A.SAL <= C.HISAL

SELECT A.EMPNO, A.ENAME, A.SAL, B.DNAME, C.GRADE
FROM   EMP A, DEPT B, SALGRADE C
WHERE  A.DEPTNO = B.DEPTNO
AND    A.SAL BETWEEN C.LOSAL AND C.HISAL

--SELF JOIN
SELECT EMPNO FROM SCOTT.EMP;
SELECT EMPNO, MGR FROM SCOTT.EMP;

SELECT  A.ENAME || '�� �Ŵ���' || B.ENAME || '�̴�'
FROM    SCOTT.EMP A, SCOTT.EMP B
WHERE   A.MGR = B.EMPNO;

-- �Ŵ��� ���� ����� ??
SELECT ENAME FROM SCOTT.EMP WHERE MGR IS NULL;

SELECT ENAME 
FROM   SCOTT.EMP 
WHERE  MGR IS NOT NULL;


--- ANSI (�̱�ǥ�ؿ�����) SQL : ��� �����ͺ��̽� �ý����� ǥ�� ��� 

--�������� 
--SELECT : ����Ʈ �� 
--    SELECT * FROM DUAL; : ��Į�� �������� : ����Ʈ ���� SELECT ������ ����ϴ� �� 
--      �Ϻ� OUTER JOIN ȿ���� �ִ�. 
--FROM : ���� �� 
--    SELECT * FROM DUAL; : �ζ��� �� �������� : ���� ���� SELECT ������ ����ϴ� ��
--      �ζ��� �� ���������� ����ϴ� ������ 
--      ���̺� �ִ� ��ü �����͸� ������� �ʰ� 
--      �� ���ǿ� �ʿ��� �÷��� ���� �����ؼ� ����ϱ� ���ؼ� 
--      ������ ũ�⸦ ���̱� ���ؼ� ����ϴ� �� 
--      INLINE VIEW SUBQUERY �� INNSER JOIN ȿ���� �ִ�. 
--WHERE : ���� �� 
--    SELECT * FROM DUAL; : �������� : ���� ���� SELECT ������ ����ϴ� ��

--�������� ����
--���� ��(Single-Row) ��������
--���� ��(Multi-Row) ��������
--���� ��(�÷�)(Multi-Column) �������� 
--�ζ��� ��(Inline view) ��������
--��Į��(Scala) ��������

--���� ��(Single-Row) ��������
-- SELECT ���忡�� ���� �ϳ��� ��(��)�� ��ȯ�ϴ� ����
-- ���� �� �����ڴ� (=, >, >=, <, <=, <>, !=) �� ����Ѵ�.
SELECT A.ENAME, A.JOB 
FROM   EMP A
WHERE  A.JOB = (SELECT B.JOB FROM EMP B WHERE B.EMPNO=7369)

-- SCOTT����� �μ��� �μ��̸� ��ȸ �Ͻÿ� 
SELECT * FROM SCOTT.EMP WHERE ENAME = 'SCOTT';

SELECT A.DNAME DNAME
FROM   DEPT A
WHERE  A.DEPTNO = (SELECT DEPTNO FROM SCOTT.EMP WHERE ENAME = 'SCOTT');

SELECT A.DNAME DNAME
FROM   DEPT A, EMP B
WHERE  A.DEPTNO = B.DEPTNO 
AND    B.ENAME = 'SCOTT';

-- SCOTT����� ������ �μ����� �ٹ��ϴ� ����� �̸�, �μ���ȣ�� ��ȸ�Ͻÿ�.
SELECT A.ENAME, A.DEPTNO
FROM   EMP A
WHERE  A.DEPTNO = (SELECT DEPTNO FROM SCOTT.EMP WHERE ENAME = 'SCOTT');

-- SCOTT����� ������ �μ����� �ٹ��ϴ� ����� �̸�, �μ���, �μ���ȣ�� ��ȸ�Ͻÿ�
SELECT A.ENAME, A.DEPTNO, B.DNAME
FROM   EMP A, DEPT B
WHERE  A.DEPTNO = B.DEPTNO
AND    A.DEPTNO = (SELECT DEPTNO FROM SCOTT.EMP WHERE ENAME = 'SCOTT');

-- ������������ �׷��Լ� ����� �� MIN(), MAX(), AVG()
-- �ּұ޿��� �޴� ����� �̸�, ������, �޿� ��ȸ�Ͻÿ�
SELECT A.ENAME, A.JOB, A.SAL
FROM   EMP A
WHERE  A.SAL = (SELECT MIN(SAL) FROM EMP);

-- �ִ�޿��� �޴� ����� �̸�, ������, �޿� ��ȸ�Ͻÿ�
SELECT A.ENAME, A.JOB, A.SAL
FROM   EMP A
WHERE  A.SAL = (SELECT MAX(SAL) FROM EMP);

SELECT *
FROM   EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

SELECT *
FROM   EMP
WHERE SAL >= (SELECT AVG(SAL) FROM EMP);

SELECT *
FROM   EMP
WHERE SAL < (SELECT AVG(SAL) FROM EMP);

SELECT *
FROM   EMP
WHERE SAL <= (SELECT AVG(SAL) FROM EMP)

-- �μ��� �����޿� 
SELECT DEPTNO, MIN(SAL)
FROM   EMP
GROUP BY DEPTNO;
-- 30�� �μ��� �����޿�
SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30;

SELECT DEPTNO, MIN(SAL)
FROM   EMP
GROUP BY DEPTNO
HAVING MIN(SAL) > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);


--���� ��(Multi-Row) ��������
--�ϳ� �̻��� ���� ��ȯ�ϴ� �������� 
--���� �� �����ڸ� ������� ���Ѵ�. 
--���� �� ������(IN, NOT IN, ANY, ALL, EXISTS) �� ����Ѵ�. 

-- �μ����� �޿��� �� ���� ��� ���� 
SELECT A.EMPNO, A.ENAME, A.SAL, A.DEPTNO
FROM   EMP A
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ANY ������
-- ���������� ���� ��� �� �� ��� �ϳ��� ���� ������ �Ǹ� ���� ��ȯ�Ѵ�. 

--SALSEMAN ������ �޿����� ���� �޴� ����� ������ �޿� ������ ����Ͻÿ�
SELECT ENAME, SAL, JOB, DEPTNO
FROM   EMP
WHERE  DEPTNO != 20
AND    SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

-- ALL ������
-- ���������� ���� ��� �� �� ��� ��� ���� �����ؾ� ���� ��ȯ�Ѵ�. 

--��� SALSEMAN ������ �޿����� ���� �޴� ����� ������ �޿� ������ ����Ͻÿ�
SELECT ENAME, SAL, JOB, DEPTNO
FROM   EMP
WHERE  DEPTNO != 20
AND    SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

--EXISTS ������
-- �������� �����Ͱ� �����ϴ°��� üũ�� ���� ����(TRUE, FALSE)�� ����� ��ȯ�Ѵ�. 
-- EXISTS������ �ݵ�� ���� ������ ����� �Ǵ� ���� ������ ������ �־�� �Ѵ�.
-- ������������ ��� ���� ã����, INNER QUERY ������ �ߴ��ϰ� TRUE�� ��ȯ�Ѵ�. 

SELECT DISTINCT A.DEPTNO, A.DNAME
FROM   DEPT A, EMP B
WHERE  A.DEPTNO = B.DEPTNO;

SELECT A.DEPTNO, A.DNAME
FROM   DEPT A
WHERE  EXISTS (SELECT 1 FROM EMP B WHERE B.DEPTNO = A.DEPTNO);


--���� ��(�÷�)(Multi-Column) �������� 
-- ��� ���� �� �� �̻��� �÷��� ��ȯ�ϴ� ��������
SELECT EMPNO, SAL, DEPTNO
FROM   EMP 
WHERE (SAL, DEPTNO) IN (SELECT SAL, DEPTNO
                            FROM   EMP
                            WHERE  DEPTNO = 30
                            AND    COMM IS NOT NULL);

SELECT EMPNO, SAL, DEPTNO
FROM   EMP 
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 30 AND COMM IS NOT NULL)
AND   DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO = 30 AND COMM IS NOT NULL);

--�ζ��� ��(Inline view) ��������

-- �μ���ȣ 20�� ��� �޿����� ũ��, 
-- �μ���ȣ 20�� ������ ���� �����ڸ� ��ȸ�Ͻÿ� 
SELECT B.EMPNO, B.ENAME, B.JOB, B.SAL, B.DEPTNO 
FROM   (SELECT EMPNO FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20)) A,
       EMP B
WHERE  A.EMPNO = B.EMPNO
AND    B.MGR IS NOT NULL
AND    B.DEPTNO != 20;

--��Į��(Scala) ��������
-- �Ѱ��� �ο츸 ��ȯ�Ѵ�.
-- ���� �������� ����Ǵ� ������ �� �� ��ŭ ����Ǳ� ������ �������� ���� �� ������ ����ȸ���� ���� �� �ִ�.
-- ��ġ�ϴ� ���� ���� ��� NULL�� ��ȯ�Ѵ�.
-- �ڵ强 ���̺��� �ڵ尪�� ��ȸ�� ��, 
-- ���ʿ��� ������ ���� �ʱ� ���� ���� ����Ѵ�.

-- ������ 'MANAGER'�� ����� �����, �μ����� ��ȸ
SELECT A.ENAME,
       (SELECT B.DNAME FROM DEPT B WHERE B.DEPTNO = A.DEPTNO) DNAME
FROM   EMP A
WHERE  A.JOB = 'MANAGER';

SELECT A.ENAME,
       B.DNAME
FROM   EMP A, DEPT B
WHERE  A.DEPTNO = B.DEPTNO
AND    A.JOB = 'MANAGER';

SELECT  A.DEPTNO, 
        A.DNAME,
        (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = A.DEPTNO) SAL
FROM   DEPT A

SELECT A.DEPTNO, A.DNAME, MAX(B.SAL)
FROM   DEPT A, EMP B
WHERE  A.DEPTNO = B.DEPTNO(+)
GROUP BY A.DEPTNO, A.DNAME
ORDER BY A.DEPTNO


-- UNION : ������
SELECT DEPTNO FROM EMP
UNION
SELECT DEPTNO FROM DEPT;

-- UNION ALL : �ߺ����� ������
SELECT DEPTNO FROM EMP
UNION ALL
SELECT DEPTNO FROM DEPT;

-- INTERSECT : ������
SELECT DEPTNO FROM EMP
INTERSECT
SELECT DEPTNO FROM DEPT;

-- MINUS : ������
SELECT DEPTNO FROM DEPT
MINUS
SELECT DEPTNO FROM EMP;

SELECT DEPTNO FROM EMP
MINUS
SELECT DEPTNO FROM DEPT;


-- LEFT OUTER JOIN
SELECT A.DEPTNO, B.DEPTNO
FROM   DEPT A LEFT OUTER JOIN EMP B
ON     A.DEPTNO = B.DEPTNO;

-- RIGHT OUTER JOIN
SELECT A.DEPTNO, B.DEPTNO
FROM   EMP A RIGHT OUTER JOIN DEPT B
ON     A.DEPTNO = B.DEPTNO;

-- FULL OUTER JOIN
SELECT A.DEPTNO, B.DEPTNO
FROM   EMP A FULL OUTER JOIN DEPT B
ON     A.DEPTNO = B.DEPTNO;





