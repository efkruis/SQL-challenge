--Question 1;  List the following details of each employee: employee number, last name, first name, sex, and salary.
--(https://www.sqlshack.com/learn-sql-join-multiple-tables/); (https://www.sqlshack.com/sql-multiple-joins-for-beginners-with-examples/)
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no

--Question 2;List first name, last name, and hire date for employees who were hired in 1986.
--(https://www.w3schools.com/sql/sql_between.asp)
SELECT employees.first_name, employees.last_name, employees.hire_date FROM employees
WHERE hire_date BETWEEN '1986/01/01' and '1986/12/31'

--Question 3; List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no

--Question 4;List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no

--Question 5; List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--(https://www.techonthenet.com/sql/and_or.php#:~:text=The%20SQL%20AND%20condition%20and,order%20to%20evaluate%20each%20condition.); (https://stackoverflow.com/questions/16179802/query-to-retrieve-all-people-with-a-last-name-starting-with-a-specific-letter)
SELECT employees.first_name, employees.last_name, employees.sex
WHERE (last_name = 'Hercules' AND last_name = 'B%')

--Question 6; List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT employees.first_name, employees.last_name, departments.dept_name, dept_emp.emp_no
FROM employees
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no

--Question 7; List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.first_name, employees.last_name, departments.dept_name, dept_emp.emp_no
FROM employees
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no

--Question 8; In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--(https://www.w3schools.com/sql/sql_ref_order_by.asp); (https://www.c-sharpcorner.com/blogs/sql-query-to-find-out-the-frequency-of-each-element-in-a-column1)
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name)DESC