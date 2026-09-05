
DECLARE forward_only_cursor CURSOR FORWARD_ONLY FOR
SELECT EmployeeID, Name, DepartmentID FROM Employees

OPEN forward_only_cursor

DECLARE @Name VARCHAR(50), @ID INT, @DepartmentID INT;

FETCH NEXT FROM forward_only_cursor INTO @ID, @Name, @DepartmentID;

WHILE @@FETCH_STATUS = 0
BEGIN 
      PRINT 'Name: ' + @Name + ', EmployeeID: ' + 
	  CAST(@ID AS VARCHAR) + ', DepartmentID: ' + CAST(@DepartmentID AS VARCHAR);
	  FETCH NEXT FROM forward_only_cursor INTO @ID, @Name, @DepartmentID;
END

CLOSE forward_only_cursor;
DEALLOCATE forward_only_cursor;
