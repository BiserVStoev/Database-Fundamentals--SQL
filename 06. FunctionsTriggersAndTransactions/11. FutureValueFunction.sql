CREATE FUNCTION ufn_CalculateFutureValue(@sum FLOAT, @interestRate FLOAT, @years INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @result MONEY; 
	SET @result = @sum * (POWER((1+@interestRate), @years));
	RETURN @result;
END