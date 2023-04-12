-- 사원들의 급여총액, 평균액, 최고액, 최소액 출력하기
select
    sum(salary) as 급여총액,
    avg(salary) as 급여평균,
    max(salary) as 최대급여,
    min(salary) as 최소급여
from employee;

-- 최근에 입사한 사람과 가장 오래전에 입사한 사원의 입사일 출력하기
select
    max(hiredate),
    min(hiredate)
from employee;

-- 사원들의 커미션 총액 출력하기
select sum(commission) as "커미션 총액"
from employee;

-- 전체 사원 출력하기
select *
from employee;

--전체 사원의 수 출력하기
select count(*) as "사원의 수"
from employee;

--커미션을 받은 사원의 수 출력하기
select count(commission) as "커미션 받는 사원의 수"
from employee;

select count(*) as "커미션 받는 사원의 수"
from employee
where commission is not null;

-- 직업의 개수
select job
from employee
order by job;

select count(job) as "직업의 수"
from employee;


-- 잘못된 예
select ename, max(salary)
from employee;

-- 소속 부서별 평균 급여를 부서번호와 함께 출력하기
select dno as "부서 번호" , avg(salary) as "급여 평균"
from employee
group by dno;

-- 소속 부서별 평균 급여 출력하기
select avg(salary) as " 급여 평균"
from employee
group by dno;

-- 잘못된 예
select dno, ename, avg(salary)
from employee
gruop by dno;

-- 다중 컬럼을 이용하여 그룹별로 출력하기
select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno, job;

-- 부서별 급여 총액이 3000 이상인 부서의 부서번호와 부서별 급여 총액 출력하기
select dno, max(salary)
from employee
group by dno
having max(salary)>=3000;

-- MANAGER를 제외하고 급여 총액이 5000이상인 직급별 급여 총액 출력하기
select job,count(*),sum(salary)
from employee
where job != 'MANAGER'
group by job
having sum(salary)>=5000
order by sum(salary);

-- 평균 급여 중 최고 급여 출력하기
select max(avg(salary))
from employee
group by dno;

-- 급여 최고액, 최저액, 총액, 평균 출력하기
select max(salary) as 최고액, min(salary) as 최저액,sum(salary) as 총액, round(avg(salary)) as 평균
from employee;

-- 각 담당 업무(직급)별로 급여 최고액, 최저액, 총액, 평균을 출력하기
select job, max(salary) as 최고액, min(salary) as 최저액,sum(salary) as 총액, round(avg(salary)) as 평균
from employee
group by job;


-- count(*) 함수를 이용하여 담당 업무별로 동일한 사원 수 출력하기
select job, count(*)
from employee
group by job;

-- 상사의 수를 출력하기
select count(manager)
from employee;

-- 모든 사원의 급여 최고액, 급여 최저액의 차액을 출력하기
select max(salary), min(salary), max(salary)-min(salary) as 차액
from employee;

-- 직급(업무)별 사원의 최저 급여를 출력하기
-- 관리자(상사)를 알 수 없는 사원 및 최저 급여가 2000 미만의 그룹은 제외
-- 결과를 급여에 대한 내림차순으로 정렬
select min(salary)
from employee
group by job
having not min(salary)<2000
order by min (salary) desc;

-- 각 부서에 대해 부서번호, 사원수, 부서 내 모든 사원의  평균 급여 출력하기
-- 평균 급여는 소수점 둘째 자리로 반올림하기
select 
    dno as "부서 번호",
    count(*) as "사원 수",
    round(avg(salary),2) as "평균 급여"
from employee
group by dno
order by dno;

-- 각 부서에 대해 부서명, 지역명 , 사원수, 부서내의 모든 사원의 평균 급여 출력하기
-- 평균 급여를 정수로 반올림하기
select
    decode(dno, 10, 'ACCOUNTING',
                20, 'RESEARCH',
                30, 'SALES',
                40, 'OPERATIONS') as "부서명",
    decode(dno, 10, 'NEWYORK',
                20, 'DALLAS',
                30, 'CHICAGO',
                40, 'BOSTON') as "지역명",
    count(*) as "사원수",
    round(avg(salary)) as "평균 급여"
from employee
group by dno;

--전체 사원 출력
select job, dno, salary
from employee
order by dno asc;


-- 부서별 평균 총액 출력하기
select job, dno,
    decode(dno, 10, sum(salary)) as "부서10",
    decode(dno, 20, sum(salary)) as "부서20",
    decode(dno, 30, sum(salary)) as "부서30",
    sum(salary) as "총액"
from employee
group by job, dno
order by dno;