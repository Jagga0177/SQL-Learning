1) SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
2) SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);
3) SELECT e.*
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE d.department_name = 'Sales';
4) SELECT *
FROM customers
WHERE customer_id NOT IN (
  SELECT customer_id FROM orders
);
5) SELECT *
FROM products p
WHERE price = (
  SELECT MAX(price)
  FROM products
  WHERE category_id = p.category_id
);
6) WITH avg_salaries AS (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
),
max_avg_dept AS (
  SELECT TOP 1 department_id
  FROM avg_salaries
  ORDER BY avg_salary DESC
)
SELECT e.*
FROM employees e
WHERE e.department_id = (SELECT department_id FROM max_avg_dept);

7) SELECT e.*
FROM employees e
JOIN (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) dept_avg ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary;
