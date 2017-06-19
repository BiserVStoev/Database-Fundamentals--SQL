SELECT * 
INTO newEmployees
FROM Employees as e
WHERE e.Salary > 30000

DELETE FROM newEmployees
WHERE ManagerID = 42

UPDATE newEmployees
SET Salary = Salary + 5000
WHERE DepartmentID = 1

SELECT DepartmentID,AVG(Salary) AS 'Average Salary' FROM newEmployees
GROUP BY DepartmentID