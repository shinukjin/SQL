-- 해당 계정에 속해있는 테이블을 조회
-- 스코트 계정에 BOUNS, DEPT, EMP, SALGRADE 테이블이 있다. 
SELECT * FROM TAB;
--TNAME       TABTYPE   CLUSTERID
--BONUS	     TABLE	
--DEPT	    TABLE	
--EMP	        TABLE	
--SALGRADE	TABLE	

-- 해당 계정에 속해있는 ROW 수를 COUNT():카운드함수로 조회
-- scott 계정에 테이블이 4개 있다. 
SELECT * FROM TAB; -- low 갯수 카운팅

--DESC : DESCRIBE : 테이블의 구조 확인 
-- 테이블의 컬럼명, NULL 여부,  데이터 타입 알 수 있다. 
DESC EMP;
/*
이름        널?       유형           
--------- -------- ------------ 
TNAME     NOT NULL VARCHAR2(30) 
TABTYPE            VARCHAR2(7)  
CLUSTERID          NUMBER  
*/

DESC EMP;
/*
이름       널?       유형           
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
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/

SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.EMP;

-- 쿼리 연습 
--1. 사원 테이블에서 사원 전체를 조회하시오 
-- 단문 쿼리문 
SELECT * FROM SCOTT.EMP;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM SCOTT.EMP;

-- A는 SCOTT.EMP 테이블 앨리어스 : 자바에서 참조변수하고 비슷한다. 
SELECT A.EMPNO, A.ENAME, A.JOB, A.MGR, A.HIREDATE, A.SAL, A.COMM, A.DEPTNO FROM SCOTT.EMP A;

-- AS 키워드를 이용해서 컬럼 앨리어스 사용하기, AS 생략 가능 
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

-- 컬럼 및 테이블 설명하기(무슨 컬럼을 의미하는지 주석달기)
SELECT   A.EMPNO      AS EMPNO      -- 사원번호
        ,A.ENAME      AS ENAME      -- 사원이름
        ,A.JOB        AS JOB        -- 업무명
        ,A.MGR        AS MGR        -- 해당사원의 상사 사원번호
        ,A.HIREDATE   AS HIREDATE   -- 입사일
        ,A.SAL        AS SAL        -- 급여
        ,A.COMM       AS COMM       -- 커미션 : 상여금
        ,A.DEPTNO     AS DEPTNO     -- 부서번호
FROM     EMP A;               -- 사원 테이블 


--2. 부서 테이블에서 부서 전체를 조회 하시오 
-- 테이블 앨리어스, 컬럼 앨리어스 사용하기 AS 생략 
SELECT 
       A.DEPTNO  DEPTNO
      ,A.DNAME   DNAME
      ,A.LOC     LOC
FROM   DEPT A;

--3. 급여등급 테이블에서 데이터 전체를 조회 하시오
-- 테이블 앨리어스, 컬럼 앨리어스 사용하기 AS 생략 
SELECT 
        A.GRADE  GRADE
       ,A.HISAL  HISAL
       ,A.LOSAL  LOSAL
FROM   SCOTT.SALGRADE A;

--4. 사원테이블에서 사원번호, 사원이름, 입사일, 급여를 조회 하시오 
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

[] : 브라켓 : 있어도 되고 없어도 무방 
{} : 브레이스 : 배열 표시, 순차로 표시 됨 
* : 풀 스캔 : full scan : 테이블 전컬럼에 전체로우 조회 
| : or 연산자 
column ..... : 컬럼을 순차적으로 명시하기 
[alias] : 사용해도 되고, 않해도 되고

SELECT 키워드 : 조회 키워드 
DISTINCT 키워드 : 해당 컬럼에 중복되는 ROW가 있으면 않된다. 
FROM 키워드 : 테이블 이름을 순차적으로 명기
WHERE : 조회하고자 하는 ROW의 조건을 명기
GROUP BY : 동일한 값으로 로우를 그룹으로 묶는 조건 
HAVING : GROUP BY의 조건 절 : GROUP BY 밑에서만 사용하기 
ORDER BY : 순차 표시 : 오름차순, 내림차순 표시
*/


--#########################################
-- 정렬 : SORT 
--#########################################
--SELECT문으로 조회된 데이터를(조회된 컬럼, 검색된 데이터)를 오름차순, 내림차순으로 정력하는 것
--오라클 조회는 오름차순이 디폴트
SELECT A.EMPNO FROM SCOTT.EMP A;
--오름차순 : Ascending : 작은 값부터 큰 값 쪽으로 
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY A.EMPNO ASC;
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY 1 ASC;
--내림차순 : Descending : 큰 값부터 작은 값 쪽으로 
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY A.EMPNO DESC;
SELECT A.EMPNO FROM SCOTT.EMP A ORDER BY 1 DESC;

-- 오라클 배열에서는 1 부터 인덱스가 시작한다. 
--컬럼인덱스 1 : A.ENAME
--컬럼인텍스 2 : A.EMPNO 
--컬럼인텍스 3 : A.HIREDATE 
--컬럼인텍스 4 : A.COMM 
SELECT A.ENAME, A.EMPNO, A.HIREDATE, A.COMM FROM SCOTT.EMP A
ORDER BY 2; -- A.EMPNO 로 ASC 으로 조회 하시오 

-- NULL 컬럼 조회 주의할 것 
SELECT A.COMM FROM SCOTT.EMP A ORDER BY 1;
SELECT A.COMM FROM SCOTT.EMP A ORDER BY 1 DESC;

