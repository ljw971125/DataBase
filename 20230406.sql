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

-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- 사원번호와 사원명만 출력하기
SELECT eno, ename
FROM EMPLOYEE;

-- 급여 * 12 * 커미션 -> 연봉 계산
SELECT salary*12+commission
FROM EMPLOYEE;

SELECT ename, job, dno, salary, NVL(commission,0), salary*12, NVL(salary*12+commission,0)
FROM EMPLOYEE;

-- 컬럼명에 별칭(alias) 지정하기
SELECT ename, salary*12+NVL(commission,0) 연봉 --한칸을 띄우면 이름 지정
FROM EMPLOYEE;

-- 컬럼명과 별칭 사이에 As 추가하기
SELECT ename, salary*12+NVL(commission,0) As 연봉 
FROM EMPLOYEE;

-- ""로 별칭 지정하기
SELECT ename, salary*12+NVL(commission,0)  "연 봉" 
FROM EMPLOYEE;

-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- 중복된 데이터를 한번씩만 출력하기
SELECT DISTINCT dno
FROM EMPLOYEE;

-- DUAR 테이블의 구조 살펴보기
DESC dual;


-- DUMMY 컬럼 값 확인하기
SELECT *
FROM dual;

-- 오늘 날짜 출력하기
SELECT SYSDATE
FROM department;

-- 오늘 날짜 한번만 출력하기
SELECT SYSDATE
FROM dual;

-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- 급여가 1500 이상인 사원 출력하기
SELECT *
FROM EMPLOYEE
WHERE salary >= 1500;

-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- 10번 부서 소속 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE dno = 10;

-- 이름이 SCOTT인 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE ename = 'SCOTT';

-- 입사일이 1981/01/01년 이전
SELECT *
FROM EMPLOYEE
WHERE hiredate <= '1981/01/01';

-- 부서번호가 10이고 직급이 MANAGER인 사원만 출력하기
SELECT *
FROM EMPLOYEE
WHERE dno = 10 OR job = 'MANAGER';

-- 10번 부서에 소속된 사원만 제외하고 사원의 정보를 출력하기
SELECT *
FROM EMPLOYEE
WHERE dno != 10;

-- 급여가 1000에서 1500 사이인 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE salary >=1000 and salary <=1500

-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- 급여가 1000 미만이거나 1500 초과인 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE salary < 1000 or salary > 1500;

-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- 1980년에 입사한 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE hiredate >='1982/01/01' AND hiredate <= '1982/12/31';

-- 급여가 1000에서 1500 사이인 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE salary BETWEEN 1000 AND 1500;

-- NOY BETWEEN AND 연산자 연습
SELECT *
FROM EMPLOYEE
WHERE salary NOT BETWEEN 1000 AND 1500;

SELECT *
FROM EMPLOYEE
WHERE salary BETWEEN 1000 and 1500;

-- 1982년에 입사한 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE hiredate BETWEEN '1982/01/01' and '1982/12/31';

-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- 커미션이 300이거나 500이거나 1400인 사원을 검색하기
SELECT *
FROM EMPLOYEE
WHERE commission IN (300, 500, 1400);

SELECT *
FROM EMPLOYEE
WHERE commission = 300 OR commission = 500 OR commission = 1400;

-- 커미션이 300, 500, 1400이 모두 아닌 사원을 검색하기
SELECT *
FROM EMPLOYEE
WHERE commission NOT IN (300, 500, 1400);

SELECT *
FROM EMPLOYEE
WHERE commission <> 300 AND commission <> 500 AND commission <> 1400;


-- 전체 사원 출력하기
SELECT *
FROM EMPLOYEE;

-- f로 시작하는 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE ename LIKE 'F%';

-- 이름에 M이 포함된 사원
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '%M%';

-- 이름이 N으로 끝나는 사원
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '%N';

-- 이름의 두 번째 글자가 A인 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '_A%';

-- 이름의 세 번째 글자가 A인 사원을 출력하기
SELECT *
FROM EMPLOYEE
WHERE ename LIKE '__A%';

-- NOT LIKE 연산자 사용하기
SELECT *
FROM EMPLOYEE
WHERE ename NOT LIKE '%A%';

-- 사원의 커미션을 출력하기
SELECT ename, dno, commission
FROM EMPLOYEE;

-- 잘못된 예
SELECT *
FROM EMPLOYEE
WHERE commission = NULL;

-- 컬럼 값이 NULL인지 조회하기
SELECT *
FROM EMPLOYEE
WHERE ename IS NULL;

-- 컬럼 값이 NULL이 아닌지 조회하기
SELECT *
FROM EMPLOYEE
WHERE commission IS NOT NULL;