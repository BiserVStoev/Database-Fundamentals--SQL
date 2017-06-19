UPDATE Chats 
SET StartDate = (SELECT TOP 1 m2.SentOn FROM Messages AS m2
						INNER JOIN Chats AS c2 
						ON m2.ChatId = c2.Id
						WHERE m2.ChatId = c2.Id
						ORDER BY m2.SentOn)
FROM Chats c
JOIN Messages AS m ON c.Id = m.ChatId
WHERE c.StartDate > (SELECT TOP 1 m2.SentOn FROM Messages AS m2
						INNER JOIN Chats AS c2 
						ON m2.ChatId = c2.Id
						WHERE m2.ChatId = c2.Id
						ORDER BY m2.SentOn)