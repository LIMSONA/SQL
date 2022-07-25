-- Active: 1657167599866@@127.0.0.1@3306@sakila
use sakila;
show TABLEs;

# film==================

#등급별로 그룹 각등급별 영화갯수 출력
SELECT rating, count(*) from film GROUP BY rating;
#rating 그룹, 각 등급별 영화갯수, 등급 출력, 각그룹평 평균 렌탈비용 출력
SELECT count(*), rating, avg(rental_rate) from film GROUP BY rating; 
#rating등급별로 그룹묶어서 각등급별 영화갯수, 등급,각그룹별 평균렌탈비용출력, 평균 렌탈비용높은 순
select count(*), rating, avg(rental_rate) from film
GROUP BY rating ORDER BY avg(rental_rate) desc;

#rating등급 그룹묶어서, 각 등급별 영화갯수, rating등급, 각그룹별 평균 렌탈비, 출력 
# + 영화갯수와 평균렌탈비용은 각각 total_films와 avg_rental_rate로 출력
# avg_rental_rate 높을 순으로 출력
select count(*) as "total_films",
rating,
avg(rental_rate) as "avg_rental_rate"
from film
GROUP BY rating
ORDER BY avg_rental_rate desc;

#같은 구문
select count(*) as "total_films",
rating,
avg(rental_rate) as "avg_rental_rate"
from film
GROUP BY 2
ORDER BY 3 desc;
