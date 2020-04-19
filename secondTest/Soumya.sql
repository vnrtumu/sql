-- Soumya:
-- Display the guest name and count of hotels visited.
-- Number of Guests -- is the number of rows what you are expecting

-- find the count of hotels that venkat visited
SELECT 
* 
FROM reservation INNER JOIN room ON room.id = reservation.room_id INNER JOIN users ON reservation.user_id = users.id INNER JOIN hotel ON room.hotel_id = hotel.id WHERE users.name = "ramana"



-- Final solution
SELECT 
    users.name as Guest_name, COUNT(hotel.id) AS No_of_hotes, hotel.name as Hotel_Name 
FROM 
    reservation 
INNER JOIN 
    room ON room.id = reservation.room_id 
INNER JOIN 
    users ON reservation.user_id = users.id 
INNER JOIN 
    hotel ON room.hotel_id = hotel.id 
GROUP BY 
    users.id