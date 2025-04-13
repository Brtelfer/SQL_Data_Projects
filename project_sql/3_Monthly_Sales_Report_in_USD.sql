-- File: monthly_sales_usd.sql
SELECT 
    TO_CHAR(s.orderdate, 'YYYY-MM') AS YearMonth,
    ROUND(SUM(s.netprice * ce.exchange)::numeric, 2) AS TotalSalesUSD -- Cast to numeric
FROM 
    sales s
JOIN 
    currencyexchange ce ON s.orderdate = ce.date 
    AND s.currencycode = ce.fromcurrency
    AND ce.tocurrency = 'USD'
GROUP BY 
    YearMonth
ORDER BY 
    YearMonth;