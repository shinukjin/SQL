--OR
--SCOTT.EMP A 테이블에서 DEPTNO가 10인것을 LOW로 출력
SELECT * FROM SCOTT.EMP A WHERE A. DEPTNO =10;
SELECT * FROM SCOTT.EMP A WHERE A.JOB = 'MANAGER';

SELECT * FROM SCOTT.EMP A
WHERE A.DEPTNO =10
OR    A.JOB = 'MANAGER';

--테이블에 있는 ROW수를 구하는 함수 : COUNT()
--카운트 함수의 아규먼트를 사용하는 규칙
--1. PK칼럼을 사용한다. 해당테이블에서 각 값이 하나씩만 있는 칼럼? PK : PRIMARY KEY
--2. PK칼럼이 없을때는 NOT NULL 컬럼을 사용한다.
SELECT COUNT(A.EMPNO) FROM SCOTT.EMP A 
WHERE A.DEPTNO =10  --WHERE은 조건식, DEPTNO가 10 이거나 JOB = MANIGER인거 출력
OR    A.JOB = 'MANAGER';

--같은 컬럼에 여러개의 값을 조회할 때
--IN() : 같은 컬럼에서 여러개 조회;
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
--    셀렉트 절
--    SELECT * FROM DUAL
--FROM
--    프롬절
--    SELECT * FROM DUAL
--WHERE
--    웨어절은 항시 TRUE일때만 수행 한다.
--    1=1 : QUERY를 개발 할 때 매우 유용하다.
--    1=1 : 보안취약점 점검 대상이다. 운용할 때는 사용 ㅡㅁ지이다.
--    SELECT * FROM DUAL

--==================================================================

-- 구간 연산
-- FROM ~ TO 연산
-- < > , <= >=
-- 등호 연산 하세요.
-- 급여가 1000에서 1500사이인 사원을 조회
SELECT A.* FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL >= 1000
AND A.SAL <= 1500;

-- 급여가 1000 초과이고 1500미만인 사원을 조회 
SELECT A.* FROM SCOTT.EMP A 
WHERE 1=1
AND A.SAL > 1000
AND A.SAL < 1500;

-- 급여가 1000미만 이거나 1500 초과인 사원을 조회 
SELECT A.* FROM SCOTT.EMP A 
WHERE 1=1
AND A.SAL > 1000
OR A.SAL < 1500;

-- 구간연산, FROM ~ TO 연산
SELECT A.*FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL >=1000
AND A.SAL <=1500;
-- BETWEEN A AND B
-- 특정 컬럼의 데이터 값이 하한값(A)와 상한값(B)사이에 포함된 로우를 검색
SELECT A.*FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 1000 AND 1500;

SELECT A.*FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL NOT BETWEEN 1000 AND 1500;

--1982년에 입사한 사원 출력하기
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

--NVL()함수
--오라클에서는 NULL 키워드이다.
SELECT NULL FROM DUAL;
SELECT NULL +1 FROM DUAL;
SELECT A.* FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM +1 AS COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NOT NULL;
SELECT A.COMM+1 FROM SCOTT.EMP A WHERE COMM IS NOT NULL;

--NVL(첫번째 매개 변수, 두번쨰매개변수)
-- 첫번째 매개변수의 결과를 두번째매개변수로 바꾸세요
-- NVL(NULL,0)
-- 첫번쨰 매개변수가 NULL이면 0으로 바꿔주세요.
SELECT NVL(NULL, 0) FROM DUAL;
SELECT NVL(NULL, 0) +1 FROM DUAL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM, 0)COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM,0) +1 COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
        
-- 산술연산자 +,-,*,/
SELECT    A.ENAME  AS "사원 이름"
         ,A.SAL    AS "급여"
         ,A.SAL*12 AS "연봉"
FROM    SCOTT.EMP A;

SELECT    A.ENAME        AS "사원 이름"
         ,A.SAL          AS 급여
         ,A.SAL*12       AS 연봉
         ,NVL(A.COMM, 0) AS 상여금
FROM    SCOTT.EMP A;

SELECT    A.ENAME           AS "사원 이름"
         ,A.SAL             AS 급여
         ,A.SAL*12          AS 연봉
         ,NVL(A.COMM, 0)    AS 상여금
         ,A.SAL*12 + A.COMM   AS "상여금포함한 연봉"
FROM    SCOTT.EMP A;

SELECT    A.ENAME           AS "사원 이름"
         ,A.SAL             AS 급여
         ,A.SAL*12          AS 연봉
         ,NVL(A.COMM, 0)    AS 상여금
         ,A.SAL*12 + NVL(A.COMM,0)   AS "상여금포함한 연봉"
FROM    SCOTT.EMP A;

1.
--모든사원 급여 300 원 인상
--산원 이름 급여 인상된 급여

