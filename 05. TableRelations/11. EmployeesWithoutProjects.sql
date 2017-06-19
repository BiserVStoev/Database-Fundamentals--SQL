SELECT TOP 3 e.EmployeeID, e.FirstName
FROM Employees AS e
WHERE e.EmployeeID NOT IN (SELECT ep.EmployeeID FROM EmployeesProjects as ep) 
ORDER BY e.EmployeeID

/** OTHER WAY
SELECT TOP 3 e.EmployeeID, e.FirstName FROM Employees as e
LEFT JOIN EmployeesProjects as ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID
**/