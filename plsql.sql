--PL/SQL
--ȭ�� ��� 
SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('HELLO, PL/SQL');
END;
/

-- ���� ���
DECLARE
    v_empno  NUMBER(4) := 7788;
    v_ename  VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('V_EMPNO : ' || v_empno);
    dbms_output.put_line('V_EMPNO : ' || v_ename);
END;
/

--��� �����ϱ�
DECLARE
    v_tax CONSTANT NUMBER(1) := 3;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/


--������ �⺻�� ����
DECLARE
    v_deptno NUMBER(4) DEFAULT 10;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

--�� �� ����
DECLARE
    v_deptno NUMBER(4) NOT NULL DEFAULT 10;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/
--SCOTT ����
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
        dbms_output.put_line('Ȧ��');
    END IF;
END;
/

DECLARE
    v_number NUMBER(8) := 12;
BEGIN
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('Ȧ��');
    ELSIF MOD(v_number, 2) = 0 THEN
        dbms_output.put_line('¦��');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 87;
BEGIN
    IF v_number >= 90 THEN
        dbms_output.put_line('A ����');
    ELSIF v_number >= 80 THEN
        dbms_output.put_line('B ����');
    ELSIF v_number >= 70 THEN
        dbms_output.put_line('C ����');
    ELSIF v_number >= 60 THEN
        dbms_output.put_line('D ����');
    ELSE
        dbms_output.put_line('F ����');
    END IF;
END;
/
--CASE ���ǹ�
DECLARE
    v_number NUMBER := 87;
BEGIN
    CASE trunc(v_number / 10)
        WHEN 10 THEN
            dbms_output.put_line('A ����');
        WHEN 9 THEN
            dbms_output.put_line('B ����');
        WHEN 8 THEN
            dbms_output.put_line('C ����');
        WHEN 7 THEN
            dbms_output.put_line('D ����');
            dbms_output.put_line('F ����');
    END CASE;
END;
/
--CASE ���ǹ�
DECLARE
    v_number NUMBER := 87;
BEGIN
    CASE trunc(v_number / 10)
        WHEN 10 THEN
            dbms_output.put_line('A ����');
        WHEN 9 THEN
            dbms_output.put_line('B ����');
        WHEN 8 THEN
            dbms_output.put_line('C ����');
        WHEN 7 THEN
            dbms_output.put_line('D ����');
            dbms_output.put_line('F ����');
    END CASE;
END;
/

--�ݺ���
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        dbms_output.put_line('���� i : ' || i);
    END LOOP;
END;
/

--�ݺ���
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        dbms_output.put_line('���� i : ' || i);
    END LOOP;
END;
/

--�ݺ���
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        dbms_output.put_line('���� i : ' || i);
    END LOOP;
END;
/

DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR i IN 1..100 LOOP
        v_sum := v_sum + i;
    END LOOP;
    dmbs_output.put_line('���� V_SUM :' || v_sum);
END;
/

DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        dbms_output.put_line('���� i : ' || i);
    END LOOP;
END;
/

--Ȧ���� ���
DECLARE
    v_num NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        dbms_output.put_line('���� i : ' || i);
    END LOOP;
END;
/

--���ڵ� : DB �ϳ��� ����, �ڷ����� �ٸ� ���� �����͸� ����
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

--���ڵ带 ����� INSERT
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


--���ڵ带 ����� UPDATE
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



--Ŀ�� : SELECT �� �Ǵ� ������ ���۾� ���� SQL�� ���� �� �ش� SQL���� ó���ϴ� ������ 
--������ �޸� ������ ����Ű�� ������

--����� Ŀ��/������ Ŀ��

DECLARE
    v_dept_row scott.dept%rowtype;
  
  --����� Ŀ�� ����
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
  --Ŀ�� ����
    OPEN c1;
  
  --Ŀ���� ���� �о�� ������ ���
    FETCH c1 INTO v_dept_row;
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
  
  --Ŀ�� �ݱ�
    CLOSE c1;
END;

DECLARE
    v_dept_row scott.dept%rowtype;
  
  --����� Ŀ�� ����
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
  --Ŀ�� ����
    OPEN c1(10);
    LOOP
  --Ŀ���� ���� �о�� ������ ���
        FETCH c1 INTO v_dept_row;
        EXIT WHEN c1%notfound;
        dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
        dbms_output.put_line('DNAME : ' || v_dept_row.dname);
        dbms_output.put_line('LOC : ' || v_dept_row.loc);
    END LOOP;
  --Ŀ�� �ݱ�
    CLOSE c1;
END;

--FOR������ �ٲٱ�
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
-- ���̺��� Ư�� �÷� ���� �����ϱ�
    v_deptno scott.dept.deptno%TYPE;
  
  --����� Ŀ�� ����
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




--������(����X) : DML, SELECT~INTO(����� ������)
--SQL%FOUND(������ Ŀ���� ������ ���� �ִ� ��� TRUE)
--SQL%NOTFOUND(������ Ŀ���� ������ ���� �ִ� ��� FALSE)
--SQL%ISOPEN(������ Ŀ���� �ڵ����� SQL �� ���� �� �ݱ� ������ �׻� FALSE)
--SQL%FOUND(������ Ŀ���� ������� ������ �� �� Ȥ�� DML ���� ���� ���)


