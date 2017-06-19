CREATE FUNCTION udf_GetRadians(@Degrees FLOAT)
RETURNS FLOAT
AS
BEGIN
		DECLARE @radians FLOAT;
		BEGIN
				SET @radians = (@Degrees * PI()) / 180
		END
		RETURN @radians;
END

SELECT dbo.udf_GetRadians(22.12) AS Radians