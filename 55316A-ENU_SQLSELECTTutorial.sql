--- SQL SELECT for Beginners Lab
--- Prepared for any 553XX course lab environment on www.softwaretutorialservices.com

-- Database and Table Setup Script
USE master
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'SQLSelectLab')
DROP DATABASE SQLSelectLab;
GO

CREATE DATABASE SQLSelectLab;
GO

USE SQLSelectLab;
GO

-- Create Departments Table
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName NVARCHAR(50)
);
GO

-- Create Employees Table
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
DepartmentID INT,
Salary DECIMAL(10, 2),
HireDate DATE,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Projects Table
CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName NVARCHAR(50),
DepartmentID INT,
Budget DECIMAL(10, 2),
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

-- Insert Sample Data for Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'Sales'), (2, 'Engineering'), (3, 'HR'), (4, 'Marketing'), (5, 'Legal');

-- Insert Sample Data for Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate)
VALUES
(1, 'Alice', 'Johnson', 1, 70000, '2018-04-23'),
(2, 'Bob', 'Smith', 2, 90000, '2019-06-15'),
(3, 'Carol', 'Davis', 2, 85000, '2020-02-28'),
(4, 'Dan', 'Brown', 3, 60000, '2017-11-10'),
(5, 'Eve', 'Wilson', 1, 75000, '2021-08-22'),
(6, 'Frank', 'White', 4, 65000, '2021-01-15'),
(7, 'Grace', 'Green', 5, 80000, '2019-05-18'),
(8, 'Henry', 'Black', 2, 95000, '2018-12-12'),
(9, 'Ivy', 'Miller', 1, 70000, '2020-11-22'),
(10, 'Jack', 'Taylor', 3, 55000, '2017-07-10'),
(11, 'Katie', 'Brown', 5, 72000, '2018-04-12'),
(12, 'Leo', 'Jones', 4, 67000, '2019-03-09'),
(13, 'Mary', 'Dixon', 1, 76000, '2020-01-28'),
(14, 'Nathan', 'Young', 2, 84000, '2021-09-10'),
(15, 'Olivia', 'King', 5, 83000, '2017-08-15'),
(16, 'Paul', 'Scott', 2, 91000, '2019-07-25'),
(17, 'Quincy', 'Adams', 4, 64000, '2021-06-22'),
(18, 'Rachel', 'Perry', 3, 58000, '2020-02-15'),
(19, 'Sam', 'Clark', 2, 92000, '2018-10-02'),
(20, 'Tina', 'Ross', 1, 78000, '2019-12-30');

-- Insert Sample Data for Projects
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID, Budget)
VALUES
(1, 'Project Alpha', 1, 50000),
(2, 'Project Beta', 2, 120000),
(3, 'Project Gamma', 3, 40000),
(4, 'Project Delta', 4, 80000),
(5, 'Project Epsilon', 5, 60000);

