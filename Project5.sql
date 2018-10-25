Use DiskInventory
GO
--1. Document each SQL statement – what it is supposed to do. Stored procs & execute statements.--
--2. If structure changes are needed to the tables from the previous project, include the code at the beginning of your script & document it/them.--

--3. Create Insert, Update, and Delete stored procedures for the artist table.--

--Insert accepts all columns as input parameters except for identity fields.--
---------Insert---------
 IF OBJECT_ID('sp_InsertArtist') IS NOT NULL
   DROP PROC sp_InsertArtist
 GO

CREATE PROC sp_InsertArtist
       @ArtistTypeID  INT,
       @FirstName VARCHAR(100),
       @LastName VARCHAR(100),
       @GroupName VARCHAR(100)
AS
    INSERT Artist
    VALUES (
			@ArtistTypeID
			,@FirstName
			,@LastName
			,@GroupName
			);
GO

USE DiskInventory
GO
BEGIN TRY
    EXEC sp_InsertArtist 
         2
		 ,'Test'
		 ,'The'
		 ,'Insert';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--I was a little unclear as to what exactly this sentence meant, So I took it as you are using the primary key to update the artist's names--
--Update procedure accepts a primary key value and the artist’s names for update.--
---------Update---------
IF OBJECT_ID('sp_UpdateArtist') IS NOT NULL
  DROP PROC sp_UpdateArtist
GO

CREATE PROC sp_UpdateArtist
       @ArtistID    INT,
--       @ArtistTypeID  INT,
       @FirstName VARCHAR(100),
       @LastName VARCHAR(100),
       @GroupName VARCHAR(100)
AS
    Update Artist
    SET 
--		ArtistID = @ArtistID,
--		ArtistTypeID = @ArtistTypeID,
		FirstName = @FirstName
		,LastName = @LastName
		,GroupName = @GroupName

WHERE ArtistID = @ArtistID
GO
BEGIN TRY
    EXEC sp_UpdateArtist 
         28
		 ,'Test2'
		 ,'The2'
		 ,'Insert2';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--Delete accepts a primary key value for delete.--
---------Delete---------
 IF OBJECT_ID('sp_DeleteArtist') IS NOT NULL
   DROP PROC sp_DeleteArtist
GO

CREATE PROC sp_DeleteArtist
	@ArtistID INT
AS
DELETE Artist
WHERE ArtistID = @ArtistID;
GO

BEGIN TRY
    EXEC sp_DeleteArtist 
         28
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO
--4. Create Insert, Update, and Delete stored procedures for the borrower table.--
--Insert accepts all columns as input parameters except for identity fields.--
---------Insert---------
 IF OBJECT_ID('sp_InsertBorrower') IS NOT NULL
   DROP PROC sp_InsertBorrower
 GO

CREATE PROC sp_InsertBorrower
       @FirstName VARCHAR(100),
       @LastName VARCHAR(100),
       @PhoneNumber VARCHAR(100)
AS
    INSERT Borrower
    VALUES (
			@FirstName
			,@LastName
			,@PhoneNumber
			);
GO

USE DiskInventory
GO
BEGIN TRY
    EXEC sp_InsertBorrower 
		 'Insert'
		 ,'Borrower'
		 ,'999-999-9999';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--I was a little unclear as to what exactly this sentence meant, So I took it as you are using the primary key to update the Borrower's names--
--Update procedure accepts a primary key value and the borrower’s names for update.--
---------Update---------
IF OBJECT_ID('sp_UpdateBorrower') IS NOT NULL
  DROP PROC sp_UpdateBorrower
GO

CREATE PROC sp_UpdateBorrower
       @BorrowerID    INT,
       @FirstName VARCHAR(100),
       @LastName VARCHAR(100),
       @PhoneNumber VARCHAR(100)
AS
    Update Borrower
    SET 
		FirstName = @FirstName
		,LastName = @LastName
		,PhoneNumber = @PhoneNumber

WHERE BorrowerID = @BorrowerID
GO
BEGIN TRY
    EXEC sp_UpdateBorrower 
         21
		 ,'Borrower'
		 ,'Update'
		 ,'111-111-1111';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--Delete accepts a primary key value for delete.--
---------Delete---------
 IF OBJECT_ID('sp_DeleteBorrower') IS NOT NULL
   DROP PROC sp_DeleteBorrower
GO

CREATE PROC sp_DeleteBorrower
	@BorrowerID INT
AS
DELETE Borrower
WHERE BorrowerID = @BorrowerID;
GO

BEGIN TRY
    EXEC sp_DeleteBorrower 
         21
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO
--5. Create Insert, Update, and Delete stored procedures for the disk table.--
--Insert accepts all columns as input parameters except for identity fields.--
---------Insert---------
 IF OBJECT_ID('sp_InsertDisk') IS NOT NULL
   DROP PROC sp_InsertDisk
 GO

CREATE PROC sp_InsertDisk
       @DiskTypeID INT,
       @DiskStatusID INT,
       @GenreID INT,
       @DiskName VARCHAR(100),
       @ReleasedDate DATETIME
AS
    INSERT Disks
    VALUES (
			@DiskTypeID,
			@DiskStatusID,
			@GenreID,
			@DiskName,
			@ReleasedDate
			);
GO

USE DiskInventory
GO
BEGIN TRY
    EXEC sp_InsertDisk
		 1
		 ,2
		 ,6
		 ,'Dominiques Awsome Hip Hopness'
		 ,'2018-10-20';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--I was a little unclear as to what exactly this sentence meant, So I took it as you are using the primary key to update the Disk's names--
--Update procedure accepts a primary key value and the disk information for update.--
---------Update---------
IF OBJECT_ID('sp_UpdateDisk') IS NOT NULL
  DROP PROC sp_UpdateDisk
GO

CREATE PROC sp_UpdateDisk
    @DiskID    INT,
    @DiskTypeID INT,
    @DiskStatusID INT,
    @GenreID INT,
    @DiskName VARCHAR(100),
    @ReleasedDate DATETIME
	AS
    Update Disks
    SET 
		DiskTypeID = @DiskTypeID
		,DiskStatusID = @DiskStatusID
		,GenreID = @GenreID
		,DiskName = @DiskName
		,ReleasedDate = @ReleasedDate

WHERE DiskID = @DiskID
GO
BEGIN TRY
    EXEC sp_UpdateDisk 
         21
		 ,2
		 ,2
		 ,5
		 ,'Dominiques Sountrack of Time'
		 ,'2018-10-08';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--Delete accepts a primary key value for delete.--
---------Delete---------
 IF OBJECT_ID('sp_DeleteDisk') IS NOT NULL
   DROP PROC sp_DeleteDisk
GO

	CREATE PROC sp_DeleteDisk
		@DiskID INT
	AS
--	BEGIN TRY
		DELETE Disks
		WHERE DiskID = @DiskID;
--	END TRY
--	BEGIN CATCH
--	    PRINT 'An error occurred.';
--		PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
--		IF ERROR_NUMBER() >= 50000
--			PRINT 'This is a custom error message.';
--	END CATCH
	GO



BEGIN TRY
    EXEC sp_DeleteDisk 
         21
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--6. Script file includes all required ‘GO’ statements.--

--7. Store procedures contain error processing (try-catch).--

--8. Script file includes all execute statements needed to invoke each stored procedure.--