BEGIN
    UPDATE usertbl
    SET
        addr = '����'
    WHERE
        no = 2;

    dbms_output.put_line('���ŵ� ���� �� : ' || SQL%rowcount);
    IF ( SQL%found ) THEN
        dbms_output.put_line('���ŵ� ���� ���� ���� :  TRUE');
    ELSE
        dbms_output.put_line('���ŵ� ���� ���� ����  FALSE');
    END IF;

    IF ( SQL%isopen ) THEN
        dbms_output.put_line('Ŀ���� ���� ���� : TRUE');
    ELSE
        dbms_output.put_line('Ŀ���� ���� ���� : FALSE');
    END IF;

END;
/

SET SERVEROUTPUT ON;

--����(����) - ������ ����(���� ����)/��Ÿ�� ����
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

    dbms_output.put_line('���� �߻��� �� ������ ������� ����');
EXCEPTION
    WHEN value_error THEN
        dbms_output.put_line('����ó�� : ��ġ �Ǵ� �� ���� �߻�');
END;
/


-- ���� ������ ó�� 

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

    dbms_output.put_line('���� �߻��� �� ������ ������� ����');
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('����ó�� : �䱸���� ���� �� ���� ����');
    WHEN value_error THEN
        dbms_output.put_line('����ó�� : ��ġ �Ǵ� �� ���� �߻�');
    WHEN OTHERS THEN
        dbms_output.put_line('����ó�� : ���� ���� �� ���� �߻�');
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

    dbms_output.put_line('���� �߻��� �� ������ ������� ����');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('����ó�� : ���� ���� �� ���� �߻�');
        dbms_output.put_line('SQLCODE : ' || to_char(sqlcode));
        dbms_output.put_line('SQLERRM : ' || sqlerrm);
END;
/


-- ���� ���� ���α׷� : ����Ŭ ���� �����ؼ� �ʿ��� ��(�ٸ� �������α׷�����) ȣ�� ����

--1) ���� ���ν��� 
CREATE PROCEDURE pro_noparam IS
    v_empno  NUMBER(4) := 7788;
    v_ename  VARCHAR(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
END;
/

--PROCEDURE ����
EXECUTE pro_noparam;

--������ �̸��� ���ڽ����� �����ϸ� ������
CREATE OR REPLACE PROCEDURE pro_noparam IS
    v_empno  NUMBER(4) := 7788;
    v_ename  VARCHAR(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
END;
/


--���ν��� ����
EXECUTE pro_noparam;

--�ٸ� PL/SQL ��Ͽ��� ����
BEGIN
    pro_noparam;
END;
/

--�Ķ���� ó��(IN: �޾Ƽ�)
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



--�Ķ���� ó��(OUT: ����(ȣ���� ������ ���� ��������.))
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

EXECUTE register_user('������','1996','�λ��','01012345677');


select * from userTBL where username = '������';


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
 DBMS_OUTPUT.PUT_LINE('�μ� ��ȣ : '|| v_DEPTNO);
 DBMS_OUTPUT.PUT_LINE('�μ� �̸� : ' || v_DNAME);
 DBMS_OUTPUT.PUT_LINE('������ : ' || v_LOC);
END;
/


--Ʈ����(trigger) : �����ͺ��̽� ���� Ư�� ��Ȳ�̳� ����, �� �̺�Ʈ�� �߻��� ���
--�ڵ����� ����Ǵ� ���

--�����Ϳ� ������ ���� �۾��� �����ϱ� ���� ���� pl/sql�� �Ǵ� ���� ���ν����� ������ 
-- �������� �ʾƵ� ��

--���� ����ڰ� �����ϴ� ������ ���ȼ��� ������ �߱�

--Ʈ���� ��� ����
--DML, DDL, �����ͺ��̽� ���۰� ���õ� ����

CREATE TABLE EMP_TRG
AS SELECT * FROM SCOTT.EMP;

SELECT * FROM EMP_TRG;

CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE --AFTER(Ʈ���� ���� ����)
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN  
   IF TO_CHAR(SYSDATE,'DY') in ('��','��') THEN
    IF INSERTING THEN 
       raise_application_error(-20000, '�ָ� ������� �߰� �Ұ�');
    ELSIF UPDATING THEN
       raise_application_error(-20001, '�ָ� ������� ���� �Ұ�');
    ELSIF DELETING THEN
       raise_application_error(-20002, '�ָ� ������� ���� �Ұ�');
    ELSE 
       raise_application_error(-20003, '�ָ� ������� ���� �Ұ�');
    END IF;
END IF;
END;
/


SELECT * FROM emp_trg;
UPDATE emp_trg SET SAL = 4000 WHERE EMPNO  =7782;
INSERT INTO emp_trg
VALUES(9000,'test','manager',null,sysdate,null,null,10);


--�α� ��� ���̺� 
CREATE TABLE EMP_TRG_LOG(
  tablename VARCHAR2(10), --DML �۾��� ����� ���̺� �� 
  dml_type VARCHAR2(10), --DML ��ɾ��� ����
  empno NUMBER(4), --DML ����� �� �����ȣ 
  user_name VARCHAR2(30), --DML ������ USER��
  change_date DATE); --DML ����� ��¥

SELECT * FROM EMP_TRG_LOG;

CREATE OR REPLACE TRIGGER trg_emp_log
AFTER --(Ʈ���� ���� ����)
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

