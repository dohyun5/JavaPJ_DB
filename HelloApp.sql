insert into tbl_notice (notice_no, notice_writer, notice_title, notice_content)
    select notice_seq.nextval,notice_writer,notice_title,notice_content
    from tbl_notice;
    
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



