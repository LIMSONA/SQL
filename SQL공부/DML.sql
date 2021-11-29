use practice;
drop table 회원테이블;

create table 회원테이블(
회원번호 int primary key,
이름 varchar(20),
가입일자 date not null,
수신동의 bit
);

-- 데이터 삽입 
insert into 회원테이블 values(1001, '홍길동', '2020-01-02', 1);
INSERT INTO 회원테이블 VALUES (1002, '이순신', '2020-01-03', 0);
INSERT INTO 회원테이블 VALUES (1003, '장영실', '2020-01-04', 1);
INSERT INTO 회원테이블 VALUES (1004, '유관순', '2020-01-05', 0);

-- 데이터 조회

select * from 회원테이블;
select 이름 from 회원테이블;
select 회원번호, 
이름 as 성명 
from 회원테이블;

-- 데이터 수정
UPDATE 회원테이블
   SET 수신동의 = 0;
select* from 회원테이블;

delete from 회원테이블 where 이름='홍길동';
select * from 회원테이블;

delete from 회원테이블;
select * from 회원테이블;
