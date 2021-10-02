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

--테이블 있는  ROW 수를 구하는 함수 : COUNT() 
--카운트 함수의 아규먼트를 사용하는 규칙 
--1. PK 컬럼을 사용한다. 
--2. PK 컬럼이 없을 때는 NOT NULL 컬럼을 사용한다. 
SELECT COUNT(A.EMPNO) FROM SCOTT.EMP A 
WHERE A.DEPTNO = 10
OR    A.JOB = 'MANAGER';


--같은 컬럼에 여러개의 값을 조회할 때 
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
--    셀렉트 절 
--    SEELCT * FROM DUAL
--FROM 
--    프롬 절 
--    SELECT * FROM DUAL
--WHERE 
--    웨어 절 은 항시(항상) TRUE 일 때만 수행 된다. 
--    1=1 : 쿼리를 개발 할 때 매우 유용하다. 
--    1=1 : 보안취약점 점검 대상이다. 운용할 때는 사용 금지 이다. 
--    SELECT * FROM DUAL 
--##################################################

-- 구간 연산 
-- FROM ~ TO 연산
-- < >, <= >=
-- 등호 연산 하세요 
-- 급여가 1000에서 1500사이인 사원을 조회 
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

-- 급여가 1000미만 이거나 1500 초과인 사원을 조회 

--최세라 지문 
-- 1000 초과 이거나 1500 미만인 사원을 조회
SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND    A.SAL > 1000
AND    A.SAL < 1500;

-- 오재영 쿼리 
-- 급여가 1000미만 이거나 1500 초과인 사원을 조회 
SELECT A.* FROM SCOTT.EMP A
WHERE  1=1
AND A.SAL < 1000
OR  A.SAL > 1500;

-- 구간 연산, FROM  ~ TO 연산 
-- BETWEEN A AND B 
-- 특정 컬럼의 데이터 값이 하한값(A)와 상한값(B) 사이에 포함된 로우를 검색
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

-- 1981년에 입사한 사원 출력하기 
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


-- NVL() 함수 
-- 오라클에서 NULL 키워드 이다. 
SELECT NULL FROM DUAL;
SELECT NULL + 1 FROM DUAL;
SELECT A.* FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM + 1 AS COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NOT NULL;
SELECT A.COMM + 1 FROM SCOTT.EMP A WHERE COMM IS NOT NULL;


-- NVL(첫번째매개변수, 두번째매개변수)
-- 첫번째매개변수의 결과를 두번째매개변수로 바꾸세요 
-- NVL(NULL, 0)
-- 첫번째매개변수가 NULL 이면 0 으로 바꾸세요 
SELECT NVL(NULL, 0) FROM DUAL;
SELECT NVL(NULL, 0) + 1 AS AA FROM DUAL;
SELECT A.COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM, 0) COMM FROM SCOTT.EMP A WHERE COMM IS NULL;
SELECT NVL(A.COMM, 0) + 1 COMM FROM SCOTT.EMP A WHERE COMM IS NULL;


-- 산술연산자 +, -, *, /
SELECT A.ENAME    AS "사원 이름"
      ,A.SAL      AS "급여"
      ,A.SAL*12   AS "연봉"
FROM   SCOTT.EMP A;

SELECT A.ENAME            AS "사원 이름"
      ,A.SAL              AS 급여 
      ,A.SAL*12           AS 연봉
      ,A.COMM             AS 상여금 
      ,NVL(A.COMM, 0)     AS 상여금 
FROM   SCOTT.EMP A;

SELECT A.ENAME             AS "사원 이름"
      ,A.SAL               AS 급여
      ,A.SAL*12            AS 연봉
      ,A.COMM              AS 상여금 
      ,A.SAL*12 + A.COMM   AS "상여금포함한 연봉"
FROM   SCOTT.EMP A;

SELECT A.ENAME                      AS "사원 이름"      
      ,A.SAL                        AS 급여
      ,A.SAL*12                     AS 연봉
      ,A.COMM                       AS 상여금 
      ,A.SAL*12 + NVL(A.COMM, 0)    AS "상여금포함한 연봉"
FROM   SCOTT.EMP A;

