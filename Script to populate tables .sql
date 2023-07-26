CREATE TABLE [dbo].[AssociatedPersons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonType] [varchar](30) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [char](1) NULL,
	[Email] [varchar](100) NULL  
) ON [PRIMARY]

CREATE UNIQUE NONCLUSTERED INDEX idx_tbl_AssociatedPersons_Email
ON AssociatedPersons(Email)
WHERE Email IS NOT NULL
GO

CREATE TABLE [dbo].[AssociatedPlaces](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Country] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[Street] [varchar](30) NULL,
	[TelephoneTo] [varchar](30) NULL,
	[NIP] [varchar](30) NULL,
	[PlaceType] [varchar](50) NULL,
	[PostCode] [varchar](30) NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[DocumentHeaders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentDate] [datetime] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[AssociatedPersonID] [int] NULL,
	[OriginalPlaceID] [int] NOT NULL,
	[DestinationPlaceID] [int] NULL,
	[DocumentType] [varchar](50) NOT NULL,
	[TotalAmount] [decimal](32, 2) NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[DocumentLines](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentHeaderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[AppliedDiscount] [decimal](32, 2) NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssociatedPersonID] [int] NOT NULL,
	[DepartmentID] [int] NULL,
	[ManagerID] [int] NULL,
	[Position] [varchar](50) NOT NULL,
	[ContractStart] [date] NOT NULL,
	[ContractEnd] [date] NULL,
	[Salary] [decimal](12, 2) NOT NULL,
	[AssociatedPlaceID] [int] NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[EmployeesAudit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ValueChangedInEmployeesTable] [varchar](1000) NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubcategoryID] [int] NOT NULL,
	[PurchasePrice] [decimal](7, 2) NOT NULL,
	[SellPrice] [decimal](7, 2) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ManufacturerID] [int] NOT NULL
) ON [PRIMARY]

INSERT INTO AssociatedPlaces (Name, Country, City, Street, TelephoneTo, NIP, PlaceType, PostCode)
VALUES ('KrakowBonarka', 'Poland', 'Krakow', 'Kamienskiego 11', '+48345876234', '967845673', 'Shop', '30-644'),
		('WroclawDominikanska','Poland','Wroclaw','Plac Dominikanski 3', '+48978456372', '786777898' ,'Shop', '50-195'),
		('GdanskMadison','Poland', 'Gdansk', 'Rajska 10','+48567456785', '245395748', 'Shop', '80-850'),
		('RzeszowMillenium','Poland', 'Rzeszow', 'Aleja Majora Waclawa Kopisto 1', '+48456385674', '453857634', 'Shop', '35-315'),
		('TychyGeminiPark','Poland', 'Tychy', 'Towarowa 2c', '+48564783452', '789654765', 'Shop', '43-100'),
		('PoznanMalta','Poland', 'Poznan', 'Maltanska 1' ,'+48546738726', '476230876', 'Shop', '61-131'),
		('KielceEcho','Poland', 'Kielce', 'Swietokrzyska 20', '+48345234675', '768564356', 'Shop', '25-406'),
		('BialystokJurowiecka','Poland', 'Bialystok', 'Jurowiecka 1' ,'+48765876456', '098564534', 'Shop', '15-101'),
		('LodzPort','Poland', 'Lodz', 'Pabianicka 245', '+48785168452', '345637675', 'Shop', '93-457'),
		('KrosnoGaleria','Poland', 'Krosno', 'Legionow 17', '+48785126547', '458256352', 'Shop', '38-400')
		

