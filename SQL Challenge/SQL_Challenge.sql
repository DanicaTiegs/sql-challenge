DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
	dept_no character varying,
	dept_name character varying
);

SELECT *
FROM departments;

CREATE TABLE dept_emp (
	emp_no integer,
	dept_name character varying
);

SELECT *
FROM dept_emp;

CREATE TABLE dept_manager (
	dept_no character varying,
	emp_no character varying
);

SELECT *
FROM dept_manager;

CREATE TABLE employees (
	emp_no integer,
	emp_title_id character varying,
	birth_date date, 
	first_name VARCHAR, 
	last_name VARCHAR, 
	sex VARCHAR,
	hire_date date
);

SELECT *
FROM employees;

CREATE TABLE salaries (
	emp_no integer,
	salary integer
);

SELECT * 
FROM salaries;

CREATE TABLE titles (
	title_id character varying, 
	title character varying
);

SELECT * FROM titles;

SELECT emp_no, last_name, first_name, sex FROM employees; 

SELECT emp_no, salary FROM salaries;

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e 
JOIN salaries s ON e.emp_no = s.emp_no;
	
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1985/12/31' AND '1987/01/01';

SELECT d.dept_no, d.dept_name, dm.emp_no, e.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON e.emp_no = dm.emp_no;
	
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name = 'B%';

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_name = d.dept_no
WHERE de.dept_name IN ('Sales','Development');

SELECT last_name, COUNT(last_name) OVER(PARTITION BY last_name ORDER BY last_name DESC)
FROM employees;



