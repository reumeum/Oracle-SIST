SELECT문 : 데이터베이스로부터 저장되어 있는 데이터를 검색하는데 사용

전체 컬럼의 데이터 읽기
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM emp;
SELECT * FROM emp;

부분 컬럼의 데이터 읽기
SELECT ename, sal FROM emp;

주석
SELECT * /*주석*/ FROM emp;

DUAL : 함수 및 계산의 결과를 볼 때 사용할 수 있는 공용(public) 테이블
       사용자 데이터가 있는 테이블에서 유래하지 않은 상수 값, 의사열(pseudo-column), 표현식 등의 값을 단 한번만 돌리거나
       현재 날짜, 시각을 알고자 할 때 이용. 즉, 일시적인 산술, 날짜 연산등에 주로 이용
       
SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT ASCII(0) FROM dual;
SELECT 7 + 10 FROM dual;

연산
SELECT ename, sal, sal+300 AS estimated_sal FROM emp;

연산자 우선순위
SELECT ename, sal, (sal+300)*12 AS annual_sal FROM emp;

NULL값의 정의: NULL은 사용할 수 없거나, 할당되지 않았거나, 알 수 없거나, 적용할 수 없는 값
              (NULL은 0이나 공백과는 다름)


SELECT empno, ename, job, comm FROM emp;

산술식의 NULL값: NULL값을 포함하는 산술식은 NULL로 계산됨
SELECT ename, (sal+comm)*12 FROM emp;

열 ALIAS: 열의 별칭
열이름 바로 뒤에 나옴. 열 이름과 ALIAS 사이에 선택 사항인 AS 키워드가 올 수도 있음

SELECT sal*12 Asal FROM emp;
SELECT sal*12 AS Asal From emp;

SELECT sal*12 "Annual Salary" From emp;

연결 연산자: 열이나 문자열을 다른 열에 연결, 두 개의 세로선(||)으로 나타냄
            결과열로 문자식을 생성
SELECT ename || ' has $' || sal FROM emp;

연결 연산자와 NULL값: 문자열에 NULL값을 결합할 경우 결과는 문자열
SELECT ename || comm FROM emp;

DISTINCT: 중복행 제거
SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT(deptno) FROM emp;

[실습문제]
1.emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오.
2.emp 테이블에서 사원이름과 월급을 출력하는데, 컬럼명은 "이 름", "월 급"으로 바꾸어 출력하시오.
3.emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬렴명은 "사원번호", "사원이름", "월급", "연봉" 으로 출력하시오.
4.emp 테이블에 업무를 중복되지 않게 표시하시오.

SELECT empno, ename, sal FROM emp;
SELECT ename "이 름", sal "월 급" FROM emp;
SELECT empno 사원번호, ename 사원이름, sal 월급, sal*12 연봉 FROM emp;
SELECT DISTINCT(job) FROM emp;

WHERE절 사용: 조건 체크 결과 행 제한하기
             (주의) 알리아스를 사용할 수 없음
SELECT * FROM emp WHERE deptno=10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE hiredate > '81-12-03';
SELECT * FROM emp WHERE hiredate < '81/12/03';
(주의) WHERE절에서는 알리아스를 사용할 수 없음
SELECT ename, sal, sal*12 ansal FROM emp WHERE sal*12 > 15000;

SELECT * FROM emp WHERE hiredate != '80/12/17';
SELECT * FROM emp WHERE hiredate <> '80/12/17';
SELECT * FROM emp WHERE hiredate ^= '80/12/17';

SELECT * FROM emp WHERE sal > 2000 AND sal <= 5000;
SELECT * FROM emp WHERE sal >= 800 AND sal <= 3000;

BETWEEN ... AND ... : 두 값 사이(지정한 값 포함)
SELECT * FROM emp WHERE sal BETWEEN 800 AND 3000; 
SELECT * FROM emp WHERE sal NOT BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT * FROM emp WHERE ename NOT BETWEEN 'KING' AND 'SMITH';

IN: 값 목록 중의 값과 일치
SELECT * FROM emp WHERE sal IN (1300, 2450, 3000);
SELECT * FROM emp WHERE sal NOT IN (1300, 2450, 3000);
SELECT ename, mgr, deptno FROM emp WHERE ename IN ('ALLEN', 'FORD');
SELECT ename, mgr, deptno FROM emp WHERE ename NOT IN ('ALLEN', 'FORT');

[실습]
1.emp 테이블에서 사원번호가 7698인 사원의 이름, 업무, 급여를 출력하시오.
2.emp 테이블에서 사원이름이 SMITH인 사람의 이름, 월급, 부서번호를 구하시오.
3.월급이 2500 이상 3500 미만인 사원의 이름, 입사일, 월급을 구하시오.
4.급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오.

SELECT ename, job, sal FROM emp WHERE empno = 7698;
SELECT ename, sal, deptno FROM emp WHERE ename = 'SMITH';
SELECT ename, hiredate, sal FROM emp WHERE sal >= 2500 AND sal < 3500;
SELECT ename, job, sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

LIKE: 패턴과 일치하는 데이터를 검색
%는 0개 이상의 문자를 나타냄
_는 한 문자를 나타냄

S가 처음, 중간, 끝에 오는 이름을 검색
SELECT * FROM emp WHERE ename LIKE '%S%';
SELECT * FROM emp WHERE ename NOT LIKE '%S%';

입사일이 22로 끝나는 사원 정보 구하기
SELECT ename, hiredate FROM emp WHERE hiredate LIKE '%22';
SELECT ename, hiredate FROM emp WHERE hiredate NOT LIKE '%22';

FOR 다음에 꼭 한 글자
SELECT * FROM emp WHERE ename LIKE 'FOR_';

한 글자 다음의 M, M 다음에 없거나 여러개
SELECT * FROM emp WHERE ename LIKE '_M%';

NULL 조건 사용
SELECT * FROM emp WHERE comm IS NULL; -- com = null은 불가
SELECT * FROM emp WHERE comm IS NOT NULL;

논리 연산자 (AND, OR, NOT)를 사용하여 조건 정의
SELECT empno, ename, job, sal FROM emp WHERE sal >= 2000 AND job LIKE '%MAN%';

SELECT empno, ename, job, sal FROM emp WHERE sal >= 2000 OR job LIKE '%MAN%';

SELECT ename, job FROM emp WHERE job NOT IN ('CLERK', 'SALESMAN');

[실습문제]
1.81년05월01과 81년12월03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력하시오.
2.사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호, 이름, 월급을 출력하시오.
3.급여가 $2,000와 $5,000 사이이고 부서번호가 10 또는 30인 사원의 이름과 급여, 부서번호를 출력하시오.
4.업무가 SALESMAN 또는 MANAGER 이면서 급여가 $1,600, $2,975, $2,850이 아닌 모든 사원의 이름, 업무, 급여를 표시하시오.

SELECT ename, sal, hiredate FROM emp WHERE hiredate BETWEEN '81-05-01' AND '81-12-03';
SELECT empno, ename, sal FROM emp WHERE empno NOT IN (7566, 7782, 7934);
SELECT ename, sal, deptno FROM emp WHERE (sal BETWEEN 2000 AND 5000) AND deptno IN (10, 30);
SELECT ename, job, sal FROM emp WHERE (job IN ('SALESMAN', 'MANAGER')) AND (sal NOT IN (1600, 2975, 2850));

오름차순 정렬
SELECT * FROM emp ORDER BY sal;
SELECT * FROM emp ORDER BY sal 
ASC;

