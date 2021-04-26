--PL/SQL
--화면 출력 
SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('HELLO, PL/SQL');
END;
/

-- 변수 사용
DECLARE
    v_empno  NUMBER(4) := 7788;
    v_ename  VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('V_EMPNO : ' || v_empno);
    dbms_output.put_line('V_EMPNO : ' || v_ename);
END;
/

--상수 선언하기
DECLARE
    v_tax CONSTANT NUMBER(1) := 3;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/


--변수의 기본값 지정
DECLARE
    v_deptno NUMBER(4) DEFAULT 10;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

--널 값 막기
DECLARE
    v_deptno NUMBER(4) NOT NULL DEFAULT 10;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/
--SCOTT 실행
SET SERVEROUTPUT ON;

DECLARE
    v_dept_row dept%rowtype;
BEGIN
    SELECT
        deptno,
        danme,
        loc
    INTO v_dept_row
    FROM
        dept
    WHERE
        deptno = 40;

    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DAME : ' || v_dept_row.dame);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
END;
/

DECLARE
    v_number NUMBER(8) := 13;
BEGIN
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('홀수');
    END IF;
END;
/

DECLARE
    v_number NUMBER(8) := 12;
BEGIN
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('홀수');
    ELSIF MOD(v_number, 2) = 0 THEN
        dbms_output.put_line('짝수');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 87;
BEGIN
    IF v_number >= 90 THEN
        dbms_output.put_line('A 학점');
    ELSIF v_number >= 80 THEN
        dbms_output.put_line('B 학점');
    ELSIF v_number >= 70 THEN
        dbms_output.put_line('C 학점');
    ELSIF v_number >= 60 THEN
        dbms_output.put_line('D 학점');
    ELSE
        dbms_output.put_line('F 학점');
    END IF;
END;
/
--CASE 조건문
DECLARE
    v_number NUMBER := 87;
BEGIN
    CASE trunc(v_number / 10)
        WHEN 10 THEN
            dbms_output.put_line('A 학점');
        WHEN 9 THEN
            dbms_output.put_line('B 학점');
        WHEN 8 THEN
            dbms_output.put_line('C 학점');
        WHEN 7 THEN
            dbms_output.put_line('D 학점');
            dbms_output.put_line('F 학점');
    END CASE;
END;
/
--CASE 조건문
DECLARE
    v_number NUMBER := 87;
BEGIN
    CASE trunc(v_number / 10)
        WHEN 10 THEN
            dbms_output.put_line('A 학점');
        WHEN 9 THEN
            dbms_output.put_line('B 학점');
        WHEN 8 THEN
            dbms_output.put_line('C 학점');
        WHEN 7 THEN
            dbms_output.put_line('D 학점');
            dbms_output.put_line('F 학점');
    END CASE;
END;
/

--반복문
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

--반복문
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

--반복문
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR i IN 1..100 LOOP
        v_sum := v_sum + i;
    END LOOP;
    dmbs_output.put_line('현재 V_SUM :' || v_sum);
END;
/

DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

--홀수만 출력
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

--레코드 : DB 하나의 행위, 자료형이 다른 여러 데이터를 저장
DECLARE
    TYPE rec_dept IS RECORD (
        deptno  NUMBER(2) NOT NULL := 99,
        dname   VARCHAR2(12),
        loc     VARCHAR(20)
    );
    dept_rec rec_dept;
BEGIN
   --DEPT_rec.DEPTNO := 55;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    dbms_output.put_line('DEPTNO : ' || dept_rec.deptno);
    dbms_output.put_line('DNAME : ' || dept_rec.dname);
    dbms_output.put_line('LOC : ' || dept_rec.loc);
END;
/

--레코드를 사용한 INSERT
CREATE TABLE dept_record
    AS
        SELECT
            *
        FROM
            scott.dept;

SELECT
    *
FROM
    dept_record;

DECLARE
    TYPE rec_dept IS RECORD (
        deptno  NUMBER(2) NOT NULL := 99,
        dname   VARCHAR2(12),
        loc     VARCHAR(20)
    );
    dept_rec rec_dept;
BEGIN
    dept_rec.deptno := 55;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    INSERT INTO dept_record VALUES dept_rec;

END;
/


--레코드를 사용한 UPDATE
DECLARE
    TYPE rec_dept IS RECORD (
        deptno  NUMBER(2) NOT NULL := 99,
        dname   VARCHAR2(12),
        loc     VARCHAR(20)
    );
    dept_rec rec_dept;
