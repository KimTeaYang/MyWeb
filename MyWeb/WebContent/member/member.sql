drop table member;

create table member(
  idx number(8), -- ȸ����ȣ primary key
  name varchar2(30) not null, -- �̸�
  userid varchar2(15) not null, -- ���̵� unique key
  pwd varchar2(15) not null, -- ��й�ȣ
  email varchar2(100), -- �̸���
  hp1 char(3) not null, -- �޴��� �� 3�ڸ�
  hp2 char(4) not null, -- �޴��� �߰� 4�ڸ�
  hp3 char(4) not null, -- �޴��� �� 4�ڸ�
  zipcode char(5), -- �����ȣ
  addr1 varchar2(100) not null, -- �ּ�
  addr2 varchar2(100) not null, -- ���ּ�
  indate date default sysdate, -- ������
  mileage number(8) default 0, -- ������
  mstate number(1) default 0, -- ȸ�� ����: ����(0), ����(-1), Ż��(-2)
  --��������
  constraint member_idx_pk primary key (idx),
  constraint member_userid_uk unique (userid)
);

drop sequence member_seq;

create sequence member_seq
start with 1
increment by 1
nocache;

select * from member;



SELECT IDX,NAME,USERID,HP1,HP2,HP3,EMAIL,INDATE,MSTATE 
FROM MEMBER ORDER BY IDX DESC;

update member set mstate=-2 where idx = 1;

drop table zipcode;

create table zipcode(
   new_post_code varchar2(5),
   sido_kor varchar2(40),
   sido_eng varchar2(40),
   sigungu_kor varchar2(30),
   sigungu_eng varchar2(30),
   upmyon_kor varchar2(30),
   upmyon_eng varchar2(30),
   doro_num varchar2(20),
   doro_kor varchar2(100),
   doro_eng varchar2(100),
   under_flag number(10),
   bld_origin_num number(5),
   bld_refer_num number(5),
   bld_manage_num varchar2(30),
   multi_deliver_name varchar2(40),
   sigungu_bld_name varchar2(200),
   law_dong_num varchar2(30),
   law_dong_name varchar2(30),
   ri_name varchar2(30),
   admin_dong_name varchar2(40),
   san_flag varchar2(10),
   jibeon_bonbeon number(4),
   upmyondong_seq varchar2(5),
   jibeon_bubeon number(4),
   old_post_code  varchar2(6),
   post_code_seq varchar2(3)
);

select * from zipcode where doro_kor like '%����%';
SELECT NEW_POST_CODE, SIDO_KOR, SIGUNGU_KOR, DORO_KOR, LAW_DONG_NAME, ADMIN_DONG_NAME, JIBEON_BONBEON, JIBEON_BUBEON
FROM ZIPCODE;

�並 �����ϵ�
���̸� : memberView
���� : mstate�� 0(�Ϲ�ȸ��)�̰ų� -1(����ȸ��)�� ȸ�������� ���� �並 �����ϼ���;

create or replace view memberView
as
select * from member where mstate=0 or mstate=-1;

select * from memberView;
