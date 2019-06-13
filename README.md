create sequence seq_board;

create table cal_board(
bno number(10,0),
title varchar2(200) not null,
content varchar2(500) not null,
start_date Date,
start_time varchar2(15) ,
end_time varchar2(15) ,
start_day varchar2(15)

);

create table cal_board(
bno number(10,0),
title varchar2(200) not null,
content varchar2(500) not null,
start_date DATE ,
end_date DATE ,
start_time varchar2(15) ,
end_time varchar2(15) ,
start_day varchar2(15) ,
end_day varchar2(15)
);

alter table cal_board add constraint pk_board
primary key (bno);

select seq_board.nextval from dual;
