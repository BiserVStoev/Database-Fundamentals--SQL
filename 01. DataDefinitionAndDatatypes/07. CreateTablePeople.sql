CREATE TABLE People
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Name nvarchar(200) NOT NULL,
Picture varbinary(max),
Height FLOAT,
Weight FLOAT,
Gender CHAR(1) NOT NULL,
Birthdate DATE NOT NULL,
Biography nvarchar(max),
CONSTRAINT chk_Gender CHECK (Gender ='m' OR Gender='f')
)

INSERT People (Name, Picture, Height, Weight, Gender, Birthdate, Biography) VALUES 
('Pesho', 0x, 166.62, 55.55, 'm', '28-SEP-16', 'Just a guy'),
('Pesho2', 0x, 150.62, 60.55, 'f', '27-SEP-16', 'Pesho 2'),
('Posho', 0x, 170.62, 70.55, 'm', '26-SEP-16', 'Posho'),
('Rosho', 0x, 160.62, 50.55, 'f', '25-SEP-16', 'Rosho'),
('Gosho', 0x, 146.62, 45.55, 'f', '24-SEP-16', 'Gosho');