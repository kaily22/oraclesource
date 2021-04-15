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


--LIKE �����ڿ� ���ϵ� ī��
--��� �̸��� S�� �����ϴ� ��� (�ڿ� ������ �������)
select * from emp where ename LIKE 'S%';

--��� �̸��� �ι�° ���ڰ� L (���� �� �� : _ ,)
select * from emp where ename LIKE '_L%';

--��� �̸��� AM�� ���ԵǾ� �ִ� ��� ��ȸ
select * from emp where ename LIKE '%AM%';

--��� �̸��� am ���� x
select * from emp where ename not like '%AM%';




-- IS NULL 
--DB������ NULL -> ���� �������� ���� / �ش���� ���� / Ȯ������ ���� ��

SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE MGR IS NULL;
SELECT * FROM EMP WHERE NOT MGR IS NULL;
SELECT * FROM EMP WHERE MGR IS NOT NULL;


--���� ������ : UNION(������ -> �ߺ� ����), UNION ALL(������ -> �ߺ� ����), 
--MINUS(������), INTERSECT(������)

--10�� �μ��� 20�� �μ� ��ȸ
SELECT * FROM EMP WHERE DEPTNO = 10 
UNION 
SELECT * FROM EMP WHERE DEPTNO = 20;

SELECT * FROM EMP WHERE DEPTNO = 10 
UNION ALL
SELECT * FROM EMP WHERE DEPTNO = 20;

SELECT * FROM EMP WHERE DEPTNO = 10 
UNION ALL
SELECT * FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP
MINUS
SELECT * FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP
INTERSECT
SELECT * FROM EMP WHERE DEPTNO = 10;



--20�� 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ����� ���� �����ڸ�
--����ؼ� ��ȸ�ϱ�

SELECT * FROM EMP
WHERE  SAL>2000
MINUS
SELECT * FROM EMP
WHERE DEPTNO = 10;

SELECT * FROM EMP
WHERE DEPTNO = 20 AND SAL>2000
UNION
SELECT * FROM EMP
WHERE DEPTNO = 30 AND SAL>2000;

-- �Լ�(�ܵ����� ���)
-- �����Լ� : ����Ŭ���� �⺻������ �����ϴ� �Լ�
-- ����� ���� �Լ�


--���� �Լ� 1) ��ҹ���
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;

--ORACLE, oracle, Oracle => �Է°� �پ�
--where lower(title) like '%oracle%'

--���� �Լ� 2)���� LENGTHB(BYTE) -> �ѱ� �ϳ��� 3BYTE �Ҵ�
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

-- ENAME ����
SELECT ENAME, LENGTH(ENAME) FROM EMP;

--ENAME ���̰� 5 �̻��� ��� ��ȸ
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 5;

--���� �Լ� : 3) ���ڿ� ����
SELECT JOB, SUBSTR(JOB,1,2) , SUBSTR(JOB,3,2), SUBSTR(JOB,5)
FROM EMP;

--EMP ���̺��� ��� ��� �̸��� ����° ���ں��� ������ ����ϱ�
--�� �̸�, ����°~~
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;


-- ���ڿ� �Լ� : 4) Ư�� ������ ��ġ ã��
SELECT INSTR('HELLO, ORACLE!','L') AS ù��°, INSTR('HELLO, ORACLE!','L',5) AS  �ι�°,
INSTR('HELLO, ORACLE!','L',2,2) AS ����° FROM DUAL;

SELECT INSTRB('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�',2) FROM DUAL;


--��� �̸��� S�� �ִ� ��� ��ȸ
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') >0 ;

--���ڿ� �Լ� : 5) ���ڿ� ��ü
SELECT REPLACE('�̰��� ����Ŭ�̴�', '�̰���', 'This is') FROM DUAL;

--010-1234-5678, 010 1234 5678
SELECT '010-1234-5678', REPLACE('010-1234-5678','-', ' '), 
REPLACE('010-1234-5678', '-') FROM DUAL;


--���ڿ� �Լ� : 6) ���ڿ� ���� 
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO,CONCAT(':', ENAME))
FROM EMP WHERE ENAME = 'SMITH';

--CONCAT() = ||
SELECT (EMPNO||ENAME), EMPNO||':'|| ENAME
FROM EMP WHERE ENAME = 'SMITH';

--���ڿ� �Լ� : 7) Ư�� ���� ���� - TRIM(����), LTRIM, RTRIM
SELECT '          �̰���         ', TRIM('          �̰���         ') FROM DUAL;
SELECT '          �̰���         ', LTRIM('          �̰���         ') FROM DUAL;
SELECT '          �̰���         ', RTRIM('          �̰���         ') FROM DUAL;

SELECT '[' || TRIM(' __ORACLE__ ') || ']' AS TRIM,
'[' || LTRIM(' __ORACLE__ ') || ']' AS LTRIM,
'[' || RTRIM(' __ORACLE__ ') || ']' AS RTRIM FROM DUAL;

--���ڿ� �Լ� : 8) ���ڿ� �ݴ�� ó��
SELECT REVERSE('ORACLE') FROM DUAL;

--���� �Լ� : �ݿø�/�ø�/����/������ ��
SELECT ROUND(1234.5678) AS ROUND, ROUND(1234.5678,0) AS ROUND0,
       ROUND(1234.5678,1) AS ROUND1, ROUND(1234.5678,2) AS ROUND2,
       ROUND(1234.5678,-1) AS ROUND_MINUS1, ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;

--����
SELECT TRUNC(1234.5678) AS TRUNC, TRUNC(1234.5678,0) AS TRUNC0,
       TRUNC(1234.5678,1) AS TRUNC1, TRUNC(1234.5678,2) AS TRUNC2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS, TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;

--������ ���ڿ� ���� ����� ������ ã�� CEIL(ū ����), FLOOR(���� ����)
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) 
FROM DUAL;

--������
SELECT MOD(15,6) , MOD(10,2), MOD(11,2)
FROM DUAL;

--��¥ �Լ� : SYSDATE (����Ŭ ������ ��ġ�� OS ���糯¥�� �ð�)
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW 
FROM DUAL;

--�� ���� ������ ��¥ ���ϱ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;

--�Ի� 10�ֳ��� �Ǵ� ��¥ ���ϱ�
SELECT EMPNO, ENAME, HIREDATE , ADD_MONTHS(HIREDATE,120) FROM EMP;

--���� ��¥�� �������� �Ի� 45�� �̸��� ��� ��ȸ
SELECT * FROM EMP WHERE SYSDATE < ADD_MONTHS(HIREDATE,540);

