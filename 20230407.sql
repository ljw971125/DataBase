-- 오름차순으로 정렬하기 --오름차순이 기본값이다.
select *
from employee
order by salary; -- 정렬 방식 생략

-- 오름차순으로 정렬하기 --오름차순이 기본값이다.
select *
from employee
order by salary ASC;

-- 내림차순으로 정렬하기
select *
from employee
order by salary DESC;

-- 문자 데이터로 오름차순 정렬하기
select *
from employee
order by ename;

-- 문자 데이터로 오름차순 정렬하기
select *
from employee
order by ename ASC;

-- 문자 데이터로 내림차순 정렬하기
select *
from employee
order by ename DESC;

-- 문자 데이터로 내림차순 정렬하기
select *
from employee
order by job DESC;

-- 날짜 데이터로 오름차순 정렬하기
SELECT *
FROM employee
order by hiredate asc;

-- 날짜 데이터를 내림차순으로 정렬하기
SELECT *
FROM employee
ORDER BY hiredate DESC;

-- 여러 개의 컬럼에 대해서 정렬 순서를 정하기
SELECT *
FROM employee
ORDER BY salary DESC, ename ASC;