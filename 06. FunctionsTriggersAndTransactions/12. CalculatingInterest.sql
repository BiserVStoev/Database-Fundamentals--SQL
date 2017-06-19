CREATE PROCEDURE usp_CalculateFutureValueForAccount(@accountID INT, @interestRate FLOAT)
AS
BEGIN
	SELECT ah.id AS 'Account Id', 
		ah.first_name AS 'First Name',
		ah.last_name AS 'Last Name',
		a.balance AS 'Current Balance',
		dbo.ufn_CalculateFutureValue(a.balance, @interestRate, 5)  FROM accounts as a
	INNER JOIN account_holders AS ah
	ON a.account_holder_id = ah.id
	WHERE a.account_holder_id = @accountID
END