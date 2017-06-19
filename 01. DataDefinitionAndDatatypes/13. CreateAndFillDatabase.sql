USE Movies;

CREATE TABLE Directors
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Director NVARCHAR(30) NOT NULL,
  Notes NVARCHAR(max)
  )
  
CREATE TABLE Genres
  (
  Id INT NOT NULL PRIMARY KEY  IDENTITY(1,1),
  GenreName NVARCHAR(30) NOT NULL,
  Notes NVARCHAR(max)
  )
  
CREATE TABLE Categories
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  CategoryName NVARCHAR(30) NOT NULL,
  Notes NVARCHAR(max)
  )

CREATE TABLE Movies
  (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Title NVARCHAR(60) NOT NULL,
  DirectorId INT NOT NULL,
  CopyrightYear DATE,
  Length BIGINT,
  GenreId INT NOT NULL,
  CategoryId INT NOT NULL,
  Rating INT NOT NULL,
  Notes NVARCHAR(max),
  CONSTRAINT chk_Rating CHECK (Rating >= 0 AND Rating <= 5)
  )

INSERT INTO Directors (Director, Notes) VALUES
('Director Pesho', NULL),
('Director Poncho', NULL),
('Director Stamat','The Stamator')

Insert INTO Genres (GenreName, Notes) VALUES
('Horror', 'Scary'),
('Comedy','Hahaha'),
('Stamatation','Stamtastic')

Insert INTO Categories (CategoryName, Notes) VALUES
('Modern', 'New Stuff'),
('Superb', 'Did someone call Stamat'),
('Shit', NULL)

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes) VALUES
('Shit Troopers 2', 3,CAST(GETDATE() AS DATE), 30, 3, 3, 1, 'Wow it sucked'),
('The Best Movie Ever',1,CAST(GETDATE() AS DATE), 200, 2, 2, 5, 'Cool movie bro!'),
('Shady Movie 3', 2,CAST(GETDATE() AS DATE), 120, 1, 1, 4, NULL)
  