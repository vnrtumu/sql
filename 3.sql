-- Display the products which are falling in Furniture category and cost more than the expensive product from stationary category

SELECT 
    p_nm 
FROM 
    `product` 
WHERE 
    p_cat = 'FURNITURE' 
AND 
    p_price > (SELECT 
                    MAX(p_price) 
                FROM 
                    `product` 
                WHERE 
                    p_cat = 'STATIONARY' )