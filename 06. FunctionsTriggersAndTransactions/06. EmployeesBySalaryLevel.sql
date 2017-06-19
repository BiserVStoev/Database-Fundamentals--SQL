CREATE PROC usp_EmployeesBySalaryLevel  (@salaryLevel varchar(10))
AS
BEGIN
	SELECT e.FirstName, e.LastName FROM Employees AS e
	WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @salaryLevel 
	RETURN
END