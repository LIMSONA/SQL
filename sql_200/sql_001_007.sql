select * from emp;

#1. 테이블에서 특정열 선택하기
#사원번호, 이름, 월급
select empno,ename,sal from emp;

#2. 테이블에서 모든 열 출력하기
#2-1.모든 열 전부 출력
select * from emp;
#2-2. 일일히 적어보기
SELECT empno,ename,job,mgr,hiredate,sal, comm,deptno FROM emp;

#3. 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기
#사원번호, 사원이름이라고 한글열이름 바꾸기
SELECT empno as 사원번호, ename as 사원이름, sal as "Salary" FROM emp; 

#4. 연결 연산자 사용하기
#4-1. 이름.월급을 서로 붙여서 출력
SELECT ename || sal FROM emp;
#4-2. 문자열과 쿼리 연결해서 출력
SELECT ename || ' 의 월급은 ' || sal || ' 입니다. ' as 월급정보 FROM emp;
#4-3. 문자열과 쿼리 연결해서 출력2
SELECT ename || ' 의 직업은 ' || job || '입니다. ' as 직업정보 FROM emp;

#5. 중복된 데이터를 제거해서 출력하기
#5-1.직업 출력시 중복데이터 제외출력
SELECT DISTINCT job from emp;
#5-2. 유니크한 값 출력(위와 동일식)
SELECT UNIQUE job FROM emp;

#6. 데이터를 정렬해서 출력하기 
#6-1.월급출력, 월급 낮은사원부터
SELECT ename, sal FROM emp ORDER BY sal asc;
#6-2. 사원이름, 급여 정렬
SELECT ename, sal as 월급 FROM emp ORDER BY 월급 asc;
#6-3. 사원이름, 사원번호, 급여 정렬
SELECT ename, deptno, sal FROM emp ORDER BY  deptno asc, sal desc;
#6-4.위와 동일식
SELECT ename, deptno, sal FROM emp ORDER BY 2 asc, 3 desc;

#7. WHERE절 배우기(숫자데이터 검색)
#7-1. 월급3000 이름,월급 직업
SELECT ename,sal, job FROM emp WHERE sal=3000;
#7-2. 월급3000이상, 이름, 월급 출력
SELECT ename as 이름, sal as 월급 FROM emp WHERE sal>=3000;
#오류 상황 : SELECT ename as 이름, sal as 월급 FROM emp WHERE 월급 >=3000;

#8. WHERE절 배우기 (문자와 날짜 검색)
#8-1. 이름이 scott인 사원의 이름,월급,직업,입사일,부서번호 출력
SELECT ename, sal, job, hiredate, deptno FROM emp WHERE ename='SCOTT';
#8-2. 81년 11월 17 입사한 사원의 이름과 입사일을 출력
SELECT ename,hiredate FROM emp WHERE hiredate='81/11/17';
