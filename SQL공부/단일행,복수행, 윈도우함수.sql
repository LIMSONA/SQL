/**** 단일행 함수****/
-- 숫자형 함수
select abs(-200);
select round(2.18,1);
select sqrt(9);

-- 문자형 함수
select lower('AB');
select upper('ab');
select left('AB',1);
select right('AB',1);
select length('ab');

-- 날짜형 함수
select year('2021-11-29');
select month('2021-11-29');
select day('2021-11-29');

/* DATE_ADD(날짜, INTERVAL) : INTERVAL만큼 더한 값 반환 */
select date_add('2021-11-29',interval-1 month);
/* DATEDIFF(날짜a, 날짜b) : 날짜a – 날짜b 일수 반환 */
SELECT DATEDIFF('2022-12-31', '2022-12-1');

-- 형변환 함수
/* DATE_FORMAT(날짜, 형식) : 날짜형식으로 변환 */
select date_format('2022-12-31','%m-%d-%y'); /* 12-31-22*/
select date_format('2022-12-31','%M-%D-%Y'); /* December-31st-2022*/
/* CAST(형식a, 형식b) : 형식a를 형식b로 변환 */
select cast('2022-12-31 12:00:00' as date);

-- 일반 함수 --
/* IFNULL(A, B) : A가 NULL이면 B를 반환, 아니면 A 반환 */
select ifull(null,0);
select ifull('null아님',0);

/* 
CASE WHEN [조건1] THEN [반환1]
 	 WHEN [조건2] THEN [반환2]
     ELSE [나머지] END
: 여러 조건별로 반환값 지정
*/
select*,
case when gender='man' then '남성' else '여성'end
from customer end;

-- 함수 중첩사용
select *
,year(join_date) as 가입연도
,length(year(join_date)) as 가입연도_문자수
from customer; 

/**** 복수행 함수****/
-- 집계 함수
SELECT  COUNT(ORDER_NO) AS 구매횟수 /* 행수 */
		,COUNT(DISTINCT MEM_NO) AS 구매자수 /* DISTINCT: 중복제거 */ 
        ,SUM(SALES_QTY) AS 구매수량 /* 합계 */
        ,AVG(SALES_QTY) AS 평균구매수량 /* 평균 */
        ,MAX(ORDER_DATE) AS 최근구매일자 /* 최대 */
        ,MIN(ORDER_DATE) AS 최초구매일자 /* 최소 */
  FROM  SALES;

-- 그룹함수
/* WITH ROLLUP : GROUP BY 열들을 오른쪽에서 왼쪽순으로 그룹 (소계, 합계)*/
select year(join_date) as 가입연도, addr, count(mem_no) as 회원수
from customer
group by year(join_date),addr
with rollup;

-- 윈도우 함수
-- 순위함수
select order_date
,row_number() over(order by order_date asc) /*12345678*/
,rank() over(order by order_date asc) /* 123333389*/
,dense_rank() over(order by order_date asc) /*12333345*/
from sales;

-- 파티션
select order_date
,row_number() over(partition by mem_no order by order_date asc) /*12345678*/
,rank() over(partition by mem_no order by order_date asc) /* 123333389*/
,dense_rank() over(partition by mem_no order by order_date asc) /*12333345*/
from sales;

-- 집계함수
SELECT  ORDER_DATE
		,SALES_QTY
        ,'-' AS 구분
        ,COUNT(ORDER_NO) OVER (ORDER BY ORDER_DATE ASC) AS 누적_구매횟수
		,SUM(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_구매수량
        ,AVG(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_평균구매수량
        ,MAX(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_가장높은구매수량
		,MIN(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_가장낮은구매수량    
  FROM  SALES;
