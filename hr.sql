--hr�� �ִ� ��� ���̺��� Ȯ��
select * from tab;
--employess ���̺��� ��� ���� Ȯ��
select * from  employees;
--employees ���̺��� first_name, last_name, job_id�� ��ȸ
select first_name, last_name, job_id from employees;

--�����ȣ�� 176�� ����� last_name�� �μ� ��ȣ�� ��ȸ
select LAST_NAME, DEPARTMENT_ID from employees where EMPLOYEE_ID= 176;

--������ 12000 �̻�Ǵ� �������� last_name �� salary�� ��ȸ
select LAST_NAME, SALARY from employees where salary >= 12000;

--������ 5000����  12000�� ���� �̿��� ������� last_name �� salary�� ��ȸ
select LAST_NAME, SALARY from employees where salary < 5000 OR  salary > 12000;

--20��, 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ� ������ ��ȸ
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IN(20,50) 
ORDER BY LAST_NAME, DEPARTMENT_ID;

--Ŀ�̼��� ���� ��� ������� LASTNAME, SALARY, COMMISSION_PCT�� ��ȸ
SELECT LAST_NAME, SALARY, COMMISSION_PCT 
FROM EMPLOYEES
WHERE COMMISSION_PCT > 0 
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

--SALARY�� 2500, 3500, 7000�� �ƴϸ� ������ SA_REP Ȥ�� ST_CLERK�� ��� ��ȸ
SELECT * FROM EMPLOYEES WHERE SALARY NOT IN(2500,3500,7000) AND JOB_ID IN ('SA_REP','ST_CLERK');

--������ڰ� 2008-02-20 ~ 2008-05-01 ���̿� ���� ������� LASTNAME, EMPLOYEEID, HIREDATE�� ��ȸ�� �� 
--������ڰ� ������������ ����(��¥ �����ʹ� ''���̿� �־ ó��)

SELECT LAST_NAME, EMPLOYEE_ID, HIRE_DATE 
FROM EMPLOYEES 
WHERE HIRE_DATE BETWEEN '2008-02-20' AND  '2008-05-01' 
ORDER BY HIRE_DATE DESC;

--2004�⵵�� ���� ������� LAST_NAME, HIRE_dATE�� ��ȸ�� �� �Ի��� �������� �������� ����
SELECT LAST_NAME, HIRE_DATE 
FROM EMPLOYEES WHERE HIRE_dATE 
BETWEEN '2004-01-01' AND'2004-12-31' ORDER BY HIRE_dATE;