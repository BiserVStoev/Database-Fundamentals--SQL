USE Softuni;
INSERT INTO Towns(Name) VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

INSERT INTO Softuni.dbo.Departments(Name) VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

INSERT INTO Addresses(AddressText, TownId) VALUES
('Softuni',1),
('Peikata v parka',4)

INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId,HireDate, Salary,AddresId) VALUES
('Ivan', 'Ivanov', 'Ivanov','.NET Developer', 4,'01/02/2013',3500.00,1)
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId,HireDate, Salary,AddresId) VALUES('Petar', 'Petrov', 'Petrov','Senior Engineer', 1,'02/03/2004',4000,1)
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId,HireDate, Salary,AddresId) VALUES('Maria', 'Petrova', 'Ivanova','Intern', 5,'08/28/2016',525.25,2)
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId,HireDate, Salary,AddresId) VALUES('Georgi', 'Teziev', 'Ivanov','CEO', 2,'09/12/2007',3000.00,1)
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId,HireDate, Salary,AddresId) VALUES('Peter', 'Pan', 'Pan','Intern', 3,'08/28/2016',599.88,2)