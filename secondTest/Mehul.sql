-- Mehul:
-- Display the room near by metro stations

-- Join the tables 1. Hotel, 2. PointOfInterest, 3.hoteltoPOI

SELECT 
    hotel.name AS Hotel_Name 
FROM 
    `hoteltopoi` 
INNER JOIN 
    hotel ON hoteltopoi.hotel_id = hotel.id 
INNER JOIN 
    pointofinterest ON hoteltopoi.poi_id = pointofinterest.id 
WHERE 
    pointofinterest.name LIKE '%metro%'
