-- Venkat:
--------------------------------------------------------------------
-- Display the hotel which has more number of reservations last month
-- Expecting one hotel as the output.


-- Steps: join the tables 1. Hotel, 2. Reservation, 3. Room
-- 	   filter the data with last month
-- 	   apply the having class 	

SELECT 
    hotel.name as Hotel_Name, count(hotel.id) as Max_visit 
FROM 
    `reservation` 
INNER JOIN 
    room ON room.id = reservation.room_id 
INNER JOIN 
    hotel ON room.hotel_id = hotel.id 
WHERE 
    month(startDate) = 3 AND month(endDate) = 3 
GROUP BY 
    hotel.id 
HAVING 
    Max_visit = (SELECT 
                    MAX(total_visit) 
                FROM (
                        SELECT 
                            count(hotel.id) as total_visit 
                        FROM 
                            `reservation` 
                        INNER JOIN 
                            room ON room.id = reservation.room_id 
                        INNER JOIN 
                            hotel ON room.hotel_id = hotel.id 
                        WHERE 
                            month(startDate) = 3 AND month(endDate) = 3 
                        GROUP BY 
                            hotel.id)TEMPORARY
                        
                    )