--CHALLENGE 7
--Deliverable 1: The Number of Retiring Employees by Title
DROP TABLE retirement_titles CASCADE;
SELECT em.emp_no,
	   em.first_name,
	   em.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees AS em
INNER JOIN titles AS ti
ON (ti.emp_no = em.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY em.emp_no;
SELECT * FROM retirement_titles;
-- Use Dictinct with Orderby to remove duplicate rows
DROP TABLE unique_titles CASCADE;
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles;

DROP TABLE retiring_titles CASCADE;
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title;
SELECT * FROM retiring_titles;


--Deliverable 2: The Employees Eligible for the Mentorship Program
DROP TABLE mentorship_eligibility CASCADE;
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;
SELECT * FROM mentorship_eligibility;