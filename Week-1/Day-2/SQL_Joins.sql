-- q1 : display all students and the courses they are enrolled in
-- include students who are not enrolled in any course

select s.student_name, c.course_name
from students s
left join enrollments e on s.student_id = e.student_id
left join courses c  on e.course_id = c.course_id;


-- q2 : find all courses that currently have no students enrolled

select c.course_name
from courses c
left join enrollments e
    on c.course_id = e.course_id
where e.enrollment_id is null;


-- q3 : display all instructors and the courses they teach
-- include instructors not assigned to any course

select i.instructor_name, c.course_name
from courses c
right join instructors i
    on c.instructor_id = i.instructor_id;


-- q4 : find all courses that do not have an instructor assigned

select course_name
from courses
where instructor_id is null;


-- q5 : display all students and enrollment information

select s.student_name,
       e.enrollment_id,
       e.course_id,
       e.enrollment_date
from enrollments e
right join students s
    on e.student_id = s.student_id;


-- q6 : find students who are not enrolled in any course

select s.student_name
from students s
left join enrollments e
    on s.student_id = e.student_id
where e.enrollment_id is null;


-- q7 : display all students and enrollments
-- include unmatched rows from both tables


select s.student_name, e.enrollment_id, e.course_id
from students s
left join enrollments e on s.student_id = e.student_id
Union 
select s.student_name, e.enrollment_id, e.course_id
from students s
right join enrollments e on s.student_id = e.student_id;

-- q8 : find all courses that have never appeared in enrollments table

select c.course_name
from courses c
left join enrollments e
    on c.course_id = e.course_id
where e.course_id is null;


-- q10 : create report with student name, course name, instructor name
-- include rows even if course or instructor data is missing

select s.student_name,
       c.course_name,
       i.instructor_name
from students s
left join enrollments e
    on s.student_id = e.student_id
left join courses c
    on e.course_id = c.course_id
left join instructors i
    on c.instructor_id = i.instructor_id;


-- bonus : list every student and every course

select s.student_name,
       c.course_name
from students s
cross join courses c
order by s.student_name, c.course_name;
