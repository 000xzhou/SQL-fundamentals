-- 1. Join the two tables so that every column and record appears, regardless of if there is not an owner_id . 
SELECT * FROM owners
JOIN vehicles
ON vehicles.owner_id = owners.id;
-- 2. Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. The first_name should be ordered in ascending order. 
SELECT owners.first_name, owners.last_name, COUNT(vehicles.id) 
FROM owners
JOIN vehicles ON vehicles.owner_id = owners.id
GROUP BY owners.first_name, owners.last_name
ORDER BY COUNT(vehicles.id) ASC;
-- 3. Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. 
SELECT owners.first_name, owners.last_name,  CAST(AVG(vehicles.price) as int) AS average_price, COUNT(vehicles.id) 
FROM owners
JOIN vehicles ON vehicles.owner_id = owners.id
GROUP BY owners.first_name, owners.last_name
HAVING AVG(vehicles.price) >10000
AND COUNT(vehicles.id) > 1
ORDER BY COUNT(vehicles.id) DESC;


