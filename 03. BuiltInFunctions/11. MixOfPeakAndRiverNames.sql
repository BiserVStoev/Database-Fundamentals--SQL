SELECT p.PeakName, r.RiverName, CONCAT(LOWER(p.PeakName),SUBSTRING(LOWER(r.RiverName),2,LEN(r.RiverName) - 1)) AS 'Mix' FROM Peaks as p
INNER JOIN Rivers AS r
ON LOWER(RIGHT(p.PeakName,1)) = LOWER(LEFT(r.RiverName,1))
ORDER BY Mix;