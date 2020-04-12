-- 1. Display the product which costs more than the product named Chair

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


-- 2. Find the different Products which are sold to CITI Bank in the month of Jan 2020

SELECT 
    p_nm, cust_nm 
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
WHERE 
    customer.cust_nm = 'CITI Bank' 
AND 
	month(Sales_hdr.sales_date) = 1
AND 
    Year(Sales_hdr.sales_date) = 2020

    
-- 3. Display the products which are falling in Furniture category and cost more than the expensive product from stationary category

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


-- 4. Display the category, product name and its price which is most expensive in respective category

SELECT 
    p_nm, p_cat 
FROM 
    `product` 
WHERE 
    p_price = (
        SELECT 
            MAX(p_price) 
        FROM 
            product 
        WHERE 
            p_cat = 'STATIONARY' ) 
AND
    p_cat = 'STATIONARY'

UNION

SELECT 
    p_nm, p_cat 
FROM 
    `product` 
WHERE 
    p_price = (
        SELECT 
            MAX(p_price) 
        FROM 
            product 
        WHERE 
            p_cat = 'FURNITURE' )
AND 
    p_cat = 'FURNITURE'



-- 5. Display customer name, product name, sold_date, Qty, product price and sales amount

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


-- 6. Dsplay customers who have more than 4 sales details transactions in the month of Jan 2020

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


-- 7. Display Customer name, number of sale records and number of sale detail records 

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


-- 8. Display the product name which generated most sale amount in the month of Jan 2020

SELECT 
    p_nm, cust_nm , MAX(s_amount) 
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
WHERE 
    month(Sales_hdr.sales_date) = 1
AND 
    Year(Sales_hdr.sales_date) = 2020


-- 9. Display the product which costs between the price of Pencil and the price of Pen Box

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

-- 10. Diplay the common products which are bought by both Citi Bank and HSBC Bank customers

SELECT 
    p_nm, cust_nm 
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
WHERE 
    customer.cust_nm = 'CITI Bank' 
AND 
    customer.cust_nm = 'HSBC Bank'