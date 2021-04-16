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


--LIKE 연산자와 와일드 카드
--사원 이름이 S로 시작하는 사원 (뒤에 개수와 상관없이)
select * from emp where ename LIKE 'S%';

--사원 이름의 두번째 글자가 L (문자 한 자 : _ ,)
select * from emp where ename LIKE '_L%';

--사원 이름에 AM이 포함되어 있는 사원 조회
select * from emp where ename LIKE '%AM%';

--사원 이름에 am 포함 x
select * from emp where ename not like '%AM%';




-- IS NULL 
--DB에서의 NULL -> 값이 존재하지 않음 / 해당사항 없음 / 확정되지 않은 값

SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE MGR IS NULL;
SELECT * FROM EMP WHERE NOT MGR IS NULL;
SELECT * FROM EMP WHERE MGR IS NOT NULL;


--집합 연산자 : UNION(합집합 -> 중복 제거), UNION ALL(합집합 -> 중복 포함), 
--MINUS(차집합), INTERSECT(교집합)

--10번 부서와 20번 부서 조회
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



--20번 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 집합 연산자를
--사용해서 조회하기

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

-- 함수(단독으로 사용)
-- 내장함수 : 오라클에서 기본적으로 제공하는 함수
-- 사용자 정의 함수


--문자 함수 1) 대소문자
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;

--ORACLE, oracle, Oracle => 입력값 다양
--where lower(title) like '%oracle%'

--문자 함수 2)길이 LENGTHB(BYTE) -> 한글 하나당 3BYTE 할당
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- ENAME 길이
SELECT ENAME, LENGTH(ENAME) FROM EMP;

--ENAME 길이가 5 이상인 사원 조회
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 5;

--문자 함수 : 3) 문자열 추출
SELECT JOB, SUBSTR(JOB,1,2) , SUBSTR(JOB,3,2), SUBSTR(JOB,5)
FROM EMP;

--EMP 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력하기
--원 이름, 세번째~~
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;


-- 문자열 함수 : 4) 특정 문자의 위치 찾기
SELECT INSTR('HELLO, ORACLE!','L') AS 첫번째, INSTR('HELLO, ORACLE!','L',5) AS  두번째,
INSTR('HELLO, ORACLE!','L',2,2) AS 세번째 FROM DUAL;

SELECT INSTRB('이것이 Oracle이다. 이것도 오라클이다', '이것',2) FROM DUAL;


--사원 이름에 S가 있는 사원 조회
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') >0 ;

--문자열 함수 : 5) 문자열 대체
SELECT REPLACE('이것이 오라클이다', '이것이', 'This is') FROM DUAL;

--010-1234-5678, 010 1234 5678
SELECT '010-1234-5678', REPLACE('010-1234-5678','-', ' '), 
REPLACE('010-1234-5678', '-') FROM DUAL;


--문자열 함수 : 6) 문자열 연결 
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO,CONCAT(':', ENAME))
FROM EMP WHERE ENAME = 'SMITH';

--CONCAT() = ||
SELECT (EMPNO||ENAME), EMPNO||':'|| ENAME
FROM EMP WHERE ENAME = 'SMITH';

--문자열 함수 : 7) 특정 문자 제거 - TRIM(양쪽), LTRIM, RTRIM
SELECT '          이것이         ', TRIM('          이것이         ') FROM DUAL;
SELECT '          이것이         ', LTRIM('          이것이         ') FROM DUAL;
SELECT '          이것이         ', RTRIM('          이것이         ') FROM DUAL;

SELECT '[' || TRIM(' __ORACLE__ ') || ']' AS TRIM,
'[' || LTRIM(' __ORACLE__ ') || ']' AS LTRIM,
'[' || RTRIM(' __ORACLE__ ') || ']' AS RTRIM FROM DUAL;

--문자열 함수 : 8) 문자열 반대로 처리
SELECT REVERSE('ORACLE') FROM DUAL;

--숫자 함수 : 반올림/올림/버림/나머지 값
SELECT ROUND(1234.5678) AS ROUND, ROUND(1234.5678,0) AS ROUND0,
       ROUND(1234.5678,1) AS ROUND1, ROUND(1234.5678,2) AS ROUND2,
       ROUND(1234.5678,-1) AS ROUND_MINUS1, ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;

--버림
SELECT TRUNC(1234.5678) AS TRUNC, TRUNC(1234.5678,0) AS TRUNC0,
       TRUNC(1234.5678,1) AS TRUNC1, TRUNC(1234.5678,2) AS TRUNC2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS, TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;

--지정한 숫자와 가장 가까운 정수를 찾는 CEIL(큰 정수), FLOOR(작은 정수)
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) 
FROM DUAL;

