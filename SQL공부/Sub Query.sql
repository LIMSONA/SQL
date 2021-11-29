use practice;

-- select절 서브쿼리(join을 사용하지 않고 가지고 올수 있음) cj처리속도가 차이남
select*
,(select gender from customer where a.mem_no=mem_no) as gender
from sales as a;

/* 확인 */
SELECT  *
  FROM  CUSTOMER
 WHERE  MEM_NO = '1000970';

/* SELECT절 서브 쿼리 vs 테이블 결합(JOIN) 처리 속도 비교 */
SELECT  A.*
		,B.GENDER
  FROM  SALES AS A
  LEFT
  JOIN  CUSTOMER AS B
    ON  A.MEM_NO = B.MEM_NO;

-- 서브쿼리 사용시 최적화가 최악....

-- from절 서브쿼리(열 및 테이블명 지정 가능)
select* 
from
(select mem_no, 
count(order_no) as 주문횟수 
from sales group by mem_no) as a;

-- where절 서브쿼리
/* 2019년도에 가입한 회원의 주문 횟수 구하기 */
select count(order_no) as 주문횟수
from sales
where mem_no in (select mem_no from customer where year(join_date)=2019);

/* YEAR: 날짜형 함수를 연도 변환해준다 */
select *,year(join_date)from customer;  

/* WHERE절 서브 쿼리 vs 데이터 결합(JOIN) 결과 값 비교 */
SELECT  COUNT(A.ORDER_NO) AS 주문횟수
  FROM  SALES AS A
 INNER
  JOIN  CUSTOMER AS B
    ON  A.MEM_NO = B.MEM_NO
 WHERE  YEAR(B.JOIN_DATE) = 2019;
-- join보다 처리속도 늦다