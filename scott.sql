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

select * from emp_tmp;



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

--�� ��¥ ������ ���� ��� : MONTHS_BETWEEN
SELECT * FROM EMP WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 540;


SELECT EMPNO, ENAME, HIREDATE, SYSDATE,  
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS1, 
MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM EMP;

--���ƿ��� ����(NEXT_DAY), ���� ������ ��¥(LAST_DAY)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE) FROM DUAL;

--�ڷ��� ��ȯ �Լ� 

--1) TO_CHAR() : ��¥, ���� �����͸� ���ڷ� ��ȯ
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') AS ���糯¥ FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MM') AS ����� FROM DUAL;
SELECT TO_cHAR(SYSDATE, 'MON') AS ����� FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD') AS �������� FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS �������� FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD') AS �������� FROM DUAL;

SELECT TO_cHAR(SYSDATE, 'HH:MI:SS PM') AS ����ð� FROM DUAL;

--TO_NUMBER() : ���ڸ� ���� ������ �������� ��ȯ
SELECT 1300-'1500', '1300'+1500 FROM DUAL;

SELECT 1300-TO_NUMBER('1,500' ,'999,999'), TO_NUMBER('1,300','999,999')+1500 FROM DUAL;

-- TO_DATE() : ���� �����͸� ��¥�� �����ͷ� ��ȯ 
SELECT TO_DATE('2021-04-16') AS TODATE1, TO_DATE('20210416') AS TODATE2 FROM DUAL;

SELECT TO_DATE('2021-04-16') - TO_DATE('2021-04-12') FROM DUAL;

-- ��ó�� �Լ� -NVL(), NVL2()
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) FROM EMP;

--NVL2(�� ��, ���� �ƴҰ�� ��ȯ�� ��, ���� ��� ��ȯ�� ��)
SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'0','X'), SAL+NVL2(COMM, SAL*12+COMM, SAL*12)
FROM EMP;


--DECODE �Լ�
SELECT EMPNO, ENAME, JOB, SAL, DECODE(JOB,
                                        'MANAGER', SAL*1.1, 
                                        'SALESMAN',SAL*1.05,
                                        'ANALYST', SAL,
                                        SAL*1.03) AS UPSAL
FROM EMP;

--CASE (DECODE ���뼺�� ����)
SELECT EMPNO, ENAME, JOB, SAL, CASE JOB
                                        WHEN 'MANAGER' THEN SAL*1.1
                                        WHEN 'SALESMAN' THEN SAL*1.05
                                        WHEN 'ANALYST' THEN SAL
                                        ELSE SAL*1.03 
                                        END AS UPSAL
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
       CASE 
          WHEN COMM IS NULL THEN '�ش���� ����'
          WHEN COMM = 0 THEN '���� ����'
          WHEN COMM > 0 THEN '���� : '|| COMM
        END AS COMM_TEXT FROM EMP;

--1
SELECT EMPNO ENAME, SAL, TRUNC(SAL / 21.5, 2)  AS DAY_PAY, ROUND(SAL /21.5/8 , 1) AS TIME_PAY
FROM EMP;


--2
SELECT EMPNO, ENAME, HIREDATE, 
NEXT_DAY(ADD_MONTHS(HIREDATE, 3),'������') AS R_JOB, 
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


--������ �Լ� : SUM, COUNT, MAX, MIN, AVERAGE
SELECT SUM(COMM) FROM EMP;

SELECT COUNT(*) FROM EMP;

SELECT COUNT(*) FROM EMP WHERE DEPTNO = 30;

SELECT COUNT(DISTINCT SAL), COUNT(SAL) FROM EMP;

SELECT MAX(SAL), MIN(SAL) FROM EMP;

SELECT MAX(HIREDATE), MIN(HIREDATE) FROM EMP;

--�μ� ��ȣ�� 20�� ����߿� ���� ���� ���� ���
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO = 20;

SELECT AVG(SAL) FROM EMP ;

--GROUP BY : ��� ���� ���ϴ� ���� ���� ���
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;

--�μ���ȣ, ��å�� ��� �޿� ���ϱ�
SELECT DEPTNO, JOB,  AVG(SAL) FROM EMP 
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB;

--�� �μ��� ��å�� ��� �޿��� ���ϵ�, ��� �޿��� 2000 �̻��� �׷� ���
-- HAVING �� : GROUP BY ���� ������ �� �� ���
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) > 2000
ORDER BY DEPTNO, JOB;

--�μ��� ��å�� ��� �޿��� 500 �̻��� ������� �μ� ��ȣ, ��å, �μ��� ��å�� ���
--�޿� ��ȸ
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL)>=500
ORDER BY DEPTNO, JOB;

-- ��) �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ��� �� ����ϱ�
-- ��, ��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ����� ���
SELECT DEPTNO, FLOOR(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(EMPNO)
FROM EMP
GROUP BY DEPTNO;

--��) ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT COUNT(*),JOB
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB) >=3 ;

--��) ������� �Ի翬���� �������� �μ����� �� ���� �Ի��ߴ��� �߷�
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS �Ի翬��, COUNT(*) 
FROM EMP
GROUP BY DEPTNO , TO_CHAR(HIREDATE, 'YYYY');

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >=2000 ORDER BY DEPTNO, JOB;


SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >=2000 ORDER BY DEPTNO, JOB;

--JOIN(����)
--�����(INNER JOIN(��������), �ܼ�����)
SELECT * FROM DEPT;
SELECT * FROM EMP;

--column ambiguously defined
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- ī�׽þ� ����(���� �� �ִ� ��� ����) ����
SELECT * FROM EMP, DEPT ORDER BY EMPNO;

--EMP ���̺��� DEPTNO �� DEPT ���̺��� DEPTNO�� ��ġ�ϴ� ȸ������ 
--�����ȣ, �̸�, �μ���ȣ, �μ��� ��ȸ(��, �޿��� 3000�̻��� ��� ���)
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;


--EMP���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� �޿��� 2500 �̻��̰�
--�����ȣ�� 9999������ ������� ���� ���
--EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC�� ���
SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL>=2500 AND EMPNO<9999;

--EMP ���̺� ��Ī�� E��, SALGRADE ���̺� ��Ī�� S�� �Ͽ� �� ����� ������
--����� �޿� ��� ������ ����ϱ�
SELECT * FROM SALGRADE;

--�� ����
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, E.JOB, E.MGR, E.HIREDATE, E.SAL,
E.COMM, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--��ü����(SELF JOIN) : ������ �� �� �ι�° ���̺��� �ڱ� �ڽ�
SELECT * FROM EMP;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

--�ܺ� ����

--���� �ܺ� ���� WHERE TABLE1.COL1 = TABLE2.COL1(+)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

--������ �ܺ� ���� WHERE TABLE1.COL1(+) = TABLE2.COL1
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

-- + ��ȣ�� ���̴� �ܺ� ���� ����� ��ü �ܺ� ���� ���� �Ұ��� FULL OUTER JOIN
--SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_NAME
--FROM EMP E1, EMP E2
--WHERE E1.MGR(+) = E2.EMPNO(+);

--ǥ�ع��� ����
--NATURAL JOIN (�����)
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

-- 1) �� �μ��� ��ձ޿�, �ִ�޿�, �ּ� �޿�, ������� ����ϱ�
--��, �μ���ȣ, �μ���, ���, �ִ�, �ּ�, ����� ���·� ���
--EMP,DEPT ����
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(SAL)),MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME;

--2) ��� �μ�������(�ƿ�������) ��� ������ �μ���ȣ, �μ���, �����ȣ, �����, ����, �޿� ���·�
--����ϱ�(EMP, DEPT ����)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM DEPT D LEFT OUTER JOIN EMP E ON D.DEPTNO = E.DEPTNO ;

--3) �޿��� 2õ �ʰ��� ������� �μ�����, ������� ���(SQL ǥ�� �������� �ۼ�)
--�μ���ȣ, �μ���, �����ȣ, �����, �޿� ������ ���

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D ON E.SAL > 2000;



--�� ���� ���̺� ����

--���� ���
SELECT E1.EMPNO AS EMPNO_E1, E2.EMPNO AS EMPNO_E2, E3.EMPNO AS EMPNO_E3
FROM EMP E1, EMP E2, EMP E3
WHERE E1.EMPNO = E2.EMPNO AND E2.EMPNO = E3.EMPNO;

--ǥ�� ���
SELECT E1.EMPNO AS EMPNO_E1, E2.EMPNO AS EMPNO_E2, E3.EMPNO AS EMPNO_E3
FROM EMP E1 JOIN EMP E2 ON  E1.EMPNO = E2.EMPNO 
     JOIN EMP E3 ON  E2.EMPNO = E3.EMPNO;
     
--��� �μ� ������ ��� ������ �μ� ��ȣ, �μ���, �����ȣ, �����, ����, �޿�
--�μ���ȣ, ����̸� ������������ ����(OUTER JOIN 3��)

--RIGHT OUTER JOIN
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME
FROM EMP E,DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY DEPTNO;


SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL, E.MGR, S.LOSAL, S.HISAL, S.GRADE, 
       E2.EMPNO AS MGR_EMPNO, E2. ENAME AS MGR_ENAME
FROM EMP E, DEPT D, SALGRADE S, EMP E2
WHERE E.DEPTNO(+) = D.DEPTNO AND
    E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) 
    AND E.MGR = E2.EMPNO(+)
    ORDER BY D.DEPTNO, E.ENAME;
    
--ǥ�� 
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL, E.MGR, S.LOSAL, S.HISAL, S.GRADE, 
       E2.EMPNO AS MGR_EMPNO, E2. ENAME AS MGR_ENAME
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
     LEFT OUTER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
     LEFT OUTER JOIN EMP E2 ON E.MGR = E2.EMPNO
ORDER BY D.DEPTNO, E.ENAME;


--���� ���� : SQL ���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� SQL �� ���ο��� ����ϴ� SELECT��
--JONES ��� ����� �޿����� ���� �޿��� �޴� ��� ��ȸ 

SELECT SAL FROM EMP WHERE ENAME = 'JONES'; --2975
SELECT * FROM EMP WHERE SAL > 2975;

