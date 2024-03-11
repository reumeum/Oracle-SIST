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

