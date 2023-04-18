-- ���� �������� �̿��Ͽ� ������ �μ� ���̺���
-- �����ʹ� �����ϰ� ������ �����ϱ�
create table dept_copy
as
select * from department where 0=1; -- department�� �ִ� ��� ������ dept_copy�� �־��ּ���(������ ������)

-- ACCOUNTING �μ��� ���� �Է��ϱ�
insert into dept_copy
values(10, 'ACCOUNTING', 'NEW WORK');

--���̺� ���ο� �����Ͱ� �߰��Ǿ����� Ȯ���ϱ�
select *
from dept_copy;

-- ACCOUNTING �μ��� ���� �Է��ϱ�
insert into dept_copy(dno, loc, dname)
values(20, 'DALLAS', 'RESEARCH');

delete from dept_copy; -- ���̺��� ��� ������ �����

-- �Ͻ������� NULL �� �����ϱ�
-- ���� �Է����� ������ �ڵ����� NULL�� �߰�
insert into dept_copy(dno, dname)
values(30, 'SALES');

--���̺� ���ο� �����Ͱ� �߰��Ǿ����� Ȯ���ϱ�
select *
from dept_copy;

-- ��������� NULL�� �����ϱ�
insert into dept_copy
values(40, 'OPERATIONS', NULL);

-- ���鹮�� �����ϱ�
insert into dept_copy
values(50, 'COMPUTING', ''); -- ������ NULL������ �߰���

-- ���� �������� �̿��Ͽ� ������ ��� ���̺���
-- �����ʹ� �����ϰ� ������ �����ϱ�
create table emp_copy
as
select eno, ename, job, hiredate, dno from employee where 0=1; -- ������ 

-- ��¥ ������ �Է��ϱ�
insert into emp_copy
values(7000, 'CANDY', 'MANAGER','2023/04/17', 10);

--���̺� ���ο� �����Ͱ� �߰��Ǿ����� Ȯ���ϱ�
select *
from emp_copy;

-- TO_DATE �Լ��� ����Ͽ� ��¥�� �Է��ϱ�
insert into emp_copy
values(7010, 'TOM', 'MANAGER', to_date('2023,04,17','YYYY,MM,DD'),20);

-- SAVEDATE �Լ��� ���� ��© �Է��ϱ�
insert into emp_copy
values(7020, 'JERRY', 'SALESMAN', sysdate, 30);

--���̺� ���ο� �����Ͱ� �߰��Ǿ����� Ȯ���ϱ�
select *
from emp_copy;

-- ���̺��� ������ �����ϱ�(1=1)
create table dept_copy2
as
select * from department where 0=1;

-- ���̺� ���� Ȯ���ϱ�
desc dept_copy2;

-- ���̺��� ������ Ȯ���ϱ�
select *
from dept_copy2;

-- ���� ������ ���� �� �Է��ϱ�
insert into dept_copy2
select * from department;

-- ���̺��� ������ Ȯ���ϱ�
select *
from dept_copy2;

-- ���̺��� ������ �����͸� �����ϱ�(1=1)
create table dept_copy3
as
select * from department where 1=1;

select *
from dept_copy3;

-- ACCOUNTING�� PROGRAMMING���� �����ϱ�
update dept_copy3
set dname = 'PROGRAMMING'
where dno = 10;

-- ������� SQL��
update dept_copy3
set dname = 'HR';

select *
from dept_copy3;

-- �÷� �� �������� �ѹ��� �����ϱ�
update dept_copy3
set dname= 'PROGRAMMING', loc='SEOUL'
where dno = 10;

select *
from dept_copy3;

-- 10�� �μ��� �������� 20�� �μ��� ���������� �����ϱ�
update dept_copy3
set loc =(select loc
        from dept_copy3
        where dno = 20)
where dno = 10;

-- ���� ���� �÷����� �����ϱ�
update dept_copy3
set dname = (select dname
            from dept_copy3
            where dno = 30),
            
    loc =  (select loc
            from dept_copy3
            where dno = 30)
where dno = 10;

-- 10�� �μ��� �����ϱ�
delete dept_copy3;

-- ���̺��� ������ Ȯ���ϱ�
select *
from dept_copy3;

-- ��� ���̺� �����ϱ�
-- ��� �����Ҷ� 1+1 ��������
create table emp_copy2
as
select * from employee;

-- ���̺� �����ϱ�
create table dept_copy4
as
select * from department;

-- �μ� ������ �����ϱ� ���� ���̺� �����ϱ�
create table dept(
        dno     number(2),
        dname   varchar2(14),
        loc     varchar2(13)
);

-- ���� ���������� �μ� ���̺��� ������ ������ �����ϱ�
create table dept_second
as
select * from department;

-- ���̺��� ������ Ȯ���ϱ�
select *
from dept_second;

-- 20�� �μ� �Ҽ� ����� ���� ������ ������ DEPT20 ���̺� �����ϱ�
create table dept20
as
select eno, ename, salary * 12 annsal
from employee
where dno = 20;

select *
from dept20;

-- ��Ī�� ������� �ʾ��� ��
create table dept20_err
as
select eno, ename, salary * 12
from employee
where dno = 20;

-- �μ� ���̺��� ������ �����ϱ�
create table dept_third
as
select dno, dname
from department
where 0 = 1;

select *
from dept_third;

-- ���̺� ���� Ȯ���ϱ�
desc dept20;

-- ������� �÷��� �߰��ϱ�
alter table dept20
add(birth date);

desc dept20;

-- ��� �̸� �÷� ũ�� �����ϱ�
alter table dept20
modify ename varchar2(30);

desc dept20;

-- ����̸� �����ϱ�
alter table dept20
drop column ename;

desc dept20;

-- ���̺�� �����ϱ�
rename dept20 to emp20;

desc dept20;
desc emp20;


-- ���̺� �����ϱ�
drop table emp20;

desc emp20;

-- ���̺� ��� ������ �����ϱ�
truncate table dept_second;

-- ���̺��� ���� Ȯ���ϱ�
desc dept_second;

-- ���̺��� ���� Ȯ���ϱ�
select *
from dept_second;