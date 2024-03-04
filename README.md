# ChemdoorDB

This repository contains T-SQL commands for MySQL to set up database structure and import its data from enclosed CSV files.

Some details and features:
    - Scheme contain 10 tables in total;
    - TemperaturesConditions table is a conformed dimension table, used by Shippers and Products tables;
    - Customers table implemented as a slowly changing dimension table (Type 2);
    - Aside of standard MySQL indexes, it has B-Tree indexed City column in tables Customers and Suppliers.
![Schema](https://github.com/dimkanividimka/ChemdoorDB/assets/124629748/7f2a67e1-cebd-447e-8f92-c732492f4594)