--###################################
-- 연습문제 
--1. + 연산자을 사용해서 모든 사원에 대해서 급여 300원을 인상한다. 
--   사원의 이름, 급여, 인상된 급여를 출력하시오 
--   사원 테이블에서 
SELECT 
        A.ENAME             "사원이름"
       ,NVL(A.SAL, 0)       "급여"
       ,NVL(A.SAL, 0) + 300 "인상된 급여"
FROM   SCOTT.EMP A;        

--2. 사원의 이름, 급여, 연간 총수입을 총수입이 많은 것부터 작은순으로 출력하시오 
--   연간 총수입은 월급에 12곱한 후 100의 상여금을 더해서 계산하시오 
SELECT 
        A.ENAME                "사원이름"
       ,NVL(A.SAL, 0)          "급여"
       ,NVL(A.SAL, 0)*12 + 100 "연간 총수입"
FROM   SCOTT.EMP A
ORDER BY NVL(A.SAL, 0)*12 + 100 DESC;

--3. 급여가 2000을 넘는 사원의 이름과 급여를 급여가 많은 것부터 작은 순으로 출력하시오 
SELECT 
        A.ENAME                "사원이름"
       ,NVL(A.SAL, 0)          "급여"       
FROM   SCOTT.EMP A
WHERE  1=1
AND    A.SAL > 2000
ORDER BY NVL(A.SAL, 0) DESC;

SELECT 
        A.ENAME                "사원이름"
       ,NVL(A.SAL, 0)          "급여"       
FROM   SCOTT.EMP A
WHERE  1=1
AND    A.SAL > 2000
ORDER BY 2 DESC;

--4. 사원번호가 7788인 사원의 이름과 부서번호를 출력 하시오 
SELECT 
        A.ENAME  AS "사원의 이름", 
        A.DEPTNO AS "부서번호" 
FROM SCOTT.EMP A
WHERE 1=1
AND A.EMPNO = '7788';

SELECT 
        A.ENAME  AS "사원의 이름", 
        A.DEPTNO AS "부서번호" 
FROM SCOTT.EMP A
WHERE 1=1
AND A.EMPNO = 7788;

--5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력하시오 
SELECT
         A.ENAME     "사원이름"
        ,A.SAL       "급여"
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
         A.ENAME     "사원이름"
        ,A.SAL          "급여"
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
         A.ENAME     "사원이름"
        ,A.SAL          "급여"
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

--6. 1981년2월20일 부터 1981년5월1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오 
SELECT   A.ENAME         "사원 이름"
        ,A.JOB           "담당업무"
        ,A.HIREDATE      "입사일"
FROM    SCOTT.EMP A
WHERE   1=1
AND     A.HIREDATE >= TO_CHAR(TO_DATE('1981/02/20'), 'YYYYMMDD') 
AND     A.HIREDATE <= TO_CHAR(TO_DATE('1981/05/01'), 'YYYYMMDD');


SELECT   A.ENAME         "사원 이름"
        ,A.JOB           "담당업무"
        ,A.HIREDATE      "입사일"
FROM    SCOTT.EMP A
WHERE   1=1
AND     TO_CHAR(TO_DATE(A.HIREDATE), 'YYYYMMDD')  
        >= TO_CHAR(TO_DATE('1981/02/20'), 'YYYYMMDD') 
AND      TO_CHAR(TO_DATE(A.HIREDATE), 'YYYYMMDD')  
        <= TO_CHAR(TO_DATE('1981/05/01'), 'YYYYMMDD');

--7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력하되
--   이름을 기준으로(내림차순)으로 영문순으로 출력하시오 
SELECT
          A.ENAME	"사원이름"
         ,A.DEPTNO	"부서번호"
FROM     SCOTT.EMP A
WHERE    1=1
AND      A.DEPTNO = 20 OR A.DEPTNO = 30
ORDER BY A.ENAME DESC;

SELECT
          A.ENAME	"사원이름"
         ,A.DEPTNO	"부서번호"
FROM     SCOTT.EMP A
WHERE    1=1
AND      A.DEPTNO IN (20, 30)
ORDER BY 1 DESC;