BEGIN
    dept_rec.deptno := 60;
    dept_rec.dname := 'SERVER';
    dept_rec.loc := 'BUSAN';
    UPDATE dept_record
    SET
        row = dept_rec
    WHERE
        deptno = 55;

END;
/

SELECT
    *
FROM
    dept_record;



--커서 : SELECT 문 또는 데이터 조작어 같은 SQL문 실행 시 해당 SQL문을 처리하는 정보를 
--저장한 메모리 공간을 가리키는 포인터

--명시적 커서/묵시적 커서

DECLARE
    v_dept_row scott.dept%rowtype;
  
  --명시적 커서 선언
    CURSOR c1 IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        scott.dept
    WHERE
        deptno = 40;

BEGIN
  --커서 열기
    OPEN c1;
  
  --커서를 통해 읽어온 데이터 사용
    FETCH c1 INTO v_dept_row;
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
  
  --커서 닫기
    CLOSE c1;
END;

DECLARE
    v_dept_row scott.dept%rowtype;
  
  --명시적 커서 선언
    CURSOR c1 (
        p_deptno scott.dept.deptno%TYPE
    ) IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        scott.dept
    WHERE
        deptno = p_deptno;

BEGIN
  --커서 열기
    OPEN c1(10);
    LOOP
  --커서를 통해 읽어온 데이터 사용
        FETCH c1 INTO v_dept_row;
        EXIT WHEN c1%notfound;
        dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
        dbms_output.put_line('DNAME : ' || v_dept_row.dname);
        dbms_output.put_line('LOC : ' || v_dept_row.loc);
    END LOOP;
  --커서 닫기
    CLOSE c1;
END;

--FOR문으로 바꾸기
DECLARE
    CURSOR c1 IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        scott.dept;

BEGIN
    FOR c1_rec IN c1 LOOP
        dbms_output.put_line('DEPTNO : ' || c1_rec.deptno);
        dbms_output.put_line('DNAME : ' || c1_rec.dname);
        dbms_output.put_line('LOC : ' || c1_rec.loc);
    END LOOP;
END;
/

DECLARE
-- 테이블에서 특정 컬럼 구조 참조하기
    v_deptno scott.dept.deptno%TYPE;
  
  --명시적 커서 선언
    CURSOR c1 (
        p_deptno scott.dept.deptno%TYPE
    ) IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        scott.dept
    WHERE
        deptno = p_deptno;

BEGIN
    v_deptno := &input_deptno;
    FOR c1_rec IN c1(v_deptno) LOOP
        dbms_output.put_line('DEPTNO : ' || c1_rec.deptno);
        dbms_output.put_line('DNAME : ' || c1_rec.dname);
        dbms_output.put_line('LOC : ' || c1_rec.loc);
    END LOOP;

END;
/




--묵시적(선언X) : DML, SELECT~INTO(결과가 단일행)
--SQL%FOUND(묵시적 커서가 추출한 행이 있는 경우 TRUE)
--SQL%NOTFOUND(묵시적 커서가 추출한 행이 있는 경우 FALSE)
--SQL%ISOPEN(묵시적 커서가 자동으로 SQL 문 실행 후 닫기 때문에 항상 FALSE)
--SQL%FOUND(묵시적 커서에 현재까지 추출한 행 수 혹은 DML 영항 받은 행수)


BEGIN
    UPDATE usertbl
    SET
        addr = '전라도'
    WHERE
        no = 2;

    dbms_output.put_line('갱신된 행의 수 : ' || SQL%rowcount);
    IF ( SQL%found ) THEN
        dbms_output.put_line('갱신된 행의 존재 여부 :  TRUE');
    ELSE
        dbms_output.put_line('갱신된 행의 존재 여부  FALSE');
    END IF;

    IF ( SQL%isopen ) THEN
        dbms_output.put_line('커서의 오픈 여부 : TRUE');
    ELSE
        dbms_output.put_line('커서의 오픈 여부 : FALSE');
    END IF;

END;
/

SET SERVEROUTPUT ON;

--오류(예외) - 컴파일 에러(문법 오류)/런타임 에러
--PL/SQL: numeric or value error: character to number
DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT
        dname
    INTO v_wrong
    FROM
        scott.dept
    WHERE
        deptno = 10;

    dbms_output.put_line('예외 발생시 이 문장은 실행되지 않음');
