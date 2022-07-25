-- Active: 1657167599866@@127.0.0.1@3306@sakila
use sakila;
show TABLEs;

# film==================
desc film;
# 1줄 구조 살펴보기
SELECT * FROM film limit 1;
# 영화 등급 종류
select distinct rating from film;
#영화 출시년도 종류
SELECT distinct release_year FROM film;

# rental=====================
select * FROM rental LIMIT 10;
#inventory 367번째줄 출력
select * from rental where inventory_id=367;
#+조건 staff id =1
select* from rental 
WHERE inventory_id=367 AND staff_id=1;



