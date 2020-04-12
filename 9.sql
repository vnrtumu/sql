-- Display the product which costs between the price of Pencil and the price of Pen Box

SELECT 
    p_nm 
FROM 
    `product` 
WHERE
    p_price > (SELECT 
                    MAX(p_price) 
                FROM 
                    `product` 
                WHERE 
                p_nm = 'PENCIL' ) 
AND 
    p_price < (SELECT 
                    MAX(p_price) 
                FROM 
                    `product` 
                WHERE 
                    p_nm = 'PEN BOX' )