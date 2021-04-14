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

