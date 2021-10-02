join swj00;
SELECT * FROM TAB;
SHOW USER;
-- 테이블에 있는 ROW 의 수를 구하는 함수 ?? 
-- 테이블에 있는 레코드의 수를 구하는 함수 
-- * : 아스타리스크, 별풍선 : FULL SCAN 
-- 테이블의  ROW * COLUMN 전체를 읽는 
-- 14 * 8 = 112
-- 14 * 1 = 14
SELECT COUNT(*) FROM TAB;
SELECT COUNT(TNAME) FROM TAB;

SELECT * FROM EMP;
SELECT * FROM DEPT;
-- COUNT(컬럼 : NOT NULL 또는 PK )
SELECT COUNT(EMPNO) FROM EMP;

SELECT COUNT(NULL) FROM DUAL;
SELECT COUNT(COMM) FROM EMP;
SELECT COUNT(COMM) FROM EMP WHERE COMM IS NOT NULL;
SELECT COUNT(COMM) FROM EMP WHERE COMM IS NULL;
SELECT COUNT(NVL(COMM, 0)) FROM EMP WHERE COMM IS NULL;
SELECT COUNT(NVL(COMM, 0)) FROM EMP;
SELECT COUNT(EMPNO) FROM EMP;

--오라클 옵티마이저가 테이블에 있는 로우수를 어떻게 알 까 ?

-- ROWNUM 키워드 : 데이터 타입
-- 쿼리에 추출된 각 행의 부여되는 일련번호
-- 퀴리 추출 값을 1부터 시작하며 순차 값으로 할당 

-- ROWID 키워드 : 데이터 타입 
-- 테이블 내 행의 위치를 지정하는 논리적인 값 
-- 테이터베이스 전체에서 중복되지 않는 유일한 값
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
AAAR3s : 데이터의 오브젝트 번호
AAE : 테이터 파일 번호
AAAACX : 테이터 블럭 번호 
AAA : 블럭내의 행 번호 
*/

SELECT ROWNUM, ROWID, EMPNO FROM EMP;

-- 사원테이블에서 5건 조회 해 주세요 
SELECT ROWNUM, ROWID, EMPNO FROM EMP 
WHERE ROWNUM <= 5;

SELECT ROWNUM, ROWID, HIREDATE FROM EMP;

-- 입사일이 빠른순서로 사원 5명을 조회 하시오 
SELECT ROWNUM, ROWID, HIREDATE 
FROM EMP
WHERE ROWNUM <= 5
ORDER BY HIREDATE;

SELECT ROWNUM, ROWID, HIREDATE 
FROM EMP
WHERE ROWNUM <= 6
ORDER BY HIREDATE;

--SELECT : 셀렉트 절 
--    SELECT * FROM DUAL; : 스칼라 서브쿼리 : 셀렉트 절에 SELECT 구문을 사용하는 것 
--FROM : 프럼 절 
--    SELECT * FROM DUAL; : 인라인 뷰 서브쿼리 : 프럼 절에 SELECT 구문을 사용하는 것
--      인라인 뷰 서브쿼리를 사용하는 이유는 
--      테이블에 있는 전체 데이터를 사용하지 않고 
--      그 조건에 필요한 컬럼만 먼저 추출해서 사용하기 위해서 
--      파일의 크기를 줄이기 위해서 사용하는 것 
--      INLINE VIEW SUBQUERY 는 INNSER JOIN 효과가 있다. 
--WHERE : 웨어 절 
--    SELECT * FROM DUAL; : 서브쿼리 : 웨어 절에 SELECT 구문을 사용하는 것

-- 입사일 빠른 순서로 5건을 구하기 위해서
-- 먼저 입사일 순서대로 소트를 한다. 
-- 소트된 레코드에서 5건을 조회한다. 
SELECT  A.HIREDATE 
FROM    (SELECT * FROM EMP AA ORDER BY HIREDATE) A
WHERE   ROWNUM <= 5;

