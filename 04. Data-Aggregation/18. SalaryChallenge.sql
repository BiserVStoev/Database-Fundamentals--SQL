SELECT TOP 10 e.FirstName, e.LastName, e.DepartmentId FROM Employees AS e
WHERE e.Salary > (SELECT AVG(se.Salary) FROM Employees AS se
					WHERE se.DepartmentID = e.DepartmentId)
ORDER BY e.DepartmentID;


