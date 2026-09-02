use C21_DB1;

DECLARE @DepartmentID INT; -- Variable for department ID
DECLARE @StartDate DATE; -- Variable for start date
DECLARE @EndDate DATE; -- Variable for end date
DECLARE @TotalEmployees INT; -- Variable to hold the total number of employees
DECLARE @DepartmentName VARCHAR(50); -- Variable for department name


SET @DepartmentID = 3; -- Assign a specific department ID
SET @StartDate = '2023-01-01'; -- Set start date for the report
SET @EndDate = '2023-12-31'; -- Set end date for the report

SELECT @DepartmentName = Name FROM Departments WHERE DepartmentID = @DepartmentID;


SELECT @TotalEmployees = COUNT(*) 
FROM Employees 
WHERE DepartmentID = @DepartmentID 
AND HireDate BETWEEN @StartDate AND @EndDate;

PRINT 'Department Report';
PRINT 'Department Name: ' + @DepartmentName;
PRINT 'Reporting Period: ' + CAST(@StartDate AS VARCHAR) + ' to ' + CAST(@EndDate AS VARCHAR);
PRINT 'Total Employees Hired in ' + CAST(YEAR(@StartDate) AS VARCHAR) + ': ' + CAST(@TotalEmployees AS VARCHAR);