내림차순 정렬
SELECT * FROM emp ORDER BY sal DESC;

1차 정렬에서 중복값이 있을 경우 2차 정렬 수행
SELECT * FROM emp ORDER BY sal DESC, ename DESC;

날짜 정렬
SELECT ename, job, deptno, hiredate FROM emp ORDER BY hiredate DESC;

열 ALIAS 기준으로 정렬
SELECT empno, ename, sal*12 annsal FROM emp ORDER BY annsal;

열의 숫자 위치를 사용하여 정렬
SELECT ename, job, deptno, hiredate FROM emp ORDER BY 3;

테이블에 생성된 순서대로 열 숫자 위치 부여
SELECT * FROM emp ORDER BY 2;

SELECT * FROM emp ORDER BY comm;

NULL값을 갖고 있는 컬럼을 정렬할 때
NULLS FIRST 또는 NULLS LAST 키워드를 사용하여 반환된 행 중 NULL값을 포함하는 행이
정렬 순서상 맨 처음에 나타나거나 마지막에 나타나도록 지정

SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm NULLS LAST;

SELECT * FROM emp ORDER BY comm NULLS LAST, ename DESC;

SELECT * FROM emp ORDER BY comm DESC NULLS FIRST;

[실습문제]
1.사원번호, 사원이름, 입사일을 출력하는데 입사일이 빠른 사람순으로 정렬하시오.
2.사원이름,급여,연봉을 구하고 연봉이 많은 순으로 정렬하시오.
3.10번 또는 20번 부서에서 근무하고 있는 사원의 이름과 부서번호를 출력하는데 이름을 영문자순으로 표시하시오.
4.커미션 계약을 맺은 모든 사원의 이름, 급여, 커미션을 출력하는데 커미션을 기준으로 내림차순 정렬하시오.

SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;
SELECT ename, sal, sal*12 annsal FROM emp ORDER BY annsal DESC;
SELECT ename, deptno FROM emp WHERE deptno IN (10, 20) ORDER BY ename;
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;

함수
문자함수
대소문자 조작함수 - LOWER, UPPER, INITCAP
SELECT LOWER('HELLO') from dual;
SELECT LOWER(ename) FROM emp;
SELECT UPPER('hello') FROM dual;
SELECT INITCAP('hello wORLD') FROM dual;

문자 조작함수
CONCAT(문자열1, 문자열2) : 문자열1과 문자열2를 연결하여 하나의 문자열로 반환
SELECT CONCAT('hello','world') FROM dual;
SELECT CONCAT(ename, job) FROM emp;

SUBSTR(대상문자열, 인덱스): 대상문자열에서 지정한 인덱스부터 문자열을 추출
[주의] 인덱스 1부터 시작
SELECT SUBSTR('Hello World', 3) FROM dual;
SELECT SUBSTR('Hello World', 3, 3) FROM dual; --인덱스 3부터 문자 3개 추출
SELECT SUBSTR('Hello World', -3) FROM dual;
SELECT SUBSTR('Hello World', -3, 2) FROM dual;

LENGTH(대상문자열): 문자열의 길이
SELECT LENGTH('Hello World') FROM dual;
SELECT ename, LENGTH(ename) FROM emp;

INSTR(대상문자열, 검색문자): 검색문자의 위치값검색
SELECT INSTR('Hello World', 'e') FROM dual;
검색문자가 없을 경우 0 반환
SELECT INSTR('Hello World', 'E') FROM dual;
SELECT INSTR('Hello World', 'o') FROM dual;
             대상문자열, 검색문자, 검색인덱스[해당위치부터 검색]
SELECT INSTR('Hello World', 'o', 6) FROM dual;
             대상문자열, 검색문자, 검색인덱스, 반복횟수[대상문자열 전체를 여러번 검색한다는 의미가 아니라 1번 검색으로 o를 찾으면 지정한 횟수만큼 그 뒤의 문자를 검색한다는 의미]
SELECT INSTR('Hello World', 'o', 1, 2) FROM dual;

LPAD(대상문자열, 총길이, 문자): 지정한 길이의 문자열을 출력하는데 공백은 왼쪽에 지정한 문자로 채움
SELECT LPAD('Hello',10,'*') FROM dual;

RPAD(대상문자열, 총길이, 문자): 지정한 길이의 문자열을 출력하는데 공백은 오른쪽에 지정한 문자로 채움
SELECT RPAD('Hello',10,'*') FROM dual;

TRIM: 문자열에서 공백이나 특정 문자를 제거한 다음 값을 반환
방향: 왼쪽 -> LEADING, 오른쪽 -> TRAILING, 양쪽 -> BOTH (default)
SELECT TRIM(LEADING 'h' FROM 'habchh') FROM dual;

LTRIM: 문자열의 왼쪽에서 공백이나 특정 문자를 제거한 다음 값을 반환
RTRIM: 문자열의 오른쪽에서 공백이나 특정 문자를 제거한 다음 값을 반환

REPLACE(대상문자열, OLD, NEW): 대상문자열에서 OLD문자를 NEW문자로 대체
SELECT REPLACE('010.1234.5678', '.', '-') FROM dual;

함수 중첩
SELECT ename, LOWER(SUBSTR(ename, 1, 3)) FROM emp;

[실습 문제]
1.업무(job)을 첫글자는 대문자 나머지는 소문자로 출력하시오.
2.사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력하시오.
3.이름의 세번째 문자가 A인 모든 사원의 이름을 표시하시오.
4.이름이  J,A 또는 M으로 시작하는 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및
  이름의 길이를 표시하시오. (열 레이블은 name, length)
  
SELECT INITCAP(job) FROM emp;
SELECT SUBSTR(ename, 1, 3) FROM emp WHERE ename LIKE '%A%';
SELECT ename FROM emp WHERE ename LIKE '__A%';
SELECT INITCAP(ename) name, LENGTH(ename) length FROM emp WHERE ename LIKE 'J%' OR ename LIKE 'A%' OR ename LIKE 'M%';

SELECT INITCAP(ename) name, LENGTH(ename) length FROM emp WHERE SUBSTR(ename, 1,1) IN ('J', 'A', 'M')

숫자함수
CEIL(실수): 올림 처리한 정수값을 반환
SELECT CEIL(1.4) FROM dual;

FLOOR(실수): 버림 처리한 정수값을 반환
SELECT FLOOR(1.4) FROM dual;

ROUND(대상숫자, 지정자릿수): 반올림
SELECT ROUND(45.926, 2) FROM dual; --45.39
SELECT ROUND(45.926) FROM dual; --46
SELECT ROUND(45.926, -1) FROM dual; --50

SELECT empno, ename, sal, ROUND(sal*1.15) "New Salary", ROUND(sal*0.15) "Increase" FROM emp;
SELECT empno, ename, sal, ROUND(sal*1.15, 2) "New Salary", ROUND(sal*0.15, 2) "Increase" FROM emp;

TRUNC(대상숫자, 지정자릿수): 절삭
SELECT TRUNC(45.926, 2) FROM dual; --45.92
SELECT TRUNC(45.926) FROM dual; --45

MOD(대상숫자, 나눌 숫자): 나머지 값
SELECT MOD(17,2) FROM dual; --1

날짜함수
날짜에 산술 연산자 사용
SELECT ename, (SYSDATE - hiredate)/7 AS weeks FROM emp WHERE deptno = 10;

MONTHS_BETWEEN(날짜1, 날짜2): 두 날짜 간의 월 수
SELECT MONTHS_BETWEEN('2012-03-23', '2010-01-23') FROM dual;

