1) emp 테이블의 사원명과 업무를 쉼표(,)로 연결해서 표시하고 컬럼명은 Employee and Job으로 표시하시오.
SELECT ename || ', ' || job "Employee and Job" FROM emp;

2) 부서번호 30(deptno)에서 근무하며 월 2,000달러 이하를 받는 81년 5월 1일 이전에 입사한 사원의 이름, 급여, 부서번호, 입사일을 출력하시오.
SELECT ename, sal, deptno, hiredate FROM emp WHERE deptno = 30 AND sal <= 2000 AND hiredate < '81-05-01';

3) emp 테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오.
SELECT ename FROM emp WHERE ename LIKE '%A%' AND ename LIKE '%E%';

4) emp 테이블에서 사원이름 중 S가 포함되지 않은 사람들 중 부서번호가 20인 사원들의 이름과 부서번호를 출력하시오.
SELECT ename, deptno FROM emp WHERE ename NOT LIKE '%S%' AND deptno = 20;

5) emp 테이블에서 관리자(mgr)가 없는 모든 사원의 이름과 업무를 표시하시오.
SELECT ename, job FROM emp WHERE mgr IS NULL;

6) emp 테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오.
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL;

7) 이름의 글자수가 6자 이상인 사원의 이름을 소문자로 이름만 출력하시오.
SELECT LOWER(ename) FROM emp WHERE LENGTH(ename) >= 6;

8) 이름의 글자수가 6자이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 출력하시오.
SELECT SUBSTR(LOWER(ename), 1, 3) FROM emp WHERE LENGTH(ename) >= 6;

9) 각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달 수)를 계산하여 열레이블을 MONTHS_WORKED로 지정하십시오. 결과는 정수로 반올림하여 표시하고 근무 달 수를 기준으로 오름차순으로 정렬하시오.
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) MONTHS_WORKED FROM emp ORDER BY MONTHS_WORKED;

10) emp 테이블에서 이름(소문자로 표시), 업무, 근무연차를 출력하시오.
SELECT LOWER(ename), job, CEIL(MONTHS_BETWEEN(SYSDATE, hiredate)/12) FROM emp;

