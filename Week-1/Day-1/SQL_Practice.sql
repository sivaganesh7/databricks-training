/* Q1. Select all columns from the Employee table. */
SELECT * FROM Employee;

/* Q2. Select only the name and salary columns from the Employee table. */
SELECT name, salary FROM Employee;

/* Q3. Select employees who are older than 30. */
SELECT * FROM Employee
WHERE age > 30;

/* Q4. Select the names of all departments. */
select name FROM Department;

/* Q5. Select employees who work in the IT department. */
select * from Employee 
where department_id = (
  Select department_id from Department where name='it'
  );


-- STRING MATCHING QUERIES
/* Q6. Select employees whose names start with 'J'. */
SELECT * FROM Employee WHERE name LIKE 'J%';

/* Q7. Select employees whose names end with 'e'. */
SELECT * FROM Employee WHERE name LIKE '%e';

/* Q8. Select employees whose names contain 'a'. */
SELECT * FROM Employee WHERE name LIKE '%a%';

/* Q9. Select employees whose names are exactly 9 characters long. */
SELECT * FROM Employee WHERE LENGTH(name) = 9;

/* Q10. Select employees whose names have 'o' as the second character. */
SELECT * FROM Employee WHERE name LIKE '_o%';

--  SECTION 3: DATE QUERIES
/* Q11. Select employees hired in the year 2020. */
SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;

/* Q12. Select employees hired in January of any year. */
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;

/* Q13. Select employees hired before 2019. */
SELECT * FROM Employee WHERE hire_date < '2019-01-01';

/* Q14. Select employees hired on or after March 1, 2021. */
SELECT * FROM Employee WHERE hire_date >= '2021-03-01';

/* Q15. Select employees hired in the last 2 years. */
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);


--  SECTION 4: AGGREGATE QUERIES
/* Q16. Select the total salary of all employees. */
SELECT SUM(salary) AS total_salary FROM Employee;

/* Q17. Select the average salary of employees. */
SELECT AVG(salary) AS avg_salary FROM Employee;

/* Q18. Select the minimum salary in the Employee table. */
SELECT MIN(salary) AS min_salary FROM Employee;

/* Q19. Select the number of employees in each department. */
select department_id, count(emp_id) from Employee 
group by  department_id;

/* Q20. Select the average salary of employees in each department. */
select department_id, avg(salary) from Employee
group by  department_id;


--  SECTION 5: GROUP BY QUERIES
/* Q21. Select the total salary for each department. */
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

/* Q22. Select the average age of employees in each department. */
SELECT department_id, AVG(age) AS avg_age
FROM Employee
GROUP BY department_id;

/* Q23. Select the number of employees hired in each year. */
select YEAR(hire_date), count(emp_id) from Employee
group by  YEAR(hire_date);

/* Q24. Select the highest salary in each department. */
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id;

/* Q25. Select the department with the highest average salary. */
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

--  SECTION 6: HAVING QUERIES
/* Q26. Select departments with more than 2 employees. */
SELECT department_id, COUNT(*) AS emp_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

/* Q27. Select departments with an average salary greater than 55000. */
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

/* Q28. Select years with more than 1 employee hired. */
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS emp_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

/* Q29. Select departments with a total salary expense less than 100000. */
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

/* Q30. Select departments with the maximum salary above 75000. */
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

--  SECTION 7: ORDER BY QUERIES
/* Q31. Select all employees ordered by their salary in ascending order. */
SELECT * FROM Employee ORDER BY salary ASC;

/* Q32. Select all employees ordered by their age in descending order. */
SELECT * FROM Employee ORDER BY age DESC;

/* Q33. Select all employees ordered by their hire date in ascending order. */
SELECT * FROM Employee ORDER BY hire_date ASC;

/* Q34. Select employees ordered by their department and then by their salary. */
SELECT * FROM Employee
ORDER BY department_id ASC, salary ASC;

/* Q35. Select departments ordered by the total salary of their employees. */
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;
