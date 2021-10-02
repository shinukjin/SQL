-- OR
SELECT * FROM SCOTT.EMP A;
SELECT A.DEPTNO FROM SCOTT.EMP A;
SELECT * FROM SCOTT.EMP A WHERE A.DEPTNO = 10; 

SELECT * FROM SCOTT.EMP A;
SELECT A.JOB FROM SCOTT.EMP A;
SELECT * FROM SCOTT.EMP A WHERE  A.JOB = 'MANAGER'; 

SELECT * FROM SCOTT.EMP A 
WHERE A.DEPTNO = 10
OR    A.JOB = 'MANAGER';

--���̺� �ִ�  ROW ���� ���ϴ� �Լ� : COUNT() 
--ī��Ʈ �Լ��� �ƱԸ�Ʈ�� ����ϴ� ��Ģ 
--1. PK �÷��� ����Ѵ�. 
--2. PK �÷��� ���� ���� NOT NULL �÷��� ����Ѵ�. 
SELECT COUNT(A.EMPNO) FROM SCOTT.EMP A 
WHERE A.DEPTNO = 10
OR    A.JOB = 'MANAGER';


--���� �÷��� �������� ���� ��ȸ�� �� 
-- IN
SELECT A.* FROM SCOTT.EMP A
WHERE COMM = 300
OR    COMM = 500
OR    COMM = 1400;

SELECT A.* FROM SCOTT.EMP A
WHERE COMM IN (300, 500, 1400);

SELECT A.* FROM SCOTT.EMP A
WHERE COMM NOT IN (300, 500, 1400);

-- NOT 
SELECT A.* FROM SCOTT.EMP A
WHERE  DEPTNO = 10;

SELECT A.* FROM SCOTT.EMP A
WHERE  NOT DEPTNO = 10;

SELECT A.* FROM SCOTT.EMP A
WHERE  DEPTNO <> 10;

SELECT A.* FROM SCOTT.EMP A
WHERE  DEPTNO != 10;

SELECT A.* FROM SCOTT.EMP A
WHERE  DEPTNO ^= 10;

--##################################################
--SELECT
--    ����Ʈ �� 
--    SEELCT * FROM DUAL
--FROM 
--    ���� �� 
--    SELECT * FROM DUAL
--WHERE 
--    ���� �� �� �׽�(�׻�) TRUE �� ���� ���� �ȴ�. 
--    1=1 : ������ ���� �� �� �ſ� �����ϴ�. 
--    1=1 : ��������� ���� ����̴�. ����� ���� ��� ���� �̴�. 
--    SELECT * FROM DUAL 
--##################################################

-- ���� ���� 
-- FROM ~ TO ����
-- < >, <= >=
-- ��ȣ ���� �ϼ��� 
-- �޿��� 1000���� 1500������ ����� ��ȸ 
SELECT A.* FROM SCOTT.EMP A;
SELECT A.SAL FROM SCOTT.EMP A;

SELECT A.SAL FROM SCOTT.EMP A
WHERE  A.SAL >= 1000;
SELECT A.SAL FROM SCOTT.EMP A
WHERE  A.SAL <= 1500;

SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.SAL >= 1000
AND    A.SAL <= 1500;

-- �޿��� 1000�̸� �̰ų� 1500 �ʰ��� ����� ��ȸ 

--�ּ��� ���� 
-- 1000 �ʰ� �̰ų� 1500 �̸��� ����� ��ȸ
SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.SAL > 1000
AND    A.SAL < 1500;

-- ���翵 ���� 
-- �޿��� 1000�̸� �̰ų� 1500 �ʰ��� ����� ��ȸ 
SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND A.SAL < 1000
OR  A.SAL > 1500;

-- ���� ����, FROM  ~ TO ���� 
-- BETWEEN A AND B 
-- Ư�� �÷��� ������ ���� ���Ѱ�(A)�� ���Ѱ�(B) ���̿� ���Ե� �ο츦 �˻�
SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.SAL BETWEEN 1000 AND 1500;

SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.SAL >= 1000
AND    A.SAL <= 1500;

SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.SAL NOT BETWEEN 1000 AND 1500;

-- 1981�⿡ �Ի��� ��� ����ϱ� 
SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.HIREDATE BETWEEN '1981/01/01' AND '1981/12/31';

SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.HIREDATE >= '1981/01/01' 
AND    A.HIREDATE <= '1981/12/31';

SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.HIREDATE >= TO_CHAR(TO_DATE('1981/01/01'), 'YYYYMMDD') 
AND    A.HIREDATE <= TO_CHAR(TO_DATE('1981/12/31'), 'YYYYMMDD');

SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    TO_CHAR(TO_DATE(A.HIREDATE), 'YYYYMMDD') 
       >= TO_CHAR(TO_DATE('1981/01/01'), 'YYYYMMDD') 
AND    TO_CHAR(TO_DATE(A.HIREDATE), 'YYYYMMDD')
       <= TO_CHAR(TO_DATE('1981/12/31'), 'YYYYMMDD');
       
SELECT A.* FROM SCOTT.EMP A
WHERE  1=1       
AND    TO_CHAR(TO_DATE(A.HIREDATE), 'YYYY') = '1981';

SELECT A.HIREDATE FROM SCOTT.EMP A
WHERE  1=1       
AND   SUBSTR(A.HIREDATE, 1, 2) = '81';

SELECT SUBSTR(A.HIREDATE, 1, 2) AS HIREDATE FROM SCOTT.EMP A
WHERE  1=1       
AND   SUBSTR(A.HIREDATE, 1, 2) = '81';


-- NVL() �Լ� 
-- ����Ŭ���� NULL Ű���� �̴�. 
SELECT NULL FROM DUAL;
SELECT NULL + 1 FROM DUAL;
SELECT A.* FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM + 1 AS COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NOT NULL;
SELECT A.COMM + 1 FROM SCOTT.EMP A WHERE COMM IS NOT NULL;


-- NVL(ù��°�Ű�����, �ι�°�Ű�����)
-- ù��°�Ű������� ����� �ι�°�Ű������� �ٲټ��� 
-- NVL(NULL, 0)
-- ù��°�Ű������� NULL �̸� 0 ���� �ٲټ��� 
SELECT NVL(NULL, 0) FROM DUAL;
SELECT NVL(NULL, 0) + 1 AS AA FROM DUAL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM, 0) COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM, 0) + 1 COMM FROM SCOTT.EMP A WHERE COMM IS NULL;


-- ��������� +, -, *, /
SELECT A.ENAME    AS "��� �̸�"
      ,A.SAL      AS "�޿�"
      ,A.SAL*12   AS "����"
FROM   SCOTT.EMP A;

SELECT A.ENAME            AS "��� �̸�"
      ,A.SAL              AS �޿� 
      ,A.SAL*12           AS ����
      ,A.COMM             AS �󿩱� 
      ,NVL(A.COMM, 0)     AS �󿩱� 
FROM   SCOTT.EMP A;

SELECT A.ENAME             AS "��� �̸�"
      ,A.SAL               AS �޿�
      ,A.SAL*12            AS ����
      ,A.COMM              AS �󿩱� 
      ,A.SAL*12 + A.COMM   AS "�󿩱������� ����"
FROM   SCOTT.EMP A;

SELECT A.ENAME                      AS "��� �̸�"      
      ,A.SAL                        AS �޿�
      ,A.SAL*12                     AS ����
      ,A.COMM                       AS �󿩱� 
      ,A.SAL*12 + NVL(A.COMM, 0)    AS "�󿩱������� ����"
FROM   SCOTT.EMP A;

--###################################
-- �������� 
--1. + �������� ����ؼ� ��� ����� ���ؼ� �޿� 300���� �λ��Ѵ�. 
--   ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ� 
--   ��� ���̺��� 
SELECT 
        A.ENAME             "����̸�"
       ,NVL(A.SAL, 0)       "�޿�"
       ,NVL(A.SAL, 0) + 300 "�λ�� �޿�"
FROM   SCOTT.EMP A;        

--2. ����� �̸�, �޿�, ���� �Ѽ����� �Ѽ����� ���� �ͺ��� ���������� ����Ͻÿ� 
--   ���� �Ѽ����� ���޿� 12���� �� 100�� �󿩱��� ���ؼ� ����Ͻÿ� 
SELECT 
        A.ENAME                "����̸�"
       ,NVL(A.SAL, 0)          "�޿�"
       ,NVL(A.SAL, 0)*12 + 100 "���� �Ѽ���"
