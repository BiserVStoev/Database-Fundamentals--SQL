SELECT
	cu.CurrencyCode,
	cu.Description AS Currency,
	NumberOfCountries
FROM
	(SELECT cu.CurrencyCode, COUNT(c.CountryCode) AS NumberOfCountries 
	FROM Currencies AS cu
	LEFT JOIN Countries AS c 
	ON c.CurrencyCode = cu.CurrencyCode
	GROUP BY cu.CurrencyCode) AS CurrencyCount
JOIN Currencies AS cu 
ON cu.CurrencyCode = CurrencyCount.CurrencyCode
ORDER BY NumberOfCountries DESC, Currency