SELECT ename, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) months_worked FROM emp ORDER BY months_worked;

ADD_MONTHS: 특정 날짜의 월에 정수를 더한 다음 해당 날짜를 반환하는 함수
SELECT ADD_Months('2022, 01, 01', 8) FROM dual;

NEXT_DAY: 지정된 요일의 다음 날짜
SELECT NEXT_DAY('2024.03.12','월요일') FROM dual;
1(일요일) ~ 7(토요일)
SELECT NEXT_DAY('2024-03-12', 2) FROM dual;

LAST_DAY: 월의 마지막 날
SELECT LAST_DAY('2012-12-07') FROM dual;

EXTRACT: 날짜 정보에서 특정한 연도, 월, 일, 시간, 분, 초 등을 추출
SELECT EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(DAY FROM SYSDATE) FROM dual;
       
[실습문제]
1.모든 사원의 이름과 급여를 표시하시오. 급여는 15자 길이로 왼쪽에 $기호가 채워진 형식으로 표기하고
  열 레이블은 SALARY로 지정하시오.
2.모든 사원의 이름, 업무, 급여, 부서번호를 출력하시오. (부서번호 오름차순 정렬, 사원의 이름은 10자길이 BOOOO****)
3.오늘부터 이번 달의 마지막 날까지의 남은 날 수를 구하시오.
4.각 사원에 대해 사원번호, 이름, 급여 및 15% 인상된 급여를 정수(반올림)로 표시하시오.
  인상된 급여열의 레이블은 New Salary로 지정하시오.

SELECT ename, LPAD(sal, 15, '$') SALARY FROM emp;
SELECT RPAD(ename, 10, '*'), job, sal, deptno FROM emp ORDER BY deptno, sal;
SELECT LAST_DAY(SYSDATE) - SYSDATE FROM dual;
SELECT empno, ename, sal, ROUND(sal*1.15) "New Salary" FROM emp;

TO_CHAR: 숫자 -> 문자, 날짜 -> 문자
TO_NUMBER: 문자 -> 숫자
TO_DATE: 문자 -> 날짜

TO_CHAR: 숫자 -> 문자, 날짜 -> 문자
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM dual; --12시 표기법
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM dual; --24시 표기법

실제 자리수와 일치
SELECT TO_CHAR(1234, 9999) FROM dual;
SELECT TO_CHAR(1234, '9999') FROM dual;
SELECT TO_CHAR(1234, '0000') FROM dual;

자릿수가 모자람 -> ####
SELECT TO_CHAR(1234, 999) FROM dual;
SELECT TO_CHAR(1234, '999') FROM dual;
SELECT TO_CHAR(1234, '000') FROM dual;

실제 자릿수보다 많은 자릿수 지정
SELECT TO_CHAR(1234, 99999) FROM dual;
SELECT TO_CHAR(1234, '99999') FROM dual;
SELECT TO_CHAR(1234, '00000') FROM dual;

소수점 자리 지정
SELECT TO_CHAR(1234, 9999.99) FROM dual;
SELECT TO_CHAR(1234, '9999.99') FROM dual;
SELECT TO_CHAR(1234, '0000.00') FROM dual;

반올림해서 소수점 둘째자리까지 표시
SELECT TO_CHAR(25.897, 99.99) FROM dual;

인상된 급여를 소수점 첫째자리까지 표시
SELECT TO_CHAR(sal*1.15, '9,999.9') FROM emp;

통화 표시
SELECT TO_CHAR(1234, '$0000') FROM dual;
지역 통화 표시
SELECT TO_CHAR(1234, 'L0000') FROM dual;

TO_DATE: 문자 -> 날짜
SELECT TO_DATE('24-03-12', 'YYYY-MM-DD') FROM dual;

포맷형식 생략 가능
SELECT TO_DATE('24-03-12') FROM dual;

TO_NUMBER: 문자 -> 숫자
SELECT TO_NUMBER('100', 999) FROM dual;

포맷형식 생략 가능
SELECT TO_NUMBER('100') FROM dual;

NVL(value1, value2): value1이 NULL이면 value2를 쓴다. value1과 value2의 자료형이 일치해야 함.
SELECT ename, sal, comm, (sal + comm)*12 FROM emp;
SELECT ename, sal, NVL(comm, 0), (sal + NVL(comm, 0))*12 FROM emp;
SELECT ename, NVL(TO_CHAR(comm),'No Comission') FROM emp;

NVL2(value1, value2, value3): value1이 null인지 평가.
                              null이면 value3, null이 아니면 value2 사용.
                              자료형이 일치하지 않아도 됨.
                              
SELECT NVL2(comm, 'commission', 'no commission') FROM emp;

NULLIF(value1, value2): 두 개의 값이 일치하면 NULL, 두 개의 값이 일치하지 않으면 value1 사용.
SELECT NULLIF(LENGTH(ename), LENGTH(job)) "NULLIF" FROM emp;

COALESCE(value1, value2, value3...): NULL이 아닌 값을 사용(자료형 일치해야 함)
SELECT comm, sal, COALESCE(comm, sal, 0)FROM emp;
SELECT comm, mgr, sal, COALESCE(comm, mgr, sal) FROM emp;

CASE 컬럼 WHEN 비교값 THEN 결과값
         WHEN       THEN
         (ELSE 결과값)
END

SELECT ename, sal, job,
       CASE job WHEN 'SALESMAN' THEN sal*0.1
                WHEN 'MANAGER' THEN sal*0.2
                WHEN 'ANALYST' THEN sal*0.3
                ELSE sal*0.4
        END "Bonus"
FROM emp;

SELECT ename, sal, job,
       CASE WHEN sal>=4000 AND sal<=5000 THEN 'A'
            WHEN sal>=3000 AND sal<4000 THEN 'B'
            WHEN sal>=2000 AND sal<3000 THEN 'C'
            WHEN sal>=1000 AND sal<2000 THEN 'D'
            ELSE 'F'
       END "Grade"
FROM emp;

DECODE: 이퀄 비교만 가능, 오라클 전용
        DECODE(컬럼, 비교값, 반환값,
                    비교값, 반환값,
                    반환값)
                    
SELECT ename, sal, job,
       DECODE(job, 'SALESMAN', sal*0.1,
                   'MANAGER', sal*0.2,
                   'ANALYST' , sal*0.3,
                   sal*0.4) "Bonus"
FROM emp;

SELECT ename, sal, job,
       DECODE(TRUNC(sal/1000), 5, 'A',
                               4, 'A',
                               3, 'B',
                               2, 'C',
                               1, 'D',
                               'F') "Grade"
FROM emp;

[실습문제]
1.사원이름, 월급, 월급과 커미션을 더한 값을 컬럼명 실급여 라고 해서 출력하시오.
  단, NULL값은 나타나지 않게 작성하시오.
2.월급과 커미션을 합친 금액이 2,000 이상인 급여를 받는 사원의 이름, 업무, 월급, 커미션, 고용날짜를 출력하시오.
  단, 고용날짜는 1980-12-17 형태로 출력하시오.

SELECT ename, sal, sal+NVL(comm, 0) "실급여" FROM emp;
SELECT ename, job, sal, comm, TO_CHAR(hiredate, 'YYYY-MM-DD') hiredate FROM emp WHERE sal+NVL(comm, 0) >= 2000;

그룹함수: 행 집합 연산을 수행하여 그룹별로 하나의 결과를 산출

AVG(): NULL을 제외한 모든 값들의 평균을 반환, NULL값은 평균 계산에서 무시됨
SELECT ROUND(AVG(sal)) FROM emp;