--�������� ���
SELECT * FROM EMP WHERE SAL> (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

--'ALLEN' ����� �߰����纸�� ���� �߰������� �޴� ��� ��ȸ
SELECT * FROM EMP WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');

--WARD���� ���� �Ի��� ��� ��ȸ
SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'WARD');

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� �������
SELECT * FROM EMP WHERE DEPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);
--(�����ȣ, �����, ����, �޿�) �� �ҼӺμ�����(�μ���ȣ, �μ���, ������ġ)�� ��ȸ
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20 
AND SAL > (SELECT AVG(SAL) FROM EMP);

-- �� �μ��� �ְ� �޿��� ������ �޿� �� ū �޿��� �޴� ��� ������ ��ȸ
-- single-row subquery returns more than one row
-->= ������ ��������
SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--�� �μ��� �ְ� �޿��� ������ �޿��� �޴� ��� ���� ��ȸ
SELECT * FROM EMP WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
SELECT * FROM EMP WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ���
SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

SELECT * 
FROM EMP
WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30); --1600, 1250, 2850, 1500, 950


SELECT *
FROM EMP
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- ALL : ���� ������ ��� ����� ���ǽĿ� �¾� �������� ���� ������ ���ǽ��� TRUE��
SELECT *
FROM EMP
WHERE SAL < ALL(SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);


SELECT *
FROM EMP
WHERE SAL > ALL(SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

--EXISTS : ���������� ��� ���� �ϳ� �̻� �����ϸ� ���ǽ��� ��� TRUE, �������� ������ FALSE
--FALSE�� �ȳ���
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 50);


SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 20);

SELECT EMPNO, DEPTNO
FROM EMP
WHERE EXISTS (SELECT DEPTNO
              FROM DEPT 
              WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = DEP.DEPTNO);

-- ��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

--��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ�����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�(��, ����� �� �޿��� ���� ������ �����ϵ� 
--  �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�)
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
                 AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;

--���߿� ��������
--�ڽ��� �μ� ������ �ְ� ������ ������ �޿��� �޴� ��� ����
SELECT * 
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);

SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

--���� ����(FROM ���� ����ϴ� �������� : �ζ��� ��)
--Ư�� ���̺� ��ü �����Ͱ� �ƴ� SELECT ���� ���� �Ϻ� �����͸� ���� ������ �� �� ��Ī
-- �ٿ��� ����ϴ� ���
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
     (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

--���� ����(SELECT ���� ����ϴ� �������� : ��Į�� ��������)
SELECT EMPNO, ENAME, JOB, SAL,(SELECT GRADE 
                               FROM SALGRADE 
                               WHERE E.SAL BETWEEN LOSAL AND HISAL) 
                               AS SALGRADE,
                               DEPTNO, (SELECT DNAME
                                       FROM DEPT
                                       WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME                                      
FROM EMP E;

--Q) 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� 
--������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.

SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO=10 AND E.JOB NOT IN(SELECT JOB FROM EMP WHERE DEPTNO = 30);

--Q) å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� 
--�������, �޿���� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�(��, ���������� Ȱ���� �� 
--������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.)

