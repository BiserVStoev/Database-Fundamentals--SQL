SELECT TOP 5 c.CountryName, r.RiverName FROM Countries AS c
INNER JOIN Continents AS ct
ON c.ContinentCode = ct.ContinentCode
LEFT OUTER JOIN CountriesRivers AS cr
ON c.CountryCode = cr.CountryCode
LEFT OUTER JOIN Rivers AS r
ON cr.RiverId = r.Id
WHERE ct.ContinentName = 'Africa'
ORDER BY c.CountryName ASC;