--OR
--SCOTT.EMP A ���̺��� DEPTNO�� 10�ΰ��� LOW�� ���
SELECT * FROM SCOTT.EMP A WHERE A. DEPTNO =10;
SELECT * FROM SCOTT.EMP A WHERE A.JOB = 'MANAGER';

SELECT * FROM SCOTT.EMP A
WHERE A.DEPTNO =10
OR    A.JOB = 'MANAGER';

--���̺� �ִ� ROW���� ���ϴ� �Լ� : COUNT()
--ī��Ʈ �Լ��� �ƱԸ�Ʈ�� ����ϴ� ��Ģ
--1. PKĮ���� ����Ѵ�. �ش����̺��� �� ���� �ϳ����� �ִ� Į��? PK : PRIMARY KEY
--2. PKĮ���� �������� NOT NULL �÷��� ����Ѵ�.
SELECT COUNT(A.EMPNO) FROM SCOTT.EMP A 
WHERE A.DEPTNO =10  --WHERE�� ���ǽ�, DEPTNO�� 10 �̰ų� JOB = MANIGER�ΰ� ���
OR    A.JOB = 'MANAGER';

--���� �÷��� �������� ���� ��ȸ�� ��
--IN() : ���� �÷����� ������ ��ȸ;
SELECT A.* FROM SCOTT.EMP A
WHERE A.COMM = 300 
OR    A.COMM = 500
OR    A.COMM = 1400;  

SELECT A.* FROM SCOTT.EMP A
WHERE A.COMM IN(300, 500, 1400);

SELECT A.* FROM SCOTT.EMP A
WHERE A.COMM NOT IN(300, 500, 1400);

--NOT
SELECT A.*FROM SCOTT.EMP A
WHERE A.DEPTNO =10;

SELECT A.*FROM SCOTT.EMP A
WHERE NOT A.DEPTNO =10;

SELECT A.*FROM SCOTT.EMP A
WHERE A.DEPTNO <> 10;

SELECT A.*FROM SCOTT.EMP A
WHERE DEPTNO != 10;

SELECT A.*FROM SCOTT.EMP A
WHERE DEPTNO ^= 10;

--==================================================================
--SELECT
--    ����Ʈ ��
--    SELECT * FROM DUAL
--FROM
--    ������
--    SELECT * FROM DUAL
--WHERE
--    �������� �׽� TRUE�϶��� ���� �Ѵ�.
--    1=1 : QUERY�� ���� �� �� �ſ� �����ϴ�.
--    1=1 : ��������� ���� ����̴�. ����� ���� ��� �Ѥ����̴�.
--    SELECT * FROM DUAL

--==================================================================

-- ���� ����
-- FROM ~ TO ����
-- < > , <= >=
-- ��ȣ ���� �ϼ���.
-- �޿��� 1000���� 1500������ ����� ��ȸ
SELECT A.* FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL >= 1000
AND A.SAL <= 1500;

-- �޿��� 1000 �ʰ��̰� 1500�̸��� ����� ��ȸ 
SELECT A.* FROM SCOTT.EMP A 
WHERE 1=1
AND A.SAL > 1000
AND A.SAL < 1500;

-- �޿��� 1000�̸� �̰ų� 1500 �ʰ��� ����� ��ȸ 
SELECT A.* FROM SCOTT.EMP A 
WHERE 1=1
AND A.SAL > 1000
OR A.SAL < 1500;

-- ��������, FROM ~ TO ����
SELECT A.*FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL >=1000
AND A.SAL <=1500;
-- BETWEEN A AND B
-- Ư�� �÷��� ������ ���� ���Ѱ�(A)�� ���Ѱ�(B)���̿� ���Ե� �ο츦 �˻�
SELECT A.*FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 1000 AND 1500;

SELECT A.*FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL NOT BETWEEN 1000 AND 1500;

--1982�⿡ �Ի��� ��� ����ϱ�
SELECT A.* FROM SCOTT.EMP A
WHERE 1=1
AND A.HIREDATE BETWEEN '1981/01/01' AND '1981/12/31';

SELECT A.* FROM SCOTT.EMP A
WHERE 1=1
AND A.HIREDATE >= '1981/01/01' 
AND A.HIREDATE <= '1981/12/31';

