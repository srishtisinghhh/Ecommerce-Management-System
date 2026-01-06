SELECT COUNT(o.OrderID)
FROM Orders o
JOIN Address a ON o.AddressID = a.AddressID
JOIN ZipCode z ON a.ZipCodeID = z.ZipCodeID
JOIN City c ON z.CityID = c.CityID
WHERE c.CityName = 'Mumbai';
