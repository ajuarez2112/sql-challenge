-- List employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each dept along with their dept number, dept name, employee number, last name, and first name
SELECT departments.dept_no, dept_name, employees.emp_no, last_name, first_name
FROM departments, dept_manager, employees
WHERE departments.dept_no = dept_manager.dept_no
AND employees.emp_no = dept_manager.emp_no;

-- List dept number for each employee along with their employee number, last name, first name, and department name
SELECT departments.dept_no, employees.emp_no, last_name, first_name, dept_name
FROM departments, employees, dept_emp
WHERE departments.dept_no = dept_emp.dept_no
AND employees.emp_no = dept_emp.emp_no;

-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales dept, including their employee number, last name, and first name
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in Sales and Development depts, including their employee number, last name, first name and dept name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (how many employees share each last name)
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

