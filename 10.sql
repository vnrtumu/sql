-- Diplay the common products which are bought by both Citi Bank and HSBC Bank customers

(SELECT 
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
    customer.cust_nm = 'CITI Bank' )

intersect  

(SELECT 
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
    customer.cust_nm = 'HSBC Bank' )
