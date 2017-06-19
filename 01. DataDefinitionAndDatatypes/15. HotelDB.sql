
CREATE TABLE Employees
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  FirstName NVARCHAR(20) NOT NULL,
  LastName NVARCHAR(20) NOT NULL,
  Title NVARCHAR(30),
  Notes NVARCHAR(max)
  )
  
CREATE TABLE Customers
  (
  AccountNumber NVARCHAR(20) NOT NULL,
  FirstName NVARCHAR(20) NOT NULL,
  LastName NVARCHAR(20) NOT NULL,
  PhoneNumber NVARCHAR(10) NOT NULL,
  EmergencyName NVARCHAR(30),
  EmergencyNumber NVARCHAR(10),
  Notes NVARCHAR(max)
  )

  CREATE TABLE RoomStatus
  (
  RoomStatus NVARCHAR(50) NOT NULL,
  Notes NVARCHAR(max)
  )
  
CREATE TABLE RoomTypes
  (
  RoomType NVARCHAR(20) NOT NULL,
  Notes NVARCHAR(max)
  )

CREATE TABLE BedTypes
  (
  BedType NVARCHAR(20) NOT NULL,
  Notes NVARCHAR(max)
  )

CREATE TABLE Rooms
  (
  RoomNumber INT NOT NULL,
  RoomType NVARCHAR(20) NOT NULL,
  BedType NVARCHAR(20) NOT NULL,
  Rate DECIMAL(15,2) NOT NULL,
  RoomStatus NVARCHAR(50) NOT NULL,
  Notes NVARCHAR(max)
  )
 
CREATE TABLE Payments
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  EmployeeId INT NOT NULL,
  PaymentDate DATE NOT NULL,
  AccountNumber NVARCHAR(20) NOT NULL,
  FirstDateOccupied DATE,
  LastDateOccupied DATE,
  TotalDays INT,
  AmmountCharged DECIMAL(15,2) NOT NULL,
  TaxRate DECIMAL(5,2),
  TaxAmount DECIMAL(15,2),
  PaymentTotal DECIMAL(15,2) NOT NULL,
  Notes NVARCHAR(max)
  )

CREATE TABLE Occupancies
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  EmployeeId INT NOT NULL,
  DateOccupied DATE,
  AccountNumber NVARCHAR(20) NOT NULL,
  RoomNumber INT NOT NULL,
  RateApplied DECIMAL(15,2),
  PhoneCharge DECIMAL(15,2),
  Notes NVARCHAR(max)
  )

Insert INTO Employees(FirstName,LastName,Title, Notes) VALUES
('Pesho', 'Peshev', 'Peshaka',NULL),
('Pasho', 'Peshev', 'Peshaka2',NULL),
('Posho', 'Peshev', 'Peshaka3',NULL)

Insert INTO Customers(AccountNumber,FirstName, LastName,PhoneNumber, EmergencyName, EmergencyNumber, Notes) VALUES
('1000','Dimcho','Dimchev', '444-444-44', 'Help','222-222-22',NULL),
('1001','Dimcho', 'Dimchiv', '444-444-44', 'Sos','222-222-22',NULL),
('1002','Dimcho', 'Dimchov', '444-444-45', 'HELP','222-222-22',NULL)

INSERT INTO RoomStatus(RoomStatus, Notes) VALUES
('Tidy', NULL),
('Not Tidy', NULL),
('Tidy', NULL)

INSERT INTO RoomTypes(RoomType, Notes) VALUES
('Small', NULL),
('Medium', NULL),
('Large', NULL)

INSERT INTO BedTypes(BedType, Notes) VALUES
('1 Bed', NULL),
('2 Bed', NULL),
('3 Bed', NULL)

Insert INTO Rooms(RoomNumber,RoomType, BedType,Rate,RoomStatus,Notes) VALUES
(1,'Small','1 Bed', 10.22, 'Tidy',NULL),
(2,'Large', '2 Bed', 20.22, 'Not Tidy',NULL),
(3,'Small', '3 Bed', 25.13, 'Tidy',NULL)

Insert INTO Payments(EmployeeId,PaymentDate, AccountNumber,FirstDateOccupied,LastDateOccupied,TotalDays,AmmountCharged,TaxRate,TaxAmount,PaymentTotal,Notes) VALUES
(1,CAST(GETDATE() AS DATE),'1000', CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1, 10.22,NULL,NULL, 0,NULL),
(2,CAST(GETDATE() AS DATE),'1001', CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),2, 20.22,NULL,NULL, 500,NULL),
(3,CAST(GETDATE() AS DATE),'1002', CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),9, 25.13, 0.51, 115.12, 200.15,NULL)

Insert INTO Occupancies(EmployeeId,DateOccupied, AccountNumber,RoomNumber,RateApplied, PhoneCharge,Notes) VALUES
(1,Null,'1001', 50, 10.22,NULL,NULL),
(2,NULL, '1000', 204, 15.55,NULL,NULL),
(3,NULL, '1002', 102, 205.22,NULL,NULL)