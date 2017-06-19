SELECT co.ContinentCode,co.CurrencyCode,co.CurrencyUsage FROM
(SELECT c.ContinentCode,
c.CurrencyCode,
COUNT(c.CurrencyCode) as 'CurrencyUsage', 
DENSE_RANK() over (PARTITION BY c.ContinentCode 
ORDER BY COUNT(c.CurrencyCode) DESC) as rank
FROM Countries as c
GROUP BY c.ContinentCode,c.CurrencyCode) as co
WHERE co.rank = 1 AND CurrencyUsage != 1
ORDER BY co.ContinentCode


/* Alternative */

SELECT c.ContinentCode, 
	   c.CurrencyCode, 
	   COUNT(c.CurrencyCode) AS [CurrencyUsage]
FROM Countries AS c
GROUP BY c.ContinentCode , c.CurrencyCode
HAVING COUNT(c.CurrencyCode) = (SELECT MAX(same.CurrencyTimes) FROM 
									(SELECT co.ContinentCode, 
									co.CurrencyCode, 
									COUNT(co.CurrencyCode) AS [CurrencyTimes]
									FROM Countries AS co
									WHERE c.ContinentCode = co.ContinentCode 
									GROUP BY co.ContinentCode , co.CurrencyCode) AS same)
AND COUNT(c.CurrencyCode) != 1
ORDER BY c.ContinentCode