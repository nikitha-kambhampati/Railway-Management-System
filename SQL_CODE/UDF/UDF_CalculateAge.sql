-- Create a user-defined function to calculate the age based on the date of birth
CREATE FUNCTION dbo.CalculateAge (@DateOfBirth DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    SET @Age = DATEDIFF(YEAR, @DateOfBirth, GETDATE());
    RETURN @Age;
END;
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Person' AND COLUMN_NAME = 'Age')
BEGIN
    ALTER TABLE Person DROP COLUMN Age;
END;
GO

ALTER TABLE Person
ADD Age AS dbo.CalculateAge(date_of_birth);
GO

SELECT PERSON_ID, first_name, last_name, date_of_birth, Age
FROM Person;
