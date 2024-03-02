-- To import csv-files via MySQL Workbench: 
-- Go to Connection settings -> Advanced -> Others 
-- Add a line "OPT_LOCAL_INFILE=1"
-- or
-- Run a command:
-- SET GLOBAL local_infile = TRUE;

USE chemdoor;

START TRANSACTION;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/Employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/TemperatureConditions.csv'
INTO TABLE temperatureconditions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/CustomerScale.csv'
INTO TABLE customerscale
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/Categories.csv'
INTO TABLE categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/Customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/Suppliers.csv'
INTO TABLE suppliers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/Products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/Shippers.csv'
INTO TABLE shippers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/velod/Git/ChemdoorDB/tables/OrderDetails.csv'
INTO TABLE orderdetails
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

COMMIT;