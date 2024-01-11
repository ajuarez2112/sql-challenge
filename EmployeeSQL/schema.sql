-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR
);

-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR
);

-- Create employees table
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL, 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create dept_emp table
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create salaries table
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER
);
