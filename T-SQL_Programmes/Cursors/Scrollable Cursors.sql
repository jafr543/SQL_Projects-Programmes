


DECLARE scroll_cursor CURSOR SCROLL FOR
SELECT EmployeeID, Name, DepartmentID FROM Employees

OPEN scroll_cursor

DECLARE @Name VARCHAR(50), @ID INT, @DepartmentID INT;

FETCH NEXT FROM scroll_cursor INTO @ID, @Name, @DepartmentID;

WHILE @@FETCH_STATUS = 0
BEGIN 
      PRINT 'Name: ' + @Name + ', EmployeeID: ' + 
	  CAST(@ID AS VARCHAR) + ', DepartmentID: ' + CAST(@DepartmentID AS VARCHAR);

		-- Fetch the previous row of data from the cursor (moving backward).
		-- This demonstrates the ability of the scrollable cursor to move in reverse.
		--FETCH PRIOR FROM scroll_cursor INTO @ID, @Name, @DepartmentID;

	  FETCH NEXT FROM scroll_cursor INTO @ID, @Name, @DepartmentID;
END

CLOSE scroll_cursor;
DEALLOCATE scroll_cursor;
