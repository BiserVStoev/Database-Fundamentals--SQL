SELECT c.CountryCode, COUNT(m.MountainRange) AS 'MountainRanges'
FROM Countries AS c
INNER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
INNER JOIN Mountains AS m
ON mc.MountainId = m.Id
WHERE c.CountryCode IN ('RU', 'US', 'BG')
GROUP BY c.CountryCode