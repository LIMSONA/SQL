USE PRACTICE;

-- INNER JOIN(교집합)
select *
from customer as a
inner join 
sales as b
on a.mem_no=b.mem_no;

-- where 조건
select *
from customer as a
inner join 
sales as b
on a.mem_no=b.mem_no
where a.mem_no='1000970';

-- left join
/* Customer + Sales LEFT JOIN */
select *
from customer as a 
left join 
sales as b
on a.mem_no=b.mem_no;

-- right join
/* Customer + Sales RIGHT JOIN */
select *
from customer as a
right join
sales as b
on a.mem_no=b.mem_no
where a.mem_no is null;

-- 테이블 결합 및 조회
select*
from customer as a
inner join
sales as b
on a.mem_no=b.mem_no;

-- 임시테이블 생성 및 조회 (서버 연결 종료시 자동삭제)
create temporary table a_b_inner_join
select a.*, b.order_no
from customer as a
inner join 
sales as b
on a.mem_no=b.mem_no;

select * from a_b_inner_join;

-- 임시테이블 이용하여 조회하기
/* 성별이 남성 조건으로 필터링하여 */
select *
from a_b_inner_join
where gender='man';

/* 조건추가: 거주지역별로 구매횟수 집계 */
select addr, count(order_no) as 구매횟수
from a_b_inner_join
where gender='man'
group by addr;

/* 조건추가: 구매횟수 100회 미만 조건으로 필터링 */
select addr, count(order_no) as 구매횟수
from a_b_inner_join
where gender='man'
group by addr
having count(order_no)<100;

/* 조건추가: 구매횟수가 낮은 순으로 정렬 */
select addr, count(order_no) as 구매횟수
from a_b_inner_join
where gender='man'
group by addr
having count(order_no)<100
order by count(order_no);

-- 3개이상의 테이블 결합하기
/* 주문(Sales) 테이블 기준, 회원(Customer) 및 상품(Product) 테이블 LEFT JOIN 결합 */

select * from sales as a
left join
customer as b
on a.mem_no=b.mem_no
left join
product as c
on a.product_code = c.product_code;