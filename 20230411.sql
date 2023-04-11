select 'Oracle mania',
    upper('Oracle mania'),
    lower('Oracle mania'),
    initcap('Oracle mania')
from dual;

-- 전체 사원 출력하기
select *
from employee;

-- 대소문자 변환 함수를 컬럼에 사용하기
select ename, lower(ename), job, initcap(job)
from employee;

-- 전체 사원 출력하기
select *
from employee;

-- scott 사원을 검색하기
select eno, ename, dno
from employee
where lower(ename) = 'scott';

-- Scott 사원을 검색하기
select eno, ename, dno
from employee
where initcap(ename) = 'Scott';

-- 영문과 한글의 길이를 구하기
select length('OracleMania'), length('오라클매니아')
from dual;

-- 영문관 한글의 바이트 수를 구하기
select length('OracleMania'), lengthb('오라클매니아')
from dual;

-- 문자 결합하기
select 'Oracle' , 'mania', concat('Oracle','mania')
from dual;

-- 문자열의 일부만 추출하기
-- SUBSTR(대상, 시작위치, 추출할 개수)
select
    substr('Oracle mania', 4, 3),
    substr('Oracle mania', -4, 3)
from dual;

-- 전체 사원 출력하기
select *
from employee;

-- 이름이 N으로 끝나는 사원 표시하기
select *
from employee
where substr(ename, -1, 1) = 'N';

-- 전체 사원 출력하기
select *
from employee;

-- 87년도에 입사한 사원을 출력하기
select *
from employee
where substr(hiredate, 1, 2) = '87';

--SUBSTRB 함수로 영문 추출하기
select
    substr('Oracle mania', 4, 3),
    substrb('Oracle mania', 4, 3)
from dual;

--SUBSTRB 함수로 한글 추출하기
select
    substr('오라클매니아', 3, 3),
    substrb('오라클매니아', 7, 9)
from dual;

-- INSTR(대상, 찾을 글자, 시작 위치, 몇 번째 발견)
-- 문자 위치 찾기
select instr('Oracle mania', 'a')
from dual;

-- 특정 위치 이후의 문자 위치 찾기
select instr('Oracle mania', 'a', 5, 2) -- 2번째 있는 a의 위치
from dual;

-- INSSTRB 함수로 위치 찾기
select
    instr('오라클매니아', '라'),
    instrb('오라클매니아', '라') -- '오' 라는 첫번째 글자가 3바이트로 인식 다음글자 4번째
from dual;

-- 전체 사원 출력하기
select *
from employee;

-- 이름이 세 번째 자리가 'R'인 사원을 출력하기
select *
from employee
where instr(ename, 'R', 3 , 1) = 3;

-- 왼쪽 자리를 특정 기호로 채우기
select lpad(salary, 10, '*')
from employee;

-- 오른쪽 자리를 특정 기호로 채우기
select Rpad(salary, 10, '*')
from employee;

-- 한쪽 공백 제거하기
select
    '   Oracle mania   ',
    ltrim('   Oracle mania   '),
    rtrim('   Oracle mania   '),
    trim('   Oracle mania   ')
from dual;

-- 특정 문자 제거하기
select
    'Oracle mania',
    trim('O' From 'Oracle mania Oracle') -- 맨 뒤나 맨 앞에 있는 문자만 지움(중간에 있는 단어는 못지움)
from dual;