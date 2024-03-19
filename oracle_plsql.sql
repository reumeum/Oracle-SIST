PL/SQL : Procedural Language extension to Structured Query Language(SQL)�� ����
         SQL�� Ȯ���� ������ ó�� ���
         
PL/SQL�� �⺻ ����
PL/SQL�� �⺻ ������ ���(block)
1)�����(Declarative Part): ����� ������ ����� ����
                           (����ο��� ������ ��� ���� ����)
2)�����(Executable Part): ���� ó���� ������ ����ϴ� �κ�
3)����ó����(Exception-building Part): ����ο��� ������ ó���ϴ� �� �߻��� �� �ִ� ���� ������ ó��

����θ� ����� ����
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

���� ���
DECLARE
--������ ������ �� �ִ� �����
     message VARCHAR2(100);
BEGIN
--����ο� ����� ������ ����ο��� �̸� ����Ǿ�� ��
    message := 'Hello World!!!';
    DBMS_OUTPUT.PUT_LINE(message);
END;

���� ����� �ʱ�ȭ�� ���ÿ�
DECLARE
    message VARCHAR2(100) := 'Hell o world?';
BEGIN
    DBMS_OUTPUT.PUT_LINE(message);
END;

DECLARE
--���� ���� �� �ʱ�ȭ�� ���� ������ NULL
    counter INTEGER;
BEGIN
    counter := counter + 1;
    IF counter IS NULL THEN 
        DBMS_OUTPUT.PUT_LINE('result: counter is null');
    END IF;
    DBMS_OUTPUT.PUT_LINE(counter);
END;

DECLARE
    --���� ����
    counter INTEGER;
    i INTEGER;
BEGIN
    FOR i IN 1..9 LOOP
        counter := 2 * i;
        DBMS_OUTPUT.PUT_LINE('2 * ' || i || ' = ' || counter);
    END LOOP;
END;

����ó����
EXCEPTION WHEN ����1 THEN ����ó��1
          WHEN ����2 THEN ����ó��2
          WHEN OTHERS THEN ����ó��
          
DECLARE
    --���� ����
    counter INTEGER;
BEGIN
    --���� �ʱ�ȭ
    counter := 10;
    counter := counter/0;
    DBMS_OUTPUT.PUT_LINE(counter);
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('errors');
END;

������ ���
emp_num1 NUMBER(9);
grade CHAR(2);
emp_num2 INTETER := 1;

���
nYear CONSTANT INTEGER:=30; --(O)
nYear CONSTANT INTEGER; --(X)

%TYPE : ������ ���̺� �ִ� �÷��� ������ Ÿ���� �ڵ����� ������
nSal emp.sal%TYPE;

%ROWTYPE : %TYPE�� �ϳ��� ���� ���� ���������, %ROWTYPE�� �ϳ� �̻��� ���� �����
           �ο�Ÿ�� ������ �����ؼ� ���̺� �ִ� �ο�(��)�� ����

�ݷ���
VARRAY
VARRAY�� VARIABLE ARRAY�� ���ڷ� ���� ����(Fixed Number)�� ���� �迭 

DECLARE
    TYPE VARRAY_TEST IS VARRAY(3) OF INTEGER;
    varray1 VARRAY_TEST; --������ ������ VARRAY_TEST Ÿ���� ����ϴ� ����
BEGIN
    varray1 := VARRAY_TEST(10, 20, 30);
    
    DBMS_OUTPUT.PUT_LINE(varray1(1)); --�ε����� 1������ ����
    DBMS_OUTPUT.PUT_LINE(varray1(2));
    DBMS_OUTPUT.PUT_LINE(varray1(3));
END;

��ø���̺�: VARRAY�� ��������� ��ø ���̺��� ���� �ÿ� ��ü ũ�⸦ ����� �ʿ䰡 ����
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

