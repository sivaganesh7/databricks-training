Basic Queries
-- Q1. all columns from employee
select * from Employee;
-- Q2. only name and salary
select name, salary from Employee;
-- Q3. employees older than 30
select * from Employee where age > 30;
-- Q4. all department names
select name from Department;
-- Q5. employees in IT department
select * from Employee 
where department_id = (select department_id from Department where name = 'IT');


String Matching
-- Q6. names starting with J
select * from Employee where name like 'J%';
-- Q7. names ending with e
select * from Employee where name like '%e';
-- Q8. names containing a
select * from Employee where name like '%a%';
-- Q9. names exactly 9 characters long
select * from Employee where length(name) = 9;
-- Q10. second character is o
select * from Employee where name like '_o%';



Date Queries
-- Q11. hired in 2020
select * from Employee where year(hire_date) = 2020;
-- Q12. hired in january (any year)
select * from Employee where month(hire_date) = 1;
-- Q13. hired before 2019
select * from Employee where hire_date < '2019-01-01';
-- Q14. hired on or after march 1, 2021
select * from Employee where hire_date >= '2021-03-01';
-- Q15. hired in last 2 years
select * from Employee
where hire_date >= date_sub(curdate(), interval 2 year);



Aggregate Queries
-- Q16. total salary of all employees
select sum(salary) as total_salary from Employee;
-- Q17. average salary
select avg(salary) as avg_salary from Employee;
-- Q18. minimum salary
select min(salary) as min_salary from Employee;
-- Q19. count of employees per department
select department_id, count(*) from Employee group by department_id;
-- Q20. avg salary per department
select department_id, avg(salary) from Employee
group by department_id;



--Group By
-- Q21. total salary per department
select department_id, sum(salary) as total_salary from Employee group by department_id;
-- Q22. avg age per department
select department_id, avg(age) as avg_age from Employee group by department_id;
-- Q23. employee count per hire year
select year(hire_date), count(*) from Employee group by year(hire_date);
-- Q24. highest salary per department
select department_id, max(salary) as max_salary from Employee group by department_id;
-- Q25. department with highest avg salary
select department_id, avg(salary) as avg_salary from Employee group by department_id order by avg_salary desc limit 1;


HavingQueries
-- Q26. departments with more than 2 employees
select department_id, count(*) as emp_count from Employee
group by department_id having count(*) > 2;
-- Q27. departments with avg salary > 55000
select department_id, avg(salary) as avg_salary from Employee
group by department_id having avg(salary) > 55000;
-- Q28. years with more than 1 hire
select year(hire_date) as hire_year, count(*) as emp_count from Employee
group by year(hire_date) having count(*) > 1;
-- Q29. departments with total salary < 100000
select department_id, sum(salary) as total_salary from Employee
group by department_id having sum(salary) < 100000;
-- Q30. departments with max salary > 75000
select department_id, max(salary) as max_salary from Employee
group by department_id having max(salary) > 75000;


OrderBy Queries
-- Q31. employees ordered by salary asc
select * from Employee order by salary asc;
-- Q32. employees ordered by age desc
select * from Employee order by age desc;
-- Q33. employees ordered by hire date asc
select * from Employee order by hire_date asc;
-- Q34. ordered by department then salary
select * from Employee order by department_id asc, salary asc;
-- Q35. departments ordered by total salary
select department_id, sum(salary) as total_salary from Employee 
group by department_id order by total_salary desc;