SELECT EMPNO, ENAME, SAL,(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS GRADE
FROM EMP E
WHERE SAL > ( SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');

--����ϴ� ���
SELECT EMPNO, ENAME, SAL,(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS GRADE
FROM EMP E
WHERE SAL > ALL ( SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

--������ ����
--���̺� ����(���̺� ������ ������ ��� ����)
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP;

--INSERT ���� ���� 
INSERT INTO DEPT_TEMP VALUES (50,'DATABASE','SEOUL');
INSERT INTO DEPT_TEMP(DEPTNO, DNAME,LOC) VALUES (50, 'DATABASE','SEOUL');

--"not enough values"
INSERT INTO DEPT_TEMP(DEPTNO, DNAME) VALUES (60, 'NETWORK');


INSERT INTO DEPT_TEMP VALUES (70,'DATABASE2');

--value larger than specified 
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(70, 'WEB',NULL);

--���̺� ������ ����
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP VALUES(9999,'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01',4000,NULL,10);

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(1111,'������','MANAGER',NULL,'2003-01-01', 5000, 1000,10);

INSERT INTO EMP_TEMP VALUES(2222,'����ȣ','MANAGER',1111,SYSDATE,5000, NULL,10);

--EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� ����� 1�� ������� EMP_TEMP �߰�
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,E.SAL, E.COMM, E.DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE =1;

COMMIT;


--update : ������ ����
--set ������ �� �� = ������ ��, ������ �� �� = ������ �� �� = ������ ��
--where ����(�ʼ��� �ƴ�)

select * from dept_temp;

--���̺��� Ư�� �� ���� ��ü ����

update dept_temp
set LOC = 'SEOUL'
where deptno = 80;

SELECT *
FROM EMP_TEMP;

--�޿��� 3000 ������ ����� �߰� ������ 50���� ����
UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <= 3000;


ROLLBACK;

--���� ������ ����Ͽ� ������ ����

create table dept_temp2 as select * from dept;
select * from dept_temp2;

UPDATE DEPT_TEMP2
SET(DNAME, LOC) = (SELECT DNAME, LOC
                   FROM DEPT 
                   WHERE DEPTNO = 40)
WHERE DEPTNO = 30;
ROLLBACK;


UPDATE dept_temp2
SET LOC = 'SEOUL'
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT_TEMP2
                WHERE DNAME ='OPERATIONS');

SELECT * FROM DEPT_TEMP2;

ROLLBACK;


--DELETE : ���̺� �ִ� ������ ����
--DELETE ���̺� WHERE ���� ����
--DELETE FROM ���̺� �� WHERE ��������

CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP2;

ROLLBACK;

--��ü ����
DELETE EMP_TEMP2;

--�κ� ����
--JOB�� �Ŵ����� ��� ����
DELETE 
FROM EMP_TEMP2
WHERE JOB = 'MANAGER';

ROLLBACK;
SELECT * FROM EMP_TEMP2;

--���� ������ ����Ͽ� ������ ����
--�޿� ����� 3����̰� , 30�� �μ��� ����� ����
-- <= ������ ��������

DELETE FROM EMP_TEMP2
WHERE EMPNO IN
          (SELECT E.EMPNO
           FROM EMP_TEMP2 E, SALGRADE S
           WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                  AND S.GRADE = 3 AND  E.DEPTNO=30);
ROLLBACK;

SELECT * FROM EMP_TEMP2;
--EMP_TEMP2 ���̺��� �޿��� 5õ �̻��� ��� ����
DELETE
FROM EMP_TEMP2
WHERE SAL >= 5000;


CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

SELECT * FROM EXAM_EMP;
INSERT INTO EXAM_EMP VALuES(7201,'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, null, 50);
INSERT INTO EXAM_EMP VALuES(7202,'TEST_USER2', 'MANAGER', 7201, '2016-02-21', 1800, null, 50);
INSERT INTO EXAM_EMP VALuES(7203,'TEST_USER3', 'MANAGER', 7201, '2016-04-11', 3400, null, 60);
INSERT INTO EXAM_EMP VALuES(7204,'TEST_USER4', 'MANAGER', 7201, '2016-05-31', 2700, 300, 60);
INSERT INTO EXAM_EMP VALuES(7205,'TEST_USER5', 'MANAGER', 7201, '2016-07-20', 2600, null, 70);
INSERT INTO EXAM_EMP VALuES(7206,'TEST_USER6', 'MANAGER', 7201, '2016-09-08', 2600, null, 80);
INSERT INTO EXAM_EMP VALuES(7207,'TEST_USER7', 'MANAGER', 7201, '2016-10-28', 2300, null, 80);
INSERT INTO EXAM_EMP VALuES(7208,'TEST_USER8', 'MANAGER', 7201, '2018-03-09', 1200, null, 80);

UPDATE EXAM_EMP
SET DEPTNO = 70
WHERE SAL > (SELECT AVG(SAL)
                  FROM EXAM_EMP
                  WHERE DEPTNO = 50);


UPDATE EXAM_EMP
SET SAL = SAL * 1.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) 
FROM EXAM_EMP WHERE DEPTNO = 60);

DELETE FROM EXAM_EMP
WHERE EMPNO IN(SELECT E.EMPNO
                FROM EXAM_EMP E, SALGRADE S
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=5);
COMMIT;

--Ʈ����� : �۾� ������ �ּ� ����
-- commit(�ݿ�)/rollback(���)

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

--DML���� => Ʈ�����
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');

UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;

DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_TCL;
--���
ROLLBACK;

--�ݿ�
COMMIT;

-- ���� : � Ȱ���� ���� �ð��̳� �Ⱓ 
--  �����ͺ��̽� ������ �������� � �����ͺ��̽����� ���� �۾��� ������ ��
--  ������ �����ϱ���� ��ü �Ⱓ 


SELECT * FROM DEPT_TCL;  
DELETE 
FROM DEPT_tCL
WHERE DEPTNO = 50;
COMMIT;


UPDATE DEPT_TCL SET LOC = 'SEOUL'
WHERE DEPTNO = 30;

COMMIT;
SELECT * FROM DEPT_TCL;

--������ ���Ǿ�(DDL) : ���� ��ü�� ����, ����, ����, ��� ����
                    --AUTO COMMIT ����

--create, alter, drop

--���̺� ����
--create table ���̺�� (��1 �̸� �ڷ���, ��2�̸� �ڷ���.....);


--���̺� �� ���� ��Ģ 
--���ڷ� ����(����, �ѱ�, ���� 0~9, Ư������ $,_, # ����)
--���̺���� 30 BYTE ����/
--���� ����� ������ ���̺� �̸��� �ߺ� X
--Ű����� ���̺�� ��� �Ұ�(select, delete...)


CREATE TABLE EMP_DDL(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10),
 JOB VARCHAR2(9),
 MGR NUMBER(4),
 HIREDATE DATE,
 SAL NUMBER(7,2),
 COMM NUMBER(7,2), --��ü �ڸ����� 7�ڸ��ε� �� �� �Ҽ��� �ڸ����� 2�ڸ��� �ϰڴ�
 DEPT NUMBER(2)
);

--���� Ÿ�� : CHAR(10), NCHAR(10), VARCHAR(10), NVARCHAR2(10)
--N : �����ڵ�, V: Variable(����)
--CHAR : �������� ������
--NCHAR: �����ڵ� �������� ������
--VARCHAR2 : �������� ������(����Ʈ ����)
--NVARCHAR2 : �����ڵ� �������� ������

SELECT * FROM EMP_DDL;

CREATE TABLE TEST(
  ID NUMBER(4),
  NAME VARCHAR(3));

DESC TEST;

INSERT INTO TEST(ID, NAME) VALUES(10, 'ȫ�浿');
--���� �ߵ�
INSERT INTO TEST(ID, NAME) VALUES(10, 'LKG');

CREATE TABLE TEST2(
  ID NUMBER(4),
  NAME NCHAR(3)); --���� �״���� ������ �ǹ�(�������̸� ����ϰ���)
  
INSERT INTO TEST2(ID,NAME) VALUES(10,'ȫ�浿');
INSERT INTO TEST2(ID,NAME) VALUES(20,'��');

CREATE TABLE TEST3(
   ID NUMBER(4),
   NAME NVARCHAR2(3)); --���� �״���� ������ �ǹ�(�������̸� ����ϰ���)
   
INSERT INTO TEST3(ID, NAME) VALUES(10,'ȫ�浿');
INSERT INTO TEST3(ID, NAME) VALUES (20, '��');

SELECT * FROM TEST2 WHERE NAME = '��';

CREATE TABLE DEPT_DDL AS SELECT* FROM DEPT;
CREATE TABLE DEPT_DDL_30 AS SELECT * FROM DEPT WHERE DEPTNO = 30;
CREATE TABLE DEPT_DDL2 AS SELECT * FROM DEPT WHERE 1<>1;
   
--DROP : ����
DROP TABLE DEPT_DDL2;

--ALTER : ����

CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

--���̺� �÷� �߰��ϱ�
ALTER TABLE EMP_ALTER ADD HP VARCHAR(20);

--�� �̸� �����ϱ� : RENAME 
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;

--�� �ڷ��� �����ϱ� 
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);
DESC EMP_ALTER;

--Ư�� ���� ����
ALTER TABLE EMP_ALTER DROP COLUMN TEL;

--���̺��� �̸� ���� : RENAME
RENAME EMP_ATLER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;
DESC EMP_RENAME;


--[�ǽ�] MEMEBER ���̺� �ۼ�

DROP TABLE MEMBER;
CREATE TABLE MEMBER (
ID CHAR(8),
NAME VARCHAR2(10), --NVARCHAR2 ����
ADDR VARCHAR2(50),
NATION NCHAR(4),
EMAIL VARCHAR(50),
AGE NUMBER(7,2)
);

ALTER TABLE MEMBER ADD  BIGO VARCHAR2(20);

ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);

ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK; 

