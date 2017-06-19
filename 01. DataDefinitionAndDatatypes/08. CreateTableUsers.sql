CREATE TABLE Users
  (
    Id BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
  	Username varchar(30) NOT NULL,
  	Password varchar(26) NOT NULL,
	ProfilePicture varbinary(max),
  	LastLoginTime DATETIME,
  	IsDeleted Bit
  )

INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted) VALUES
('Pesho', '123456', NULL, GETDATE(), 0),
('Gosho', '1', NULL, GETDATE(), 0),
('Pesho2', 'lelel', NULL, GETDATE(), 1),
('Stamat', 'row', NULL, GETDATE(), 0),
('Stamat2', 'haha', NULL, GETDATE(), 1)