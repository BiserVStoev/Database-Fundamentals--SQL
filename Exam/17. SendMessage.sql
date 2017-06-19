CREATE PROCEDURE udp_SendMessage(@UserId INT, @ChatId INT, @Content CHAR(200))
AS
BEGIN
		IF NOT EXISTS (SELECT * FROM UsersChats AS uc
		WHERE uc.ChatId = @ChatId AND uc.UserId = @UserId)
		BEGIN
				RAISERROR('There is no chat with that user!', 16, 1)
		END
		
		BEGIN TRAN

		BEGIN
		INSERT INTO Messages(Content, SentOn, ChatId, UserId)
		VALUES(@Content, GETDATE(), @ChatId, @userId)
		END
		BEGIN
				COMMIT
		END
END

EXEC dbo.udp_SendMessage 19, 17, 'Awesome'