SELECT�� : �����ͺ��̽��κ��� ����Ǿ� �ִ� �����͸� �˻��ϴµ� ���

��ü �÷��� ������ �б�
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM emp;
SELECT * FROM emp;

�κ� �÷��� ������ �б�
SELECT ename, sal FROM emp;

�ּ�
SELECT * /*�ּ�*/ FROM emp;

DUAL : �Լ� �� ����� ����� �� �� ����� �� �ִ� ����(public) ���̺�
       ����� �����Ͱ� �ִ� ���̺��� �������� ���� ��� ��, �ǻ翭(pseudo-column), ǥ���� ���� ���� �� �ѹ��� �����ų�
       ���� ��¥, �ð��� �˰��� �� �� �̿�. ��, �Ͻ����� ���, ��¥ ���� �ַ� �̿�
       
SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT ASCII(0) FROM dual;
SELECT 7 + 10 FROM dual;

����
SELECT ename, sal, sal+300 AS estimated_sal FROM emp;

������ �켱����
SELECT ename, sal, (sal+300)*12 AS annual_sal FROM emp;

NULL���� ����: NULL�� ����� �� ���ų�, �Ҵ���� �ʾҰų�, �� �� ���ų�, ������ �� ���� ��
              (NULL�� 0�̳� ������� �ٸ�)


SELECT empno, ename, job, comm FROM emp;

������� NULL��: NULL���� �����ϴ� ������� NULL�� ����
SELECT ename, (sal+comm)*12 FROM emp;

�� ALIAS: ���� ��Ī
���̸� �ٷ� �ڿ� ����. �� �̸��� ALIAS ���̿� ���� ������ AS Ű���尡 �� ���� ����

SELECT sal*12 Asal FROM emp;
SELECT sal*12 AS Asal From emp;

SELECT sal*12 "Annual Salary" From emp;

���� ������: ���̳� ���ڿ��� �ٸ� ���� ����, �� ���� ���μ�(||)���� ��Ÿ��
            ������� ���ڽ��� ����
SELECT ename || ' has $' || sal FROM emp;

���� �����ڿ� NULL��: ���ڿ��� NULL���� ������ ��� ����� ���ڿ�
SELECT ename || comm FROM emp;

DISTINCT: �ߺ��� ����
SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT(deptno) FROM emp;

[�ǽ�����]
1.emp ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�.
2.emp ���̺��� ����̸��� ������ ����ϴµ�, �÷����� "�� ��", "�� ��"���� �ٲپ� ����Ͻÿ�.
3.emp ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷Ÿ��� "�����ȣ", "����̸�", "����", "����" ���� ����Ͻÿ�.
4.emp ���̺� ������ �ߺ����� �ʰ� ǥ���Ͻÿ�.

SELECT empno, ename, sal FROM emp;
SELECT ename "�� ��", sal "�� ��" FROM emp;
SELECT empno �����ȣ, ename ����̸�, sal ����, sal*12 ���� FROM emp;
SELECT DISTINCT(job) FROM emp;

WHERE�� ���: ���� üũ ��� �� �����ϱ�
             (����) �˸��ƽ��� ����� �� ����
SELECT * FROM emp WHERE deptno=10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE hiredate > '81-12-03';
SELECT * FROM emp WHERE hiredate < '81/12/03';
(����) WHERE�������� �˸��ƽ��� ����� �� ����
SELECT ename, sal, sal*12 ansal FROM emp WHERE sal*12 > 15000;

SELECT * FROM emp WHERE hiredate != '80/12/17';
SELECT * FROM emp WHERE hiredate <> '80/12/17';
SELECT * FROM emp WHERE hiredate ^= '80/12/17';

SELECT * FROM emp WHERE sal > 2000 AND sal <= 5000;
SELECT * FROM emp WHERE sal >= 800 AND sal <= 3000;

BETWEEN ... AND ... : �� �� ����(������ �� ����)
SELECT * FROM emp WHERE sal BETWEEN 800 AND 3000; 
SELECT * FROM emp WHERE sal NOT BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT * FROM emp WHERE ename NOT BETWEEN 'KING' AND 'SMITH';

IN: �� ��� ���� ���� ��ġ
SELECT * FROM emp WHERE sal IN (1300, 2450, 3000);
SELECT * FROM emp WHERE sal NOT IN (1300, 2450, 3000);
SELECT ename, mgr, deptno FROM emp WHERE ename IN ('ALLEN', 'FORD');
SELECT ename, mgr, deptno FROM emp WHERE ename NOT IN ('ALLEN', 'FORT');

[�ǽ�]
1.emp ���̺��� �����ȣ�� 7698�� ����� �̸�, ����, �޿��� ����Ͻÿ�.
2.emp ���̺��� ����̸��� SMITH�� ����� �̸�, ����, �μ���ȣ�� ���Ͻÿ�.
3.������ 2500 �̻� 3500 �̸��� ����� �̸�, �Ի���, ������ ���Ͻÿ�.
4.�޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸�, ����, �޿��� ����Ͻÿ�.

SELECT ename, job, sal FROM emp WHERE empno = 7698;
SELECT ename, sal, deptno FROM emp WHERE ename = 'SMITH';
SELECT ename, hiredate, sal FROM emp WHERE sal >= 2500 AND sal < 3500;
SELECT ename, job, sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

LIKE: ���ϰ� ��ġ�ϴ� �����͸� �˻�
%�� 0�� �̻��� ���ڸ� ��Ÿ��
_�� �� ���ڸ� ��Ÿ��

S�� ó��, �߰�, ���� ���� �̸��� �˻�
SELECT * FROM emp WHERE ename LIKE '%S%';
SELECT * FROM emp WHERE ename NOT LIKE '%S%';

�Ի����� 22�� ������ ��� ���� ���ϱ�
SELECT ename, hiredate FROM emp WHERE hiredate LIKE '%22';
SELECT ename, hiredate FROM emp WHERE hiredate NOT LIKE '%22';

FOR ������ �� �� ����
SELECT * FROM emp WHERE ename LIKE 'FOR_';

�� ���� ������ M, M ������ ���ų� ������
SELECT * FROM emp WHERE ename LIKE '_M%';

NULL ���� ���
SELECT * FROM emp WHERE comm IS NULL; -- com = null�� �Ұ�
SELECT * FROM emp WHERE comm IS NOT NULL;

�� ������ (AND, OR, NOT)�� ����Ͽ� ���� ����
SELECT empno, ename, job, sal FROM emp WHERE sal >= 2000 AND job LIKE '%MAN%';

SELECT empno, ename, job, sal FROM emp WHERE sal >= 2000 OR job LIKE '%MAN%';

SELECT ename, job FROM emp WHERE job NOT IN ('CLERK', 'SALESMAN');

[�ǽ�����]
1.81��05��01�� 81��12��03�� ���̿� �Ի��� ����� �̸�, �޿�, �Ի����� ����Ͻÿ�.
2.�����ȣ�� 7566,7782,7934�� ����� ������ ������� �����ȣ, �̸�, ������ ����Ͻÿ�.
3.�޿��� $2,000�� $5,000 �����̰� �μ���ȣ�� 10 �Ǵ� 30�� ����� �̸��� �޿�, �μ���ȣ�� ����Ͻÿ�.
4.������ SALESMAN �Ǵ� MANAGER �̸鼭 �޿��� $1,600, $2,975, $2,850�� �ƴ� ��� ����� �̸�, ����, �޿��� ǥ���Ͻÿ�.

