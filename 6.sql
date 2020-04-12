-- Dsplay customers who have more than 4 sales details transactions in the month of Jan 2020

SELECT  
    cust_nm, COUNT(cust_nm) AS sales_Details
FROM 
    `Sales_dtl` 
INNER JOIN  
    Sales_hdr 
ON 
    Sales_dtl.s_h_id = Sales_hdr.s_h_id 
INNER JOIN 
    customer 
ON 
    Sales_hdr.cust_id = customer.cust_id 
WHERE 
    month(Sales_hdr.sales_date) = 1
AND 
    Year(Sales_hdr.sales_date) = 2020
GROUP BY
    customer.cust_nm 
Having
    COUNT(cust_nm)>4