INSERT INTO AssociatedPersons ( PersonType, Name, Surname, DateOfBirth, Gender, Email)
						VALUES ('Employee', 'Anna', 'Fitz', '1990-01-11', 'F',null),
						('Employee', 'Laetitia', 'Evans', '2001-03-12', 'F',null),
						('Employee', 'Tina', 'Thompson', '1995-08-22', 'F',null),
						('Employee', 'Terry', 'Pratchet', '1986-02-01', 'M',null),
						('Employee', 'Dwayn', 'Rock', '2000-06-13', 'M',null),
						('Employee', 'Jimmy', 'Carter', '1990-04-04', 'M',null),
						('Employee', 'Will', 'Willis', '1992-09-18', 'M',null),
						('Employee', 'Tom', 'Biden', '1990-01-02', 'M',null),
						('Employee', 'Anna', 'Warren', '1990-06-28', 'F',null),
						('Employee', 'Anna', 'Evans', '1992-03-28', 'F',null),
						('Employee', 'Tina', 'Marks', '1991-07-28', 'F',null),
						('Employee', 'John', 'Snow', '1987-11-30', 'M',null),
						('Employee', 'Tim', 'Burton', '1991-02-23', 'M',null),
						('Employee', 'Harry', 'Doe', '1990-04-04', 'M',null),
						('Employee', 'Will', 'Noname', '1992-09-16', 'M','will.noname@coffevestore.com'),
						('Employee', ' Dwayn', 'Carter', '1990-01-07', 'M','dwayn.carter@coffevestore.com'),
						('Employee', 'Dwayn', 'Hill', '2000-09-13', 'M','dwayn.hill@coffevestore.com'),
						('Employee', 'Jimmy', 'Joe', '1990-04-05', 'M','jimmy.doe@coffevestore.com'),
						('Employee', 'Will', 'Backer', '1992-11-18', 'M', 'will.backer@coffevestore.com'),
						('Employee', 'Nora', 'Biden', '1990-01-02', 'F', 'nora.biden@coffevestore.com'),
						('Customer', 'Peter', 'Peterson', '1980-03-16', 'M',null),
						('Customer', 'John', 'Doe', '1987-11-30', 'M',null),
						('Customer', 'Tim', 'Terry', '1991-02-23', 'M',null),
						('Customer', 'Harry', 'Doe', '2001-10-01', 'M',null),
						('Customer', 'Anna', 'Bellucci', '1990-06-28', 'F',null),
						('Customer', 'Margot', 'Dumas', '1987-06-28', 'F',null),
						('Customer', 'Johnny', 'Deep', '1991-02-23', 'M',null),
						('Customer', 'Morgan', 'Freeman', '2001-10-01', 'M',null),
						('Customer', 'Anna', 'Nowak', '1990-06-28', 'F',null),
						('Customer', 'Wictoria', 'Beckham', '1987-06-28', 'F',null),
						('Customer', 'Edmund', 'Dowson', '1987-12-30', 'M',null),
						('Customer', 'Joanna', 'Chmielewska', '1971-03-23', 'F',null),
						('Customer', 'Evelyn', 'Carter', '2001-10-01', 'F',null),
						('Customer', 'Anna', 'Lenox', '1999-09-20', 'F',null)
INSERT INTO AssociatedPersons ( PersonType, Name, Surname, DateOfBirth, Gender, Email)
			VALUES ('Employee', 'Anna', 'Sally', '1990-01-12', 'F','anna.sally@coffevestore.com')
INSERT INTO AssociatedPersons ( PersonType, Name, Surname, DateOfBirth, Gender, Email)
			VALUES ('Employee', 'Tom', 'Warren', '1990-01-11', 'F','tom.warren@coffevestore.com')
