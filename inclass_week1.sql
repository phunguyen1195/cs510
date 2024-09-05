/*
Introduction to Databases  
- What is a database?  
	- a database is a set of related information.
    - Source:  Learning SQL - Alan Beaulieu
- Why do we use a Database Management System (DBMS)?  
	- database management system is a software designed for data-keeping and to perform various data manipulation tasks.
	- We use DBMS because it facilitates the process of create, modify and query database as well as many other tasks for users
	- Sources:  Learning SQL - Alan Beaulieu, https://www.appdynamics.com/topics/database-management-systems, https://www.ibm.com/docs/en/zos-basic-skills?topic=zos-what-is-database-management-system, https://www.geeksforgeeks.org/introduction-of-dbms-database-management-system-set-1/
- Name the two main categories of databases. Describe the key difference between them.
	- Nonrelational database vs. relational database.
		- relational database is where data is represented as a sets of tables and included keys to like records in different tables, whereas nonrelational database uses pointers to navigate between related entities.
        - Source:  Learning SQL - Alan Beaulieu
Understanding Relational Databases  
• What is the purpose of relationships in relational databases?  
	- the purpose of relationships is to link tables together based on common fields, allowing data to be stored efficiently and retrieved in meaningful ways. Relationships help to maintain data integrity by ensuring that related data is consistent across the database. They also enable complex queries across multiple tables, making it easier to retrieve, update, or delete related data in a single operation. Such as foreign key 
	- Learning SQL - Alan Beaulieu
• What language is commonly used to work with relational database management systems?  
	- SQL
	- Source: Learning SQL - Alan Beaulieu
Common Relational Database Management Systems  
• List three popular relational database management systems.  
	- MySQL, PostgreSQL, Microsoft SQL server
	- Source: Learning SQL - Alan Beaulieu
Introduction to Non-Relational Databases  
• What is a key characteristic of non-relational databases?
	- A non-relational database is a database that does not use the tabular schema of rows and columns found in relational database systems. A key characteristic of non-relational databases is that they do not require a fixed schema, which allows for more flexibility in how data is stored and managed.
	- Sources:  Learning SQL - Alan Beaulieu, https://learn.microsoft.com/en-us/azure/architecture/data-guide/big-data/non-relational-data#:~:text=A%20non%2Drelational%20database%20is,type%20of%20data%20being%20stored.
• Can you use SQL with non-relational databases? Why or why not?  
	- Yes and No, SQL is designed to work with relational databases and nonrelational database does not possess the same properties. There are tools such as NoSQL or NewSQL that are suited better for nonrelational database. This doesn't mean the systems don't use SQL, as NoSQL databases do sometimes support some SQL commands. More accurately, “NoSQL” is sometimes defined as “not only SQL.” SQL databases are valuable in handling structured data, or data that has relationships between its variables and entities.
	- Source:  Learning SQL - Alan Beaulieu, https://www.ibm.com/think/topics/sql-vs-nosql#:~:text=It%20doesn't%20mean%20the,as%20“not%20only%20SQL.”&text=SQL%20databases%20are%20valuable%20in,between%20its%20variables%20and%20entities.

*/




-- Write a SQL command to retrieve all patients in the hospital_db database.
SELECT * FROM hospital_db.patients;

-- How would you filter the results to get only the patient with patient_id = 1?
SELECT * FROM hospital_db.patients WHERE patient_id = 1;

-- Write a query to sort the patients by their first name.
SELECT * FROM hospital_db.patients ORDER BY first_name;

-- Write a SQL command to get only the first_name and last_name columns from the patients table.
SELECT first_name, last_name FROM hospital_db.patients;

-- Applying Discounts in Queries
-- Give a clear descriptive name to the discounted amount in the results
SELECT amount_due, amount_due * 0.9 AS amount_after_discount FROM hospital_db.billing;

-- Write a query to get patients who were born after 1990-01-01.
SELECT * FROM hospital_db.patients WHERE date_of_birth > '1990-01-01';

-- How would you find the patient who was born on 1990-05-12?
SELECT * FROM hospital_db.patients WHERE date_of_birth = '1990-05-12';

-- Write a query to get patients who were born before 1990.
SELECT *, YEAR(date_of_birth) AS year_born FROM hospital_db.patients WHERE YEAR(date_of_birth) < '1990';

-- Write a query to find only patients in the state of Illinois
SELECT * FROM hospital_db.patients WHERE state = 'IL';

-- How would you find patients who are outside the state of Illinois?
SELECT * FROM hospital_db.patients WHERE state != 'IL';

-- Write a query to find patients who were born after 1990-01-01 and are from Seattle.
SELECT * FROM hospital_db.patients WHERE date_of_birth > '1990-01-01' AND city = 'Seattle';