SELECT ename, sal, hiredate FROM emp WHERE hiredate BETWEEN '81-05-01' AND '81-12-03';
SELECT empno, ename, sal FROM emp WHERE empno NOT IN (7566, 7782, 7934);
SELECT ename, sal, deptno FROM emp WHERE (sal BETWEEN 2000 AND 5000) AND deptno IN (10, 30);
SELECT ename, job, sal FROM emp WHERE (job IN ('SALESMAN', 'MANAGER')) AND (sal NOT IN (1600, 2975, 2850));

�������� ����
SELECT * FROM emp ORDER BY sal;
SELECT * FROM emp ORDER BY sal 
ASC;

�������� ����
SELECT * FROM emp ORDER BY sal DESC;

1�� ���Ŀ��� �ߺ����� ���� ��� 2�� ���� ����
SELECT * FROM emp ORDER BY sal DESC, ename DESC;

��¥ ����
SELECT ename, job, deptno, hiredate FROM emp ORDER BY hiredate DESC;

�� ALIAS �������� ����
SELECT empno, ename, sal*12 annsal FROM emp ORDER BY annsal;

���� ���� ��ġ�� ����Ͽ� ����
SELECT ename, job, deptno, hiredate FROM emp ORDER BY 3;

���̺� ������ ������� �� ���� ��ġ �ο�
SELECT * FROM emp ORDER BY 2;

SELECT * FROM emp ORDER BY comm;

NULL���� ���� �ִ� �÷��� ������ ��
NULLS FIRST �Ǵ� NULLS LAST Ű���带 ����Ͽ� ��ȯ�� �� �� NULL���� �����ϴ� ����
���� ������ �� ó���� ��Ÿ���ų� �������� ��Ÿ������ ����

SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm NULLS LAST;

SELECT * FROM emp ORDER BY comm NULLS LAST, ename DESC;

SELECT * FROM emp ORDER BY comm DESC NULLS FIRST;

[�ǽ�����]
1.�����ȣ, ����̸�, �Ի����� ����ϴµ� �Ի����� ���� ��������� �����Ͻÿ�.
2.����̸�,�޿�,������ ���ϰ� ������ ���� ������ �����Ͻÿ�.
3.10�� �Ǵ� 20�� �μ����� �ٹ��ϰ� �ִ� ����� �̸��� �μ���ȣ�� ����ϴµ� �̸��� �����ڼ����� ǥ���Ͻÿ�.
4.Ŀ�̼� ����� ���� ��� ����� �̸�, �޿�, Ŀ�̼��� ����ϴµ� Ŀ�̼��� �������� �������� �����Ͻÿ�.

SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;
SELECT ename, sal, sal*12 annsal FROM emp ORDER BY annsal DESC;
SELECT ename, deptno FROM emp WHERE deptno IN (10, 20) ORDER BY ename;
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;

�Լ�
�����Լ�
��ҹ��� �����Լ� - LOWER, UPPER, INITCAP
SELECT LOWER('HELLO') from dual;
SELECT LOWER(ename) FROM emp;
SELECT UPPER('hello') FROM dual;
SELECT INITCAP('hello wORLD') FROM dual;

���� �����Լ�
CONCAT(���ڿ�1, ���ڿ�2) : ���ڿ�1�� ���ڿ�2�� �����Ͽ� �ϳ��� ���ڿ��� ��ȯ
SELECT CONCAT('hello','world') FROM dual;
SELECT CONCAT(ename, job) FROM emp;

SUBSTR(����ڿ�, �ε���): ����ڿ����� ������ �ε������� ���ڿ��� ����
[����] �ε��� 1���� ����
SELECT SUBSTR('Hello World', 3) FROM dual;
SELECT SUBSTR('Hello World', 3, 3) FROM dual; --�ε��� 3���� ���� 3�� ����
SELECT SUBSTR('Hello World', -3) FROM dual;
SELECT SUBSTR('Hello World', -3, 2) FROM dual;

LENGTH(����ڿ�): ���ڿ��� ����
SELECT LENGTH('Hello World') FROM dual;
SELECT ename, LENGTH(ename) FROM emp;

INSTR(����ڿ�, �˻�����): �˻������� ��ġ���˻�
SELECT INSTR('Hello World', 'e') FROM dual;
�˻����ڰ� ���� ��� 0 ��ȯ
SELECT INSTR('Hello World', 'E') FROM dual;
SELECT INSTR('Hello World', 'o') FROM dual;
             ����ڿ�, �˻�����, �˻��ε���[�ش���ġ���� �˻�]
SELECT INSTR('Hello World', 'o', 6) FROM dual;
             ����ڿ�, �˻�����, �˻��ε���, �ݺ�Ƚ��[����ڿ� ��ü�� ������ �˻��Ѵٴ� �ǹ̰� �ƴ϶� 1�� �˻����� o�� ã���� ������ Ƚ����ŭ �� ���� ���ڸ� �˻��Ѵٴ� �ǹ�]
SELECT INSTR('Hello World', 'o', 1, 2) FROM dual;

LPAD(����ڿ�, �ѱ���, ����): ������ ������ ���ڿ��� ����ϴµ� ������ ���ʿ� ������ ���ڷ� ä��
SELECT LPAD('Hello',10,'*') FROM dual;

RPAD(����ڿ�, �ѱ���, ����): ������ ������ ���ڿ��� ����ϴµ� ������ �����ʿ� ������ ���ڷ� ä��
SELECT RPAD('Hello',10,'*') FROM dual;

TRIM: ���ڿ����� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ
����: ���� -> LEADING, ������ -> TRAILING, ���� -> BOTH (default)
SELECT TRIM(LEADING 'h' FROM 'habchh') FROM dual;

LTRIM: ���ڿ��� ���ʿ��� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ
RTRIM: ���ڿ��� �����ʿ��� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ

REPLACE(����ڿ�, OLD, NEW): ����ڿ����� OLD���ڸ� NEW���ڷ� ��ü
SELECT REPLACE('010.1234.5678', '.', '-') FROM dual;

�Լ� ��ø
SELECT ename, LOWER(SUBSTR(ename, 1, 3)) FROM emp;

[�ǽ� ����]
1.����(job)�� ù���ڴ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
2.����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ����Ͻÿ�.
3.�̸��� ����° ���ڰ� A�� ��� ����� �̸��� ǥ���Ͻÿ�.
4.�̸���  J,A �Ǵ� M���� �����ϴ� ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) ��
  �̸��� ���̸� ǥ���Ͻÿ�. (�� ���̺��� name, length)
  
SELECT INITCAP(job) FROM emp;
SELECT SUBSTR(ename, 1, 3) FROM emp WHERE ename LIKE '%A%';
SELECT ename FROM emp WHERE ename LIKE '__A%';
SELECT INITCAP(ename) name, LENGTH(ename) length FROM emp WHERE ename LIKE 'J%' OR ename LIKE 'A%' OR ename LIKE 'M%';

SELECT INITCAP(ename) name, LENGTH(ename) length FROM emp WHERE SUBSTR(ename, 1,1) IN ('J', 'A', 'M')

�����Լ�
CEIL(�Ǽ�): �ø� ó���� �������� ��ȯ
SELECT CEIL(1.4) FROM dual;

FLOOR(�Ǽ�): ���� ó���� �������� ��ȯ
SELECT FLOOR(1.4) FROM dual;

ROUND(������, �����ڸ���): �ݿø�
SELECT ROUND(45.926, 2) FROM dual; --45.39
SELECT ROUND(45.926) FROM dual; --46
SELECT ROUND(45.926, -1) FROM dual; --50

