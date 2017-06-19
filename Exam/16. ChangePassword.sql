CREATE PROCEDURE udp_ChangePassword(@Email VARCHAR(30), @Password VARCHAR(20))
AS
BEGIN
		IF NOT EXISTS(SELECT * FROM Credentials WHERE Email = @Email)
		BEGIN
				RAISERROR('The email does''t exist!', 16, 1)
		END

		BEGIN TRAN

		UPDATE Credentials
		SET Password = @Password
		WHERE Email = @Email

		BEGIN
				COMMIT
		END
END