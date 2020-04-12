-- Manjunath:
-- Display the rooms which are reserved for today and tomorrow

-- join the tables hotel, room, reservation, guestes

SELECT 
    hotel.name as Hotel_Name, room.room_no, reservation.startDate as reservation_date
FROM  
    `reservation` 
INNER JOIN 
    room ON room.id = reservation.room_id 
INNER JOIN   
    hotel ON room.hotel_id = hotel.id 
INNER JOIN  
    users ON reservation.user_id = users.id 
WHERE  
    reservation.startDate = CURRENT_DATE() OR reservation.startDate = CURRENT_DATE() + 1