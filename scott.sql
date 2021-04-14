--scott 소유의 모든 테이블 조회
select * from tab;

--bonus 테이블에서 모든 내용 조회
select * from Bonus;

--emp 테이블의 모든 내용 조회
select * from emp;

--emp 테이블의 empno, ename
select empno, ename from emp;

--emp 테이블의 empno, JOB, HIREDATE 내용 조회
select empno, job, hiredate from emp;

--중복된 값 제거 : distinct
select deptno from emp;
select DISTINCT deptno from emp;

--별칭 
select empno from emp;
select empno as 사원번호 from emp;
select empno 사원번호 from emp;
select empno "사원번호" from emp;


select * FROM emp;

select ename,sal, sal*12+comm as 연봉, comm from emp; 

select ename as 사원명, job as "직 책" from emp;

select 
 *
 from emp;
 
 --정렬 : ORDER BY 정렬 하려는 열 이름 정렬옵션(ASC(오름차순), DESC(내림차순))
 --ENAME, SAL 조회(SAL 내림차순)
 
 select ename, sal from emp order by sal DESC;
 select ename, sal from emp order by sal;
 
 --전체 데이터를 조회할 때 SAL 내림차순 
 select * from emp order by sal DESC;
 
 --EMPNO, ENAME, JOB, 조회할 때 EMPNO의 오름차순으로 조회
 select empno, ename, job from emp order by empno ASC;
 
 --부서번호의 오름차순과 급여의 내림차순 정렬하기
 select* from emp order by deptno ASC, sal DESC;
 
 select empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER,
 sal as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO
 from emp
 order by deptno DESC, ename;
 
 --WHERE : 조건에 맞춰서 조회를 하고 싶을때
 
 --부서번호가 30번인 사원 조회
 select * from emp where deptno = 30;
 
 --사원번호가 7782인 사원 정보 조회
select * from emp where empno = 7782;

--부서번호가 30이고 사원직책이 salesman인 사원 조회
select * from emp where deptno = 30 AND job = 'SALESMAN';

--부서번호가 30이거나 사원직책이 CLERK인 사원 조회
select * from emp where deptno = 30 OR job = 'CLERK';




--산술연산자 : + - * / 
select * from emp where sal*12 = 36000;

--비교연산자 : > < >= <= 

--SAL의 값이 3000 이상인 사원 조회
select * from emp where sal >= 3000;

--급여가 2500이고, 직업이 analyst 사원 조회
select * from emp where sal > 2500 AND job = 'ANALYST';

--사원 이름의 첫 문자가 f와 같거나 뒤쪽인 것만 조회
select * from emp where ename >= 'F';

--직무가 manager, salesman, clerk인 사원 조회
select * from emp where job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';


--등가 비교 연산자( =(동등), !=, <>, ^=, )
--sal 3000이 아닌 사원정보 출력
select * from emp where sal <> 3000;

--논리 부정 연산자 : NOT
select * from emp where NOT sal=3000;

--IN : = 
select * from emp where job IN ('MANAGER', 'SALESMAN', 'CLERK');

select * from emp where job != 'MANAGER' AND job ^= 'SALESMAN' AND job <> 'CLERK';
select * from emp where job NOT IN ('MANAGER', 'SALESMAN', 'CLERK');


--부서번호가 10, 20 사원 조회 
select * from emp where deptno IN (10,20);

--BETWEEN A AND B : 특정 범위의 데이터를 조회

--SAL 2000이상 - 3000 이하 
select * from emp where sal between 2000 AND 3000;

--SAL 2000이상 - 3000 이하가 아닌 사원 조회
select * from emp where sal not between 2000 AND 3000;