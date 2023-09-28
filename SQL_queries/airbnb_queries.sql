SELECT * FROM airbnb_data
LIMIT 10

-- airbnbs with the least amount of availability to determin poularity
-- airbnbs with 0 were not counted due to this dataset not expanding on if they are accepting bookings or not
-- for that reason this metric is not the most reliable 
SELECT id,neighbourhood,host_name,room_type,price,availability_365 
FROM airbnb_data
WHERE availability_365 <= 50 AND availability_365 > 0
ORDER BY availability_365 ASC;

-- Most expensive neighborhoods in deceding order
SELECT neighbourhood, ROUND(AVG(price),2) as average_price
FROM airbnb_data
GROUP BY neighbourhood
ORDER BY average_price DESC;

-- Most popoular neighborhood to start an airbnb in with average price
SELECT neighbourhood,COUNT(neighbourhood) as count, ROUND(AVG(price),2) as average_price
FROM airbnb_data
GROUP BY neighbourhood
ORDER BY count DESC;

-- most popular room type breakdown
-- because we can't determine what is actually a home or apartment those values cannot be seperated.
SELECT room_type, COUNT(room_type) as count
FROM airbnb_data
GROUP BY room_type
ORDER BY count DESC;

-- total number of airbnb's according to this data. there are no null rows in this dataset.
SELECT COUNT(*) as total_SF_airbnbs
FROM airbnb_data;



