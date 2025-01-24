create database homework0


use homework0


CREATE TABLE Employees (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    salary decimal(10, 2),
    hire_date date
)

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
    (1, 'Alice', 'Johnson', 101, 75000.00, '2020-02-15'),
    (2, 'Bob', 'Smith', 102, 64000.00, '2019-07-22'),
    (3, 'Charlie', 'Brown', 103, 82000.00, '2021-03-18'),
    (4, 'Diana', 'Evans', 101, 92000.00, '2018-11-05'),
    (5, 'Eve', 'Campbell', 104, 56000.00, '2022-01-10'),
    (6, 'Frank', 'Harris', 102, 72000.00, '2020-05-29'),
    (7, 'Grace', 'Lee', 103, 81000.00, '2019-09-17'),
    (8, 'Henry', 'Green', 104, 59000.00, '2021-06-01'),
    (9, 'Isabella', 'Garcia', 101, 66000.00, '2020-12-08'),
    (10, 'Jack', 'White', 102, 87000.00, '2017-08-25'),
  (11, 'Joe', 'Smith', 101, 75000.00, '2017-08-25'),
  (12, 'Lily', 'Pete', 102, 72000.00, '2017-08-25')


select * from Employees

select F.*, Z.salary as maxdatesalary, W.salary as mindatesalary, W.salary - Z.salary as diffference from (
select employee_id, max(hire_Date) as maxhiredate, min(hire_date) as minhiredate from Employees 
group by employee_id) as F
join Employees as Z on F.employee_id = Z.employee_id and F.maxhiredate = Z.hire_date
join Employees as W on F.employee_id = W.employee_id and F.minhiredate = W.hire_date


-- DDL Script for Tables
CREATE TABLE Employeess (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

CREATE TABLE Departmentss (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);

CREATE TABLE Projectss (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employeess(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projectss(ProjectID)
);

-- Puzzle 1: Create a Stored Procedure
-- Create a stored procedure that returns all employees in a given department.
-- Input: Department Name
-- Output: Employee Details
-- Insert Statements for Sample Data
-- Insert into Departments
INSERT INTO Departmentss (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Insert into Employees
INSERT INTO Employeess (EmployeeID, Name, DepartmentID, HireDate, Salary) VALUES
(101, 'Alice', 1, '2022-01-15', 60000.00),
(102, 'Bob', 2, '2021-06-20', 75000.00),
(103, 'Charlie', 3, '2020-03-01', 50000.00),
(104, 'Diana', 2, '2019-07-10', 80000.00),
(105, 'Eve', 1, '2023-02-25', 55000.00);

-- Insert into Projects
INSERT INTO Projectss (ProjectID, ProjectName, StartDate, EndDate) VALUES
(201, 'Project Alpha', '2023-01-01', '2023-12-31'),
(202, 'Project Beta', '2022-05-15', NULL),
(203, 'Project Gamma', '2021-09-01', '2022-12-31');

-- Insert into EmployeeProjects
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
(101, 201, 120),
(102, 202, 200),
(103, 203, 150),
(104, 201, 100),
(105, 202, 180);


select * from Employeess
select * from Departmentss
select * from Projectss
select * from EmployeeProjects


create procedure getemployeefromdepartment @departments varchar(60)
as 
begin
select H.*, F.DepartmentName from Employees as H
join Departmentss as F on H.department_id = F.DepartmentID
where F.DepartmentName = @departments
end


execute getemployeefromdepartment 'IT'


select H.Name, H.EmployeeID, F.DepartmentName, W.HoursWorked from Employeess as H
join Departmentss as F on H.DepartmentID = F.DepartmentID
join EmployeeProjects as W on H.EmployeeID = W.EmployeeID


select F.StartDate, F.ccc, F.www from (
select P.StartDate, P.enddate,
         count(employeeid) over (partition by projectname order by projectname) as ccc,
		 min(enddate) over (partition by projectname order by projectname) as www
from Projectss as P
join EmployeeProjects as Z on P.ProjectID = Z.ProjectID) as F