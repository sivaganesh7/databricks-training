-- question 11
-- Find the difference between the current order amount and previous order amount.
select customer_id,
    order_id,
    order_date,
    total_amount,
    total_amount -
    lag(total_amount) over (
        partition by customer_id
        order by order_date
    ) as amount_difference
from orders;

-- question 12
-- calculate a moving average of the last 3 orders.

select
    order_id,
    order_date,
    total_amount,
    avg(total_amount) over (
        order by order_date
        rows between 2 preceding and current row
    ) as moving_average
from orders;


-- question 13
-- use ntile(4) to divide employees into salary quartiles.

select employee_id, employee_name, salary,
    ntile(4) over (
        order by salary desc
    ) as salary_quartile
from employees;

-- question 14
-- find the first order placed by each customer using row_number().

select *
from (select o.*,
        row_number() over (
            partition by customer_id
            order by order_date
        ) as rn
    from orders o
) first_orders
where rn = 1;


-- question 15
-- find the latest order placed by each customer.

select *
from (select o.*, 
        row_number() over (
            partition by customer_id
            order by order_date desc
        ) as rn
    from orders o
) latest_orders
where rn = 1;

-- question 16
-- display employee salaries along with department average salary.

select
    employee_id,
    employee_name,
    department,
    salary, avg(salary) over (
        partition by department
    ) as department_average_salary
from employees;


-- question 17
-- find employees earning above their department average salary.

select *
from (
    select
        employee_id,
        employee_name,
        department,
        salary,

        avg(salary) over (
            partition by department
        ) as department_average_salary
    from employees
) emp
where salary > department_average_salary;


-- question 18
-- use sum() over(partition by department) to calculate department payroll.

select
    employee_id,
    employee_name,
    department,
    salary,

    sum(salary) over (
        partition by department
    ) as department_payroll
from employees;

-- question 19
-- find the percentage contribution of each employee salary within their department.

select
    employee_id,
    employee_name,
    department,
    salary,
    round( 
        salary * 100.0 /
        sum(salary) over (
            partition by department
        ),
        2
    ) as salary_percentage
from employees;


-- question 20
-- use count() over() to show total number of employees alongside each row.

select
    employee_id,
    employee_name,
    department,
    salary,
    count(*) over () as total_employees
from employees;