select * FROM MEMBER;

INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE) VALUES('hong1234','ȫ�浿', '����� ���α� ������', '���ѹα�','hong123@naver.com',25);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1235','�̽±�', '����� ������ ȭ�', '���ѹα�','lee89@naver.com',26);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1236','��ȣ��', '����� ������ �����', '���ѹα�','kang56@naver.com',42);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE) VALUES('hong1237','�̼���', '��⵵ ��õ��',       '���ѹα�','leesu@naver.com',42);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1238','������', '����� ������ ��ġ��', '���ѹα�','seo568@naver.com',36);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1239','�迵ö', '����� ������ ������', '���ѹα�','young@naver.com',41);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1210','������', '����� ����� ���1��', '���ѹα�','kim@naver.com',48);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1211','��â��', '����� ��õ�� �ſ���', '���ѹα�','limchang@naver.com',45);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1212','������', '����� ������ ���', '���ѹα�','kimjong@naver.com',44);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1213','�����', '��⵵ �ϻ굿�� �ϻ굿','���ѹα�','kim77@naver.com',36);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1214','���ȣ', '��õ�� ���� ���µ�',  '���ѹα�','hong789@naver.com',26);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1215','�ΰ���', '��⵵ ������ ����1��', '���ѹα�','min@naver.com',35);
INSERT INTO MEMBER (ID, NAME, ADDR, NATION, EMAIL, AGE)VALUES('hong1216','���̺�', '��⵵ ���ν� ���ﱸ', '���ѹα�','vibe@naver.com',33);

SELECT * FROM MEMBER;

UPDATE MEMBER SET REMARK = '';
DROP TABLE MEMBER;



SELECT * FROM EMP_TEMP;

--������ ���� : DB�� �����ϰ� ��ϴµ� �ʿ��� ������ ��� Ư���� ���̺�
--���� ������ �Ұ��ϰ� �並 ���ؼ� ����

SELECT * FROM DICT;

--USER:���� ����Ŭ�� ���ӵǾ� �ִ� ����ڰ� ������ ��ü ����
--scott ������ ������ �ִ� ���̺� ����

SELECT TABLE_NAME FROM USER_TABLES;

