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


-- Manasa:
-- Display the hotel which got most point of interest

-- Join the tables 1. Hotel, 2. PointOfInterest, 3.hoteltoPOI

SELECT 
    hotel.name AS Hotel_Name, count(hotel.id) as HotelCount 
FROM 
    `hoteltopoi` 
INNER JOIN 
    hotel ON hoteltopoi.hotel_id = hotel.id 
INNER JOIN 
    pointofinterest ON hoteltopoi.poi_id = pointofinterest.id 
GROUP BY 
    hotel.id 
HAVING 
    HotelCount =  (SELECT 
                        MAX(HotelCount) 
                    FROM (
                        SELECT 
                            count(hotel.id) as HotelCount 
                        FROM `hoteltopoi` 
                        INNER JOIN 
                            hotel ON hoteltopoi.hotel_id = hotel.id 
                        INNER JOIN 
                            pointofinterest ON hoteltopoi.poi_id = pointofinterest.id 
                        GROUP BY 
                            hotel.id )TEMPORARY)

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


-- Mehul:
-- Display the room near by metro stations

-- Join the tables 1. Hotel, 2. PointOfInterest, 3.hoteltoPOI

SELECT 
    hotel.name AS Hotel_Name 
FROM 
    `hoteltopoi` 
INNER JOIN 
    hotel ON hoteltopoi.hotel_id = hotel.id 
INNER JOIN 
    pointofinterest ON hoteltopoi.poi_id = pointofinterest.id 
WHERE 
    pointofinterest.name LIKE '%metro%'


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



-- Shailendra:
-- Display the amenities of the most expensive room in
-- each hotel
-- Find most expensive room 
-- Now connect amenities table to this result to get single hotel
-- Final Answer------------------

SELECT
    h1.name as Hotel_name, amenity.name AS Amenity, room.price AS Expensive_room
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



-- Soumya:
-- Display the guest name and count of hotels visited.
-- Number of Guests -- is the number of rows what you are expecting

-- find the count of hotels that venkat visited
-- then apply Group by
-- Final solution
SELECT 
    users.name as Guest_name, COUNT(hotel.id) AS No_of_hotes 
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