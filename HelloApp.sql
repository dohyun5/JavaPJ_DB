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

update tbl_reply
set reply = #{reply}
where reply_no = #{replyNo};


select * from hr.employees;
select * from hr.departments;

--부서별 인원 현황
select d.department_name, count(*) as cnt
from hr.employees e
join hr.departments d
on d.department_id = e.department_id
group by d.department_name;

--권한주기 hr에서
select * from employees;


grant select on employees to dev;
grant select on departments to dev;
--권한주기

create table events(
title varchar2(100) not null,
start_date varchar2(20) not null,
end_date varchar2(20)
);

insert into events values('약속1','2023-04-05','null');
insert into events values('약속2','2023-04-05T20:00:00','2023-04-05T22:00:00');

commit;

delete from events where title='약속1'; 
--and start_date='2023-04-10' and end_date = '2023-04-12';

select * from events;

create table tbl_product(
product_no number primary key,
product_name varchar2(200) not null,
product_content varchar2(3000) not null,
product_price number not null,
product_dprice number not null,
product_score number(1) not null,
product_img varchar2(2000) default null
);



insert into tbl_product
values(1, '케냐 피베리','오렌지 시트러스한 산미가 특징', 52,41,5,'1.jpg');

insert into tbl_product
values(2, '에티오피아 예가체프 G2', '부드러운 신 맛과 꽃, 과실의 향이 특징', 50,44,3,'2.jpg');

insert into tbl_product
values(3, '브라질 세하도 파인컵 NY2', '고소한 너트향, 카라멜의 단맛, 산뜻한 산미가 균형일 이루는 것이 특징', 64,49,3,'3.jpg');

insert into tbl_product
values(4, '콜롬비아 수프리모', '적포도 향과 메이플시럽, 다크초코의 향이 잘 어우러진 것이 특징', 70,51,5,'4.jpg');

insert into tbl_product
values(5, '과테말라 안티구아', '뛰어난 감칠맛과 부드러운 단맛에 중후한 바디감이 특징', 57,48,4,'5.jpg');

insert into tbl_product
values(6, '코스타리카 따라주 SHB', '열대과일의 산미 카카오의 씁쓸함이 느껴지는 것이 특징', 80,71,2,'6.jpg');

insert into tbl_product
values(7, '인도네시아 만델링 G1', '밀크초코의 부드러움  그러나 묵직한 바디감이 특징', 80,73,5,'7.jpg');

insert into tbl_product
values(8, '인도 몬순 말라바르 AA', '복합적인 너티향과 부드러운 단맛이 특징', 48,43,1,'8.jpg');

commit;

select * from tbl_product order by product_score desc;

delete from tbl_product where product_no = 8;

drop table tbl_product;

select * from tbl_product where product_no = 1;
