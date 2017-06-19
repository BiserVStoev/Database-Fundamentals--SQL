SELECT TOP 5 c.CountryName, 
	ISNULL(p.PeakName, '(no highest peak)') AS HighestPeakName,
	ISNULL(MAX(p.Elevation), 0) AS HighestPeakElevation,
	ISNULL(m.MountainRange, '(no mountain)') AS Mountain
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains AS m
ON mc.MountainId = m.Id
LEFT JOIN Peaks AS p
ON m.Id = p.MountainId
GROUP BY c.CountryName, p.PeakName, m.MountainRange
ORDER BY c.CountryName ASC, HighestPeakName ASC

/** BOTH WORKING BUT 1 IS INCORRECT **/
SELECT TOP 5 * FROM(
SELECT c.CountryName, p.PeakName, p.Elevation, m.MountainRange 
 FROM [dbo].[Countries] AS c
INNER JOIN [dbo].[MountainsCountries] AS mc
   ON c.CountryCode = mc.CountryCode
INNER JOIN [dbo].[Mountains] AS m
   ON mc.MountainId = m.Id
INNER JOIN [dbo].[Peaks] AS p
   ON p.MountainId = m.Id
INNER JOIN (
SELECT c.CountryName, MAX(p.Elevation) AS MaxElevation
 FROM [dbo].[Countries] AS c
INNER JOIN [dbo].[MountainsCountries] AS mc
   ON c.CountryCode = mc.CountryCode
INNER JOIN [dbo].[Mountains] AS m
   ON mc.MountainId = m.Id
INNER JOIN [dbo].[Peaks] AS p
   ON p.MountainId = m.Id
GROUP BY c.CountryName
) AS max_elevation
 ON max_elevation.MaxElevation = p.Elevation
AND max_elevation.CountryName = c.CountryName
UNION ALL
SELECT c.CountryName, '(no highest peak)' AS PeakName,
       0 AS Elevation, '(no mountain)' AS MountainRange
 FROM [dbo].[Countries] AS c
 LEFT JOIN [dbo].[MountainsCountries] AS mc
    ON c.CountryCode = mc.CountryCode
 WHERE mc.MountainId  IS NULL
 ) AS results
 ORDER BY CountryName, PeakName