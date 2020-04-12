-- Manasa:
-- Display the hotel which got most point of interest

-- Join the tables 1. Hotel, 2. PointOfInterest, 3.hoteltoPOI

SELECT 
    hotel.name AS Hotel_Name, count(hotel.id) as HotelCount 
FROM 
    `hoteltopoi` 
INNER JOIN 
    hotel ON hoteltopoi.hotel_id = hotel.id 
INNER JOIN 
    pointofinterest ON hoteltopoi.poi_id = pointofinterest.id 
GROUP BY 
    hotel.id 
HAVING 
    HotelCount =  (SELECT 
                        MAX(HotelCount) 
                    FROM (
                        SELECT 
                            count(hotel.id) as HotelCount 
                        FROM `hoteltopoi` 
                        INNER JOIN 
                            hotel ON hoteltopoi.hotel_id = hotel.id 
                        INNER JOIN 
                            pointofinterest ON hoteltopoi.poi_id = pointofinterest.id 
                        GROUP BY 
                            hotel.id )TEMPORARY)