COUNT(): NULL을 제외한 값을 가진 모든 레코드의 수를 반환.
         COUNT(*)의 형식을 사용하면 NULL도 계산에 포함
SELECT COUNT(empno) FROM emp;
SELECT COUNT(comm) FROM emp;
SELECT COUNT(*) FROM emp;

MAX(): 레코드 내에 있는 여러 값 중 가장 큰 값을 반환
SELECT MAX(sal) FROM emp;
SELECT MAX(ename) FROM emp;
SELECT MAX(hiredate) FROM emp;

MIN(): 레코드 내에 있는 여러 값 중 가장 작은 값을 반환
SELECT MIN(sal) FROM emp;
SELECT MIN(ename) FROM emp;
SELECT MIN(hiredate) FROM emp;

SUM(): 레코드들이 포함하고 있는 모든 값을 더하여 반환
SELECT SUM(sal) FROM emp;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp WHERE deptno=10;

SELECT COUNT(*) FROM emp WHERE deptno=20;

SELECT MAX(sal) FROM emp WHERE deptno=30;

GROUP BY: SELECT절에 집합함수 적용시 개별 컬럼을 지정할 수 없음.
          개별 컬럼을 지정할 경우에는 반드시 GROUP BY 절에 지정된 컬럼만 가능.
          
SELECT * FROM emp ORDER BY deptno;
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno;

부서별로 사원수 구하기
SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno ORDER BY deptno;

다중 열에서 GROUP BY 절 사용하기
SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job ORDER BY deptno;

그룹함수를 사용한 잘못된 Query
[오류 발생]
SELECT deptno, AVG(sal) FROM emp WHERE AVG(sal) >= 2000 GROUP BY deptno;
--WHERE절에 그룹함수를 이용해서 조건을 체크하면 오류 발생

[정상 구문]
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal) >= 2000;

부서별로 최대급여를 구하는데 3000을 초과한 최대급여 구하기
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno HAVING MAX(sal) > 3000;

그룹 함수 중첩
SELECT MAX(AVG(sal)) FROM emp GROUP BY deptno;

분기별로 입사한 사원의 수
SELECT TO_CHAR(hiredate, 'Q') quarter, COUNT(empno) FROM emp
GROUP BY TO_CHAR(hiredate, 'Q')
ORDER BY quarter;

[실습문제]
1.모든 사원의 급여 최고액, 최저액, 총액 및 평균액을 표시하시오.
  열 레이블을 각각 maximum, minimun, sum 및 average로 지정하고 결과를 정수로 반올림하고 세자리 단위로 ,를 명시하시오.
2.급여와 커미션을 더한 금액의 최고, 최저, 평균금액을 구하시오.
  평균 금액은 소수점 첫째자리까지 표시하시오.
3.업무와 업무가 동일한 사원 수를 표시하시오. (업무별 사원 수를 구하시오.)
4.30번 부서의 사원수를 구하시오.
5.업무별 최고 월급을 구하고 업무, 최고 월급을 출력하시오.
6.20번 부서의 급여 합계를 구하고 급여 합계 금액을 출력하시오.
7.부서별로 지급되는 총월급에서 금액이 9,000 이상을 받는 사원들의 부서번호, 총월급을 출력하시오.
8.업무별로 사번이 제일 늦은 사람을 구하고 그 결과 내에서 사번이 79로 시작하는 결과만 보여주시오.
  
1~3
SELECT TO_CHAR(MAX(sal), '9,999') maximum, TO_CHAR(MIN(sal), '999') minimum, TO_CHAR(SUM(sal), '99,999') sum, TO_CHAR(AVG(sal), '9,999') average FROM emp;
SELECT MAX(sal+NVL(comm, 0)) maximum, MIN(sal+NVL(comm, 0)) minimum, ROUND(AVG(sal+NVL(comm, 0)), 1) average FROM emp;
SELECT job, COUNT(empno) FROM emp GROUP BY job;

4
SELECT COUNT(*) FROM emp WHERE deptno=30;
SELECT deptno, COUNT(*) FROM emp WHERE deptno=30 GROUP BY deptno;
SELECT deptno, COUNT(*) FROM emp GROUP BY deptno HAVING deptno=30 ;

5~7
SELECT job, MAX(sal) FROM emp GROUP BY job;
SELECT SUM(sal) FROM emp WHERE deptno=20;
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal) >= 9000;

8
SELECT job, MAX(empno) FROM emp GROUP BY job HAVING MAX(empno) LIKE '79%';
SELECT job, MAX(empno) FROM emp WHERE empno LIKE '79%' GROUP BY job;

9.업무별 총월급을 출력하는데 업무가 'MANAGER'인 사원들은 제외하고 총월급이 5,000보다 많은 업무와 총월급만 출력하시오.
10.업무별로 사원의 수가 4명 이상인 업무와 인원수를 출력하시오.

SELECT job, SUM(sal) FROM emp WHERE job <> 'MANAGER' GROUP BY job HAVING SUM(sal) > 5000;
SELECT job, SUM(sal) FROM emp GROUP BY job HAVING job!='MANAGER' AND SUM(sal) > 5000;

SELECT job, COUNT(*) FROM emp GROUP BY job HAVING COUNT(*) >= 4;

분석함수
RANK(): 순위를 표현할 때 사용하는 함수
RANK(조건값) WITHIN GROUP (ORDER BY 조건값 컬럼명): 특정 데이터의 순위 확인하기
(주의) RANK 뒤에 나오는 데이터와 ORDER BY 뒤에 나오는 데이터는 같은 컬럼이어야 함

SELECT RANK('SMITH') WITHIN GROUP (ORDER BY ename DESC) "RANK" FROM emp;

SELECT * FROM emp ORDER BY ename;

RANK() OVER(ORDER BY 컬럼명): 전체순위 보기
사원들의 empno, ename, sal, 급여 순위를 출력
SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) FROM emp;

10번 부서에 속한 직원들의 사번과 이름, 급여, 해당 부서 내의 급여 순위를 출력
SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) "RANK" FROM emp WHERE deptno=10;

emp테이블을 조회하여 사번, 이름, 급여, 부서번호, 부서별 급여 순위를 출력
SELECT empno, ename, sal, deptno, RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) "RANK" FROM emp;

emp 테이블에서 같은 부서 내의 job별로 급여 순위, empno, ename, sal, deptno, job를 출력
SELECT empno, ename, sal, deptno, job, RANK() OVER(PARTITION BY deptno, job ORDER BY sal DESC) "RANK" FROM emp;


JOIN: 둘 이상의 테이블을 연결하여 데이터를 검색하는 방법
      보통 둘 이상의 행들의 공통된 값 PRIMARY KEY 및 FPREIGN KEY 값을 사용하여 조인
      두 개의 테이블을 SELECT 문장 안에서 조인하려면 적어도 하나의 컬럼이 그 두 테이블 사이에서 공유되어야 함
      
Cartesian Product(카티션 곱): 검색하고자 했던 데이터 뿐 아니라 조인에 사용된 테이블들의 모든 데이터가 반환되는 현상
SELECT * FROM emp, dept;

[Oracle 전용]
동등 조인(Equi JOIN): 조건절에 =(이퀄) 조건에 의하여 조언이 이루어짐
SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno;

SELECT emp.ename, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;

테이블에 알리아스 부여하기
SELECT e.ename, d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;

컬럼명을 호출할 때 테이블명 또는 테이블 알리아스를 생략
SELECT ename, dname, d.deptno FROM emp e, dept d WHERE e.deptno = d.deptno;