Joins
-- Q36. employee names with their department names
select e.name as employee, d.name as department from Employee e 
join Department d on e.department_id = d.department_id;
-- Q37. project names with department names
select p.name as project, d.name as department from Project p 
join Department d on p.department_id = d.department_id;
-- Q38. employee names with their project names
select e.name as employee, p.name as project from Employee e 
join Department d on e.department_id = d.department_id join Project p on d.department_id = p.department_id;
-- Q39. all employees including those with no department
select e.name as employee, d.name as department from Employee e left join Department d on e.department_id = d.department_id;
-- Q40. all departments including those with no employees
select d.name as department, e.name as employee from Department d left join Employee e on d.department_id = e.department_id;
-- Q41. employees not assigned to any project
select e.name from Employee e left join Project p on e.department_id = p.department_id where p.project_id is null;
-- Q42. employees with project count of their department
select e.name, count(p.project_id) as project_count from Employee e 
left join Project p on e.department_id = p.department_id
group by e.emp_id, e.name;
-- Q43. departments with no employees
select d.name from Department d left join Employee e on d.department_id = e.department_id where e.emp_id is null;
-- Q44. employees in same department as John Doe
select e.name from Employee e where e.department_id = 
(select department_id from Employee 
where name = 'John Doe') and e.name != 'John Doe';
-- Q45. department name with highest avg salary
select d.name, avg(e.salary) as avg_salary from Employee e 
join Department d on e.department_id = d.department_id 
group by d.department_id, d.name order by avg_salary desc limit 1;



Nested / Subqueries
-- Q46. employee with highest salary
select * from Employee where salary = (select max(salary) from Employee);
-- Q47. employees earning above average salary
select * from Employee where salary > (select avg(salary) from Employee);
-- Q48. second highest salary
select max(salary) as second_highest from Employee where salary < (select max(salary) from Employee);
-- Q49. department with most employees
select department_id, count(*) as emp_count from Employee group by department_id order by emp_count desc limit 1;
-- Q50. employees earning more than their dept average
select e.* from Employee e where e.salary > (select avg(salary) from Employee where department_id = e.department_id);
-- Q51. 3rd highest salary (change offset for nth)
select distinct salary from Employee order by salary desc limit 1 offset 2;
-- Q52. employees older than all HR employees
select * from Employee where age > all (select e.age from Employee e 
  join Department d on e.department_id = d.department_id where d.name = 'HR');
-- Q53. departments with avg salary > 55000
select department_id from Employee group by department_id having avg(salary) > 55000;
-- Q54. employees in departments with at least 2 projects
select e.* from Employee e where e.department_id in 
(select department_id from Project group by department_id having count(*) >= 2);
-- Q55. employees hired same day as Jane Smith
select * from Employee 
where hire_date = (select hire_date from Employee where name = 'Jane Smith') and name != 'Jane Smith';



Combined / Moderate
-- Q56. total salary of employees hired in 2020
select sum(salary) as total_salary from Employee where year(hire_date) = 2020;
-- Q57. avg salary per dept ordered by avg desc
select department_id, avg(salary) as avg_salary from Employee group by department_id order by avg_salary desc;
-- Q58. depts with more than 1 employee and avg salary > 55000
select department_id from Employee group by department_id having count(*) > 1 and avg(salary) > 55000;
-- Q59. employees hired in last 2 years ordered by hire date
select * from Employee where hire_date >= date_sub(curdate(), interval 2 year) order by hire_date asc;
-- Q60. total employees and avg salary for depts with more than 2
select department_id, count(*) as total_emp, avg(salary) as avg_salary from Employee group by department_id having count(*) > 2;
-- Q61. name and salary of employees above their dept avg
select e.name, e.salary from Employee e where e.salary > (select avg(salary) from Employee where department_id = e.department_id);
-- Q62. employees hired same date as the oldest employee
select name from Employee where hire_date = (select hire_date from Employee where age = (select max(age) from Employee));
-- Q63. dept names with project count ordered by count
select d.name, count(p.project_id) as project_count from Department d 
left join Project p on d.department_id = p.department_id 
group by d.department_id, d.name order by project_count desc;
-- Q64. highest paid employee in each department
select e.name, e.department_id, e.salary from Employee e 
where e.salary = (select max(salary) from Employee where department_id = e.department_id);
-- Q65. employees older than their dept avg age
select e.name, e.salary from Employee e 
where e.age > (select avg(age) from Employee where department_id = e.department_id);
