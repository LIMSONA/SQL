select * from customer where gender='man';
select * from customer where gender<>'man';
select * from customer where year(join_date)>=2020;
select * from customer where year(join_date)<=2020;

select * from customer where gender='man' and addr='gyeonggi';
select * from customer where not gender='man' and addr='gyeonggi';
select * from customer where gender='man' or addr='gyeonggi';

select * from customer where year(birthday) between 2010 and 2011;
select * from customer where year(birthday) not between 2010 and 2011;
select * from customer where year(birthday) in (2010,2011);
select * from customer where year(birthday) not in(2010, 2011);

select* from customer where addr like'd%';
select* from customer where addr like'%n';
select* from customer where addr like'%eo%';
select* from customer where addr not like'%eo%';

select* from customer as a left join sales as b
on a.mem_no=b.mem_no where b.mem_no is null;

select* from customer as a left join sales as b
on a.mem_no=b.mem_no where b.mem_no is not null;

 /***************집합 연산자***************/
 
CREATE TEMPORARY TABLE SALES_2019
SELECT  *
  FROM  SALES
 WHERE  YEAR(ORDER_DATE) = '2019';
 
/* 1235행 */
SELECT  *
  FROM  SALES_2019;

/* 3115행 */
SELECT  *
  FROM  SALES;
  
/* UNION : 2개 이상 테이블 중복된 행 제거 하여 집합(* 열 개수와 데이터 타입 일치) */
SELECT  *
  FROM  SALES_2019
UNION
SELECT  *
  FROM  SALES;

/* UNION ALL: 2개 이상 테이블 중복된 행 제거 없이 집합(* 열 개수와 데이터 타입 일치) */
SELECT 3115 + 1235;

SELECT  *
  FROM  SALES_2019
UNION ALL
SELECT  *
  FROM  SALES;