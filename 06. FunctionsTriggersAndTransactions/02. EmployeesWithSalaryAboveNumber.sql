CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber (@Salary MONEY)
AS
BEGIN
	SELECT e.FirstName,e.LastName FROM Employees as e
	WHERE e.Salary >= @Salary
	RETURN
END