SELECT empno, ename, sal, ROUND(sal*1.15) "New Salary", ROUND(sal*0.15) "Increase" FROM emp;
SELECT empno, ename, sal, ROUND(sal*1.15, 2) "New Salary", ROUND(sal*0.15, 2) "Increase" FROM emp;

TRUNC(������, �����ڸ���): ����
SELECT TRUNC(45.926, 2) FROM dual; --45.92
SELECT TRUNC(45.926) FROM dual; --45

MOD(������, ���� ����): ������ ��
SELECT MOD(17,2) FROM dual; --1

��¥�Լ�
��¥�� ��� ������ ���
SELECT ename, (SYSDATE - hiredate)/7 AS weeks FROM emp WHERE deptno = 10;

MONTHS_BETWEEN(��¥1, ��¥2): �� ��¥ ���� �� ��
SELECT MONTHS_BETWEEN('2012-03-23', '2010-01-23') FROM dual;

SELECT ename, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) months_worked FROM emp ORDER BY months_worked;

ADD_MONTHS: Ư�� ��¥�� ���� ������ ���� ���� �ش� ��¥�� ��ȯ�ϴ� �Լ�
SELECT ADD_Months('2022, 01, 01', 8) FROM dual;

NEXT_DAY: ������ ������ ���� ��¥
SELECT NEXT_DAY('2024.03.12','������') FROM dual;
1(�Ͽ���) ~ 7(�����)
SELECT NEXT_DAY('2024-03-12', 2) FROM dual;

LAST_DAY: ���� ������ ��
SELECT LAST_DAY('2012-12-07') FROM dual;

EXTRACT: ��¥ �������� Ư���� ����, ��, ��, �ð�, ��, �� ���� ����
SELECT EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(DAY FROM SYSDATE) FROM dual;
       
[�ǽ�����]
1.��� ����� �̸��� �޿��� ǥ���Ͻÿ�. �޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� �������� ǥ���ϰ�
  �� ���̺��� SALARY�� �����Ͻÿ�.
2.��� ����� �̸�, ����, �޿�, �μ���ȣ�� ����Ͻÿ�. (�μ���ȣ �������� ����, ����� �̸��� 10�ڱ��� BOOOO****)
3.���ú��� �̹� ���� ������ �������� ���� �� ���� ���Ͻÿ�.
4.�� ����� ���� �����ȣ, �̸�, �޿� �� 15% �λ�� �޿��� ����(�ݿø�)�� ǥ���Ͻÿ�.
  �λ�� �޿����� ���̺��� New Salary�� �����Ͻÿ�.

SELECT ename, LPAD(sal, 15, '$') SALARY FROM emp;
SELECT RPAD(ename, 10, '*'), job, sal, deptno FROM emp ORDER BY deptno, sal;
SELECT LAST_DAY(SYSDATE) - SYSDATE FROM dual;
SELECT empno, ename, sal, ROUND(sal*1.15) "New Salary" FROM emp;

TO_CHAR: ���� -> ����, ��¥ -> ����
TO_NUMBER: ���� -> ����
TO_DATE: ���� -> ��¥

TO_CHAR: ���� -> ����, ��¥ -> ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM dual; --12�� ǥ���
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM dual; --24�� ǥ���

���� �ڸ����� ��ġ
SELECT TO_CHAR(1234, 9999) FROM dual;
SELECT TO_CHAR(1234, '9999') FROM dual;
SELECT TO_CHAR(1234, '0000') FROM dual;

�ڸ����� ���ڶ� -> ####
SELECT TO_CHAR(1234, 999) FROM dual;
SELECT TO_CHAR(1234, '999') FROM dual;
SELECT TO_CHAR(1234, '000') FROM dual;

���� �ڸ������� ���� �ڸ��� ����
SELECT TO_CHAR(1234, 99999) FROM dual;
SELECT TO_CHAR(1234, '99999') FROM dual;
SELECT TO_CHAR(1234, '00000') FROM dual;

�Ҽ��� �ڸ� ����
SELECT TO_CHAR(1234, 9999.99) FROM dual;
SELECT TO_CHAR(1234, '9999.99') FROM dual;
SELECT TO_CHAR(1234, '0000.00') FROM dual;

�ݿø��ؼ� �Ҽ��� ��°�ڸ����� ǥ��
SELECT TO_CHAR(25.897, 99.99) FROM dual;

�λ�� �޿��� �Ҽ��� ù°�ڸ����� ǥ��
SELECT TO_CHAR(sal*1.15, '9,999.9') FROM emp;

��ȭ ǥ��
SELECT TO_CHAR(1234, '$0000') FROM dual;
���� ��ȭ ǥ��
SELECT TO_CHAR(1234, 'L0000') FROM dual;

TO_DATE: ���� -> ��¥
SELECT TO_DATE('24-03-12', 'YYYY-MM-DD') FROM dual;

�������� ���� ����
SELECT TO_DATE('24-03-12') FROM dual;

TO_NUMBER: ���� -> ����
SELECT TO_NUMBER('100', 999) FROM dual;

�������� ���� ����
SELECT TO_NUMBER('100') FROM dual;

NVL(value1, value2): value1�� NULL�̸� value2�� ����. value1�� value2�� �ڷ����� ��ġ�ؾ� ��.
SELECT ename, sal, comm, (sal + comm)*12 FROM emp;
SELECT ename, sal, NVL(comm, 0), (sal + NVL(comm, 0))*12 FROM emp;
SELECT ename, NVL(TO_CHAR(comm),'No Comission') FROM emp;

NVL2(value1, value2, value3): value1�� null���� ��.
                              null�̸� value3, null�� �ƴϸ� value2 ���.
                              �ڷ����� ��ġ���� �ʾƵ� ��.
                              
SELECT NVL2(comm, 'commission', 'no commission') FROM emp;

NULLIF(value1, value2): �� ���� ���� ��ġ�ϸ� NULL, �� ���� ���� ��ġ���� ������ value1 ���.
SELECT NULLIF(LENGTH(ename), LENGTH(job)) "NULLIF" FROM emp;

COALESCE(value1, value2, value3...): NULL�� �ƴ� ���� ���(�ڷ��� ��ġ�ؾ� ��)
SELECT comm, sal, COALESCE(comm, sal, 0)FROM emp;
SELECT comm, mgr, sal, COALESCE(comm, mgr, sal) FROM emp;

CASE �÷� WHEN �񱳰� THEN �����
         WHEN       THEN
         (ELSE �����)
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

DECODE: ���� �񱳸� ����, ����Ŭ ����
        DECODE(�÷�, �񱳰�, ��ȯ��,
                    �񱳰�, ��ȯ��,
                    ��ȯ��)
                    
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

[�ǽ�����]
1.����̸�, ����, ���ް� Ŀ�̼��� ���� ���� �÷��� �Ǳ޿� ��� �ؼ� ����Ͻÿ�.
  ��, NULL���� ��Ÿ���� �ʰ� �ۼ��Ͻÿ�.
2.���ް� Ŀ�̼��� ��ģ �ݾ��� 2,000 �̻��� �޿��� �޴� ����� �̸�, ����, ����, Ŀ�̼�, ��볯¥�� ����Ͻÿ�.
  ��, ��볯¥�� 1980-12-17 ���·� ����Ͻÿ�.

SELECT ename, sal, sal+NVL(comm, 0) "�Ǳ޿�" FROM emp;
SELECT ename, job, sal, comm, TO_CHAR(hiredate, 'YYYY-MM-DD') hiredate FROM emp WHERE sal+NVL(comm, 0) >= 2000;

�׷��Լ�: �� ���� ������ �����Ͽ� �׷캰�� �ϳ��� ����� ����

AVG(): NULL�� ������ ��� ������ ����� ��ȯ, NULL���� ��� ��꿡�� ���õ�
SELECT ROUND(AVG(sal)) FROM emp;

COUNT(): NULL�� ������ ���� ���� ��� ���ڵ��� ���� ��ȯ.
         COUNT(*)�� ������ ����ϸ� NULL�� ��꿡 ����
SELECT COUNT(empno) FROM emp;
SELECT COUNT(comm) FROM emp;
SELECT COUNT(*) FROM emp;

MAX(): ���ڵ� ���� �ִ� ���� �� �� ���� ū ���� ��ȯ
SELECT MAX(sal) FROM emp;
SELECT MAX(ename) FROM emp;
SELECT MAX(hiredate) FROM emp;

MIN(): ���ڵ� ���� �ִ� ���� �� �� ���� ���� ���� ��ȯ
SELECT MIN(sal) FROM emp;
SELECT MIN(ename) FROM emp;
SELECT MIN(hiredate) FROM emp;

SUM(): ���ڵ���� �����ϰ� �ִ� ��� ���� ���Ͽ� ��ȯ
SELECT SUM(sal) FROM emp;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp WHERE deptno=10;

SELECT COUNT(*) FROM emp WHERE deptno=20;

SELECT MAX(sal) FROM emp WHERE deptno=30;

GROUP BY: SELECT���� �����Լ� ����� ���� �÷��� ������ �� ����.
          ���� �÷��� ������ ��쿡�� �ݵ�� GROUP BY ���� ������ �÷��� ����.
          
SELECT * FROM emp ORDER BY deptno;
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno;

�μ����� ����� ���ϱ�
SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno ORDER BY deptno;

���� ������ GROUP BY �� ����ϱ�
SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job ORDER BY deptno;

�׷��Լ��� ����� �߸��� Query
[���� �߻�]
SELECT deptno, AVG(sal) FROM emp WHERE AVG(sal) >= 2000 GROUP BY deptno;
--WHERE���� �׷��Լ��� �̿��ؼ� ������ üũ�ϸ� ���� �߻�

[���� ����]
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal) >= 2000;

�μ����� �ִ�޿��� ���ϴµ� 3000�� �ʰ��� �ִ�޿� ���ϱ�
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno HAVING MAX(sal) > 3000;

�׷� �Լ� ��ø
SELECT MAX(AVG(sal)) FROM emp GROUP BY deptno;

�б⺰�� �Ի��� ����� ��
SELECT TO_CHAR(hiredate, 'Q') quarter, COUNT(empno) FROM emp
GROUP BY TO_CHAR(hiredate, 'Q')
ORDER BY quarter;

[�ǽ�����]
1.��� ����� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ǥ���Ͻÿ�.
  �� ���̺��� ���� maximum, minimun, sum �� average�� �����ϰ� ����� ������ �ݿø��ϰ� ���ڸ� ������ ,�� ����Ͻÿ�.
2.�޿��� Ŀ�̼��� ���� �ݾ��� �ְ�, ����, ��ձݾ��� ���Ͻÿ�.
  ��� �ݾ��� �Ҽ��� ù°�ڸ����� ǥ���Ͻÿ�.
3.������ ������ ������ ��� ���� ǥ���Ͻÿ�. (������ ��� ���� ���Ͻÿ�.)
4.30�� �μ��� ������� ���Ͻÿ�.
5.������ �ְ� ������ ���ϰ� ����, �ְ� ������ ����Ͻÿ�.
6.20�� �μ��� �޿� �հ踦 ���ϰ� �޿� �հ� �ݾ��� ����Ͻÿ�.
7.�μ����� ���޵Ǵ� �ѿ��޿��� �ݾ��� 9,000 �̻��� �޴� ������� �μ���ȣ, �ѿ����� ����Ͻÿ�.
8.�������� ����� ���� ���� ����� ���ϰ� �� ��� ������ ����� 79�� �����ϴ� ����� �����ֽÿ�.
  
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

9.������ �ѿ����� ����ϴµ� ������ 'MANAGER'�� ������� �����ϰ� �ѿ����� 5,000���� ���� ������ �ѿ��޸� ����Ͻÿ�.
10.�������� ����� ���� 4�� �̻��� ������ �ο����� ����Ͻÿ�.

SELECT job, SUM(sal) FROM emp WHERE job <> 'MANAGER' GROUP BY job HAVING SUM(sal) > 5000;
SELECT job, SUM(sal) FROM emp GROUP BY job HAVING job!='MANAGER' AND SUM(sal) > 5000;

SELECT job, COUNT(*) FROM emp GROUP BY job HAVING COUNT(*) >= 4;

�м��Լ�
RANK(): ������ ǥ���� �� ����ϴ� �Լ�
RANK(���ǰ�) WITHIN GROUP (ORDER BY ���ǰ� �÷���): Ư�� �������� ���� Ȯ���ϱ�
(����) RANK �ڿ� ������ �����Ϳ� ORDER BY �ڿ� ������ �����ʹ� ���� �÷��̾�� ��

SELECT RANK('SMITH') WITHIN GROUP (ORDER BY ename DESC) "RANK" FROM emp;

SELECT * FROM emp ORDER BY ename;

RANK() OVER(ORDER BY �÷���): ��ü���� ����
������� empno, ename, sal, �޿� ������ ���
SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) FROM emp;

10�� �μ��� ���� �������� ����� �̸�, �޿�, �ش� �μ� ���� �޿� ������ ���
SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) "RANK" FROM emp WHERE deptno=10;

emp���̺��� ��ȸ�Ͽ� ���, �̸�, �޿�, �μ���ȣ, �μ��� �޿� ������ ���
SELECT empno, ename, sal, deptno, RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) "RANK" FROM emp;

emp ���̺��� ���� �μ� ���� job���� �޿� ����, empno, ename, sal, deptno, job�� ���
SELECT empno, ename, sal, deptno, job, RANK() OVER(PARTITION BY deptno, job ORDER BY sal DESC) "RANK" FROM emp;


JOIN: �� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���
      ���� �� �̻��� ����� ����� �� PRIMARY KEY �� FPREIGN KEY ���� ����Ͽ� ����
      �� ���� ���̺��� SELECT ���� �ȿ��� �����Ϸ��� ��� �ϳ��� �÷��� �� �� ���̺� ���̿��� �����Ǿ�� ��
      
Cartesian Product(īƼ�� ��): �˻��ϰ��� �ߴ� ������ �� �ƴ϶� ���ο� ���� ���̺���� ��� �����Ͱ� ��ȯ�Ǵ� ����
SELECT * FROM emp, dept;

[Oracle ����]
���� ����(Equi JOIN): �������� =(����) ���ǿ� ���Ͽ� ������ �̷����
SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno;

SELECT emp.ename, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;

���̺� �˸��ƽ� �ο��ϱ�
SELECT e.ename, d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;

�÷����� ȣ���� �� ���̺�� �Ǵ� ���̺� �˸��ƽ��� ����
SELECT ename, dname, d.deptno FROM emp e, dept d WHERE e.deptno = d.deptno;

�߰����� ���� ����ϱ�
ALLEN�� �ٹ��ϴ� �μ��� �̸��� ��� �̸��� ���� ����Ͻÿ�.
SELECT e.ename, d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND e.ename='ALLEN';

3000�̻� 4000������ �޿��� �޴� ����� �̸��� �޿�, �μ����� ����Ͻÿ�.
SELECT ename, sal, dname dept FROM emp e, dept d WHERE e.deptno = d.deptno AND sal BETWEEN 3000 AND 4000;


