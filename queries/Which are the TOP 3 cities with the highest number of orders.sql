SELECT 
    c.CityName,
    COUNT(o.OrderID) AS "no of Orders"
FROM Orders o
JOIN Address a 
    ON a.AddressID = o.AddressID
JOIN ZipCode z 
    ON z.ZipCodeID = a.ZipCodeID
JOIN City c 
    ON c.CityID = z.CityID
GROUP BY c.CityName
ORDER BY "no of Orders" DESC
LIMIT 3;
