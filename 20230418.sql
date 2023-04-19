-- �÷� �������� ���� ������ �����ϱ�
create table dept_new2(
    dno     NUMBER(2) constraint pk_dept_new2 primary key,
    dname   varchar2(14),
    loc     varchar2(13)
);

-- ���̺� �������� ���� ������ �����ϱ�
create table dept_new3(
    dno     NUMBER(2),
    dname   varchar2(14),
    loc     varchar2(13),
    constraint pk_dept_new3 primary key(dno)
);

-- NOT NULL ���� ���� �����ϱ�
create table customer(
    id      varchar(20)    not null,
    pwd     varchar(20)    not null,
    name    varchar(20)    not null,
    phone   varchar(30),
    address varchar(100)
);
-- ���̺� NULL ������ �߰��ϱ�
insert into customer
values(null, null, null, '010-1111-2222','SEOUL');

-- ���̺� �����ϱ�
drop table customer;

-- UNIQUE ���� ���� �����ϱ�
create table customer(
    id      varchar(20)    UNIQUE,
    pwd     varchar(20)    not null,
    name    varchar(20)    not null,
    phone   varchar(30),
    address varchar(100)
);

-- ���̺� �ߺ��� ������ �߰��ϱ�
insert into customer
values('ryan', '1234', '���̾�', '010-1111-2222', 'SEOUL');

-- UNIQUE�� �ߺ��� ���� �ʱ� ������ ����
insert into customer
values('ryan', '12345678', '����ġ', '010-1111-2222', 'SEOUL');

-- ���̺� NULL ������ �߰��ϱ�
insert into customer
values(NULL, '12345678', '����ġ', '010-1111-2222', 'SEOUL');

-- ���̺� ������ ����ϱ�
select *
from customer;

-- ���� ���� �̸� �����ϱ�
create table customer2(
    id      varchar(20)    constraint customer2_id_uk unique,
    pwd     varchar(20)    constraint customer2_pwd_nn not null,
    name    varchar(20)    constraint customer2_name_nn not null,
    phone   varchar(30),
    address varchar(100)
);

-- ���� ���� Ȯ���ϱ�
select table_name, constraint_name
from user_constraints
where table_name in('CUSTOMER2');

create table customer3(
    id      varchar(20) ,
    pwd     varchar(20) constraint customer3_pwd_nn not null,
    name    varchar(20) constraint customer3_name_nn not null,
    phone   varchar(30),
    address varchar(100),
    constraint customer3_id_pk primary key(id)
);

-- ���̺� �ߺ��� ������ �߰��ϱ�
insert into customer3
values('ryan', '1234', '���̾�', '010-1111-2222', 'SEOUL');

insert into customer3
values(NULL, '12345678', '����ġ', '010-1111-2222', 'SEOUL');

-- �μ� ���̺� ����ϱ�
select  *
from department;

-- ��� ���̺� 50�� ����� �߰�
insert into employee(eno, ename, dno)
values(8000, 'ryan', 50);

-- FORIGN KEY �������� �����ϱ�
create table emp_new2(
    eno     number(4)  constraint emp_new2_pk  primary key,
    ename   varchar2(10),
    job     varchar2(9),
    dno     number(2)  constraint emp_new2_dno_fk  references  department
);

-- CHECK �������� �����ϱ�
create table emp_new3(
    eno     number(4)  constraint emp_new3_eno_pk  primary key,
    ename   varchar2(10),
    salary number(7,2) constraint emp_new3_salary_min check (salary>0)
);

-- INSERT������ CHECK �������� Ȯ��
insert into emp_new3
values(8000, 'ryan', 100);

-- DEFAULT �������� �����ϱ�
create table emp_new4(
    eno     number(4)  constraint emp_new3_eno_pk  primary key,
    ename   varchar2(10),
    salary number(7,2) default 1000
);

-- DEFAULT ���������� ������ �÷� ���� �����ϱ�
insert into emp_new4(eno, ename)
values(8000, 'ryan');

-- ���̺� ������ Ȯ���ϱ�
select *
from emp_new4;

-- �������� �߰��ϱ�
create table emp_cp
as
select * from employee;

create table dept_cp
as
select * from department;

-- ���� ���� Ȯ���ϱ�
select table_name, constraint_name
from user_constraints
where table_name in('emp_cp','dept_cp');

alter table emp_cp
add constraint emp_cp_eno_pk primary key(eno);

alter table dept_cp
add constraint dept_cp_eno_pk primary key(dno);

alter table emp_cp
add constraint emp_cp_dno_fk foreign key(dno) references dept_cp(dno);

-- MODIFY NOT NULL�� NULL�� ������� �ʱ�
alter table emp_cp
modify ename constraint emp_cp_ename_nn not null;

-- ���� ���� ����
alter table dept_cp
drop primary key;

-- CASCADE �ɼ����� ���� �������Ǳ��� ��� �����ϱ�
alter table dept_cp
drop primary key cascade;

