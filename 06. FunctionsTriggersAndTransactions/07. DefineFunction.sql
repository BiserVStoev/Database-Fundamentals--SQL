CREATE FUNCTION ufn_IsWordComprised (@setOfLetters VARCHAR(50), @word VARCHAR(50))
RETURNS Bit
AS
BEGIN
	DECLARE @index INT;
	DECLARE @letter char(1);
	SET @index = 1;

	WHILE @index <= LEN(@word)
	BEGIN
		SET @letter = SUBSTRING(@word,@index,1); 
		IF(CHARINDEX(@letter,@setOfLetters) = 0)
		RETURN 0;
		SET @index = @index + 1;
	END
	RETURN 1;
END