SELECT A.* FROM SCOTT.EMP A
WHERE 1=1
AND A.HIREDATE >= TO_CHAR(TO_DATE('1981/01/01'),'YYYY-MM-DD') 
AND A.HIREDATE <= TO_CHAR(TO_DATE('1981/12/31'),'YYYY-MM-DD');

SELECT A.* FROM SCOTT.EMP A
WHERE 1=1
AND     TO_CHAR(TO_DATE(A.HIREDATE),'YYYYMMDD') 
        >= TO_CHAR(TO_DATE('1981/01/01'),'YYYYMMDD')
AND     TO_CHAR(TO_DATE(A.HIREDATE),'YYYYMMDD') 
        <= TO_CHAR(TO_DATE('1981/12/31'),'YYYYMMDD');
        
SELECT A.*FROM SCOTT.EMP A
WHERE 1=1
AND    TO_CHAR(TO_DATE(A.HIREDATE), 'YYYY') = '1981';

SELECT A.HIREDATE FROM SCOTT.EMP A
WHERE 1=1
AND SUBSTR(A.HIREDATE,1,2)='81';

SELECT SUBSTR(A.HIREDATE, 1, 2) AS HIREDATE FROM SCOTT.EMP A
WHERE 1=1
AND SUBSTR(A.HIREDATE, 1, 2) = 81;

--NVL()�Լ�
--����Ŭ������ NULL Ű�����̴�.
SELECT NULL FROM DUAL;
SELECT NULL +1 FROM DUAL;
SELECT A.* FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM +1 AS COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NOT NULL;
SELECT A.COMM+1 FROM SCOTT.EMP A WHERE COMM IS NOT NULL;

--NVL(ù��° �Ű� ����, �ι����Ű�����)
-- ù��° �Ű������� ����� �ι�°�Ű������� �ٲټ���
-- NVL(NULL,0)
-- ù���� �Ű������� NULL�̸� 0���� �ٲ��ּ���.
SELECT NVL(NULL, 0) FROM DUAL;
SELECT NVL(NULL, 0) +1 FROM DUAL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM, 0)COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM,0) +1 COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
        
-- ��������� +,-,*,/
SELECT    A.ENAME  AS "��� �̸�"
         ,A.SAL    AS "�޿�"
         ,A.SAL*12 AS "����"
FROM    SCOTT.EMP A;

SELECT    A.ENAME        AS "��� �̸�"
         ,A.SAL          AS �޿�
         ,A.SAL*12       AS ����
         ,NVL(A.COMM, 0) AS �󿩱�
FROM    SCOTT.EMP A;

SELECT    A.ENAME           AS "��� �̸�"
         ,A.SAL             AS �޿�
         ,A.SAL*12          AS ����
         ,NVL(A.COMM, 0)    AS �󿩱�
         ,A.SAL*12 + A.COMM   AS "�󿩱������� ����"
FROM    SCOTT.EMP A;

SELECT    A.ENAME           AS "��� �̸�"
         ,A.SAL             AS �޿�
         ,A.SAL*12          AS ����
         ,NVL(A.COMM, 0)    AS �󿩱�
         ,A.SAL*12 + NVL(A.COMM,0)   AS "�󿩱������� ����"
FROM    SCOTT.EMP A;

1.
--����� �޿� 300 �� �λ�
--��� �̸� �޿� �λ�� �޿�

SELECT  A.ENAME                 AS "��� �̸�"
       ,NVL(A.SAL, 0)           AS "���� �޿�"
       ,NVL(A.SAL, 0 )+300      AS "�λ�� �޿�"
FROM SCOTT.EMP A;

--2. ��� �̸� �޿� ���� �Ѽ����� �Ѽ��Ԥ��� ���� ������� ���;
SELECT  A.ENAME                      AS "��� �̸�"
       ,NVL(A.SAL, 0)                AS "���� �޿�"
       ,NVL(A.SAL, 0 ) * 12 + 100    AS "���� �Ѽ���"
FROM SCOTT.EMP A ORDER BY 3 DESC;

