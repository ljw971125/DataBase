-- 전체 사원 출력하기
select *
from employee;

-- 사원번호가 7788인 사원의 이름과 소속 부서명을 출력하기
select dno, ename  
from employee
where eno = 7788;

select dname
from department
where dno = 20;

select *
from employee;

select *
from department;

select *
from employee, department;

-- EQUI JOIN
-- 각 사원들이 소속된 부서정보 출력하기
select *
from employee, department
where employee.dno = department.dno;

-- 사원번호, 사원이름, 소속부서 이름 출력
select eno, ename, dname
from employee, department
where employee.dno = department.dno
and eno = 7788;

-- 잘못된 예
select eno, ename, dname, dno
from employee, department
where employee.dno = department.dno
and eno = 7788;

-- 올바른 예
select eno, ename, dname, employee.dno
from employee, department
where employee.dno = department.dno
and eno = 7788;

-- 테이블에 별칭 사용하기
select e.eno, e.ename, d.dname, e.dno
from employee e, department d
where e.dno = d.dno
and eno = 7788;

-- NATURAL JOIN
-- 잘못된 예
select e.eno, e.ename, d.dname, e.dno
from employee e NATURAL JOIN department d
where e.eno = 7788;

-- 올바른 예
select e.eno, e.ename, d.dname, dno
from employee e NATURAL JOIN department d
where e.eno = 7788;

-- ON절 사용하기
select e.eno, e.ename, d.dname, e.dno
from employee e JOIN department d
on e.dno = d.dno
where e.eno = 7788;

-- 급여 등급 테이블 출력하기
select *
from salgrade;

-- 사원별로 급여 등급 출력하기
select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

select ename, salary, grade
from employee, salgrade
where salary >= losal and salary <= hisal;

-- 3개의 테이블 조인하기
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and salary between losal and hisal;

-- WHERE 절을 사용한 SELF JOIN
select employees.ename as "사원이름", manager.ename as "직속상관이름"
from employee employees, employee manager
where employees.manager = manager.eno;

-- JOIN - ON 절을 사용한 SELF JOIN
select employees.ename || '의 직속상관은' || manager.ename
from employee employees join employee manager
on employees.manager = manager.eno;

-- (+) 기호를 사용한 OUTER JOIN
-- NULL 값이 있는쪽에 (+) 붙이기
select employees.ename || '의 직속상관은' || manager.ename
from employee employees join employee manager
on employees.manager = manager.eno(+);

-- OUTER JOIN
select employees.ename || '의 직속상관은' || manager.ename
from employee employees left outer join employee manager
on employees.manager = manager.eno;

-- SCOTT과 동일한 부서에서 근무하는 사원 출력하기
-- 1) SCOTT의 부서번호를 알아내기 - 20
select dno
from employee
where ename = 'SCOTT';
-- 2) 부서번호가 20인 사원의 이름, 부서번호 출력하기
select ename, dno
from employee
where dno = 20;

-- 서브쿼리 사용하기
select ename, dno
from employee
where dno = (select dno
            from employee
            where ename = 'SCOTT');

select *
from employee;

-- 최소 급여를 받는 사원의 이름, 담당업무, 급여 출력하기
-- 1) 최소 급여
select min(salary)
from employee;

-- 2) 사원의 이름, 담당업무, 급여 출력하기
select ename, job, salary
from employee
where salary = (select min(salary)
                from employee);

-- 30번 부서에서 최소 급여를 구합니다.
-- 부서별 최소 급여가 구한 최소 급여보다 큰 부서만 출력하기
select min(salary)
from employee
where dno = 30;

select dno, min(salary)
from employee
group by dno
having min(salary) > 950;

select dno, min(salary)
from employee
group by dno
having min(salary) > (select min(salary)
                        from employee
                        where dno = 30);

-- 문제
select eno, ename
from employee
where salary = (select min(salary)
                 from employee
                 group by dno);
                 
