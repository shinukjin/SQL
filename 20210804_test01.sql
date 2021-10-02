SHOW USER;

SELECT * FROM TAB;
SELECT COUNT(*) FROM TAB;

--테이블 생성하기 
--CREATE TABLE : 키워드 
--T1_TABLE : 테이블 이름 
--() : 소괄호에 컬럼 데이터타입 사이즈를 , 구분자로 나열한다.
CREATE TABLE T1_TABLE (
    TESTCOLUMN1 VARCHAR2(20) 
   ,TESTCOLUMN2 VARCHAR2(200)
);

--오류 보고 -
--ORA-01031: 권한이 불충분합니다
--01031. 00000 -  "insufficient privileges"
--시스템 계정에서 테이블 생성 권한 주어야 한다. 

--테이블 생성 권한 부여한 후 테이블 생성 
CREATE TABLE T1_TABLE (
    TESTCOLUMN1 VARCHAR2(20) 
   ,TESTCOLUMN2 VARCHAR2(200)
);

--ORA-01031: 권한이 불충분합니다
--01031. 00000 -  "insufficient privileges"
--*Cause:    An attempt was made to perform a database operation without
--           the necessary privileges.
--*Action:   Ask your database administrator or designated security
--           administrator to grant you the necessary privileges

--테이블 스페이스가 없어서 나는 오류 
DROP TABLE T1_TABLE;

CREATE TABLE T1_TABLE (
    TESTCOLUMN1 VARCHAR2(20) 
   ,TESTCOLUMN2 VARCHAR2(200)
);

SELECT * FROM T1_TABLE;




