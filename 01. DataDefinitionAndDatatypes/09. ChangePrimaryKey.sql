ALTER TABLE Users DROP CONSTRAINT PK__Users__3214EC076FFD60E5
ALTER TABLE Users ADD CONSTRAINT PK_User PRIMARY KEY(Id, Username)