ALTER TABLE Employees NOCHECK CONSTRAINT ALL
ALTER TABLE EmployeesProjects NOCHECK CONSTRAINT ALL
ALTER TABLE Departments NOCHECK CONSTRAINT ALL

DELETE FROM Employees
WHERE DepartmentID IN (1)

DELETE FROM Departments
Where Name = 'Production' OR Name = 'Production Control'

ALTER TABLE Employees WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE EmployeesProjects WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE Departments WITH CHECK CHECK CONSTRAINT ALL


SELECT e.FirstName,d.Name FROM Employees as e
INNER JOIN Departments as d
ON d.DepartmentID = e.DepartmentID
WHERE d.Name IN ('Production','Production Control')