CREATE TABLE userTBL(
    no NUMBER(4) constraint pk_userTBL primary key, 
    username varchar2(20) not null,
    birthYear number(4) not null,
    addr varchar2(15) not null,
    mobile varchar2(12));
    
CREATE SEQUENCE USER_SEQ;

INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'ȫ�浿',2000,'�����','01012341234');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'������',2001,'�����','01012351235');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'�����',2002,'�λ��','01012361236');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'����ȣ',2003,'��⵵','01012371237');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'���߱�',2004,'�λ��','01012381238');

commit;