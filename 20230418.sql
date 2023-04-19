-- 컬럼 레벨에서 제약 조건을 정의하기
create table dept_new2(
    dno     NUMBER(2) constraint pk_dept_new2 primary key,
    dname   varchar2(14),
    loc     varchar2(13)
);

-- 테이블 레벨에서 제약 조건을 정의하기
create table dept_new3(
    dno     NUMBER(2),
    dname   varchar2(14),
    loc     varchar2(13),
    constraint pk_dept_new3 primary key(dno)
);

-- NOT NULL 제약 조건 지정하기
create table customer(
    id      varchar(20)    not null,
    pwd     varchar(20)    not null,
    name    varchar(20)    not null,
    phone   varchar(30),
    address varchar(100)
);
-- 테이블에 NULL 데이터 추가하기
insert into customer
values(null, null, null, '010-1111-2222','SEOUL');

-- 테이블 삭제하기
drop table customer;

-- UNIQUE 제약 조건 지정하기
create table customer(
    id      varchar(20)    UNIQUE,
    pwd     varchar(20)    not null,
    name    varchar(20)    not null,
    phone   varchar(30),
    address varchar(100)
);

-- 테이블에 중복된 데이터 추가하기
insert into customer
values('ryan', '1234', '라이언', '010-1111-2222', 'SEOUL');

-- UNIQUE는 중복이 되지 않기 때문에 오류
insert into customer
values('ryan', '12345678', '어피치', '010-1111-2222', 'SEOUL');

-- 테이블에 NULL 데이터 추가하기
insert into customer
values(NULL, '12345678', '어피치', '010-1111-2222', 'SEOUL');

-- 테이블 데이터 출력하기
select *
from customer;

-- 제약 조건 이름 지정하기
create table customer2(
    id      varchar(20)    constraint customer2_id_uk unique,
    pwd     varchar(20)    constraint customer2_pwd_nn not null,
    name    varchar(20)    constraint customer2_name_nn not null,
    phone   varchar(30),
    address varchar(100)
);

-- 제약 조건 확인하기
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

-- 테이블에 중복된 데이터 추가하기
insert into customer3
values('ryan', '1234', '라이언', '010-1111-2222', 'SEOUL');

insert into customer3
values(NULL, '12345678', '어피치', '010-1111-2222', 'SEOUL');

-- 부서 테이블 출력하기
select  *
from department;

-- 사원 테이블에 50번 사원을 추가
insert into employee(eno, ename, dno)
values(8000, 'ryan', 50);

-- FORIGN KEY 제약조건 지정하기
create table emp_new2(
    eno     number(4)  constraint emp_new2_pk  primary key,
    ename   varchar2(10),
    job     varchar2(9),
    dno     number(2)  constraint emp_new2_dno_fk  references  department
);

-- CHECK 제약조건 지정하기
create table emp_new3(
    eno     number(4)  constraint emp_new3_eno_pk  primary key,
    ename   varchar2(10),
    salary number(7,2) constraint emp_new3_salary_min check (salary>0)
);

-- INSERT문으로 CHECK 제약조건 확인
insert into emp_new3
values(8000, 'ryan', 100);

-- DEFAULT 제약조건 지정하기
create table emp_new4(
    eno     number(4)  constraint emp_new3_eno_pk  primary key,
    ename   varchar2(10),
    salary number(7,2) default 1000
);

-- DEFAULT 제약조건을 지정한 컬럼 값을 생략하기
insert into emp_new4(eno, ename)
values(8000, 'ryan');

-- 테이블 데이터 확인하기
select *
from emp_new4;

-- 제약조건 추가하기
create table emp_cp
as
select * from employee;

create table dept_cp
as
select * from department;

-- 제약 조건 확인하기
select table_name, constraint_name
from user_constraints
where table_name in('emp_cp','dept_cp');

alter table emp_cp
add constraint emp_cp_eno_pk primary key(eno);

alter table dept_cp
add constraint dept_cp_eno_pk primary key(dno);

alter table emp_cp
add constraint emp_cp_dno_fk foreign key(dno) references dept_cp(dno);

-- MODIFY NOT NULL로 NULL값 허용하지 않기
alter table emp_cp
modify ename constraint emp_cp_ename_nn not null;

-- 제약 조건 제거
alter table dept_cp
drop primary key;

-- CASCADE 옵션으로 종속 제약조건까지 모두 제거하기
alter table dept_cp
drop primary key cascade;

-- NOT NULL 제약조건 제거하기
alter table emp_cp
drop constraint emp_cp_ename_nn;

