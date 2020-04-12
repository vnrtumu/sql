-- Arun:
-- Display the hotels which have got the most amenities.

-- Steps: join the tables 1. hotel, 2. room, 3. roomtoammminiy
            -- apply the having class
        

SELECT 
    hotel.name as Hotel_Name, count(hotel.id) as HotelAmminitycount 
FROM 
    hotel 
INNER JOIN 
    room ON room.hotel_id = hotel.id 
INNER JOIN 
    roomtoaminity ON room.id = roomtoaminity.room_id 
GROUP BY 
    hotel.id 
HAVING 
    HotelAmminitycount = (
        SELECT  
            MAX(HotelAmminitycount) 
        FROM (
                SELECT 
                    count(hotel.id) as HotelAmminitycount 
                FROM 
                    hotel 
                INNER JOIN 
                    room ON room.hotel_id = hotel.id 
                INNER JOIN 
                    roomtoaminity ON room.id = roomtoaminity.room_id 
                GROUP BY 
                    hotel.id)TEMPORARY)