--#########################################
-- DISTINCT : 중복 제거하는 키워드 
--#########################################
SELECT A.DEPTNO FROM SCOTT.EMP A;
SELECT DISTINCT A.DEPTNO FROM SCOTT.EMP A;
SELECT DISTINCT A.DEPTNO FROM SCOTT.EMP A ORDER BY 1;
SELECT DISTINCT A.DEPTNO FROM SCOTT.EMP A ORDER BY 1 DESC;

--#########################################
-- WHERE : 조건 : condition 
--#########################################
SELECT A.* FROM SCOTT.EMP A;

--SMITH의 사원정보를 보고 싶다. 
SELECT A.* FROM SCOTT.EMP A 
WHERE A.ENAME = 'SMITH'; -- VARCHAR2 : 문자 검색 
--WHERE SCOTT.EMP.ENAME = 'SMITH';

--사원번호가 7369 인 사원정보를 보고 싶다. 
--오라클에서 문자는  '' 로 변환한다. 
SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO = 7369;
SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO = '7369';
--SELECT * FROM SCOTT.EMP A
--WHERE A.EMPNO = "7369";

-- NULL 데이터 
-- IS NULL : NULL 컬럼이 있는데 데이터 조회 
SELECT A.COMM FROM SCOTT.EMP A
WHERE A.COMM IS NULL;
--WHERE A.COMM = NULL;
-- IS NOT NULL : NUMM 컬림이 없는 데이터 조회 
SELECT A.COMM FROM SCOTT.EMP A
WHERE A.COMM IS NOT NULL;

-- LIKE 연산자와 %(와일드카드) 검색, 조회
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE 'S%'; -- ENAME 컬럼에서 문자 S 로 시작하는 컬럼을 조회 하시오 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '%S%'; -- ENAME 컬럼에서 문자 S 가 포함된 컬럼을 조회 하시오 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '%S'; -- ENAME 컬럼에서 문자 S 로 끝나는 컬럼을 조회 하시오 

-- 오라클은 대소문자 구별한다. 
SELECT A.* FROM SCOTT.EMP A
WHERE ENAME LIKE 's%'; -- ENAME 컬럼에서 문자 s 로 시작하는 컬럼을 조회 하시오 

SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO LIKE '7%'; -- EMPNO 컬럼에서 문자 7 로 시작하는 컬럼을 조회 하시오 
-- SELECT A.* FROM SCOTT.EMP A
-- WHERE A.EMPNO LIKE 7%;
SELECT A.* FROM SCOTT.EMP A
WHERE A.EMPNO LIKE '%9%'; -- EMPNO 컬럼에서 문자 9가 포함된 컬럼을 조회 하시오 

-- LIKE 연산자와 _(와일드카드) 검색, 조회
-- _ : 언더스코어(언더바)는 문자 한개를 표현한다. 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '_A%'; -- 두번째 문자가 A 인것을 검색 하시오 
SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME LIKE '__A%'; -- 세번째 문자가 A 인것을 검색 하시오 

SELECT A.* FROM SCOTT.EMP A
WHERE A.ENAME NOT LIKE '%A%'; -- ENAME에 A 문자가 포함않된 컬럼 검색 


-- DUAL 테이블 (듀얼 테이블): 오라클에만 있는 테스트 테이블 이다. 컬럼 DUMMY(더미 컬럼) 한개 있는 테이블 
SELECT 1 FROM DUAL;
SELECT 1 + 2 FROM DUAL;
SELECT LENGTH(1234) FROM DUAL;
SELECT LENGTH('1234') FROM DUAL;
SELECT SYSDATE FROM DUAL; -- 자바에서 new Data() 같은 것 
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL; -- 자바에서 SimpleDateFormat
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL; -- 자바에서 SimpleDateFormat
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL; -- 자바에서 SimpleDateFormat
SELECT TO_CHAR(SYSDATE, 'YYYY.MM.DD') FROM DUAL; -- 자바에서 SimpleDateFormat
SELECT '20210802' FROM DUAL; -- 우리는 오늘날짜를 표기 했는데 오라클 옵티마이저는 문자숫자로 본다. '20210802'
SELECT TO_DATE('20210802') FROM DUAL; -- 문자숫자 '20210802' --> 날짜 형식으로 바꾸는 함수 : TO_DATE() 함수
SELECT TO_DATE('20210802', 'YYYY-MM-DD') FROM DUAL; 
SELECT TO_DATE('20210802', 'YYYY.MM.DD') FROM DUAL; 

-- 문자열 날짜형식을 바꿀 때에는 
-- 먼저 문자열 날짜형식을 TO_DATE() 함수로 날짜 데이터 타입으로 변환하고 : TO_DATE('20210802')
-- 변환된 날짜 데이터를 TO_CHAR() 함수를 이용해서 문자열 날짜형식으로 변환 한다. :  TO_CHAR('21/08/02', 'YYYY.MM.DD')
SELECT TO_CHAR(TO_DATE('20210802'), 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('20210802'), 'YYYY.MM.DD') FROM DUAL;

-- 날짜 데이터 조회 
-- 1981년1월1일 이전에 입사한 사원을 출력 
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
-- 조건이 여러개 일 때는 
-- 각 조건별로 조회 한 후 
-- 그 조건을 합쳐서 쿼리문을 만든다. 
SELECT * FROM SCOTT.EMP A WHERE A.DEPTNO = 10; 
SELECT * FROM SCOTT.EMP A WHERE  A.JOB = 'MANAGER'; 

SELECT A.* FROM SCOTT.EMP A
WHERE A.DEPTNO = 10
AND   A.JOB = 'MANAGER';