-- 단순 뷰 정의하기
create table emp_cp2
as
select * from employee;

create table dept_cp2
as
select * from department;

create view v_emp_job(사번, 사원이름, 부서번호, 담당업무)
as
select eno, ename, dno, job
from emp_cp2
where job like 'SALESMAN';

-- 뷰 사용하기
select *
from v_emp_job;

create view v_emp_job2
as
select eno, ename, dno, job
from emp_cp2
where job like 'SALESMAN';

-- 뷰 사용하기
select *
from v_emp_job2;

-- 복합 뷰 정의하기
create view v_emp_complex
as
select *
from emp_cp2 natural join dept_cp2;

-- 복합 뷰 확인하기
select *
from v_emp_complex;

-- 보안을 위해 뷰 활용하기
create view v_emp_sample
as
select eno, ename, job, manager, dno
from emp_cp2;

-- 뷰 확인하기
select *
from v_emp_sample;

-- 뷰 활용하기
create view v_emp_complex2
as
select e.eno, e.ename, e.salary, dno, d.loc
from emp_cp2 e natural join dept_cp2 d;

select *
from v_emp_complex2;

-- 뷰에 그룹함수 사용하기
create view v_emp_salary
as
select dno, sum(salary) as "sal_sum", avg(salary) as "sal_avg"
from emp_cp2
group by dno;

select *
from v_emp_salary;

-- 뷰에 데이터 추가하기
insert into v_emp_salary
values(8000, 1000, 300);

-- 뷰 제거하기
drop view v_emp_job;

-- 뷰 생성하기
create or replace view v_emp_job2
as
select eno, ename, dno, job
from emp_cp2
where job like 'SALESMAN';

-- 기본 테이블이 존재하지 않아 뷰 생성에 실패할 경우
create view v_emp_notable
as
select eno, ename, dno, job
from emp_notable
where hob like 'SALESMAN';

-- FORCE 옵션으로 기존 테이블이 존재하지 않더라도 뷰 생성하기
create or replace force view v_emp_notable
as
select eno, ename, dno, job
from emp_notable
where hob like 'SALESMAN';


-- 담당 업무가 MANAGER인 사원들을 조회하는 뷰 생성하기
create or replace force view v_emp_nochk
as
select eno, ename, dno, job
from emp_cp2
where job like 'MANAGER';

-- 뷰 조회하기
select *
from v_emp_nochk;

-- 뷰에 사원을 추가하되 담당 업무를 SALESMAN으로 지정하기
insert into v_emp_nochk
values(9000,'ryan', 30, 'SALESMAN');

select *
from v_emp_nochk;


-- 담당 업무가 MANAGER인 사원들을 조회하는 뷰 생성하기
create or replace force view v_emp_chk
as
select eno, ename, dno, job
from emp_cp2
where job like 'MANAGER' with check option;


select *
from v_emp_chk;

-- 뷰에 사원을 추가하되 담당 업무를 SALESMAN으로 지정하기
insert into v_emp_chk
values(9000,'ryan', 30, 'SALESMAN');

-- 담당 업무가 MANAGER인 사원들을 조회하는 뷰 생성하기
create or replace force view v_emp_readonly
as
select eno, ename, dno, job
from emp_cp2
where job like 'MANAGER' with read only;

select *
from v_emp_readonly;

-- 뷰에 사원을 추가하되 담당 업무를 SALESMAN으로 지정하기
insert into v_emp_readonly
values(9000,'ryan', 30, 'MANAGER');

-- 시퀀스 생성하기
-- 시작값 10, 10씩 증가
create sequence sample_seq
increment by 10
start with 10;

-- 시퀀스 보기
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

-- 부서번호를 위한 시퀀스 생성하기
create sequence dno_seq
increment by 10
start with 10;

-- 빈 테이블 생성하기
create table dept_sample2
as
select * from department where 0 = 1;

-- 새로운 부서 추가하기
insert into dept_sample2
values(dno_seq.nextval, 'ACCOUNTING', 'NEW YORK');

-- 부서 확인하기
select *
from dept_sample2;


-- dno_seq 시퀀스의 최대값 확인하기
select sequence_name, min_value, max_value,
        increment_by, cycle_flag
from user_sequences
where sequence_name in('DNO_SEQ');

-- 시퀀스 변경하기
alter sequence dno_seq
maxvalue 50;

-- dno_seq 시퀀스의 최대값 확인하기
select sequence_name, min_value, max_value,
        increment_by, cycle_flag
from user_sequences
where sequence_name in('DNO_SEQ');