-- Ananth:
-- Display in Guest name who is available in hotel Ashoka today.

-- Steps:  join the tables 1. Reservation, 2. Room, 3. Hotel , 4. Guest
-- 		Now Filter the reservations done in today and Hotel is Ashoka

SELECT
    hotel.name as Hotel_Name, users.name as Guest_name
FROM 
    `reservation` 
INNER JOIN 
    room ON room.id = reservation.room_id 
INNER JOIN 
    hotel ON room.hotel_id = hotel.id 
INNER JOIN 
    users ON reservation.user_id = users.id 
WHERE 
    reservation.startDate <= now() 
AND 
    reservation.endDate >= now() 
AND 
    hotel.name = "Ashoka"