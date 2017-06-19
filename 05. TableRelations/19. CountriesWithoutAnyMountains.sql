SELECT COUNT(*) AS NumberOfCountries FROM Countries AS c
WHERE c.CountryCode NOT IN (SELECT mc.CountryCode FROM MountainsCountries AS mc)

/** DIFFERENT WAY **/
SELECT COUNT(c.CountryCode) AS CountryCode FROM Countries AS c
LEFT JOIN MountainsCountries mc
ON mc.CountryCode = c.CountryCode
WHERE mc.MountainId IS NULL