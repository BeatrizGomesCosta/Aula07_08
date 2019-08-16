select * from  student join takes on student.ID = takes.ID;

select *  from student natural join takes;

select * from takes natural right outer join student where takes.course_id = null;

select * from (select * from student
where student.dept_name = 'comp.Sci') as st_left
natural left outer join
(select * from takes where semester = 'Spring' and year = 2009) as ta_left
union
select * 
from (select *
from student 
where student.dept_name = 'comp.Sci') as st_right
natural right outer join 
(select * from takes where semester = 'Spring' and year = 2009) as ta_right;


create view faculty as 
select ID, name, dept_name
from instructor; 

create view departament_total_salary(dept_name, total_salary) as 
select dept_name, sum(salary)
from instructor
group by dept_name; 


-- Questão 1 

select ID, name, count(sec_id) as "Number of sections"
from instructor natural left outer join teaches
group by ID, name
order by ID, name;



-- Questão 2 
select ID, name,
(select count(*) as "Number of sections"
from teaches T where T.id = I.id) as a
from instructor I;


-- Questão 3 

select count(se_id), name
from instructor natural inner join teaches natural inner join section