--나머지
SELECT MOD(15,6) , MOD(10,2), MOD(11,2)
FROM DUAL;

--날짜 함수 : SYSDATE (오라클 서버가 설치된 OS 현재날짜와 시간)
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW 
FROM DUAL;

--몇 개월 이후의 날짜 구하기 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;

--입사 10주년이 되는 날짜 구하기
SELECT EMPNO, ENAME, HIREDATE , ADD_MONTHS(HIREDATE,120) FROM EMP;

--현재 날짜를 기준으로 입사 45년 미만인 사원 조회
SELECT * FROM EMP WHERE SYSDATE < ADD_MONTHS(HIREDATE,540);

--두 날짜 사이의 차이 출력 : MONTHS_BETWEEN
SELECT * FROM EMP WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 540;


SELECT EMPNO, ENAME, HIREDATE, SYSDATE,  
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS1, 
MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM EMP;

--돌아오는 요일(NEXT_DAY), 달의 마지막 날짜(LAST_DAY)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE) FROM DUAL;

--자료형 변환 함수 

--1) TO_CHAR() : 날짜, 숫자 데이터를 문자로 변환
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MM') AS 현재월 FROM DUAL;
SELECT TO_cHAR(SYSDATE, 'MON') AS 현재월 FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD') AS 현재일자 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS 현재일자 FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD') AS 현재일자 FROM DUAL;

SELECT TO_cHAR(SYSDATE, 'HH:MI:SS PM') AS 현재시간 FROM DUAL;

--TO_NUMBER() : 문자를 숫자 데이터 형식으로 변환
SELECT 1300-'1500', '1300'+1500 FROM DUAL;

SELECT 1300-TO_NUMBER('1,500' ,'999,999'), TO_NUMBER('1,300','999,999')+1500 FROM DUAL;

-- TO_DATE() : 문자 데이터를 날짜형 데이터로 변환 
SELECT TO_DATE('2021-04-16') AS TODATE1, TO_DATE('20210416') AS TODATE2 FROM DUAL;

SELECT TO_DATE('2021-04-16') - TO_DATE('2021-04-12') FROM DUAL;

-- 널처리 함수 -NVL(), NVL2()
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) FROM EMP;

--NVL2(널 열, 널이 아닐경우 반환할 값, 널일 경우 반환할 값)
SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'0','X'), SAL+NVL2(COMM, SAL*12+COMM, SAL*12)
FROM EMP;


--DECODE 함수
SELECT EMPNO, ENAME, JOB, SAL, DECODE(JOB,
                                        'MANAGER', SAL*1.1, 
                                        'SALESMAN',SAL*1.05,
                                        'ANALYST', SAL,
                                        SAL*1.03) AS UPSAL
FROM EMP;

--CASE (DECODE 범용성이 높다)
SELECT EMPNO, ENAME, JOB, SAL, CASE JOB
                                        WHEN 'MANAGER' THEN SAL*1.1
                                        WHEN 'SALESMAN' THEN SAL*1.05
                                        WHEN 'ANALYST' THEN SAL
                                        ELSE SAL*1.03 
                                        END AS UPSAL
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
       CASE 
          WHEN COMM IS NULL THEN '해당사항 없음'
          WHEN COMM = 0 THEN '수당 없음'
          WHEN COMM > 0 THEN '수당 : '|| COMM
        END AS COMM_TEXT FROM EMP;

--1
SELECT EMPNO ENAME, SAL, TRUNC(SAL / 21.5, 2)  AS DAY_PAY, ROUND(SAL /21.5/8 , 1) AS TIME_PAY
FROM EMP;


--2
SELECT EMPNO, ENAME, HIREDATE, 
NEXT_DAY(ADD_MONTHS(HIREDATE, 3),'월요일') AS R_JOB, 
NVL(TO_CHAR(COMM),'N/A') AS COMM FROM EMP;

--3
SELECT EMPNO, ENAME, MGR, DECODE(SUBSTR(TO_CHAR(MGR),1,2),
                                 NULL, '0000',
                                 '75', '5555',
                                 '76', '6666',
                                 '77', '7777',
                                 '78', '8888',
                                 SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR   
FROM EMP;

SELECT EMPNO, ENAME, MGR, CASE WHEN MGR IS NULL THEN '0000'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2) = '75'  THEN '5555'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2) = '76' THEN '6666'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2) = '77' THEN '7777'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2) = '78' THEN '8888'
                             ELSE TO_CHAR(MGR)
                             END AS CHG_MGR
FROM EMP;


--다중행 함수 : SUM, COUNT, MAX, MIN, AVERAGE
SELECT SUM(COMM) FROM EMP;

SELECT COUNT(*) FROM EMP;

SELECT COUNT(*) FROM EMP WHERE DEPTNO = 30;