--3. �޿��� 2000�� �Ѵ� ��� �̸��� �޿��� �޿������� �ͺ��� ���� ������ ����Ͻÿ�.
SELECT  A.ENAME     AS "��� �̸�"
       ,A.SAL       AS "�޿�"
FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL > 2000
ORDER BY 2 DESC;

--4. ��� ��ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�.
SELECT  A.ENAME   AS "����̸�"
        ,A.EMPNO AS"�����ȣ"
      ,A.DEPTNO  AS "�μ���ȣ"      
FROM SCOTT.EMP A
WHERE A.EMPNO=7788;

--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿������
SELECT A.ENAME  AS "����̸�"
     , A.SAL    AS "�޿�"
FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL NOT BETWEEN 2000 AND 3000
ORDER BY SAL;

--6. 1981��2��20�Ϻ��� 5��1�� ���̿� �Ի��� ��� �̸� ��� ���� �Ի��� ���
SELECT A.ENAME  AS "����̸�"
      ,A.JOB    AS "������"
      ,A.HIREDATE AS "�Ի���"
FROM SCOTT.EMP A
WHERE 1=1
AND     TO_CHAR(TO_DATE(A.HIREDATE),'YYYYMMDD') 
        >= TO_CHAR(TO_DATE('1981/02/20'),'YYYYMMDD')
AND     TO_CHAR(TO_DATE(A.HIREDATE),'YYYYMMDD')
        <= TO_CHAR(TO_DATE('1981/05/01'),'YYYYMMDD');

--7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� ������������ ������
SELECT  A.ENAME  AS "����̸�"
       ,A.DEPTNO    AS "���μ�"
FROM SCOTT.EMP A
WHERE A.DEPTNO IN (20,30)
ORDER BY 1 DESC;

--8. ����޿� 2000���� 3000���� ���� �μ���ȣ�� 20�Ǵ� 30�� ����� �̸� �޿��� �μ���ȣ�� ��� �̸� ��������
SELECT A.ENAME      AS "����̸�"
      ,A.DEPTNO     AS "�μ���ȣ"
      ,A.SAL        AS "�޿�"
FROM SCOTT.EMP A
WHERE A.SAL BETWEEN '2000' AND '3000' 
AND A.DEPTNO IN(20,30)
ORDER BY 1 ;

SELECT 
        A.ENAME      AS "����̸�"
       ,A.SAL        AS "�޿�"
       ,A.DEPTNO     AS "�μ���ȣ"       
FROM    SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 2000 AND 3000 
AND (DEPTNO =30 OR DEPTNO =20)
ORDER BY 1;


--9. 1981 �Ի��� ����� �̸��� �Ի��� ���
SELECT A.ENAME  AS "����̸�"
      ,A.HIREDATE AS "�Ի���"
FROM SCOTT.EMP A
WHERE TO_CHAR(TO_DATE(A.HIREDATE),'YYYY') LIKE '%81';

--10
SELECT A.ENAME, A.JOB 
FROM SCOTT.EMP A
WHERE MGR IS NULL;

--11 
SELECT  A.ENAME   AS "��� �̸�"
       ,A.SAL     AS "�޿�"
       ,A.COMM    AS "�󿩱�"
FROM SCOTT.EMP A
WHERE  A.COMM IS NOT NULL
ORDER BY 2 DESC,3 DESC;

12
SELECT A.ENAME AS "����̸�"
FROM SCOTT.EMP A
WHERE A.ENAME LIKE '__R%';


13
SELECT A.ENAME AS "����̸�"
FROM SCOTT.EMP A
WHERE A.ENAME LIKE '%A%' AND A.ENAME LIKE '%E%';


--14---
SELECT
     A.ENAME AS "����̸�"
    ,A.JOB AS "������"
    ,NVL(A.SAL,0) AS "�޿�"
FROM SCOTT.EMP A
WHERE A.JOB IN ('CLERK','SALESMAN') 
AND A.SAL NOT IN(1600,950,1300); 


15
SELECT A.ENAME          AS "����̸�"
      ,NVL(A.COMM,0)    AS "�󿩱�"
FROM   SCOTT.EMP A
WHERE  A.COMM >= 500;
