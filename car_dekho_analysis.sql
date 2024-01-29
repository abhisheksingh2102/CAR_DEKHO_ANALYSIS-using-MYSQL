USE cars;

-- Query 1: Read Data --
SELECT * FROM car_dekho;

-- Query 2: Total Cars - Count of Total Records --
SELECT COUNT(*) AS total_cars FROM car_dekho;

-- Query 3: Cars Available in 2023 --
SELECT COUNT(*) AS cars_in_2023 FROM car_dekho WHERE year = 2023;

-- Query 4: Cars Available in 2020, 2021, 2022 --
SELECT year, COUNT(*) AS car_count FROM car_dekho WHERE year IN (2020, 2021, 2022) GROUP BY year;

-- Query 5: Diesel Cars in 2020 --
SELECT year, COUNT(*) AS diesel_cars_in_2020 FROM car_dekho WHERE year = 2020 AND fuel = 'diesel' GROUP BY year;

-- Query 6: Petrol Cars in 2020 --
SELECT year, COUNT(*) AS petrol_cars_in_2020 FROM car_dekho WHERE year = 2020 AND fuel = 'petrol' GROUP BY year;

-- Query 7: Fuel Types (Petrol, Diesel, CNG) for All Years --
SELECT year, fuel, COUNT(*) AS car_count FROM car_dekho WHERE fuel IN ('petrol', 'diesel', 'CNG') GROUP BY year, fuel;

-- Query 8: Years with More Than 100 Cars --
SELECT year, COUNT(*) AS cars_count FROM car_dekho GROUP BY year HAVING cars_count > 100;

-- Query 9: All Cars Details Between 2015 and 2023 --
SELECT * FROM car_dekho WHERE year BETWEEN 2015 AND 2023;

-- Query 10: Top 5 Car Models with Highest Mileage --
SELECT Name, mileage FROM car_dekho ORDER BY mileage DESC LIMIT 5;

-- Query 11: Cars with the Most Seating Capacity --
SELECT Name, MAX(seats) AS max_seating_capacity
FROM car_dekho
GROUP BY Name
ORDER BY max_seating_capacity DESC
LIMIT 5;

-- Query 12: Owners with the Highest Average Selling Price --
SELECT owner, AVG(selling_price) AS avg_selling_price
FROM car_dekho
GROUP BY owner
ORDER BY avg_selling_price DESC
LIMIT 3;

-- Query 13: Car Models with the Highest Total Selling Price --
SELECT Name, SUM(selling_price) AS total_selling_price
FROM car_dekho
GROUP BY Name
ORDER BY total_selling_price DESC
LIMIT 5;

-- Query 14: Cars with Above-Average Mileage for Their Respective Manufacturing Year --
SELECT Name, year, mileage FROM car_dekho
WHERE mileage > (SELECT AVG(mileage) FROM car_dekho AS sub WHERE sub.year = car_dekho.year);

-- Query 15: Average Kilometers Driven per Year for Petrol Cars --
SELECT year, AVG(km_driven) AS avg_km_driven_petrol
FROM car_dekho
WHERE fuel = 'petrol'
GROUP BY year
ORDER BY year;
