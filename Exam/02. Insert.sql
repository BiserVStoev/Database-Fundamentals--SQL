DECLARE @idCounter INT = 10;
WHILE @idCounter < 21

BEGIN
		INSERT INTO Messages(Content, SentOn, ChatId, UserId)
		VALUES(
			(SELECT CONCAT(u.Age, '-', u.Gender, '-', l.Latitude, '-', l.Longitude) FROM Users AS u 
					INNER JOIN Locations AS l
					ON u.CredentialId = l.Id
					WHERE u.Id = @idCounter), 
			GETDATE(),
			CASE
				WHEN (SELECT Gender FROM Users WHERE Id = @idCounter) = 'F' THEN 
														ROUND(SQRT((SELECT Age FROM Users WHERE Id = @idCounter) * 2), 0)
				ELSE ROUND(POWER((((SELECT Age FROM Users WHERE Id = @idCounter) * 2) / 18), 3), 0)
				END,
			@idCounter)

			SET @idCounter = @idCounter + 1;
END

--OR EASIER WAY

INSERT INTO Messages(Content, SentOn, ChatId, UserId)
SELECT CONCAT(u.Age, '-', u.Gender, '-', l.Latitude, '-', l.Longitude), 
GETDATE(), 
		CASE 
			WHEN u.Gender = 'F' THEN CEILING(SQRT(u.Age * 2))
			ELSE CEILING(POWER(u.Age  / 18, 3))
			END,
			u.Id
			FROM Users AS u
			INNER JOIN Locations AS l
			ON u.LocationId = l.Id
			WHERE u.Id BETWEEN 10 AND 20 