SELECT u.UserName, SUBSTRING(u.Email,CHARINDEX('@', u.Email, 0 ) + 1, LEN(u.Email)) AS 'Email Provider'
 FROM Users AS u
 ORDER BY [Email Provider] ASC, u.Username ASC;