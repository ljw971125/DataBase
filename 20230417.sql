-- 서브 쿼리문을 이용하여 기존의 부서 테이블에서
-- 데이터는 제외하고 구조만 복사하기
create table dept_copy
as
select * from department where 0=1; -- department에 있는 모든 내용을 dept_copy에 넣어주세요(구조만 가져옴)

-- ACCOUNTING 부서의 정보 입력하기
insert into dept_copy
values(10, 'ACCOUNTING', 'NEW WORK');

--테이블에 새로운 데이터가 추가되었는지 확인하기
select *
from dept_copy;

-- ACCOUNTING 부서의 정보 입력하기
insert into dept_copy(dno, loc, dname)
values(20, 'DALLAS', 'RESEARCH');

delete from dept_copy; -- 테이블의 모든 데이터 지우기

-- 암시적으로 NULL 값 삽입하기
-- 값을 입력하지 않으면 자동으로 NULL값 추가
insert into dept_copy(dno, dname)
values(30, 'SALES');

--테이블에 새로운 데이터가 추가되었는지 확인하기
select *
from dept_copy;

-- 명시적으로 NULL값 삽입하기
insert into dept_copy
values(40, 'OPERATIONS', NULL);

-- 공백문자 삽입하기
insert into dept_copy
values(50, 'COMPUTING', ''); -- 공백은 NULL값으로 추가됨

-- 서브 쿼리문을 이용하여 기존의 사원 테이블에서
-- 데이터는 제외하고 구조만 복사하기
create table emp_copy
as
select eno, ename, job, hiredate, dno from employee where 0=1; -- 구조만 

-- 날짜 데이터 입력하기
insert into emp_copy
values(7000, 'CANDY', 'MANAGER','2023/04/17', 10);

--테이블에 새로운 데이터가 추가되었는지 확인하기
select *
from emp_copy;

-- TO_DATE 함수를 사용하여 날짜를 입력하기
insert into emp_copy
values(7010, 'TOM', 'MANAGER', to_date('2023,04,17','YYYY,MM,DD'),20);

-- SAVEDATE 함수로 현재 날짤 입력하기
insert into emp_copy
values(7020, 'JERRY', 'SALESMAN', sysdate, 30);

--테이블에 새로운 데이터가 추가되었는지 확인하기
select *
from emp_copy;

-- 테이블의 구조만 복사하기(1=1)
create table dept_copy2
as
select * from department where 0=1;

-- 테이블 구조 확인하기
desc dept_copy2;

-- 테이블의 데이터 확인하기
select *
from dept_copy2;

-- 서브 쿼리로 다중 행 입력하기
insert into dept_copy2
select * from department;

-- 테이블의 데이터 확인하기
select *
from dept_copy2;

-- 테이블의 구조와 데이터를 복사하기(1=1)
create table dept_copy3
as
select * from department where 1=1;

select *
from dept_copy3;

-- ACCOUNTING을 PROGRAMMING으로 변경하기
update dept_copy3
set dname = 'PROGRAMMING'
where dno = 10;

-- 어벤저스급 SQL문
update dept_copy3
set dname = 'HR';

select *
from dept_copy3;

-- 컬럼 값 여러개를 한번에 수정하기
update dept_copy3
set dname= 'PROGRAMMING', loc='SEOUL'
where dno = 10;

select *
from dept_copy3;

-- 10번 부서의 지역명을 20번 부서의 지역명으로 변경하기
update dept_copy3
set loc =(select loc
        from dept_copy3
        where dno = 20)
where dno = 10;

-- 여러 개의 컬럼값을 변경하기
update dept_copy3
set dname = (select dname
            from dept_copy3
            where dno = 30),
            
    loc =  (select loc
            from dept_copy3
            where dno = 30)
where dno = 10;

-- 10번 부서를 삭제하기
delete dept_copy3;

-- 테이블의 데이터 확인하기
select *
from dept_copy3;

-- 사원 테이블 생성하기
-- 모두 복사할때 1+1 생략가능
create table emp_copy2
as
select * from employee;

-- 테이블 생성하기
create table dept_copy4
as
select * from department;

-- 부서 정보를 저장하기 위한 테이블 생성하기
create table dept(
        dno     number(2),
        dname   varchar2(14),
        loc     varchar2(13)
);

-- 서브 쿼리문으로 부서 테이블의 구조와 데이터 복사하기
create table dept_second
as
select * from department;

-- 테이블의 데이터 확인하기
select *
from dept_second;

-- 20번 부서 소속 사원에 대한 정보를 포함한 DEPT20 테이블 생성하기
create table dept20
as
select eno, ename, salary * 12 annsal
from employee
where dno = 20;

select *
from dept20;

-- 별칭을 사용하지 않았을 때
create table dept20_err
as
select eno, ename, salary * 12
from employee
where dno = 20;

-- 부서 테이블을 구조만 복사하기
create table dept_third
as
select dno, dname
from department
where 0 = 1;

select *
from dept_third;

-- 테이블 구조 확인하기
desc dept20;

-- 생년월일 컬럼을 추가하기
alter table dept20
add(birth date);

desc dept20;

-- 사원 이름 컬럼 크기 변경하기
alter table dept20
modify ename varchar2(30);

desc dept20;

-- 사원이름 삭제하기
alter table dept20
drop column ename;

desc dept20;

-- 테이블명 변경하기
rename dept20 to emp20;

desc dept20;
desc emp20;


-- 테이블 제거하기
drop table emp20;

desc emp20;

-- 테이블에 모든 데이터 제거하기
truncate table dept_second;

-- 테이블의 구조 확인하기
desc dept_second;

-- 테이블의 내용 확인하기
select *
from dept_second;