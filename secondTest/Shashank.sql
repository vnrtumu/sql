-- Shashank:
-- Display the point of interest associated with all the hotels.
-- Hotel name and POI name/ desc in the output.

-- join the tables 1. Hotel, 2.POI, 3.hoteltopoi

SELECT 
    hotel.name as Hotel_name, pointofinterest.name as PointOfInterest 
FROM   
    `hoteltopoi` 
INNER JOIN 
    hotel ON hoteltopoi.hotel_id = hotel.id 
INNER JOIN  
    pointofinterest ON hoteltopoi.poi_id = pointofinterest.id
ORDER BY 
    hotel.name 
DESC