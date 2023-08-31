CREATE DATABASE NETFIX2
GO

USE NETFIX2
GO 



CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(50),
  Password VARCHAR(50),
  Email VARCHAR(100),
  DateOfBirth DATE,
  SubscriptionStatus VARCHAR(20)
);

GO
CREATE TABLE Country (
  CountryID INT PRIMARY KEY,
  CountryName VARCHAR(50)
);

GO
CREATE TABLE AgeLimit (
  AgeLimitID INT PRIMARY KEY,
  AgeLimitValue INT
);

GO
CREATE TABLE Movies (
  MovieID INT PRIMARY KEY,
  Title VARCHAR(100),
  Genre VARCHAR(50),
  ReleaseDate DATE,
  Director VARCHAR(100),
  Rating DECIMAL(3, 1),
  CountryID INT,
  AgeLimitID INT,
  FOREIGN KEY (CountryID) REFERENCES Country(CountryID),
  FOREIGN KEY (AgeLimitID) REFERENCES AgeLimit(AgeLimitID)
);

GO
CREATE TABLE WatchHistory (
  UserID INT,
  MovieID INT,
  WatchDate DATE,
  Duration INT,
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

GO
CREATE TABLE Ratings (
  UserID INT,
  MovieID INT,
  Rating DECIMAL(2, 1),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);