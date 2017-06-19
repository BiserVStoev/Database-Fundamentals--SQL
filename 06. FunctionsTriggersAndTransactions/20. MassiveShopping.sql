BEGIN TRAN
DECLARE @TotalPrice MONEY;
DECLARE @UserGameId INT;
SET @TotalPrice = (SELECT SUM(i.Price) FROM Items as i
					WHERE i.MinLevel IN (11,12))
SET @UserGameId = (SELECT ug.Id FROM UsersGames as ug
					INNER JOIN Users as u
					ON u.Id = ug.UserId
					INNER JOIN Games as g
					ON g.Id = ug.GameId
					WHERE g.Name = 'Safflower' 
					AND u.Username = 'Stamat')

IF((SELECT ug.Cash FROM UsersGames as ug
					WHERE ug.Id = @UserGameId) < @TotalPrice)
BEGIN
	ROLLBACK
END
ELSE
BEGIN
	UPDATE ug
	SET ug.Cash = ug.Cash - @TotalPrice
	FROM UsersGames as ug
	WHERE ug.Id = @UserGameId

	INSERT INTO UserGameItems(ItemId,UserGameId)
	SELECT i.Id,@UserGameId FROM Items as i
	WHERE i.MinLevel IN (11,12)

	COMMIT
END


BEGIN TRAN
DECLARE @TotalPrice2 MONEY;
DECLARE @UserGameId2 INT;
SET @TotalPrice2 = (SELECT SUM(i.Price) FROM Items as i
					WHERE i.MinLevel IN (19,21))
SET @UserGameId2 = (SELECT ug.Id FROM UsersGames as ug
					INNER JOIN Users as u
					ON u.Id = ug.UserId
					INNER JOIN Games as g
					ON g.Id = ug.GameId
					WHERE g.Name = 'Safflower' 
					AND u.Username = 'Stamat')

IF((SELECT ug.Cash FROM UsersGames as ug
					WHERE ug.Id = @UserGameId2) < @TotalPrice2)
BEGIN
	ROLLBACK
END
ELSE
BEGIN
	UPDATE ug
	SET ug.Cash = ug.Cash - @TotalPrice
	FROM UsersGames as ug
	WHERE ug.Id = @UserGameId

	INSERT INTO UserGameItems(ItemId,UserGameId)
	SELECT i.Id,@UserGameId FROM Items as i
	WHERE i.MinLevel IN (19,21)

	COMMIT
END

SELECT i.Name FROM UsersGames as ug
INNER JOIN Users as u
ON u.Id = ug.UserId
INNER JOIN Games as g
ON g.Id = ug.GameId
INNER JOIN UserGameItems as ugi
ON ugi.UserGameId = ug.Id
INNER JOIN Items as i
ON i.Id = ugi.ItemId
WHERE g.Name = 'Safflower' 
AND u.Username = 'Stamat'