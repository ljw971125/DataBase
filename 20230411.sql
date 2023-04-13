select 'Oracle mania',
    upper('Oracle mania'),
    lower('Oracle mania'),
    initcap('Oracle mania')
from dual;

-- ��ü ��� ����ϱ�
select *
from employee;

-- ��ҹ��� ��ȯ �Լ��� �÷��� ����ϱ�
select ename, lower(ename), job, initcap(job)
from employee;

-- ��ü ��� ����ϱ�
select *
from employee;

-- scott ����� �˻��ϱ�
select eno, ename, dno
from employee
where lower(ename) = 'scott';

-- Scott ����� �˻��ϱ�
select eno, ename, dno
from employee
where initcap(ename) = 'Scott';

-- ������ �ѱ��� ���̸� ���ϱ�
select length('OracleMania'), length('����Ŭ�ŴϾ�')
from dual;

-- ������ �ѱ��� ����Ʈ ���� ���ϱ�
select length('OracleMania'), lengthb('����Ŭ�ŴϾ�')
from dual;

-- ���� �����ϱ�
select 'Oracle' , 'mania', concat('Oracle','mania')
from dual;

-- ���ڿ��� �Ϻθ� �����ϱ�
-- SUBSTR(���, ������ġ, ������ ����)
select
    substr('Oracle mania', 4, 3),
    substr('Oracle mania', -4, 3)
from dual;

-- ��ü ��� ����ϱ�
select *
from employee;

-- �̸��� N���� ������ ��� ǥ���ϱ�
select *
from employee
where substr(ename, -1, 1) = 'N';

-- ��ü ��� ����ϱ�
select *
from employee;

-- 87�⵵�� �Ի��� ����� ����ϱ�
select *
from employee
where substr(hiredate, 1, 2) = '87';

--SUBSTRB �Լ��� ���� �����ϱ�
select
    substr('Oracle mania', 4, 3),
    substrb('Oracle mania', 4, 3)
from dual;

--SUBSTRB �Լ��� �ѱ� �����ϱ�
select
    substr('����Ŭ�ŴϾ�', 3, 3),
    substrb('����Ŭ�ŴϾ�', 7, 9)
from dual;

-- INSTR(���, ã�� ����, ���� ��ġ, �� ��° �߰�)
-- ���� ��ġ ã��
select instr('Oracle mania', 'a')
from dual;

-- Ư�� ��ġ ������ ���� ��ġ ã��
select instr('Oracle mania', 'a', 5, 2) -- 2��° �ִ� a�� ��ġ
from dual;

-- INSSTRB �Լ��� ��ġ ã��
select
    instr('����Ŭ�ŴϾ�', '��'),
    instrb('����Ŭ�ŴϾ�', '��') -- '��' ��� ù��° ���ڰ� 3����Ʈ�� �ν� �������� 4��°
from dual;

-- ��ü ��� ����ϱ�
select *
from employee;

-- �̸��� �� ��° �ڸ��� 'R'�� ����� ����ϱ�
select *
from employee
where instr(ename, 'R', 3 , 1) = 3;

-- ���� �ڸ��� Ư�� ��ȣ�� ä���
select lpad(salary, 10, '*')
from employee;

-- ������ �ڸ��� Ư�� ��ȣ�� ä���
select Rpad(salary, 10, '*')
from employee;

-- ���� ���� �����ϱ�
select
    '   Oracle mania   ',
    ltrim('   Oracle mania   '),
    rtrim('   Oracle mania   '),
    trim('   Oracle mania   ')
from dual;

-- Ư�� ���� �����ϱ�
select
    'Oracle mania',
    trim('O' From 'Oracle mania Oracle') -- �� �ڳ� �� �տ� �ִ� ���ڸ� ����(�߰��� �ִ� �ܾ�� ������)
from dual;