-- 다중 행 연산자인 IN 사용하기      
select eno, ename
from employee
where salary IN (select min(salary)
                 from employee
                 group by dno);

-- 직급이 SALESMAN이 아니면서 급여가 SALESMAN 보다 낮은 사원 출력하기
select salary
from employee
where job = 'SALESMAN';

select eno, ename, job, salary
from employee
where salary < all (select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';

-- 사원번호가 7788인 사원과 담당 업무가 같은 사원을 출력하기
-- ename, job
select job
from employee
where eno = 7788;

select ename, job
from employee
where job = (select job
            from employee
            where eno = 7788);

-- 사원번호가 7499인 사원보다 급여가 많은 사원을 출력하기
-- ename, job

select job
from employee
where eno = 7499;

select ename, job
from employee
where salary >  (select salary
            from employee
            where eno = 7499);

-- 최소 급여를 받는 사원의 이름, 담당업무, 급여 출력하기
-- ename, job, salary
select min(salary)
from employee;

select ename, job, salary
from employee
where salary = (select min(salary)
               from employee);

-- 평균 급여가 가장 적은 사원의 담당 업무를 찾아 직급과 평균 급여를 출력하기
-- job, salary
select job, round(avg(salary),1)
from employee
group by job
having round(avg(salary),1) = (select min(round(avg(salary),1))
                                from employee
                                group by job);


-- 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호 출력하기
--ename, salary, dno
select ename, salary, dno
from employee
where salary in (select min(salary)
                    from employee
                    group by dno);

-- 담당업무가 분석가인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원 출력하기
-- eno, ename, job, salary
select job
from employee
where job = 'ANALYST';

select eno, ename, job, salary
from employee
where  salary < ANY (select salary
            from employee
            where job = 'ANALYST');

-- 상사가 없는 사원의 이름을 출력하기
select ename
from employee
where eno in (select eno
                from employee
                where manager is null);

-- 상사가 있는 사원의 이름을 출력하기
select ename
from employee
where eno in (select eno
                from employee
                where manager is not null);

-- BLAKE와 동일한 부서에 속한 사원의 이름과 입사일 출력하기
-- BLAKE는 출력 제외
-- ename, hiredate
select ename, hiredate
from employee
where dno = (select dno
            from employee
            where ename = 'BLAKE')
and ename <> 'BLAKE';

-- 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되
-- 결과를 급여에 대해서 오름차순으로 정렬하기
select eno, ename
from employee
where salary > (select avg(salary)
                from employee)
order by salary asc;

-- 이름에 K가 포함된 사원과 같은 부서에서 일하는
-- 사원의 사원번호와 이름을 출력하기

select eno, ename
from employee
where dno in (select dno
                from employee
                where ename like '%K%');

-- 부서 위치가 DALLAS인 사원의 이름과 부서번호, 담당업무 출력하기
select ename, dno, job
from employee
where dno = (select dno
            from department
            where loc='DALLAS');

-- KING에게 보고하는 사원의 이름과 급여 출력하기
select ename, salary
from employee
where manager = (select eno
                from employee
                where ename = 'KING');


-- RESEARCH 부서의 사원에 대한 부서번호, 사원이름, 담당업무 출력하기
-- dno, ename, job
select dno, ename, job 
from employee
where dno = (select dno
            from department
            where dname ='RESEARCH');

-- 평균 급여 보다 많은 급여를 받고 이름에 M이 포함된 사원과
-- 같은 부서에서 근무하는 사원의 사원번호, 사원이름, 급여 출력하기
-- eno, ename, salary
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and dno in(select dno
            from employee
            where ename like '%M%');

-- 평균 급여가 가장 적은 업무를 출력하기
-- job, avg(salary)
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                    from employee
                    group by job);


-- 담당 업무가 MANAGER인 사원이 소속된
-- 부서와 동일한 부서의 사원이름 출력하기

select ename
from employee
where dno in (select dno
            from employee
            where job = 'MANAGER');