SELECT TOP 30 c.CountryName, c.Population FROM Countries as c
WHERE c.ContinentCode = 'EU'
ORDER BY c.Population DESC, c.CountryName ASC;