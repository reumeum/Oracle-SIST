PL/SQL : Procedural Language extension to Structured Query Language(SQL)의 약자
         SQL을 확장한 순차적 처리 언어
         
PL/SQL의 기본 구조
PL/SQL의 기본 단위는 블록(block)
1)선언부(Declarative Part): 사용할 변수나 상수를 선언
                           (선언부에만 변수와 상수 선언 가능)
2)실행부(Executable Part): 실제 처리할 로직을 담당하는 부분
3)예외처리부(Exception-building Part): 실행부에서 로직을 처리하던 중 발생할 수 있는 각종 오류들 처리

실행부만 명시한 형태
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

변수 사용
DECLARE
--변수를 선언할 수 있는 선언부
     message VARCHAR2(100);
BEGIN
--실행부에 사용할 변수는 선언부에서 미리 선언되어야 함
    message := 'Hello World!!!';
    DBMS_OUTPUT.PUT_LINE(message);
END;

변수 선언과 초기화를 동시에
DECLARE
    message VARCHAR2(100) := 'Hell o world?';
BEGIN
    DBMS_OUTPUT.PUT_LINE(message);
END;

DECLARE
--변수 선언 후 초기화를 하지 않으면 NULL
    counter INTEGER;
BEGIN
    counter := counter + 1;
    IF counter IS NULL THEN 
        DBMS_OUTPUT.PUT_LINE('result: counter is null');
    END IF;
    DBMS_OUTPUT.PUT_LINE(counter);
END;

DECLARE
    --변수 선언
    counter INTEGER;
    i INTEGER;
BEGIN
    FOR i IN 1..9 LOOP
        counter := 2 * i;
        DBMS_OUTPUT.PUT_LINE('2 * ' || i || ' = ' || counter);
    END LOOP;
END;

예외처리부
EXCEPTION WHEN 예외1 THEN 예외처리1
          WHEN 예외2 THEN 예외처리2
          WHEN OTHERS THEN 예외처리
          
DECLARE
    --변수 선언
    counter INTEGER;
BEGIN
    --변수 초기화
    counter := 10;
    counter := counter/0;
    DBMS_OUTPUT.PUT_LINE(counter);
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('errors');
END;

변수와 상수
emp_num1 NUMBER(9);
grade CHAR(2);
emp_num2 INTETER := 1;

상수
nYear CONSTANT INTEGER:=30; --(O)
nYear CONSTANT INTEGER; --(X)

%TYPE : 참조할 테이블에 있는 컬럼의 데이터 타입을 자동으로 가져옴
nSal emp.sal%TYPE;

%ROWTYPE : %TYPE은 하나의 값에 대해 적용되지만, %ROWTYPE은 하나 이상의 값에 적용됨
           로우타입 변수를 선언해서 테이블에 있는 로우(행)를 대입

콜렉션
VARRAY
VARRAY는 VARIABLE ARRAY의 약자로 고정 길이(Fixed Number)를 가진 배열 

DECLARE
    TYPE VARRAY_TEST IS VARRAY(3) OF INTEGER;
    varray1 VARRAY_TEST; --위에서 선언한 VARRAY_TEST 타입을 사용하는 변수
BEGIN
    varray1 := VARRAY_TEST(10, 20, 30);
    
    DBMS_OUTPUT.PUT_LINE(varray1(1)); --인덱스는 1번부터 시작
    DBMS_OUTPUT.PUT_LINE(varray1(2));
    DBMS_OUTPUT.PUT_LINE(varray1(3));
END;

중첩테이블: VARRAY와 흡사하지만 중첩 테이블은 선언 시에 전체 크기를 명시할 필요가 없음
DECLARE
    TYPE NESTED_TEST IS TABLE OF VARCHAR2(10);
    nested1 NESTED_TEST;
BEGIN
    nested1 := NESTED_TEST('A','B','C','D');
    
    DBMS_OUTPUT.PUT_LINE(nested1(1));
    DBMS_OUTPUT.PUT_LINE(nested1(2));
    DBMS_OUTPUT.PUT_LINE(nested1(3));
    DBMS_OUTPUT.PUT_LINE(nested1(4));
