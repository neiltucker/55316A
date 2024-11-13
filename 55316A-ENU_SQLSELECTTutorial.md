# 55316A SQL SELECT Tutorial for Beginners Exercise

## Objectives
- Practice using `SELECT` statements to query and filter records.
- Learn to use JOIN operations.
- Use grouping and aggregation functions.

### Estimated Time
30 - 45 minutes

---

## Lab Setup Instructions

1. Open SQL Server Management Studio (SSMS) or Azure Data Studio.
2. Run the setup script below to create the database and tables.

---

### Setup Script (55316A-ENU_SQLSELECTTutorial.sql)

```sql
-- Database and Table Setup Script
USE master;
GO
CREATE DATABASE SQLSelectLab;
USE SQLSelectLab;

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

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
```

---

## Exercises:
### Exercise 1: Familiarize Yourself with the Tables

To ensure the setup script ran successfully, let’s start by querying each of the three tables: `Departments`, `Employees`, and `Projects`. This will verify that each table was created and populated correctly.

**Query the `Departments` Table**

   Retrieve all rows from the `Departments` table to view each department’s ID and name.

   ```sql
   SELECT * FROM Departments;
   ```

**Query the `Employees` Table**

   Retrieve all rows from the `Employees` table to display the employee information, including their department ID, salary, and hire date.

   ```sql
   SELECT * FROM Employees;
   ```

**Query the `Projects` Table**

   Retrieve all rows from the `Projects` table to check each project’s name, associated department, and budget.

   ```sql
   SELECT * FROM Projects;
   ```

If you are unable to display all three tables or see an error message, please rerun the setup script using the provided `55335A-ENU_SQLSELECTTutorial.sql` file. This file contains the commands needed to set up the database and tables for this exercise.

#### 2. Filtering by Rows and Columns

##### Filtering by Rows
Retrieve employees who belong to the "Engineering" department.

```sql
SELECT * FROM Employees WHERE DepartmentID = 2;
```

##### Filtering by Columns
Retrieve only the first names and last names of employees.

```sql
SELECT FirstName, LastName FROM Employees;
```

##### Combined Row and Column Filtering
Find the names and salaries of employees in the "Sales" department with a salary greater than 70000.

```sql
SELECT FirstName, LastName, Salary
FROM Employees
WHERE DepartmentID = 1 AND Salary > 70000;
```

#### 3. Sorting Data with `ORDER BY`

Order employees by their hire date, from the newest to the oldest.

```sql
SELECT FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate DESC;
```

#### 4. Grouping and Aggregating Data with `GROUP BY`

Group employees by department and calculate the average salary for each department.

```sql
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;
```

#### 5. Basic JOIN Exercise

Join the `Employees` and `Departments` tables to show each employee's full name along with their department name.

```sql
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```

---

## Challenge Section (Answers in 55316A-ENU_SQLSELECTTutorial_Answers.md)

1. **Joining with Projects Table**  
   Show each project name along with the department name and budget for each project.

2. **Salary Analysis**  
   Find the highest, lowest, and average salary for each department.

3. **Employee Count by Department**  
   Show the total number of employees in each department, ordered by the department with the most employees first.

4. **Project Budget Calculation**  
   Calculate the total budget for all projects across departments.

---

## Knowledge Check (Answers in 55316A-ENU_SQLSELECTTutorial_Answers.md)

1. How would you filter to show only employees hired after January 1, 2020?
2. Which command helps sort employees by last name in alphabetical order?
3. Write a query to find the highest salary in each department.
4. Write a query to show all employees working on a specific project (Hint: Use JOIN with multiple tables).

