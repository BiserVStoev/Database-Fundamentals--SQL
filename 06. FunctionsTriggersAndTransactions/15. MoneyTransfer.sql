CREATE PROC usp_TransferMoney(@fromId INT, @toId INT, @moneyAmount MONEY)
AS
BEGIN
	DECLARE @expectedFrom MONEY;
	DECLARE @expectedTo MONEY;
	SET @expectedFrom = (SELECT a.Balance FROM Accounts as a
					WHERE a.Id = @fromId) - @moneyAmount
	SET @expectedTo = (SELECT a.Balance FROM Accounts as a
					WHERE a.Id = @toId) + @moneyAmount

	IF(NOT EXISTS(SELECT * FROM accounts WHERE accounts.id != @fromId)
		OR NOT EXISTS(SELECT * FROM accounts WHERE accounts.id != @fromId)
		OR @moneyAmount < 0)
		BEGIN
		RAISERROR('Money didnt transfer',16,1)
		RETURN
		END

	BEGIN TRAN

	UPDATE Accounts
	SET Balance = Balance - @moneyAmount
	WHERE Id = @fromId

	UPDATE Accounts
	SET Balance = Balance + @moneyAmount
	WHERE Id = @toId

	IF(((SELECT balance FROM accounts WHERE accounts.id = @fromId) = @expectedFrom) 
				AND (SELECT balance FROM accounts WHERE accounts.id = @toId) = @expectedTo)
		BEGIN
		COMMIT
		END
	ELSE
	BEGIN
		RAISERROR('Money didnt transfer',16,1)
		ROLLBACK
	END
END