END;

ASSOCIATIVE ARRAY (Index-by Table): 연관배열
키와 값의 쌍으로 구성된 콜렉션
하나의 키는 하나의 값과 연관
DECLARE
    TYPE ASSOC_ARRAY_NUM_TYPE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    --NUMBER는 value의 타입, PLS_INTEGER는 key의 타입
    assoc1 ASSOC_ARRAY_NUM_TYPE;
BEGIN
    --키와 값 저장
    --키는 3, 값은 33
    assoc1(3) := 33; 
    
    DBMS_OUTPUT.PUT_LINE(assoc1(3));
END;


레코드 : 테이블의 컬럼들이 서로 다른 유형의 데이터 타입으로 구성되듯이
        레코드 역시 해당 필드(레코드에서는 요소란 말 대신 필드란 용어를 사용함)들이 각기
        다른 데이터 타입을 가질 수 있음
        
DECLARE
    --TYPE으로 선언한 레코드
    TYPE RECORD1 IS RECORD(deptno NUMBER NOT NULL := 50,
                           dname VARCHAR2(14),
                           loc VARCHAR2(13));
    --위에 선언한 RECORD1을 받은 변수 선언
    rec1 RECORD1;
BEGIN
    --RECORD1 타입의 rec1의 dname 필드에 값 할당
     rec1.dname := 'RECORD';
     rec1.loc := 'SEOUL';
     
     --rec1 레코드 값을 dept 테이블에 insert
    INSERT INTO dept VALUES rec1;
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
END;

IF문

DECLARE
    grade CHAR(1);
BEGIN
    --변수의 초기화
    grade := 'B';
    
    IF grade = 'A' THEN
        DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF grade = 'B' THEN
        DBMS_OUTPUT.PUT_LINE('Good');
    ELSIF grade = 'C' THEN
        DBMS_OUTPUT.PUT_LINE('Fair');
    ELSIF grade = 'D' THEN
        DBMS_OUTPUT.PUT_LINE('Poor');
    END IF;
END;


CASE문

DECLARE
    grade CHAR(1);
BEGIN
    grade := 'C';
    
    CASE grade 
    WHEN 'A' THEN
        DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN 'B' THEN
        DBMS_OUTPUT.PUT_LINE('Good');
    WHEN 'C' THEN
        DBMS_OUTPUT.PUT_LINE('Fair');
    WHEN 'D' THEN
        DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Found');
    END CASE;
END;

LOOP문

DECLARE
    --변수 선언
    test_number INTEGER;
    result_number INTEGER;
BEGIN
    test_number := 1;
    
    LOOP
        result_number := 2 * test_number; 
        IF result_number > 20 THEN
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE(result_number);
        END IF;
        test_number := test_number + 1;
    END LOOP;
    --loop 블럭을 빠져나오면 아래 코드를 실행함
    DBMS_OUTPUT.PUT_LINE('프로그램 끝');
END;

DECLARE
    test_number INTEGER;
    result_num INTEGER;
BEGIN
    test_number := 1;
    LOOP 
        result_num := 2 * test_number;
        
        EXIT WHEN result_num > 20;
        
        DBMS_OUTPUT.PUT_LINE(result_num);
        test_number := test_number + 1;
    END LOOP;
END;


WHILE-LOOP문

DECLARE
    test_number INTEGER;
    result_num INTEGER;
BEGIN
    test_number := 1;
    result_num := 0;
    
    WHILE result_num < 20 LOOP --여기서 result_num 값을 사용해야 하기 때문에 미리 초기화
        result_num := test_number * 2;
        DBMS_OUTPUT.PUT_LINE(result_num);
        test_number := test_number + 1;
    END LOOP;
END;

FOR-LOOP문

DECLARE
    test_number INTEGER;
    result_num INTEGER;
BEGIN
    FOR test_number IN 1..10 LOOP
        result_num := test_number * 2;
        DBMS_OUTPUT.PUT_LINE(result_num);
    END LOOP;
END;

DECLARE
    test_number INTEGER;
    result_num INTEGER;
