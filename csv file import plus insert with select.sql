----INSERT from csv flat file -----
----INSERT WITH SELECT if you add data to existing table----

--1. Prepare Excel file - use appropriate functions to mix data (RANDBETWEEN, INDEX, CONCAT)
--2. Copy table with only values to another spreadshit
--3. Save required spreadshit into csv file
--4. Right click on a database, select tasks, import flat file
--5. Follow the steps in the wizzard, modify data type, mark primary key and nulls if needed
--6. If you are adding data to the existing table you need to first reapet above 5 steps just
--give the table different name during creation then use INSERT INTO with SELECT below syntax:
--INSERT INTO DestinationTableName SELECT Column1, Column2, Column3 FROM TableWithNewData 

INSERT INTO PlaceProducts 
	SELECT ProductID, Quantity, AssociatedPlaceID
FROM PlaceProductsToAdd

 
SELECT * FROM PlaceProductsToAdd

SELECT * FROM PlaceProducts

