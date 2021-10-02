SELECT * FROM TAB; -- 블럭잡고(SHIFT + 홈키, 커서키) ctrl + enter
SELECT COUNT(*) FROM TAB;

--    테이블에서 데이터를 조회하기
--    1. 키워드 (예약어, 명령어) : SELECT, FROM
--    2. SELECT : 조회하는 키워드
--    3. FROM : 어느 테이블에서
--    4. SELECT 컬럼이름, 컬럼이름, 컬럼이름 ... (순차, INEXT) FROM 테이블이름
--  EMP 테이블에서 EMPNO 컬럼을 조회하시오.
SELECT EMPNO FROM EMP;
-- EMP 테이블에서 EMPNO 컬럼에 있는 모든 데이터가 조회된다.

-- EMP 테이블에서 EMPNO, ENAME 컬럼을 조회하시오.
SELECT EMPNO, ENAME FROM EMP;

-- * : 아스타리스크, 미풍표시, 별표 ... : 테이블을 FULL-SCAN(전체조회 : 전체컬럼에 전체로우 ) 하시오
-- EMP 테이블을 풀스캔하시오, EMP 테이블을 전체 조회하시오

SELECT * FROM EMP;

--오라클 데이터베이스는 관계형 데이터베이스
--데이터베이스에서는 기본적으로
테이블에 CRUD, ISUE 를 해야한다ㅣ.
--C: CREATE, I: INSERT : 테이블 컬럼에 데이터를 입력하는 것.
--R: READ, S: SELECT : 테이블에 있는 컬럼데이터를 로우단위로 조회하는 것이다.
--U: UPDATE : 테이블 컬럼에 있는 데이터를 수정하는 것이다.
--D: DELETE : 데이블 컬럼에 있는 데이터를 삭제하는 것이다.
사용하는 키워드:예약, 명령어
-- SELECT, FROM, INSERT, INTO, VALUE, UPDATE, SET, DELETE, WHERE
/*
--SELECT : 테이블에서 컬럼 인덱스로 조회하는 것.
SELECT 컬럼이름1, 컬럼이름2 ... 컬럼이름n FROM 테이블명
WHERE 조건

--INSERT : 테이블 컬럼에 데이터 입력
INSERT INTO 테이블명(컬럼이름1, 컬럼이름2, 컬럼이름n)
        VALUES(컬럼이름1에 넣을값, 컬럼이름2에 넣을값, ...컬럼이름n에 넣을값);

--UPDATE : 테이블 컬럼에 데이터 변경
UPDATE 테이블명
SET 컬럼이름1 = 컬럼이름1에 변경할 값,
    컬럼이름2 = 컬럼이름2에 변경할 값,
    컬럼이름n = 컬럼이름n에 변경할 값
WHERE 조건

--DELETE : 테이블에 컬럼을 로우단위로 삭제
DELETE FROM 테이블명
WHERE 조건
*/

SELECT*FROM EMP;