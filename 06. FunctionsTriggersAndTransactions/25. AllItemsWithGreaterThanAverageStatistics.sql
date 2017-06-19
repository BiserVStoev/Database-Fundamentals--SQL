SELECT it.Name,it.Price,it.MinLevel,st.Strength,st.Defence,st.Speed,st.Luck,st.Mind FROM Items as it
INNER JOIN [Statistics] as st
ON st.Id = it.StatisticId
WHERE st.Speed > (SELECT AVG(s.Speed) FROM [Statistics] s)
AND st.Luck > (SELECT AVG(s.Luck) FROM [Statistics] s)
AND st.Mind > (SELECT AVG(s.Mind) FROM [Statistics] s)