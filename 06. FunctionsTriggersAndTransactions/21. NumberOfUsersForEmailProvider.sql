SELECT SUBSTRING(u.Email,CHARINDEX('@',u.Email)+1,LEN(u.Email)) as 'Email Provider',
COUNT(u.Email) as 'Count' 
FROM Users as u
GROUP BY SUBSTRING(u.Email,CHARINDEX('@',u.Email)+1,LEN(u.Email))
ORDER BY COUNT(u.Email) DESC, SUBSTRING(u.Email,CHARINDEX('@',u.Email)+1,LEN(u.Email))