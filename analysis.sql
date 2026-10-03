-- Project: Employee Data Analysis Using SQL
-- Database: Standard SQL (minor syntax adjustments may be needed by your SQL tool)

-- 1. Create tables
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 2. Insert sample data
INSERT INTO departments (department_id, department_name) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

INSERT INTO employees (emp_id, emp_name, department_id, salary) VALUES
(1, 'Rahul', 101, 50000),
(2, 'Priya', 102, 65000),
(3, 'Arjun', 101, 45000),
(4, 'Sneha', 103, 70000),
(5, 'Kiran', 102, 60000),
(6, 'Divya', 103, 55000);

-- 3. Business Question 1: Employees earning more than 55,000
SELECT emp_name, salary
FROM employees
WHERE salary > 55000;

-- 4. Business Question 2: Average salary by department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- 5. Business Question 3: Highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

-- 6. Business Question 4: Rank employees by salary, highest first
SELECT emp_name,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 7. Business Question 5: Departments with average salary above 50,000
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 50000;

-- 8. Business Question 6: Employee names with department names
SELECT e.emp_name, d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;
