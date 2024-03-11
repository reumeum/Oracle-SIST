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