ASSOCIATIVE ARRAY (Index-by Table): �����迭
Ű�� ���� ������ ������ �ݷ���
�ϳ��� Ű�� �ϳ��� ���� ����
DECLARE
    TYPE ASSOC_ARRAY_NUM_TYPE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    --NUMBER�� value�� Ÿ��, PLS_INTEGER�� key�� Ÿ��
    assoc1 ASSOC_ARRAY_NUM_TYPE;
BEGIN
    --Ű�� �� ����
    --Ű�� 3, ���� 33
    assoc1(3) := 33; 
    
    DBMS_OUTPUT.PUT_LINE(assoc1(3));
END;


���ڵ� : ���̺��� �÷����� ���� �ٸ� ������ ������ Ÿ������ �����ǵ���
        ���ڵ� ���� �ش� �ʵ�(���ڵ忡���� ��Ҷ� �� ��� �ʵ�� �� �����)���� ����
        �ٸ� ������ Ÿ���� ���� �� ����
        
DECLARE
    --TYPE���� ������ ���ڵ�
    TYPE RECORD1 IS RECORD(deptno NUMBER NOT NULL := 50,
                           dname VARCHAR2(14),
                           loc VARCHAR2(13));
    --���� ������ RECORD1�� ���� ���� ����
    rec1 RECORD1;
BEGIN
    --RECORD1 Ÿ���� rec1�� dname �ʵ忡 �� �Ҵ�
     rec1.dname := 'RECORD';
     rec1.loc := 'SEOUL';
     
     --rec1 ���ڵ� ���� dept ���̺� insert
    INSERT INTO dept VALUES rec1;
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
END;

IF��

DECLARE
    grade CHAR(1);
BEGIN
    --������ �ʱ�ȭ
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


CASE��

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

LOOP��

DECLARE
    --���� ����
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
    --loop ���� ���������� �Ʒ� �ڵ带 ������
    DBMS_OUTPUT.PUT_LINE('���α׷� ��');
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


WHILE-LOOP��

DECLARE
    test_number INTEGER;
    result_num INTEGER;
BEGIN
    test_number := 1;
    result_num := 0;
    
    WHILE result_num < 20 LOOP --���⼭ result_num ���� ����ؾ� �ϱ� ������ �̸� �ʱ�ȭ
        result_num := test_number * 2;
        DBMS_OUTPUT.PUT_LINE(result_num);
        test_number := test_number + 1;
    END LOOP;
END;

FOR-LOOP��

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

CURSOR(Ŀ��): ������ ���� ��ȯ�Ǵ� ����� �޸� �� ��ġ�ϰ� �Ǵµ�
              PL/SQL������ �ٷ� Ŀ��(CURSOR)�� ����Ͽ� �� ������տ� ������ �� ����
              
DECLARE
        --Ŀ�� ����: Ŀ���� �̸��� �ְ�, �� Ŀ���� �����Ϸ��� ������ ���� 
        CURSOR emp_crs IS
        SELECT empno
        FROM emp
        WHERE deptno=10;
        
        emp_no emp.empno%TYPE;
BEGIN
    --Ŀ�� ����: Ŀ���� ���ǵ� ������ �����ϴ� ����
    OPEN emp_crs;
    LOOP
        FETCH emp_crs INTO emp_no;
        --%NOTFOUND Ŀ�������� ��� ������ �Ӽ�. �� �̻� ��ġ(�Ҵ�)�� �ο찡 ������ �ǹ�
        EXIT WHEN emp_crs%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(emp_no);
    END LOOP;
    
    --Ŀ�� �ݱ�: ��ġ �۾��� ������ ���� Ŀ���� �ݴ´�
    CLOSE emp_crs;
END;

PL/SQL �������α׷�

�Լ�

�Է¹��� �����κ��� 10%�� ������ ��� �Լ�
CREATE OR REPLACE FUNCTION tax(p_value IN NUMBER) --IN�� ���� ����
    RETURN NUMBER IS
BEGIN
    RETURN p_value * 0.1;
END;

