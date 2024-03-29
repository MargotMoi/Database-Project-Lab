----STORED PROCEDURE----------------------------------------------------------------------
--"As a person from HR responsible for creating employees emails list (task from my manager),
-- I wold like to have them quickly combined from employee Name, Surname and our shop name like: 
--          name.surname@coffevestore.com
--"As a person from HR responsible for adding information about employees  to AssociatedPersons 
--table I would like not to be able to add record with duplicate email value and see apropriate error message
--that is clear for non-technical person. I could then come back to this guy/girl to agree on his/her new 
--email personally before adding this information to the database"

SELECT * FROM AssociatedPersons
WHERE PersonType = 'Employee'

--a simple procedure to create list of employees emials only
CREATE PROCEDURE spCreateEmailForEmployeeOnly
AS  
BEGIN  
 SELECT LOWER(ap.Name) + '.'+ LOWER(ap.Surname) + '@coffevestore.com' AS Email  
 FROM AssociatedPersons ap 
 WHERE PersonType = 'Employee'
END


exec spCreateEmailForEmployeeOnly

--a procedure to add an employee record and show "user friendly" information about an error
--regarding violation of unique value in email column (to show try catch block)

CREATE PROC spInsertEmployees 
 @PersonType varchar(50),
 @Name varchar(50),
 @Surname varchar(50),
 @DateOfBirth date,
 @Gender char(1),
 @Email varchar(50)  
 AS  
 BEGIN 
	BEGIN TRY
		BEGIN TRAN  
		  INSERT INTO AssociatedPersons(PersonType, Name, Surname, DateOfBirth, Gender, Email)  
		  VALUES( @PersonType, @Name, @Surname, @DateOfBirth, @Gender, @Email)  
		COMMIT TRAN  
	END TRY
	BEGIN CATCH
		PRINT 'There was an error. You cannot input data with duplicate email address!'
		PRINT Error_Number()
		PRINT Error_Message()
		ROLLBACK TRAN
	END CATCH
 END  


--SELECT * FROM AssociatedPersons WHERE PersonType = 'Employee' 


 exec spInsertEmployees 
 @PersonType = 'Employee',
 @Name = 'Nora',
 @Surname = 'Biden',
 @DateOfBirth = '1990-01-02',
 @Gender = 'F',
 @Email = 'nora.biden@coffevestore.com'

--SELECT * FROM AssociatedPersons
--WHERE PersonType = 'Employee' AND Name ='Sophia' AND Surname = 'Warren'



