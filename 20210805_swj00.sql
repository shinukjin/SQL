SHOW USER;
--DROP TABLE SWJ_MEMBER;
--SELECT * FROM SWJ_MEMBER;
CREATE TABLE SWJ_MEMBER(
    SNUM VARCHAR2(20) PRIMARY KEY,
    SNAME VARCHAR2(20),
    SID VARCHAR2(20) NOT NULL,
    SPW VARCHAR2(20) NOT NULL,
    SBIRTH VARCHAR2(10),
    SGENDER VARCHAR2(2),
    STEL VARCHAR2(16),
    SHP VARCHAR2(16) NOT NULL,
    SEMAIL VARCHAR2(200),
    SADDR VARCHAR2(300),
    SHOBBY VARCHAR2(2),
    SPHOTO VARCHAR2(200),
    SSKILL VARCHAR2(100),
    SJOB VARCHAR2(2),
    DELETEYN VARCHAR2(1) NOT NULL,
    INSERTDATE DATE ,
    UPDATEDATE DATE );
    
--    SELECT * FROM SWJ_MEMBER;
INSERT INTO SWJ_MEMBER VALUES('202108050001', '신욱진', 'swj0507', 'asdfasdf', '1991-05-07', '01', 
                              '010-9919-4038', '010-9919-4038', 'swj@naver.com', '14460 경기도 부천시 성곡로92번길 51 신동빌라 303호',
                              '02', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050002', '용태호', 'abc123', 'asdfasdf', '1991-05-08', '01', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '01', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);
                              
INSERT INTO SWJ_MEMBER VALUES('202108050003', '이희진', 'abc124', 'asdfasdf', '1992-06-07', '02', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '02', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050004', '정예지', 'abc125', 'asdfasdf', '1993-04-07', '02', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '03', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050005', '한태준', 'abc126', 'asdfasdf', '1993-03-03', '01', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '03', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050006', '오도경', 'abc127', 'asdfasdf', '1994-04-04', '01', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '04', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050007', '이상준', 'abc128', 'asdfasdf', '1995-05-05', '01', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '05', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050008', '김형우', 'abc129', 'asdfasdf', '1996-05-06', '01', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '06', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050009', '오재영', 'abc110', 'asdfasdf', '1997-07-07', '02', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '02', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);

INSERT INTO SWJ_MEMBER VALUES('202108050010', '박동현', 'abc114', 'asdfasdf', '1998-08-08', '01', 
                              '010-0000-0000', '010-0000-0000', 'swj@naver.com', '서울특별시',
                              '02', 'C:\', '놀고먹기', '05', 'Y', SYSDATE, SYSDATE);
                              
 COMMIT;   
 ROLLBACK;


 SELECT								 	
 	 A.SNUM			SNUM				
		,A.SNAME		SNAME				
		,A.SID			SID					
		,A.SPW			SPW					
		,A.SBIRTH		SBIRTH				
		,A.SGENDER		SGENDER				
		,A.STEL			STEL				
		,A.SHP			SHP					
		,A.SEMAIL		SEMAIL				
		,A.SADDR		ASADDR				
		,A.SHOBBY		SHOBBY				
		,A.SPHOTO		SPHOTO				
		,A.SSKILL		SSKILL				
		,A.SJOB			SJOB				
		,A.DELETEYN		DELETEYN		   	
		,TO_CHAR(A.INSERTDATE, 'YYYY-MM-DD')		INSERTDATE
		,TO_CHAR(A.UPDATEDATE, 'YYYY-MM-DD')		UPDATEDATE
FROM										
		SWJ_MEMBER A						
WHERE DELETEYN = 'Y'						
ORDER BY 1 DESC;	

SELECT								 	
 	 A.SNUM			SNUM				
		,A.SNAME		SNAME				
		,A.SID			SID					
		,A.SPW			SPW					
		,A.SBIRTH		SBIRTH				
		,A.SGENDER		SGENDER				
		,A.STEL			STEL				
		,A.SHP			SHP					
		,A.SEMAIL		SEMAIL				
		,A.SADDR		ASADDR				
		,A.SHOBBY		SHOBBY				
		,A.SPHOTO		SPHOTO				
		,A.SSKILL		SSKILL				
		,A.SJOB			SJOB				
		,A.DELETEYN		DELETEYN		   	
		,TO_CHAR(A.INSERTDATE, 'YYYY-MM-DD')		INSERTDATE
		,TO_CHAR(A.UPDATEDATE, 'YYYY-MM-DD')		UPDATEDATE
FROM										
		SWJ_MEMBER A						
WHERE DELETEYN = 'Y'						
ORDER BY 1 DESC	;