EXCEPTION
    WHEN value_error THEN
        dbms_output.put_line('예외처리 : 수치 또는 값 오류 발생');
END;
/


-- 예외 여러개 처리 

DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT
        dname
    INTO v_wrong
    FROM
        scott.dept
    WHERE
        deptno = 10;

    dbms_output.put_line('예외 발생시 이 문장은 실행되지 않음');
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('예외처리 : 요구보다 많은 행 추출 오류');
    WHEN value_error THEN
        dbms_output.put_line('예외처리 : 수치 또는 값 오류 발생');
    WHEN OTHERS THEN
        dbms_output.put_line('예외처리 : 사전 정의 외 오류 발생');
END;
/

DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT
        dname
    INTO v_wrong
    FROM
        scott.dept
    WHERE
        deptno = 10;

    dbms_output.put_line('예외 발생시 이 문장은 실행되지 않음');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('예외처리 : 사전 정의 외 오류 발생');
        dbms_output.put_line('SQLCODE : ' || to_char(sqlcode));
        dbms_output.put_line('SQLERRM : ' || sqlerrm);
END;
/


-- 저장 서브 프로그램 : 오라클 내에 저장해서 필요할 때(다른 응용프로그램에서) 호출 가능

--1) 저장 프로시저 
CREATE PROCEDURE pro_noparam IS
    v_empno  NUMBER(4) := 7788;
    v_ename  VARCHAR(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
END;
/

--PROCEDURE 실행
EXECUTE pro_noparam;

--동일한 이름의 프뢰시저가 존재하면 덮어써라
CREATE OR REPLACE PROCEDURE pro_noparam IS
    v_empno  NUMBER(4) := 7788;
    v_ename  VARCHAR(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
END;
/


--프로시저 실행
EXECUTE pro_noparam;

--다른 PL/SQL 블록에서 실행
BEGIN
    pro_noparam;
END;
/

--파라미터 처리(IN: 받아서)
CREATE OR REPLACE PROCEDURE pro_param_in 
(
    param1  IN NUMBER, --IN(DEFAULT)
    param2  NUMBER,
    param3  NUMBER := 3,
    param4  NUMBER DEFAULT 4
) IS
BEGIN
    dbms_output.put_line('param1 : ' || param1);
    dbms_output.put_line('param2 : ' || param2);
    dbms_output.put_line('param3 : ' || param3);
    dbms_output.put_line('param4 : ' || param4);
END;
/

EXECUTE pro_param_in(1,2,9,8);
EXECUTE pro_param_in(1,2);
EXECUTE pro_param_in(1);



--파라미터 처리(OUT: 리턴(호출한 곳으로 값을 내보낸다.))
CREATE OR REPLACE PROCEDURE pro_param_out 
(
    in_empno IN SCOTT.EMP.EMPNO%TYPE, --IN(DEFAULT)
    out_ename OUT SCOTT.EMP.ENAME%TYPE, --OUT(RETURN)
    out_sal OUT SCOTT.EMP.SAL%TYPE

) 
IS
BEGIN
  SELECT ENAME, SAL INTO out_ename, out_sal
  FROM SCOTT.EMP
  WHERE EMPNO = in_empno;
END;
/

DECLARE  
 V_ename SCOTT.EMP.ENAME%TYPE;
 v_sal SCOTT.EMP.SAL%TYPE;

BEGIN
pro_param_out(7782,v_ename,v_sal);
DBMS_OUTPUT.PUT_LINE('ENAME :' ||v_ename);
DBMS_OUTPUT.PUT_LINE('SAL : ' || v_sal);
END;
/


--IN/OUT
CREATE OR REPLACE PROCEDURE pro_param_inout(in_out_no IN OUT NUMBER) 
IS
BEGIN
  in_out_no := in_out_no *2;
END;
/

DECLARE 
   no NUMBER;
BEGIN
   no:=5;
   pro_param_inout(no);
   DBMS_OUTPUT.PUT_LINE('no: ' || no);
END;
/


CREATE OR REPLACE PROCEDURE register_user 
(
    username IN usertbl.username%TYPE, --IN(DEFAULT)
    birthyear usertbl.birthyear%TYPE, --OUT(RETURN)
    addr usertbl.addr%TYPE,
    mobile usertbl.mobile%TYPE

) 
IS
BEGIN
  INSERT INTO usertbl(no,username, birthyear, addr,mobile)
  VALUES(user_seq.nextval, username, birthyear, addr, mobile);
  COMMIT;
  DBMS_OUTPUT.PUT_LINE(username || birthyear || addr || mobile);
END;
/

EXECUTE register_user('대조영','1996','부산시','01012345677');


select * from userTBL where username = '대조영';


CREATE OR REPLACE PROCEDURE pro_dept_in(
   inout_DEPTNO IN OUT SCOTT.DEPT.DEPTNO%TYPE,
   out_DNAME OUT SCOTT.DEPT.DNAME%TYPE,
   out_LOC OUT SCOTT.DEPT.LOC%TYPE
)
IS 
BEGIN
  SELECT DEPTNO, DNAME, LOC INTO inout_DEPTNO, out_DNAME, out_LOC
  FROM SCOTT.DEPT
  WHERE DEPTNO = inout_DEPTNO;
END;
/

DECLARE 
 v_DEPTNO SCOTT.DEPT.DEPTNO%TYPE;
 v_DNAME SCOTT.DEPT.DNAME%TYPE;
 v_LOC SCOTT.DEPT.LOC%TYPE;

BEGIN
 v_DEPTNO := 20;
 pro_dept_in(v_DEPTNO, v_DNAME, v_LOC);
 DBMS_OUTPUT.PUT_LINE('부서 번호 : '|| v_DEPTNO);
 DBMS_OUTPUT.PUT_LINE('부서 이름 : ' || v_DNAME);
 DBMS_OUTPUT.PUT_LINE('지역명 : ' || v_LOC);
END;
/


--트리거(trigger) : 데이터베이스 안의 특정 상황이나 동작, 즉 이벤트가 발생할 경우
--자동으로 실행되는 기능

--데이터와 연관된 여러 작업을 수행하기 위해 여러 pl/sql문 또는 저장 프로시저를 일일이 
-- 수행하지 않아도 됨

--여러 사용자가 공유하는 데이터 보안성과 안전성 추구

--트리거 사용 구문
--DML, DDL, 데이터베이스 동작과 관련된 구문

CREATE TABLE EMP_TRG
AS SELECT * FROM SCOTT.EMP;

SELECT * FROM EMP_TRG;

CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE --AFTER(트리거 동작 시점)
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN  
   IF TO_CHAR(SYSDATE,'DY') in ('토','일') THEN
    IF INSERTING THEN 
       raise_application_error(-20000, '주말 사원정보 추가 불가');
    ELSIF UPDATING THEN
       raise_application_error(-20001, '주말 사원정보 수정 불가');
    ELSIF DELETING THEN
       raise_application_error(-20002, '주말 사원정보 삭제 불가');
    ELSE 
       raise_application_error(-20003, '주말 사원정보 변경 불가');
    END IF;
END IF;
END;
/


SELECT * FROM emp_trg;
UPDATE emp_trg SET SAL = 4000 WHERE EMPNO  =7782;
INSERT INTO emp_trg
VALUES(9000,'test','manager',null,sysdate,null,null,10);


--로그 기록 테이블 
CREATE TABLE EMP_TRG_LOG(
  tablename VARCHAR2(10), --DML 작업이 수행된 테이블 명 
  dml_type VARCHAR2(10), --DML 명령어의 종류
  empno NUMBER(4), --DML 대상이 된 사원번호 
  user_name VARCHAR2(30), --DML 수행한 USER명
  change_date DATE); --DML 수행된 날짜

SELECT * FROM EMP_TRG_LOG;

CREATE OR REPLACE TRIGGER trg_emp_log
AFTER --(트리거 동작 시점)
INSERT OR UPDATE OR DELETE ON EMP_TRG
FOR EACH ROW
BEGIN  
    IF INSERTING THEN 
       INSERT INTO emp_trg_log
       VALUES('EMP_TRG', 'INSERT',:new.empno,SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE);
    ELSIF UPDATING THEN
       INSERT INTO emp_trg_log
       VALUES('EMP_TRG', 'UPDATE',:old.empno,SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE);
    ELSIF DELETING THEN
      INSERT INTO emp_trg_log
       VALUES('EMP_TRG', 'DELETE',:old.empno,SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE);
   END IF;
END;
/

