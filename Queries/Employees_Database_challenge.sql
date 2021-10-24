select emp_no, first_name, last_name
from employees;

select title, from_date, to_date
from titles;

select emp_no, first_name, last_name
into retirement_info
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

select retirement_info.emp_no,
retirement_info.first_name,
retirement_info.last_name,
titles.title,
titles.from_date,
titles.to_date
into retirement_titles
from retirement_info
inner join titles
on retirement_info.emp_no = titles.emp_no
order by retirement_info.emp_no;

select emp_no, first_name, last_name, title
from retirement_titles;

select distinct on (emp_no)
emp_no,
first_name,
last_name,
title
into unique_titles
from retirement_titles
order by emp_no, to_date desc;

SELECT COUNT(title), title
into retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc;

select distinct on (e.emp_no) e.emp_no, 
e.first_name,
e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligibility
from employees as e
	inner join dept_emp as de
		on(e.emp_no = de.emp_no)
	inner join titles as ti
		on(e.emp_no = ti.emp_no)
where (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') and (de.to_date = '9999-01-01')
order by e.emp_no;