추가적인 조건 명시하기
ALLEN이 근무하는 부서의 이름과 사원 이름을 같이 출력하시오.
SELECT e.ename, d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND e.ename='ALLEN';

3000이상 4000이하의 급여를 받는 사원의 이름과 급여, 부서명을 출력하시오.
SELECT ename, sal, dname dept FROM emp e, dept d WHERE e.deptno = d.deptno AND sal BETWEEN 3000 AND 4000;


비동등 조인(Non Equi Join): 테이블이 어떤 column도 Join할 테이블의 column과 일치하지 않을 때 사용하고
                          조인 조건은 동등(=) 이외의 연산자를 가짐
                          (between and, is null, in)
                          
사원이름, 급여, 급여등급 구하기(emp, salgrade 테이블 이용)
SELECT e.ename, e.sal, s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

SELF JOIN: 동일한 테이블 조인
사원 이름과 해당 사원의 관리자 이름 구하기(관리자가 없는 사원 제외)

SELECT e.ename 사원이름, m.ename 관리자이름 FROM emp e, emp m WHERE e.mgr = m.empno;

외부 조인(Outer Join): 동등 조인에서 누락된 행의 정보를 보여주는 조인.
                      Equi Join 문장들의 한가지 제약점은 조인을 생성하려 하는 두 개의 테이블의 두 개 컬럼에서 공통된 값이 없다면
                      테이블로부터 데이터를 반환하지 않는다는 것.
                      정상적으로 조인 조건을 만족하지 못하는 행들을 보기 위해 Outer Join을 사용.
                      
누락된 행을 표시하기 위해서 누락된 행이 있는 테이블의 반대 테이블의 조인 조건에 (+) 명시
SELECT DISTINCT(e.deptno), d.deptno FROM emp e, dept d WHERE e.deptno(+)=d.deptno;

SELECT e.ename 사원이름, m.ename 관리자이름 FROM emp e, emp m WHERE e.mgr=m.empno(+);

[실습문제]
1.모든 사원의 이름, 부서번호, 부서이름을 표시하시오.(emp, dept)
2.업무가 MANAGER인 사원의 정보를 이름, 업무, 부서명, 근무지 순으로 출력하시오.(emp, dept)
3.커미션을 받고 급여가 1,600이상인사원의 사원이름, 급여, 부서명, 근무지를 출력하시오.

SELECT e.ename, d.deptno, d.dname FROM emp e, dept d WHERE e.deptno=d.deptno;
SELECT e.ename, e.job, d.dname, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.job='MANAGER';
SELECT e.ename, e.sal, d.dname, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.comm IS NOT NULL AND e.sal >= 1600;

4.근무지가 CHICAGO인 모든 사원의 이름, 업무, 부서번호 및 부서이름을 표시하시오.
5.근무지별로 근무하는 사원의 수가 5명 이하인 경우, 인원이 적은 도시 순으로 정렬하시오.
 (근무 인원이 0명인 곳도 표시)
6.사원의 이름 및 사원 번호를 관리자의 이름과 관리자 번호와 함께 표시하고 각각의 열 레이블은
 employee, emp#, manager, mgr#로 지정하시오. (관리자가 없는 사원 미출력)
7.관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 표시하고
 열 레이블을 각각 employee emp hired, manager, mgr hired로 지정하시오.
 (관리자가 없는 사원 미출력)
 
 SELECT e.ename, e.job, d.deptno, d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND d.loc = 'CHICAGO';
 SELECT d.loc, COUNT(e.empno) members FROM emp e, dept d WHERE e.deptno(+)=d.deptno GROUP BY d.loc HAVING COUNT(d.loc) < 5 ORDER BY members;
 SELECT e.ename employee, e.empno "emp#", m.ename manager, e.mgr "mgr#" FROM emp e, emp m WHERE e.mgr=m.empno;
 SELECT e.ename employee, e.hiredate "emp hired", m.ename manager, m.hiredate "mgr hired" FROM emp e, emp m WHERE e.mgr=m.empno AND e.hiredate < m.hiredate;
  
[표준 SQL]
내부 조인(Inner Join)
SELECT emp.ename, dept.deptno FROM emp INNER JOIN dept ON emp.deptno=dept.deptno;

SELECT emp.ename, dept.deptno FROM emp JOIN dept ON emp.deptno=dept.deptno;

SELECT e.ename, d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno;

두 개 테이블의 공통 컬럼은 알리아스를 생략할 수 없음
SELECT ename, dname, d.deptno FROM emp e JOIN dept d ON e.deptno=d.deptno;

ON절은 JOIN 조건을 명시하고 WHERE에 부가 조건을 명시
SELECT e.ename, d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.ename = 'ALLEN';

만약 JOIN 조건에 사용된 컬럼의 이름이 같다면 USING절을 사용하여 조인 조건을 정의할 수 있음
(주의)USING(컬럼명) 절에 명시한 컬럼명을 호출할 때는 테이블명 또는 알리아스를 명시해서 호출 불가

SELECT e.ename, d.deptno FROM emp e JOIN dept d USING(deptno);
SELECT e.ename, deptno, d.dname FROM emp e JOIN dept d USING(deptno);

SELECT ename, deptno, dname FROM emp JOIN dept USING(deptno);

SELECT e.ename, deptno FROM emp e JOIN dept d USING(deptno) WHERE e.ename='ALLEN';

SELF JOIN
사원 이름과 해당 사원의 관리자 이름 구하기(관리자가 없는 사원은 제외)
SELECT e.ename name, m.ename manager_name FROM emp e JOIN emp m ON e.mgr=m.empno;

외부 조인(OUTER JOIN)
누락된 행의 방향 표시
SELECT DISTINCT(e.deptno), d.deptno FROM emp e RIGHT OUTER JOIN dept d ON e.deptno=d.deptno;

사원이름과 해당 사원의 관리자 이름 구하기(관리자 없는 사원도 표시)
SELECT e.ename name, m.ename manager_name FROM emp e LEFT OUTER JOIN emp m ON e.mgr=m.empno;

[실습문제]
1.모든 사원의 이름, 부서번호, 부서이름, 근무지를 표시하시오. (emp, dept)
2.업무가 SALESMAN인 사원의 정보를 이름, 업무, 부서명, 근무지 순으로 출력하시오. (emp, dept)
3.커미션이 책정된 사원들의 사원번호, 이름, 연봉, 급여+커미션, 급여등급을 출력하는데
  각각의 컬럼명을 "사원번호", "이름", "연봉", "실급여", "급여등급"으로 출력하시오.
  단, 커미션이 null인 것은 제외하고 출력(emp, salgrade, 실급여로 급여등급 구하기)

SELECT e.ename, d.deptno, d.dname, d.loc FROM emp e JOIN dept d ON e.deptno=d.deptno;
SELECT e.ename, e.job, d.dname, d.loc FROM emp e JOIN dept d USING(deptno) WHERE e.job='SALESMAN';

SELECT e.empno 사원번호, e.ename 이름, e.sal*12 연봉, e.sal+e.comm 실급여, s.grade 급여등급
FROM emp e JOIN salgrade s ON e.sal+e.comm BETWEEN s.losal AND s.hisal;

4.10번 부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하시오. (emp, dept, salgrade)

[오라클 전용]
SELECT e.ename, d.deptno, d.dname, e.sal, s.grade
FROM dept d, emp e, salgrade s WHERE d.deptno=e.deptno AND e.sal BETWEEN s.losal AND s.hisal AND e.deptno=10;

