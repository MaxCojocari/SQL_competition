USE AdventureWorks2019
--database if needed
GO
BEGIN TRY
	IF OBJECT_ID('name of the table you want to create') IS NULL
		BEGIN
			CREATE TABLE Person (
				field1 INT NOT NULL,
				field2 VARCHAR(200) NOT NULL,
				field3 VARCHAR(30),
				field4 VARCHAR(30),
				field5 VARCHAR(3),
				CONSTRAINT PK_Person PRIMARY KEY (field1)
			)
			PRINT 'object successfuly created'
		END
	ELSE PRINT 'object already exists'
END TRY

BEGIN CATCH
	PRINT 'creation of the object is failed'
END CATCH
GO 
IF OBJECT_ID('table name') IS NOT NULL DROP TABLE --nameTable
--Shift+Alt+narrow up and write in several lines at the same time
DROP TABLE IF EXISTS field1
DROP TABLE IF EXISTS field2
DROP TABLE IF EXISTS field3
DROP TABLE IF EXISTS field4
DROP TABLE IF EXISTS field5

--Put cursor on the first line, push Shift and use narrows to choose the number of lines, the press Alt and move your lines
--Alt + X execute the code
--Trigger
GO
CREATE OR ALTER TRIGGER trig
ON tableX
FOR INSERT,UPDATE,DELETE
AS
IF EXISTS (SELECT 0 FROM deleted)
	BEGIN
		IF EXISTS (SELECT 0 FROM inserted)
			BEGIN
				--the code for operations for UPDATE case
			END
		ELSE
			BEGIN
				--the code for DELETED case
			END
	END
ELSE 
	BEGIN
		--operations for INSERTED case
	END
GO
--UNION operation
SELECT 
	field1,
	field2,
	field3
FROM Table1
UNION ALL
	SELECT 
		field1,
		field2,
		field3
	FROM Table2

--DISTINCT
SELECT COUNT(DISTINCT field1) FROM Table1 WHERE --condition 

