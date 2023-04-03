CREATE TABLE department(
    dno NUMBER(2)   CONSTRAINT  PK_DEPT PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);
--���̺� ����
CREATE TABLE employee(
    eno NUMBER(4)   CONSTRAINT  PK_EMP  PRIMARY KEY,
    ename VARCHAR2(10),
    job VARCHAR2(9),
    manager NUMBER(4),
    hiredate DATE,
    salary NUMBER(7,2),
    commission NUMBER(7,2),
    dno NUMBER(2)   CONSTRAINT  FK_DNO   REFERENCES department
    --PRIMARY KEY(�⺻Ű)�� �ߺ��� �ȵȴ�
);

CREATE TABLE salgrade(
grade   NUMBER,
losal   NUMBER,
hisal   NUMBER
);
--����
COMMIT;

DESC department;
DESC employee;
DESC salgrade;
--�����ͺ��̽��� ������ �߰�
--���۾�
INSERT INTO department
VALUES(10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO department
VALUES(20, 'RESEARCH', 'DALLAS');

INSERT INTO department
VALUES(30, 'SALES', 'CHICAGO');

INSERT INTO department
VALUES(40, 'OPERATIONS', 'BOSTON');

COMMIT;
--���̺� ������ Ȯ��
SELECT *
FROM department;

SELECT *
FROM employee;

SELECT *
FROM salgrade;

INSERT INTO department
VALUES (NULL, 'a', 'b');
--NULL���� �⺻Ű�� �� �� ����