-- Display Customer name, number of sale records and number of sale detail records 

SELECT  
    cust_nm, COUNT(cust_nm) AS sale_details, COUNT(DISTINCT Sales_hdr.s_h_id) AS sale_header 
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
GROUP BY
    customer.cust_nm