SELECT TAX(100) FROM dual;
SELECT empno, ename, sal, TAX(sal) tax FROM emp;

�޿��� Ŀ�̼��� ���ļ� ���� ���
CREATE OR REPLACE FUNCTION tax2(p_sal IN emp.sal%TYPE, p_comm emp.comm%TYPE)
    RETURN NUMBER IS
BEGIN
    RETURN (p_sal+NVL(p_comm, 0)) * 0.1;
END;

SELECT empno, ename, sal+NVL(comm, 0) �Ǳ޿�, TAX2(sal, comm) tax FROM emp;

�޿�(Ŀ�̼� ����)�� ���� ������ ������ ���� ������.
�޿��� �� $1000���� ������ ������ 5%, $1000�̻� $2000���ϸ� 10%, $2000�ʰ��ϸ� 20% ����.
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

SELECT empno, ename, sal+NVL(comm, 0) �Ǳ޿�, tax3(sal, comm) tax FROM emp;

�����ȣ�� ���ؼ� �޿��� �˷��ִ� �Լ�
CREATE OR REPLACE FUNCTION getsal(emp_no IN emp.empno%TYPE)
    RETURN NUMBER IS
    --���� ����
    nSalaries NUMBER(9);
BEGIN
    SELECT sal 
    --������� �������� ��� Ŀ���� ������� �ʰ� INTO�� ����� �о�� ���� ������ ���� �� ����
    INTO nSalaries 
    FROM emp 
    WHERE empno = emp_no; 
    RETURN nSalaries;
END;

SELECT GETSAL(7839) FROM dual;

�μ���ȣ�� �����ϸ� �μ����� ���� �� �ִ� �Լ�
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

[�ǽ�����]
1.�� ���ڸ� �����ϸ� ������ �ؼ� ������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�.(add_num)
CREATE OR REPLACE FUNCTION add_num(num1 NUMBER, num2 NUMBER)
    RETURN NUMBER IS
BEGIN
    RETURN num1 + num2;
END;

2.�μ���ȣ�� �Է��ϸ� �ش� �μ����� �ٹ��ϴ� ��� ���� ��ȯ�ϴ� �Լ��� �����Ͻÿ�.(get_emp_count)
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
SELECT deptno, dname, GET_EMP_COUNT(deptno) ����� FROM dept;

3.emp���̺��� �Ի����� �Է��ϸ� �ٹ������� ���ϴ� �Լ��� �����Ͻÿ�. (�Ҽ��� ����, get_info_hiredate)

[MY ANSWER] --�� Ŀ���� ���, �� �� �ᵵ ����?
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
--���� �ҷ��� Ŀ���� �����, Ŀ���� ���� ������ �����, Ŀ������ ������ ���� fetch�ϰ�, ������ ��ȯ�ϱ�.

[IN CLASS]
CREATE OR REPLACE FUNCTION get_info_hiredate(p_hiredate emp.hiredate%TYPE)
    RETURN NUMBER IS
BEGIN
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hiredate)/12);
END;

SELECT MONTHS_BETWEEN(SYSDATE, hiredate) FROM emp;
SELECT ename, hiredate, GET_INFO_HIREDATE(hiredate) �ٹ����� FROM emp;


4.emp���̺��� �̿��ؼ� �����ȣ�� �Է��ϸ� �ش� ����� ������ �̸��� ���ϴ� �Լ��� �����Ͻÿ�. (get_mgr_name)
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

[IN-CLASS] --��������
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

[IN-CLASS] --���� (�� �亯�� ����)
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

5.emp���̺��� �̿��ؼ� �����ȣ�� �Է��ϸ� �޿� ����� ���ϴ� �Լ��� �����Ͻÿ�. (get_sal_grade)
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

[IN-CLASS] --CASE�� (���� �޿���� �����)
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

[IN-CLASS] --���� (�� �亯�� ����)
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

6.�����ȣ�� �Է��ϸ� �ٹ����� ���ϴ� �Լ�(find_loc)
[MY ANSWER] --����
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

