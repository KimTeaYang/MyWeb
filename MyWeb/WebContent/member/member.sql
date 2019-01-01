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