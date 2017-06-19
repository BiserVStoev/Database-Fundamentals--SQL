SELECT e.EmployeeID, e.FirstName, 
CASE 
	WHEN YEAR(p.StartDate) >= 2005 THEN NULL
	ELSE p.Name
	END AS ProjectName
FROM Employees AS e
INNER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
WHERE e.EmployeeID = 24;

/** OTHER WAY
SELECT e.EmployeeID, e.FirstName, p.Name AS ProjectName
FROM Employees AS e
INNER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
LEFT OUTER JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
AND p.StartDte < '2005-01-01'
WHERE e.EmployeeID = 24;