SELECT  A.HIREDATE 
FROM    (SELECT AA.HIREDATE FROM EMP AA ORDER BY HIREDATE) A
WHERE   ROWNUM <= 5;

--####################################################
--조인 : 테이블을 합치는 것 : 여러개의 테이블을 관계 키를 가지고 합치는 것 
--      꼭 관계키가 없어도 합칠 수 있다. 
--EQUI JOIN 이퀴조인, EQUAL JOIN 이퀄조인 : INNSER JOIN 이너조인
--NOT-EQUI JOIN 낫 이키조인
--SELF JOIN 셀프 조인
--OUTER JOIN 아우터 조인 

--테이블을 합치는 것은  조인 
--FROM 절에 테이블 명을 순차적으로 나열하면 된다. : 테이블 드라이빙 

--조인 : 관계형 데이터베이스 하는 것  : Relation Database 
--원래는 하나의 테이블로 존재하는 데이터들을 
--어떤 목적에 의해서 그 테이블에 있는 데이터를 나누어서 다른 테이블에 저장하는데
--이 때 목적에 의해서 관계키를 설정하는 경우도 있고 설정하지 않는 경우도 있다. 
--여러개의 테이블로 나누어서 적재 데이트를 내가 사용하려고(조회)하려고 할 때 
--사용하는 기법이 조인이다. 

--CROSS JOIN 
--하나의 테이블에 있는 어떠한 컬럼도 조인할 테이블의 어떤 컬럼에 직접적으로 일치하지 않을 때 사용, 
--ORACLE 9 에서는 CROSS JOIN, 
--ORACLE 9 이전에는 Cartesian : 카디시안 : 카르테시안 조인 
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

--EQUI JOIN : 이키 조인, EQUAL JOIN : 이퀄조인 
--한 개의 테이블을 두 개의 별도의 테이블 처럼 사용, 
--한 개의 테이블의 행들을 같은 테이블의 행들과 조인한다, 
--동일 컬럼 기준으로 조인

--###############################################
-- INNSER JOIN : 이너조인 
-- 연산자 = 사용해서 각 테이블에서 동일한 컬럼을 매칭해서 조회하는 것  

-- 이너 조인은 테이블에 있는 모든 데이터를 조회 할 수가 없다.
-- 컬럼에 데이터가 매칭이되지 않으면 데이터를 조회할 수가 없다.
<-- 이 조건을 충족하는 조인이 OUTER JOIN 아우터 조인 이다. 
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

-- 스미스 사원의 부서이름을 알려주세요
SELECT A.ENAME, A.DEPTNO FROM EMP A WHERE A.ENAME = 'SMITH';
SELECT A.DNAME, A.DEPTNO FROM DEPT A WHERE A.DEPTNO = 20;

SELECT A.ENAME, A.DEPTNO, B.DNAME
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND   A.ENAME = 'SMITH';

-- 스미스 사원의 부서이름, 부서의 지역명을 알려주세요
SELECT A.ENAME, A.DEPTNO FROM EMP A WHERE A.ENAME = 'SMITH';
SELECT A.DNAME, A.LOC, A.DEPTNO FROM DEPT A WHERE A.DEPTNO = 20;

SELECT A.ENAME, A.DEPTNO, B.DNAME, B.LOC
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND   A.ENAME = 'SMITH';

--OUTEER JOIN
--2개 이상의 테이블 어느 한쪽 테이블에는 해당하는 데이터가 존재하는데 
--다른 테이블에 데이터가 존재하지 않는 경우 
--그 데이터를 출력하기 위한 조인, 
--데이터가 존재하지 않는 쪽 테이블에 (+)기호를 정의하면 
--데이터가 존재하든, 하지않든 테이블의 모든 데이터 출력, 
--조인 조건에 만족하지 않는 행도 출력

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

--NOT-EQUI JOIN 낫 이키조인, NOT EQUAL JOIN
--동일 컬럼이 없이 다른 조건을 사용하여 조인

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

