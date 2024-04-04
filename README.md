# ChemdoorDB

This repository contains T-SQL commands for MySQL to set up database structure and import its data from enclosed CSV files.

Some details and features:
 - Data was generated using AI-powered tools (Chat GPT, Mockaroo).
 - Scheme contains 10 tables in total.
 - TemperaturesConditions table is a conformed dimension table, used by Shippers and Products tables.
 - Customers table implemented as a slowly changing dimension table (Type 2).
 - Aside from standard MySQL indexes, it has B-Tree indexed City column in tables Customers and Suppliers.
    
![Schema](https://github.com/dimkanividimka/ChemdoorDB/blob/main/Schema.PNG)
