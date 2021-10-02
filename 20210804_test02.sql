SHOW USER;

SELECT * FROM TAB;

--T2_TABLE 테이블 만들기 
--T2_COLUMN1 VARCHAR2(20)
--T2_COLUMN2 VARCHAR2(200)  

CREATE TABLE T2_TABLE(
    T2_COLUMN1 VARCHAR2(20)
   ,T2_COLUMN2 VARCHAR2(200) 
);

SELECT * FROM T2_TABLE;

--테이블에 인서트 하기 
--INSERT INTO : 인서트 키워드 
--T2_TABLE : 테이블 명 
--(T2_COLUMN1, T2_COLUMN2) : 컬럼명을 , 으로 순차로 명기하기 
--VALUES : 키워드 
--() : 컬럼명 순서에 맞추어서 순서대로 값을 , 으로 명기하기 
INSERT INTO T2_TABLE (T2_COLUMN1, T2_COLUMN2) VALUES ('111', '111');

SELECT * FROM T2_TABLE;

--오라클에서 ISUD, CRUD 할 때 주의해야 할 것 
--SELECT 
---- DDL : 트랜잭션을 처리해하는 명령어 
--오라클에서 트랜잭션은 해당하는 ROW 를 COMMIT, ROLLBACK 하는 것이다. 
--오라클에선 DDL 문 INSERT, UPDATE, DELETE 에서만 트랜잭션 개발자과 관리해야 한다. 
--COMMIT, ROLLBACK을 직접해야 한다. 

--INSERT , UPDATE, DELETE 
--인서트, 업테이트, 딜리트 명령어로 트랜잭션을 발생 시키면 
--1. 인서트, 업데이트, 딜리트한 내용 오라클 메모리에 작성된다. 
--2. 이 상태에서 SELET 하면 조회가 된다. 
--   sqlplus 에서는 조회가 되는데, 외부 응용프로그램에서는 조회가 불가능 한다. 
--2-1. 인서트, 업데이트, 딜리트  한 내용 오라클 메모리에 삭제 하려면 ROLLBACK 명령어를 실행하면 된다. 
--2-2. 인서트, 업데이트, 딜리트 후 조회가 가능한데 
--     COMMIT 명령어를 실행하지 않고 ROLLBACK 명령어를 실행하면 조회가 않된다. 
--3. COMMIT 명령어를 실행 시켜야 오라클 파일에 작성된다. 
--3-1. COMMIT 명령이 실행 된 이후에는 ROLLBACK 이 되지 않는다. 
--4. 이 상태에서 sqlplus 및 외부 응용프로그램에서 조회가 가능하다. 
--4-1. 외부 응용프로그램에서 오라클 테이블에 있는 데이터를 조회 하려면 
--     파일에 적재된 데이터만 조회가 가능한다. 
--     이유는 메모리에 있는내용은 변경이 가능하기 때문에 ...

INSERT INTO T2_TABLE (T2_COLUMN1, T2_COLUMN2) VALUES ('111', '111');
SELECT * FROM T2_TABLE;
ROLLBACK;
COMMIT;

-- 데이터 입력테스트 
-- 숫자, 문자, 숫자(실수), 날짜 
CREATE TABLE T3 (
    T3_1 NUMBER(4) PRIMARY KEY 
   ,T3_2 VARCHAR2(20)
   ,T3_3 VARCHAR2(20)
   ,T3_4 NUMBER(7,4)
   ,T3_5 VARCHAR2(1)
   ,T3_6 DATE 
);
SELECT * FROM TAB;
SELECT * FROM T3;
SELECT SYSDATE FROM DUAL;

INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11, 'AA', 'AA11', 1.1234, 'Y', SYSDATE);

--INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11, 'AA', 'AA11', 1.1234, 'Y1', SYSDATE);
--INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11, 'AA', 'AA11', 1.1234, 'Y1', SYSDATE)
--오류 보고 -
--ORA-12899: "TEST02"."T3"."T3_5" 열에 대한 값이 너무 큼(실제: 2, 최대값: 1)

--PRIMARY KEY = NOT NULL + UNIQUE
--INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11, 'AA', 'AA11', 1.1234, 'Y', SYSDATE);
--INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (11, 'AA', 'AA11', 1.1234, 'Y', SYSDATE)
--오류 보고 -
--ORA-00001: 무결성 제약 조건(TEST02.SYS_C0011053)에 위배됩니다

INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (12, 'AA', 'AA12', 12.1234, 'Y', SYSDATE);
INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (13, 'AA', 'AA13', 13.1234, 'Y', SYSDATE);
ROLLBACK;
COMMIT;

INSERT INTO T3 (T3_1, T3_2, T3_3, T3_4, T3_5, T3_6) VALUES (14, 'AA', 'AA13', 14.1234, 'Y', SYSDATE);







