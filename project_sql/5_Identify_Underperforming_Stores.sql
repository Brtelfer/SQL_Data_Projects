-- File: underperforming_stores.sql
WITH store_sales AS (
    SELECT 
        st.storekey,
        st.countryname,
        ROUND(SUM(s.netprice)::numeric, 2) AS TotalRevenue
    FROM 
        sales s
    JOIN 
        store st ON s.storekey = st.storekey
    GROUP BY 
        st.storekey, st.countryname
)
SELECT 
    storekey,
    countryname,
    TotalRevenue,
    (SELECT ROUND(AVG(TotalRevenue), 2) FROM store_sales) AS AvgRevenue
FROM 
    store_sales
WHERE 
    TotalRevenue < (SELECT AVG(TotalRevenue) FROM store_sales)
ORDER BY 
    TotalRevenue DESC;