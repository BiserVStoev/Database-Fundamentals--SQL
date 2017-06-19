SELECT p.Name,
DATEDIFF(YEAR,p.Birthdate,GETDATE()) AS 'Age in Years',
DATEDIFF(MONTH,p.Birthdate,GETDATE()) AS 'Age in Months',
DATEDIFF(DAY,p.Birthdate,GETDATE()) AS 'Age in Days',
DATEDIFF(MINUTE,p.Birthdate,GETDATE()) AS 'Age in Minutes'
FROM People AS p;