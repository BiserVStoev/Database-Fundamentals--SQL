CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(30))
RETURNS @table TABLE
		(
		SumCash MONEY NOT NULL
		)
AS
BEGIN
		INSERT INTO @table (SumCash)
		SELECT SUM(x.Cash) FROM(SELECT ug.Cash,Row_Number() OVER(ORDER BY ug.Cash DESC) AS RowNumber  FROM UsersGames as ug
						INNER JOIN Games as g
						ON g.Id = ug.GameId
						WHERE g.Name = @gameName) as x
		WHERE x.RowNumber % 2 = 1
		RETURN
END