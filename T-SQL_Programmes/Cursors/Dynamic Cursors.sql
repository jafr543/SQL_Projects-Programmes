DECLARE dynamic_cursor CURSOR DYNAMIC FOR
SELECT EmployeeID, Name, DepartmentID FROM Employees

OPEN dynamic_cursor

DECLARE @Name VARCHAR(50), @ID INT, @DepartmentID INT;

FETCH NEXT FROM dynamic_cursor INTO @ID, @Name, @DepartmentID;

WHILE @@FETCH_STATUS = 0
BEGIN 
      PRINT 'Name: ' + @Name + ', EmployeeID: ' + 
	  CAST(@ID AS VARCHAR) + ', DepartmentID: ' + CAST(@DepartmentID AS VARCHAR);
	  FETCH NEXT FROM dynamic_cursor INTO @ID, @Name, @DepartmentID;
END

CLOSE dynamic_cursor;
DEALLOCATE dynamic_cursor;
