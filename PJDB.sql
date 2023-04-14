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
board_views number(7),
trade_ing varchar2(20),
trade_fname varchar2(200));


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
CONSTRAINT fk_tradeboard_no foreign key(board_no) references tradeboard 
(board_no)ON DELETE cascade);

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

insert into member values ('root','root','관리자','관리자','없음','A');
insert into member values ('1000','1000','최판매자','판매자','신청가능','B');
insert into member values ('1001','1001','신구매자','구매자','신청가능','B');
insert into member values ('1002','1002','박반','일반','신청가능','C');
insert into member values ('1003','1003','이번','이번','신청가능','C');
insert into member values ('1004','1004','김삼번','삼번','신청가능','C');
insert into member values ('1005','1005','못봄','못봄','신청가능','B');

sysdate;

insert into board values ('1','f','A','board_no+1','제목','내용',sysdate,0);

alter table member modify member_dv varchar2(10);

delete from member where member_id = '100';



update member set member_dv = '배송전' where member_grade = 'C';


select * from member where member_dv = '배송전';

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

delete tradeboard;
commit;

delete board;
delete tradeboard;
delete reply;
delete tradereply;



insert into reply values ('root','관리자',(SELECT NVL(MAX(rep_no)+1,1) FROM reply where board_no = 4),4,'첫댓',sysdate);

SELECT NVL(MAX(rep_no)+1,1) FROM reply where board_no = 4;

commit;


delete from reply;

update tradeboard set trade_ing = '거래완료',trade_fname = '사용자5' where board_no = 2;

select * from tradeboard where member_id = '123' or trade_fname = '사용자' ORDER BY board_no;

commit;

delete member;
