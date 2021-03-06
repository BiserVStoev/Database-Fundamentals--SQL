CREATE TABLE Logs(
LogId INT PRIMARY KEY IDENTITY(1,1),
AccountId INT,
OldSum MONEY NOT NULL,
NewSum MONEY NOT NULL
)

GO

CREATE TRIGGER tr_LogRecords 
ON accounts
AFTER UPDATE
AS
BEGIN

INSERT INTO Logs(AccountId, OldSum, NewSum)
SELECT i.id, d.balance, i.balance 
  FROM inserted AS i
  INNER JOIN deleted as d
  ON i.Id = d.Id

END