BEGIN
    FOR test_number IN REVERSE 1..10 LOOP
        result_num := test_number * 2;
        DBMS_OUTPUT.PUT_LINE(result_num);
    END LOOP;
END;

CURSOR(커서): 쿼리에 의해 반환되는 결과는 메모리 상에 위치하게 되는데
              PL/SQL에서는 바로 커서(CURSOR)를 사용하여 이 결과집합에 접근할 수 있음
              
DECLARE
        --커서 선언: 커서에 이름을 주고, 이 커서가 접근하려는 쿼리를 정의 
        CURSOR emp_crs IS
        SELECT empno
        FROM emp
        WHERE deptno=10;
        
        emp_no emp.empno%TYPE;
BEGIN
    --커서 열기: 커서로 정의된 쿼리를 실행하는 역할
    OPEN emp_crs;
    LOOP
        FETCH emp_crs INTO emp_no;
        --%NOTFOUND 커서에서만 사용 가능한 속성. 더 이상 패치(할당)할 로우가 없음을 의미
        EXIT WHEN emp_crs%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(emp_no);
    END LOOP;
    
    --커서 닫기: 패치 작업이 끝나면 사용된 커서를 닫는다
    CLOSE emp_crs;
END;

PL/SQL 서브프로그램

함수

입력받은 값으로부터 10%의 세율을 얻는 함수
CREATE OR REPLACE FUNCTION tax(p_value IN NUMBER) --IN은 생략 가능
    RETURN NUMBER IS
BEGIN
    RETURN p_value * 0.1;
END;

SELECT TAX(100) FROM dual;
SELECT empno, ename, sal, TAX(sal) tax FROM emp;

급여와 커미션을 합쳐서 세금 계산
CREATE OR REPLACE FUNCTION tax2(p_sal IN emp.sal%TYPE, p_comm emp.comm%TYPE)
    RETURN NUMBER IS
BEGIN
    RETURN (p_sal+NVL(p_comm, 0)) * 0.1;
END;

SELECT empno, ename, sal+NVL(comm, 0) 실급여, TAX2(sal, comm) tax FROM emp;

급여(커미션 포함)에 대한 세율을 다음과 같이 정의함.
급여가 월 $1000보다 적으면 세율을 5%, $1000이상 $2000이하면 10%, $2000초과하면 20% 적용.
CREATE OR REPLACE FUNCTION tax3(p_sal IN emp.sal%TYPE, p_comm IN emp.comm%TYPE)
    RETURN NUMBER IS
    l_tax NUMBER;
    l_sum NUMBER := p_sal + NVL(p_comm, 0);
BEGIN   
    IF l_sum < 1000 THEN
        l_tax := l_sum * 0.05;
    ELSIF l_sum BETWEEN 1000 AND 2000 THEN
        l_tax := l_sum * 0.1;
    ELSE
        l_tax := l_sum * 0.2;
    END IF;
    RETURN l_tax;
END;

SELECT empno, ename, sal+NVL(comm, 0) 실급여, tax3(sal, comm) tax FROM emp;

사원번호를 통해서 급여를 알려주는 함수
CREATE OR REPLACE FUNCTION getsal(emp_no IN emp.empno%TYPE)
    RETURN NUMBER IS
    --변수 선언
    nSalaries NUMBER(9);
BEGIN
    SELECT sal 
    --결과행이 단일행일 경우 커서를 사용하지 않고 INTO를 사용해 읽어온 값을 변수에 담을 수 있음
    INTO nSalaries 
    FROM emp 
    WHERE empno = emp_no; 
    RETURN nSalaries;
END;

SELECT GETSAL(7839) FROM dual;

부서번호를 전달하면 부서명을 구할 수 있는 함수
CREATE OR REPLACE FUNCTION get_dept_name(dept_no NUMBER)
    RETURN VARCHAR2 IS
    sDeptName VARCHAR(30);
BEGIN
    SELECT dname
    INTO sDeptName
    FROM dept
    WHERE deptno = dept_no;
    RETURN sDeptName;
END;

SELECT GET_DEPT_NAME(10) FROM dual;
SELECT deptno, GET_DEPT_NAME(deptno) "Department Name" FROM dept;
SELECT empno, ename, sal, GET_DEPT_NAME(deptno) "Department Name" FROM emp;

