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
nYear = CONSTATNT INTEGER:=30; --(O)
nYEAR = CONSTATNT INTEGER; --(X)

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
SELECT deptno, dname, GET_EMP_COUNT(deptno) FROM dept;


