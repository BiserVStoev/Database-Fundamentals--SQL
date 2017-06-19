SELECT m.Id, m.ChatId, m.UserId FROM Messages AS m
WHERE m.UserId NOT IN (SELECT u.Id FROM Users AS u) AND	m.ChatId = 17
ORDER BY m.Id ASC