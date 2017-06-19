CREATE TRIGGER tr_LogMessages
ON Messages
AFTER DELETE 
AS
BEGIN

INSERT INTO MessageLogs (Id, Content, SentOn, ChatId, UserId)
SELECT d.Id, d.Content, d.SentOn, d.ChatId, d.UserId
FROM deleted AS d

END