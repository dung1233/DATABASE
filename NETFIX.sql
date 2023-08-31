CREATE DATABASE NETFIX
GO

USE NETFIX
GO 
-- Tạo bảng Users
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(50),
  Password VARCHAR(50),
  Email VARCHAR(100),
  DateOfBirth DATE,
  SubscriptionStatus VARCHAR(20)
);
GO
-- Tạo bảng Movies
CREATE TABLE Movies (
  MovieID INT PRIMARY KEY,
  Title VARCHAR(100),
  Genre VARCHAR(50),
  ReleaseDate DATE,
  Director VARCHAR(100),
  Rating DECIMAL(3, 1)
);
GO
-- Tạo bảng UserWatchHistory
CREATE TABLE UserWatchHistory (
  UserID INT,
  MovieID INT,
  WatchDate DATE,
  Duration INT,
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);
GO
-- Tạo bảng MovieWatchHistory
CREATE TABLE MovieWatchHistory (
  MovieID INT,
  UserID INT,
  WatchDate DATE,
  Duration INT,
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO
-- Tạo bảng Ratings
CREATE TABLE Ratings (
  UserID INT,
  MovieID INT,
  Rating DECIMAL(2, 1),
  Review VARCHAR(500),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);
GO