[실습문제]
1.두 숫자를 제공하면 덧셈을 해서 결과값을 반환하는 함수를 정의하시오.(add_num)
CREATE OR REPLACE FUNCTION add_num(num1 NUMBER, num2 NUMBER)
    RETURN NUMBER IS
BEGIN
    RETURN num1 + num2;
END;

2.부서번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 정의하시오.(get_emp_count)
CREATE OR REPLACE FUNCTION get_emp_count(dept_no IN emp.deptno%TYPE)
    RETURN NUMBER IS
    l_count NUMBER(4);
BEGIN
    SELECT COUNT(empno)
    INTO l_count
    FROM emp
    WHERE deptno = dept_no;
    RETURN l_count;
END;


SELECT ADD_NUM(10,17) FROM dual;
SELECT ADD_NUM(10.9, 2.1) FROM dual;

SELECT GET_EMP_COUNT(10) FROM dual;
SELECT deptno, dname, GET_EMP_COUNT(deptno) 사원수 FROM dept;

3.emp테이블의 입사일을 입력하면 근무연차를 구하는 함수를 정의하시오. (소수점 절삭, get_info_hiredate)

[MY ANSWER] --왜 커서를 썼고, 왜 안 써도 되지?
CREATE OR REPLACE FUNCTION get_info_hiredate(p_hiredate emp.hiredate%TYPE)
    RETURN NUMBER IS
    CURSOR years_crs IS
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, p_hiredate)/12)
    FROM emp
    WHERE hiredate = p_hiredate;
    
    years NUMBER(3);
BEGIN
    OPEN years_crs;
    LOOP
        FETCH years_crs INTO years;
        EXIT WHEN years_crs%NOTFOUND;
    END LOOP;
    RETURN years;
END;
--값을 불러올 커서를 만들고, 커서를 담을 변수를 만들고, 커서에서 변수에 값을 fetch하고, 변수를 반환하기.

[IN CLASS]
CREATE OR REPLACE FUNCTION get_info_hiredate(p_hiredate emp.hiredate%TYPE)
    RETURN NUMBER IS
BEGIN
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hiredate)/12);
END;

SELECT MONTHS_BETWEEN(SYSDATE, hiredate) FROM emp;
SELECT ename, hiredate, GET_INFO_HIREDATE(hiredate) 근무연차 FROM emp;


4.emp테이블을 이용해서 사원번호를 입력하면 해당 사원의 관리자 이름을 구하는 함수를 정의하시오. (get_mgr_name)
CREATE OR REPLACE FUNCTION get_mgr_name(p_empno emp.empno%TYPE)
    RETURN VARCHAR2 IS
    mgr_name VARCHAR2(10);
BEGIN
    SELECT m.ename 
    INTO mgr_name
    FROM emp e, emp m 
    WHERE e.mgr=m.empno
    AND e.empno=p_empno;
    RETURN mgr_name;
END;

[IN-CLASS] --서브쿼리
CREATE OR REPLACE FUNCTION get_mgr_name(emp_no emp.empno%TYPE)
    RETURN VARCHAR2 IS
    m_name VARCHAR2(10);
BEGIN
    SELECT ename
    INTO m_name
    FROM emp
    WHERE empno = (SELECT mgr FROM emp 
                   WHERE empno=emp_no);
    RETURN m_name;
END;

[IN-CLASS] --조인 (내 답변과 동일)
CREATE OR REPLACE FUNCTION get_mgr_name(emp_no emp.empno%TYPE)
    RETURN VARCHAR2 IS
    m_name VARCHAR2(10);
BEGIN
    SELECT m.ename
    INTO m_name
    FROM emp e, emp m
    WHERE e.mgr=m.empno
    AND e.empno=emp_no;
    RETURN m_name;
END;

SELECT ename, GET_MGR_NAME(empno) manager FROM emp;

5.emp테이블을 이용해서 사원번호를 입력하면 급여 등급을 구하는 함수를 정의하시오. (get_sal_grade)
CREATE OR REPLACE FUNCTION get_sal_grade(p_empno emp.empno%TYPE)
    RETURN NUMBER IS
    sal_grade NUMBER(2);