[표준 SQL]
SELECT e.ename, d.deptno, d.dname, e.sal, s.grade 
FROM emp e JOIN dept d ON e.deptno=d.deptno JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal WHERE e.deptno=10;


집합연산자

UNION: 합집합 중복값 제거
       UNION은 두 테이블의 결합을 나타내며 결합시키는 두 테이블의 중복되지 않은 값들을 반환
SELECT deptno FROM emp
UNION
SELECT deptno FROM dept;

UNION ALL: UNION과 같으나 두 테이블의 중복되는 값까지 반환
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept;

INTERSECT: 두 행의 집합 중 공통된 행을 반환
SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

MINUS: 첫번째 SELECT문에 의해 반환되는 행 중에서
       두번째 SELECT문에 의해 반환되는 행의 존재하지 않는 행들을 보여줌
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;


SUBQUERY: 다른 하나의 SQL문장의 절에 NESTED된 SELECT문장
SELECT job FROM emp WHERE empno=7369;
SELECT empno, ename, job FROM emp WHERE job='CLERK'
-> 위의 두개의 문장을 서브쿼리를 사용해서 작성
SELECT empno, ename, job FROM emp WHERE job = (SELECT job FROM emp WHERE empno=7369);

7698의 급여보다 많은 급여를 받는 사원들의 사원번호, 사원이름, 급여를 출력하시오.
SELECT empno, ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE empno=7698); 

다중행 서브쿼리: 하나 이상의 행을 반환하는 서브쿼리

IN 연산자의 사용
부서별로 가장 급여를 적게 받는 사원과 동일한 급여를 받는 사원의 정보를 출력하시오
SELECT MIN(sal) FROM emp GROUP BY deptno;
SELECT * FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

ANY 연산자의 사용
ANY 연산자는 서브쿼리의 결과값 중 어느 하나의 값이라도 만족이 되면 결과값을 반환

SELECT sal FROM emp WHERE job = 'SALESMAN';
SELECT ename, sal FROM emp WHERE sal>1250 OR sal>1500 OR sal>1600;
->위 문장을 서브쿼리로 작성
SELECT ename, sal FROM emp WHERE sal > ANY(SELECT sal FROM emp WHERE job = 'SALESMAN');

ALL 연산자의 사용
서브쿼리의 결과와 모든 값이 일치
SELECT sal FROM emp WHERE deptno=20;
SELECT empno, ename, sal, deptno FROM emp WHERE sal>800 AND sal>2975 AND sal>3000;
->위 문장을 서브쿼리로 작성
SELECT empno, ename, sal, deptno FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE deptno=20);

다중열 서브쿼리
서브 쿼리의 결과가 두 개 이상의 컬럼으로 반환되어 메인 쿼리에 전달하는 쿼리

SELECT empno, ename, sal, deptno FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE deptno=30);

--이렇게 하면 안될까?
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT sal FROM emp WHERE deptno=30);

부서별로 가장 급여를 적게 받는 사원의 정보를 출력
부서별로 가장 급여를 적게 받는 사원과 동일한 급여를 받는 사원 정보를 출력

SELECT empno, ename, sal, deptno FROM emp WHERE (deptno, sal) IN (SELECT deptno, MIN(sal) FROM emp GROUP BY deptno);
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

--이렇게 하면 안될까?
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

인라인뷰: 메인 쿼리의 FROM절을 서브 쿼리로 이용하는 방법

급여가 20번 부서의 평균 급여보다 많은 급여를 받는 사원의 사원번호, 이름, 부서명 출력

SELECT empno, ename, deptno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno=20);

SELECT e.empno, e.ename, d.dname FROM (
        SELECT empno, ename, deptno FROM emp 
        WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno=20)) e JOIN dept d ON e.deptno=d.deptno;

SELECT e.empno, e.ename, d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno=20);

부서별로 총급여를 출력하는데 부서번호, 부서명, 총급여를 출력하시오.
SELECT deptno, dname, total 
FROM dept JOIN (SELECT deptno, SUM(sal) total FROM emp GROUP BY deptno) USING(deptno);

스칼라 서브쿼리
스칼라값은 단일 값을 의미함
결과값이 단일 행, 단일 열의 스칼라값으로 반환됨
만약 결과값이 다중행이거나 다중열이라면 DBMS는 그 중 어떠한 행, 어떠한 열을 출력해야 하는지 알 수 없어 에러를 출력
SELECT deptno, (SELECT dname FROM dept WHERE deptno=e.deptno), SUM(sal) FROM emp e GROUP BY deptno;

[실습문제]
1."BLAKE"와 같은 부서에 있는 사원들의 이름과 입사일을 구하는데 "BLAKE"는 제외하고 출력하시오.
SELECT ename, hiredate, deptno FROM emp  WHERE deptno IN(SELECT deptno FROM emp WHERE ename = 'BLAKE') AND ename != 'BLAKE';

2.평균급여보다 많은 급여를 받은 사원들의 사원번호, 이름, 월급을 출력하는데 월급이 높은 사람 순으로 출력하시오.
SELECT empno, ename, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp) ORDER BY sal DESC;

3.10번 부서에서 급여를 가장 적게 받는 사원과 동일한 급여를 받는 사원의 이름과 월급을 출력하시오.
SELECT ename, sal, deptno FROM emp WHERE sal = (SELECT MIN(sal) FROM emp WHERE deptno=10);


4.(부서별 사원수를 구하고) 사원수가 3명 이하의 부서의 부서명과 사원수를 출력하시오.
[MY ANSWER]
SELECT d.dname, COUNT(e.empno) members 
FROM dept d LEFT OUTER JOIN emp e ON d.deptno=e.deptno 
GROUP BY d.dname 
HAVING COUNT(e.empno) <= 3;
[인라인뷰]
SELECT a.dname, b.cnt 
    FROM dept a, (SELECT deptno, COUNT(empno) cnt FROM emp GROUP BY deptno) b 
    WHERE a.deptno=b.deptno AND b.cnt <= 3;
[조인]
SELECT d.dname, COUNT(e.empno) cnt 
FROM emp e, dept d WHERE e.deptno=d.deptno 
GROUP BY d.dname 
HAVING COUNT(e.empno) <= 3;

5.사원번호가 7844인 사원보다 빨리 입사한 사원의 이름과 입사일을 출력하시오.
[MY ANSWER]
SELECT ename, hiredate FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE empno=7844);

6.직속상사(mgr)가 KING인 모든 사원의 이름과 급여를 출력하시오.
[MY ANSWER]
SELECT e.ename, e.sal FROM emp e, emp m WHERE e.mgr=m.empno AND m.ename='KING';
[IN CLASS]
SELECT ename, sal FROM emp WHERE mgr IN(SELECT empno FROM emp WHERE ename='KING');

7.20번 부서에서 가장 급여를 많이 받는 사원과 동일한 급여를 받는 사원의 이름과 부서명, 급여, 급여등급을 출력하시오.
[MY ANSWER]--오라클 전용
SELECT e.ename, d.dname, e.sal, s.grade 
FROM emp e, dept d, salgrade s 
WHERE e.sal BETWEEN s.losal AND s.hisal AND e.deptno=d.deptno
AND e.sal = (SELECT MAX(sal) FROM emp GROUP BY deptno WHERE deptno=20);
[표준SQL]
SELECT e.ename, d.dname, e.sal, s.grade
FROM emp e JOIN dept d
ON e.deptno=d.deptno
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.sal=(SELECT MAX(sal) FROM emp WHERE deptno=20);


