SELECT 
    SUM(op.Quantity * vp.Price) AS "Total Sale"
FROM Orders o
JOIN OrderedProduct op 
    ON o.OrderID = op.OrderID
JOIN VendorProduct vp 
    ON vp.VendorProductID = op.VendorProductID
WHERE o.OrderDate BETWEEN '2013-07-26' AND '2014-02-21'