BEGIN
    SELECT s.grade 
    INTO sal_grade
    FROM salgrade s, emp e 
    WHERE e.sal BETWEEN s.losal AND s.hisal
    AND empno = p_empno;
    RETURN sal_grade;
END;

[IN-CLASS] --CASE문 (직접 급여등급 만들기)
CREATE OR REPLACE FUNCTION get_sal_grade(emp_no emp.empno%TYPE)
    RETURN CHAR IS
    sgrade CHAR(1);
BEGIN
    SELECT CASE WHEN sal >= 4000 THEN 'A'
                WHEN sal >= 3000 AND sal < 4000 THEN 'B'
                WHEN sal >= 2000 AND sal < 3000 THEN 'C'
                WHEN sal >= 1000 AND sal < 2000 THEN 'D'
                ELSE 'F'
           END grade
    INTO sgrade 
    FROM emp
    WHERE empno=emp_no;
    
    RETURN sgrade;
END;

[IN-CLASS] --조인 (내 답변과 동일)
CREATE OR REPLACE FUNCTION get_sal_grade(emp_no emp.empno%TYPE)
    RETURN NUMBER IS
    sgrade NUMBER;
BEGIN
    SELECT s.grade
    INTO sgrade
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal
    AND e.empno=emp_no;
    
    RETURN sgrade;
END;

SELECT ename, sal, GET_SAL_GRADE(empno) salgrade FROM emp ORDER BY sal DESC;

6.사원번호를 입력하면 근무지를 구하는 함수(find_loc)
[MY ANSWER] --조인
CREATE OR REPLACE FUNCTION find_loc(emp_no emp.empno%TYPE)
    RETURN VARCHAR2 IS
    location VARCHAR2(14);
BEGIN
    SELECT d.loc
    INTO location
    FROM dept d JOIN emp e
    ON d.deptno=e.deptno
    WHERE e.empno=emp_no;
    
    RETURN location;
END;

[MY ANSWER] --서브쿼리
CREATE OR REPLACE FUNCTION find_loc(emp_no emp.empno%TYPE)
    RETURN VARCHAR2 IS
    location VARCHAR2(14);
BEGIN
    SELECT loc
    INTO location
    FROM dept
    WHERE deptno = (SELECT deptno FROM emp
                    WHERE empno= emp_no);
    
    RETURN location;
END;

SELECT ename, deptno, FIND_LOC(empno) location FROM emp ORDER BY deptno;
SELECT FIND_LOC(7698) FROM dual;

생성된 함수 확인하기
데이터 사전(DATA Dictionary)을 통해 검색. 
데이터 사전에 저장된 모든 값은 대문자로 저장되기 때문에 대문자로 검색.

SELECT object_name, object_type FROM user_objects
WHERE object_type='FUNCTION' ORDER BY object_name;

작성된 함수의 소스 코드 확인
SELECT text FROM user_source
WHERE type='FUNCTION' AND name='TAX';


프로시저

CREATE OR REPLACE PROCEDURE hello_world
IS
    --변수 선언
    message VARCHAR2(100);
BEGIN
    message := 'Hello World!';
    DBMS_OUTPUT.PUT_LINE(message);
END;

프로시저 실행
EXECUTE HELLO_WORLD;
EXEC HELLO_WORLD;

CREATE OR REPLACE PROCEDURE hello_oracle(p_message IN VARCHAR2)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(p_message);
END;

EXEC HELLO_ORACLE('Hello Oracle!');

작성된 Stored Procedure 확인
SELECT object_name, object_type
FROM user_objects
WHERE object_type='PROCEDURE';

작성된 Procedure의 소스코드 확인
SELECT text FROM user_source
WHERE type='PROCEDURE' AND name='HELLO_WORLD';

부서테이블에 부서정보를 입력하는 프로시저를 생성
CREATE OR REPLACE PROCEDURE add_department(p_deptno IN dept.deptno%TYPE, 
                                           p_dname IN dept.dname%TYPE, 
                                           p_loc IN dept.loc%TYPE)
