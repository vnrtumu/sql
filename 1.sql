-- Display the product which costs more than the product named Chair

SELECT  
    p_nm 
FROM 
    `product` 
WHERE 
    p_price > (SELECT 
                    p_price 
                FROM 
                    `product` 
                WHERE 
                p_nm = "CHAIR")

-- two scans