CREATE TABLE Categories
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Category NVARCHAR(30) NOT NULL,
  DailyRate DECIMAL(15,2) NOT NULL,
  WeeklyRate DECIMAL(15,2) NOT NULL,
  MonthlyRate DECIMAL(15,2) NOT NULL,
  WeekendRate DECIMAL(15,2) NOT NULL
  )
  
CREATE TABLE Cars
  (
  Id INT NOT NULL PRIMARY KEY  IDENTITY(1,1),
  PlateNumber CHAR(8) NOT NULL,
  Make NVARCHAR(30) NOT NULL,
  Model NVARCHAR(30) NOT NULL,
  CarYear DATE,
  CategoryId INT NOT NULL,
  Doors INT,
  Picture VARBINARY(max),
  Condition NVARCHAR(100),
  Available Bit
  )
  

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
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  DriverLicenseNumber NVARCHAR(20) NOT NULL,
  FullName NVARCHAR(50) NOT NULL,
  Address NVARCHAR(30) NOT NULL,
  City NVARCHAR(30) NOT NULL,
  ZIPCode INT,
  Notes NVARCHAR(max)
  )
 
CREATE TABLE RentalOrders
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  EmployeeId INT NOT NULL,
  CustomerId INT NOT NULL,
  CarId INT NOT NULL,
  CarCondition NVARCHAR(400),
  TankLevel INT,
  KilometrageStart FLOAT,
  KilometrageEnd FLOAT,
  TotalKilometrage FLOAT,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  TotalDays INT,
  RateApplied NVARCHAR(20) NOT NULL,
  TaxRate DECIMAL(15,2) NOT NULL,
  OrderStatus NVARCHAR(100),
  Notes NVARCHAR(max)
  )

INSERT INTO Categories(Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
('Shit1', 10.11,20.20,30.30,40.40),
('Shit2', 10.11,20.20,30.30,40.40),
('Shit3', 10.11,20.20,30.30,40.40)

INSERT INTO Cars (PlateNumber, Make, Model, CarYear, CategoryId,Doors,Picture, Condition,Available) VALUES
('AS1000BS', 'Toyota', 'Corola',CAST(GETDATE() AS DATE),2,4,NULL,'Fucked Up',1),
('AS1001BS', 'Toyota', 'Corola',CAST(GETDATE() AS DATE),1,3,NULL,'Fucked Up2',1),
('AS1002BS', 'Toyota', 'Corola',CAST(GETDATE() AS DATE),3,1,NULL,'Fucked Up3',1)

Insert INTO Employees(FirstName,LastName,Title, Notes) VALUES
('Pesho', 'Peshev', 'Peshaka',NULL),
('Pasho', 'Peshev', 'Peshaka2',NULL),
('Posho', 'Peshev', 'Peshaka3',NULL)

Insert INTO Customers(DriverLicenseNumber,FullName,Address, City, ZIPCode, Notes) VALUES
('Just a number','Dimcho Dimchev', 'Some Str; 26', 'Sofia',1111,NULL),
('Just a number2','Dimcho Dimchiv', 'Some Str; 27', 'Sofia',1111,NULL),
('Just a number3','Dimcho Dimchov', 'Some Str; 28', 'Sofia',1111,NULL)

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, CarCondition, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays,RateApplied, TaxRate, OrderStatus, Notes) VALUES
(1, 2, 3, 'Rekt', 0, 100000, 200000, 100000, CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 0, 'MonthlyRate', 0.2, 'Done',NULL),
(2, 2, 1, 'Good', 0, 100000, 200000, 100000, CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 0, 'MonthlyRate', 0.5, 'Done',NULL),
(3, 3, 2, 'Parked', 0, 100000, 200000, 100000, CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 0, 'Weekend', 10, 'Done',NULL)