INSERT INTO AssociatedPersons ( PersonType, Name, Surname, DateOfBirth, Gender, Email)
			VALUES ('Employee', 'Luize', 'Lebeuf', '1986-08-11', 'F','luize.lebeuf@coffevestore.com')
						
	INSERT INTO Employees (AssociatedPersonID, DepartmentID, ManagerID, Position, ContractStart, ContractEnd, Salary, AssociatedPlaceID)
				VALUES (1, 1, 21, 'manager', '2023-01-01', null, 12000, 1),
						(2, 1, 1, 'salesperson', '2023-01-01', null, 6000, 1),
						(3, 1, 21, 'manager', '2023-01-02', null, 13000, 2),
						(4, 1, 3, 'salesperson', '2023-01-03', null, 6100, 2),
						(5, 1, 21, 'manager', '2023-01-01', null, 12500, 3),
						(6, 1, 5, 'salesperson', '2023-01-05', null, 5900, 3),
						(7, 1, 21, 'manager', '2023-01-02', null, 12700, 4),
						(8, 1, 7, 'salesperson', '2023-01-02', null, 7400, 4),
						(9, 1, 21, 'manager', '2023-01-01', null, 14000, 5),
						(10, 1, 9, 'salesperson', '2023-01-06', null, 5000, 5),
						(11, 1, 21, 'manager', '2023-01-01', null, 11000, 6),
						(12, 1, 11, 'salesperson', '2023-01-02', null, 7100, 6),
						(13, 1, 21, 'manager', '2023-01-01', null, 12100, 7),
						(14, 1, 13, 'salesperson', '2023-01-05', null, 6900, 7),
						(15, 1, 21, 'manager', '2023-01-03', null, 15000, 8),
						(16, 1, 15, 'salesperson', '2023-01-03', null, 8000, 8),
						(17, 1, 21, 'manager', '2023-01-01', null, 12900, 9),
						(18, 1, 17, 'salesperson', '2023-01-01', null, 7100, 9),
						(19, 1, 21, 'manager', '2023-01-02', null, 11800, 10),
						(20, 1, 19, 'salesperson', '2023-01-02', null, 12000, 10)
INSERT INTO Employees (AssociatedPersonID, DepartmentID, ManagerID, Position, ContractStart, ContractEnd, Salary, AssociatedPlaceID)
		VALUES (35, null, null, 'CEO', '2022-01-01', null, 55000, null)
INSERT INTO Employees (AssociatedPersonID, DepartmentID, ManagerID, Position, ContractStart, ContractEnd, Salary, AssociatedPlaceID)
		VALUES (36, 1, 2, 'sales intern', '2023-07-01', null, 3000, 1)
INSERT INTO Employees (AssociatedPersonID, DepartmentID, ManagerID, Position, ContractStart, ContractEnd, Salary, AssociatedPlaceID)
		VALUES (37, 3, 4, 'sales intern', '2023-07-01', null, 3000, 2)	

--select * from Employees
--select * from AssociatedPersons

INSERT INTO DocumentHeaders(DocumentDate, EmployeeID, AssociatedPersonID, OriginalPlaceID, DocumentType)
VALUES	(GETDATE() , 1 ,  21 , 1 , 'Receipt'),
		(GETDATE() , 2 ,  21 , 1 , 'Receipt'),
		(GETDATE() , 3 ,  22 , 2 , 'Receipt'),
		(GETDATE() , 4 ,  22 , 2 , 'Receipt'),
		(GETDATE() , 5 ,  23 , 3 , 'Receipt'),
		(GETDATE() , 6 ,  23 , 3 , 'Receipt'),
		(GETDATE() , 7 ,  24 , 4 , 'Receipt'),
		(GETDATE() , 8 ,  24 , 4 , 'Receipt'),
		(GETDATE() , 9 ,  25 , 5 , 'Receipt'),
		(GETDATE() , 10 ,  25 , 5 , 'Receipt'),
		(GETDATE() , 11 ,  26 , 6 , 'Receipt'),
		(GETDATE() , 12 ,  26 , 6 , 'Receipt'),
		(GETDATE() , 13 ,  27 , 7 , 'Receipt'),
		(GETDATE() , 14 ,  27 , 7 , 'Receipt'),
		(GETDATE() , 15 ,  28 , 8 , 'Receipt'),
		(GETDATE() , 16 ,  28 , 8 , 'Receipt'),
		(GETDATE() , 17 ,  29 , 9 , 'Receipt'),
		(GETDATE() , 18 ,  29 , 9 , 'Receipt'),
		(GETDATE() , 19 ,  30 , 10 , 'Receipt'),
		(GETDATE() , 20 ,  30 , 10 , 'Receipt')		

