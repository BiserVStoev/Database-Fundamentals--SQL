CREATE PROCEDURE usp_GetHoldersFullName 
AS
BEGIN
		SELECT (ah.FirstName + ' ' + ah.LastName) AS FullName 
		FROM AccountHolders AS ah

		RETURN
END