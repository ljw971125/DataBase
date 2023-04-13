-- ��ü ��� ����ϱ�
select *
from employee;

-- �����ȣ�� 7788�� ����� �̸��� �Ҽ� �μ����� ����ϱ�
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
-- �� ������� �Ҽӵ� �μ����� ����ϱ�
select *
from employee, department
where employee.dno = department.dno;

-- �����ȣ, ����̸�, �ҼӺμ� �̸� ���
select eno, ename, dname
from employee, department
where employee.dno = department.dno
and eno = 7788;

-- �߸��� ��
select eno, ename, dname, dno
from employee, department
where employee.dno = department.dno
and eno = 7788;

-- �ùٸ� ��
select eno, ename, dname, employee.dno
from employee, department
where employee.dno = department.dno
and eno = 7788;

-- ���̺� ��Ī ����ϱ�
select e.eno, e.ename, d.dname, e.dno
from employee e, department d
where e.dno = d.dno
and eno = 7788;

-- NATURAL JOIN
-- �߸��� ��
select e.eno, e.ename, d.dname, e.dno
from employee e NATURAL JOIN department d
where e.eno = 7788;

-- �ùٸ� ��
select e.eno, e.ename, d.dname, dno
from employee e NATURAL JOIN department d
where e.eno = 7788;

-- ON�� ����ϱ�
select e.eno, e.ename, d.dname, e.dno
from employee e JOIN department d
on e.dno = d.dno
where e.eno = 7788;

-- �޿� ��� ���̺� ����ϱ�
select *
from salgrade;

-- ������� �޿� ��� ����ϱ�
select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

select ename, salary, grade
from employee, salgrade
where salary >= losal and salary <= hisal;

-- 3���� ���̺� �����ϱ�
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and salary between losal and hisal;

-- WHERE ���� ����� SELF JOIN
select employees.ename as "����̸�", manager.ename as "���ӻ���̸�"
from employee employees, employee manager
where employees.manager = manager.eno;

-- JOIN - ON ���� ����� SELF JOIN
select employees.ename || '�� ���ӻ����' || manager.ename
from employee employees join employee manager
on employees.manager = manager.eno;

-- (+) ��ȣ�� ����� OUTER JOIN
-- NULL ���� �ִ��ʿ� (+) ���̱�
select employees.ename || '�� ���ӻ����' || manager.ename
from employee employees join employee manager
on employees.manager = manager.eno(+);

-- OUTER JOIN
select employees.ename || '�� ���ӻ����' || manager.ename
from employee employees left outer join employee manager
on employees.manager = manager.eno;

-- SCOTT�� ������ �μ����� �ٹ��ϴ� ��� ����ϱ�
-- 1) SCOTT�� �μ���ȣ�� �˾Ƴ��� - 20
select dno
from employee
where ename = 'SCOTT';
-- 2) �μ���ȣ�� 20�� ����� �̸�, �μ���ȣ ����ϱ�
select ename, dno
from employee
where dno = 20;

-- �������� ����ϱ�
select ename, dno
from employee
where dno = (select dno
            from employee
            where ename = 'SCOTT');

select *
from employee;

-- �ּ� �޿��� �޴� ����� �̸�, ������, �޿� ����ϱ�
-- 1) �ּ� �޿�
select min(salary)
from employee;

-- 2) ����� �̸�, ������, �޿� ����ϱ�
select ename, job, salary
from employee
where salary = (select min(salary)
                from employee);

-- 30�� �μ����� �ּ� �޿��� ���մϴ�.
-- �μ��� �ּ� �޿��� ���� �ּ� �޿����� ū �μ��� ����ϱ�
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

-- ����
select eno, ename
from employee
where salary = (select min(salary)
                 from employee
                 group by dno);
                 
-- ���� �� �������� IN ����ϱ�      
select eno, ename
from employee
where salary IN (select min(salary)
                 from employee
                 group by dno);

