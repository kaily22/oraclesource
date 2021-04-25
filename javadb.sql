CREATE TABLE userTBL(
    no NUMBER(4) constraint pk_userTBL primary key, 
    username varchar2(20) not null,
    birthYear number(4) not null,
    addr varchar2(15) not null,
    mobile varchar2(12));
    
CREATE SEQUENCE USER_SEQ;

INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'홍길동',2000,'서울시','01012341234');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'성춘향',2001,'서울시','01012351235');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'김수정',2002,'부산시','01012361236');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'오지호',2003,'경기도','01012371237');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'송중기',2004,'부산시','01012381238');

commit;