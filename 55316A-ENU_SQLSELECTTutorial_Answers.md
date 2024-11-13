# 55316A SQL SELECT Tutorial for Beginners Answers

### Challenge Section Answers

1. **Joining with Projects Table**  
   Show each project name along with the department name and budget for each project.

   ```sql
   SELECT Projects.ProjectName, Departments.DepartmentName, Projects.Budget
   FROM Projects
   JOIN Departments ON Projects.DepartmentID = Departments.DepartmentID;
   ```

2. **Salary Analysis**  
   Find the highest, lowest, and average salary for each department.

   ```sql
   SELECT DepartmentID,
          MAX(Salary) AS HighestSalary,
          MIN(Salary) AS LowestSalary,
          AVG(Salary) AS AverageSalary
   FROM Employees
   GROUP BY DepartmentID;
   ```

3. **Employee Count by Department**  
   Show the total number of employees in each department, ordered by the department with the most employees first.

   ```sql
   SELECT DepartmentID, COUNT(EmployeeID) AS EmployeeCount
   FROM Employees
   GROUP BY DepartmentID
   ORDER BY EmployeeCount DESC;
   ```

4. **Project Budget Calculation**  
   Calculate the total budget for all projects across departments.

   ```sql
   SELECT SUM(Budget) AS TotalBudget
   FROM Projects;
   ```

---

### Knowledge Check Answers

1. **How would you filter to show only employees hired after January 1, 2020?**

   ```sql
   SELECT * FROM Employees
   WHERE HireDate > '2020-01-01';
   ```

2. **Which command helps sort employees by last name in alphabetical order?**

   ```sql
   SELECT * FROM Employees
   ORDER BY LastName ASC;
   ```

3. **Write a query to find the highest salary in each department.**

   ```sql
   SELECT DepartmentID, MAX(Salary) AS HighestSalary
   FROM Employees
   GROUP BY DepartmentID;
   ```

4. **Write a query to show all employees associated with the project "Project Beta," including each employee's first and last name, and the project name.**

```sql
SELECT Employees.FirstName, Employees.LastName, Projects.ProjectName


FROM Employees
JOIN Projects ON Employees.DepartmentID = Projects.DepartmentID
WHERE Projects.ProjectName = 'Project Beta';
```
