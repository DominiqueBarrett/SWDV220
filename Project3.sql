--Project 3--
USE DiskInventory;
------------------A------------------
--Document each SQL statement – what it is supposed to do.--
------------------B------------------
--If structure changes are needed to the tables from previous projects, 
--include the code at the beginning of your script & document it/them.

--I had the phoneNumber as an Int but decided I wanted it as a Varchar instead.--
ALTER TABLE Borrower
ALTER COLUMN PhoneNumber VARCHAR(100);

--These all needed to be done before messing with the bigger tables--
--I needed to add/insert the Genres--
INSERT INTO Genre
    (GenreDescription)
VALUES
    ('Action'),
    ('Romance'),
    ('Fantasy'),
    ('Musical'),
    ('Soundtracks'),
    ('Hip Hop'),
    ('Other');

--I needed to add/insert the DiskTypes--
INSERT INTO DiskType
    (DiskTypeDescription)
VALUES
    ('CD'),
    ('DVD');
--I needed to add/insert the DiskStatus
INSERT INTO DiskStatus
    (DiskStatusDescription)
VALUES
    ('IsAvailable'),
    ('IsBorrowed');

--I needed to add/insert the ArtistTypes
INSERT INTO ArtistType
    (DiskTypeDescription)
VALUES
    ('Group Artist'),
    ('Solo Artist');
------------------C. Disk Table:------------------
--1. Insert at least 20 rows of data into the table--
USE DiskInventory;

INSERT INTO Disks --Did not include DiskID
    (DiskTypeID,
    DiskStatusID, GenreID, DiskName, ReleasedDate)
VALUES
    (1, 1, 6, 'Kamikaze', '2018-01-11'),
	(1, 1, 5, 'The Greatest Showman: Original Motion Picture Soundtrack', '2017-10-11'),
    (1, 1, 6, 'Maybe Im Dreaming', '2008-05-18'),
	(1, 1, 6, 'Back To Black', '2006-09-08'),
    (1, 1, 6, 'Reputation', '2017-02-19'),
	(2, 1, 1, 'Avengers: Age of Ultron', '2015-05-24'),
    (2, 1, 1, 'Avengers: Infinity War', '2018-07-29'),
	(2, 2, 1, 'Guardians Of The Galaxy', '2014-09-27'),
    (2, 2, 1, 'Black Panther', '2018-05-10'),
	(2, 2, 2, 'Crazy Rich Asians', '2018-03-15'),
    (1, 2, 7, 'Smoke and Mirrors - Imagine Dragons', '2015-01-16'),
	(2, 1, 3, 'Beauty And The Beast', '2017-08-30'),
    (1, 1, 7, 'Night Visions', '2012-07-13'),
	(2, 1, 4, 'La La Land', '2016-02-03'),
    (1, 1, 5, 'Guardians Of The Galaxy: Awesome Mix Vol.1', '2014-08-16'),
	(2, 1, 4, 'Moulin Rouge!', '2001-04-18'),
    (1, 2, 5, 'Phantom Of The Opera Original Soundtrack', '1986-06-25'),
	(2, 2, 3, 'Alice in Wonderland', '2010-10-10'),
    (1, 2, 7, 'Dangerous Woman', '2016-04-30'),
	(2, 1, 4, 'Phantom Of The Opera The Movie', '1986-06-25');

--2. Update only 1 row using a where clause--
	Update Disks
	SET GenreID = 4
	WHERE DiskID = 18;
------------------D. Borrower Table:------------------
--1. Insert at least 20 rows of data into the table--
USE DiskInventory;

INSERT INTO Borrower
    (FirstName,
    LastName, PhoneNumber)
VALUES
    ('Bill', 'Smith', '645-357-8456'),
    ('Jordan', 'Barrett', '896-435-1546'),
    ('Phill', 'Strupt', '976-532-1546'),
	('Amanda', 'Carlson', '875-154-2365'),
	('Rachel', 'Greene', '987-651-5435'),
	('Forrest', 'Cashmark', '396-586-5147'),
	('Daniel', 'Hope', '978-652-0124'),
	('Josh', 'Fieldstad', '103-465-8751'),
	('James', 'Cooper', '280-200-3165'),
	('Dave', 'Hopkins', '968-356-8541'),
	('Curtis', 'Blaire', '362-519-4877'),
	('Corinth', 'Foutz', '772-153-6488'),
	('Lydia', 'Jones', '788-561-1511'),
	('Zach', 'Bennet', '978-653-2002'),
	('Alex', 'Benz', '988-889-6541'),
	('Nichole', 'Hooper', '199-954-6574'),
	('Chance', 'McGummery', '987-654-3210'),
	('Jack', 'Daniels', '123-045-6789'),
	('Eleanor', 'Jobe', '951-753-1379'),
	('Mark', 'Lung', '159-753-3574')
	

	--2. Update only 1 row using a where clause--
	--Update Curtis to have a different Phone Number
	Update Borrower
	SET PhoneNumber = '111-111-1111'
	WHERE BorrowerID = 11;
------------------E. Artist Table:------------------
--1. Insert at least 20 rows of data into the table--
USE DiskInventory;

INSERT INTO Artist
    (ArtistTypeID
	,FirstName
	,LastName
	,GroupName)