�񵿵� ����(Non Equi Join): ���̺��� � column�� Join�� ���̺��� column�� ��ġ���� ���� �� ����ϰ�
                          ���� ������ ����(=) �̿��� �����ڸ� ����
                          (between and, is null, in)
                          
����̸�, �޿�, �޿���� ���ϱ�(emp, salgrade ���̺� �̿�)
SELECT e.ename, e.sal, s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

SELF JOIN: ������ ���̺� ����
��� �̸��� �ش� ����� ������ �̸� ���ϱ�(�����ڰ� ���� ��� ����)

SELECT e.ename ����̸�, m.ename �������̸� FROM emp e, emp m WHERE e.mgr = m.empno;

�ܺ� ����(Outer Join): ���� ���ο��� ������ ���� ������ �����ִ� ����.
                      Equi Join ������� �Ѱ��� �������� ������ �����Ϸ� �ϴ� �� ���� ���̺��� �� �� �÷����� ����� ���� ���ٸ�
                      ���̺�κ��� �����͸� ��ȯ���� �ʴ´ٴ� ��.
                      ���������� ���� ������ �������� ���ϴ� ����� ���� ���� Outer Join�� ���.
                      
������ ���� ǥ���ϱ� ���ؼ� ������ ���� �ִ� ���̺��� �ݴ� ���̺��� ���� ���ǿ� (+) ���
SELECT DISTINCT(e.deptno), d.deptno FROM emp e, dept d WHERE e.deptno(+)=d.deptno;

SELECT e.ename ����̸�, m.ename �������̸� FROM emp e, emp m WHERE e.mgr=m.empno(+);

[�ǽ�����]
1.��� ����� �̸�, �μ���ȣ, �μ��̸��� ǥ���Ͻÿ�.(emp, dept)
2.������ MANAGER�� ����� ������ �̸�, ����, �μ���, �ٹ��� ������ ����Ͻÿ�.(emp, dept)
3.Ŀ�̼��� �ް� �޿��� 1,600�̻��λ���� ����̸�, �޿�, �μ���, �ٹ����� ����Ͻÿ�.

SELECT e.ename, d.deptno, d.dname FROM emp e, dept d WHERE e.deptno=d.deptno;
SELECT e.ename, e.job, d.dname, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.job='MANAGER';
SELECT e.ename, e.sal, d.dname, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.comm IS NOT NULL AND e.sal >= 1600;

4.�ٹ����� CHICAGO�� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� ǥ���Ͻÿ�.
5.�ٹ������� �ٹ��ϴ� ����� ���� 5�� ������ ���, �ο��� ���� ���� ������ �����Ͻÿ�.
 (�ٹ� �ο��� 0���� ���� ǥ��)
6.����� �̸� �� ��� ��ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ� ������ �� ���̺���
 employee, emp#, manager, mgr#�� �����Ͻÿ�. (�����ڰ� ���� ��� �����)
7.�����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ǥ���ϰ�
 �� ���̺��� ���� employee emp hired, manager, mgr hired�� �����Ͻÿ�.
 (�����ڰ� ���� ��� �����)
 
 SELECT e.ename, e.job, d.deptno, d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND d.loc = 'CHICAGO';
 SELECT d.loc, COUNT(e.empno) members FROM emp e, dept d WHERE e.deptno(+)=d.deptno GROUP BY d.loc HAVING COUNT(d.loc) < 5 ORDER BY members;
 SELECT e.ename employee, e.empno "emp#", m.ename manager, e.mgr "mgr#" FROM emp e, emp m WHERE e.mgr=m.empno;
 SELECT e.ename employee, e.hiredate "emp hired", m.ename manager, m.hiredate "mgr hired" FROM emp e, emp m WHERE e.mgr=m.empno AND e.hiredate < m.hiredate;
  
[ǥ�� SQL]
���� ����(Inner Join)
SELECT emp.ename, dept.deptno FROM emp INNER JOIN dept ON emp.deptno=dept.deptno;

SELECT emp.ename, dept.deptno FROM emp JOIN dept ON emp.deptno=dept.deptno;

SELECT e.ename, d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno;

�� �� ���̺��� ���� �÷��� �˸��ƽ��� ������ �� ����
SELECT ename, dname, d.deptno FROM emp e JOIN dept d ON e.deptno=d.deptno;

ON���� JOIN ������ ����ϰ� WHERE�� �ΰ� ������ ���
SELECT e.ename, d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.ename = 'ALLEN';

���� JOIN ���ǿ� ���� �÷��� �̸��� ���ٸ� USING���� ����Ͽ� ���� ������ ������ �� ����
(����)USING(�÷���) ���� ����� �÷����� ȣ���� ���� ���̺�� �Ǵ� �˸��ƽ��� ����ؼ� ȣ�� �Ұ�

SELECT e.ename, d.deptno FROM emp e JOIN dept d USING(deptno);
SELECT e.ename, deptno, d.dname FROM emp e JOIN dept d USING(deptno);

SELECT ename, deptno, dname FROM emp JOIN dept USING(deptno);

SELECT e.ename, deptno FROM emp e JOIN dept d USING(deptno) WHERE e.ename='ALLEN';

SELF JOIN
��� �̸��� �ش� ����� ������ �̸� ���ϱ�(�����ڰ� ���� ����� ����)
SELECT e.ename name, m.ename manager_name FROM emp e JOIN emp m ON e.mgr=m.empno;

�ܺ� ����(OUTER JOIN)
������ ���� ���� ǥ��
SELECT DISTINCT(e.deptno), d.deptno FROM emp e RIGHT OUTER JOIN dept d ON e.deptno=d.deptno;

����̸��� �ش� ����� ������ �̸� ���ϱ�(������ ���� ����� ǥ��)
SELECT e.ename name, m.ename manager_name FROM emp e LEFT OUTER JOIN emp m ON e.mgr=m.empno;

[�ǽ�����]
1.��� ����� �̸�, �μ���ȣ, �μ��̸�, �ٹ����� ǥ���Ͻÿ�. (emp, dept)
2.������ SALESMAN�� ����� ������ �̸�, ����, �μ���, �ٹ��� ������ ����Ͻÿ�. (emp, dept)
3.Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, �޿�+Ŀ�̼�, �޿������ ����ϴµ�
  ������ �÷����� "�����ȣ", "�̸�", "����", "�Ǳ޿�", "�޿����"���� ����Ͻÿ�.
  ��, Ŀ�̼��� null�� ���� �����ϰ� ���(emp, salgrade, �Ǳ޿��� �޿���� ���ϱ�)

SELECT e.ename, d.deptno, d.dname, d.loc FROM emp e JOIN dept d ON e.deptno=d.deptno;
SELECT e.ename, e.job, d.dname, d.loc FROM emp e JOIN dept d USING(deptno) WHERE e.job='SALESMAN';

SELECT e.empno �����ȣ, e.ename �̸�, e.sal*12 ����, e.sal+e.comm �Ǳ޿�, s.grade �޿����
FROM emp e JOIN salgrade s ON e.sal+e.comm BETWEEN s.losal AND s.hisal;

4.10�� �μ����� �ٹ��ϴ� ������� �μ���ȣ, �μ��̸�, ����̸�, ����, �޿������ ����Ͻÿ�. (emp, dept, salgrade)

[����Ŭ ����]
SELECT e.ename, d.deptno, d.dname, e.sal, s.grade
FROM dept d, emp e, salgrade s WHERE d.deptno=e.deptno AND e.sal BETWEEN s.losal AND s.hisal AND e.deptno=10;

