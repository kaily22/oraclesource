--hr에 있는 모든 테이블을 확인
select * from tab;
--employess 테이블의 모든 내용 확인
select * from  employees;
--employees 테이블의 first_name, last_name, job_id만 조회
select first_name, last_name, job_id from employees;

--사원번호가 176인 사람의 last_name과 부서 번호를 조회
select LAST_NAME, DEPARTMENT_ID from employees where EMPLOYEE_ID= 176;

--연봉이 12000 이상되는 직원들의 last_name 및 salary를 조회
select LAST_NAME, SALARY from employees where salary >= 12000;

--연봉이 5000에서  12000의 범위 이외인 사람들의 last_name 및 salary를 조회
select LAST_NAME, SALARY from employees where salary < 5000 OR  salary > 12000;

--20번, 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳 순으로 조회
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IN(20,50) 
ORDER BY LAST_NAME, DEPARTMENT_ID;

--커미션을 버는 모든 사원들의 LASTNAME, SALARY, COMMISSION_PCT를 조회
SELECT LAST_NAME, SALARY, COMMISSION_PCT 
FROM EMPLOYEES
WHERE COMMISSION_PCT > 0 
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

--SALARY이 2500, 3500, 7000이 아니며 직업이 SA_REP 혹은 ST_CLERK인 사원 조회
SELECT * FROM EMPLOYEES WHERE SALARY NOT IN(2500,3500,7000) AND JOB_ID IN ('SA_REP','ST_CLERK');

--고용일자가 2008-02-20 ~ 2008-05-01 사이에 고용된 사원들의 LASTNAME, EMPLOYEEID, HIREDATE를 조회한 후 
--고용일자가 내림차순으로 정렬(날짜 데이터는 ''사이에 넣어서 처리)

SELECT LAST_NAME, EMPLOYEE_ID, HIRE_DATE 
FROM EMPLOYEES 
WHERE HIRE_DATE BETWEEN '2008-02-20' AND  '2008-05-01' 
ORDER BY HIRE_DATE DESC;

--2004년도에 고용된 사람들의 LAST_NAME, HIRE_dATE를 조회한 후 입사일 기준으로 오름차순 정렬
SELECT LAST_NAME, HIRE_DATE 
FROM EMPLOYEES WHERE HIRE_dATE 
BETWEEN '2004-01-01' AND'2004-12-31' ORDER BY HIRE_dATE;