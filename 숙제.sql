1) emp ���̺��� ������ ������ ��ǥ(,)�� �����ؼ� ǥ���ϰ� �÷����� Employee and Job���� ǥ���Ͻÿ�.
SELECT ename || ', ' || job "Employee and Job" FROM emp;

2) �μ���ȣ 30(deptno)���� �ٹ��ϸ� �� 2,000�޷� ���ϸ� �޴� 81�� 5�� 1�� ������ �Ի��� ����� �̸�, �޿�, �μ���ȣ, �Ի����� ����Ͻÿ�.
SELECT ename, sal, deptno, hiredate FROM emp WHERE deptno = 30 AND sal <= 2000 AND hiredate < '81-05-01';

3) emp ���̺��� �̸��� A�� E�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT ename FROM emp WHERE ename LIKE '%A%' AND ename LIKE '%E%';

4) emp ���̺��� ����̸� �� S�� ���Ե��� ���� ����� �� �μ���ȣ�� 20�� ������� �̸��� �μ���ȣ�� ����Ͻÿ�.
SELECT ename, deptno FROM emp WHERE ename NOT LIKE '%S%' AND deptno = 20;

5) emp ���̺��� ������(mgr)�� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�.
SELECT ename, job FROM emp WHERE mgr IS NULL;

6) emp ���̺��� Ŀ�̼� �׸��� �Էµ� ������� �̸��� �޿�, Ŀ�̼��� ���Ͻÿ�.
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL;

7) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�.
SELECT LOWER(ename) FROM emp WHERE LENGTH(ename) >= 6;

8) �̸��� ���ڼ��� 6���̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� ����Ͻÿ�.
SELECT SUBSTR(LOWER(ename), 1, 3) FROM emp WHERE LENGTH(ename) >= 6;

9) �� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �� ��)�� ����Ͽ� �����̺��� MONTHS_WORKED�� �����Ͻʽÿ�. ����� ������ �ݿø��Ͽ� ǥ���ϰ� �ٹ� �� ���� �������� ������������ �����Ͻÿ�.
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) MONTHS_WORKED FROM emp ORDER BY MONTHS_WORKED;

10) emp ���̺��� �̸�(�ҹ��ڷ� ǥ��), ����, �ٹ������� ����Ͻÿ�.
SELECT LOWER(ename), job, CEIL(MONTHS_BETWEEN(SYSDATE, hiredate)/12) FROM emp;

