SELECT m.Content, m.SentOn FROM Messages AS m
WHERE m.SentOn > '05.12.2014' AND m.Content LIKE '%just%'
ORDER BY m.Id DESC