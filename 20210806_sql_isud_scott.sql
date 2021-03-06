SHOW USER;

SELECT * FROM TAB;
SELECT * FROM DEPT;
DESC DEPT;

-- 연습용 테이블 만들기 
CREATE TABLE T1(
    T1_1 NUMBER(4) PRIMARY KEY 
   ,T1_2 VARCHAR2(20) 
);
SELECT * FROM T1;

-- 기존 테이블을 복사해서 테이블을 만드는 방법
--CREATE TABLE ~ AS 구문 사용하기 
--PK, FK 등 제약조건 및 오브젝트는 복사 되지 않는다.

--1. 컬럼 및 로우 데이터 복사하기 
--스키마 데이터 복사 
CREATE TABLE DEPT_COPY_1 
AS 
SELECT * FROM DEPT;
SELECT * FROM DEPT_COPY_1;
DESC DEPT_COPY_1;

CREATE TABLE DEPT_COPY_3 
AS 
SELECT * FROM DEPT WHERE 1=1;
SELECT * FROM DEPT_COPY_3;

--2. 컬럼만 복사하고  로우 데이터 복사하지 않음 
CREATE TABLE DEPT_COPY_2
AS 
SELECT * FROM DEPT WHERE 1=0;
SELECT * FROM DEPT_COPY_2;
DESC DEPT_COPY_2;

SELECT * FROM TAB;
SELECT COUNT(*) FROM TAB;

-- 테이블 지우기 
--DROP TABLE 테이블명 
DROP TABLE DEPT_COPY_3;
SELECT * FROM DEPT_COPY_3;


CREATE TABLE DEPT01
AS 
SELECT * FROM DEPT WHERE 1=0;
SELECT * FROM DEPT01;
DESC DEPT01;

-- INSERT 
INSERT INTO 
DEPT01 (DEPTNO, DNAME, LOC) 
VALUES (10, 'ACCOUNTING', 'NEW YORK');
SELECT LENGTH(10), LENGTH('ACCOUNTING'), LENGTH('NEW YORK') FROM DUAL;

SELECT * FROM DEPT01;
ROLLBACK;
COMMIT;

INSERT INTO 
DEPT01 (DEPTNO, DNAME, LOC) 
VALUES (10, 'ACCOUNTING12345', 'NEW YORK');
SELECT LENGTH(10), LENGTH('ACCOUNTING12345'), LENGTH('NEW YORK') FROM DUAL;
--명령의 63 행에서 시작하는 중 오류 발생 -
--INSERT INTO 
--DEPT01 (DEPTNO, DNAME, LOC) 
--VALUES (10, 'ACCOUNTING12345', 'NEW YORK')
--오류 보고 -
--ORA-12899: "SCOTT"."DEPT01"."DNAME" 열에 대한 값이 너무 큼(실제: 15, 최대값: 14)

INSERT INTO 
DEPT01 (DEPTNO, DNAME, LOC) 
VALUES (20, 'DALLAS', 'RESEARCH');
COMMIT;
SELECT * FROM DEPT01;

-- 컬럼명 생략 , 입력값은 컬럼 갯수와 같게 
INSERT INTO DEPT01 
VALUES (30, 'SALES', 'CHICAGO');
ROLLBACK;
COMMIT;

-- 컬럼명 생략 , 입력값은 컬럼 갯수와 다르게  
--INSERT INTO DEPT01 
--VALUES (30, 'SALES');
--오류 발생 명령행: 86 열: 13
--오류 보고 -
--SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다
--00947. 00000 -  "not enough values"
--*Cause:    
--*Action:

SELECT  * FROM DEPT01;
-- 컬럼 2개만 입력 하면 나머지 컬럼에는 NULL 이 입력된다.  
INSERT INTO 
DEPT01 (DEPTNO, DNAME)
VALUES (40, 'OPERATIONS');

INSERT INTO DEPT01 
VALUES (41, 'OPERATIONS1', NULL);

INSERT INTO DEPT01 
VALUES (42, 'OPERATIONS2', '');


SELECT * FROM DEPT_COPY_2;
--INSERT INTO ~ SELECT 
INSERT INTO DEPT_COPY_2
SELECT * FROM DEPT WHERE DEPTNO = 10;

INSERT INTO DEPT_COPY_2 
SELECT DEPTNO, DNAME FROM DEPT WHERE DEPTNO = 20;
--오류 발생 명령행: 114 열: 13
--오류 보고 -
--SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다
--00947. 00000 -  "not enough values"
--*Cause:    
--*Action:

INSERT INTO DEPT_COPY_2 (DEPTNO, DNAME)
SELECT DEPTNO, DNAME FROM DEPT WHERE DEPTNO = 20;
ROLLBACK;
COMMIT;


-- 날짜
CREATE TABLE EMP01
AS 
SELECT EMPNO, ENAME, HIREDATE, DEPTNO FROM EMP WHERE 1=0;

SELECT * FROM EMP01;

INSERT INTO EMP01
VALUES (4000, 'AA00', '2021/08/06', 10);

INSERT INTO EMP01
VALUES (4001, 'AA01', TO_DATE('2021/08/06', 'YYYY-MM-DD'), 20);
COMMIT;

SELECT TO_CHAR(A.HIREDATE, 'YYYY-MM-DD') HIREDATE 
FROM EMP01 A;

INSERT INTO EMP01
VALUES (4002, 'AA02', SYSDATE, 30);

-- DATE
SELECT SYSDATE FROM DUAL;
-- TIMESTAMP
SELECT SYSTIMESTAMP FROM DUAL;

-- MAX 값 채번 
-- 202108060001
CREATE TABLE MAX_NUM (
    M_NUM VARCHAR2(20) PRIMARY KEY 
);


