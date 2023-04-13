-- ������� �޿��Ѿ�, ��վ�, �ְ��, �ּҾ� ����ϱ�
select
    sum(salary) as �޿��Ѿ�,
    avg(salary) as �޿����,
    max(salary) as �ִ�޿�,
    min(salary) as �ּұ޿�
from employee;

-- �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �Ի��� ����ϱ�
select
    max(hiredate),
    min(hiredate)
from employee;

-- ������� Ŀ�̼� �Ѿ� ����ϱ�
select sum(commission) as "Ŀ�̼� �Ѿ�"
from employee;

-- ��ü ��� ����ϱ�
select *
from employee;

--��ü ����� �� ����ϱ�
select count(*) as "����� ��"
from employee;

--Ŀ�̼��� ���� ����� �� ����ϱ�
select count(commission) as "Ŀ�̼� �޴� ����� ��"
from employee;

select count(*) as "Ŀ�̼� �޴� ����� ��"
from employee
where commission is not null;

-- ������ ����
select job
from employee
order by job;

select count(job) as "������ ��"
from employee;


-- �߸��� ��
select ename, max(salary)
from employee;

-- �Ҽ� �μ��� ��� �޿��� �μ���ȣ�� �Բ� ����ϱ�
select dno as "�μ� ��ȣ" , avg(salary) as "�޿� ���"
from employee
group by dno;

-- �Ҽ� �μ��� ��� �޿� ����ϱ�
select avg(salary) as " �޿� ���"
from employee
group by dno;

-- �߸��� ��
select dno, ename, avg(salary)
from employee
gruop by dno;

-- ���� �÷��� �̿��Ͽ� �׷캰�� ����ϱ�
select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno, job;

-- �μ��� �޿� �Ѿ��� 3000 �̻��� �μ��� �μ���ȣ�� �μ��� �޿� �Ѿ� ����ϱ�
select dno, max(salary)
from employee
group by dno
having max(salary)>=3000;

-- MANAGER�� �����ϰ� �޿� �Ѿ��� 5000�̻��� ���޺� �޿� �Ѿ� ����ϱ�
select job,count(*),sum(salary)
from employee
where job != 'MANAGER'
group by job
having sum(salary)>=5000
order by sum(salary);

-- ��� �޿� �� �ְ� �޿� ����ϱ�
select max(avg(salary))
from employee
group by dno;

-- �޿� �ְ��, ������, �Ѿ�, ��� ����ϱ�
select max(salary) as �ְ��, min(salary) as ������,sum(salary) as �Ѿ�, round(avg(salary)) as ���
from employee;

-- �� ��� ����(����)���� �޿� �ְ��, ������, �Ѿ�, ����� ����ϱ�
select job, max(salary) as �ְ��, min(salary) as ������,sum(salary) as �Ѿ�, round(avg(salary)) as ���
from employee
group by job;


-- count(*) �Լ��� �̿��Ͽ� ��� �������� ������ ��� �� ����ϱ�
select job, count(*)
from employee
group by job;

-- ����� ���� ����ϱ�
select count(manager)
from employee;

-- ��� ����� �޿� �ְ��, �޿� �������� ������ ����ϱ�
select max(salary), min(salary), max(salary)-min(salary) as ����
from employee;

-- ����(����)�� ����� ���� �޿��� ����ϱ�
-- ������(���)�� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ����
-- ����� �޿��� ���� ������������ ����
select min(salary)
from employee
group by job
having not min(salary)<2000
order by min (salary) desc;

-- �� �μ��� ���� �μ���ȣ, �����, �μ� �� ��� �����  ��� �޿� ����ϱ�
-- ��� �޿��� �Ҽ��� ��° �ڸ��� �ݿø��ϱ�
select 
    dno as "�μ� ��ȣ",
    count(*) as "��� ��",
    round(avg(salary),2) as "��� �޿�"
from employee
group by dno
order by dno;

-- �� �μ��� ���� �μ���, ������ , �����, �μ����� ��� ����� ��� �޿� ����ϱ�
-- ��� �޿��� ������ �ݿø��ϱ�
select
    decode(dno, 10, 'ACCOUNTING',
                20, 'RESEARCH',
                30, 'SALES',
                40, 'OPERATIONS') as "�μ���",
    decode(dno, 10, 'NEWYORK',
                20, 'DALLAS',
                30, 'CHICAGO',
                40, 'BOSTON') as "������",
    count(*) as "�����",
    round(avg(salary)) as "��� �޿�"
from employee
group by dno;

--��ü ��� ���
select job, dno, salary
from employee
order by dno asc;


-- �μ��� ��� �Ѿ� ����ϱ�
select job, dno,
    decode(dno, 10, sum(salary)) as "�μ�10",
    decode(dno, 20, sum(salary)) as "�μ�20",
    decode(dno, 30, sum(salary)) as "�μ�30",
    sum(salary) as "�Ѿ�"
from employee
group by job, dno
order by dno;