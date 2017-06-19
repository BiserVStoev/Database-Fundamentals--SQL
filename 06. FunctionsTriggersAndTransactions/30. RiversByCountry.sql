SELECT
	CountryName,
	ContinentName,
	RiversCount,
	ISNULL(TotalLength, 0) AS TotalLength
FROM (SELECT
		c.CountryCode,
		COUNT(r.Id) AS RiversCount,
		SUM(r.Length) AS TotalLength
		FROM Countries AS c
		LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
		LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
		GROUP BY c.CountryCode) AS GroupedCountries
INNER JOIN Countries c ON c.CountryCode = GroupedCountries.CountryCode
INNER JOIN Continents co ON co.ContinentCode = c.ContinentCode
ORDER BY RiversCount DESC, TotalLength DESC, CountryName
