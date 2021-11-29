use practice;
drop table 회원테이블;

CREATE TABLE 회원테이블 (
회원번호 INT PRIMARY KEY,
이름 VARCHAR(20),
가입일자 DATE NOT NULL,
수신동의 BIT
);

begin;
INSERT INTO 회원테이블 VALUES (1001, '또방', '2021-11-29', 1);
SELECT  *  FROM  회원테이블;
rollback;
SELECT  *  FROM  회원테이블 end;

begin;
insert into 회원테이블 values (1015,'꾸꾸', '2021-11-29', 0);
commit;
select* from 회원테이블 end;

delete from 회원테이블;
select* from 회원테이블;

begin;
insert into 회원테이블 VALUES (1001, '또방', '2021-11-29', 1);
savepoint s1;
update 회원테이블 set 이름='호빵';
savepoint s2;

delete from 회원테이블;
savepoint s3;
select*from 회원테이블;
rollback to s2;
select*from 회원테이블;
commit;
select*from 회원테이블 end;
