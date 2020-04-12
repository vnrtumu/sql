-- Display the product name which generated most sale amount in the month of Jan 2020

-- SELECT 
--     p_nm, MAX(s_amount) as Max_sale_amount
-- FROM 
--     `Sales_dtl` 
-- INNER JOIN 
--     product 
-- ON 
--     Sales_dtl.p_id = product.p_id 
-- LEFT JOIN 
--     Sales_hdr 
-- ON 
--     Sales_dtl.s_h_id = Sales_hdr.s_h_id 
-- WHERE 
--     month(Sales_hdr.sales_date) = 1
-- AND 
--     Year(Sales_hdr.sales_date) = 2020


SELECT 
    p_nm, SUM(s_amount) as Max_sale_amount 
FROM 
    `Sales_dtl` 
INNER JOIN 
    product ON Sales_dtl.p_id = product.p_id 
INNER JOIN 
    Sales_hdr ON Sales_dtl.s_h_id = Sales_hdr.s_h_id 
WHERE 
    month(Sales_hdr.sales_date) = 1 AND Year(Sales_hdr.sales_date) = 2020 
GROUP BY 
    product.p_nm
HAVING 
    Max_sale_amount = (
        SELECT 
            SUM(s_amount) as maximun  
        FROM 
            Sales_dtl  
        GROUP BY 
            p_id 
        ORDER BY 
            maximun 
        DESC LIMIT 1)