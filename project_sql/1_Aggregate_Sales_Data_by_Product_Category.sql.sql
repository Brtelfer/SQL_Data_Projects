-- File: sales_by_category.sql
SELECT 
    p.categoryname AS Category,
    SUM(s.quantity) AS TotalQuantitySold,
    ROUND(SUM(s.netprice)::numeric, 2) AS TotalRevenue -- Cast to numeric
FROM 
    sales s
JOIN 
    product p ON s.productkey = p.productkey
GROUP BY 
    p.categoryname
ORDER BY 
    TotalRevenue DESC;