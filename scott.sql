--scott ������ ��� ���̺� ��ȸ
select * from tab;

--bonus ���̺��� ��� ���� ��ȸ
select * from Bonus;

--emp ���̺��� ��� ���� ��ȸ
select * from emp;

--emp ���̺��� empno, ename
select empno, ename from emp;

--emp ���̺��� empno, JOB, HIREDATE ���� ��ȸ
select empno, job, hiredate from emp;

--�ߺ��� �� ���� : distinct
select deptno from emp;
select DISTINCT deptno from emp;

--��Ī 
select empno from emp;
select empno as �����ȣ from emp;
select empno �����ȣ from emp;
select empno "�����ȣ" from emp;


select * FROM emp;

select ename,sal, sal*12+comm as ����, comm from emp; 

select ename as �����, job as "�� å" from emp;

select 
 *
 from emp;
 
 --���� : ORDER BY ���� �Ϸ��� �� �̸� ���Ŀɼ�(ASC(��������), DESC(��������))
 --ENAME, SAL ��ȸ(SAL ��������)
 
 select ename, sal from emp order by sal DESC;
 select ename, sal from emp order by sal;
 
 --��ü �����͸� ��ȸ�� �� SAL �������� 
 select * from emp order by sal DESC;
 
 --EMPNO, ENAME, JOB, ��ȸ�� �� EMPNO�� ������������ ��ȸ
 select empno, ename, job from emp order by empno ASC;
 
 --�μ���ȣ�� ���������� �޿��� �������� �����ϱ�
 select* from emp order by deptno ASC, sal DESC;
 
 select empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER,
 sal as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO
 from emp
 order by deptno DESC, ename;
 
 --WHERE : ���ǿ� ���缭 ��ȸ�� �ϰ� ������
 
 --�μ���ȣ�� 30���� ��� ��ȸ
 select * from emp where deptno = 30;
 
 --�����ȣ�� 7782�� ��� ���� ��ȸ
select * from emp where empno = 7782;

--�μ���ȣ�� 30�̰� �����å�� salesman�� ��� ��ȸ
select * from emp where deptno = 30 AND job = 'SALESMAN';

--�μ���ȣ�� 30�̰ų� �����å�� CLERK�� ��� ��ȸ
select * from emp where deptno = 30 OR job = 'CLERK';




--��������� : + - * / 
select * from emp where sal*12 = 36000;

--�񱳿����� : > < >= <= 

--SAL�� ���� 3000 �̻��� ��� ��ȸ
select * from emp where sal >= 3000;

--�޿��� 2500�̰�, ������ analyst ��� ��ȸ
select * from emp where sal > 2500 AND job = 'ANALYST';

--��� �̸��� ù ���ڰ� f�� ���ų� ������ �͸� ��ȸ
select * from emp where ename >= 'F';

--������ manager, salesman, clerk�� ��� ��ȸ
select * from emp where job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';


--� �� ������( =(����), !=, <>, ^=, )
--sal 3000�� �ƴ� ������� ���
select * from emp where sal <> 3000;

--�� ���� ������ : NOT
select * from emp where NOT sal=3000;

--IN : = 
select * from emp where job IN ('MANAGER', 'SALESMAN', 'CLERK');

select * from emp where job != 'MANAGER' AND job ^= 'SALESMAN' AND job <> 'CLERK';
select * from emp where job NOT IN ('MANAGER', 'SALESMAN', 'CLERK');


--�μ���ȣ�� 10, 20 ��� ��ȸ 
select * from emp where deptno IN (10,20);

--BETWEEN A AND B : Ư�� ������ �����͸� ��ȸ

--SAL 2000�̻� - 3000 ���� 
select * from emp where sal between 2000 AND 3000;

--SAL 2000�̻� - 3000 ���ϰ� �ƴ� ��� ��ȸ
select * from emp where sal not between 2000 AND 3000;