-- MAX(), MIN() 함수 
SELECT EMPNO FROM EMP ORDER BY 1 DESC; -- 7934
SELECT EMPNO FROM EMP ORDER BY 1 ; -- 7369

SELECT MAX(EMPNO) FROM EMP; -- 7934
SELECT MIN(EMPNO) FROM EMP; -- 7369

SELECT MAX(ENAME) FROM EMP; -- WARD
SELECT ENAME FROM EMP ORDER BY 1 DESC;
SELECT MIN(ENAME) FROM EMP; -- ADAMS
SELECT ENAME FROM EMP ORDER BY 1;

SELECT MAX(HIREDATE) FROM EMP; -- 87/05/23
SELECT HIREDATE FROM EMP ORDER BY 1 DESC;
SELECT MIN(HIREDATE) FROM EMP; -- 80/12/17
SELECT HIREDATE FROM EMP ORDER BY 1;

-- 테이블을 생성하고 컬럼에 데이터를 입력하지 않는 상태는 항상 NULL 이다. 
-- M_NUM 컬럼에 최초 1을 출력하고 싶다. 

SELECT NULL FROM DUAL;
SELECT NULL + 1 FROM DUAL;
SELECT NVL(NULL, 0) + 1 FROM DUAL;

SELECT * FROM MAX_NUM;
SELECT MAX(M_NUM) FROM MAX_NUM;
SELECT MAX(M_NUM) + 1 FROM MAX_NUM;
SELECT NVL(MAX(M_NUM), 0) + 1 FROM MAX_NUM;

-- LPAD() 함수 자릿수 채우기 
-- LAPD(첫번째매개변수, 두번째매개변수, 세번째매개변수)
SELECT LPAD('ABC', 10, '0') FROM DUAL;
SELECT RPAD('ABC', 10, '0') FROM DUAL;

SELECT LPAD('1', 4, '0') FROM DUAL;
SELECT LPAD('11', 4, '0') FROM DUAL;
SELECT LPAD('111', 4, '0') FROM DUAL;
SELECT LPAD('1111', 4, '0') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD('1', 4, '0') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD('11', 4, '0') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD('111', 4, '0') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD('1111', 4, '0') FROM DUAL;

SELECT LPAD(NVL(MAX(M_NUM), 0) + 1, 4, '0')  FROM MAX_NUM;

-- 회원번호 M0001
SELECT 'M' || LPAD(NVL(MAX(M_NUM), 0) + 1, 4, '0')  FROM MAX_NUM;
-- 게시판 글번호 B0001
SELECT 'B' || LPAD(NVL(MAX(M_NUM), 0) + 1, 4, '0')  FROM MAX_NUM;
-- 공지사항 글번호 N0001
SELECT 'N' || LPAD(NVL(MAX(M_NUM), 0) + 1, 4, '0')  FROM MAX_NUM;
-- 회원번호 YYYYMMDD0001
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(NVL(MAX(M_NUM), 0) + 1, 4, '0')  FROM MAX_NUM;

ROLLBACK;
COMMIT;
SELECT * FROM MAX_NUM;

INSERT INTO MAX_NUM 
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') 
       || LPAD(NVL(SUBSTR(MAX(M_NUM), 12), 0) + 1, 4, '0')  FROM MAX_NUM;

--######################################################
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') 
       || LPAD(NVL(SUBSTR(MAX(M_NUM), -4), 0) + 1, 4, '0')  FROM MAX_NUM;
       
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(NVL(SUBSTR(MAX(NULL), -4), 0) + 1, 4, '0')  FROM DUAL;       
SELECT TO_CHAR(SYSDATE, 'YYYYMM') || LPAD(NVL(SUBSTR(MAX(NULL), -4), 0) + 1, 4, '0')  FROM DUAL;       
SELECT TO_CHAR(SYSDATE, 'YYYY') || LPAD(NVL(SUBSTR(MAX(NULL), -4), 0) + 1, 4, '0')  FROM DUAL;       
--######################################################

--1. MAX() 함수 : 최고값 : 0001
--2. SUBSTR() 함수 : 
SELECT SUBSTR('202108060001', 12) FROM DUAL;
--3. NVL() 함수 
SELECT NVL(SUBSTR(MAX(NULL), 12), 0) FROM DUAL;
--4. LPAD() 함수
SELECT LPAD(NVL(SUBSTR(MAX(NULL), 12), 0) + 1, 4, '0')  FROM DUAL;
--5. || : 오라클에서 문자연결하는 연산자 
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')  || '0001' FROM DUAL;
--6. SYSDATE : 오늘 날자 
SELECT SYSDATE FROM DUAL;
--7. TO_CHAR() 함수 
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;


-- UPDATE : UPDATE 는 기본적으로 INSERT 보다 수행시간 오래걸린다. 
--UPDATE 테이블이름 
--SET 컬럼이름=컬럼값, ..... n
--WHERE 조건

-- 업데이트할 때 쿼리 만드는 순서
--1. 조회 먼저하기 : 업데이트할 데이터를 먼저 조회하기 : 조건에 맞게
--2. 조건에 맞는 데이터 확인하고 업데이트 하기 
SELECT LOC  FROM DEPT01 
WHERE DEPTNO = 10;

UPDATE DEPT01
SET LOC = 'AAAA'
WHERE DEPTNO = 10;

ROLLBACK;

UPDATE DEPT01
SET DNAME = 'HR';

UPDATE DEPT01
SET DNAME='PROGRAMMING', LOC='SEOUL'
WHERE DEPTNO = 10;

UPDATE DEPT01
SET LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO = 20)
WHERE DEPTNO = 10;

UPDATE DEPT01
SET DNAME = (SELECT DNAME FROM DEPT01 WHERE DEPTNO = 30)
   ,LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO = 30)
WHERE DEPTNO = 10;