[MY ANSWER] --��������
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

������ �Լ� Ȯ���ϱ�
������ ����(DATA Dictionary)�� ���� �˻�. 
������ ������ ����� ��� ���� �빮�ڷ� ����Ǳ� ������ �빮�ڷ� �˻�.

SELECT object_name, object_type FROM user_objects
WHERE object_type='FUNCTION' ORDER BY object_name;

�ۼ��� �Լ��� �ҽ� �ڵ� Ȯ��
SELECT text FROM user_source
WHERE type='FUNCTION' AND name='TAX';


���ν���

CREATE OR REPLACE PROCEDURE hello_world
IS
    --���� ����
    message VARCHAR2(100);
BEGIN
    message := 'Hello World!';
    DBMS_OUTPUT.PUT_LINE(message);
END;

���ν��� ����
EXECUTE HELLO_WORLD;
EXEC HELLO_WORLD;

CREATE OR REPLACE PROCEDURE hello_oracle(p_message IN VARCHAR2)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(p_message);
END;

EXEC HELLO_ORACLE('Hello Oracle!');

�ۼ��� Stored Procedure Ȯ��
SELECT object_name, object_type
FROM user_objects
WHERE object_type='PROCEDURE';

�ۼ��� Procedure�� �ҽ��ڵ� Ȯ��
SELECT text FROM user_source
WHERE type='PROCEDURE' AND name='HELLO_WORLD';

�μ����̺� �μ������� �Է��ϴ� ���ν����� ����
CREATE OR REPLACE PROCEDURE add_department(p_deptno IN dept.deptno%TYPE, 
                                           p_dname IN dept.dname%TYPE, 
                                           p_loc IN dept.loc%TYPE)
IS
BEGIN
    --�Ķ���� ������ �Է� ���� ������ �μ�(dept)���̺��� �� �÷��� �����͸� �߰� ���������� transaction ����
    INSERT INTO dept VALUES(p_deptno, p_dname, p_loc);
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(p_dname || ' register is failed');
        ROLLBACK;
END;

EXEC ADD_DEPARTMENT(60, 'IT SERVICE', 'LONDON');

������̺� ��� ������ ����
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

�μ���ȣ�� ���ؼ� �μ���� �μ��� ��ġ ���ϱ�
CREATE OR REPLACE PROCEDURE output_department(p_dept_no dept.deptno%TYPE)
IS 
    d_dname dept.dname%TYPE;
    d_loc dept.loc%TYPE;
BEGIN
    --parameter �����κ��� �μ���ȣ�� �޾� �ش� �μ��� ���� ����
    SELECT dname, loc
    INTO d_dname, d_loc
    FROM dept
    WHERE deptno=p_dept_no;
    
    DBMS_OUTPUT.PUT_LINE(d_dname || ', ' || d_loc);
END;

EXEC OUTPUT_DEPARTMENT(10);

����� �Ի��� ������ �Է��ؼ� ������� ���ϱ�
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
    --%ROWTYPE���� ������ Ÿ���� �����Ǿ� �ִ� ������̺�(emp)�� �ϳ��� ���� ������
    --��� �÷��� ������ Ÿ���� ������
    e_emp emp%ROWTYPE;
BEGIN
    SELECT empno, ename, sal
    --�������� ��쿡�� INTO�� ����� �� ������ �������� ��쿡�� ���� �߻�
    --(�������� ��� CURSOR ����ؾ� ��) 
    INTO e_emp.empno, e_emp.ename, e_emp.sal
    FROM emp
    WHERE TO_CHAR(hiredate, 'YYYY')=p_year;
    
    DBMS_OUTPUT.PUT_LINE(e_emp.empno || ', ' || e_emp.ename || ', ' || e_emp.sal);
END;

�������� ��ȯ�Ǿ� ���� ����
EXEC INFO_HIREDATE('1980');
�������� ���� ��ȯ�Ǿ� ���� �߻�
EXEC INFO_HIREDATE('1981');

