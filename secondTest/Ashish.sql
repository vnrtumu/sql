-- Ashish:
-- Display the guest name who visited in the month of JAN 2020

-- Join the tables 1. Guest, 2.reservation
-- and apply the filter in the month of jan 2020


SELECT 
    users.name AS Guest_Name, reservation.startDate AS Visited_At 
FROM 
    `reservation` 
INNER JOIN 
    users ON users.id = reservation.user_id 
WHERE 
    month(reservation.startDate) = 1 
AND 
    year(reservation.startDate) = 2020