--8. 사원의 급여가 2000에서 3000사이에 포함되고 
--   부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력하되 
--   이름순(오름차순)으로 출력하시오 
SELECT 
        A.ENAME      AS "사원이름"
       ,A.SAL        AS "급여"
       ,A.DEPTNO     AS "부서번호"       
FROM    SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 2000 AND 3000 
AND DEPTNO =30  OR DEPTNO =20 
ORDER BY 1;

SELECT 
        A.ENAME      AS "사원이름"
       ,A.SAL        AS "급여"
       ,A.DEPTNO     AS "부서번호"       
FROM    SCOTT.EMP A
WHERE 1=1
AND A.SAL BETWEEN 2000 AND 3000 
AND A.DEPTNO IN (20, 30)
ORDER BY 1;

--9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오 
--   단. LIKE 연산자와 와일드카드 사용하기 
SELECT
        A.ENAME       AS "사원이름",
        A.HIREDATE    AS"입사일"
FROM    SCOTT.EMP A
WHERE A.HIREDATE LIKE '%81%';

--10. 관리자(상사가 없는)가 없는 사원의 이름과 담당업무를 출력하시오 
SELECT  
        A.ENAME AS  "사원", 
        A.JOB   AS  "업무"
FROM    SCOTT.EMP A
WHERE   MGR IS NULL;


--11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되
--    급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오 
SELECT  
        A.ENAME     AS 이름,
        A.SAL       AS 급여,
        A.COMM      AS 커미션
FROM    SCOTT.EMP A
WHERE   A.COMM IS NOT NULL
ORDER BY 2 DESC,3 DESC;

SELECT  
        A.ENAME     AS 이름,
        A.SAL       AS 급여,
        A.COMM      AS 커미션
FROM    SCOTT.EMP A
WHERE   A.COMM IS NOT NULL
ORDER BY 2 DESC, 3 DESC;

--ALLEN	1600	300
--TURNER	1500	0
--MARTIN	1250	1400
--WARD	1250	500

--###############################
SELECT  
        A.ENAME     AS 이름,
        A.SAL       AS 급여,
        A.COMM      AS 커미션
FROM    SCOTT.EMP A
WHERE   A.COMM IS NOT NULL
ORDER BY 2, 3 DESC;

--MARTIN	1250	1400
--WARD	1250	500
--TURNER	1500	0
--ALLEN	1600	300
--###############################


--12. 이름의 세 번째 문자가 R인 사원의 이름을 표시 하시오 
SELECT 
        A.ENAME AS "이름"
FROM    SCOTT.EMP A
WHERE   1=1
AND A.ENAME LIKE '__R%';

--13. 이름에 A와 E를 포함하고 있는 사원의 이름을 표시 하시오 
SELECT 
        A.ENAME "사원명"
FROM    SCOTT.EMP A
WHERE   A.ENAME LIKE '%A%'
AND     A.ENAME LIKE '%E%';


--14. 담당업무가 사무원(CLERK) 또는 영업사원(SALESMAN) 이면서 
--    급여가 1600, 950 또는 1300 아닌 사원의 이름, 담당 업무, 급여를 출력하시오
SELECT 
        A.ENAME      "사원 이름"
       ,A.JOB        "담당업무"
       ,A.SAL       "급여"
FROM    SCOTT.EMP A
WHERE 1=1
AND  (A.JOB = 'CLERK' OR  A.JOB = 'SALESMAN') 
AND NOT (A.SAL  = '1600' OR  A.SAL = '950' OR A.SAL  = '1300');

SELECT 
        A.ENAME      "사원 이름"
       ,A.JOB        "담당업무"
       ,A.SAL       "급여"
FROM    SCOTT.EMP A
WHERE   1=1
AND     A.JOB IN ('CLERK', 'SALESMAN') 
AND     A.SAL NOT IN (1600, 950, 1300);

--15. 커미션 500 이상인 사원의 이름, 급여 및 커미션을 출력하시오  
SELECT
        NVL(A.SAL, 0)	"담당업무"
        ,A.COMM		    "커미션"
FROM	SCOTT.EMP A
WHERE	1=1
AND NVL(A.COMM, 0) >= 500;

