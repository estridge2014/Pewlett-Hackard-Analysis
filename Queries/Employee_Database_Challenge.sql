--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.

SELECT emp_no, first_name, last_name 
FROM employees;

SELECT * 
FROM employees;

--2. Retrieve the title, from_date, and to_date columns from the Titles table. 

SELECT title, from_date, to_date 
FROM titles;

--3. Create a new table using the INTO clause.

SELECT emp_no, first_name, last_name, birth_date 
INTO retirement_employee
FROM employees;

SELECT emp_no, title, from_date, to_date 
INTO retirement_title
FROM titles;

SELECT * 
FROM retirement_title;

SELECT * 
FROM retirement_employee;


--4/5. Joining retirement_employee and retirement_title tables with innerjoin.
--Filter the data on the birth_date column to retrieve the employees 
--who were born between 1952 and 1955.Then, order by the employee number.

SELECT r_e.emp_no,
     r_e.first_name,
     r_e.last_name,
     r_t.title,
	 r_t.from_date,
	 r_t.to_date
FROM retirement_employee as r_e 
INNER JOIN retirement_title as r_t
ON r_e.emp_no = r_t.emp_no
WHERE birth_date BETWEEN '1-01-1952' AND '12-31-1955'
ORDER BY emp_no 

--6. Export the Retirement Titles table from the previous step as retirement_titles.csv 
--and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT r_e.emp_no,
     r_e.first_name,
     r_e.last_name,
     r_t.title,
	 r_t.from_date,
	 r_t.to_date

FROM retirement_employee as r_e 
INNER JOIN retirement_title as r_t
ON r_e.emp_no = r_t.emp_no
WHERE birth_date BETWEEN '1-01-1952' AND '12-31-1955'
ORDER BY emp_no;  



--8. Copy the query from the Employee_Challenge_starter_code.sql 
--and add it to your Employee_Database_challenge.sql file.

-- Use Dictinct with Orderby to remove duplicate rows




--9. Retrieve the employee number, first and last name, 
--and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold 
--the most recent title of each employee.

--Documentation/examples of DISTINCT ON function: 
--https://www.sqlsplus.com/postgresql-distinct-statement/


SELECT emp_no, first_name, last_name, title 
FROM retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--15. Write another query in the Employee_Database_challenge.sql file to 
--retrieve the number of employees by their most recent job title 
--who are about to retire.

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY count DESC;


---Completed Deliverable 1

---Deliverable 2 

--1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.

SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--2.Retrieve the from_date and to_date columns from the Department Employee table.

SELECT from_date, to_date 
FROM dept_emp;

--3.Retrieve the title column from the Titles table.

SELECT title
FROM titles;

--4.Use a DISTINCT ON statement to retrieve the first occurrence of the 
--employee number for each set of rows defined by the ON () clause.

SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
birth_date
FROM employees;

--5. Create a new table using the INTO clause.


SELECT DISTINCT ON (emp_no) 
emp_no,
first_name,
last_name,
birth_date

INTO filtered_emp
FROM employees;

SELECT * 
FROM filtered_emp;

--6.Join the Employees and the Department Employee tables on the primary key.
--7.Join the Employees and the Titles tables on the primary key.

SELECT emp.emp_no,
     emp.first_name,
     emp.last_name,
     emp.birth_date,
	 d_e.from_date,
	 d_e.to_date,
	 ti.title
INTO filt_6	 
FROM filtered_emp as emp 
INNER JOIN dept_emp as d_e
ON emp.emp_no = d_e.emp_no
INNER JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (d_e.to_date='9999-01-01')
AND (emp.birth_date BETWEEN ' 1965-01-01' AND '1965-12-13')
ORDER BY emp_no;

--8/9.Filter the data on the to_date column to all the current employees, 
--then filter the data on the birth_date columns to get all the employees
--whose birth dates are between January 1, 1965 and December 31, 1965.


---^^^^^^^^^

--Deliverable 2 complete
