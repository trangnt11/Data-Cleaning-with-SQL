In this project, I clean airbnb data with SQL. airbnb is a short-term rental app that connects hosts and renters

1. Table description
  airbnb_last_review: 
    - listing_id: house numbers on the airbnb platform
    - host_name: the name of the house
    - last_review: the last day which the rental house had a review
  airbnb_price:
    - listing_id
    - price: price of the house 
    - nbhood_full: address of the house
  airbnb_room_type: 
    - listing_id
    - description: description of the room
    - room_type: type of rooms in houses: entire or private
    
2. Data cleaning
  2.1. Standardize Date Format in last_review column
  2.2. Breaking out nbhood_full into individual Columns (borough, adress)
  2.3. Edit price column
  2.4. Join 3 tables to 1 new table
  2.5. Check null value: host_name and description have null values but don't affect much to analysis results
  2.6. Check duplicate values: no duplicate listing_id
