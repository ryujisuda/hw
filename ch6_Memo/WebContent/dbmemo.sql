create table memo_Test (
  num number,
  name varchar2(15),
  title varchar2(100),
  pass varchar2(10),
  indate date default sysdate,
  primary key(num)
  );

delete from memo_Test where name='aaaa';

select * from memo_Test;

select * from member;

delete from member where id='test2';

CREATE SEQUENCE AUTO_SEQ_NUMBER
         INCREMENT BY 1
         START WITH 1
         MAXVALUE  1000
         NOCACHE
         NOCYCLE;