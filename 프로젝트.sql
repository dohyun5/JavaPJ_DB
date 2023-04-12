create table member
(
member_id varchar2(20)  primary key,
member_pw varchar2(30),
member_name varchar2(20),
member_fname varchar2(999),
member_dv varchar2(20),
member_grade varchar2(1)
);

create table board(
member_id varchar2(20),
member_fname varchar2(999),
member_grade varchar2(1),
board_no number(7) primary key,
board_title varchar2(200),
board_content varchar2(4000),
board_date date default sysdate,
board_views number(7));

create table tradeboard(
member_id varchar2(20),
member_fname varchar2(999),
member_grade varchar2(1),
board_no number(7) primary key,
board_title varchar2(200),
board_content varchar2(4000),
board_date date default sysdate,
board_views number(7));


create table reply(
member_id varchar2(20) PRIMARY KEY,
member_fname varchar2(999),
rep_no number(30),
rep_content varchar2(2000),
rep_date date default sysdate);




alter table member add member_grade varchar2(1);

drop table member;

drop table board;

commit;

insert into member values ('root','root','������','������','����','A');
insert into member values ('1000','1000','�����','�����','����','B');
insert into member values ('1001','1001','�����1','�����1','����','C');
insert into member values ('1002','1002','�����2','�����2','����','C');
insert into member values ('1003','1003','�����3','�����3','����','C');
insert into member values ('1004','1004','�����4','�����4','����','C');
insert into member values ('1005','1005','�����5','�����5','����','B');

sysdate;

insert into board values ('1','f','A','board_no+1','����','����',sysdate,0);

alter table member modify member_dv varchar2(10);

delete from member where member_id = '100';

update member set member_dv = '�����' where member_grade = 'C';


select * from member where member_dv = '�����';

select *
from member;

select *
from board;

select *
from reply;

select *
from tradeboard;



