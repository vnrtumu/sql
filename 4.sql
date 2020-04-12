-- Display the category, product name and its price which is most expensive in respective category

-- SELECT 
--     p_nm, p_cat 
-- FROM 
--     `product` 
-- WHERE 
--     p_price = (
--         SELECT 
--             MAX(p_price) 
--         FROM 
--             product 
--         WHERE 
--             p_cat = 'STATIONARY' ) 
-- AND
--     p_cat = 'STATIONARY'

-- UNION

-- SELECT 
--     p_nm, p_cat 
-- FROM 
--     `product` 
-- WHERE 
--     p_price = (
--         SELECT 
--             MAX(p_price) 
--         FROM 
--             product 
--         WHERE 
--             p_cat = 'FURNITURE' )ss
-- AND 
--     p_cat = 'FURNITURE'


SELECT 
    p_nm, p_cat, p_price 
FROM 
    product p1
WHERE 
    p_price = ( 
        SELECT 
            MAX(p_price) 
        FROM 
            product p2 
        WHERE 
            p1.p_cat = p2.p_cat )