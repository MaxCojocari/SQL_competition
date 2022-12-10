CREATE DATABASE Hospital
GO
USE Hospital
GO
BEGIN TRY
	IF OBJECT_ID('Doctors') IS NULL
		BEGIN
			CREATE TABLE Doctors(
			DoctorID INT NOT NULL,
			FirstName VARCHAR(50),
			LastName VARCHAR(50),
			Speciality VARCHAR(50),
			CONSTRAINT PK_Doctor PRIMARY KEY (DoctorID)
			)
			PRINT 'table Doctors is created successfuly'
		END
	ELSE PRINT 'table Doctors exists already'
END TRY
BEGIN CATCH
	PRINT 'creation of table Doctors is failed'
END CATCH
GO
BEGIN TRY
	IF OBJECT_ID('Patients') IS NULL
		BEGIN
			CREATE TABLE Patients(
			PatientID INT NOT NULL,
			FirstName VARCHAR(50),
			LastName VARCHAR(50),
			PhoneNumber VARCHAR(50),
			DoctorID INT NOT NULL,
			PRIMARY KEY (PatientID),
			FOREIGN KEY (DoctorID)
			REFERENCES Doctors (DoctorID)
			)
			PRINT 'table Patients is created successfuly'
		END
	ELSE PRINT 'table Patients exists already'
END TRY
BEGIN CATCH
	PRINT 'creation of table Patients is failed'
END CATCH
GO
BEGIN TRY
	IF OBJECT_ID('DroppedPatients') IS NULL
		BEGIN
			CREATE TABLE DroppedPatients(
			PatientID INT NOT NULL,
			DateDropped DATE,
			ReasonsDropped VARCHAR(30),
			PRIMARY KEY (PatientID),
			FOREIGN KEY (PatientID) REFERENCES Patients (PatientID) 
			)
			PRINT 'table DroppedPatients is created successfuly'
		END
	ELSE PRINT 'table DroppedPatients exists already'
END TRY
BEGIN CATCH
	PRINT 'creation of table DroppedPatients is failed'
END CATCH
GO
BEGIN TRY
	IF OBJECT_ID('Groups') IS NULL
		BEGIN
			CREATE TABLE Groups(
			GroupID INT NOT NULL,
			GroupDescription VARCHAR(50),
			PRIMARY KEY (GroupID)
			)
			PRINT 'table Group is created successfuly'
		END
	ELSE PRINT 'table Group exists already'
END TRY
BEGIN CATCH
	PRINT 'creation of table Group is failed'
END CATCH
GO
BEGIN TRY
	IF OBJECT_ID('PatientGroupsAssist') IS NULL
		BEGIN
			CREATE TABLE PatientGroupsAssist(
			PatientID INT NOT NULL,
			GroupID INT NOT NULL,
			PRIMARY KEY (PatientID),
			FOREIGN KEY (GroupID) REFERENCES Groups (GroupID),
			FOREIGN KEY (PatientID) REFERENCES Patients (PatientID)
			)
			PRINT 'table Group is created successfuly'
		END
	ELSE PRINT 'table Group exists already'
END TRY
BEGIN CATCH
	PRINT 'creation of table Group is failed'
END CATCH
 