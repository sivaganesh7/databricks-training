**Schema (MySQL v5.7)**

    
    -- SQL Joins Assignment Starter File
    -- Compatible with PostgreSQL
    
    DROP TABLE IF EXISTS enrollments;
    DROP TABLE IF EXISTS courses;
    DROP TABLE IF EXISTS students;
    DROP TABLE IF EXISTS instructors;
    
    CREATE TABLE instructors (
        instructor_id INT PRIMARY KEY,
        instructor_name VARCHAR(100),
        department VARCHAR(100)
    );
    
    CREATE TABLE students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(100),
        email VARCHAR(100)
    );
    
    CREATE TABLE courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(100),
        instructor_id INT NULL,
        FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
    );
    
    CREATE TABLE enrollments (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT,
        enrollment_date DATE,
        FOREIGN KEY (student_id) REFERENCES students(student_id),
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
    );
    
    -- Insert instructors
    INSERT INTO instructors VALUES
    (1, 'Sarah Connor', 'Databases'),
    (2, 'Michael Scott', 'Programming'),
    (3, 'Tony Stark', 'Cloud Computing'),
    (4, 'Bruce Wayne', 'Cyber Security');
    
    -- Insert students
    INSERT INTO students VALUES
    (1, 'Alice Johnson', 'alice@email.com'),
    (2, 'Bob Smith', 'bob@email.com'),
    (3, 'Charlie Brown', 'charlie@email.com'),
    (4, 'Diana Prince', 'diana@email.com'),
    (5, 'Ethan Hunt', 'ethan@email.com'),
    (6, 'Fiona Green', 'fiona@email.com');
    
    -- Insert courses
    INSERT INTO courses VALUES
    (101, 'SQL Basics', 1),
    (102, 'Python Fundamentals', 2),
    (103, 'Data Analytics', NULL),
    (104, 'Cloud Computing', 3),
    (105, 'Machine Learning', NULL),
    (106, 'Cyber Security', 4);
    
    -- Insert enrollments
    INSERT INTO enrollments VALUES
    (1, 1, 101, '2024-01-10'),
    (2, 1, 102, '2024-01-12'),
    (3, 2, 101, '2024-01-15'),
    (4, 3, 104, '2024-01-20'),
    (5, 4, 106, '2024-01-25');
    
    -- Notes:
    -- Student 5 and 6 are not enrolled in any course.
    -- Courses 103 and 105 have no instructor assigned.
    -- Courses 103 and 105 also have no enrollments.
    -- Instructor 4 teaches one course.
    

---

**Query #1**

    select * from students;

| student_id | student_name  | email             |
| ---------- | ------------- | ----------------- |
| 1          | Alice Johnson | alice@email.com   |
| 2          | Bob Smith     | bob@email.com     |
| 3          | Charlie Brown | charlie@email.com |
| 4          | Diana Prince  | diana@email.com   |
| 5          | Ethan Hunt    | ethan@email.com   |
| 6          | Fiona Green   | fiona@email.com   |

---
**Query #2**

    select * from enrollments;

| enrollment_id | student_id | course_id | enrollment_date |
| ------------- | ---------- | --------- | --------------- |
| 1             | 1          | 101       | 2024-01-10      |
| 2             | 1          | 102       | 2024-01-12      |
| 3             | 2          | 101       | 2024-01-15      |
| 4             | 3          | 104       | 2024-01-20      |
| 5             | 4          | 106       | 2024-01-25      |

---
**Query #3**

    select * from courses;

| course_id | course_name         | instructor_id |
| --------- | ------------------- | ------------- |
| 101       | SQL Basics          | 1             |
| 102       | Python Fundamentals | 2             |
| 103       | Data Analytics      |               |
| 104       | Cloud Computing     | 3             |
| 105       | Machine Learning    |               |
| 106       | Cyber Security      | 4             |

---
**Query #4**

    select * from instructors;

| instructor_id | instructor_name | department      |
| ------------- | --------------- | --------------- |
| 1             | Sarah Connor    | Databases       |
| 2             | Michael Scott   | Programming     |
| 3             | Tony Stark      | Cloud Computing |
| 4             | Bruce Wayne     | Cyber Security  |

---

