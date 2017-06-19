SELECT * FROM Towns AS t
WHERE t.Name LIKE '[MKBE]%'
ORDER BY t.Name ASC;

/** Other way to do it:
SELECT * FROM Towns as t
WHERE LEFT(t.Name,1) IN ('M','K','B','E')
ORDER BY t.Name
**/