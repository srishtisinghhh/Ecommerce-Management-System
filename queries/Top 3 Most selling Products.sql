WITH ProductSales AS (
    SELECT 
        vp.VendorID,
        vp.ProductID,
        SUM(op.Quantity) AS OrderedQuantity,
        ROW_NUMBER() OVER (ORDER BY SUM(op.Quantity) DESC) AS rn
    FROM OrderedProduct op
    JOIN VendorProduct vp 
        ON op.VendorProductID = vp.VendorProductID
    GROUP BY vp.VendorID, vp.ProductID
)

SELECT 
    v.Name AS VendorName,
    p.ProductName,
    ps.OrderedQuantity
FROM ProductSales ps
JOIN Vendor v 
    ON v.VendorID = ps.VendorID
JOIN Product p 
    ON p.ProductID = ps.ProductID
WHERE ps.rn <= 3;
