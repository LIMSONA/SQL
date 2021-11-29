use practice;

-- 테이블 열 조회
select*from customer;

-- where절
select * from customer
where gender='man';

-- group by절
select addr, count(mem_no)as 회원수
from customer
where gender='man'
group by addr;

-- having 절alter
select addr, count(mem_no)as 회원수
from customer
where gender='man'
group by addr
having count(mem_no)<100;

-- order by절
select addr, count(mem_no)as 회원수
from customer
where gender='man'
group by addr
having count(mem_no)<100
order by count(mem_no) desc;

-- where절을 생략해도 상관없음

/* 거주지역을 서울, 인천 조건으로 필터링 */
/* 거주지역 및 성별로 회원수 집계 */

select addr, gender, count(mem_no)
from customer
where addr in ('seoul','incheon')
group by addr, gender;

-- IN : 특수 연산자 / IN (List) / 리스트 값만!
-- GROUP BY에 있는 column들은 SELECT에도 작성해야 함!

/* 회원테이블(Customer)을 */
/* 성별이 남성 조건으로 필터링하여 */
/* 거주지역별로 회원수 집계 */
/* 집계 회원수 100명 미만 조건으로 필터링 */
/* 모든 열 조회 */
/* 집계 회원수가 높은 순으로 */

select addr, 
count(mem_no) as 회원수
from customer
where gender='man'
group by addr
having count(mem_no) < 100 
order by count(mem_no) desc;

