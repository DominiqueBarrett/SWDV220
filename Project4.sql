--Using your disk_inventory database, write the SQL statements as directed below.--
--Save the code & documentation for each of the following queries into ONE sql document.--
--Post the sql document in your online repo & post the link in BB.--
USE DiskInventory;
--1. Document each SQL statement – what it is supposed to do. Include a modification log.--
--2. If structure changes are needed to the tables from Project 2, include the code at the beginning of your script & document.--
ALTER TABLE Borrower
ALTER COLUMN PhoneNumber VARCHAR(100);

--I added a few names to some of the groups
UPDATE Artist
SET FirstName = 'Marshall', 
    LastName = 'Mathers',
	GroupName = 'Eminem'
WHERE ArtistID = 6;


UPDATE Artist
SET FirstName = 'Dan', 
    LastName = 'Reynolds'
WHERE ArtistID = 1;

UPDATE Artist
SET FirstName = 'Arnel', 
    LastName = 'Pineda'
WHERE ArtistID = 9;
--3. Show the disks in your database and any associated Individual artists only. Sort by Artist Last Name, First Name & Disk Name.
--Sample Output:
--Disk 	Name	Release Date	Artist First Name	Artist Last Name
--Home		            2004-11-19	Chris		Daughtry
--Jagged Little Pill	1995-04-09	Alanis		Morrisette
--Blizzard of Oz	    1981-09-28	Ozzy		Osborne
--No More Tears     	1991-11-11	Ozzy		Osborne
--Red           		2011-9-24	Taylor		Swift

--I joined to the DiskHasArtist in order to join to the Artist table which has the first and last names I needed--
--added a where statement so only the people who identify as a solo artist will be shown--
SELECT DiskName, ReleasedDate, A.FirstName, A.LastName
FROM Disks AS D
JOIN DiskHasArtist AS DA
ON D.DiskID = DA.DiskID
JOIN Artist AS A
ON DA.ArtistID = A.ArtistID
Where A.ArtistTypeID = 2
ORDER BY LastName, FirstName, DiskName;

--4.	Create a view called View_Individual_Artist that shows the artists’ names and not group names.--
--Include the artist id in the view definition but do not display the id in your output.
--Sample Output:
--FirstName	LastName
--Ozzy		Osbourne
--Willie	Nelson
--Taylor	Swift
--Alanis	Morrisette
--Patsy		Cline
--When I added the data into the database I accidentally added all the null names as '' instead of leaving them null.--
--So in order to not return blank info I added a where clause that finds the ones--
--where the first name and last name is not an empty string (I only have one at this point that doesn't have first and last name which is Hollywood Records--
DROP VIEW ViewIndividualArtist
--the drop view is so I can recreate it if I make changes--
go
CREATE VIEW ViewIndividualArtist
AS
--as the instructions stated I am only adding the first, last name, and artist ID to the view--
SELECT FirstName, LastName, ArtistID
FROM Artist
Go
Select FirstName, LastName
from ViewIndividualArtist
--This makes sure that non of the groups that I do not have a first name and last name for don't show up as a blank cell--
Where FirstName NOT LIKE '' AND LastName NOT LIKE ''--
ORDER BY FirstName, LastName;

--5. Show the disks in your database and any associated Group artists only. Use the View_Individual_Artist view. Sort by Group Name & Disk Name.
--Sample Output:
--Disk Name				                        Release Date	Group Name	
--Blender					                    1993-04-09	    Collective Soul
--Hints, Allegations, and Things Left Unsaid	1995-12-12	    Collective Soul
--Paranoic					                    1970-05-01	    Black Sabbath	
--Hotel California				                1985-07-09	    The Eagles	
--One of These Nights			                1977-04-09	    The Eagles
--The Long Run				                    1984-03-03	    The Eagles

--Walt Disney shows up alot because I have alot of different people who are a part of the bigger group of Walt Disney--
SELECT DiskName, ReleasedDate, AR.GroupName
FROM Disks AS D
LEFT JOIN DiskHasArtist AS DA
ON D.DiskID = DA.DiskID
LEFT JOIN ViewIndividualArtist AS A
ON A.ArtistID = DA.ArtistID
LEFT JOIN Artist AS AR
ON A.ArtistID = AR.ArtistID
--This Where statement gets rid of any of the individual artist that would create Blank Columns--
Where AR.GroupName NOT LIKE ''
ORDER BY AR.GroupName, DiskName;

--6.	Show which disks have been borrowed and who borrowed them. Sort by Borrower’s Last Name.
--Sample Output:
--First	 Last	  Disk Name
--Jiminy Cricket  Human Clay
--Donald Duck	  Red
--Donald Duck	  Hints, Allegations, and Things Left Unsaid

--This list out all transactions and will include if a disk has been borrowed by multiple people--
SELECT FirstName, LastName, DiskName
FROM Disks
JOIN DiskHasBorrower
ON Disks.DiskID = DiskHasBorrower.DiskID
JOIN Borrower
ON DiskHasBorrower.BorrowerID = Borrower.BorrowerID
ORDER BY LastName;

--7.	In disk_id order, show the number of times each disk has been borrowed.
--Sample Output: 
--DiskId	Disk Name	        Times Borrowed
--2	        No More Tears	    4
--3	        Red		            3
--4	        Jagged Little Pill	8

SELECT D.DiskID, DiskName, COUNT(DB.BorrowedDate) AS 'Times Borrowed'
FROM Disks AS D
LEFT JOIN DiskHasBorrower AS DB
ON D.DiskID = DB.DiskID
GROUP BY D.DiskID, DiskName
ORDER BY D.DiskID
--8.	Show the disks outstanding or on-loan and who has each disk. Sort by disk name.
--Sample Output:
--Disk Name				                        Borrowed		Returned		Last Name
--Hints, Allegations, and Things Left Unsaid	2012-04-02	    NULL		    Fudd
--Jagged Little Pill				            2012-04-02 	    NULL		    Fudd
SELECT DiskName, BorrowedDate, ReturnedDate, LastName
FROM Disks AS D
JOIN DiskHasBorrower AS DB
ON D.DiskID = DB.DiskID
JOIN Borrower AS B
ON DB.BorrowerID = B.BorrowerID
WHERE ReturnedDate IS NULL
ORDER BY LastName;
--This only returns the Disks that have a returned date of NULL in order to show the ones that have not been returned--

































