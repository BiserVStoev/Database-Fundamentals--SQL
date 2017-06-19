SELECT u.Username, g.Name, COUNT(i.Id) as 'ItemsCount',SUM(i.Price) as 'ItemsPrice' FROM UsersGames as ug
INNER JOIN Users as u
ON u.Id = ug.UserId
INNER JOIN Games as g
ON g.Id = ug.GameId
INNER JOIN UserGameItems as ugi
ON ugi.UserGameId = ug.Id
INNER JOIN Items as i
ON i.Id = ugi.ItemId
GROUP BY u.Username,g.Name
HAVING COUNT(i.Id) >= 10
ORDER BY COUNT(i.Id) DESC, SUM(i.Price) DESC,u.Username