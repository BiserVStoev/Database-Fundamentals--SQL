CREATE TABLE NotificationEmails(
Id INT PRIMARY KEY IDENTITY(1,1),
Recipient INT NOT NULL,
Subject VARCHAR(50),
Body VARCHAR(50)
)

GO

CREATE TRIGGER tr_NotifyEmailOnBalanceChange
ON Logs
AFTER INSERT
AS
BEGIN
	INSERT INTO NotificationEmails(Recipient,Subject,Body)
	SELECT i.AccountId, 
		'Balance changed for account: ' + i.AccountId,
		'On ' + GETDATE() + ' your balance was changed from ' + i.OldSum + ' to ' + i.NewSum  
	FROM inserted AS i
END