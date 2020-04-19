-- Rajesh
-- Display Hotel Name, and number 1 guest (who visited the most) in each hotel.


SELECT * FROM reservation INNER JOIN room ON room.id = reservation.room_id INNER JOIN users ON reservation.user_id = users.id INNER JOIN hotel ON room.hotel_id = hotel.id  WHERE hotel.id = 1 and 



SELECT * FROM reservation INNER JOIN room ON room.id = reservation.room_id INNER JOIN users ON reservation.user_id = users.id INNER JOIN hotel ON room.hotel_id = hotel.id   WHERE  hotel.id = 1 AND startDate = (SELECT MIN(startDate)
FROM reservation)