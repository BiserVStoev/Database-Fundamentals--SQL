SELECT c2.ContinentName, SUM(CAST(c.AreaInSqKm AS BIGINT)) AS CountriesArea, SUM(CAST(c.Population AS BIGINT))
		 AS CountriesPopulation
		FROM Countries AS c
		LEFT OUTER JOIN Continents AS c2
		ON c2.ContinentCode = c.ContinentCode
		GROUP BY c2.ContinentName
		ORDER BY CountriesPopulation DESC