SELECT  A.ENAME                 AS "사원 이름"
       ,NVL(A.SAL, 0)           AS "기존 급여"
       ,NVL(A.SAL, 0 )+300      AS "인상된 급여"
FROM SCOTT.EMP A;

--2. 사원 이름 급여 연간 총수입을 총수입ㄷ이 많은 순서대로 출력;
SELECT  A.ENAME                      AS "사원 이름"
       ,NVL(A.SAL, 0)                AS "기존 급여"
       ,NVL(A.SAL, 0 ) * 12 + 100    AS "연간 총수입"
FROM SCOTT.EMP A ORDER BY 3 DESC;

--3. 급여가 2000을 넘는 사원 이름과 급여를 급여가많은 것부터 작은 순으로 출력하시오.
SELECT  A.ENAME     AS "사원 이름"
       ,A.SAL       AS "급여"
FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL > 2000
ORDER BY 2 DESC;

--4. 사원 번호가 7788인 사원의 이름과 부서번호를 출력하시오.
SELECT  A.ENAME   AS "사원이름"
        ,A.EMPNO AS"사원번호"
      ,A.DEPTNO  AS "부서번호"      
FROM SCOTT.EMP A
WHERE A.EMPNO=7788;

--5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를출력
SELECT A.ENAME  AS "사원이름"
     , A.SAL    AS "급여"
FROM SCOTT.EMP A
WHERE 1=1
AND A.SAL NOT BETWEEN 2000 AND 3000
ORDER BY SAL;

--6. 1981년2월20일부터 5월1일 사이에 입사한 사원 이름 담당 업무 입사일 출력
SELECT A.ENAME  AS "사원이름"
      ,A.JOB    AS "담당업무"
      ,A.HIREDATE AS "입사일"
FROM SCOTT.EMP A
WHERE 1=1
AND     TO_CHAR(TO_DATE(A.HIREDATE),'YYYYMMDD') 
        >= TO_CHAR(TO_DATE('1981/02/20'),'YYYYMMDD')
AND     TO_CHAR(TO_DATE(A.HIREDATE),'YYYYMMDD')
        <= TO_CHAR(TO_DATE('1981/05/01'),'YYYYMMDD');

--7. 부서번호가 20및 30에 속한 사원의 이름과 부서번호를 출력하되 내림차순으로 영문순
SELECT  A.ENAME  AS "사원이름"
       ,A.DEPTNO    AS "담당부서"
FROM SCOTT.EMP A
WHERE A.DEPTNO IN (20,30)
ORDER BY 1 DESC;

--8. 사원급여 2000에서 3000사이 포함 부서번호가 20또는 30인 사원의 이름 급여와 부서번호를 출력 이름 오름차순
SELECT A.ENAME      AS "사원이름"
      ,A.DEPTNO     AS "부서번호"
      ,A.SAL        AS "급여"
FROM SCOTT.EMP A
WHERE A.SAL BETWEEN '2000' AND '3000' 
AND A.DEPTNO IN(20,30)
ORDER BY 1 ;

SELECT 
        A.ENAME      AS "사원이름"
       ,A.SAL        AS "급여"
       ,A.DEPTNO     AS "부서번호"       
FROM    SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 2000 AND 3000 
AND (DEPTNO =30 OR DEPTNO =20)
ORDER BY 1;


--9. 1981 입사한 사원의 이름과 입사일 출력
SELECT A.ENAME  AS "사원이름"
      ,A.HIREDATE AS "입사일"
FROM SCOTT.EMP A
WHERE TO_CHAR(TO_DATE(A.HIREDATE),'YYYY') LIKE '%81';

--10
SELECT A.ENAME, A.JOB 
FROM SCOTT.EMP A
WHERE MGR IS NULL;

--11 
SELECT  A.ENAME   AS "사원 이름"
       ,A.SAL     AS "급여"
       ,A.COMM    AS "상여금"
FROM SCOTT.EMP A
WHERE  A.COMM IS NOT NULL
ORDER BY 2 DESC,3 DESC;

12
SELECT A.ENAME AS "사원이름"
FROM SCOTT.EMP A
WHERE A.ENAME LIKE '__R%';


13
SELECT A.ENAME AS "사원이름"
FROM SCOTT.EMP A
WHERE A.ENAME LIKE '%A%' AND A.ENAME LIKE '%E%';


--14---
SELECT
     A.ENAME AS "사원이름"
    ,A.JOB AS "담당업무"
    ,NVL(A.SAL,0) AS "급여"
FROM SCOTT.EMP A
WHERE A.JOB IN ('CLERK','SALESMAN') 
AND A.SAL NOT IN(1600,950,1300); 


15
SELECT A.ENAME          AS "사원이름"
      ,NVL(A.COMM,0)    AS "상여금"
FROM   SCOTT.EMP A
WHERE  A.COMM >= 500;
