ALTER TABLE Users
DROP CONSTRAINT PK_User
ALTER TABLE Users
ADD CONSTRAINT PK_User PRIMARY KEY (Id)
ALTER TABLE Users
ADD UNIQUE (Username)
ALTER TABLE Users
Add CONSTRAINT chk_Username CHECK(LEN(Username) >= 3)