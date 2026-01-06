WITH RankedOrders AS (
    SELECT 
        o.AddressID,
        ROW_NUMBER() OVER (ORDER BY o.AddressID DESC) AS rn
    FROM Orders o
)
SELECT 
    c.FirstName,
    c.LastName,
    a.HouseNo,
    a.Street,
    a.Area,
    ct.CityName
FROM RankedOrders ro
JOIN Address a ON a.AddressID = ro.AddressID
JOIN Customer c ON c.CustomerID = a.CustomerID
JOIN ZipCode zc ON zc.ZipCodeID = a.ZipCodeID
JOIN City ct ON ct.CityID = zc.CityID
WHERE ro.rn = 1;
