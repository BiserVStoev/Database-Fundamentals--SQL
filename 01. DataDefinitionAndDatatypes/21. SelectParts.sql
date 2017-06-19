SELECT Towns.Name FROM Towns
ORDER BY Towns.Name ASC

SELECT Departments.Name FROM Departments
ORDER BY Departments.Name ASC

SELECT e.FirstName, e.LastName, e.JobTitle, e.Salary FROM Employees AS e
ORDER BY e.Salary DESC