SELECT c.Id, c.Title, m.Id FROM Chats AS c
INNER JOIN Messages AS m
ON c.Id = m.ChatId
WHERE m.SentOn < '03.26.2012' AND c.Title LIKE '%x'
ORDER BY c.Id ASC, m.Id ASC