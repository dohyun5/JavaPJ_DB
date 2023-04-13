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
member_id varchar2(20),
member_fname varchar2(999),
rep_no number(30),
board_no number(7),
rep_content varchar2(2000),
rep_date date default sysdate,
CONSTRAINT fk_board_no foreign key(board_no) references board 
(board_no)ON DELETE cascade);

create table tradereply(
member_id varchar2(20),
member_fname varchar2(999),
rep_no number(30),
board_no number(7),
rep_content varchar2(2000),
rep_date date default sysdate,
CONSTRAINT fk_tradeboard_no foreign key(board_no) references tradeboard (board_no)ON DELETE cascade);

create or replace trigger BN
after update of board_no on board for each row
begin 
update board set board_no=:new.board_no where board_no=:old.board_no;
end;
/
commit;

drop trigger BN;

alter table member add member_grade varchar2(1);

drop table member;

drop table board;

drop table tradeboard;

drop table reply;

drop table tradereply;

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
from tradereply;

select *
from tradeboard;

insert into reply values ('root','������',(SELECT NVL(MAX(rep_no)+1,1) FROM reply where board_no = 4),4,'ù��',sysdate);

SELECT NVL(MAX(rep_no)+1,1) FROM reply where board_no = 4;


commit;

delete from reply;

