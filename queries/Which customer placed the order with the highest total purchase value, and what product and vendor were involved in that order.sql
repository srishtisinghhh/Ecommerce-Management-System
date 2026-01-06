WITH OrderTotals AS (
    SELECT
        c.firstname,
        c.lastname,
        c.contact,
        v.name AS vendor_name,
        p.productname,
        op.quantity AS qty,
        (op.quantity * vp.price) AS total,
        ROW_NUMBER() OVER (ORDER BY (op.quantity * vp.price) DESC) AS rn
    FROM orderedproduct op
    JOIN vendorproduct vp 
        ON vp.vendorproductid = op.vendorproductid
    JOIN vendor v 
        ON v.vendorid = vp.vendorid
    JOIN product p 
        ON p.productid = vp.productid
    JOIN orders o 
        ON o.orderid = op.orderid
    JOIN customer c 
        ON c.customerid = o.customerid
)

SELECT
    firstname,
    lastname,
    contact,
    vendor_name,
    productname,
    qty,
    total
FROM OrderTotals
WHERE rn = 1;
