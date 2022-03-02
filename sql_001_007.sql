select * from emp;

#1. ���̺��� Ư���� �����ϱ�
#�����ȣ, �̸�, ����
select empno,ename,sal from emp;

#2. ���̺��� ��� �� ����ϱ�
#2-1.��� �� ���� ���
select * from emp;
#2-2. ������ �����
SELECT empno,ename,job,mgr,hiredate,sal, comm,deptno FROM emp;

#3. �÷� ��Ī�� ����Ͽ� ��µǴ� �÷��� �����ϱ�
#�����ȣ, ����̸��̶�� �ѱۿ��̸� �ٲٱ�
SELECT empno as �����ȣ, ename as ����̸�, sal as "Salary" FROM emp; 

#4. ���� ������ ����ϱ�
#4-1. �̸�.������ ���� �ٿ��� ���
SELECT ename || sal FROM emp;
#4-2. ���ڿ��� ���� �����ؼ� ���
SELECT ename || ' �� ������ ' || sal || ' �Դϴ�. ' as �������� FROM emp;
#4-3. ���ڿ��� ���� �����ؼ� ���2
SELECT ename || ' �� ������ ' || job || '�Դϴ�. ' as �������� FROM emp;

#5. �ߺ��� �����͸� �����ؼ� ����ϱ�
#5-1.���� ��½� �ߺ������� �������
SELECT DISTINCT job from emp;
#5-2. ����ũ�� �� ���(���� ���Ͻ�)
SELECT UNIQUE job FROM emp;

#6. �����͸� �����ؼ� ����ϱ� 
#6-1.�������, ���� �����������
SELECT ename, sal FROM emp ORDER BY sal asc;
#6-2. ����̸�, �޿� ����
SELECT ename, sal as ���� FROM emp ORDER BY ���� asc;
#6-3. ����̸�, �����ȣ, �޿� ����
SELECT ename, deptno, sal FROM emp ORDER BY  deptno asc, sal desc;
#6-4.���� ���Ͻ�
SELECT ename, deptno, sal FROM emp ORDER BY 2 asc, 3 desc;

#7. WHERE�� ����(���ڵ����� �˻�)
#7-1. ����3000 �̸�,���� ����
SELECT ename,sal, job FROM emp WHERE sal=3000;
#7-2. ����3000�̻�, �̸�, ���� ���
SELECT ename as �̸�, sal as ���� FROM emp WHERE sal>=3000;
#���� ��Ȳ : SELECT ename as �̸�, sal as ���� FROM emp WHERE ���� >=3000;

#8. WHERE�� ���� (���ڿ� ��¥ �˻�)
#8-1. �̸��� scott�� ����� �̸�,����,����,�Ի���,�μ���ȣ ���
SELECT ename, sal, job, hiredate, deptno FROM emp WHERE ename='SCOTT';
#8-2. 81�� 11�� 17 �Ի��� ����� �̸��� �Ի����� ���
SELECT ename,hiredate FROM emp WHERE hiredate='81/11/17';