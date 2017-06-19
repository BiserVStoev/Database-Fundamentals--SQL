SELECT g.Name as 'Game',gt.Name as 'Game Type',u.Username,ug.Level,ug.Cash,c.Name as Character FROM UsersGames as ug
INNER JOIN Users as u
ON u.Id = ug.UserId
INNER JOIN Games as g
ON g.Id = ug.GameId
INNER JOIN GameTypes as gt
ON g.GameTypeId = gt.Id
INNER JOIN Characters as c
ON c.Id = ug.CharacterId
ORDER BY ug.Level DESC, u.Username, g.Name