[View on DB Fiddle](https://www.db-fiddle.com/)



**Query #1**

    select s.student_name, c.course_name
    from students s
    left join enrollments e on s.student_id = e.student_id
    left join courses c on e.course_id = c.course_id;

| student_name  | course_name         |
| ------------- | ------------------- |
| Alice Johnson | SQL Basics          |
| Alice Johnson | Python Fundamentals |
| Bob Smith     | SQL Basics          |
| Charlie Brown | Cloud Computing     |
| Diana Prince  | Cyber Security      |
| Ethan Hunt    |                     |
| Fiona Green   |                     |

---

[View on DB Fiddle](https://www.db-fiddle.com/)


**Query #2**

    select c.course_name
    from courses c
    left join enrollments e on c.course_id = e.course_id
    where e.enrollment_id is null;

| course_name      |
| ---------------- |
| Data Analytics   |
| Machine Learning |

---

[View on DB Fiddle](https://www.db-fiddle.com/)



**Query #3**

    select i.instructor_name, c.course_name
    from courses c
    right join instructors i on c.instructor_id = i.instructor_id;

| instructor_name | course_name         |
| --------------- | ------------------- |
| Sarah Connor    | SQL Basics          |
| Michael Scott   | Python Fundamentals |
| Tony Stark      | Cloud Computing     |
| Bruce Wayne     | Cyber Security      |

---

[View on DB Fiddle](https://www.db-fiddle.com/)


**Query #4**

    select course_name
    from courses
    where instructor_id is null;

| course_name      |
| ---------------- |
| Data Analytics   |
| Machine Learning |

---

[View on DB Fiddle](https://www.db-fiddle.com/)


**Query #5**

    select s.student_name, e.enrollment_id, e.course_id, e.enrollment_date
    from enrollments e
    right join students s on e.student_id = s.student_id;

| student_name  | enrollment_id | course_id | enrollment_date |
| ------------- | ------------- | --------- | --------------- |
| Alice Johnson | 1             | 101       | 2024-01-10      |
| Alice Johnson | 2             | 102       | 2024-01-12      |
| Bob Smith     | 3             | 101       | 2024-01-15      |
| Charlie Brown | 4             | 104       | 2024-01-20      |
| Diana Prince  | 5             | 106       | 2024-01-25      |
| Ethan Hunt    |               |           |                 |
| Fiona Green   |               |           |                 |

---

[View on DB Fiddle](https://www.db-fiddle.com/)



**Query #6**

    select s.student_name
    from students s
    left join enrollments e on s.student_id = e.student_id
    where e.enrollment_id is null;

| student_name |
| ------------ |
| Ethan Hunt   |
| Fiona Green  |

---

[View on DB Fiddle](https://www.db-fiddle.com/)


**Query #7**

    select s.student_name, e.enrollment_id, e.course_id
    from students s
    left join enrollments e on s.student_id = e.student_id
    Union 
    select s.student_name, e.enrollment_id, e.course_id
    from students s
    right join enrollments e on s.student_id = e.student_id;

| student_name  | enrollment_id | course_id |
| ------------- | ------------- | --------- |
| Alice Johnson | 1             | 101       |
| Alice Johnson | 2             | 102       |
| Bob Smith     | 3             | 101       |
| Charlie Brown | 4             | 104       |
| Diana Prince  | 5             | 106       |
| Ethan Hunt    |               |           |
| Fiona Green   |               |           |

---

[View on DB Fiddle](https://www.db-fiddle.com/)


**Query #8**

    select c.course_name
    from courses c
    left join enrollments e on c.course_id = e.course_id
    where e.course_id is null;

| course_name      |
| ---------------- |
| Data Analytics   |
| Machine Learning |

---

[View on DB Fiddle](https://www.db-fiddle.com/)



**Query #10**

    select s.student_name, c.course_name, i.instructor_name
    from students s
    left join enrollments e on s.student_id = e.student_id
    left join courses c on e.course_id = c.course_id
    left join instructors i on c.instructor_id = i.instructor_id;

| student_name  | course_name         | instructor_name |
| ------------- | ------------------- | --------------- |
| Alice Johnson | SQL Basics          | Sarah Connor    |
| Alice Johnson | Python Fundamentals | Michael Scott   |
| Bob Smith     | SQL Basics          | Sarah Connor    |
| Charlie Brown | Cloud Computing     | Tony Stark      |
| Diana Prince  | Cyber Security      | Bruce Wayne     |
| Ethan Hunt    |                     |                 |
| Fiona Green   |                     |                 |

---

[View on DB Fiddle](https://www.db-fiddle.com/)


**Query #11**

    select s.student_name, c.course_name
    from students s
    cross join courses c
    order by s.student_name, c.course_name;

| student_name  | course_name         |
| ------------- | ------------------- |
| Alice Johnson | Cloud Computing     |
| Alice Johnson | Cyber Security      |
| Alice Johnson | Data Analytics      |
| Alice Johnson | Machine Learning    |
| Alice Johnson | Python Fundamentals |
| Alice Johnson | SQL Basics          |
| Bob Smith     | Cloud Computing     |
| Bob Smith     | Cyber Security      |
| Bob Smith     | Data Analytics      |
| Bob Smith     | Machine Learning    |
| Bob Smith     | Python Fundamentals |
| Bob Smith     | SQL Basics          |
| Charlie Brown | Cloud Computing     |
| Charlie Brown | Cyber Security      |
| Charlie Brown | Data Analytics      |
| Charlie Brown | Machine Learning    |
| Charlie Brown | Python Fundamentals |
| Charlie Brown | SQL Basics          |
| Diana Prince  | Cloud Computing     |
| Diana Prince  | Cyber Security      |
| Diana Prince  | Data Analytics      |
| Diana Prince  | Machine Learning    |
| Diana Prince  | Python Fundamentals |
| Diana Prince  | SQL Basics          |
| Ethan Hunt    | Cloud Computing     |
| Ethan Hunt    | Cyber Security      |
| Ethan Hunt    | Data Analytics      |
| Ethan Hunt    | Machine Learning    |
| Ethan Hunt    | Python Fundamentals |
| Ethan Hunt    | SQL Basics          |
| Fiona Green   | Cloud Computing     |
| Fiona Green   | Cyber Security      |
| Fiona Green   | Data Analytics      |
| Fiona Green   | Machine Learning    |
| Fiona Green   | Python Fundamentals |
| Fiona Green   | SQL Basics          |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