8.총급여(sal+comm)가 평균 급여보다 많은 급여를 받는 사람의 부서번호, 이름, 총급여, 커미션을 출력하시오.
  (커미션은 유(O), 무(X)로 표시하고 컬럼명은 "comm유무"로 출력)
[MY ANSWER] --정답
SELECT deptno, ename, sal, sal+NVL(comm,0) 총급여, NVL2(comm, 'X', 'O') comm유무 
FROM emp 
WHERE sal+NVL(comm,0) > (SELECT AVG(sal+NVL(comm,0)) FROM emp);
[IN CLASS1]
SELECT deptno, ename, sal, sal+NVL(comm,0) 총급여,
       CASE WHEN comm IS NOT NULL THEN 'O'
       ELSE 'X'
       END comm유무
FROM emp
WHERE sal+NVL(comm, 0) > (SELECT AVG(sal) FROM emp); --급여에서 평균을 구하는 것, 총급여에서 평균을 구하는 것 둘다 가능
[IN CLASS2]
SELECT deptno, ename, sal, sal+NVL(comm,0) 총급여,
       NVL2(comm, 'O', 'X') comm유무
FROM emp
WHERE sal+NVL(comm, 0) > (SELECT AVG(sal) FROM emp);
  
9.CHICAGO 지역에서 근무하는 사원의 평균 급여보다 높은 급여를 받는 사원의 이름과 급여, 지역명을 출력하시오.
[MY ANSWER] --오답
SELECT e.ename, e.sal, d.loc 
FROM emp e, dept d WHERE e.deptno=d.deptno 
AND e.sal > (SELECT AVG(sal) 
             FROM emp 
             WHERE d.loc='CHICAGO');
[IN CLASS1] --조인 방식
SELECT e.ename, e.sal, d.loc 
FROM emp e, dept d WHERE e.deptno=d.deptno
AND e.sal > (SELECT AVG(e.sal) 
             FROM emp e, dept d 
             WHERE e.deptno=d.deptno AND d.loc='CHICAGO');
[IN CLASS2] --서브쿼리 방식
SELECT e.ename, e.sal, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno
AND e.sal > (SELECT AVG(sal) 
             FROM emp 
             WHERE deptno IN(SELECT deptno 
                             FROM dept 
                             WHERE loc='CHICAGO'));
--CHICAGO는 유니크한 값이 아니기 때문에 IN 연산자 사용

10.커미션이 없는 사원들 중 월급이 가장 높은 사원의 이름과 급여등급을 출력하시오.
[MY ANSWER] --쓸데없이 돌아감
SELECT e.ename, s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal
AND e.empno = (SELECT empno FROM emp WHERE sal = (SELECT MAX(sal) FROM emp WHERE comm IS NULL));
[IN CLASS]
SELECT e.ename, s.grade 
FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal
AND e.sal = (SELECT MAX(sal) 
             FROM emp 
             WHERE comm IS NULL);
--근데 여기서 만약 커미션이 있는 사원중 월급이 5000인 사람이 있었다면 잘못 되는거 아닌가?

11.SMITH의 직속상사(mgr)의 이름과 부서명, 근무지역을 출력하시오.
[MY ANSWER] --오답
SELECT e.ename, d.dname, d.loc FROM emp e, dept d, emp m 
WHERE e.deptno=d.deptno 
AND e.mgr = m.empno
AND e.empno = (SELECT mgr FROM emp WHERE ename='SMITH');
[IN CLASS]
SELECT e.ename, d.dname, d.loc
FROM emp e JOIN dept d
USING(deptno)
WHERE e.empno IN(SELECT mgr FROM emp WHERE ename='SMITH'); --SMITH는 프라이머리키가 아니기 때문에 IN 연산자 사용

12.ALLEN보다 급여를 많이 받는 사람 중에서 입사일이 가장 빠른 사원과 동일한 날짜에 입사한 사원의 이름과 입사일, 급여를 출력하시오.
[MY ANSWER] --쓸데없이 돌아감
SELECT ename, hiredate, sal FROM emp
WHERE hiredate = (SELECT MIN(hiredate) 
                  FROM (SELECT ename, hiredate, sal 
                        FROM emp 
                        WHERE sal > (SELECT sal 
                                     FROM emp 
                                     WHERE ename='ALLEN')));
[IN CLASS]
SELECT ename, hiredate, sal 
FROM emp WHERE hiredate = (SELECT MIN(hiredate) 
                           FROM emp 
                           WHERE sal > ALL(SELECT sal 
                                           FROM emp 
                                           WHERE ename='ALLEN'));
--ALLEN은 프라이머리키가 아니기 때문에 다중행을 사용해야함
--모든 ALLEN의 급여보다 높아야하기 때문에 ALL 연산자 사용




INSERT문: 테이블에 행을 삽입

전체 데이터 삽입(전체 컬럼 명시시)
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8000, 'DENNIS', 'SALESMAN', 7698, '99/01/22',1700, 200, 30);

전체 데이터 삽입할 때는 컬럼명 생략 가능
INSERT INTO emp 
VALUES (8001, 'SUNNY', 'SALESMAN', 7698, '99/03/01', 1000, 300, 30);

NULL 삽입 방법
값이 입력되지 않는 컬럼은 제외
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, deptno)
VALUES (8003, 'PETER', 'CLERK', 7698, '22/11/06', 1700, 20);

값이 입력되지 않는 컬럼을 제외하지 않았을 경우
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8004, 'ANNIE', 'CLERK', 7698, '22/11/06', 1800, NULL, 30);

날짜의 삽입
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8005, 'MICHAEL', 'CLERK', 7698, TO_date('22/11/06', 'YY/MM/DD'), 1800, NULL, 30


UPDATE문: 행 단위로 데이터 갱신
UPDATE emp SET mgr=7900 WHERE empno=8000;
UPDATE emp SET ename='MARIA', sal=2500, comm=500 WHERE empno=8000;

WHERE절을 명시하지 않으면 전체 행의 데이터를 수정
UPDATE emp SET ename='KINGKONG';);

ROLLBACK;

DELETE문: 행을 삭제
DELETE FROM emp WHERE empno=7369;

WHERE절을 명시하지 않으면 모든 행이 삭제
DELETE FROM emp;

ROLLBACK;

데이터베이스 트랜잭션
트랜잭션은 데이터 처리의 한 단위
오라클 서버에서 발생하는 SQL문들은 하나의 논리적인 작업 단위이며, 
성공하거나 실패하는 일련의 SQL문을 트랜잭션이라고 할 수 있음
트랜잭션은 데이터를 일관되게 변경하는 DML 문장으로 구성됨

데이터베이스 객체

테이블: 기본 저장 단위로 행과 열로 구성
테이블은 기본적인 데이터 저장 단위
레코드와 컬럼으로 구성
레코드(record/row): 테이블의 데이터는 행에 저장
컬럼(column): 테이블의 각 컬럼은 데이터를 구별할 수 있는 속성을 표현
 
이름 지정 규칙
-문자로 시작해야 함
-1~30자까지 가능
-A~Z,a~z,0~9,_,$,#만 포함해야 함
-동일한 사용자(계정)가 소유한 다른 객체의 이름과 중복되지 않아야 함
-오라클 서버의 예약어가 아니어야 함

사용자가 소유한 테이블의 이름
SELECT table_name FROM user_tables;

사용자가 소유한 개별 객체 유형
SELECT DISTINCT(object_type) FROM user_objects;

사용자가 소유한 테이블, 뷰, 동의어 및 시퀀스
SELECT * FROM user_catalog;