SELECT  A.ENAME || '의 매니저' || B.ENAME || '이다'
FROM    SCOTT.EMP A, SCOTT.EMP B
WHERE   A.MGR = B.EMPNO;

-- 매니저 없는 사원은 ??
SELECT ENAME FROM SCOTT.EMP WHERE MGR IS NULL;

SELECT ENAME 
FROM   SCOTT.EMP 
WHERE  MGR IS NOT NULL;


--- ANSI (미국표준연구소) SQL : 상용 데이터베이스 시스템의 표준 언어 

--서브쿼리 
--SELECT : 셀렉트 절 
--    SELECT * FROM DUAL; : 스칼라 서브쿼리 : 셀렉트 절에 SELECT 구문을 사용하는 것 
--      일부 OUTER JOIN 효과가 있다. 
--FROM : 프럼 절 
--    SELECT * FROM DUAL; : 인라인 뷰 서브쿼리 : 프럼 절에 SELECT 구문을 사용하는 것
--      인라인 뷰 서브쿼리를 사용하는 이유는 
--      테이블에 있는 전체 데이터를 사용하지 않고 
--      그 조건에 필요한 컬럼만 먼저 추출해서 사용하기 위해서 
--      파일의 크기를 줄이기 위해서 사용하는 것 
--      INLINE VIEW SUBQUERY 는 INNSER JOIN 효과가 있다. 
--WHERE : 웨어 절 
--    SELECT * FROM DUAL; : 서브쿼리 : 웨어 절에 SELECT 구문을 사용하는 것

--서브쿼리 유형
--단일 행(Single-Row) 서브쿼리
--다중 행(Multi-Row) 서브쿼리
--다중 열(컬럼)(Multi-Column) 서브쿼리 
--인라인 뷰(Inline view) 서브쿼리
--스칼라(Scala) 서브쿼리

--단일 행(Single-Row) 서브쿼리
-- SELECT 문장에서 오직 하나의 행(값)만 반환하는 쿼리
-- 단일 행 연산자는 (=, >, >=, <, <=, <>, !=) 만 사용한다.
SELECT A.ENAME, A.JOB 
FROM   EMP A
WHERE  A.JOB = (SELECT B.JOB FROM EMP B WHERE B.EMPNO=7369)

-- SCOTT사원의 부서의 부서이름 조회 하시오 
SELECT * FROM SCOTT.EMP WHERE ENAME = 'SCOTT';

SELECT A.DNAME DNAME
FROM   DEPT A
WHERE  A.DEPTNO = (SELECT DEPTNO FROM SCOTT.EMP WHERE ENAME = 'SCOTT');

SELECT A.DNAME DNAME
FROM   DEPT A, EMP B
WHERE  A.DEPTNO = B.DEPTNO 
AND    B.ENAME = 'SCOTT';

-- SCOTT사원과 동일한 부서에서 근무하는 사원의 이름, 부서번호를 조회하시오.
SELECT A.ENAME, A.DEPTNO
FROM   EMP A
WHERE  A.DEPTNO = (SELECT DEPTNO FROM SCOTT.EMP WHERE ENAME = 'SCOTT');

-- SCOTT사원과 동일한 부서에서 근무하는 사원의 이름, 부서명, 부서번호를 조회하시오
SELECT A.ENAME, A.DEPTNO, B.DNAME
FROM   EMP A, DEPT B
WHERE  A.DEPTNO = B.DEPTNO
AND    A.DEPTNO = (SELECT DEPTNO FROM SCOTT.EMP WHERE ENAME = 'SCOTT');

-- 서브쿼리에서 그룹함수 사용한 것 MIN(), MAX(), AVG()
-- 최소급여를 받는 사원의 이름, 담당업무, 급여 조회하시오
SELECT A.ENAME, A.JOB, A.SAL
FROM   EMP A
WHERE  A.SAL = (SELECT MIN(SAL) FROM EMP);

-- 최대급여를 받는 사원의 이름, 담당업무, 급여 조회하시오
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

