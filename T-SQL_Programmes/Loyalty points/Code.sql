Use C21_DB1;

DECLARE @CustomerID INT;
SELECT @CustomerID = CustomerID FROM Customers WHERE CustomerID = 1;

DECLARE @TotalAmount INT;
DECLARE @CurrentYear INT = 2023;
SELECT @TotalAmount = SUM(Purchases.Amount) FROM Purchases
WHERE CustomerID = @CustomerID AND YEAR(PurchaseDate) = @CurrentYear;

DECLARE @LoyaltyPoints INT;
SET @LoyaltyPoints = CAST(@TotalAmount / 10 AS INT);

UPDATE Customers
SET LoyaltyPoints = LoyaltyPoints + @LoyaltyPoints
WHERE CustomerID = @CustomerID;

PRINT 'Loyalty Points Update for Customer ID: ' + CAST(@CustomerID AS VARCHAR);
PRINT 'Total Amount Spent in ' + CAST(@CurrentYear AS VARCHAR) + ': $' + CAST(@TotalAmount AS VARCHAR);
PRINT 'Loyalty Points Earned: ' + CAST(@LoyaltyPoints AS VARCHAR);
