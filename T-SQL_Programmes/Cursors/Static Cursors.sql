DECLARE static_cursor CURSOR STATIC FOR
SELECT EmployeeID, Name, DepartmentID FROM Employees

OPEN static_cursor

DECLARE @Name VARCHAR(50), @ID INT, @DepartmentID INT;

FETCH NEXT FROM static_cursor INTO @ID, @Name, @DepartmentID;

WHILE @@FETCH_STATUS = 0
BEGIN 
      PRINT 'Name: ' + @Name + ', EmployeeID: ' + 
	  CAST(@ID AS VARCHAR) + ', DepartmentID: ' + CAST(@DepartmentID AS VARCHAR);
	  FETCH NEXT FROM static_cursor INTO @ID, @Name, @DepartmentID;
END

CLOSE static_cursor;
DEALLOCATE static_cursor;
