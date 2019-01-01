drop table member;

create table member(
  idx number(8), -- 회원번호 primary key
  name varchar2(30) not null, -- 이름
  userid varchar2(15) not null, -- 아이디 unique key
  pwd varchar2(15) not null, -- 비밀번호
  email varchar2(100), -- 이메일
  hp1 char(3) not null, -- 휴대폰 앞 3자리
  hp2 char(4) not null, -- 휴대폰 중간 4자리
  hp3 char(4) not null, -- 휴대폰 끝 4자리
  zipcode char(5), -- 우편번호
  addr1 varchar2(100) not null, -- 주소
  addr2 varchar2(100) not null, -- 상세주소
  indate date default sysdate, -- 가입일
  mileage number(8) default 0, -- 적립금
  mstate number(1) default 0, -- 회원 상태: 가입(0), 정지(-1), 탈퇴(-2)
  --제약조건
  constraint member_idx_pk primary key (idx),
  constraint member_userid_uk unique (userid)
);

drop sequence member_seq;

create sequence member_seq
start with 1
increment by 1
nocache;