USE Portfolio

SELECT * 
FROM airbnb_last_review

SELECT * 
FROM airbnb_price

SELECT * 
FROM airbnb_room_type

-- Standardize Date Format in last_review column

ALTER TABLE airbnb_last_review
Add last_review_converted Date;

Update airbnb_last_review
SET last_review_converted = CONVERT(Date,last_review)

ALTER TABLE airbnb_last_review
DROP COLUMN last_review

-- Breaking out nbhood_full into Individual Columns (borough, adress)

ALTER TABLE airbnb_price
ADD borough Nvarchar(255), adress Nvarchar(255)

Update airbnb_price
SET borough =SUBSTRING(nbhood_full, 1, CHARINDEX(',', nbhood_full) -1 )

Update airbnb_price
SET adress =SUBSTRING(nbhood_full, CHARINDEX(',', nbhood_full) + 1 , LEN(nbhood_full))

ALTER TABLE airbnb_price
DROP COLUMN nbhood_full

--Edit price column

Update airbnb_price 
SET price = SUBSTRING(price, 1, CHARINDEX(' ', price) -1 )

ALTER TABLE airbnb_price
ALTER COLUMN price Float

Update airbnb_room_type
SET room_type = LOWER(room_type)

--Join 3 tables to 1 new table

SELECT a.[ listing_id],a.host_name, a.last_review_converted, b.borough,b.adress,b.price, c.description, c.room_type
INTO airbnb_project
FROM airbnb_last_review a 
FULL JOIN airbnb_price b ON a.[ listing_id] = b.listing_id
FULL JOIN airbnb_room_type c ON a.[ listing_id]=c.listing_id

SELECT *
FROM airbnb_project 

-- Check null value: host_name and description have null values but don't affect much to analysis results
SELECT *
FROM airbnb_project
WHERE host_name IS NULL

SELECT *
FROM airbnb_project
WHERE description IS NULL

-- Check duplicate values: no duplicate listing_id

SELECT [ listing_id], COUNT([ listing_id])
FROM airbnb_project
GROUP BY [ listing_id]
HAVING COUNT([ listing_id]) > 1