[ǥ�� SQL]
SELECT e.ename, d.deptno, d.dname, e.sal, s.grade 
FROM emp e JOIN dept d ON e.deptno=d.deptno JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal WHERE e.deptno=10;


���տ�����

UNION: ������ �ߺ��� ����
       UNION�� �� ���̺��� ������ ��Ÿ���� ���ս�Ű�� �� ���̺��� �ߺ����� ���� ������ ��ȯ
SELECT deptno FROM emp
UNION
SELECT deptno FROM dept;

UNION ALL: UNION�� ������ �� ���̺��� �ߺ��Ǵ� ������ ��ȯ
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept;

INTERSECT: �� ���� ���� �� ����� ���� ��ȯ
SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

MINUS: ù��° SELECT���� ���� ��ȯ�Ǵ� �� �߿���
       �ι�° SELECT���� ���� ��ȯ�Ǵ� ���� �������� �ʴ� ����� ������
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;


SUBQUERY: �ٸ� �ϳ��� SQL������ ���� NESTED�� SELECT����
SELECT job FROM emp WHERE empno=7369;
SELECT empno, ename, job FROM emp WHERE job='CLERK'
-> ���� �ΰ��� ������ ���������� ����ؼ� �ۼ�
SELECT empno, ename, job FROM emp WHERE job = (SELECT job FROM emp WHERE empno=7369);

7698�� �޿����� ���� �޿��� �޴� ������� �����ȣ, ����̸�, �޿��� ����Ͻÿ�.
SELECT empno, ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE empno=7698); 

������ ��������: �ϳ� �̻��� ���� ��ȯ�ϴ� ��������

IN �������� ���
�μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ����� ������ ����Ͻÿ�
SELECT MIN(sal) FROM emp GROUP BY deptno;
SELECT * FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

ANY �������� ���
ANY �����ڴ� ���������� ����� �� ��� �ϳ��� ���̶� ������ �Ǹ� ������� ��ȯ

SELECT sal FROM emp WHERE job = 'SALESMAN';
SELECT ename, sal FROM emp WHERE sal>1250 OR sal>1500 OR sal>1600;
->�� ������ ���������� �ۼ�
SELECT ename, sal FROM emp WHERE sal > ANY(SELECT sal FROM emp WHERE job = 'SALESMAN');

ALL �������� ���
���������� ����� ��� ���� ��ġ
SELECT sal FROM emp WHERE deptno=20;
SELECT empno, ename, sal, deptno FROM emp WHERE sal>800 AND sal>2975 AND sal>3000;
->�� ������ ���������� �ۼ�
SELECT empno, ename, sal, deptno FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE deptno=20);

���߿� ��������
���� ������ ����� �� �� �̻��� �÷����� ��ȯ�Ǿ� ���� ������ �����ϴ� ����

SELECT empno, ename, sal, deptno FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE deptno=30);

--�̷��� �ϸ� �ȵɱ�?
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT sal FROM emp WHERE deptno=30);

�μ����� ���� �޿��� ���� �޴� ����� ������ ���
�μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ��� ������ ���

SELECT empno, ename, sal, deptno FROM emp WHERE (deptno, sal) IN (SELECT deptno, MIN(sal) FROM emp GROUP BY deptno);
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

--�̷��� �ϸ� �ȵɱ�?
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

�ζ��κ�: ���� ������ FROM���� ���� ������ �̿��ϴ� ���

�޿��� 20�� �μ��� ��� �޿����� ���� �޿��� �޴� ����� �����ȣ, �̸�, �μ��� ���

SELECT empno, ename, deptno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno=20);

SELECT e.empno, e.ename, d.dname FROM (
        SELECT empno, ename, deptno FROM emp 
        WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno=20)) e JOIN dept d ON e.deptno=d.deptno;

SELECT e.empno, e.ename, d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno=20);

�μ����� �ѱ޿��� ����ϴµ� �μ���ȣ, �μ���, �ѱ޿��� ����Ͻÿ�.
SELECT deptno, dname, total 
FROM dept JOIN (SELECT deptno, SUM(sal) total FROM emp GROUP BY deptno) USING(deptno);

��Į�� ��������
��Į���� ���� ���� �ǹ���
������� ���� ��, ���� ���� ��Į������ ��ȯ��
���� ������� �������̰ų� ���߿��̶�� DBMS�� �� �� ��� ��, ��� ���� ����ؾ� �ϴ��� �� �� ���� ������ ���
SELECT deptno, (SELECT dname FROM dept WHERE deptno=e.deptno), SUM(sal) FROM emp e GROUP BY deptno;

[�ǽ�����]
1."BLAKE"�� ���� �μ��� �ִ� ������� �̸��� �Ի����� ���ϴµ� "BLAKE"�� �����ϰ� ����Ͻÿ�.
SELECT ename, hiredate, deptno FROM emp  WHERE deptno IN(SELECT deptno FROM emp WHERE ename = 'BLAKE') AND ename != 'BLAKE';

2.��ձ޿����� ���� �޿��� ���� ������� �����ȣ, �̸�, ������ ����ϴµ� ������ ���� ��� ������ ����Ͻÿ�.
SELECT empno, ename, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp) ORDER BY sal DESC;

3.10�� �μ����� �޿��� ���� ���� �޴� ����� ������ �޿��� �޴� ����� �̸��� ������ ����Ͻÿ�.
SELECT ename, sal, deptno FROM emp WHERE sal = (SELECT MIN(sal) FROM emp WHERE deptno=10);


4.(�μ��� ������� ���ϰ�) ������� 3�� ������ �μ��� �μ���� ������� ����Ͻÿ�.
[MY ANSWER]
SELECT d.dname, COUNT(e.empno) members 
FROM dept d LEFT OUTER JOIN emp e ON d.deptno=e.deptno 
GROUP BY d.dname 
HAVING COUNT(e.empno) <= 3;
[�ζ��κ�]
SELECT a.dname, b.cnt 
    FROM dept a, (SELECT deptno, COUNT(empno) cnt FROM emp GROUP BY deptno) b 
    WHERE a.deptno=b.deptno AND b.cnt <= 3;
[����]
SELECT d.dname, COUNT(e.empno) cnt 
FROM emp e, dept d WHERE e.deptno=d.deptno 
GROUP BY d.dname 
HAVING COUNT(e.empno) <= 3;

5.�����ȣ�� 7844�� ������� ���� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
[MY ANSWER]
SELECT ename, hiredate FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE empno=7844);

6.���ӻ��(mgr)�� KING�� ��� ����� �̸��� �޿��� ����Ͻÿ�.
[MY ANSWER]
SELECT e.ename, e.sal FROM emp e, emp m WHERE e.mgr=m.empno AND m.ename='KING';
[IN CLASS]
SELECT ename, sal FROM emp WHERE mgr IN(SELECT empno FROM emp WHERE ename='KING');

7.20�� �μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ����� �̸��� �μ���, �޿�, �޿������ ����Ͻÿ�.
[MY ANSWER]--����Ŭ ����
SELECT e.ename, d.dname, e.sal, s.grade 
FROM emp e, dept d, salgrade s 
WHERE e.sal BETWEEN s.losal AND s.hisal AND e.deptno=d.deptno
AND e.sal = (SELECT MAX(sal) FROM emp GROUP BY deptno WHERE deptno=20);
[ǥ��SQL]
SELECT e.ename, d.dname, e.sal, s.grade
FROM emp e JOIN dept d
ON e.deptno=d.deptno
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.sal=(SELECT MAX(sal) FROM emp WHERE deptno=20);


