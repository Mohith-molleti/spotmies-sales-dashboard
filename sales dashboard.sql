CREATE DATABASE spotmies_sales;
USE spotmies_sales;

-- Create a table to store regional sales data
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    region VARCHAR(50),
    city VARCHAR(50),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    sales_amount INT,
    growth_percent DECIMAL(5,2),
    sale_date DATE
);

-- Inserting sales data for SpotMies.ai

INSERT INTO sales_data VALUES
(1,'Karnataka','Bangalore',12.9716,77.5946,150000,15.2,'2024-01-10'),
(2,'Karnataka','Bangalore',12.9716,77.5946,165000,16.1,'2024-02-10'),

(3,'Tamil Nadu','Chennai',13.0827,80.2707,120000,12.5,'2024-01-12'),
(4,'Tamil Nadu','Chennai',13.0827,80.2707,130000,13.2,'2024-02-12'),

(5,'Maharashtra','Mumbai',19.0760,72.8777,180000,18.4,'2024-01-15'),
(6,'Maharashtra','Mumbai',19.0760,72.8777,195000,19.1,'2024-02-15'),

(7,'Delhi','Delhi',28.6139,77.2090,140000,10.3,'2024-01-18'),
(8,'Delhi','Delhi',28.6139,77.2090,145000,11.0,'2024-02-18'),

(9,'Telangana','Hyderabad',17.3850,78.4867,125000,14.0,'2024-01-20'),
(10,'Telangana','Hyderabad',17.3850,78.4867,135000,14.8,'2024-02-20'),

(11,'West Bengal','Kolkata',22.5726,88.3639,95000,8.2,'2024-01-22'),
(12,'West Bengal','Kolkata',22.5726,88.3639,100000,9.0,'2024-02-22');

INSERT INTO sales_data 
(sale_id, region, city, latitude, longitude, sales_amount, growth_percent, sale_date)
VALUES
-- Uttar Pradesh (Lucknow)
(13,'Uttar Pradesh','Lucknow',26.8467,80.9462,110000,11.5,'2024-01-25'),
(14,'Uttar Pradesh','Lucknow',26.8467,80.9462,118000,12.3,'2024-02-25'),

-- Punjab (Chandigarh)
(15,'Punjab','Chandigarh',30.7333,76.7794,105000,10.8,'2024-01-26'),
(16,'Punjab','Chandigarh',30.7333,76.7794,112000,11.6,'2024-02-26'),

-- Haryana (Gurugram)
(17,'Haryana','Gurugram',28.4595,77.0266,160000,17.2,'2024-01-27'),
(18,'Haryana','Gurugram',28.4595,77.0266,170000,18.0,'2024-02-27'),

-- Rajasthan (Jaipur)
(19,'Rajasthan','Jaipur',26.9124,75.7873,98000,9.5,'2024-01-28'),
(20,'Rajasthan','Jaipur',26.9124,75.7873,104000,10.1,'2024-02-28');


-- Check if data is inserted correctly
SELECT * FROM sales_data;

-- Create a view to classify regions into performance tiers
CREATE OR REPLACE VIEW sales_performance_view AS
SELECT
    sale_id,
    region,
    city,
    latitude,
    longitude,
    sales_amount,
    growth_percent,
    sale_date,

    CASE
        WHEN sales_amount >= 150000 THEN 'High Performance'
        WHEN sales_amount BETWEEN 100000 AND 149999 THEN 'Medium Performance'
        ELSE 'Low Performance'
    END AS performance_tier
FROM sales_data;

-- Verify if performance tiers are assigned correctly
SELECT city, sales_amount, performance_tier
FROM sales_performance_view;

-- final view of data
SELECT * FROM sales_performance_view;

USE spotmies_sales;

SELECT sale_id, city, region
FROM sales_data;

UPDATE sales_data
SET region = 'Karnataka'
WHERE sale_id IN (1,2);

UPDATE sales_data
SET region = 'Tamil Nadu'
WHERE sale_id IN (3,4);

UPDATE sales_data
SET region = 'Maharashtra'
WHERE sale_id IN (5,6);

UPDATE sales_data
SET region = 'Delhi'
WHERE sale_id IN (7,8);

UPDATE sales_data
SET region = 'Telangana'
WHERE sale_id IN (9,10);

UPDATE sales_data
SET region = 'West Bengal'
WHERE sale_id IN (11,12);

SELECT sale_id, city, region
FROM sales_data;

SELECT * FROM sales_performance_view;