FROM   SCOTT.EMP A
ORDER BY NVL(A.SAL, 0)*12 + 100 DESC;

--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �ͺ��� ���� ������ ����Ͻÿ� 
SELECT 
        A.ENAME                "����̸�"
       ,NVL(A.SAL, 0)          "�޿�"       
FROM   SCOTT.EMP A
WHERE  1=1
AND    A.SAL > 2000
ORDER BY NVL(A.SAL, 0) DESC;

SELECT 
        A.ENAME                "����̸�"
       ,NVL(A.SAL, 0)          "�޿�"       
FROM   SCOTT.EMP A
WHERE  1=1
AND    A.SAL > 2000
ORDER BY 2 DESC;

--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ��� �Ͻÿ� 
SELECT 
        A.ENAME  AS "����� �̸�", 
        A.DEPTNO AS "�μ���ȣ" 
FROM SCOTT.EMP A
WHERE 1=1
AND A.EMPNO = '7788';

SELECT 
        A.ENAME  AS "����� �̸�", 
        A.DEPTNO AS "�μ���ȣ" 
FROM SCOTT.EMP A
WHERE 1=1
AND A.EMPNO = 7788;

--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ� 
SELECT
         A.ENAME     "����̸�"
        ,A.SAL       "�޿�"
FROM    SCOTT.EMP A 
WHERE   NOT A.SAL >= 2000
OR      NOT A.SAL <= 3000
ORDER BY SAL;
--SMITH	800
--JAMES	950
--ADAMS	1100
--WARD	1250
--MARTIN	1250
--MILLER	1300
--TURNER	1500
--ALLEN	1600
--KING	5000

SELECT
         A.ENAME     "����̸�"
        ,A.SAL          "�޿�"
FROM    SCOTT.EMP A 
WHERE   1=1
AND     A.SAL NOT BETWEEN 2000 AND 3000
ORDER BY SAL;
--SMITH	800
--JAMES	950
--ADAMS	1100
--WARD	1250
--MARTIN	1250
--MILLER	1300
--TURNER	1500
--ALLEN	1600
--KING	5000

SELECT
         A.ENAME     "����̸�"
        ,A.SAL          "�޿�"
FROM    SCOTT.EMP A 
WHERE   1=1
AND     A.SAL < 2000 
OR      A.SAL > 3000
ORDER BY SAL;
--SMITH	800
--JAMES	950
--ADAMS	1100
--WARD	1250
--MARTIN	1250
--MILLER	1300
--TURNER	1500
--ALLEN	1600
--KING	5000

--6. 1981��2��20�� ���� 1981��5��1�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����Ͻÿ� 
SELECT   A.ENAME         "��� �̸�"
        ,A.JOB           "������"
        ,A.HIREDATE      "�Ի���"
FROM    SCOTT.EMP A
WHERE   1=1
AND     A.HIREDATE >= TO_CHAR(TO_DATE('1981/02/20'), 'YYYYMMDD') 
AND     A.HIREDATE <= TO_CHAR(TO_DATE('1981/05/01'), 'YYYYMMDD');


SELECT   A.ENAME         "��� �̸�"
        ,A.JOB           "������"
        ,A.HIREDATE      "�Ի���"
FROM    SCOTT.EMP A
WHERE   1=1
AND     TO_CHAR(TO_DATE(A.HIREDATE), 'YYYYMMDD')  
        >= TO_CHAR(TO_DATE('1981/02/20'), 'YYYYMMDD') 
AND      TO_CHAR(TO_DATE(A.HIREDATE), 'YYYYMMDD')  
        <= TO_CHAR(TO_DATE('1981/05/01'), 'YYYYMMDD');

--7. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ�
--   �̸��� ��������(��������)���� ���������� ����Ͻÿ� 
SELECT
          A.ENAME	"����̸�"
         ,A.DEPTNO	"�μ���ȣ"
FROM     SCOTT.EMP A
WHERE    1=1
AND      A.DEPTNO = 20 OR A.DEPTNO = 30
ORDER BY A.ENAME DESC;

SELECT
          A.ENAME	"����̸�"
         ,A.DEPTNO	"�μ���ȣ"
FROM     SCOTT.EMP A
WHERE    1=1
AND      A.DEPTNO IN (20, 30)
ORDER BY 1 DESC;

