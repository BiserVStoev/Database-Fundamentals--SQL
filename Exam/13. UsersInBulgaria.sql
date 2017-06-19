SELECT u.Nickname, c.Title,l.Latitude, l.Longitude FROM Users AS u
INNER JOIN Locations AS l
ON u.LocationId = l.Id
INNER JOIN UsersChats AS uc
ON u.Id = uc.UserId
INNER JOIN Chats AS c
ON uc.ChatId = c.Id
WHERE (l.Latitude >= 41.14 AND l.Latitude < 44.13) AND (l.Longitude >= 22.21 AND l.Longitude < 28.36)
ORDER BY c.Title ASC