--ALL_ : �ٸ� ����ڰ� ������ ��ü �� ����� ����Ǿ� �ִ� ��ü ����
SELECT * FROM ALL_TABLES;

SELECT * FROM DBA_TABLES;


--�ε���(���� ���� / �⺻Ű(PK) OR ����Ű(UNIQUE)�� �����ϸ� �ڵ����� ����)
SELECT * FROM USER_INDEXES;

--���� ����
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);

SELECT * FROM EMP 
WHERE SAL = 1600;

--���� 
DROP INDEX IDX_EMP_SAL;


--INDEX �ڵ� ����
CREATE TABLE USERTBL (
USERID CHAR(8) NOT NULL PRIMARY KEY,
USERNAME NVARCHAR2(10) NOT NULL,
BIRTHYEAR NUMBER(4) NOT NULL, 
MOBILE CHAR(3));

SELECT INDEX_NAME, UNIQUENESS, INDEX_TYPE FROM USER_INDEXES;

SELECT * FROM EMP_TEMP;



--��(VIEW) : ���� ���̺� (SELECT �� ����)
--insufficient privileges(���� �����)
--���� �ο� �� �� ����
CREATE VIEW VM_EMP20 AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 20);

SELECT * FROM VM_EMP20;
SELECT * FROM USER_VIEWS;

--�� ����
DROP VIEW VM_EMP20;

--�信 ������ �Է�? => ������ ������ ��
INSERT INTO VM_EMP20 VALUES(7903,'JAMES','MANAGER',20);
SELECT * FROM VM_EMP20;
SELECT * FROM EMP;

--"cannot perform a DML operation on a read-only view"
--���� �����͸� ���� �� �� ������ �� ����
CREATE VIEW VM_EMP_READ AS SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY; 


--�ζ��� ��
SELECT ROWNUM, E.*
FROM EMP E;

--������ : Ư�� ��Ģ�� �´� ���� ���� ����
--      : �Խ��� �� ��ȣ, ��ǰ �ֹ� ��ȣ ���� �� ���
--������ ����(������ �Ȱ������� ������)
CREATE TABLE DEPT_SEQUENCE AS SELECT* FROM DEPT WHERE 1<>1;
SELECT * FROM DEPT_SEQUENCE;


CREATE SEQUENCE SEQ_DEPT_SEQUENCE -- �ʼ� 
INCREMENT BY 10 --  �⺻ �� : 1           --�� �������� �Ʒ������� ���� ����
START WITH 10 -- �⺻ �� : 1
MAXVALUE 90 --�⺻ ���� 10�� 27�±���
MINVALUE 0 -- ���� �� ����, �ִ밪 �̸� ��, �⺻���� 1
NOCYCLE -- ������ �������� MAX ������ ��� �ݺ� ����  
CACHE 2; --������ ������ ��ȣ�� �޸𸮿� �̸� �Ҵ��� ���� ����

INSERT INTO DEPT_SEQUENCE VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL,'DATA', 'SEOUL');
SELECT * FROM DEPT_SEQUENCE;

--���� ������ �� Ȯ��
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

ALTER SEQUENCE SEQ_DEPT_SEQUENCE 
INCREMENT BY 3 
MAXVALUE 99
CYCLE;

DROP SEQUENCE SEQ_DEPT_SEQUENCE;


CREATE TABLE TEMP(
COL1 VARCHAR(20), 
COL2 VARCHAR(20));

GRANT SELECT, INSERT ON TEMP TO TEST;


SELECT * FROM TEMP;

--���� ���
REVOKE INSERT ON TEMP FROM TEST;

--������ ���Ἲ(���� ����)
--NOT NULL
CREATE TABLE TABLE_NOTNULL(
LOGIN_ID VARCHAR(20) NOT NULL,
LOGIN_PWD VARCHAR2(20) NOT NULL,
TEL VARCHAR2(20)
);

--Cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD")
INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD,TEL)
VALUES('TEST_ID01','TEST_PWD01',NULL);

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD)
VALUES('TEST_ID02','TEST_PWD02');


SELECT * FROM TABLE_NOTNULL;

--�������� Ȯ��

SELECT * FROM USER_CONSTRAINTS;


--���� ���� �� �̸� ����
CREATE TABLE TABLE_NOTNULL2(
LOGIN_ID VARCHAR(20) CONSTRAINT TBL_NN2_LOGID_NN NOT NULL,
LOGIN_PWD VARCHAR2(20) CONSTRAINT TBL_NN2_LOGPWD_NN NOT NULL,
TEL VARCHAR2(20)
);

--�̹� ������ ���̺� �������� �߰�
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL NOT NULL);
--�̹� ������ ���̺� �������� �߰� (�������Ǹ� ����)
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBL_NN2_TEL_NN NOT NULL);
--�̹� ������ ���� ���Ǹ� �����ϱ�
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT SYS_C007034 TO TBL_NN2_TEL_NN; 
--���� ���� ����
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBL_NN2_TEL_NN;

DESC TABLE_NOTNULL2;


--UNIQUE : ������ �������� �ߺ� �ȵ�
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR(20) UNIQUE,
    LOGIN_PWD VARCHAR2(30) NOT NULL,
    TEL VARCHAR(20)
    );
    
INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('hong123','hong123','010-1234-1234');
--unique constraint
INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('hong123','hong123','010-1234-1234');

CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR(20) CONSTRAINT TBL_UNQ_LGNID_UNQ UNIQUE,
    LOGIN_PWD VARCHAR2(30) CONSTRAINT TBL_UNQ_LGNPwD_UNQ NOT NULL,
    TEL VARCHAR(20)
    );
    
    
--PRIMARY KEY(�⺻Ű) : �����ϰ� �ϳ��� �ִ� ��

CREATE TABLE TABLE_PK( 
  LOGIN_ID VARCHAR(20) PRIMARY KEY, --NOT NULL+UNIQUE
  LOGIN_PWD VARCHAR(20) NOT NULL,
  TEL VARCHAR2(20));
  
DESC TABLE_PK;


INSERT INTO TABLE_PK(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('hong123','hong123','010-1234-1234');
--unique constraint
INSERT INTO TABLE_PK(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('hong123','hong123','010-1234-1234');

--�̸� ����
CREATE TABLE TABLE_PK2( 
  LOGIN_ID VARCHAR(20) CONSTRAINT TBL_PK2_LOGID_PK PRIMARY KEY, --NOT NULL+UNIQUE
  LOGIN_PWD VARCHAR(20) CONSTRAINT TBL_PK2_LOGPWD_PK NOT NULL,
  TEL VARCHAR2(20));
  

--���� ���� ��Ƽ� �ֱ�(NOT NULL�� ����)
CREATE TABLE TABLE_CONSTRAINT( 
ID NUMBER(4),
NAME VARCHAR2(10),
ADDR VARCHAR2(20),
TEL VARCHAR2(20),
CONSTRAINT TBL_ID_PK PRIMARY KEY(ID),
CONSTRAINT TBL_TEL_UNQ UNIQUE(TEL));


--�ܷ�Ű : FOREIGN KEY(FK) ���̺� ���� ���� ����
--ntegrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found
--EMP ���̺��� DEPTNO ���� DEPT ���̺��� DEPTNO�� ������ �ִ� �� ���� �������� ����
SELECT * FROM EMP;
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES(9999,'ȫ�浿','CLERK','7788',SYSDATE,1200,NULL,50);


CREATE TABLE DEPT_FK(
   DEPTNO NUMBER(2) CONSTRAINT DEPT_FK_DEPTNO_PK PRIMARY KEY,
   DANME VARCHAR2(14),
   LOC VARCHAR2(13));
   
SELECT * FROM DEPT_FK;

CREATE TABLE EMP_FK(
     EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO PRIMARY KEY,
     ENAME VARCHAR2(10),
     JOB VARCHAR2(9),
     MGR NUMBER(4),
     HIREDATE DATE,
     SAL NUMBER(7,2),
     COMM NUMBER(7,2),
     DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

--�ܷ� Ű ������ �θ� ���̺� ���� ������ �Է�
INSERT INTO DEPT_FK VALUES(50,'DATABASE','SEOUL');

INSERT INTO EMP_FK(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9999,'ȫ�浿','CLERK','7788',SYSDATE,1200,NULL,50);

--�ܷ� Ű ������ �����͸� �����Ѵٸ� �����ϴ� �ڽ� ���̺��� �����͸� ���� ����
--CONSTRAINT (SCOTT.EMPFK DEPTNO_FK VIOLATED -CHILD RECORD FOUND)
DELETE FROM EMP_FK WHERE EMPNO=9999;
DELETE FROM DEPT_FK WHERE DEPTNO=50;

DROP TABLE EMP_FK;

--������ ���� �� �����ϴ� �����͵� ���� ����
CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), 
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)
    ON DELETE CASCADE --�����ϴ� ������ ���� ����
    );   
--ON DELETE SET NULL �����ϴ� �����͸� NULL�� ����

--DEFAULT : �⺻�� ����
CREATE TABLE TABLE_DEFAULT(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
TEL VARCHAR(20)
);

INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL) VALUES('TEST','010-1234-1234');
SELECT * FROM TABLE_DEFAULT;



--Q) DEPT_CONST ���̺� �ۼ��ϱ�
--�� �̸� DEPTNO ������ ����(2), PRIMARY KEY, ���� ���Ǹ� : DEPTCONST_DEPTNO_PK
--�� �̸� DEPTNAME ������ ���ڿ�(14), UNIQUE, ���� ���Ǹ� : DEPTCONST_DEPTNAME_UNIQ
--�� �̸� LOC ������ ���ڿ�(13), NOT NULL, ���� ���Ǹ� : DEPTCONST_LOC_NN

CREATE TABLE DEPT_CONST (
 
DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
DEPTNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DEPTNAME_UNIQ UNIQUE,
LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL );

