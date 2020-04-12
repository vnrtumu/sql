-- Pratibha:
-- Display Guest name who have reservation on 04-08-2020


--join the tables 1. Guests and 2. reservation
-- and filter the startDate with 04-08-2020

SELECT  
    users.name AS Guest_Name, reservation.startDate AS Visited_At 
FROM  
    `reservation` 
INNER JOIN  
    users ON users.id = reservation.user_id 
WHERE 
    reservation.startDate = '2020-04-08'