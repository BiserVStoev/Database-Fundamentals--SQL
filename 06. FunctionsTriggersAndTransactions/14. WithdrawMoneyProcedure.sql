CREATE PROC usp_WithdrawMoney (@AccountId INT, @moneyAmount MONEY)
AS
BEGIN
	DECLARE @expected MONEY;
	SET @expected = (SELECT a.Balance FROM Accounts as a
					WHERE a.Id = @AccountId) - @moneyAmount
	BEGIN TRAN
		UPDATE Accounts
		SET Balance = Balance - @moneyAmount
		WHERE Id = @AccountId
		IF((SELECT a.Balance FROM Accounts as a	WHERE a.Id = @AccountId) != @expected)
		BEGIN
			ROLLBACK
		END
		ELSE
		BEGIN
			COMMIT
		END
END