SELECT COUNT(DISTINCT SAL), COUNT(SAL) FROM EMP;

SELECT MAX(SAL), MIN(SAL) FROM EMP;

SELECT MAX(HIREDATE), MIN(HIREDATE) FROM EMP;

--부서 번호가 20인 사람중에 가장 오래 일한 사람
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO = 20;

SELECT AVG(SAL) FROM EMP ;

--GROUP BY : 결과 값을 원하는 열로 묶어 출력
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;

--부서번호, 직책별 평균 급여 구하기
SELECT DEPTNO, JOB,  AVG(SAL) FROM EMP 
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB;

--각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000 이상인 그룹 출력
-- HAVING 절 : GROUP BY 절에 조건을 줄 때 사용
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) > 2000
ORDER BY DEPTNO, JOB;

--부서별 직책의 평균 급여가 500 이상인 사원들의 부서 번호, 직책, 부서별 직책의 평균
--급여 조회
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL)>=500
ORDER BY DEPTNO, JOB;

-- 문) 부서번호, 평균급여, 최고급여, 최저급여, 사원 수 출력하기
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서별로 출력
SELECT DEPTNO, FLOOR(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(EMPNO)
FROM EMP
GROUP BY DEPTNO;

--문) 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT COUNT(*),JOB
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB) >=3 ;

--문) 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 추력
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS 입사연도, COUNT(*) 
FROM EMP
GROUP BY DEPTNO , TO_CHAR(HIREDATE, 'YYYY');

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >=2000 ORDER BY DEPTNO, JOB;


SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >=2000 ORDER BY DEPTNO, JOB;

--JOIN(조인)
--등가조인(INNER JOIN(내부조인), 단순조인)
SELECT * FROM DEPT;
SELECT * FROM EMP;

--column ambiguously defined
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- 카테시안 조인(나올 수 있는 모든 조합) 조인
SELECT * FROM EMP, DEPT ORDER BY EMPNO;

--EMP 테이블의 DEPTNO 와 DEPT 테이블의 DEPTNO가 일치하는 회원들의 
--사원번호, 이름, 부서번호, 부서명 조회(단, 급여가 3000이상인 사원 출력)
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;


--EMP테이블 별칭을 E로, DEPT 테이블 별칭을 D로 하여 급여가 2500 이상이고
--사원번호가 9999이하인 사원들의 정보 출력
--EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC를 출력
SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL>=2500 AND EMPNO<9999;

--EMP 테이블 별칭을 E로, SALGRADE 테이블 별칭을 S로 하여 각 사원의 정보와
--사원의 급여 등급 정보를 출력하기
SELECT * FROM SALGRADE;

--비등가 조인
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, E.JOB, E.MGR, E.HIREDATE, E.SAL,
E.COMM, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--자체조인(SELF JOIN) : 조인을 할 때 두번째 테이블이 자기 자신
SELECT * FROM EMP;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

--외부 조인

--왼쪽 외부 조인 WHERE TABLE1.COL1 = TABLE2.COL1(+)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

--오른쪽 외부 조인 WHERE TABLE1.COL1(+) = TABLE2.COL1
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

-- + 기호를 붙이는 외부 조인 방식은 전체 외부 조인 구현 불가능 FULL OUTER JOIN
--SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
--FROM EMP E1, EMP E2
--WHERE E1.MGR(+) = E2.EMPNO(+);

--표준문법 조인
--NATURAL JOIN (등가조인)
SELECT E.EMPNO, E.ENAME, DEPTNO, D.DNAME
FROM EMP E NATURAL JOIN DEPT D ORDER BY DEPTNO, E.EMPNO;

--JOIN~ON
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO, E.EMPNO;

--OUTER JOIN ~ON
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO ORDER BY E1.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO ORDER BY E1.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO ORDER BY E1.EMPNO;

SELECT * FROM DEPT;
SELECT * FROM EMP;

-- 1) 각 부서별 평균급여, 최대급여, 최소 급여, 사원수를 출력하기
--단, 부서번호, 부서명, 평균, 최대, 최소, 사원수 형태로 출력
--EMP,DEPT 조인
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(SAL)),MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME;

--2) 모든 부서정보와(아우터조인) 사원 정보를 부서번호, 부서명, 사원번호, 사원명, 직무, 급여 형태로
--출력하기(EMP, DEPT 조인)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM DEPT D LEFT OUTER JOIN EMP E ON D.DEPTNO = E.DEPTNO ;

--3) 급여가 2천 초과인 사원들의 부서정보, 사원정보 출력(SQL 표준 문법으로 작성)
--부서번호, 부서명, 사원번호, 사원명, 급여 순으로 출력

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D ON E.SAL > 2000;
