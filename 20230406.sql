INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMPLOYEE VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMPLOYEE VALUES
(7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMPLOYEE VALUES
(7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMPLOYEE VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;

DESC department;
DESC EMPLOYEE;
DESC SALGRADE;

-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- �����ȣ�� ����� ����ϱ�
SELECT eno, ename
FROM EMPLOYEE;

-- �޿� * 12 * Ŀ�̼� -> ���� ���
SELECT salary*12+commission
FROM EMPLOYEE;

SELECT ename, job, dno, salary, NVL(commission,0), salary*12, NVL(salary*12+commission,0)
FROM EMPLOYEE;

-- �÷��� ��Ī(alias) �����ϱ�
SELECT ename, salary*12+NVL(commission,0) ���� --��ĭ�� ���� �̸� ����
FROM EMPLOYEE;

-- �÷���� ��Ī ���̿� As �߰��ϱ�
SELECT ename, salary*12+NVL(commission,0) As ���� 
FROM EMPLOYEE;

-- ""�� ��Ī �����ϱ�
SELECT ename, salary*12+NVL(commission,0)  "�� ��" 
FROM EMPLOYEE;

-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- �ߺ��� �����͸� �ѹ����� ����ϱ�
SELECT DISTINCT dno
FROM EMPLOYEE;

-- DUAR ���̺��� ���� ���캸��
DESC dual;


-- DUMMY �÷� �� Ȯ���ϱ�
SELECT *
FROM dual;

-- ���� ��¥ ����ϱ�
SELECT SYSDATE
FROM department;

-- ���� ��¥ �ѹ��� ����ϱ�
SELECT SYSDATE
FROM dual;

-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- �޿��� 1500 �̻��� ��� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE salary >= 1500;

-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- 10�� �μ� �Ҽ� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE dno = 10;

-- �̸��� SCOTT�� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE ename = 'SCOTT';

-- �Ի����� 1981/01/01�� ����
SELECT *
FROM EMPLOYEE
WHERE hiredate <= '1981/01/01';

-- �μ���ȣ�� 10�̰� ������ MANAGER�� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE dno = 10 OR job = 'MANAGER';

-- 10�� �μ��� �Ҽӵ� ����� �����ϰ� ����� ������ ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE dno != 10;

-- �޿��� 1000���� 1500 ������ ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE salary >=1000 and salary <=1500

-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- �޿��� 1000 �̸��̰ų� 1500 �ʰ��� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE salary < 1000 or salary > 1500;

-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- 1980�⿡ �Ի��� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE hiredate >='1982/01/01' AND hiredate <= '1982/12/31';

-- �޿��� 1000���� 1500 ������ ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE salary BETWEEN 1000 AND 1500;

-- NOY BETWEEN AND ������ ����
SELECT *
FROM EMPLOYEE
WHERE salary NOT BETWEEN 1000 AND 1500;

SELECT *
FROM EMPLOYEE
WHERE salary BETWEEN 1000 and 1500;

-- 1982�⿡ �Ի��� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE hiredate BETWEEN '1982/01/01' and '1982/12/31';

-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� �˻��ϱ�
SELECT *
FROM EMPLOYEE
WHERE commission IN (300, 500, 1400);

SELECT *
FROM EMPLOYEE
WHERE commission = 300 OR commission = 500 OR commission = 1400;

-- Ŀ�̼��� 300, 500, 1400�� ��� �ƴ� ����� �˻��ϱ�
SELECT *
FROM EMPLOYEE
WHERE commission NOT IN (300, 500, 1400);

SELECT *
FROM EMPLOYEE
WHERE commission <> 300 AND commission <> 500 AND commission <> 1400;


-- ��ü ��� ����ϱ�
SELECT *
FROM EMPLOYEE;

-- f�� �����ϴ� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE ename LIKE 'F%';

-- �̸��� M�� ���Ե� ���
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '%M%';

-- �̸��� N���� ������ ���
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '%N';

-- �̸��� �� ��° ���ڰ� A�� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '_A%';

-- �̸��� �� ��° ���ڰ� A�� ����� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '__A%';

-- NOT LIKE ������ ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE ename NOT LIKE '%A%';

-- ����� Ŀ�̼��� ����ϱ�
SELECT ename, dno, commission
FROM EMPLOYEE;

-- �߸��� ��
SELECT *
FROM EMPLOYEE
WHERE commission = NULL;

-- �÷� ���� NULL���� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE ename IS NULL;

-- �÷� ���� NULL�� �ƴ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE commission IS NOT NULL;