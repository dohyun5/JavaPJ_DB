insert into tbl_notice (notice_no, notice_writer, notice_title, notice_content)
    select notice_seq.nextval,notice_writer,notice_title,notice_content
    from tbl_notice;
    

update tbl_notice
set attach_file='7'

select count(*) from tbl_notice;

commit;

select b.*
from (select rownum rn, a.*
        from( select * from tbl_notice
            order by 1 desc) a
        where rownum <=2*10 ) b
where b.rn >(2-1)*10;
--rownum - 처리된 결과의 수 

create table members(
email varchar2(50) primary key,
password varchar2(20)not null,
name varchar2(50) not null,
phone varchar2(50) not null,
address varchar2(100),
auth varchar2(5) default 'User', --권한 Admin, User이 들어올수 있음.
create_date date default sysdate
);

insert into members (email, password, name, phone, auth)
values('User1@email.com', '1234', '홍길동', '010-1111-1111','User');
insert into members (email, password, name, phone, auth)
values('User2@email.com', '1234', '이길동', '010-2222-2222','User');
insert into members (email, password, name, phone, auth)
values('User3@email.com', '1234', '박길동', '010-3333-3333','User');
insert into members (email, password, name, phone, auth)
values('User4@email.com', '1234', '최길동', '010-4444-4444','User');
insert into members (email, password, name, phone, auth)
values('admin@email.com', '1234', '관리자', '010-5555-5555','Admin');

commit;

select * from members;




select * from tab;

select * from tbl_notice;

delete from tbl_notice where notice_no > 100;

commit;

create table tbl_reply(
reply_no number primary key,
notice_no number not null,
reply varchar2(1000)not null,--댓글 내용
reply_writer varchar2(50) not null,
reply_date date default sysdate
);

create sequence reply_seq;

insert into tbl_reply
values(reply_seq.nextval ,98,'98번 공지사항의 댓글입니다','user01',sysdate);

insert into tbl_reply
values(reply_seq.nextval ,98,'98번 공지사항의 댓글입니다','user02',sysdate);

insert into tbl_reply
values(reply_seq.nextval ,98,'98번 공지사항의 댓글입니다','user03',sysdate);


commit;

select * from tbl_reply
where notice_no = 100;

delete from tbl_reply where reply_no > 15;

select * from members;

insert into members (email, password, name, phone, auth)
values('User1@email.com', '1234', '홍길동', '010-1111-1111','User');
insert into members (email, password, name, phone, auth)
values('User2@email.com', '1234', '이길동', '010-2222-2222','User');
insert into members (email, password, name, phone, auth)
values('User3@email.com', '1234', '박길동', '010-3333-3333','User');
insert into members (email, password, name, phone, auth)
values('User4@email.com', '1234', '최길동', '010-4444-4444','User');
insert into members (email, password, name, phone, auth)
values('admin@email.com', '1234', '관리자', '010-5555-5555','Admin');






