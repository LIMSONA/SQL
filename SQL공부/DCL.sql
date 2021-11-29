use mysql;

select*from user;


-- 사용자추가 
create user 'test'@localhost identified by 'test';

select*from user;

set password for 'test'@localhost ='1234';

-- 권한부여 및 제거: create, alter, drop, insert, delete, update, select 등등
grant select, delete on practice.회원테이블 to 'test'@localhost;
select*from user; 

revoke select,delete on practice.회원테이블 to 'test'@localhost;

-- 사용자삭제
drop user 'test'@localhost;
select*from user;