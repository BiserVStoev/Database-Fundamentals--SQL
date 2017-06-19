SELECT c.CountryName, c.IsoCode FROM Countries AS c
WHERE c.CountryName LIKE '%a%a%a%'
ORDER BY c.IsoCode ASC;