-- NOT NULL �������� �����ϱ�
alter table emp_cp
drop constraint emp_cp_ename_nn;

-- �ܼ� �� �����ϱ�
create table emp_cp2
as
select * from employee;

create table dept_cp2
as
select * from department;

create view v_emp_job(���, ����̸�, �μ���ȣ, ������)
as
select eno, ename, dno, job
from emp_cp2
where job like 'SALESMAN';

-- �� ����ϱ�
select *
from v_emp_job;

create view v_emp_job2
as
select eno, ename, dno, job
from emp_cp2
where job like 'SALESMAN';

-- �� ����ϱ�
select *
from v_emp_job2;

-- ���� �� �����ϱ�
create view v_emp_complex
as
select *
from emp_cp2 natural join dept_cp2;

-- ���� �� Ȯ���ϱ�
select *
from v_emp_complex;

-- ������ ���� �� Ȱ���ϱ�
create view v_emp_sample
as
select eno, ename, job, manager, dno
from emp_cp2;

-- �� Ȯ���ϱ�
select *
from v_emp_sample;

-- �� Ȱ���ϱ�
create view v_emp_complex2
as
select e.eno, e.ename, e.salary, dno, d.loc
from emp_cp2 e natural join dept_cp2 d;

select *
from v_emp_complex2;

-- �信 �׷��Լ� ����ϱ�
create view v_emp_salary
as
select dno, sum(salary) as "sal_sum", avg(salary) as "sal_avg"
from emp_cp2
group by dno;

select *
from v_emp_salary;

-- �信 ������ �߰��ϱ�
insert into v_emp_salary
values(8000, 1000, 300);

-- �� �����ϱ�
drop view v_emp_job;

-- �� �����ϱ�
create or replace view v_emp_job2
as
select eno, ename, dno, job
from emp_cp2
where job like 'SALESMAN';

-- �⺻ ���̺��� �������� �ʾ� �� ������ ������ ���
create view v_emp_notable
as
select eno, ename, dno, job
from emp_notable
where hob like 'SALESMAN';

-- FORCE �ɼ����� ���� ���̺��� �������� �ʴ��� �� �����ϱ�
create or replace force view v_emp_notable
as
select eno, ename, dno, job
from emp_notable
where hob like 'SALESMAN';


-- ��� ������ MANAGER�� ������� ��ȸ�ϴ� �� �����ϱ�
create or replace force view v_emp_nochk
as
select eno, ename, dno, job
from emp_cp2
where job like 'MANAGER';

-- �� ��ȸ�ϱ�
select *
from v_emp_nochk;

-- �信 ����� �߰��ϵ� ��� ������ SALESMAN���� �����ϱ�
insert into v_emp_nochk
values(9000,'ryan', 30, 'SALESMAN');

select *
from v_emp_nochk;


-- ��� ������ MANAGER�� ������� ��ȸ�ϴ� �� �����ϱ�
create or replace force view v_emp_chk
as
select eno, ename, dno, job
from emp_cp2
where job like 'MANAGER' with check option;


select *
from v_emp_chk;

-- �信 ����� �߰��ϵ� ��� ������ SALESMAN���� �����ϱ�
insert into v_emp_chk
values(9000,'ryan', 30, 'SALESMAN');

-- ��� ������ MANAGER�� ������� ��ȸ�ϴ� �� �����ϱ�
create or replace force view v_emp_readonly
as
select eno, ename, dno, job
from emp_cp2
where job like 'MANAGER' with read only;

select *
from v_emp_readonly;

-- �信 ����� �߰��ϵ� ��� ������ SALESMAN���� �����ϱ�
insert into v_emp_readonly
values(9000,'ryan', 30, 'MANAGER');

-- ������ �����ϱ�
-- ���۰� 10, 10�� ����
create sequence sample_seq
increment by 10
start with 10;

-- ������ ����
select sequence_name, min_value, max_value,
        increment_by, cycle_flag
from user_sequences;

select sample_seq.nextval
from dual;

select sample_seq.currval
from dual;

create sequence sample_seq2;

select sample_seq2.nextval
from dual;

-- �μ���ȣ�� ���� ������ �����ϱ�
create sequence dno_seq
increment by 10
start with 10;

-- �� ���̺� �����ϱ�
create table dept_sample2
as
select * from department where 0 = 1;

-- ���ο� �μ� �߰��ϱ�
insert into dept_sample2
values(dno_seq.nextval, 'ACCOUNTING', 'NEW YORK');

-- �μ� Ȯ���ϱ�
select *
from dept_sample2;


-- dno_seq �������� �ִ밪 Ȯ���ϱ�
select sequence_name, min_value, max_value,
        increment_by, cycle_flag
from user_sequences
where sequence_name in('DNO_SEQ');

-- ������ �����ϱ�
alter sequence dno_seq
maxvalue 50;

-- dno_seq �������� �ִ밪 Ȯ���ϱ�
select sequence_name, min_value, max_value,
        increment_by, cycle_flag
from user_sequences
where sequence_name in('DNO_SEQ');