--8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� 
--   �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� 
--   �̸���(��������)���� ����Ͻÿ� 
SELECT 
        A.ENAME      AS "����̸�"
       ,A.SAL        AS "�޿�"
       ,A.DEPTNO     AS "�μ���ȣ"       
FROM    SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 2000 AND 3000 
AND DEPTNO =30  OR DEPTNO =20 
ORDER BY 1;

SELECT 
        A.ENAME      AS "����̸�"
       ,A.SAL        AS "�޿�"
       ,A.DEPTNO     AS "�μ���ȣ"       
FROM    SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 2000 AND 3000 
AND A.DEPTNO IN (20, 30)
ORDER BY 1;

--9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ� 
--   ��. LIKE �����ڿ� ���ϵ�ī�� ����ϱ� 
SELECT
        A.ENAME       AS "����̸�",
        A.HIREDATE    AS"�Ի���"
FROM    SCOTT.EMP A
WHERE A.HIREDATE LIKE '%81%';

--10. ������(��簡 ����)�� ���� ����� �̸��� �������� ����Ͻÿ� 
SELECT  
        A.ENAME AS  "���", 
        A.JOB   AS  "����"
FROM    SCOTT.EMP A
WHERE   MGR IS NULL;


--11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ�
--    �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ���Ͻÿ� 
SELECT  
        A.ENAME     AS �̸�,
        A.SAL       AS �޿�,
        A.COMM      AS Ŀ�̼�
FROM    SCOTT.EMP A
WHERE   A.COMM IS NOT NULL
ORDER BY 2 DESC,3 DESC;

SELECT  
        A.ENAME     AS �̸�,
        A.SAL       AS �޿�,
        A.COMM      AS Ŀ�̼�
FROM    SCOTT.EMP A
WHERE   A.COMM IS NOT NULL
ORDER BY 2 DESC, 3 DESC;

--ALLEN	1600	300
--TURNER	1500	0
--MARTIN	1250	1400
--WARD	1250	500

--###############################
SELECT  
        A.ENAME     AS �̸�,
        A.SAL       AS �޿�,
        A.COMM      AS Ŀ�̼�
FROM    SCOTT.EMP A
WHERE   A.COMM IS NOT NULL
ORDER BY 2, 3 DESC;

--MARTIN	1250	1400
--WARD	1250	500
--TURNER	1500	0
--ALLEN	1600	300
--###############################


--12. �̸��� �� ��° ���ڰ� R�� ����� �̸��� ǥ�� �Ͻÿ� 
SELECT 
        A.ENAME AS "�̸�"
FROM    SCOTT.EMP A
WHERE   1=1
AND A.ENAME LIKE '__R%';

--13. �̸��� A�� E�� �����ϰ� �ִ� ����� �̸��� ǥ�� �Ͻÿ� 
SELECT 
        A.ENAME "�����"
FROM    SCOTT.EMP A
WHERE   A.ENAME LIKE '%A%'
AND     A.ENAME LIKE '%E%';


--14. �������� �繫��(CLERK) �Ǵ� �������(SALESMAN) �̸鼭 
--    �޿��� 1600, 950 �Ǵ� 1300 �ƴ� ����� �̸�, ��� ����, �޿��� ����Ͻÿ�
SELECT 
        A.ENAME      "��� �̸�"
       ,A.JOB        "������"
       ,A.SAL       "�޿�"
FROM    SCOTT.EMP A
WHERE 1=1
AND  (A.JOB = 'CLERK' OR  A.JOB = 'SALESMAN') 
AND NOT (A.SAL  = '1600' OR  A.SAL = '950' OR A.SAL  = '1300');

SELECT 
        A.ENAME      "��� �̸�"
       ,A.JOB        "������"
       ,A.SAL       "�޿�"
FROM    SCOTT.EMP A
WHERE   1=1
AND     A.JOB IN ('CLERK', 'SALESMAN') 
AND     A.SAL NOT IN (1600, 950, 1300);

--15. Ŀ�̼� 500 �̻��� ����� �̸�, �޿� �� Ŀ�̼��� ����Ͻÿ�  
SELECT
        NVL(A.SAL, 0)	"������"
        ,A.COMM		    "Ŀ�̼�"
FROM	SCOTT.EMP A
WHERE	1=1
AND NVL(A.COMM, 0) >= 500;

