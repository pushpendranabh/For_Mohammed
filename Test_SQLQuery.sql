--Query 1 - Give me Second Highest salary from all the employee
with t as
(
select e.empName, s.salary,
	rank() over (order by s.salary desc) as rnk
from employee e
join salary s 
on e.empid = s.empid
)
select salary 
from t
where rnk = 2


--Query 2 - Give me second last lowest salary from all the employee
with t as
(
select e.empName, s.salary,
	rank() over (order by s.salary asc) as rnk
from employee e
join salary s 
on e.empid = s.empid
)
select salary 
from t
where rnk = 2


--Query 3 - Give me average salary of each Department
select d.deptName, AVG(s.salary) avg_sal from
employee e
join department d
on e.deptId = d.deptId
join salary s
on s.empId = e.empId
group by d.deptName
order by 2 desc


--Query 4 - Give me output in format as: Employee Id, Emp Name, Dept Name, Salary
select e.empId as Employee_Id,e.empName as Emp_Name, d.deptName as Dept_Name, s.salary as Salary  from
employee e
Join salary s
on s.empId = e.empId
Join department d
on e.deptId = d.deptId


--Query 5 - Give me employees which doesn’t belong to any Department
select e.empId as Employee_Id,e.empName as Emp_Name, d.deptName as Dept_Name from
employee e
Left Join department d
on e.deptId = d.deptId
where d.deptName is null


--Query 6 - Give me employees which doesn’t have manager
select e.empId as Employee_Id, e.empName as Emp_Name  from 
employee e
left join (select distinct mangerEmpId as empid from employee) emp_mngr
on e.empid = emp_mngr.empid
where e.mangerEmpId is null