-- 부서별 최저급여 
SELECT DEPTNO, MIN(SAL)
FROM   EMP
GROUP BY DEPTNO;
-- 30번 부서의 최저급여
SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30;

SELECT DEPTNO, MIN(SAL)
FROM   EMP
GROUP BY DEPTNO
HAVING MIN(SAL) > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);


--다중 행(Multi-Row) 서브쿼리
--하나 이상의 행으 반환하는 서브쿼리 
--단일 행 연산자를 사용하지 못한다. 
--디중 행 연산자(IN, NOT IN, ANY, ALL, EXISTS) 만 사용한다. 

-- 부서별로 급여가 젤 많은 사원 정보 
SELECT A.EMPNO, A.ENAME, A.SAL, A.DEPTNO
FROM   EMP A
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ANY 연산자
-- 서브쿼리의 여러 결과 값 중 어느 하나의 값만 만족이 되면 행을 반환한다. 

--SALSEMAN 직업의 급여보다 많이 받는 사원의 사원명과 급여 정보를 출력하시오
SELECT ENAME, SAL, JOB, DEPTNO
FROM   EMP
WHERE  DEPTNO != 20
AND    SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

-- ALL 연산자
-- 서브쿼리의 여러 결과 값 중 모든 결과 값을 만족해야 행을 반환한다. 

--모든 SALSEMAN 직업의 급여보다 많이 받는 사원의 사원명과 급여 정보를 출력하시오
SELECT ENAME, SAL, JOB, DEPTNO
FROM   EMP
WHERE  DEPTNO != 20
AND    SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

--EXISTS 연산자
-- 서브쿼리 데이터가 존재하는가를 체크해 존재 여부(TRUE, FALSE)를 결과로 반환한다. 
-- EXISTS절에는 반드시 메인 쿼리와 연결되 되는 조인 조건을 가지고 있어야 한다.
-- 서브쿼리에서 결과 행을 찾으면, INNER QUERY 수행을 중단하고 TRUE를 반환한다. 

SELECT DISTINCT A.DEPTNO, A.DNAME
FROM   DEPT A, EMP B
WHERE  A.DEPTNO = B.DEPTNO;

SELECT A.DEPTNO, A.DNAME
FROM   DEPT A
WHERE  EXISTS (SELECT 1 FROM EMP B WHERE B.DEPTNO = A.DEPTNO);


--다중 열(컬럼)(Multi-Column) 서브쿼리 
-- 결과 값이 두 개 이상의 컬럼을 반환하는 서브쿼릴
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

--인라인 뷰(Inline view) 서브쿼리

-- 부서번호 20의 평균 급여보다 크고, 
-- 부서번호 20에 속하지 않은 관리자를 조회하시오 
SELECT B.EMPNO, B.ENAME, B.JOB, B.SAL, B.DEPTNO 
FROM   (SELECT EMPNO FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20)) A,
       EMP B
WHERE  A.EMPNO = B.EMPNO
AND    B.MGR IS NOT NULL
AND    B.DEPTNO != 20;

--스칼라(Scala) 서브쿼리
-- 한개의 로우만 반환한다.
-- 메인 쿼리에서 추출되는 데이터 건 수 만큼 수행되기 때문에 조인으로 수행 될 때보다 수행회수가 적을 수 있다.
-- 일치하는 값이 없는 경우 NULL을 반환한다.
-- 코드성 테이블에서 코드값을 조회할 때, 
-- 불필요한 조인을 하지 않기 위해 많이 사용한다.

-- 직업이 'MANAGER'인 사원의 사원명, 부서명을 조회
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


-- UNION : 합집합
SELECT DEPTNO FROM EMP
UNION
SELECT DEPTNO FROM DEPT;

-- UNION ALL : 중복포함 합집합
SELECT DEPTNO FROM EMP
UNION ALL
SELECT DEPTNO FROM DEPT;

-- INTERSECT : 교집합
SELECT DEPTNO FROM EMP
INTERSECT
SELECT DEPTNO FROM DEPT;

-- MINUS : 차집합
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