INSERT INTO DocumentLines(DocumentHeaderID, ProductID, Quantity)
VALUES (1,1,4),
		(2,2,1),
		(3,1,1),
		(4,3,1),
		(5,4,1),
		(6,4,1),
		(7,5,1),
		(8,5,1),
		(9,5,1),
		(10,6,2),
		(11,7,1),
		(12,8,1),
		(13,9,1),
		(14,10,2),
		(15,10,1),
		(16,2,1),
		(17,2,1),
		(18,4,3),
		(19,8,1),
		(20,7,1)

--INSERT INTO DocumentHeaders(DocumentDate, EmployeeID, AssociatedPersonID, OriginalPlaceID, DocumentType)
--VALUES	(GETDATE() , 1 ,  31 , 1 , 'Receipt'),
--		(GETDATE() , 2 ,  32 , 1 , 'Receipt'),
--		(GETDATE() , 3 ,  33 , 2 , 'Receipt'),
--		(GETDATE() , 4 ,  34 , 2 , 'Receipt'),
--		(GETDATE() , 5 ,  35 , 3 , 'Receipt'),
--		(GETDATE() , 6 ,  36 , 3 , 'Receipt'),
--		(GETDATE() , 7 ,  37 , 4 , 'Receipt'),
--		(GETDATE() , 8 ,  38 , 4 , 'Receipt'),
--		(GETDATE() , 9 ,  39 , 5 , 'Receipt'),
--		(GETDATE() , 10 ,  41 , 5 , 'Receipt'),
--		(GETDATE() , 11 ,  42 , 6 , 'Receipt'),
--		(GETDATE() , 12 ,  43 , 6 , 'Receipt'),
--		(GETDATE() , 13 ,  44 , 7 , 'Receipt'),
--		(GETDATE() , 14 ,  45 , 7 , 'Receipt'),
--		(GETDATE() , 15 ,  46 , 8 , 'Receipt'),
--		(GETDATE() , 16 ,  47 , 8 , 'Receipt'),
--		(GETDATE() , 17 ,  48 , 9 , 'Receipt'),
--		(GETDATE() , 18 ,  49 , 9 , 'Receipt'),
--		(GETDATE() , 19 ,  50 , 10 , 'Receipt'),
--		(GETDATE() , 20 ,  51 , 10 , 'Receipt')		

--INSERT INTO DocumentLines(DocumentHeaderID, ProductID, Quantity)
--VALUES (1,1,3),
--		(2,2,1),
--		(3,1,3),
--		(4,3,1),
--		(5,4,1),
--		(6,4,2),
--		(7,5,1),
--		(8,5,1),
--		(9,5,1),
--		(10,6,2),
--		(11,7,2),
--		(12,8,1),
--		(13,9,1),
--		(14,10,2),
--		(15,10,4),
--		(16,2,1),
--		(17,2,1),
--		(18,4,3),
--		(19,8,1),
--		(20,7,

INSERT INTO Products(SubcategoryID,	PurchasePrice, SellPrice, ProductName, ManufacturerID)
VALUES (1,11.34, 15.45, 'Charger', 1),
		(1,12.78, 16.78,'Charger B', 1),
		(2,1400, 1700, 'Zombiephone', 1),
		(2,3000,4000, 'Superphone', 2),
		(2,3500,4700, 'Superphone X', 2),
		(2,8500,14700, 'Superphone Next Generation', 2),
		(3,300,400, 'Headphones', 2),
		(3,34.23,44.12, 'Headphones Zombie', 1),
		(3,380,500, 'Headphones Light', 3),
        (3,1280,2000, 'Headphones Xtreme', 3)
