-- Display customer name, product name, sold_date, Qty, product price and sales amount

SELECT 
    p_nm, cust_nm,sales_date, p_qty, p_price, s_amount
FROM 
    `Sales_dtl` 
INNER JOIN 
    product 
ON 
    Sales_dtl.p_id = product.p_id 
LEFT JOIN 
    Sales_hdr 
ON 
    Sales_dtl.s_h_id = Sales_hdr.s_h_id 
LEFT JOIN 
    customer 
ON 
    Sales_hdr.cust_id = customer.cust_id 