8.�ѱ޿�(sal+comm)�� ��� �޿����� ���� �޿��� �޴� ����� �μ���ȣ, �̸�, �ѱ޿�, Ŀ�̼��� ����Ͻÿ�.
  (Ŀ�̼��� ��(O), ��(X)�� ǥ���ϰ� �÷����� "comm����"�� ���)
[MY ANSWER] --����
SELECT deptno, ename, sal, sal+NVL(comm,0) �ѱ޿�, NVL2(comm, 'X', 'O') comm���� 
FROM emp 
WHERE sal+NVL(comm,0) > (SELECT AVG(sal+NVL(comm,0)) FROM emp);
[IN CLASS1]
SELECT deptno, ename, sal, sal+NVL(comm,0) �ѱ޿�,
       CASE WHEN comm IS NOT NULL THEN 'O'
       ELSE 'X'
       END comm����
FROM emp
WHERE sal+NVL(comm, 0) > (SELECT AVG(sal) FROM emp); --�޿����� ����� ���ϴ� ��, �ѱ޿����� ����� ���ϴ� �� �Ѵ� ����
[IN CLASS2]
SELECT deptno, ename, sal, sal+NVL(comm,0) �ѱ޿�,
       NVL2(comm, 'O', 'X') comm����
FROM emp
WHERE sal+NVL(comm, 0) > (SELECT AVG(sal) FROM emp);
  
9.CHICAGO �������� �ٹ��ϴ� ����� ��� �޿����� ���� �޿��� �޴� ����� �̸��� �޿�, �������� ����Ͻÿ�.
[MY ANSWER] --����
SELECT e.ename, e.sal, d.loc 
FROM emp e, dept d WHERE e.deptno=d.deptno 
AND e.sal > (SELECT AVG(sal) 
             FROM emp 
             WHERE d.loc='CHICAGO');
[IN CLASS1] --���� ���
SELECT e.ename, e.sal, d.loc 
FROM emp e, dept d WHERE e.deptno=d.deptno
AND e.sal > (SELECT AVG(e.sal) 
             FROM emp e, dept d 
             WHERE e.deptno=d.deptno AND d.loc='CHICAGO');
[IN CLASS2] --�������� ���
SELECT e.ename, e.sal, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno
AND e.sal > (SELECT AVG(sal) 
             FROM emp 
             WHERE deptno IN(SELECT deptno 
                             FROM dept 
                             WHERE loc='CHICAGO'));
--CHICAGO�� ����ũ�� ���� �ƴϱ� ������ IN ������ ���

10.Ŀ�̼��� ���� ����� �� ������ ���� ���� ����� �̸��� �޿������ ����Ͻÿ�.
[MY ANSWER] --�������� ���ư�
SELECT e.ename, s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal
AND e.empno = (SELECT empno FROM emp WHERE sal = (SELECT MAX(sal) FROM emp WHERE comm IS NULL));
[IN CLASS]
SELECT e.ename, s.grade 
FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal
AND e.sal = (SELECT MAX(sal) 
             FROM emp 
             WHERE comm IS NULL);
--�ٵ� ���⼭ ���� Ŀ�̼��� �ִ� ����� ������ 5000�� ����� �־��ٸ� �߸� �Ǵ°� �ƴѰ�?

11.SMITH�� ���ӻ��(mgr)�� �̸��� �μ���, �ٹ������� ����Ͻÿ�.
[MY ANSWER] --����
SELECT e.ename, d.dname, d.loc FROM emp e, dept d, emp m 
WHERE e.deptno=d.deptno 
AND e.mgr = m.empno
AND e.empno = (SELECT mgr FROM emp WHERE ename='SMITH');
[IN CLASS]
SELECT e.ename, d.dname, d.loc
FROM emp e JOIN dept d
USING(deptno)
WHERE e.empno IN(SELECT mgr FROM emp WHERE ename='SMITH'); --SMITH�� �����̸Ӹ�Ű�� �ƴϱ� ������ IN ������ ���

12.ALLEN���� �޿��� ���� �޴� ��� �߿��� �Ի����� ���� ���� ����� ������ ��¥�� �Ի��� ����� �̸��� �Ի���, �޿��� ����Ͻÿ�.
[MY ANSWER] --�������� ���ư�
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
--ALLEN�� �����̸Ӹ�Ű�� �ƴϱ� ������ �������� ����ؾ���
--��� ALLEN�� �޿����� ���ƾ��ϱ� ������ ALL ������ ���




INSERT��: ���̺� ���� ����

��ü ������ ����(��ü �÷� ��ý�)
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8000, 'DENNIS', 'SALESMAN', 7698, '99/01/22',1700, 200, 30);

��ü ������ ������ ���� �÷��� ���� ����
INSERT INTO emp 
VALUES (8001, 'SUNNY', 'SALESMAN', 7698, '99/03/01', 1000, 300, 30);

NULL ���� ���
���� �Էµ��� �ʴ� �÷��� ����
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, deptno)
VALUES (8003, 'PETER', 'CLERK', 7698, '22/11/06', 1700, 20);

���� �Էµ��� �ʴ� �÷��� �������� �ʾ��� ���
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8004, 'ANNIE', 'CLERK', 7698, '22/11/06', 1800, NULL, 30);

��¥�� ����
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8005, 'MICHAEL', 'CLERK', 7698, TO_date('22/11/06', 'YY/MM/DD'), 1800, NULL, 30


UPDATE��: �� ������ ������ ����
UPDATE emp SET mgr=7900 WHERE empno=8000;
UPDATE emp SET ename='MARIA', sal=2500, comm=500 WHERE empno=8000;

WHERE���� ������� ������ ��ü ���� �����͸� ����
UPDATE emp SET ename='KINGKONG';);

ROLLBACK;

DELETE��: ���� ����
DELETE FROM emp WHERE empno=7369;

WHERE���� ������� ������ ��� ���� ����
DELETE FROM emp;

ROLLBACK;

�����ͺ��̽� Ʈ�����
Ʈ������� ������ ó���� �� ����
����Ŭ �������� �߻��ϴ� SQL������ �ϳ��� ������ �۾� �����̸�, 
�����ϰų� �����ϴ� �Ϸ��� SQL���� Ʈ������̶�� �� �� ����
Ʈ������� �����͸� �ϰ��ǰ� �����ϴ� DML �������� ������

�����ͺ��̽� ��ü

���̺�: �⺻ ���� ������ ��� ���� ����
���̺��� �⺻���� ������ ���� ����
���ڵ�� �÷����� ����
���ڵ�(record/row): ���̺��� �����ʹ� �࿡ ����
�÷�(column): ���̺��� �� �÷��� �����͸� ������ �� �ִ� �Ӽ��� ǥ��
 
�̸� ���� ��Ģ
-���ڷ� �����ؾ� ��
-1~30�ڱ��� ����
-A~Z,a~z,0~9,_,$,#�� �����ؾ� ��
-������ �����(����)�� ������ �ٸ� ��ü�� �̸��� �ߺ����� �ʾƾ� ��
-����Ŭ ������ ���� �ƴϾ�� ��

����ڰ� ������ ���̺��� �̸�
SELECT table_name FROM user_tables;

����ڰ� ������ ���� ��ü ����
SELECT DISTINCT(object_type) FROM user_objects;

����ڰ� ������ ���̺�, ��, ���Ǿ� �� ������
SELECT * FROM user_catalog;

