--오라클에 데이터에 계정을 만들 때는 SYSTEM 또는 SYS 계정으로 한다. 
SHOW USER;

-- 계정생성하기 
-- 계정이름 : test01
-- 계정비밀번호 : 1234
--CREATE USER : 계정을 생성하는 키워드 
--IDENTIFIED BY : 비밀번호를 생성하는 키워드 
--CREATE USER 계정명 IDENTIFIED BY 비밀번호 
CREATE USER test01 IDENTIFIED BY 1234;

--C:\Users\KOSMO>sqlplus test01/1234
--ERROR:
--ORA-01045: user TEST01 lacks CREATE SESSION privilege; logon denied
--
--ORA-01045 : 오라클 에러코드 
--오라클 에러코드를 인터넷에서 검색해서 에러를 디버깅한다. 

--맨처음 유저를 생성하면 
--달랑 유저만 생성되기 때문에 
--연결권한 
--테이블 생성 권한을 부여해야 한다. 해당하는 유저에 

--연결권한 주기 
--GRANT CREATE SESSION TO : 유저에게 연결 권한을 주는 구문
GRANT CREATE SESSION TO test01;

--C:\Users\KOSMO>sqlplus test01/1234
--다음에 접속됨:
--Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
--With the Partitioning, OLAP, Data Mining and Real Application Testing options
--
--SQL>

--테이블 생성 권한을 부여해야 한다. 해당하는 유저에 
GRANT CREATE TABLE TO test01;

--Grant을(를) 성공했습니다.

--테이블 스페이스 생성 
ALTER USER test01 QUOTA UNLIMITED ON USERS;

--계정 생성해서 테이블 만들기 
--1. system/1234 로그인
--2. 계정만들기 
--CREATE USER test01 IDENTIFIED BY 1234;
--비밀번호 바꾸기 
--ALTER USER test01 IDENTIFIED BY 1234;
--3. 연결 권한 부여
--GRANT CREATE SESSION TO test01;
--4. 테이블 생성 권한 부여
--GRANT CREATE TABLE TO test01;
--5. 테이블 스페이스 사이즈 변경 : 2M, 5M, 10M, UNLIMITED 등 
--ALTER USER test01 QUOTA UNLIMITED ON USERS;
--6. 생성한 계정으로 로그인 해서 테이블 생성하기 
--CREATE TABLE T1_TABLE (
--    TESTCOLUMN1 VARCHAR2(20) 
--   ,TESTCOLUMN2 VARCHAR2(200)
--);

test02/1234 계정만들기 
T2_TABLE 테이블 만들기 
T2_COLUMN1 VARCHAR2(20)
T2_COLUMN2 VARCHAR2(200)  


