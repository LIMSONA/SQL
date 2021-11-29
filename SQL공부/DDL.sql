create database practice;

use practice;

create table 회원(
번호 int primary key,
이름 varchar(20),
가입일자 date not null,
수신동의 bit
);
select * from 회원;

alter table 회원 add 성별 varchar(2);
select * from 회원;

alter table 회원 change 성별 성 varchar(2);
select * from 회원;

alter table 회원 rename 회원정보;
select* from 회원정보;

drop table 회원정보;
