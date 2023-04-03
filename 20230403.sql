CREATE TABLE department(
    dno NUMBER(2)   CONSTRAINT  PK_DEPT PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);
--테이블 생성
CREATE TABLE employee(
    eno NUMBER(4)   CONSTRAINT  PK_EMP  PRIMARY KEY,
    ename VARCHAR2(10),
    job VARCHAR2(9),
    manager NUMBER(4),
    hiredate DATE,
    salary NUMBER(7,2),
    commission NUMBER(7,2),
    dno NUMBER(2)   CONSTRAINT  FK_DNO   REFERENCES department
    --PRIMARY KEY(기본키)는 중복이 안된다
);

CREATE TABLE salgrade(
grade   NUMBER,
losal   NUMBER,
hisal   NUMBER
);
--적용
COMMIT;

DESC department;
DESC employee;
DESC salgrade;
--데이터베이스에 데이터 추가
--조작어
INSERT INTO department
VALUES(10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO department
VALUES(20, 'RESEARCH', 'DALLAS');

INSERT INTO department
VALUES(30, 'SALES', 'CHICAGO');

INSERT INTO department
VALUES(40, 'OPERATIONS', 'BOSTON');

COMMIT;
--테이블 데이터 확인
SELECT *
FROM department;

SELECT *
FROM employee;

SELECT *
FROM salgrade;

INSERT INTO department
VALUES (NULL, 'a', 'b');
--NULL값은 기본키에 들어갈 수 없다