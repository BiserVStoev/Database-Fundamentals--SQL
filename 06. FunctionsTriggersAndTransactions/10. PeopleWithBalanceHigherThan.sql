CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@money MONEY) 
AS
BEGIN
		SELECT ah.FirstName, ah.LastName FROM AccountHolders AS ah
		INNER JOIN Accounts AS ac
		ON ah.Id = ac.AccountHolderId
		GROUP BY ah.FirstName, ah.LastName
		HAVING SUM(ac.Balance) > @money
		RETURN
END