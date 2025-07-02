1) SELECT emp_id || '-' || first_name || ' ' || last_name AS employee_info
FROM employees
WHERE emp_id = 100;
2) UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999');

3) SELECT first_name AS "First Name",
       LENGTH(first_name) AS "Name Length"
FROM employees
WHERE first_name LIKE 'A%' OR first_name LIKE 'J%' OR first_name LIKE 'M%'
ORDER BY first_name;
4) SELECT manager_id, SUM(salary) AS total_salary
FROM employees
GROUP BY manager_id;

5) SELECT year,
       GREATEST(Max1, Max2, Max3) AS highest_value
FROM TestMax;
6) SELECT *
FROM cinema
WHERE id % 2 = 1 AND description != 'boring';
7) SELECT *
FROM SingleOrder
ORDER BY CASE WHEN id = 0 THEN 1 ELSE 0 END, id;
8) SELECT COALESCE(col1, col2, col3, col4) AS first_non_null
FROM person;
Meidum Tasks:
1) SELECT
  SUBSTRING_INDEX(FullName, ' ', 1) AS Firstname,
  SUBSTRING_INDEX(SUBSTRING_INDEX(FullName, ' ', 2), ' ', -1) AS Middlename,
  SUBSTRING_INDEX(FullName, ' ', -1) AS Lastname
FROM Students;
2) SELECT *
FROM Orders o1
WHERE o1.delivery_state = 'Texas'
  AND EXISTS (
      SELECT 1
      FROM Orders o2
      WHERE o2.customer_id = o1.customer_id
        AND o2.delivery_state = 'California'
  );
3) SELECT GROUP_CONCAT(column_name ORDER BY column_name SEPARATOR ', ') AS concatenated_values
FROM DMLTable;
4) SELECT *
FROM employees
WHERE LENGTH(LOWER(first_name || last_name)) - LENGTH(REPLACE(LOWER(first_name || last_name), 'a', '')) >= 3;
5) SELECT department_id,
       COUNT(*) AS total_employees,
       ROUND(SUM(CASE WHEN DATEDIFF(CURDATE(), hire_date)/365 > 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percent_over_3_years
FROM employees
GROUP BY department_id;
6) SELECT job_description,
       MIN(spaceman_id) KEEP (DENSE_RANK FIRST ORDER BY experience_years) AS least_experienced_id,
       MAX(spaceman_id) KEEP (DENSE_RANK FIRST ORDER BY experience_years DESC) AS most_experienced_id
FROM Personal
GROUP BY job_description;
