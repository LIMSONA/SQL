-- view
-- 1.테이블결합
select a.*, a.sales_qty*b.price as 결제금액
from sales as a
left join product as b
on a.product_code=b.product_code;

-- 2.view 생성
create view sales_product as
select a.*, a.sales_qty*b.price as 결제금액
from sales as a
left join product as b
on a.product_code=b.product_code;

select* from sales_product;

-- 3. 뷰 수정
alter view sales_product as
select a.*, a.sales_qty*b.price*1.1 as 결제금액_수수료포함
from sales as a
left join product as b
on a.product_code=b.product_code;

select* from sales_product;

-- 4. 뷰 삭제
drop view sales_product;

-- PROCEDURE
/***************IN 매개변수***************/    

DELIMITER //
CREATE PROCEDURE CST_GEN_ADDR_IN
( IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20) )
BEGIN
	SELECT  *
	  FROM  CUSTOMER
	 WHERE  GENDER = INPUT_A
	   AND  ADDR = INPUT_B;
END //
DELIMITER ;

/* DELIMITER: 여러 명령어들을 하나로 묶어줄때 사용 */

/***************PROCEDURE 실행***************/
    
CALL CST_GEN_ADDR_IN('MAN', 'SEOUL');

CALL CST_GEN_ADDR_IN('WOMEN', 'INCHEON');


/***************PROCEDURE 삭제***************/
    
DROP PROCEDURE CST_GEN_ADDR_IN;


/**************OUT 매개변수***************/    

DELIMITER //
CREATE PROCEDURE CST_GEN_ADDR_IN_CNT_MEM_OUT( IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20), OUT CNT_MEM INT )
BEGIN
	SELECT  COUNT(MEM_NO)
	  INTO  CNT_MEM
	  FROM  CUSTOMER
	 WHERE  GENDER = INPUT_A
	   AND  ADDR = INPUT_B;
END //
DELIMITER ;


/***************PROCEDURE 실행***************/
    
CALL CST_GEN_ADDR_IN_CNT_MEM_OUT('WOMEN', 'INCHEON', @CNT_MEM);
SELECT  @CNT_MEM;


/**************IN/OUT 매개변수***************/    

DELIMITER //
CREATE PROCEDURE IN_OUT_PARAMETER( INOUT COUNT INT)
BEGIN
	SET COUNT = COUNT + 10;
END //
DELIMITER ;


/***************PROCEDURE 실행***************/

SET @counter = 1;
CALL IN_OUT_PARAMETER(@counter);
SELECT  @counter;
