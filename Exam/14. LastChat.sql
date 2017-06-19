SELECT TOP 1 c.Id FROM Chats AS c
ORDER BY c.StartDate DESC

SELECT (SELECT TOP 1 c.Id FROM Chats AS c ORDER BY c.StartDate DESC) AS 'Title', CASE
			WHEN NOT EXISTS(SELECT * FROM Messages AS m
								WHERE m.ChatId = (SELECT TOP 1 c.Id FROM Chats AS c
													ORDER BY c.StartDate DESC))
													THEN NULL
			ELSE (SELECT m.Content FROM Messages AS m
					WHERE m.ChatId = (SELECT TOP 1 c.Id FROM Chats AS c
										ORDER BY c.StartDate DESC)
					ORDER BY m.SentOn ASC)
			END AS 'Content'