USE master;
GO

IF  DB_ID('DiskInventory') IS NOT NULL
    DROP DATABASE DiskInventory;
GO

CREATE DATABASE DiskInventory;
GO

USE DiskInventory;

CREATE TABLE DiskType (
  DiskTypeID				INT            PRIMARY KEY   IDENTITY,
  DiskTypeDescription       VARCHAR(100)   NOT NULL,
);

CREATE TABLE DiskStatus (
  DiskStatusID			    INT            PRIMARY KEY   IDENTITY,
  DiskStatusDescription     VARCHAR(100)   NOT NULL,
);

CREATE TABLE Genre (
  GenreID					INT            PRIMARY KEY   IDENTITY,
  GenreDescription			VARCHAR(100)   NOT NULL,
);

CREATE TABLE ArtistType (
  ArtistTypeID				INT            PRIMARY KEY   IDENTITY,
  DiskTypeDescription       VARCHAR(100)   NOT NULL,
);

CREATE TABLE Artist (
  ArtistID          INT            PRIMARY KEY  IDENTITY,
  ArtistTypeID      INT            NOT NULL REFERENCES ArtistType (ArtistTypeID),
  FirstName         VARCHAR(100)   NOT NULL,
  LastName          VARCHAR(100)   NOT NULL,
  GroupName         VARCHAR(100)   NULL,
);
CREATE TABLE Disks (
  DiskID            INT            PRIMARY KEY  IDENTITY,
  DiskTypeID        INT            NOT NULL REFERENCES DiskType (DiskTypeID),
  DiskStatusID      INT            NOT NULL REFERENCES DiskStatus (DiskStatusID),
  GenreID			INT            NOT NULL REFERENCES Genre (GenreID),
  DiskName          VARCHAR(100)   NOT NULL,
  ReleasedDate      DATETIME       NOT NULL,
);

CREATE TABLE Borrower (
  BorrowerID		INT            PRIMARY KEY  IDENTITY,
  FirstName			VARCHAR(100)   NOT NULL,
  LastName			VARCHAR(100)   NOT NULL,
  PhoneNumber		INTEGER		   NOT NULL,
);

CREATE TABLE DiskHasArtist (
	ArtistID INT NOT NULL,
	DiskID   INT NOT NULL,
	PRIMARY KEY(ArtistID, DiskID),
	FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID),
	FOREIGN KEY(DiskID) REFERENCES Disks(DiskID),
);


CREATE TABLE DiskHasBorrower (
  TransactionID     INT            PRIMARY KEY IDENTITY,
  BorrowerID		INT            NOT NULL REFERENCES Borrower (BorrowerID),
  DiskID			INT            NOT NULL REFERENCES Disks (DiskID),
  BorrowedDate      DATETIME       NOT NULL,
  ReturnedDate      DATETIME       NULL,
);