IS
BEGIN
    --파라미터 변수에 입력 받은 값으로 부서(dept)테이블의 각 컬럼에 데이터를 추가 정상적으로 transaction 종료
    INSERT INTO dept VALUES(p_deptno, p_dname, p_loc);
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(p_dname || ' register is failed');
        ROLLBACK;
END;

EXEC ADD_DEPARTMENT(60, 'IT SERVICE', 'LONDON');

사원테이블에 사원 정보를 저장
CREATE OR REPLACE PROCEDURE register_emp(e_empno emp.empno%TYPE,
                                         e_ename emp.ename%TYPE,
                                         e_job emp.job%TYPE,
                                         e_mgr emp.mgr%TYPE,
                                         e_sal emp.sal%TYPE,
                                         e_comm emp.comm%TYPE,
                                         e_deptno emp.deptno%TYPE
                                         )
IS
BEGIN
    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (e_empno, e_ename, e_job, e_mgr, SYSDATE, e_sal, e_comm, e_deptno);
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(e_ename || ' register failed');
        ROLLBACK;
END;

EXEC REGISTER_EMP(9000, 'JUDE', 'MANAGER', 7902, 6000, 200, 30);
SELECT * FROM emp;

부서번호를 통해서 부서명과 부서의 위치 구하기
CREATE OR REPLACE PROCEDURE output_department(p_dept_no dept.deptno%TYPE)
IS 
    d_dname dept.dname%TYPE;
    d_loc dept.loc%TYPE;
BEGIN
    --parameter 변수로부터 부서번호를 받아 해당 부서의 정보 질의
    SELECT dname, loc
    INTO d_dname, d_loc
    FROM dept
    WHERE deptno=p_dept_no;
    
    DBMS_OUTPUT.PUT_LINE(d_dname || ', ' || d_loc);
END;

EXEC OUTPUT_DEPARTMENT(10);

사원의 입사한 연도를 입력해서 사원정보 구하기
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
    --%ROWTYPE으로 데이터 타입이 지정되어 있는 사원테이블(emp)의 하나의 행이 가지는
    --모든 컬럼의 데이터 타입을 가져옴
    e_emp emp%ROWTYPE;
BEGIN
    SELECT empno, ename, sal
    --단일행일 경우에는 INTO를 사용할 수 있지만 다중행일 경우에는 오류 발생
    --(다중행일 경우 CURSOR 사용해야 함) 
    INTO e_emp.empno, e_emp.ename, e_emp.sal
    FROM emp
    WHERE TO_CHAR(hiredate, 'YYYY')=p_year;
    
    DBMS_OUTPUT.PUT_LINE(e_emp.empno || ', ' || e_emp.ename || ', ' || e_emp.sal);
END;

단일행이 반환되어 정상 동작
EXEC INFO_HIREDATE('1980');
여러개의 행이 반환되어 에러 발생
EXEC INFO_HIREDATE('1981');

커서를 이용하여 질의 수행 결과 반환되는 여러 행을 처리
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
    e_emp emp%ROWTYPE;
    --커서 선언
    CURSOR emp_cur IS
    SELECT empno, ename, sal
    FROM emp
    WHERE TO_CHAR(hiredate, 'YYYY')=p_year;
BEGIN
    --커서 열기
    OPEN emp_cur;
    
    --커서로부터 데이터 읽기
    LOOP
    FETCH emp_cur INTO e_emp.empno, e_emp.ename, e_emp.sal;
    EXIT WHEN emp_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(e_emp.empno || ', ' || e_emp.ename || ', ' || e_emp.sal);
    
    END LOOP;
    
    --커서 닫기
    CLOSE emp_cur;
END;

EXEC INFO_HIREDATE('1981');


SALES 부서에 속한 사원의 정보 보기
CREATE OR REPLACE PROCEDURE emp_info(p_dept dept.dname%TYPE)
IS
    --커서 선언
    CURSOR emp_cur IS
    SELECT empno, ename 
    FROM emp e JOIN dept d
    ON e.deptno=d.deptno
    WHERE dname = UPPER(p_dept);
    
    --변수 선언
    e_empno emp.empno%TYPE;
    e_ename emp.ename%TYPE;
