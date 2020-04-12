-- Jay deep:
-- Display common point of interest between Shangarila and ITC

-- Join the tables 1. Hotel, 2. PointOfInterest, 3.hoteltoPOI
    
SELECT 
    *
FROM 
    `hoteltopoi` 
INNER JOIN 
    hotel ON hoteltopoi.hotel_id = hotel.id 
INNER JOIN 
    pointofinterest ON hoteltopoi.poi_id = pointofinterest.id 
GROUP BY 
    hotel.id 
