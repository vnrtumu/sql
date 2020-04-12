-- Find the different Products which are sold to CITI Bank in the month of Jan 2020

SELECT 
    p_nm, cust_nm 
FROM 
    `Sales_dtl` 
INNER JOIN 
    product 
ON 
    Sales_dtl.p_id = product.p_id 
INNER JOIN 
    Sales_hdr 
ON 
    Sales_dtl.s_h_id = Sales_hdr.s_h_id 
INNER JOIN 
    customer 
ON 
    Sales_hdr.cust_id = customer.cust_id 
WHERE 
    customer.cust_nm = 'CITI Bank' 
AND 
	month(Sales_hdr.sales_date) = 1
AND 
    Year(Sales_hdr.sales_date) = 2020

-- using joins