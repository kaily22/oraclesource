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