���̺��� ����
CREATE TABLE employee(
    empno NUMBER(6),
    name VARCHAR2(30) NOT NULL, --30����Ʈ(���ڼ� �ƴ�) 
                                --����Ŭxe������ �ѱ��� 3����Ʈ�� ó���ؼ� �ѱ� 10�� ���� ����
    salary NUMBER(8,2),
    hire_date DATE DEFAULT SYSDATE,
    CONSTRAINT employee_pk PRIMARY KEY(empno) --employee_pk: ����Ŭ���� ����ϴ� �ĺ���
);

INSERT INTO employee (empno,name,salary)
VALUES (100, 'ȫ�浿', 1000.23);
COMMIT;

SELECT * FROM employee;

���̺� ������ PRIMARY KEY �� FOREIGN KEY ���� ���� �߰��ϱ�
CREATE TABLE suser (
    id VARCHAR2(20),
    name VARCHAR2(30),
    CONSTRAINT suser_pk PRIMARY KEY (id)
);

CREATE TABLE sboard(
    num NUMBER, --���̸� ���� ������ �ִ�ġ�� ������
    id VARCHAR2(20) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    CONSTRAINT sboard_pk PRIMARY KEY (num),
    CONSTRAINT sboard_fk FOREIGN KEY (id) REFERENCES suser (id) --�θ����̺�(suser)�κ��� id ����
);

INSERT INTO suser(id,name) VALUES ('dragon', 'ȫ�浿');
INSERT INTO suser(id,name) VALUES ('sky', '�ڹ���');

INSERT INTO sboard(num, id, content) VALUES (1, 'sky', '������ �ݿ���');
INSERT INTO sboard(num, id, content) VALUES (2, 'dragon', '������ �����');

�� ���� ���̺� ����
SELECT * FROM suser JOIN sboard USING(id);

COMMIT;

���̺��� ����(DDL��)
ADD ������: ���̺� ���ο� �÷��� �߰�
ALTER TABLE employee ADD (addr VARCHAR(2));

�������� �߰�
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY (empno);

MODIFY ������: ���̺��� �÷��� �����ϰų� NOT NULL �÷����� ������ �� ����
ALTER TABLE employee MODIFY salary NUMBER(10, 2) NOT NULL;

�÷��� ����
ALTER TABLE employee RENAME COLUMN salary TO sal;

���̺�� ����
RENAME employee TO employee2;

���̺��� ����
DROP TABLE employee2;

ON DELETE CASCADE
�θ� ���̺��� �÷��� �����ϸ� �ڽ� ���̺��� �ڽ� �����͸� ��� ����

CREATE TABLE s_member(
    id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(30)
);

CREATE TABLE s_member_detail(
    num NUMBER PRIMARY KEY,
    content VARCHAR2(4000) NOT NULL,
    id VARCHAR2(20) NOT NULL REFERENCES s_member (id) ON DELETE CASCADE
);

INSERT INTO s_member (id, name) VALUES ('dragon', 'ȫ�浿');
INSERT INTO s_member (id, name) VALUES ('sky', '�ڹ���');

INSERT INTO s_member_detail (num, content, id) VALUES (1, '������ �ݿ���', 'sky');
INSERT INTO s_member_detail (num, content, id) VALUES (2, '������ �����', 'sky');
INSERT INTO s_member_detail (num, content, id) VALUES (3, '�𷹴� �Ͽ���', 'sky');


DELETE FROM s_member WHERE id='sky';

COMMIT;

[�ǽ�����]
1.student��� �̸����� ���̺� ����
�÷���         id           name          age         score
������Ÿ�� VARCHAR2(10)  VARCHAR2(30)   NUMBER(3)    NUMBER(3)
���� ���� PRIMARY KEY     NOT NULL      NOT NULL     NOT NULL

2. �����͸� �Ʒ��� ���� �Է��Ͻÿ�.
id          name       age      score
dragon     ȫ�浿       21        100
sky        �念��       22        99
blue       �ڹ���       34        88

3. ������ �б�
student ���̺��� ���� �հ踦 ���Ͻÿ�.

1.
CREATE TABLE student(
    id VARCHAR2(10) PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    age NUMBER(3) NOT NULL,
    score NUMBER(3) NOT NULL
);

2.
INSERT INTO student VALUES ('dragon', 'ȫ�浿', 21, 100);
INSERT INTO student VALUES ('sky', '�念��', 22, 99);
INSERT INTO student VALUES ('blue', '�ڹ���', 34, 88);
COMMIT;

3.
SELECT SUM(score) FROM student;

��(VIEW)
�������� �ϳ� �̻��� ���̺� �ִ� �������� �κ� ����
-������ �������� �����ϱ� ����
-������ ���Ǹ� ���� �ۼ��ϱ� ����
-������ �������� �����ϱ� ����
-������ �����ͷκ��� �پ��� ����� ��� ����
*��� �������� ������� �÷�(Virtual Column)�� �����ϸ� ������ �����ϰ� ������ �����ϴ�.
����, �����ϸ� ���� ���̺� �ݿ�
������ ���� ���� ���ǰ� virtual column ������� ������ ����

VIEW ����

CREATE OR REPLACE VIEW emp10_view
AS SELECT empno id_number, ename name, sal*12 ann_salary 
   FROM emp WHERE deptno=10;
   
SELECT * FROM emp10_view;

CREATE OR REPLACE VIEW emp_info_view
AS SELECT e.empno, e.ename, e.deptno, d.loc, d.dname 
   FROM emp e, dept d WHERE e.deptno=d.deptno;

SELECT * FROM emp_info_view;

view�� ���� ������ �����ϱ�
�Ϲ������� view�� ��ȸ������ ���� �������� �Ʒ��� ���� �����͸� ������ �� ����

UPDATE emp10_view SET name='SCOTT' WHERE id_number=7839;

���� �� ������ ��� ����, ���� ���� �����ϸ� ���� ����
INSERT INTO emp10_view(id_number, name, ann_salary) VALUES(8000, 'JOHN', 19000);

SELECT * FROM emp10_view;

WITH READ ONLY: �б� ���� �並 �����ϴ� �ɼ�

CREATE OR REPLACE VIEW emp20_view
AS SELECT empno id_number, ename name, sal*12 ann_salary
   FROM emp WHERE deptno=20
WITH READ ONLY;

SELECT * FROM emp20_view;
UPDATE emp20_view SET name='SCOTT' WHERE id_number=7839;

VIEW�� ����
CREATE OR REPLACE VIEW emp10_view (id_number, name, sal, department_id)
AS SELECT empno, ename, sal, deptno
   FROM emp
   WHERE deptno=10;
   
SELECT * FROM emp10_view;

VIEW�� ����
DROP VIEW emp10_view;

������ ����
CREATE SEQUENCE test_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;
���� ���� 1�̰� 1�� �����ϰ� �ִ밪�� 100000�� �Ǵ� ������ ����

CURRVAL: ���� ���� ��ȯ
NEXTVAL: ���� ������ ���� ���� �� ��ȯ

SELECT test_seq.CURRVAL FROM dual;
SELECT test_seq.NEXTVAL FROM dual;

sboard ���̺� �����͸� ������ �� ������ Ȱ��
INSERT INTO sboard(num, id, content) VALUES (test_seq.NEXTVAL, 'sky', '���⼭�� ����');

SELECT * FROM sboard;

������ ����
START WITH�� ������ �� ����

ALTER SEQUENCE test_seq 
INCREMENT BY 5;
INSERT INTO sboard(num, id, content) VALUES (test_seq.NEXTVAL, 'sky', '���⼭�� ����');
SELECT * FROM sboard;

������ ����
DROP SEQUENCE test_seq;