Ŀ���� �̿��Ͽ� ���� ���� ��� ��ȯ�Ǵ� ���� ���� ó��
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
    e_emp emp%ROWTYPE;
    --Ŀ�� ����
    CURSOR emp_cur IS
    SELECT empno, ename, sal
    FROM emp
    WHERE TO_CHAR(hiredate, 'YYYY')=p_year;
BEGIN
    --Ŀ�� ����
    OPEN emp_cur;
    
    --Ŀ���κ��� ������ �б�
    LOOP
    FETCH emp_cur INTO e_emp.empno, e_emp.ename, e_emp.sal;
    EXIT WHEN emp_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(e_emp.empno || ', ' || e_emp.ename || ', ' || e_emp.sal);
    
    END LOOP;
    
    --Ŀ�� �ݱ�
    CLOSE emp_cur;
END;

EXEC INFO_HIREDATE('1981');


SALES �μ��� ���� ����� ���� ����
CREATE OR REPLACE PROCEDURE emp_info(p_dept dept.dname%TYPE)
IS
    --Ŀ�� ����
    CURSOR emp_cur IS
    SELECT empno, ename 
    FROM emp e JOIN dept d
    ON e.deptno=d.deptno
    WHERE dname = UPPER(p_dept);
    
    --���� ����
    e_empno emp.empno%TYPE;
    e_ename emp.ename%TYPE;
BEGIN
    OPEN emp_cur;
    --Ŀ���κ��� ������ �б�
    LOOP
        FETCH emp_cur INTO e_empno, e_ename;
        EXIT WHEN emp_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_empno || ', ' || e_ename);
    END LOOP;
    
    CLOSE emp_cur;
END;

EXEC EMP_INFO('sales');

[�ǽ�����]
1)����(job)�� �Է��Ͽ� �ش� ������ �����ϴ� ������� �����ȣ, �̸�, �޿�, ������ ����Ͻÿ�.
CREATE OR REPLACE PROCEDURE job_info(p_job emp.job%TYPE)
IS
    --Ŀ�� ����
    CURSOR emp_cur IS
    SELECT empno, ename, sal, job
    FROM emp
    WHERE job=UPPER(p_job);
    --���� ����
    e_emp emp%ROWTYPE;
BEGIN
    OPEN emp_cur;
    --Ŀ���� �̿��ؼ� ������ �б�
    LOOP
        FETCH emp_cur INTO e_emp.empno, e_emp.ename, e_emp.sal, e_emp.job;
        EXIT WHEN emp_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_emp.empno || ', ' || e_emp.ename || ', ' 
                             || e_emp.sal || ', ' || e_emp.job);
    END LOOP;
    CLOSE emp_cur;
END;

EXEC JOB_INFO('manager');

2)�����ȣ�� �� ������ �Է��ϸ� emp ���̺��� �ش� ����� ������ ������ �� �ִ� ���ν����� �ۼ��Ͻÿ�.
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

INSERT INTO book VALUES(1, '�ڹٸ� ã�Ƽ�', '����', 30000);
INSERT INTO book VALUES(2, '����', 'õ��', 10000);
INSERT INTO book VALUES(3, '�ϴ�', '�Ŷ����ǻ�', 50000);
COMMIT;

SELECT * FROM book;

������ ������ �ִ��� ������ �� ������ ������ ������ �����ϰ� 
������ ������ ������ ������ ������Ʈ
(book_info)
[MY ANSWER] --Ʋ��
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
        --������ ���� ����
        UPDATE book SET price = myprice WHERE bookname = mybookname;
    ELSE
        --������ ���� ������
        INSERT INTO book VALUES(mybookid, mybookname, mypublisher, myprice);
    END IF;
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR!!');
        ROLLBACK;
END;

EXEC BOOK_INFO(4, '����2', 'õ��', 20000);
SELECT * FROM book;