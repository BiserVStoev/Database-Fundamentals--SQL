CREATE FUNCTION ufn_GetSalaryLevel (@salary MONEY)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @level VARCHAR(10);

	IF(@salary < 30000)
	BEGIN
		SET @level = 'Low'
	END
	ELSE IF(@salary < 50000)
	BEGIN
		SET @level = 'Average'
	END
	ELSE
	BEGIN
		SET @level = 'High'
	END
	
	RETURN @level
END