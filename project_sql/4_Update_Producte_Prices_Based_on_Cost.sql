UPDATE product
SET 
    price = ROUND((cost * 1.20)::numeric, 2)
WHERE 
    cost IS NOT NULL
RETURNING 
    productkey, 
    productname, 
    cost, 
    price AS new_price;