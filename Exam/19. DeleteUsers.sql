CREATE TRIGGER tr_DeleteUsers
ON Users
INSTEAD OF DELETE 
AS
BEGIN

DELETE FROM Messages
WHERE UserId = (SELECT d.Id FROM deleted AS d)

DELETE FROM UsersChats
WHERE UserId = (SELECT d.Id FROM deleted AS d)

DELETE FROM Users
WHERE Id = (SELECT d.Id FROM deleted AS d)
END