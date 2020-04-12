-- Shailendra:
-- Display the amenities of the most expensive room in
-- each hotel


-- Find most expensive room 
SELECT * FROM `hotel` INNER JOIN room ON room.hotel_id = hotel.id WHERE room.price = (SELECT MAX(price) from room)

-- Now connect amenities table to this result to get single hotel

SELECT 
* 
FROM 
    `hotel` 
INNER JOIN 
    room ON room.hotel_id = hotel.id 
INNER JOIN 
    roomtoaminity ON room.id = roomtoaminity.room_id 
INNER JOIN 
    amenity ON roomtoaminity.amenity_id = amenity.id 
WHERE 
    room.price = (SELECT  
                    max(price) 
                FROM 
                room)


-- Final Answer------------------

SELECT
* 
FROM 
    hotel h1 
INNER JOIN 
    room ON room.hotel_id = h1.id 
INNER JOIN 
    roomtoaminity ON room.id = roomtoaminity.room_id 
INNER JOIN 
    amenity ON roomtoaminity.amenity_id = amenity.id 
WHERE 
    room.price = (SELECT 
                        MAX(room.price) 
                    FROM 
                        hotel h2 
                    INNER JOIN 
                        room ON room.hotel_id = h2.id 
                    WHERE h1.id = h2.id)