-- ������ SALESMAN�� �ƴϸ鼭 �޿��� SALESMAN ���� ���� ��� ����ϱ�
select salary
from employee
where job = 'SALESMAN';

select eno, ename, job, salary
from employee
where salary < all (select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';

-- �����ȣ�� 7788�� ����� ��� ������ ���� ����� ����ϱ�
-- ename, job
select job
from employee
where eno = 7788;

select ename, job
from employee
where job = (select job
            from employee
            where eno = 7788);

-- �����ȣ�� 7499�� ������� �޿��� ���� ����� ����ϱ�
-- ename, job

select job
from employee
where eno = 7499;

select ename, job
from employee
where salary >  (select salary
            from employee
            where eno = 7499);

-- �ּ� �޿��� �޴� ����� �̸�, ������, �޿� ����ϱ�
-- ename, job, salary
select min(salary)
from employee;

select ename, job, salary
from employee
where salary = (select min(salary)
               from employee);

-- ��� �޿��� ���� ���� ����� ��� ������ ã�� ���ް� ��� �޿��� ����ϱ�
-- job, salary
select job, round(avg(salary),1)
from employee
group by job
having round(avg(salary),1) = (select min(round(avg(salary),1))
                                from employee
                                group by job);


-- �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ ����ϱ�
--ename, salary, dno
select ename, salary, dno
from employee
where salary in (select min(salary)
                    from employee
                    group by dno);

-- �������� �м����� ������� �޿��� �����鼭 ������ �м����� �ƴ� ��� ����ϱ�
-- eno, ename, job, salary
select job
from employee
where job = 'ANALYST';

select eno, ename, job, salary
from employee
where  salary < ANY (select salary
            from employee
            where job = 'ANALYST');

-- ��簡 ���� ����� �̸��� ����ϱ�
select ename
from employee
where eno in (select eno
                from employee
                where manager is null);

-- ��簡 �ִ� ����� �̸��� ����ϱ�
select ename
from employee
where eno in (select eno
                from employee
                where manager is not null);

-- BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի��� ����ϱ�
-- BLAKE�� ��� ����
-- ename, hiredate
select ename, hiredate
from employee
where dno = (select dno
            from employee
            where ename = 'BLAKE')
and ename <> 'BLAKE';

-- �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ�
-- ����� �޿��� ���ؼ� ������������ �����ϱ�
select eno, ename
from employee
where salary > (select avg(salary)
                from employee)
order by salary asc;

-- �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ�
-- ����� �����ȣ�� �̸��� ����ϱ�

select eno, ename
from employee
where dno in (select dno
                from employee
                where ename like '%K%');

-- �μ� ��ġ�� DALLAS�� ����� �̸��� �μ���ȣ, ������ ����ϱ�
select ename, dno, job
from employee
where dno = (select dno
            from department
            where loc='DALLAS');

-- KING���� �����ϴ� ����� �̸��� �޿� ����ϱ�
select ename, salary
from employee
where manager = (select eno
                from employee
                where ename = 'KING');


-- RESEARCH �μ��� ����� ���� �μ���ȣ, ����̸�, ������ ����ϱ�
-- dno, ename, job
select dno, ename, job 
from employee
where dno = (select dno
            from department
            where dname ='RESEARCH');

-- ��� �޿� ���� ���� �޿��� �ް� �̸��� M�� ���Ե� �����
-- ���� �μ����� �ٹ��ϴ� ����� �����ȣ, ����̸�, �޿� ����ϱ�
-- eno, ename, salary
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and dno in(select dno
            from employee
            where ename like '%M%');

-- ��� �޿��� ���� ���� ������ ����ϱ�
-- job, avg(salary)
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                    from employee
                    group by job);


-- ��� ������ MANAGER�� ����� �Ҽӵ�
-- �μ��� ������ �μ��� ����̸� ����ϱ�

select ename
from employee
where dno in (select dno
            from employee
            where job = 'MANAGER');