-- ������������ �����ϱ� --���������� �⺻���̴�.
select *
from employee
order by salary; -- ���� ��� ����

-- ������������ �����ϱ� --���������� �⺻���̴�.
select *
from employee
order by salary ASC;

-- ������������ �����ϱ�
select *
from employee
order by salary DESC;

-- ���� �����ͷ� �������� �����ϱ�
select *
from employee
order by ename;

-- ���� �����ͷ� �������� �����ϱ�
select *
from employee
order by ename ASC;

-- ���� �����ͷ� �������� �����ϱ�
select *
from employee
order by ename DESC;

-- ���� �����ͷ� �������� �����ϱ�
select *
from employee
order by job DESC;

-- ��¥ �����ͷ� �������� �����ϱ�
SELECT *
FROM employee
order by hiredate asc;

-- ��¥ �����͸� ������������ �����ϱ�
SELECT *
FROM employee
ORDER BY hiredate DESC;

-- ���� ���� �÷��� ���ؼ� ���� ������ ���ϱ�
SELECT *
FROM employee
ORDER BY salary DESC, ename ASC;