BEGIN
    OPEN emp_cur;
    --커서로부터 데이터 읽기
    LOOP
        FETCH emp_cur INTO e_empno, e_ename;
        EXIT WHEN emp_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_empno || ', ' || e_ename);
    END LOOP;
    
    CLOSE emp_cur;
END;

EXEC EMP_INFO('sales');

[실습문제]
1)업무(job)을 입력하여 해당 업무를 수행하는 사원들의 사원번호, 이름, 급여, 업무를 출력하시오.
CREATE OR REPLACE PROCEDURE job_info(p_job emp.job%TYPE)
IS
    --커서 선언
    CURSOR emp_cur IS
    SELECT empno, ename, sal, job
    FROM emp
    WHERE job=UPPER(p_job);
    --변수 선언
    e_emp emp%ROWTYPE;
BEGIN
    OPEN emp_cur;
    --커서를 이용해서 데이터 읽기
    LOOP
        FETCH emp_cur INTO e_emp.empno, e_emp.ename, e_emp.sal, e_emp.job;
        EXIT WHEN emp_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_emp.empno || ', ' || e_emp.ename || ', ' 
                             || e_emp.sal || ', ' || e_emp.job);
    END LOOP;
    CLOSE emp_cur;
END;

EXEC JOB_INFO('manager');

2)사원번호와 새 업무를 입력하면 emp 테이블의 해당 사원의 업무를 갱신할 수 있는 프로시저를 작성하시오.
CREATE OR REPLACE PROCEDURE update_job(p_empno emp.empno%TYPE, p_job emp.job%TYPE)
IS
BEGIN
    UPDATE emp SET job=UPPER(p_job) WHERE empno=p_empno;
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(p_empno || ' update is failed');
        ROLLBACK;
END;

EXEC UPDATE_JOB(7369, 'driver');
SELECT * FROM emp;



CREATE TABLE book(
    bookid NUMBER PRIMARY KEY,
    bookname VARCHAR2(60) NOT NULL,
    publisher VARCHAR2(60) NOT NULL,
    price NUMBER NOT NULL
);

INSERT INTO book VALUES(1, '자바를 찾아서', '서울', 30000);
INSERT INTO book VALUES(2, '도시', '천국', 10000);
INSERT INTO book VALUES(3, '하늘', '신라출판사', 50000);
COMMIT;

SELECT * FROM book;

동일한 도서가 있는지 점검한 후 동일한 도서가 없으면 삽입하고 
동일한 도서가 있으면 가격을 업데이트
(book_info)
[MY ANSWER] --틀림
CREATE OR REPLACE PROCEDURE book_info(mybookid book.bookid%TYPE,
                                      mybookname book.bookname%TYPE, 
                                      mypublisher book.publisher%TYPE,
                                      myprice book.price%TYPE)
IS
    my_book_name book.bookname%TYPE := NULL;
BEGIN
    SELECT bookname
    INTO my_book_name
    FROM book
    WHERE bookname = mybookname;
    
    IF my_book_name IS NOT NULL THEN
        UPDATE book SET price=myprice WHERE bookname = mybookname;
    ELSE
        INSERT INTO book VALUES(mybookid, mybookname, mypublisher, myprice);
    END IF;
    
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error has occured');
        ROLLBACK;
END;



[IN-CLASS]
CREATE OR REPLACE PROCEDURE book_info(mybookid book.bookid%TYPE,
                                      mybookname book.bookname%TYPE, 
                                      mypublisher book.publisher%TYPE,
                                      myprice book.price%TYPE)
IS
    mycount NUMBER;
BEGIN
    SELECT COUNT(*) INTO mycount FROM book 
    WHERE bookname = mybookname;
    
    IF mycount!=0 THEN
        --동일한 도서 존재
        UPDATE book SET price = myprice WHERE bookname = mybookname;
    ELSE
        --동일한 도서 미존재
        INSERT INTO book VALUES(mybookid, mybookname, mypublisher, myprice);
    END IF;
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR!!');
        ROLLBACK;
END;

EXEC BOOK_INFO(4, '도시2', '천국', 20000);
SELECT * FROM book;