VALUES
    (1, '', '', 'Imagine Dragons'),
	(2, 'Adam', 'Young', 'Owl City'),
    (2, 'Toby', 'Mac', ''),
	(2, 'Ariana', 'Grande', ''),
	(2, 'Taylor', 'Swift', ''),
	(1, 'Eminem', '', 'Aftermath'),
	(1, 'Alan', 'Menken', 'Walt Disney'),
	(1, 'John', 'Debney', '20th Century Fox'),
	(1, '', '', 'Journey'),
	(2, 'Amy', 'Winehouse', ''),
	(1, '', '', 'Hollywood Records'),
	(2, 'Andrew', 'Webber', ''),
	(2, 'Hannah', 'Montana', ''),
	(2, 'Beyonce', 'Knowles', ''),
	(2, 'Lady', 'Gaga', ''),
	(2, 'Lindsey', 'Sterling', ''),
	(2, 'Demi', 'Lovato', ''),
	(2, 'katy', 'Perry', ''),
	(2, 'Gwen', 'Stefani', ''),
	(2, 'Britney', 'Spears', ''),
	(1, 'Joseph', 'Trapanese', '20th Century Fox'),
	(1, 'Danny', 'Elfman', 'Walt Disney'),
	(1, 'Brian', 'Tyler', 'Walt Disney'),
	(1, 'Alan', 'Silvestri', 'Walt Disney'),
	(1, 'Tyler', 'Bates', 'Walt Disney'),
	(1, 'Ledwig', 'Goransson', 'Walt Disney'),
	(1, 'Justin', 'Hurwitz', 'Walt Disney')
------------------F. DiskHasBorrower Table:------------------
--1. Insert at least 20 rows of data into the table--
USE DiskInventory;

INSERT INTO DiskHasBorrower
    (BorrowerID, DiskID, BorrowedDate, ReturnedDate)
VALUES
    (1, 1, '2018-04-16', '2018-04-18'),
    (2, 2, '2018-03-16', '2018-03-21'),
	(3, 3, '2018-02-16', '2018-02-24'),
	(4, 4, '2018-01-16', '2018-01-27'),
	(5, 5, '2018-08-16', '2018-08-19'),
	(1, 20, '2018-07-16', '2018-07-20'),
	(5, 7, '2018-06-16', '2018-06-17'),
	(1, 8, '2018-05-16', NULL),
	(6, 9, '2018-04-16', NULL),
	(7, 10, '2018-03-16', NULL),
	(8, 11, '2018-02-16', NULL),
	(9, 12, '2018-01-16', '2018-01-30'),
	(10, 13, '2018-08-16', '2018-08-31'),
	--at least 1 disk (14) has been borrowed by the same borrower 2 different times--
	(12, 14, '2018-07-16', '2018-07-25'),
	(12, 14, '2018-08-25', '2018-08-29'),
	(13, 15, '2018-06-16', '2018-06-26'),
	(12, 16, '2018-05-16', '2018-05-21'),
	(15, 17, '2018-04-16', NULL),
	(16, 18, '2018-03-16', NULL),
	(17, 19, '2018-02-16', NULL),
	(12, 20, '2018-01-16', '2018-01-18')

--2. Insert at least 2 different disks--
	-- There are many--
--3. Insert at least 2 different borrowers--
	--There are many--
--4. At least 1 disk has been borrowed by the same borrower 2 different times--
	--DiskId of 14--
--5. At least 1 disk in the disk table does not have a related row here
	-- this would be (6)--
--6. At least 1 disk must have at least 2 different rows here--
	--Disk 20--
--7.At least 1 borrower in the borrower table does not have a related row here--
	--Quite a few don't (BorrowerIDs of 11, 14, 18, 19, 20, etc)
--8. At least 1 borrower must have at least 2 different rows here--
	--BorrowerIDs of 1, 5, and 12


------------------G. DiskHasArtist Table:------------------
--1. Insert at least 20 rows of data into the table--
USE DiskInventory;

INSERT INTO DiskHasArtist
    (ArtistID, DiskID)
VALUES
	(6, 1),
	(8, 2),
	(21, 2),
	(2, 3),
	(10 ,4),
	(5, 5),
	(22, 6),
	(23, 6),
	(24, 7),
	(25, 8),
	(26, 9),
	(23, 10),
	(1, 11),
	(7, 12),
	(1, 13),
	(27, 14),
	(8, 15),
	(27, 16),
	(12, 17),
	(7, 18),
	(8, 18),
	(6, 18),
	(4, 19),
	(12, 20);

--2. At least 1 disk must have at least 2 different artist rows here--
	--Disk 6 has artist 22 and 23--
--3. At least 1 artist must have at least 2 different disk rows here--
	--Artist 8 has disk 2 and 18--
--4.Correct variation of disk & artist data similar to DiskHasBorrower--
	---------
--Creat a query to list the disks that are on loan and have not been returned
--Sample OutPut:
--Borrower_id   Disk_id  	   Borrowed_date		   Return_date 
--    9		      2  	  2012-04-02 00:00:00.000	   NULL
--    9		      4  	  2012-04-02 00:00:00.000	   NULL

--This selects from the DiskHasBorrower table in order to find any and all CD/DVD's that have yet to be returned.-- 
SELECT BorrowerID, DiskID, BorrowedDate, ReturnedDate
FROM DiskHasBorrower 
WHERE ReturnedDate IS NUll;


--This is if you actually want to see who borrowed what using the actual names of the disks and the Borrowers--
SELECT DiskHasBorrower.BorrowerID, Borrower.FirstName, DiskHasBorrower.DiskID, Disks.DiskName, BorrowedDate, ReturnedDate

FROM DiskHasBorrower 
JOIN Borrower
    ON DiskHasBorrower.BorrowerID = Borrower.BorrowerID
	JOIN Disks
    ON DiskHasBorrower.DiskID = Disks.DiskID
WHERE ReturnedDate IS NUll;
