SELECT 
    v.Name,
    v.Contact,
    v.Email,
    COUNT(r.Rating) AS total_bad_ratings
FROM Vendor v
JOIN VendorProduct vp 
    ON v.VendorID = vp.VendorID
JOIN OrderedProduct op 
    ON vp.VendorProductID = op.VendorProductID
JOIN Review r 
    ON r.OrderedProductID = op.OrderedProductID
WHERE r.Rating < 3
GROUP BY v.VendorID, v.Name, v.Contact, v.Email
ORDER BY total_bad_ratings DESC
LIMIT 3;
