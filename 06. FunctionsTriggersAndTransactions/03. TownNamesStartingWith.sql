CREATE PROC usp_GetTownsStartingWith (@str VARCHAR(MAX))
AS
BEGIN
	SELECT t.Name FROM Towns as t
	WHERE t.Name LIKE CONCAT(@str, '%')
	RETURN
END