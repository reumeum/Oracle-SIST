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