--Q) EMP_CONST ���̺� �ۼ��ϱ�
--EMPNO ������ ����(4) PRIMARY KEY, ���� ���Ǹ� �� EMPCONST_EMPNO_PK
--ENAME ������ ���ڿ�(10) NOT NULL, EMPCONST_ENAME_NN
--JOB ������ ���ڿ�(9),
--TEL ������ ���ڿ�(20),UNIQUE, EMPCONST_TEL_UNQ
--HIREDATE ��¥
--SAL �Ҽ��� ��°�ڸ� ����(7)
--DEPTNO ������ ����(2) FOREIGN KEY, EMPCONST_DEPTNO_FK

CREATE TABLE EMP_CONST 
(EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
 ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
 JOB VARCHAR2(9),
 TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
 HIREDATE DATE,
 SAL NUMBER(7,2),
 DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST(DEPTNO));

--SCOTT ����
SET SERVEROUTPUT ON;
DECLARE  
 V_DEPT_ROW DEPT%ROWTYPE;
BEGIN 
  SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
  FROM DEPT
  WHERE DEPTNO = 40;
  DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| V_DEPT_ROW.DEPTNO);
  DBMS_OUTPUT.PUT_LINE('DNAME : '|| V_DEPT_ROW.DNAME);
  DBMS_OUTPUT.PUT_LINE('LOC : '|| V_DEPT_ROW.LOC);
END;
/


DECLARE 
  V_NUMBER NUMBER(8) := 13;
BEGIN 
  IF MOD(V_NUMBER,2) = 1 THEN
     DBMS_OUTPUT.PUT_LINE('Ȧ��');
     END IF; 
END;
/


DECLARE 
  V_NUMBER NUMBER(8) := 12;
BEGIN 
  IF MOD(V_NUMBER,2) = 1 THEN
     DBMS_OUTPUT.PUT_LINE('Ȧ��');
  ELSIF MOD(V_NUMBER,2) =0 THEN
     DBMS_OUTPUT.PUT_LINE('¦��'); 
  END IF;
END;
/

DECLARE 
  V_NUMBER NUMBER := 87;
BEGIN 
  IF V_NUMBER >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('A ����');
   ELSIF V_NUMBER >=80 THEN
      DBMS_OUTPUT.PUT_LINE('B ����');
   ELSIF V_NUMBER >=70 THEN
      DBMS_OUTPUT.PUT_LINE('C ����');
    ELSIF V_NUMBER >=60 THEN
       DBMS_OUTPUT.PUT_LINE('D ����');
  ELSE 
     DBMS_OUTPUT.PUT_LINE('F ����');
     END IF;
END;
/

--CASE ���ǹ�
DECLARE 
  V_NUMBER NUMBER := 87;
BEGIN 
   CASE TRUNC(V_NUMBER/10) 
   WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A ����');
   WHEN 9  THEN DBMS_OUTPUT.PUT_LINE('B ����');
   WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('C ����');
   WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('D ����'); 
       DBMS_OUTPUT.PUT_LINE('F ����');
 END CASE;
END;
/


--�ݺ���
DECLARE 
 V_NUM NUMBER := 0;
BEGIN 
  FOR i IN 0..4 LOOP
   CONTINUE WHEN MOD(i,2) = 1;
    DBMS_OUTPUT.PUT_LINE('���� i : '||i);
  END LOOP;
END;
/



--�ݺ���
DECLARE 
 V_NUM NUMBER := 0;
BEGIN 
  FOR i IN 0..4 LOOP
    DBMS_OUTPUT.PUT_LINE('���� i : '||i);
  END LOOP;
END;
/


DECLARE 
 V_SUM NUMBER := 0;
BEGIN 
  FOR i IN 1..100 LOOP
   V_SUM := V_SUM+i;
   END LOOP;
   DMBS_OUTPUT.PUT_LINE('���� V_SUM :' || V_SUM);
END;
/

DECLARE
 V_NUM NUMBER := 0;
BEGIN 
  FOR i IN 0..4 LOOP
  CONTINUE WHEN MOD(i,2) = 1;
    DBMS_OUTPUT.PUT_LINE('���� i : '||i);
  END LOOP;
END;
/


--Ȧ���� ���
DECLARE
 V_NUM NUMBER := 0;
BEGIN 
  FOR i IN 0..4 LOOP
  CONTINUE WHEN MOD(i,2) = 0;
    DBMS_OUTPUT.PUT_LINE('���� i : '||i);
  END LOOP;
END;
/
  
--���ڵ� : DB �ϳ��� ����, �ڷ����� �ٸ� ���� �����͸� ����
DECLARE
  TYPE REC_DEPT IS RECORD( 
    DEPTNO NUMBER(2) NOT NULL:= 99,
    DNAME VARCHAR2(12),
    LOC VARCHAR(20));
    DEPT_rec REC_DEPT;
BEGIN
   --DEPT_rec.DEPTNO := 55;
   DEPT_rec.DNAME := 'DATABASE';
   DEPT_rec.LOC := 'SEOUL';
   DBMS_OUTPUT.PUT_LINE('DEPTNO : ' ||DEPT_rec.DEPTNO);
   DBMS_OUTPUT.PUT_LINE('DNAME : ' ||DEPT_rec.DNAME);
   DBMS_OUTPUT.PUT_LINE('LOC : ' ||DEPT_rec.LOC);
   
END;
/

GRANT SELECT ON DEPT TO JAVADB; 