테이블의 생성
CREATE TABLE employee(
    empno NUMBER(6),
    name VARCHAR2(30) NOT NULL, --30바이트(글자수 아님) 
                                --오라클xe에서는 한글을 3바이트로 처리해서 한글 10자 저장 가능
    salary NUMBER(8,2),
    hire_date DATE DEFAULT SYSDATE,
    CONSTRAINT employee_pk PRIMARY KEY(empno) --employee_pk: 오라클에서 사용하는 식별자
);

INSERT INTO employee (empno,name,salary)
VALUES (100, '홍길동', 1000.23);
COMMIT;

SELECT * FROM employee;

테이블 생성시 PRIMARY KEY 및 FOREIGN KEY 제약 조건 추가하기
CREATE TABLE suser (
    id VARCHAR2(20),
    name VARCHAR2(30),
    CONSTRAINT suser_pk PRIMARY KEY (id)
);

CREATE TABLE sboard(
    num NUMBER, --길이를 주지 않으면 최대치로 설정됨
    id VARCHAR2(20) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    CONSTRAINT sboard_pk PRIMARY KEY (num),
    CONSTRAINT sboard_fk FOREIGN KEY (id) REFERENCES suser (id) --부모테이블(suser)로부터 id 참조
);

INSERT INTO suser(id,name) VALUES ('dragon', '홍길동');
INSERT INTO suser(id,name) VALUES ('sky', '박문수');

INSERT INTO sboard(num, id, content) VALUES (1, 'sky', '오늘은 금요일');
INSERT INTO sboard(num, id, content) VALUES (2, 'dragon', '내일은 토요일');

두 개의 테이블 조인
SELECT * FROM suser JOIN sboard USING(id);

COMMIT;

테이블의 관리(DDL문)
ADD 연산자: 테이블에 새로운 컬럼을 추가
ALTER TABLE employee ADD (addr VARCHAR(2));

제약조건 추가
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY (empno);

MODIFY 연산자: 테이블의 컬럼을 수정하거나 NOT NULL 컬럼으로 변경할 수 있음
ALTER TABLE employee MODIFY salary NUMBER(10, 2) NOT NULL;

컬럼명 변경
ALTER TABLE employee RENAME COLUMN salary TO sal;

테이블명 변경
RENAME employee TO employee2;

테이블의 삭제
DROP TABLE employee2;

ON DELETE CASCADE
부모 테이블의 컬럼을 삭제하면 자식 테이블의 자식 데이터를 모두 삭제

CREATE TABLE s_member(
    id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(30)
);

CREATE TABLE s_member_detail(
    num NUMBER PRIMARY KEY,
    content VARCHAR2(4000) NOT NULL,
    id VARCHAR2(20) NOT NULL REFERENCES s_member (id) ON DELETE CASCADE
);

INSERT INTO s_member (id, name) VALUES ('dragon', '홍길동');
INSERT INTO s_member (id, name) VALUES ('sky', '박문수');

INSERT INTO s_member_detail (num, content, id) VALUES (1, '오늘은 금요일', 'sky');
INSERT INTO s_member_detail (num, content, id) VALUES (2, '내일은 토요일', 'sky');
INSERT INTO s_member_detail (num, content, id) VALUES (3, '모레는 일요일', 'sky');


DELETE FROM s_member WHERE id='sky';

COMMIT;

[실습문제]
1.student라는 이름으로 테이블 생성
컬럼명         id           name          age         score
데이터타입 VARCHAR2(10)  VARCHAR2(30)   NUMBER(3)    NUMBER(3)
제약 조건 PRIMARY KEY     NOT NULL      NOT NULL     NOT NULL

2. 데이터를 아래와 같이 입력하시오.
id          name       age      score
dragon     홍길동       21        100
sky        장영실       22        99
blue       박문수       34        88

3. 데이터 읽기
student 테이블에서 성적 합계를 구하시오.

1.
CREATE TABLE student(
    id VARCHAR2(10) PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    age NUMBER(3) NOT NULL,
    score NUMBER(3) NOT NULL
);

2.
INSERT INTO student VALUES ('dragon', '홍길동', 21, 100);
INSERT INTO student VALUES ('sky', '장영실', 22, 99);
INSERT INTO student VALUES ('blue', '박문수', 34, 88);
COMMIT;

3.
SELECT SUM(score) FROM student;

뷰(VIEW)
논리적으로 하나 이상의 테이블에 있는 데이터의 부분 집합
-데이터 엑세스를 제한하기 위해
-복잡한 질의를 쉽게 작성하기 위해
-데이터 독립성을 제공하기 위해
-동일한 데이터로부터 다양한 결과를 얻기 위해
*뷰는 가상으로 만들어진 컬럼(Virtual Column)을 제외하면 수정이 가능하고 삭제도 가능하다.
수정, 삭제하면 원래 테이블에 반영
삽입은 여러 제약 조건과 virtual column 사용으로 제약이 많음

VIEW 생성

CREATE OR REPLACE VIEW emp10_view
AS SELECT empno id_number, ename name, sal*12 ann_salary 
   FROM emp WHERE deptno=10;
   
SELECT * FROM emp10_view;

CREATE OR REPLACE VIEW emp_info_view
AS SELECT e.empno, e.ename, e.deptno, d.loc, d.dname 
   FROM emp e, dept d WHERE e.deptno=d.deptno;

SELECT * FROM emp_info_view;

view를 통한 데이터 변경하기
일반적으로 view는 조회용으로 많이 사용되지만 아래와 같이 데이터를 변경할 수 있음

UPDATE emp10_view SET name='SCOTT' WHERE id_number=7839;

가상 열 때문에 등록 제한, 가상 열을 제외하면 삽입 가능
INSERT INTO emp10_view(id_number, name, ann_salary) VALUES(8000, 'JOHN', 19000);

SELECT * FROM emp10_view;

WITH READ ONLY: 읽기 전용 뷰를 생성하는 옵션

CREATE OR REPLACE VIEW emp20_view
AS SELECT empno id_number, ename name, sal*12 ann_salary
   FROM emp WHERE deptno=20
WITH READ ONLY;

SELECT * FROM emp20_view;
UPDATE emp20_view SET name='SCOTT' WHERE id_number=7839;

VIEW의 수정
CREATE OR REPLACE VIEW emp10_view (id_number, name, sal, department_id)
AS SELECT empno, ename, sal, deptno
   FROM emp
   WHERE deptno=10;
   
SELECT * FROM emp10_view;

VIEW의 삭제
DROP VIEW emp10_view;

시퀀스 생성
CREATE SEQUENCE test_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;
시작 값이 1이고 1씩 증가하고 최대값이 100000이 되는 시퀀스 생성

CURRVAL: 현재 값을 반환
NEXTVAL: 현재 시퀀스 값의 다음 값 반환

SELECT test_seq.CURRVAL FROM dual;
SELECT test_seq.NEXTVAL FROM dual;

sboard 테이블에 데이터를 삽입할 때 시퀀스 활용
INSERT INTO sboard(num, id, content) VALUES (test_seq.NEXTVAL, 'sky', '여기서는 강남');

SELECT * FROM sboard;

시퀀스 수정
START WITH는 수정할 수 없음

ALTER SEQUENCE test_seq 
INCREMENT BY 5;
INSERT INTO sboard(num, id, content) VALUES (test_seq.NEXTVAL, 'sky', '여기서는 강남');
SELECT * FROM sboard;

시퀀스 삭제
DROP SEQUENCE test_seq;