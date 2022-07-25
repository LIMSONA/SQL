-- Active: 1657167599866@@127.0.0.1@3306@sakila
# 실습 준비하기
show databases;
use sakila;
show tables;

# 맨위 actor 테이블 살펴보기
describe actor;
desc actor;

# 조회
select * from actor;
select * from sakila.actor;
select * from actor limit 10; #10줄만 조회

# 정렬
select * from actor order by first_name asc; # 오름차순
select * from actor order by first_name; # 기본값 오름차순
select * from actor order by first_name desc; # 내림차순

# alias 별칭
SELECT actor_id AS 아이디, last_name AS 성
, first_name 이름	-- AS 생략가능
, last_update
FROM actor;

# where 조건절
# first_name zero
select * from actor where first_name="zero";
# 특정번호 대
select * from actor where actor_id >=20 && actor_id<30;
#2개이상 조건
select * from actor where last_name='kilmer' and actor_id<100;

#참고 https://makecodework.tistory.com/entry/MySQL-Sakila-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EC%8B%A4%EC%8A%B5-DB-table-%ED%99%95%EC%9D%B8